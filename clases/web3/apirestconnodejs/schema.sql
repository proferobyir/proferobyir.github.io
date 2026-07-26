-- ============================================================================
-- SCRIPT DE BASE DE DATOS: Tienda de Computación
-- ============================================================================

-- 1. Creación e inicialización de la base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- 2. Eliminación de la tabla si ya existe (para evitar duplicados al reejecutar)
DROP TABLE IF EXISTS productos;

-- 3. Creación de la tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- 4. Inserción de 100 productos de tecnología y computación
INSERT INTO productos (nombre, precio) VALUES
-- Procesadores (1 - 10)
('Procesador Intel Core i3-12100F', 110.00),
('Procesador Intel Core i5-12400F', 175.50),
('Procesador Intel Core i5-13600K', 320.00),
('Procesador Intel Core i7-13700K', 415.00),
('Procesador Intel Core i9-13900K', 590.00),
('Procesador AMD Ryzen 3 4100', 85.00),
('Procesador AMD Ryzen 5 5600G', 140.00),
('Procesador AMD Ryzen 5 7600X', 240.00),
('Procesador AMD Ryzen 7 5700X', 210.00),
('Procesador AMD Ryzen 7 7800X3D', 450.00),

-- Memorias RAM (11 - 20)
('Memoria RAM Kingston Fury Beast 8GB DDR4 3200MHz', 28.00),
('Memoria RAM Corsair Vengeance LPX 16GB (2x8GB) DDR4', 52.00),
('Memoria RAM Teamgroup T-Force Vulcan 16GB DDR4', 45.00),
('Memoria RAM G.Skill Ripjaws V 32GB (2x16GB) DDR4', 85.00),
('Memoria RAM Kingston Fury Beast 16GB DDR5 5200MHz', 65.00),
('Memoria RAM Corsair Vengeance 32GB (2x16GB) DDR5 6000MHz', 135.00),
('Memoria RAM G.Skill Trident Z5 RGB 32GB DDR5', 160.00),
('Memoria RAM Adata XPG Spectrix D50 8GB DDR4 RGB', 34.00),
('Memoria RAM Crucial 8GB DDR4 2666MHz para Laptop', 22.00),
('Memoria RAM Corsair Vengeance 16GB DDR5 para Laptop', 58.00),

-- Almacenamiento SSD y Disco Duro (21 - 30)
('Disco SSD Kingston A400 240GB SATA3', 20.00),
('Disco SSD Crucial BX500 480GB SATA3', 35.00),
('Disco SSD M.2 NVMe Kingston NV2 500GB PCIe 4.0', 42.00),
('Disco SSD M.2 NVMe Kingston NV2 1TB PCIe 4.0', 68.00),
('Disco SSD M.2 NVMe Samsung 980 Pro 1TB PCIe 4.0', 105.00),
('Disco SSD M.2 NVMe Western Digital Black SN850X 2TB', 185.00),
('Disco Duro Interno Western Digital Blue 1TB 3.5"', 48.00),
('Disco Duro Interno Seagate Barracuda 2TB 3.5"', 62.00),
('Disco Duro Externo Toshiba Canvio Basics 1TB USB 3.0', 55.00),
('Disco Duro Externo Western Digital Elements 2TB USB 3.0', 78.00),

-- Tarjetas de Video (31 - 40)
('Tarjeta de Video NVIDIA GeForce GTX 1650 4GB', 165.00),
('Tarjeta de Video NVIDIA GeForce RTX 3050 8GB', 230.00),
('Tarjeta de Video NVIDIA GeForce RTX 4060 8GB', 315.00),
('Tarjeta de Video NVIDIA GeForce RTX 4060 Ti 8GB', 410.00),
('Tarjeta de Video NVIDIA GeForce RTX 4070 12GB', 620.00),
('Tarjeta de Video AMD Radeon RX 6600 8GB', 210.00),
('Tarjeta de Video AMD Radeon RX 6700 XT 12GB', 350.00),
('Tarjeta de Video AMD Radeon RX 7600 8GB', 270.00),
('Tarjeta de Video AMD Radeon RX 7800 XT 16GB', 540.00),
('Tarjeta de Video ASUS ROG Strix RTX 4080 16GB', 1250.00),

-- Tarjetas Madre / Motherboards (41 - 50)
('Tarjeta Madre ASUS Prime H610M-E DDR4', 88.00),
('Tarjeta Madre MSI Pro B660M-A DDR4', 130.00),
('Tarjeta Madre Gigabyte B760 Gaming X AX DDR5', 185.00),
('Tarjeta Madre ASUS ROG Strix Z790-F Gaming WiFi', 380.00),
('Tarjeta Madre Gigabyte A520M S2H AM4', 70.00),
('Tarjeta Madre MSI B550M PRO-VDH WiFi AM4', 115.00),
('Tarjeta Madre ASUS TUF Gaming B550-PLUS AM4', 150.00),
('Tarjeta Madre Gigabyte B650 AORUS Elite AX AM5', 220.00),
('Tarjeta Madre ASRock B650M Pro RS AM5', 140.00),
('Tarjeta Madre MSI MAG X670E Tomahawk WiFi AM5', 310.00),

