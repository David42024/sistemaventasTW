-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-06-2025 a las 04:42:55
-- Versión del servidor: 11.7.2-MariaDB
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

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
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add Categoría', 8, 'add_categoria'),
(30, 'Can change Categoría', 8, 'change_categoria'),
(31, 'Can delete Categoría', 8, 'delete_categoria'),
(32, 'Can view Categoría', 8, 'view_categoria'),
(33, 'Can add unidad', 9, 'add_unidad'),
(34, 'Can change unidad', 9, 'change_unidad'),
(35, 'Can delete unidad', 9, 'delete_unidad'),
(36, 'Can view unidad', 9, 'view_unidad'),
(37, 'Can add producto', 10, 'add_producto'),
(38, 'Can change producto', 10, 'change_producto'),
(39, 'Can delete producto', 10, 'delete_producto'),
(40, 'Can view producto', 10, 'view_producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'ventasApp', 'categoria'),
(7, 'ventasApp', 'cliente'),
(10, 'ventasApp', 'producto'),
(9, 'ventasApp', 'unidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-27 04:27:55.937089'),
(2, 'auth', '0001_initial', '2025-06-27 04:27:56.272539'),
(3, 'admin', '0001_initial', '2025-06-27 04:27:56.310795'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-27 04:27:56.316546'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-27 04:27:56.321804'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-27 04:27:56.362407'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-27 04:27:56.381182'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-27 04:27:56.396300'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-27 04:27:56.402422'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-27 04:27:56.419381'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-27 04:27:56.420977'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-27 04:27:56.426498'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-27 04:27:56.443872'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-27 04:27:56.463619'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-27 04:27:56.480616'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-27 04:27:56.488455'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-27 04:27:56.502524'),
(18, 'sessions', '0001_initial', '2025-06-27 04:27:56.517569'),
(19, 'ventasApp', '0001_initial', '2025-06-27 04:27:56.525369'),
(20, 'ventasApp', '0002_categoria_unidad_producto', '2025-06-27 04:27:56.578264'),
(21, 'ventasApp', '0003_alter_producto_categoria_alter_producto_unidad', '2025-06-27 04:27:57.202671');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasapp_categoria`
--

DROP TABLE IF EXISTS `ventasapp_categoria`;
CREATE TABLE IF NOT EXISTS `ventasapp_categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `ventasapp_categoria`
--

INSERT INTO `ventasapp_categoria` (`idcategoria`, `descripcion`, `estado`) VALUES
(1, 'Electrónica', 1),
(2, 'Alimentos', 1),
(3, 'Ropa', 1),
(4, 'Papelería', 1),
(5, 'Deportes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasapp_cliente`
--

DROP TABLE IF EXISTS `ventasapp_cliente`;
CREATE TABLE IF NOT EXISTS `ventasapp_cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `ventasapp_cliente`
--

INSERT INTO `ventasapp_cliente` (`idcliente`, `nombres`, `apellidos`, `direccion`, `email`, `telefono`, `estado`) VALUES
(1, 'Juan', 'Pérez', 'Av. Los Olivos 123', 'juan.perez@example.com', '987654321', 1),
(2, 'María', 'García', 'Jr. Las Flores 456', 'maria.garcia@example.com', '912345678', 1),
(3, 'Carlos', 'Rodríguez', 'Calle Primavera 789', 'carlos.rodriguez@example.com', '934567890', 1),
(4, 'Ana', 'López', 'Av. La Paz 321', 'ana.lopez@example.com', '945612378', 1),
(5, 'Luis', 'Fernández', 'Jr. Central 654', 'luis.fernandez@example.com', '956789012', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasapp_producto`
--

DROP TABLE IF EXISTS `ventasapp_producto`;
CREATE TABLE IF NOT EXISTS `ventasapp_producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE KEY `descripcion` (`descripcion`),
  KEY `ventasApp_producto_idcategoria_33887d12_fk_ventasApp` (`idcategoria`),
  KEY `ventasApp_producto_idunidad_51b01131_fk_ventasApp` (`idunidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `ventasapp_producto`
--

INSERT INTO `ventasapp_producto` (`idproducto`, `descripcion`, `precio`, `cantidad`, `estado`, `idcategoria`, `idunidad`) VALUES
(1, 'Smartphone Samsung A54', 950.00, 15, 1, 1, 1),
(2, 'Laptop Lenovo IdeaPad', 2200.00, 10, 1, 1, 1),
(3, 'Arroz Extra 5kg', 25.50, 50, 1, 2, 3),
(4, 'Aceite Vegetal 1L', 8.90, 80, 1, 2, 4),
(5, 'Polera Algodón M', 35.00, 30, 1, 3, 1),
(6, 'Jeans Azul Talla 32', 75.00, 25, 1, 3, 1),
(7, 'Cuaderno A4 100 hojas', 7.50, 100, 1, 4, 1),
(8, 'Bolígrafo Azul Caja x12', 18.00, 40, 1, 4, 2),
(9, 'Pelota de Fútbol', 60.00, 20, 1, 5, 1),
(10, 'Guantes Deportivos', 45.00, 15, 1, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasapp_unidad`
--

DROP TABLE IF EXISTS `ventasapp_unidad`;
CREATE TABLE IF NOT EXISTS `ventasapp_unidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idunidad`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `ventasapp_unidad`
--

INSERT INTO `ventasapp_unidad` (`idunidad`, `descripcion`, `estado`) VALUES
(1, 'Unidad', 1),
(2, 'Caja', 1),
(3, 'Kilogramo', 1),
(4, 'Litro', 1),
(5, 'Par', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `ventasapp_producto`
--
ALTER TABLE `ventasapp_producto`
  ADD CONSTRAINT `ventasApp_producto_idcategoria_33887d12_fk_ventasApp` FOREIGN KEY (`idcategoria`) REFERENCES `ventasapp_categoria` (`idcategoria`),
  ADD CONSTRAINT `ventasApp_producto_idunidad_51b01131_fk_ventasApp` FOREIGN KEY (`idunidad`) REFERENCES `ventasapp_unidad` (`idunidad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
