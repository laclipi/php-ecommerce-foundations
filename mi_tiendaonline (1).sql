-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2024 a las 17:13:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi_tiendaonline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Apellidos` varchar(80) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `Estatus` tinyint(4) NOT NULL,
  `Fecha_Alta` datetime NOT NULL,
  `Fecha_Modifica` datetime DEFAULT NULL,
  `Fecha_Baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id`, `Nombre`, `Apellidos`, `Email`, `Telefono`, `DNI`, `Estatus`, `Fecha_Alta`, `Fecha_Modifica`, `Fecha_Baja`) VALUES
(1, 'Juan', 'Perez', 'juan.perez@example.com', '123456789', '12345678A', 1, '2024-08-31 12:39:56', NULL, NULL),
(2, 'maria', 'de la o', 'exito@exito.com', '667699262', '46148875L', 1, '2024-08-31 12:55:34', NULL, NULL),
(3, 'firulais', 'firulais', 'mckrampe@gmail.com', '7238912739', '1726378', 1, '2024-08-31 17:08:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias`
--

CREATE TABLE `existencias` (
  `Id` int(11) NOT NULL,
  `Id_Tienda` int(11) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `existencias`
--

INSERT INTO `existencias` (`Id`, `Id_Tienda`, `Id_Producto`, `Cantidad`) VALUES
(1, 1, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_productos`
--

CREATE TABLE `imagenes_productos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes_productos`
--

INSERT INTO `imagenes_productos` (`id`, `producto_id`, `url_imagen`) VALUES
(1, 1, 'imagen1_producto1.jpg'),
(2, 1, 'imagen2_producto1.jpg'),
(3, 1, 'imagen3_producto1.jpg'),
(4, 1, 'imagen4_producto1.jpg'),
(5, 2, 'imagen1_producto2.jpg'),
(6, 2, 'imagen2_producto2.jpg'),
(7, 2, 'imagen3_producto2.jpg'),
(8, 2, 'imagen4_producto2.jpg'),
(9, 3, 'imagen1_producto3.jpg'),
(10, 3, 'imagen2_producto3.jpg'),
(11, 3, 'imagen3_producto3.jpg'),
(12, 3, 'imagen4_producto3.jpg'),
(25, 4, 'imagen1_producto4.jpg'),
(26, 4, 'imagen2_producto4.jpg'),
(27, 4, 'imagen3_producto4.jpg'),
(28, 4, 'imagen4_producto4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Id` int(11) NOT NULL,
  `Fecha_Pedido` datetime NOT NULL,
  `Id_Cliente` int(11) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Id`, `Fecha_Pedido`, `Id_Cliente`, `Id_Producto`) VALUES
(1, '2024-08-31 12:39:56', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id` int(11) NOT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Detalle_Producto` text DEFAULT NULL,
  `Stock` int(11) NOT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL,
  `Imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id`, `Nombre_Producto`, `Precio`, `Descripcion`, `Detalle_Producto`, `Stock`, `Descuento`, `Categoria`, `Activo`, `Imagen`) VALUES
(1, 'Producto 1', 100.00, 'Descripcion producto 1', NULL, 50, NULL, NULL, 1, 'imagen1_producto1.jpg'),
(2, 'Producto 2', 25.99, 'descripcion producto 2', NULL, 706, NULL, NULL, 1, 'imagen1_producto2.jpg'),
(3, 'Producto 3', 25.99, 'Descripción del producto 3', NULL, 500, NULL, NULL, 1, 'imagen1_producto3.jpg'),
(4, 'Producto 4', 25.99, 'Descripción del producto 4', NULL, 99, NULL, NULL, 1, 'imagen1_producto4.jpg'),
(5, 'Camiseta de Algodón', 19.99, 'Camiseta de algodón 100% de alta calidad', NULL, 50, NULL, NULL, 0, NULL),
(6, 'producto6', 39.99, 'sandalias estilo clásico', NULL, 30, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`Id`, `Nombre`, `Ciudad`, `Direccion`, `Foto`) VALUES
(1, 'Tienda Central', 'Ciudad A', 'Calle Falsa 123', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Password` varchar(120) NOT NULL,
  `Activacion` int(11) DEFAULT 0,
  `Token` varchar(40) DEFAULT NULL,
  `Token_Password` varchar(40) DEFAULT NULL,
  `Password_Request` int(11) DEFAULT 0,
  `Id_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `Password`, `Activacion`, `Token`, `Token_Password`, `Password_Request`, `Id_Cliente`) VALUES
(1, 'jperez', 'hashedpassword', 0, NULL, NULL, 0, 1),
(2, 'exito@exito.com', '$2y$10$n1ZO2bswY62ik/hBXg8IDeAtXIJv8E5tJW2US3ROIVliTWxslz7Si', 0, NULL, NULL, 0, 2),
(3, 'mckrampe@gmail.com', '$2y$10$nUc1l5amrYnLZXMivFC/3.cLXOV9gewWsYUV1Dv7AjbPaCoVpjWuq', 0, NULL, NULL, 0, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `existencias`
--
ALTER TABLE `existencias`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Tienda` (`Id_Tienda`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `imagenes_productos`
--
ALTER TABLE `imagenes_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Cliente` (`Id_Cliente`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Nombre` (`Nombre`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `existencias`
--
ALTER TABLE `existencias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `imagenes_productos`
--
ALTER TABLE `imagenes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `existencias`
--
ALTER TABLE `existencias`
  ADD CONSTRAINT `existencias_ibfk_1` FOREIGN KEY (`Id_Tienda`) REFERENCES `tiendas` (`Id`),
  ADD CONSTRAINT `existencias_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id`);

--
-- Filtros para la tabla `imagenes_productos`
--
ALTER TABLE `imagenes_productos`
  ADD CONSTRAINT `imagenes_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`Id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