-- Fuentes de Poder (51 - 60)
('Fuente de Poder EVGA 500 W1 500W 80 Plus White', 45.00),
('Fuente de Poder Corsair CV550 550W 80 Plus Bronze', 58.00),
('Fuente de Poder Thermaltake Smart 600W 80 Plus Gold', 68.00),
('Fuente de Poder Cooler Master MWE 650W 80 Plus Bronze', 75.00),
('Fuente de Poder Gigabyte P750GM 750W 80 Plus Gold Modular', 105.00),
('Fuente de Poder Corsair RM750x 750W 80 Plus Gold Modular', 130.00),
('Fuente de Poder ASUS TUF Gaming 850W 80 Plus Gold', 155.00),
('Fuente de Poder SeaSonic Focus GX-850 850W Gold', 165.00),
('Fuente de Poder EVGA SuperNOVA 1000 GT 1000W Gold', 210.00),
('Fuente de Poder Corsair RM1000e 1000W ATX 3.0 Gold', 195.00),

-- Gabinetes / Chasis (61 - 70)
('Gabinete ATX Yeyian Blade 2100 Cristal Templado', 48.00),
('Gabinete Micro-ATX Cooler Master MasterBox Q300L', 55.00),
('Gabinete ATX Corsair 4000D Airflow Negro', 105.00),
('Gabinete ATX NZXT H5 Flow Cristal Templado', 95.00),
('Gabinete ATX Lian Li LANCOOL II Mesh RGB', 125.00),
('Gabinete ATX Thermaltake Versa H18', 45.00),
('Gabinete Mid-Tower MSI MAG FORGE 100R RGB', 78.00),
('Gabinete ATX Asus TUF Gaming GT301 RGB', 110.00),
('Gabinete ATX Hyte Y60 Panoramic Glass', 200.00),
('Gabinete Lian Li O11 Dynamic EVO Negro', 170.00),

-- Monitores (71 - 80)
('Monitor Samsung 22" Full HD IPS 75Hz', 95.00),
('Monitor LG 24" Full HD IPS 75Hz AMD FreeSync', 120.00),
('Monitor Gamer ASUS VP249QGR 24" FHD IPS 144Hz', 165.00),
('Monitor Gamer AOC 24G2 24" FHD 144Hz 1ms', 175.00),
('Monitor Gamer Gigabyte G27F 27" FHD IPS 165Hz', 210.00),
('Monitor Gamer MSI Optix G271CQR 27" 2K QHD Curvo 165Hz', 290.00),
('Monitor Gamer Samsung Odyssey G5 27" 2K 144Hz Curvo', 270.00),
('Monitor LG Ultrawide 29" Full HD IPS 75Hz', 230.00),
('Monitor Gamer ASUS TUF VG27AQ 27" 2K IPS 165Hz', 340.00),
('Monitor Profesional Dell UltraSharp 27" 4K IPS', 520.00),

-- Teclados y Mouses (81 - 90)
('Mouse Óptico Logitech M170 Inalámbrico', 12.00),
('Mouse Gamer Redragon Griffin M607 RGB', 22.00),
('Mouse Gamer Logitech G203 Lightsync RGB', 28.00),
('Mouse Gamer Razer DeathAdder Essential', 32.00),
('Mouse Gamer Logitech G502 Hero 25K', 48.00),
('Teclado Básico Logitech K120 USB', 10.00),
('Teclado Mecánico Redragon Kumara K552 RGB', 42.00),
('Teclado Mecánico VSG Mintaka 60% RGB', 55.00),
('Teclado Mecánico Corsair K60 RGB Pro', 85.00),
('Kit Combo Teclado + Mouse Logitech MK220 Inalámbrico', 25.00),

-- Auriculares, Enfriamiento y Accesorios (91 - 100)
('Auriculares Gamer Redragon H510 Zeus2 7.1', 52.00),
('Auriculares Gamer HyperX Cloud II 7.1 Surround', 88.00),
('Auriculares Gamer Logitech G435 Lightspeed Inalámbrico', 68.00),
('Enfriamiento Líquido Cooler Master MasterLiquid ML240L', 82.00),
('Enfriamiento Líquido NZXT Kraken 240 RGB', 145.00),
('Disipador de Aire para CPU DeepCool AG400 ARGB', 32.00),
('Pasta Térmica Arctic MX-4 4g', 9.00),
('Webcam Logitech C920 Pro Full HD 1080p', 75.00),
('Silla Gamer Cougar Armor One Negra/Naranja', 210.00),
('Reguladores de Voltaje / UPS Forza NT-511 500VA', 42.00);