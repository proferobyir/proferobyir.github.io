let editor;

// Configuración de Monaco para cargar el lenguaje C#
require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.45.0/min/vs' } });

require(['vs/editor/editor.main'], function () {
    // Registrar C# si no está ya registrado (Monaco a veces lo carga por defecto, pero forzamos)
    if (!monaco.languages.getLanguages().some(lang => lang.id === 'csharp')) {
        monaco.languages.register({ id: 'csharp' });
    }

    const codigoInicial =
        `using System;
using System.Collections.Generic;
using System.Linq;

namespace InstitutoIutepi
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== Simulador C# 5.0 - Visual Studio 2012 ===");
            
            List<string> materias = new List<string> { "Programación I", "Bases de Datos", "Redes I" };
            
            var consulta = from m in materias
                           where m.Contains("Programación")
                           select m;

            foreach (var item in consulta)
            {
                Console.WriteLine(String.Format("Materia encontrada: {0}", item));
            }

            Console.WriteLine("\\nPresione cualquier tecla para finalizar...");
        }
    }
}`;

    // Inicialización de Monaco Editor
    editor = monaco.editor.create(document.getElementById('editor-container'), {
        value: codigoInicial,
        language: 'csharp',
        theme: 'vs-dark',
        automaticLayout: true,
        fontSize: 14,
        readOnly: false,
        minimap: { enabled: false }
    });

    // Fuerza el cálculo de dimensiones
    setTimeout(() => {
        if (editor) editor.layout();
    }, 300);
});

window.addEventListener('resize', () => {
    if (editor) editor.layout();
});

// Evento para compilar y ejecutar
document.getElementById('run-btn').addEventListener('click', async () => {
    const outputConsole = document.getElementById('console-output');
    outputConsole.textContent = "Compilando con Piston (buscando runtime compatible C# 5)... por favor espere...";

    const codigoUsuario = editor.getValue();

    try {
        const response = await fetch('https://emkc.org/api/v2/piston/execute', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                language: "csharp",
                version: "*", // Usa la versión disponible en el servidor
                files: [
                    {
                        name: "Program.cs",
                        content: codigoUsuario
                    }
                ]
                // IMPORTANTE: Eliminado "compiler_options": "-langversion:5" 
                // porque Piston no lo soporta y causa error 400.
            })
        });

        // Verificar si la respuesta es exitosa antes de parsear
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP ${response.status}: ${errorText}`);
        }

        const resultado = await response.json();

        // Manejo de errores de compilación
        if (resultado.compile && resultado.compile.code !== 0) {
            outputConsole.textContent = "=== ERROR DE COMPILACIÓN ===\n\n" + (resultado.compile.output || resultado.compile.stderr);
        }
        // Ejecución exitosa o con errores en tiempo de ejecución
        else if (resultado.run) {
            let salida = resultado.run.output || resultado.run.stdout;
            if (resultado.run.stderr && !salida.includes(resultado.run.stderr)) {
                salida += "\n\n[Errores de Ejecución]:\n" + resultado.run.stderr;
            }
            outputConsole.textContent = salida || "Programa ejecutado con éxito (sin salida por consola).";
        } else {
            outputConsole.textContent = "Error inesperado: La respuesta no contiene datos de ejecución.";
        }
    } catch (error) {
        outputConsole.textContent = "Error de conexión/red o API: " + error.message;
        console.error(error);
    }
});