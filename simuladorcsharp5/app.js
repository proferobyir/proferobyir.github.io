let editor;

require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.45.0/min' } });

require(['vs/editor/editor.main'], function () {
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
        domReadOnly: false,
        minimap: { enabled: false }
    });

    // Fuerza el cálculo de dimensiones al cargar la página
    setTimeout(() => {
        if (editor) {
            editor.layout();
        }
    }, 300);
});

// Evento de redimensionamiento de ventana (útil para teléfonos y cambio de orientación)
window.addEventListener('resize', () => {
    if (editor) {
        editor.layout();
    }
});

// Evento para compilar y ejecutar código
document.getElementById('run-btn').addEventListener('click', async () => {
    const outputConsole = document.getElementById('console-output');
    outputConsole.textContent = "Compilando con mcs (C# 5.0 / .NET 4.5)... por favor espere...";

    const codigoUsuario = editor.getValue();

    try {
        const response = await fetch('https://emkc.org/api/v2/piston/execute', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                language: "csharp",
                version: "6.12.0",
                files: [
                    {
                        name: "Program.cs",
                        content: codigoUsuario
                    }
                ],
                compiler_options: "-langversion:5"
            })
        });

        const resultado = await response.json();

        if (resultado.compile && resultado.compile.code !== 0) {
            outputConsole.textContent = "=== ERROR DE COMPILACIÓN (C# 5) ===\n\n" + resultado.compile.output;
        } else if (resultado.run) {
            let salida = resultado.run.output;
            if (resultado.run.stderr) {
                salida += "\n\n[Advertencias / Errores de Ejecución]:\n" + resultado.run.stderr;
            }
            outputConsole.textContent = salida || "Programa ejecutado con éxito (sin salida por consola).";
        } else {
            outputConsole.textContent = "Error inesperado al conectar con el motor de compilación.";
        }
    } catch (error) {
        outputConsole.textContent = "Error de conexión/red: " + error.message;
    }
});