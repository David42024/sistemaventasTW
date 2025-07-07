-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-07-2025 a las 12:27:24
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdventastw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Categoría', 7, 'add_categoria'),
(26, 'Can change Categoría', 7, 'change_categoria'),
(27, 'Can delete Categoría', 7, 'delete_categoria'),
(28, 'Can view Categoría', 7, 'view_categoria'),
(29, 'Can add cliente', 8, 'add_cliente'),
(30, 'Can change cliente', 8, 'change_cliente'),
(31, 'Can delete cliente', 8, 'delete_cliente'),
(32, 'Can view cliente', 8, 'view_cliente'),
(33, 'Can add tipo', 9, 'add_tipo'),
(34, 'Can change tipo', 9, 'change_tipo'),
(35, 'Can delete tipo', 9, 'delete_tipo'),
(36, 'Can view tipo', 9, 'view_tipo'),
(37, 'Can add unidad', 10, 'add_unidad'),
(38, 'Can change unidad', 10, 'change_unidad'),
(39, 'Can delete unidad', 10, 'delete_unidad'),
(40, 'Can view unidad', 10, 'view_unidad'),
(41, 'Can add cabecera venta', 11, 'add_cabeceraventa'),
(42, 'Can change cabecera venta', 11, 'change_cabeceraventa'),
(43, 'Can delete cabecera venta', 11, 'delete_cabeceraventa'),
(44, 'Can view cabecera venta', 11, 'view_cabeceraventa'),
(45, 'Can add parametro', 12, 'add_parametro'),
(46, 'Can change parametro', 12, 'change_parametro'),
(47, 'Can delete parametro', 12, 'delete_parametro'),
(48, 'Can view parametro', 12, 'view_parametro'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add detalle venta', 14, 'add_detalleventa'),
(54, 'Can change detalle venta', 14, 'change_detalleventa'),
(55, 'Can delete detalle venta', 14, 'delete_detalleventa'),
(56, 'Can view detalle venta', 14, 'view_detalleventa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$PBauYu8j6EtMwvCQo35Ueo$blSUNQdI+YMU2bV2zFf7bOQN2A7zIhm0jfku1rohrgo=', '2025-07-04 12:25:14.182709', 1, 'esteff', '', '', '', 1, 1, '2025-06-29 02:53:10.639579');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabeceraventas`
--

DROP TABLE IF EXISTS `cabeceraventas`;
CREATE TABLE IF NOT EXISTS `cabeceraventas` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `total` double NOT NULL,
  `subtotal` double NOT NULL,
  `igv` double NOT NULL,
  `nrodoc` varchar(12) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idcliente` int NOT NULL,
  `idtipo` int NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `cabeceraventas_idcliente_99e367c5` (`idcliente`),
  KEY `cabeceraventas_idtipo_5e390c8b` (`idtipo`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cabeceraventas`
--

INSERT INTO `cabeceraventas` (`idventa`, `fecha_venta`, `total`, `subtotal`, `igv`, `nrodoc`, `estado`, `idcliente`, `idtipo`) VALUES
(5, '2025-06-30', 1200, 1016.95, 183.05, '00010', 0, 1, 1),
(6, '2025-06-30', 55.9, 0, 0, '01000', 1, 2, 2),
(7, '2025-06-30', 31, 0, 0, '01000', 1, 3, 2),
(8, '2025-07-02', 3, 2.54, 0.46, '00010', 1, 2, 1),
(9, '2025-07-02', 1.5, 0, 0, '01001', 1, 2, 2),
(10, '2025-07-02', 1.5, 0, 0, '01002', 1, 1, 2),
(11, '2025-07-02', 10, 0, 0, '01003', 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `descripcion`, `estado`) VALUES
(1, 'Electrónica', 1),
(2, 'Alimentos', 1),
(3, 'Bebidas', 1),
(4, 'Ropa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `ruc_dni` varchar(11) NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `ruc_dni` (`ruc_dni`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `ruc_dni`, `nombres`, `direccion`, `email`, `estado`) VALUES
(1, '12345678', 'Juan Pérez', 'Av. Siempre Viva 123', 'juan.perez@example.com', 1),
(2, '98765432', 'Maria Lopez', 'Calle Falsa 456', 'maria.lopez@example.com', 1),
(3, '45678912', 'Carlos García', 'Jr. Unión 789', 'carlos.garcia@example.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

DROP TABLE IF EXISTS `detalleventas`;
CREATE TABLE IF NOT EXISTS `detalleventas` (
  `precio` double NOT NULL,
  `cantidad` double NOT NULL,
  `idventa` int NOT NULL,
  `idproducto` int NOT NULL,
  PRIMARY KEY (`idproducto`,`idventa`),
  KEY `detalleventas_idventa_058d84b5` (`idventa`),
  KEY `detalleventas_idproducto_4664e227` (`idproducto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalleventas`
--

INSERT INTO `detalleventas` (`precio`, `cantidad`, `idventa`, `idproducto`) VALUES
(1200, 1, 5, 1),
(45.9, 1, 6, 4),
(5, 2, 6, 3),
(15.5, 2, 7, 2),
(1.5, 2, 8, 5),
(1.5, 1, 9, 5),
(1.5, 1, 10, 5),
(5, 2, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'ventasApp', 'categoria'),
(8, 'ventasApp', 'cliente'),
(9, 'ventasApp', 'tipo'),
(10, 'ventasApp', 'unidad'),
(11, 'ventasApp', 'cabeceraventa'),
(12, 'ventasApp', 'parametro'),
(13, 'ventasApp', 'producto'),
(14, 'ventasApp', 'detalleventa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-29 02:44:44.479941'),
(2, 'auth', '0001_initial', '2025-06-29 02:44:45.151955'),
(3, 'admin', '0001_initial', '2025-06-29 02:44:45.402566'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-29 02:44:45.410882'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-29 02:44:45.420867'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-29 02:44:45.490869'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-29 02:44:45.524828'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-29 02:44:45.560684'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-29 02:44:45.567703'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-29 02:44:45.600486'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-29 02:44:45.601897'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-29 02:44:45.609733'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-29 02:44:45.645620'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-29 02:44:45.677338'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-29 02:44:45.710496'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-29 02:44:45.718298'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-29 02:44:45.751802'),
(18, 'sessions', '0001_initial', '2025-06-29 02:44:45.790537'),
(19, 'ventasApp', '0001_initial', '2025-06-29 02:44:46.205839');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4o7vrcmrlb5w7qgdyg66ecmdkbaafxcu', '.eJxVjDsOwyAQRO9CHSGD-W3K9D4DWhYITiKQjF1FuXtsyUVSjTTvzbyZx20tfutp8XNkVybY5bcLSM9UDxAfWO-NU6vrMgd-KPyknU8tptftdP8OCvayr0lLiYKMUFlTIEtWxT1GCTkMNumcjXbOwihDkoEUOMw0DmAACEBp9vkC8ek38w:1uXfTe:QBZ4IvKPRMpJW1ef11Nb9bT_P8UxY-66zTCbn77BhAA', '2025-07-18 12:25:14.196103');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE IF NOT EXISTS `parametros` (
  `idtipo` int NOT NULL,
  `numeracion` varchar(15) NOT NULL,
  `serie` varchar(3) NOT NULL,
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `numeracion` (`numeracion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`idtipo`, `numeracion`, `serie`) VALUES
(1, '00011', '001'),
(2, '01004', '002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idcategoria` int NOT NULL,
  `idunidad` int NOT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE KEY `descripcion` (`descripcion`),
  KEY `productos_idcategoria_9954577c` (`idcategoria`),
  KEY `productos_idunidad_fb62c9e9` (`idunidad`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `descripcion`, `precio`, `stock`, `estado`, `idcategoria`, `idunidad`) VALUES
(1, 'Laptop XYZ', 1200.00, 50, 1, 1, 1),
(2, 'Arroz Costeño 5kg', 15.50, 198, 1, 2, 2),
(3, 'Gaseosa Coca Cola 1L', 5.00, 296, 1, 3, 3),
(4, 'Camisa de algodón', 45.90, 99, 1, 4, 1),
(5, 'Galleta Nik', 1.50, 48, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

DROP TABLE IF EXISTS `tipos`;
CREATE TABLE IF NOT EXISTS `tipos` (
  `idtipo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idtipo`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`idtipo`, `descripcion`, `estado`) VALUES
(1, 'Factura', 1),
(2, 'Boleta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE IF NOT EXISTS `unidades` (
  `idunidad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idunidad`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`idunidad`, `descripcion`, `estado`) VALUES
(1, 'Unidad', 1),
(2, 'Kilogramo', 1),
(3, 'Litro', 1),
(4, 'Caja', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
