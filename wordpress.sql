-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2015 a las 17:44:14
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `wordpress`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_activity`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2015-03-17 15:30:16', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_activity_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_xprofile_data`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'Camila Miranda', '2014-12-23 03:39:11'),
(2, 1, 6, 'Adepti CO', '2015-01-16 18:55:28'),
(3, 1, 4, 'Estudiante 1', '2015-01-16 18:55:28'),
(4, 1, 5, 'Estudiante 2', '2015-01-16 18:55:28'),
(5, 1, 2, 'Profesor 1', '2015-01-16 18:55:28'),
(6, 1, 3, 'Profesor 2', '2015-01-16 18:55:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_xprofile_fields`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_xprofile_groups`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_bp_xprofile_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Señor WordPress', '', 'https://wordpress.org/', '', '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Hola, esto es un comentario.\nPara eliminar un comentario sólo inicie sesión debe y vea los comentarios de la entrada. Allí tendrá la opción de editar o eliminarlos.', 0, '1', '', '', 0, 0),
(2, 2, 'cami2708', 'cami2708@yahoo.es', '', '::1', '2014-12-23 02:50:18', '2014-12-23 02:50:18', 'Hola, esto es el comentario número 1 que tiene por objetivo demostrar que la función está funcionando correctamente y que se pueden hacer más cosas con él.\r\n<code>\r\n/**\r\n * CSSReset.com - How To Keep Footer At Bottom of Page with CSS\r\n * \r\n * Original Tutorial: http://www.cssreset.com/2010/css-tutorials/how-to-keep-footer-at-bottom-of-page-with-css/\r\n * License: Free - do whatever you like with it! Credit and linkbacks much appreciated.\r\n *\r\n * NB: Make sure the value for ''padding-bottom'' on #content is equal to or greater than the height of #footer.\r\n */\r\nhtml,\r\nbody {\r\n	margin:0;\r\n	padding:0;\r\n	height:100%;\r\n}\r\n#wrapper {\r\n	min-height:100%;\r\n	position:relative;\r\n}\r\n#header {\r\n	background:#ededed;\r\n	padding:10px;\r\n}\r\n#content {\r\n	padding-bottom:100px; /* Height of the footer element */\r\n}\r\n#footer {\r\n	background:#ffab62;\r\n	width:100%;\r\n	height:100px;\r\n	position:absolute;\r\n	bottom:0;\r\n	left:0;\r\n}\r\n\r\n\r\n</code>', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '', 0, 1),
(3, 2, 'cami2708', 'cami2708@yahoo.es', '', '::1', '2014-12-23 02:52:24', '2014-12-23 02:52:24', 'Comentario respuesta a otro comentario anterior.\r\nEn esta oportunidad se probará con código HTML\r\n<code>\r\n<?php\r\n$countt=1;\r\nfor($i=1;$i<=5;$i++){\r\n	if(isset($_REQUEST["a$i"])){\r\n	$_SESSION[''data''][$countt]=$_REQUEST["a$i"];\r\n	$countt++;\r\n	}\r\n}\r\n\r\n$data=$_SESSION[''data''];\r\n//var_dump($data);?>\r\n<html>\r\n    <head>\r\n        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\r\n        <meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />\r\n        <title></title>\r\n    </head>\r\n    <body>\r\n        \r\n        <?php\r\n        include "connection.php";\r\n    foreach ($data as $key => $value) {\r\n        $sql="Select * from recetas where Id=".$value;\r\n        mysql_set_charset(''utf8'');\r\n        $result=  mysql_query($sql);\r\n        \r\n        while($fila=  mysql_fetch_assoc($result)){            \r\n            $sql2="select * from ingr_receta where RecetaId =".$fila[''Id'']." ";\r\n            $result2=  mysql_query($sql2);\r\n            while($fila2=  mysql_fetch_assoc($result2)){                \r\n                $sql3="select * from alimentos where id = ".$fila2[''AlimentoId'']." ";\r\n                $result3=  mysql_query($sql3);               \r\n                while($fila3=  mysql_fetch_assoc($result3)){\r\n                	if(isset($cosa[$fila3[''nombre'']][1]))\r\n                	$cosa[$fila3[''nombre'']][1]=$cosa[$fila3[''nombre'']][1]+$fila2[''Cantidad''];   \r\n                	else\r\n                		$cosa[$fila3[''nombre'']][1]=$fila2[''Cantidad''];\r\n                	$cosa[$fila3[''nombre'']][2]=$fila2[''Umedida''];\r\n                }\r\n            }\r\n        }\r\n    }\r\n    echo "<h1>Lista:</h1><ul>";\r\n\r\n    $_SESSION[''Total'']=$cosa;\r\n    foreach ($cosa as $key => $value) {\r\n    	echo "<li>".$value[1]." ".$value[2]." de ".$key.".</li>";\r\n    }\r\n    echo "</ul>";\r\n        mysql_close();\r\n        ?>\r\n    </body>\r\n</html>\r\n\r\n\r\n\r\n\r\n</code>', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=413 ;

--
-- Volcado de datos para la tabla `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Noticias iUAI', 'yes'),
(4, 'blogdescription', 'Otro sitio de WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'cami2708@yahoo.es', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"buddypress/bp-loader.php";i:2;s:50:"google-analytics-for-wordpress/googleanalytics.php";i:3;s:23:"papercite/papercite.php";i:4;s:39:"siteorigin-panels/siteorigin-panels.php";i:5;s:27:"theme-check/theme-check.php";i:6;s:23:"wordfence/wordfence.php";i:7;s:24:"wordpress-seo/wp-seo.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:3:{i:0;s:68:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/twentythirteen/style.css";i:2;s:66:"C:\\xampp\\htdocs\\wordpress/wp-content/themes/twentythirteen/404.php";i:3;s:0:"";}', 'no'),
(41, 'template', 'twentythirteen', 'yes'),
(42, 'stylesheet', 'twentythirteen', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '29630', 'yes'),
(89, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:133:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:11:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}}', 'yes'),
(90, 'WPLANG', 'es_CL', 'yes'),
(91, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:1:{i:0;s:6:"meta-2";}s:9:"sidebar-1";a:2:{i:0;s:8:"search-2";i:1;s:12:"categories-2";}s:9:"sidebar-2";a:4:{i:0;s:10:"calendar-2";i:1;s:14:"recent-posts-2";i:2;s:10:"archives-2";i:3;s:17:"recent-comments-2";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:24:{i:1426606476;a:1:{s:25:"wpseo_ping_search_engines";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1426606690;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1426607699;a:1:{s:21:"wordfence_hourly_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1426619640;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1426632899;a:2:{s:26:"wordfence_daily_autoUpdate";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:20:"wordfence_daily_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426636800;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426637100;a:1:{s:21:"yst_ga_aggregate_data";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426641291;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1426646416;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1426646421;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426648291;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426650036;a:1:{s:14:"yoast_tracking";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1426683169;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"65b1dfcbaebd8e235209f79541c78b62";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1426683169;}}}}i:1426728415;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1426768868;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"9d91c2250d73609eb7d1e3c2a1ec2123";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1426768868;}}}}i:1426815138;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1426855371;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"95a3ffa1e1a9f5d9a6f249ba22c4f7d6";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1426855371;}}}}i:1426899752;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1426940512;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"71f6a063bbb5762914ba7fc9c0bd4bd3";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1426940512;}}}}i:1426986478;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1427027295;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"148a66ba385676648784acb85eb69b10";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1427027295;}}}}i:1427073495;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1427162207;a:1:{s:30:"wordfence_start_scheduled_scan";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}s:7:"version";i:2;}', 'yes'),
(100, '_transient_random_seed', 'a3bb3c663cab46e247edc2c38f1c69f1', 'yes'),
(101, 'auth_key', 'mq6k35$Pd@ 1/NI/%gT#X}{j~z>%c`GI@wd.MbzJ%d=6_|vf4-XNv)rtO9d [jg|', 'yes'),
(102, 'auth_salt', 'kQp MF2AZ>&d0d.i8BxAiyK5;`},<VtI :a:gt~z?wGBig*}{:E(=8>NRI>*!R. ', 'yes'),
(103, 'logged_in_key', 'ZjO:dyV*&{fCbLA2k]4u:Ojoir_]r(Wy]`O{ ~i!]x^)XFna 5.`sUSk+{GK-Nqu', 'yes'),
(105, 'logged_in_salt', 'UKCGa$#TQ6qKJoX,^T/OzU;<KbqN9GeXKy]c!D1>6&sEV 4Qc{PkYKV(+Af;0yt$', 'yes'),
(107, 'nonce_key', '&r[MdlkzsCpn5FgakS,C>}7OGTc@_9aA%M6kW6X#S``G#<yT=%3H6-]Tguqetk<`', 'yes'),
(108, 'nonce_salt', 'Lpx+c^$mD)Hr:?MVNt~g~u<.@eHc4W(,1?CjorD0oc>YFNqUKN ^57d)J_1|ktrw', 'yes'),
(133, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:17:"cami2708@yahoo.es";s:7:"version";s:5:"4.0.1";s:9:"timestamp";i:1419302435;}', 'yes'),
(137, 'theme_mods_twentyfourteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1419302651;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(138, 'current_theme', 'Twenty Thirteen', 'yes'),
(139, 'theme_mods_twentythirteen', 'a:4:{i:0;b:0;s:12:"header_image";s:13:"remove-header";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:0;}s:16:"header_textcolor";s:5:"blank";}', 'yes'),
(140, 'theme_switched', '', 'yes'),
(141, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'widget_calendar', 'a:2:{i:2;a:1:{s:5:"title";s:10:"Calendario";}s:12:"_multiwidget";i:1;}', 'yes'),
(149, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(150, 'bb-config-location', 'C:\\xampp\\htdocs\\wordpress/bb-config.php', 'yes'),
(151, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(152, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(153, 'bp-blogs-first-install', '', 'yes'),
(154, 'bp-disable-profile-sync', '', 'yes'),
(155, 'hide-loggedout-adminbar', '', 'yes'),
(156, 'bp-disable-avatar-uploads', '', 'yes'),
(157, 'bp-disable-account-deletion', '', 'yes'),
(158, 'bp-disable-blogforum-comments', '1', 'yes'),
(159, '_bp_theme_package_id', 'legacy', 'yes'),
(160, 'bp_restrict_group_creation', '', 'yes'),
(161, '_bp_enable_akismet', '1', 'yes'),
(162, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(163, '_bp_force_buddybar', '', 'yes'),
(164, '_bp_retain_bp_default', '', 'yes'),
(165, 'widget_bp_core_login_widget', 'a:2:{i:3;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(166, 'widget_bp_core_members_widget', '', 'yes'),
(167, 'widget_bp_core_whos_online_widget', '', 'yes'),
(168, 'widget_bp_core_recently_active_widget', '', 'yes'),
(169, 'widget_bp_groups_widget', '', 'yes'),
(170, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(175, 'yst_ga', 'a:1:{s:10:"ga_general";a:25:{s:10:"ga_general";a:21:{s:17:"analytics_profile";N;s:22:"analytics_profile_code";N;s:14:"manual_ua_code";i:0;s:20:"manual_ua_code_field";N;s:26:"track_internal_as_outbound";N;s:23:"track_internal_as_label";N;s:14:"track_outbound";i:0;s:14:"anonymous_data";i:0;s:16:"enable_universal";i:0;s:12:"demographics";i:0;s:12:"ignore_users";a:1:{i:0;s:6:"editor";}s:13:"anonymize_ips";i:0;s:17:"track_download_as";s:5:"event";s:19:"extensions_of_files";s:30:"doc,exe,js,pdf,ppt,tgz,zip,xls";s:14:"track_full_url";s:6:"domain";s:18:"subdomain_tracking";N;s:16:"tag_links_in_rss";i:0;s:12:"allow_anchor";i:0;s:16:"add_allow_linker";i:0;s:11:"custom_code";N;s:10:"debug_mode";i:0;}s:17:"analytics_profile";N;s:22:"analytics_profile_code";N;s:14:"manual_ua_code";i:0;s:20:"manual_ua_code_field";N;s:26:"track_internal_as_outbound";N;s:23:"track_internal_as_label";N;s:14:"track_outbound";i:0;s:14:"anonymous_data";i:0;s:16:"enable_universal";i:0;s:12:"demographics";i:0;s:12:"ignore_users";a:1:{i:0;s:6:"editor";}s:13:"anonymize_ips";i:0;s:17:"track_download_as";s:5:"event";s:19:"extensions_of_files";s:30:"doc,exe,js,pdf,ppt,tgz,zip,xls";s:14:"track_full_url";s:6:"domain";s:18:"subdomain_tracking";N;s:16:"tag_links_in_rss";i:0;s:12:"allow_anchor";i:0;s:16:"add_allow_linker";i:0;s:11:"custom_code";N;s:10:"debug_mode";i:0;s:7:"version";s:5:"5.3.2";s:19:"dashboards_disabled";i:0;s:25:"enhanced_link_attribution";i:0;}}', 'yes'),
(176, 'yst_ga_api', 'a:0:{}', 'no'),
(177, 'siteorigin_panels_initial_version', '2.0.3', 'no'),
(178, 'woocommerce_default_country', 'GB', 'yes'),
(179, 'woocommerce_allowed_countries', 'all', 'yes'),
(180, 'woocommerce_specific_allowed_countries', '', 'yes'),
(181, 'woocommerce_demo_store', 'no', 'yes'),
(182, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(183, 'woocommerce_api_enabled', 'yes', 'yes'),
(184, 'woocommerce_currency', 'GBP', 'yes'),
(185, 'woocommerce_currency_pos', 'left', 'yes'),
(186, 'woocommerce_price_thousand_sep', ',', 'yes'),
(187, 'woocommerce_price_decimal_sep', '.', 'yes'),
(188, 'woocommerce_price_num_decimals', '2', 'yes'),
(189, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(190, 'woocommerce_enable_chosen', 'yes', 'no'),
(191, 'woocommerce_shop_page_id', '', 'yes'),
(192, 'woocommerce_shop_page_display', '', 'yes'),
(193, 'woocommerce_category_archive_display', '', 'yes'),
(194, 'woocommerce_default_catalog_orderby', 'title', 'yes'),
(195, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(196, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(197, 'woocommerce_weight_unit', 'kg', 'yes'),
(198, 'woocommerce_dimension_unit', 'cm', 'yes'),
(199, 'woocommerce_enable_review_rating', 'yes', 'no'),
(200, 'woocommerce_review_rating_required', 'yes', 'no'),
(201, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(202, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(203, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"150";s:6:"height";s:3:"150";s:4:"crop";i:1;}', 'yes'),
(204, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(205, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:2:"90";s:6:"height";s:2:"90";s:4:"crop";i:1;}', 'yes'),
(206, 'woocommerce_file_download_method', 'force', 'no'),
(207, 'woocommerce_downloads_require_login', 'no', 'no'),
(208, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(209, 'woocommerce_manage_stock', 'yes', 'yes'),
(210, 'woocommerce_hold_stock_minutes', '60', 'no'),
(211, 'woocommerce_notify_low_stock', 'yes', 'no'),
(212, 'woocommerce_notify_no_stock', 'yes', 'no'),
(213, 'woocommerce_stock_email_recipient', 'cami2708@yahoo.es', 'no'),
(214, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(215, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(216, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(217, 'woocommerce_stock_format', '', 'yes'),
(218, 'woocommerce_calc_taxes', 'no', 'yes'),
(219, 'woocommerce_prices_include_tax', 'no', 'yes'),
(220, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(221, 'woocommerce_default_customer_address', 'base', 'yes'),
(222, 'woocommerce_shipping_tax_class', 'title', 'yes'),
(223, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(224, 'woocommerce_tax_classes', 'Reduced Rate\r\nZero Rate', 'yes'),
(225, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(226, 'woocommerce_price_display_suffix', '', 'yes'),
(227, 'woocommerce_tax_display_cart', 'excl', 'no'),
(228, 'woocommerce_tax_total_display', 'itemized', 'no'),
(229, 'woocommerce_enable_coupons', 'yes', 'no'),
(230, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(231, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(232, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(233, 'woocommerce_cart_page_id', '', 'yes'),
(234, 'woocommerce_checkout_page_id', '', 'yes'),
(235, 'woocommerce_terms_page_id', '', 'no'),
(236, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(237, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(238, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(239, 'woocommerce_calc_shipping', 'yes', 'yes'),
(240, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(241, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(242, 'woocommerce_shipping_method_format', '', 'no'),
(243, 'woocommerce_ship_to_destination', 'shipping', 'no'),
(244, 'woocommerce_ship_to_countries', '', 'yes'),
(245, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(246, 'woocommerce_myaccount_page_id', '', 'yes'),
(247, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(248, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(249, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(250, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(251, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(252, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(253, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(254, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(255, 'woocommerce_registration_generate_username', 'yes', 'no'),
(256, 'woocommerce_registration_generate_password', 'no', 'no'),
(257, 'woocommerce_email_from_name', 'Tester', 'no'),
(258, 'woocommerce_email_from_address', 'cami2708@yahoo.es', 'no'),
(259, 'woocommerce_email_header_image', '', 'no'),
(260, 'woocommerce_email_footer_text', 'Tester - Powered by WooCommerce', 'no'),
(261, 'woocommerce_email_base_color', '#557da1', 'no'),
(262, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(263, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(264, 'woocommerce_email_text_color', '#505050', 'no'),
(265, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(266, 'woocommerce_db_version', '2.2.10', 'yes'),
(267, 'woocommerce_version', '2.2.10', 'yes'),
(271, 'wordfence_version', '5.3.6', 'yes'),
(272, 'wordfenceActivated', '1', 'yes'),
(273, 'wf_plugin_act_error', '', 'yes'),
(274, 'wpseo', 'a:18:{s:14:"blocking_files";a:0:{}s:26:"ignore_blog_public_warning";b:0;s:31:"ignore_meta_description_warning";b:0;s:20:"ignore_page_comments";b:0;s:16:"ignore_permalink";b:0;s:11:"ignore_tour";b:1;s:15:"ms_defaults_set";b:0;s:23:"theme_description_found";s:0:"";s:21:"theme_has_description";b:0;s:19:"tracking_popup_done";b:1;s:7:"version";s:5:"1.7.4";s:11:"alexaverify";s:0:"";s:20:"disableadvanced_meta";b:1;s:12:"googleverify";s:0:"";s:8:"msverify";s:0:"";s:15:"pinterestverify";s:0:"";s:12:"yandexverify";s:0:"";s:14:"yoast_tracking";b:1;}', 'yes'),
(275, 'wpseo_permalinks', 'a:10:{s:15:"cleanpermalinks";b:0;s:24:"cleanpermalink-extravars";s:0:"";s:29:"cleanpermalink-googlecampaign";b:0;s:31:"cleanpermalink-googlesitesearch";b:0;s:15:"cleanreplytocom";b:0;s:10:"cleanslugs";b:1;s:15:"force_transport";s:7:"default";s:18:"redirectattachment";b:0;s:17:"stripcategorybase";b:0;s:13:"trailingslash";b:0;}', 'yes'),
(276, 'wpseo_titles', 'a:84:{s:10:"title_test";i:0;s:17:"forcerewritetitle";b:0;s:9:"separator";s:7:"sc-dash";s:14:"hide-feedlinks";b:0;s:12:"hide-rsdlink";b:0;s:14:"hide-shortlink";b:0;s:16:"hide-wlwmanifest";b:0;s:5:"noodp";b:0;s:6:"noydir";b:0;s:15:"usemetakeywords";b:0;s:16:"title-home-wpseo";s:42:"%%sitename%% %%page%% %%sep%% %%sitedesc%%";s:18:"title-author-wpseo";s:41:"%%name%%, Author at %%sitename%% %%page%%";s:19:"title-archive-wpseo";s:38:"%%date%% %%page%% %%sep%% %%sitename%%";s:18:"title-search-wpseo";s:63:"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%";s:15:"title-404-wpseo";s:35:"Page not found %%sep%% %%sitename%%";s:19:"metadesc-home-wpseo";s:0:"";s:21:"metadesc-author-wpseo";s:0:"";s:22:"metadesc-archive-wpseo";s:0:"";s:18:"metakey-home-wpseo";s:0:"";s:20:"metakey-author-wpseo";s:0:"";s:22:"noindex-subpages-wpseo";b:0;s:20:"noindex-author-wpseo";b:0;s:21:"noindex-archive-wpseo";b:1;s:14:"disable-author";b:0;s:12:"disable-date";b:0;s:10:"title-post";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-post";s:0:"";s:12:"metakey-post";s:0:"";s:12:"noindex-post";b:0;s:13:"showdate-post";b:0;s:16:"hideeditbox-post";b:0;s:10:"title-page";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-page";s:0:"";s:12:"metakey-page";s:0:"";s:12:"noindex-page";b:0;s:13:"showdate-page";b:0;s:16:"hideeditbox-page";b:0;s:16:"title-attachment";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-attachment";s:0:"";s:18:"metakey-attachment";s:0:"";s:18:"noindex-attachment";b:0;s:19:"showdate-attachment";b:0;s:22:"hideeditbox-attachment";b:0;s:13:"title-product";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:16:"metadesc-product";s:0:"";s:15:"metakey-product";s:0:"";s:15:"noindex-product";b:0;s:16:"showdate-product";b:0;s:19:"hideeditbox-product";b:0;s:23:"title-ptarchive-product";s:51:"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%";s:26:"metadesc-ptarchive-product";s:0:"";s:25:"metakey-ptarchive-product";s:0:"";s:25:"bctitle-ptarchive-product";s:0:"";s:25:"noindex-ptarchive-product";b:0;s:18:"title-tax-category";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-category";s:0:"";s:20:"metakey-tax-category";s:0:"";s:24:"hideeditbox-tax-category";b:0;s:20:"noindex-tax-category";b:0;s:18:"title-tax-post_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-post_tag";s:0:"";s:20:"metakey-tax-post_tag";s:0:"";s:24:"hideeditbox-tax-post_tag";b:0;s:20:"noindex-tax-post_tag";b:0;s:21:"title-tax-post_format";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-post_format";s:0:"";s:23:"metakey-tax-post_format";s:0:"";s:27:"hideeditbox-tax-post_format";b:0;s:23:"noindex-tax-post_format";b:1;s:21:"title-tax-product_cat";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-product_cat";s:0:"";s:23:"metakey-tax-product_cat";s:0:"";s:27:"hideeditbox-tax-product_cat";b:0;s:23:"noindex-tax-product_cat";b:0;s:21:"title-tax-product_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-product_tag";s:0:"";s:23:"metakey-tax-product_tag";s:0:"";s:27:"hideeditbox-tax-product_tag";b:0;s:23:"noindex-tax-product_tag";b:0;s:32:"title-tax-product_shipping_class";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:35:"metadesc-tax-product_shipping_class";s:0:"";s:34:"metakey-tax-product_shipping_class";s:0:"";s:38:"hideeditbox-tax-product_shipping_class";b:0;s:34:"noindex-tax-product_shipping_class";b:0;}', 'yes'),
(277, 'wpseo_social', 'a:15:{s:9:"fb_admins";a:0:{}s:6:"fbapps";a:0:{}s:12:"fbconnectkey";s:32:"16eb74cb8aaad7f8781bd61ca73600eb";s:13:"facebook_site";s:0:"";s:16:"og_default_image";s:0:"";s:18:"og_frontpage_title";s:0:"";s:17:"og_frontpage_desc";s:0:"";s:18:"og_frontpage_image";s:0:"";s:9:"opengraph";b:1;s:10:"googleplus";b:0;s:14:"plus-publisher";s:0:"";s:7:"twitter";b:0;s:12:"twitter_site";s:0:"";s:17:"twitter_card_type";s:7:"summary";s:10:"fbadminapp";i:0;}', 'yes'),
(278, 'wpseo_rss', 'a:2:{s:9:"rssbefore";s:0:"";s:8:"rssafter";s:53:"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.";}', 'yes'),
(279, 'wpseo_internallinks', 'a:14:{s:20:"breadcrumbs-404crumb";s:25:"Error 404: Page not found";s:23:"breadcrumbs-blog-remove";b:0;s:20:"breadcrumbs-boldlast";b:0;s:25:"breadcrumbs-archiveprefix";s:12:"Archives for";s:18:"breadcrumbs-enable";b:0;s:16:"breadcrumbs-home";s:4:"Home";s:18:"breadcrumbs-prefix";s:0:"";s:24:"breadcrumbs-searchprefix";s:16:"You searched for";s:15:"breadcrumbs-sep";s:7:"&raquo;";s:23:"post_types-post-maintax";i:0;s:26:"post_types-product-maintax";i:0;s:29:"taxonomy-product_cat-ptparent";i:0;s:29:"taxonomy-product_tag-ptparent";i:0;s:40:"taxonomy-product_shipping_class-ptparent";i:0;}', 'yes'),
(280, 'wpseo_xml', 'a:23:{s:22:"disable_author_sitemap";b:1;s:22:"disable_author_noposts";b:1;s:16:"enablexmlsitemap";b:1;s:16:"entries-per-page";i:1000;s:14:"xml_ping_yahoo";b:0;s:12:"xml_ping_ask";b:0;s:38:"user_role-administrator-not_in_sitemap";b:0;s:31:"user_role-editor-not_in_sitemap";b:0;s:31:"user_role-author-not_in_sitemap";b:0;s:36:"user_role-contributor-not_in_sitemap";b:0;s:35:"user_role-subscriber-not_in_sitemap";b:0;s:33:"user_role-customer-not_in_sitemap";b:0;s:37:"user_role-shop_manager-not_in_sitemap";b:0;s:30:"post_types-post-not_in_sitemap";b:0;s:30:"post_types-page-not_in_sitemap";b:0;s:36:"post_types-attachment-not_in_sitemap";b:1;s:33:"post_types-product-not_in_sitemap";b:0;s:34:"taxonomies-category-not_in_sitemap";b:0;s:34:"taxonomies-post_tag-not_in_sitemap";b:0;s:37:"taxonomies-post_format-not_in_sitemap";b:0;s:37:"taxonomies-product_cat-not_in_sitemap";b:0;s:37:"taxonomies-product_tag-not_in_sitemap";b:0;s:48:"taxonomies-product_shipping_class-not_in_sitemap";b:0;}', 'yes'),
(281, '_transient_woocommerce_cache_excluded_uris', 'a:0:{}', 'yes'),
(283, 'registration', '0', 'yes'),
(284, 'bp-active-components', 'a:5:{s:8:"activity";i:1;s:7:"members";i:1;s:8:"settings";i:1;s:8:"xprofile";i:1;s:13:"notifications";i:1;}', 'yes'),
(285, 'bp-pages', 'a:2:{s:8:"activity";i:6;s:7:"members";i:7;}', 'yes'),
(286, '_bp_db_version', '9181', 'yes'),
(287, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(288, 'woocommerce_admin_notices', 'a:0:{}', 'yes'),
(292, 'woocommerce_language_pack_version', 'a:2:{i:0;s:6:"2.2.10";i:1;s:5:"es_CL";}', 'yes'),
(300, 'woocommerce_permalinks', 'a:5:{s:13:"category_base";s:0:"";s:8:"tag_base";s:0:"";s:14:"attribute_base";s:0:"";s:12:"product_base";s:7:"/tienda";s:22:"use_verbose_page_rules";b:1;}', 'yes'),
(303, '_transient_bp_active_member_count', '1', 'yes'),
(347, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1426470920', 'yes'),
(348, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"4916";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3078";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3022";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2529";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2346";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1892";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1729";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1680";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1678";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1676";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1612";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1609";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1505";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1322";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1276";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1175";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1171";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1083";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1079";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"918";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"905";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"874";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"843";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"837";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"794";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"758";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"748";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"709";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"700";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"692";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"682";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"657";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"649";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"642";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"642";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"623";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"620";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"605";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"600";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"593";}}', 'yes'),
(349, 'db_upgraded', '', 'yes'),
(352, 'rewrite_rules', 'a:76:{s:19:"sitemap_index\\.xml$";s:19:"index.php?sitemap=1";s:31:"([^/]+?)-sitemap([0-9]+)?\\.xml$";s:51:"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]";s:24:"([a-z]+)?-?sitemap\\.xsl$";s:25:"index.php?xsl=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:50:"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:43:"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?bp_member_type=$matches[1]&paged=$matches[2]";s:25:"bp_member_type/([^/]+)/?$";s:36:"index.php?bp_member_type=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:47:"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"([0-9]{4})/([0-9]{1,2})/([^/]+)/trackback/?$";s:69:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&tb=1";s:64:"([0-9]{4})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]";s:59:"([0-9]{4})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]";s:52:"([0-9]{4})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&paged=$matches[4]";s:59:"([0-9]{4})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&cpage=$matches[4]";s:44:"([0-9]{4})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]";s:36:"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(353, 'can_compress_scripts', '1', 'yes'),
(364, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(374, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.1.zip";s:6:"locale";s:5:"es_CL";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.1.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.1.1";s:7:"version";s:5:"4.1.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1426603239;s:15:"version_checked";s:5:"4.1.1";s:12:"translations";a:0:{}}', 'yes'),
(375, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1426603251;s:7:"checked";a:5:{s:4:"hexa";s:5:"1.0.1";s:13:"twentyfifteen";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.3";s:14:"twentythirteen";s:3:"1.4";s:12:"twentytwelve";s:3:"1.6";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(376, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1426603251;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:9:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"3.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.3.1.zip";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:5:"2.2.1";s:14:"upgrade_notice";s:57:"See: https://codex.buddypress.org/releases/version-2-2-1/";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/buddypress.2.2.1.zip";}s:50:"google-analytics-for-wordpress/googleanalytics.php";O:8:"stdClass":6:{s:2:"id";s:3:"965";s:4:"slug";s:30:"google-analytics-for-wordpress";s:6:"plugin";s:50:"google-analytics-for-wordpress/googleanalytics.php";s:11:"new_version";s:5:"5.3.2";s:3:"url";s:61:"https://wordpress.org/plugins/google-analytics-for-wordpress/";s:7:"package";s:79:"https://downloads.wordpress.org/plugin/google-analytics-for-wordpress.5.3.2.zip";}s:39:"siteorigin-panels/siteorigin-panels.php";O:8:"stdClass":6:{s:2:"id";s:5:"40030";s:4:"slug";s:17:"siteorigin-panels";s:6:"plugin";s:39:"siteorigin-panels/siteorigin-panels.php";s:11:"new_version";s:5:"2.0.7";s:3:"url";s:48:"https://wordpress.org/plugins/siteorigin-panels/";s:7:"package";s:66:"https://downloads.wordpress.org/plugin/siteorigin-panels.2.0.7.zip";}s:23:"papercite/papercite.php";O:8:"stdClass":6:{s:2:"id";s:5:"15784";s:4:"slug";s:9:"papercite";s:6:"plugin";s:23:"papercite/papercite.php";s:11:"new_version";s:6:"0.5.15";s:3:"url";s:40:"https://wordpress.org/plugins/papercite/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/papercite.0.5.15.zip";}s:27:"theme-check/theme-check.php";O:8:"stdClass":6:{s:2:"id";s:5:"18487";s:4:"slug";s:11:"theme-check";s:6:"plugin";s:27:"theme-check/theme-check.php";s:11:"new_version";s:10:"20141222.1";s:3:"url";s:42:"https://wordpress.org/plugins/theme-check/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/theme-check.20141222.1.zip";}s:27:"woocommerce/woocommerce.php";O:8:"stdClass":6:{s:2:"id";s:5:"25331";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:5:"2.3.6";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/woocommerce.2.3.6.zip";}s:23:"wordfence/wordfence.php";O:8:"stdClass":6:{s:2:"id";s:5:"25305";s:4:"slug";s:9:"wordfence";s:6:"plugin";s:23:"wordfence/wordfence.php";s:11:"new_version";s:5:"5.3.6";s:3:"url";s:40:"https://wordpress.org/plugins/wordfence/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/wordfence.5.3.6.zip";}s:24:"wordpress-seo/wp-seo.php";O:8:"stdClass":6:{s:2:"id";s:4:"5899";s:4:"slug";s:13:"wordpress-seo";s:6:"plugin";s:24:"wordpress-seo/wp-seo.php";s:11:"new_version";s:5:"1.7.4";s:3:"url";s:44:"https://wordpress.org/plugins/wordpress-seo/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wordpress-seo.1.7.4.zip";}}}', 'yes'),
(383, 'category_children', 'a:0:{}', 'yes'),
(390, '_site_transient_timeout_theme_roots', '1426605042', 'yes'),
(391, '_site_transient_theme_roots', 'a:5:{s:4:"hexa";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(392, '_site_transient_timeout_browser_73b9f98ff6ae54da565d4ec89e273c53', '1427208110', 'yes'),
(393, '_site_transient_browser_73b9f98ff6ae54da565d4ec89e273c53', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"41.0.2272.89";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(394, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1426646513', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(395, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 23:22:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=4.2-beta1-31800";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 23:22:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3446";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.2 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4259:"<p>WordPress 4.2 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.2-beta1.zip">download the beta here</a> (zip).</p>\n<p>4.2 is due out next month, but to get there, we need your help testing what we&#8217;ve been working on:</p>\n<ul>\n<li><strong>Press This</strong> has been completely revamped to make sharing content from around the web easier than ever. The new workflow is mobile friendly, and we&#8217;d love for you to try it out on all of your devices. Navigate to the Tools screen in your WordPress backend to get started (<a href="https://core.trac.wordpress.org/ticket/31373">#31373</a>). </li>\n<li><strong>Browsing and switching installed themes</strong> has been added to the Customizer to make switching faster and more convenient. We&#8217;re especially interested to know if this helps streamline the process of setting up your site (<a href="https://core.trac.wordpress.org/ticket/31303">#31303</a>).</li>\n<li>The workflow for <strong>updating and installing plugins</strong> just got more intuitive with the ability to install or update in-place from the Plugins screens. Try it out and let us know what you think! (<a href="https://core.trac.wordpress.org/ticket/29820">#29820</a>)</li>\n<li>If you felt like <strong>emoji</strong> were starkly missing from your content toolbox, worry no more. We&#8217;ve added emoji support nearly everywhere, even post slugs <img src="https://s0.wp.com/wp-content/mu-plugins/emoji/twemoji/72x72/1f44d.png" class="wp-smiley" style="height: 1em;" /> (<a href="https://core.trac.wordpress.org/ticket/31242">#31242</a>).</li>\n</ul>\n<p><strong>Developers</strong>: There have been a lot of changes for you to test as well, including:</p>\n<ul>\n<li><strong>Taxonomy Roadmap:</strong> Terms shared across multiple taxonomies will <a href="https://make.wordpress.org/core/2015/02/16/taxonomy-term-splitting-in-4-2-a-developer-guide/">now be split</a> into separate terms when one of them is updated. Please let us know if you hit any snags (<a href="https://core.trac.wordpress.org/ticket/5809/">#5809</a>).</li>\n<li>New <code>wp.a11y.speak()</code> functionality helps your JavaScript talk to screen readers to better inform impaired users what&#8217;s happening on-screen. Try it out in your plugin or theme and let us know if you notice any adverse affects (<a href="https://core.trac.wordpress.org/ticket/31368/">#31368</a>).</li>\n<li>Named clause support has been added to <code>WP_Query</code>, <code>WP_Comment_Query</code>, and <code>WP_User_Query</code>, allowing specific <code>meta_query</code> clauses to be used with <code>orderby</code>. If you have any complex queries, please test them (<a href="https://core.trac.wordpress.org/ticket/31045/">#31045</a>, <a href="https://core.trac.wordpress.org/ticket/31265/">#31265</a>).</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.2, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a> on the main development blog.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything we’ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Press This: switch a theme</em><br />\n<em>Save time installing plugins</em><br />\n<em>Testing makes us</em> <img src="https://s0.wp.com/wp-content/mu-plugins/emoji/twemoji/72x72/1f603.png" class="wp-smiley" style="height: 1em;" /></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 4.1.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/02/wordpress-4-1-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/02/wordpress-4-1-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 23:40:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3436";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1. Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months. For a full [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3086:"<p>WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1.</p>\n<p>Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months.</p>\n<p class="p1"><span class="s1">For a full list of changes, consult the <a href="https://core.trac.wordpress.org/query?milestone=4.1.1&amp;group=severity&amp;order=component">list of tickets</a> and the <a href="https://core.trac.wordpress.org/log/branches/4.1?stop_rev=30974&amp;rev=31474">changelog</a>. We fixed one annoying issue where a tag and a category with the same name could get muddled and prevent each other from being updated.</span></p>\n<p>If you are one of the millions already running WordPress 4.1 and your site, we’ve started rolling out automatic background updates for 4.1.1 for sites <a href="https://wordpress.org/plugins/background-update-tester/">that support them</a>. Otherwise, <a href="https://wordpress.org/download/">download WordPress 4.1.1</a> or visit <strong>Dashboard → Updates</strong> and simply click “Update Now.”</p>\n<p>Thanks to everyone who contributed to 4.1.1: <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/hissy">Takuro Hishikawa</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/iseulde">Iseulde</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/sippis">sippis</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, and <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n<p>It is with both great honor and sadness we also recognize Kim Parsell as a contributor to this release and a <a href="https://make.wordpress.org/docs/2015/01/05/rip-kim-parsell/">truly beloved member of the community</a> until her untimely passing in December. The project is working to establish a conference travel <a href="https://make.wordpress.org/community/2015/01/15/remembering-kim-parsell/">scholarship</a> in her memory. We miss you, Kim.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/02/wordpress-4-1-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.1 “Dinah”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/12/dinah/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/12/dinah/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 18:35:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3386";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:360:"Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer Dinah Washington, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style. Introducing Twenty Fifteen Our newest default theme, Twenty Fifteen, is [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:24563:"<p>Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer <a href="http://wikipedia.org/wiki/Dinah_Washington">Dinah Washington</a>, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style.</p>\n<hr />\n<h2 style="text-align: center">Introducing Twenty Fifteen</h2>\n<p><img class="aligncenter size-large wp-image-3389" src="https://wordpress.org/news/files/2014/12/2015-laptop-1024x533.png" alt="2015-laptop" width="692" height="360" /></p>\n<h3>Our newest default theme, Twenty Fifteen, is a blog-focused theme designed for clarity.</h3>\n<p><img class="alignright wp-image-3426 size-medium" src="https://wordpress.org/news/files/2014/12/2015-phones-languages-small-300x250.png" alt="" width="300" height="250" />Twenty Fifteen has flawless language support, with help from <a href="https://www.google.com/get/noto/">Google’s Noto font family</a>.</p>\n<p>The straightforward typography is readable on any screen size.</p>\n<p>Your content always takes center stage, whether viewed on a phone, tablet, laptop, or desktop computer.</p>\n<hr />\n<h2 style="text-align: center">Distraction-free writing</h2>\n<p><img class="aligncenter size-large wp-image-3392" src="https://wordpress.org/news/files/2014/12/dfw-screen-1024x614.png" alt="dfw-screen" width="692" height="415" /></p>\n<h3 style="text-align: center"><em>Just write.</em></h3>\n<p>Sometimes, you just need to concentrate on putting your thoughts into words. Try turning on <strong>distraction-free writing mode</strong>. When you start typing, all the distractions will fade away, letting you focus solely on your writing. All your editing tools instantly return when you need them.</p>\n<hr />\n<h2 style="text-align: center">The Finer Points</h2>\n<h5><strong><img class="alignleft wp-image-3405" src="https://wordpress.org/news/files/2014/12/icon-language2.png" alt="" width="80" height="80" /></strong>Choose a language</h5>\n<p>Right now, WordPress 4.1 is already translated into over forty languages, with more always in progress. You can switch to any translation on the General Settings screen.</p>\n<h5><strong><img class="alignleft wp-image-3406" src="https://wordpress.org/news/files/2014/12/icon-logout1.png" alt="" width="80" height="80" /></strong>Log out everywhere</h5>\n<p>If you’ve ever worried you forgot to sign out from a shared computer, you can now go to your profile and log out everywhere.</p>\n<h5><strong><img class="alignleft wp-image-3407" src="https://wordpress.org/news/files/2014/12/icon-vine1.png" alt="" width="80" height="80" /></strong>Vine embeds</h5>\n<p>Embedding videos from Vine is as simple as pasting a URL onto its own line in a post. See the <a href="https://codex.wordpress.org/Embeds">full list</a> of supported embeds.</p>\n<h5><strong><img class="alignleft wp-image-3408" src="https://wordpress.org/news/files/2014/12/icon-recommended1.png" alt="" width="80" height="80" /></strong>Plugin recommendations</h5>\n<p>The plugin installer suggests plugins for you to try. Recommendations are based on the plugins you and other users have installed.</p>\n<hr />\n<h2 style="text-align: center">Under the Hood</h2>\n<h5>Complex Queries</h5>\n<p>Metadata, date, and term queries now support advanced conditional logic, like nested clauses and multiple operators — <code>A AND ( B OR C )</code>.</p>\n<h5>Customizer API</h5>\n<p>The customizer now supports conditionally showing panels and sections based on the page being previewed.</p>\n<h5><code>&lt;title&gt;</code> tags in themes</h5>\n<p><code>add_theme_support( ''title-tag'' )</code> tells WordPress to handle the complexities of document titles.</p>\n<h5>Developer Reference</h5>\n<p>Continued improvements to inline code documentation have made the <a href="https://developer.wordpress.org/reference/">developer reference</a> more complete than ever.</p>\n<hr />\n<h2 style="text-align: center">The Choir</h2>\n<p>This release was led by <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, with the help of these awesome folks. Check out some of their profiles while listening to Dinah Washington on the music service of your choice:</p>\n<a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/akumria">akumria</a>, <a href="https://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/momo360modena">Amaury Balmer</a>, <a href="https://profiles.wordpress.org/amruta123b">Amruta Bhosale</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andg">Andrea Gandino</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andrewryno">Andrew Ryno</a>, <a href="https://profiles.wordpress.org/rarst">Andrey "Rarst" Savchenko</a>, <a href="https://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/arippberger">arippberger</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/bainternet">Bainternet</a>, <a href="https://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/benjmay">Ben May</a>, <a href="https://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bobbingwide">bobbingwide</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/briandichiara">Brian DiChiara</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/bswatson">Brian Watson</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/captaintheme">Captain Theme</a>, <a href="https://profiles.wordpress.org/hiwhatsup">Carlos</a>, <a href="https://profiles.wordpress.org/caspie">Caspie</a>, <a href="https://profiles.wordpress.org/ccprice">ccprice</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/aprea">Chris Aprea</a>, <a href="https://profiles.wordpress.org/chrisbliss18">Chris Jean</a>, <a href="https://profiles.wordpress.org/cmmarslender">Chris Marslender</a>, <a href="https://profiles.wordpress.org/jazzs3quence">Chris Reynolds</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/cfoellmann">Christian Foellmann</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/cyclometh">Corey Snow</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/curtjen">curtjen</a>, <a href="https://profiles.wordpress.org/colorful-tones">Damon Cook</a>, <a href="https://profiles.wordpress.org/dancameron">Dan Cameron</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/convissor">Daniel Convissor</a>, <a href="https://profiles.wordpress.org/nerrad">Darren Ethier (nerrad)</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/davidjlaietta">David Laietta</a>, <a href="https://profiles.wordpress.org/technical_mastermind">David Wood</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/dcavins">dcavins</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/wedi">Dirk Weise</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/dominikschwind-1">Dominik Schwind</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="https://profiles.wordpress.org/dustinhartzler">Dustin Hartzler</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ew_holmes">Eric Holmes</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Lewis</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/florianziegler">Florian Ziegler</a>, <a href="https://profiles.wordpress.org/hereswhatidid">Gabe Shackle</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="https://profiles.wordpress.org/babbardel">George Olaru</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/gregrickaby">Greg Rickaby</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/tivnet">Gregory Karpinsky (@tivnet)</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/hardy101">hardy101</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/heshiming">heshiming</a>, <a href="https://profiles.wordpress.org/honeysilvas">honeysilvas</a>, <a href="https://profiles.wordpress.org/hugodelgado">hugodelgado</a>, <a href="https://profiles.wordpress.org/iandstewart">Ian Stewart</a>, <a href="https://profiles.wordpress.org/ianmjones">ianmjones</a>, <a href="https://profiles.wordpress.org/igmoweb">Ignacio Cruz Moreno</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/ivankristianto">Ivan Kristianto</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jaimieolmstead">jaimieolmstead</a>, <a href="https://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="https://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/japh">Japh</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/jarednova">jarednova</a>, <a href="https://profiles.wordpress.org/jeanyoungkim">jeanyoungkim</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jeherve">Jeremy Herve</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/johneckman">John Eckman</a>, <a href="https://profiles.wordpress.org/johnrom">johnrom</a>, <a href="https://profiles.wordpress.org/johnstonphilip">johnstonphilip</a>, <a href="https://profiles.wordpress.org/jb510">Jon Brown</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jbrinley">Jonathan Brinley</a>, <a href="https://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/julien731">Julien Liabeuf</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kamelkev">kamelkev</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/keesiemeijer">keesiemeijer</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kdoran">Kiko Doran</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kosvrouvas">Kostas Vrouvas</a>, <a href="https://profiles.wordpress.org/kristastevens">kristastevens</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/offereins">Laurens Offereins</a>, <a href="https://profiles.wordpress.org/linuxologos">linuxologos</a>, <a href="https://profiles.wordpress.org/ideag">Liuiza Arunas</a>, <a href="https://profiles.wordpress.org/loushou">loushou</a>, <a href="https://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="https://profiles.wordpress.org/manoz69">Manoz69</a>, <a href="https://profiles.wordpress.org/mantismamita">mantismamita</a>, <a href="https://profiles.wordpress.org/marcosf">Marco Schmoecker</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/landakram">Mark Hudnall</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/senff">Mark Senff</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/marsjaninzmarsa">marsjaninzmarsa</a>, <a href="https://profiles.wordpress.org/matveb">Matias Ventura</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattkeys">mattkeys</a>, <a href="https://profiles.wordpress.org/mlteal">Maura Teal</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/merty">Mert Yazicioglu</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="https://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="https://profiles.wordpress.org/smashcut">Michael Pick</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/chellycat">Michelle Langston</a>, <a href="https://profiles.wordpress.org/mcsf">Miguel Fonseca</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/studionashvegas">Mitch Canter (studionashvegas)</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/mor10">Morten Rand-Hendriksen</a>, <a href="https://profiles.wordpress.org/mvd7793">mvd7793</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nikv">Nikhil Vimal</a>, <a href="https://profiles.wordpress.org/nikolovtmw">Nikola Nikolov</a>, <a href="https://profiles.wordpress.org/nobleclem">nobleclem</a>, <a href="https://profiles.wordpress.org/noplanman">noplanman</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="https://profiles.wordpress.org/p_enrique">p_enrique</a>, <a href="https://profiles.wordpress.org/pushplaybang">Paul</a>, <a href="https://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/peterchester">Peter Chester</a>, <a href="https://profiles.wordpress.org/donutz">Peter J. Herrel</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/phpmypython">phpmypython</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="https://profiles.wordpress.org/psycleuk">psycleuk</a>, <a href="https://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="https://profiles.wordpress.org/quietnic">quietnic</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/ramiabraham">ramiabraham</a>, <a href="https://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/richardmtl">Richard Archambault</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/ryankienstra">Ryan Kienstra</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sakinshrestha">Sakin Shrestha</a>, <a href="https://profiles.wordpress.org/samhotchkiss">Sam Hotchkiss</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shooper">Shawn Hooper</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/skaeser">skaeser</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/socki03">socki03</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/tacoverdo">TacoVerdo</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="https://profiles.wordpress.org/karmatosed">Tammie</a>, <a href="https://profiles.wordpress.org/tareq1988">Tareq Hasan</a>, <a href="https://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="https://profiles.wordpress.org/kraftner">Thomas Kraftner</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/tschutter">Tobias Schutter</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tmtrademark">Toby McKes</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/tomasm">Tomas Mackevicius</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/transom">transom</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/nobinobi">Yuta Sekine</a>, <a href="https://profiles.wordpress.org/zrothauser">Zack Rothauser</a>, and <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.\n<p>There were 283 contributors to this release, again a new high.</p>\n<p>If you want to help out or follow along, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>.</p>\n<p>Thanks for choosing WordPress. Happy holidays and see you next year for version 4.2!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/12/dinah/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 4.1 Release Candidate 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 02:22:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3411";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:429:"The next release candidate for WordPress 4.1 is now available for testing. Seventy changes have gone in since the first release candidate. With no known issues left, we plan to release 4.1 tomorrow, December 18. To test, try the WordPress Beta Tester plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can download the release candidate here (zip). If you&#8217;d like to learn more about [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1465:"<p>The next release candidate for WordPress 4.1 is now available for testing.</p>\n<p><a href="https://core.trac.wordpress.org/log/trunk?rev=30961&amp;stop_rev=30827">Seventy changes</a> have gone in since the <a href="https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/">first release candidate</a>. With no known issues left, we plan to release 4.1 tomorrow, December 18.</p>\n<p>To test, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.1-RC3.zip">download the release candidate here</a> (zip). If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the updated About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" /> → About</strong> in the toolbar) and also check out <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the Beta 1 post</a>.</p>\n<p><strong>Plugin authors:</strong> Remember to test your plugins against 4.1, and if they&#8217;re compatible, make sure they are marked as tested up to 4.1. Be sure to follow along the core development blog; we&#8217;ve been posting <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes for developers for 4.1</a> as always.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.1 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Dec 2014 11:52:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3375";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:341:"The release candidate for WordPress 4.1 is now available. We&#8217;ve made a lot of refinements over the last few weeks. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2301:"<p>The release candidate for WordPress 4.1 is now available.</p>\n<p>We&#8217;ve made a lot of refinements over the last few weeks. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your help to get there. If you haven’t tested 4.1 yet, now is the time! (Please though, not on your live site unless you’re adventurous.)</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.1 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.1-RC1.zip">download the release candidate here</a> (zip). If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" /> → About</strong> in the toolbar) or check out the <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">beta announcement</a>.</p>\n<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.1 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.1 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>\n<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes for developers</a> for 4.1. (For example: if you&#8217;ve written a child theme for Twenty Fifteen, some of the new pagination functions have been renamed for clarity.)</p>\n<p><em>Testing four point one</em><br />\n<em>Why are we up at this hour?</em><br />\n<em>Code is poetry</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.0.1 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/11/wordpress-4-0-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/11/wordpress-4-0-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Nov 2014 18:55:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3363";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.0.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3395:"<p>WordPress 4.0.1 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be updated to 3.9.3, 3.8.5, or 3.7.5 to keep everything secure. (We don’t support older versions, so please update to 4.0.1 for the latest and greatest.)</p>\n<p>WordPress versions 3.9.2 and earlier are affected by a critical cross-site scripting vulnerability, which could enable anonymous users to compromise a site. This was reported by <a href="http://klikki.fi/">Jouko Pynnonen</a>. This issue does not affect version 4.0, but version 4.0.1 does address these eight security issues:</p>\n<ul>\n<li>Three cross-site scripting issues that a contributor or author could use to compromise a site. Discovered by <a href="http://joncave.co.uk/">Jon Cave</a>, <a href="http://www.miqrogroove.com/">Robert Chapin</a>, and <a href="https://johnblackbourn.com/">John Blackbourn</a> of the WordPress security team.</li>\n<li>A cross-site request forgery that could be used to trick a user into changing their password.</li>\n<li>An issue that could lead to a denial of service when passwords are checked. Reported by <a href="http://www.behindthefirewalls.com/">Javier Nieto Arevalo</a> and <a href="http://www.devconsole.info/">Andres Rojas Guerrero</a>.</li>\n<li>Additional protections for server-side request forgery attacks when WordPress makes HTTP requests. Reported by Ben Bidner (vortfu).</li>\n<li>An extremely unlikely hash collision could allow a user&#8217;s account to be compromised, that also required that they haven&#8217;t logged in since 2008 (I wish I were kidding). Reported by <a href="http://david.dw-perspective.org.uk">David Anderson</a>.</li>\n<li>WordPress now invalidates the links in a password reset email if the user remembers their password, logs in, and changes their email address. Reported separately by <a href="https://twitter.com/MomenBassel">Momen Bassel</a>, <a href="http://c0dehouse.blogspot.in/">Tanoy Bose</a>, and <a href="https://managewp.com/">Bojan Slavković of ManageWP</a>.</li>\n</ul>\n<p>Version 4.0.1 also fixes 23 bugs with 4.0, and we&#8217;ve made two hardening changes, including better validation of EXIF data we are extracting from uploaded photos. Reported by <a href="http://www.securesolutions.no/">Chris Andrè Dale</a>.</p>\n<p>We appreciated the <a href="https://codex.wordpress.org/FAQ_Security">responsible disclosure</a> of these issues directly to our security team. For more information, see the <a href="https://codex.wordpress.org/Version_4.0.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.0?rev=30475&amp;stop_rev=29710">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.0.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click “Update Now”.</p>\n<p><em>Already testing WordPress 4.1? The second beta is now available (<a href="https://wordpress.org/wordpress-4.1-beta2.zip">zip</a>) and it contains these security fixes. For more on 4.1, see <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the beta 1 announcement post</a>.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-0-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.1 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Nov 2014 22:35:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:4:"beta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3352";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:346:"Welcome, everyone, to WordPress 4.1 Beta 1! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the WordPress Beta Tester plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3409:"<p>Welcome, everyone, to WordPress 4.1 Beta 1!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="//wordpress.org/wordpress-4.1-beta1.zip">download the beta here</a> (zip).</p>\n<p>WordPress 4.1 is due for release next month, so we need your help with testing. Here are some highlights of what to test:</p>\n<ul>\n<li>Our beautiful new default theme, <a href="https://make.wordpress.org/core/2014/09/09/twenty-fifteen/">Twenty Fifteen</a>. It&#8217;s a clean, mobile-first, blog-focused theme designed through simplicity.</li>\n<li>A new <a href="https://make.wordpress.org/core/2014/11/11/focus-v2-demo-video/">distraction-free writing mode for the editor</a>. It&#8217;s enabled by default for beta, and we&#8217;d love feedback on it.</li>\n<li>The ability to automatically install new language packs right from the General Settings screen (available as long as your site&#8217;s filesystem is writable).</li>\n<li>A new inline formatting toolbar for images embedded into posts.</li>\n</ul>\n<p>There have been a lot of changes for developers to test as well:</p>\n<ul>\n<li><a href="https://make.wordpress.org/core/2014/10/20/update-on-query-improvements-in-4-1/">Improvements to meta, date, comment, and taxonomy queries</a>, including complex (nested, multiple relation) queries; and querying comment types (<a href="https://core.trac.wordpress.org/ticket/12668">#12668</a>).</li>\n<li>A single term shared across multiple taxonomies is now split into two when updated. For more, <a href="https://make.wordpress.org/core/2014/11/12/an-update-on-the-taxonomy-roadmap/">see this post</a>, <a href="https://core.trac.wordpress.org/ticket/5809">#5809</a>, and <a href="https://core.trac.wordpress.org/ticket/30335">#30335</a>.</li>\n<li>A new and better way for <a href="https://make.wordpress.org/core/2014/10/29/title-tags-in-4-1/">themes to handle title tags</a>.</li>\n<li>Several <a href="https://make.wordpress.org/core/2014/10/27/toward-a-complete-javascript-api-for-the-customizer/">improvements to the Customizer API</a>, including contextual panels and sections, and JavaScript templates for controls.</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.1, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a> on the main development blog.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.1">everything we’ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Twenty Fifteen theme</em><br />\n<em> The beautiful face which hides</em><br />\n<em> Many improvements</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Watch WordCamp San Francisco Livestream";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/10/wcsf-livestream/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/10/wcsf-livestream/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Oct 2014 20:18:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3341";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:381:"WordCamp San Francisco is the official annual WordPress conference, gathering the community every year since 2006. This is the time when Matt Mullenweg addresses the community in his annual State of the Word presentation – a recap of  the year in WordPress and giving us a glimpse into its future. This year the speaker lineup is stellar. There will be talks by [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Nikolay Bachiyski";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1975:"<p><a title="2014 edition" href="http://2014.sf.wordcamp.org">WordCamp San Francisco</a> is the official annual WordPress conference, gathering the community every year <a title="An old website for a WordPress long time ago" href="http://2006.sf.wordcamp.org">since 2006</a>. This is the time when Matt Mullenweg addresses the community in his annual <a href="http://wordpress.tv/?s=state+of+the+word">State of the Word</a> presentation – a recap of  the year in WordPress and giving us a glimpse into its future.</p>\n<p>This year the speaker lineup is stellar. There will be talks by three of the lead WordPress developers: <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-andrew-nacin">Andrew Nacin</a>, <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-helen-hou-sandi">Helen Hou-Sandí</a>, and <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-mark-jaquith">Mark Jaquith</a>. We’re also looking forward to speakers like <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jenny-lawson">Jenny Lawson</a>, also known as The Bloggess, and <a href="http://2014.sf.wordcamp.org/speaker/chris-lema/">Chris Lema</a>. If you’re at all interested in the web, you will appreciate the appearance of <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jeff-veen">Jeff Veen</a> – one of the creators of Google Analytics and co-founder of Typekit.</p>\n<p>Even though San Francisco is far far away for most of you, you can still be part of the fun and watch all presentations in real-time via livestream:</p>\n<p><a href="http://2014.sf.wordcamp.org/tickets/">Get a livestream ticket and watch all talks from WordCamp San Francisco live</a></p>\n<p>If you hurry, you can get one of the special livestream tickets, including a WordCamp San Francisco 2104 t-shirt. You can find all the technical details and start times <a href="http://2014.sf.wordcamp.org/live-stream/">at the WordCamp San Francisco website</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/10/wcsf-livestream/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.0 “Benny”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/09/benny/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/09/benny/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Sep 2014 17:05:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3296";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:370:"Version 4.0 of WordPress, named “Benny” in honor of jazz clarinetist and bandleader Benny Goodman, is available for download or update in your WordPress dashboard. While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:23575:"<p>Version 4.0 of WordPress, named “Benny” in honor of jazz clarinetist and bandleader <a href="http://en.wikipedia.org/wiki/Benny_Goodman">Benny Goodman</a>, is available <a href="https://wordpress.org/download/">for download</a> or update in your WordPress dashboard. While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience we think you&#8217;ll enjoy.</p>\n<div id="v-bUdzKMro-1" class="video-player"><embed id="v-bUdzKMro-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=bUdzKMro&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 4.0 &quot;Benny&quot;" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<hr />\n<h2 style="text-align: center">Manage your media with style</h2>\n<p><img class="alignnone size-full wp-image-3316" src="https://wordpress.org/news/files/2014/09/media.jpg" alt="Media Library" width="1000" height="586" />Explore your uploads in a beautiful, endless grid. A new details preview makes viewing and editing any amount of media in sequence a snap.</p>\n<hr />\n<h2 style="text-align: center">Working with embeds has never been easier</h2>\n<div style="width: 632px; " class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<video class="wp-video-shortcode" id="video-3296-1" width="632" height="445" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/embed.mp4?_=1" /><source type="video/webm" src="//s.w.org/images/core/4.0/embed.webm?_=1" /><source type="video/ogg" src="//s.w.org/images/core/4.0/embed.ogv?_=1" /><a href="//s.w.org/images/core/4.0/embed.mp4">//s.w.org/images/core/4.0/embed.mp4</a></video></div>\n<p>Paste in a YouTube URL on a new line, and watch it magically become an embedded video. Now try it with a tweet. Oh yeah — embedding has become a visual experience. The editor shows a true preview of your embedded content, saving you time and giving you confidence.</p>\n<p>We’ve expanded the services supported by default, too — you can embed videos from CollegeHumor, playlists from YouTube, and talks from TED. <a href="https://codex.wordpress.org/Embeds">Check out all of the embeds</a> that WordPress supports.</p>\n<hr />\n<h2 style="text-align: center">Focus on your content</h2>\n<div style="width: 632px; " class="wp-video"><video class="wp-video-shortcode" id="video-3296-2" width="632" height="356" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/focus.mp4?_=2" /><source type="video/webm" src="//s.w.org/images/core/4.0/focus.webm?_=2" /><source type="video/ogg" src="//s.w.org/images/core/4.0/focus.ogv?_=2" /><a href="//s.w.org/images/core/4.0/focus.mp4">//s.w.org/images/core/4.0/focus.mp4</a></video></div>\n<p>Writing and editing is smoother and more immersive with an editor that expands to fit your content as you write, and keeps the formatting tools available at all times.</p>\n<hr />\n<h2 style="text-align: center">Finding the right plugin</h2>\n<p><img class="aligncenter size-large wp-image-3309" src="https://wordpress.org/news/files/2014/09/add-plugin1-1024x600.png" alt="Add plugins" width="692" height="405" /></p>\n<p>There are more than 30,000 free and open source plugins in the WordPress plugin directory. WordPress 4.0 makes it easier to find the right one for your needs, with new metrics, improved search, and a more visual browsing experience.</p>\n<hr />\n<h2 style="text-align: center">The Ensemble</h2>\n<p>This release was led by <a href="http://helenhousandi.com">Helen Hou-Sandí</a>, with the help of these fine individuals. There are 275 contributors with props in this release, a new high. Pull up some Benny Goodman on your music service of choice, as a bandleader or in one of his turns as a classical clarinetist, and check out some of their profiles:</p>\n<p><a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/alexanderrohmann">Alexander Rohmann</a>, <a href="https://profiles.wordpress.org/aliso">Alison Barrett</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/amit">Amit Gupta</a>, <a href="https://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andrezrv">Andres Villarreal</a>, <a href="https://profiles.wordpress.org/zamfeer">Andrew Mowe</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andy">Andy Skelton</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="https://profiles.wordpress.org/arnee">Arne Brachhold</a>, <a href="https://profiles.wordpress.org/aubreypwd">Aubrey Portwood</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/kau-boy">Bernhard Kau</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chouby">Chouby</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/caxelsson">Christian Axelsson</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/boda1982">Christopher Spires</a>, <a href="https://profiles.wordpress.org/clifgriffin">Clifton Griffin</a>, <a href="https://profiles.wordpress.org/jupiterwise">Corey McKrill</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/ghost1227">Dan Griffiths</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/danielhuesken">Daniel Husken</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/dannydehaan">Danny de Haan</a>, <a href="https://profiles.wordpress.org/dkotter">Darin Kotter</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dllh">Daryl L. L. Houston (dllh)</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/dnaber-de">David Naber</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/debaat">DeBAAT</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/donncha">Donncha O Caoimh</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyn">Dustyn Doyle</a>, <a href="https://profiles.wordpress.org/eddiemoya">Eddie Moya</a>, <a href="https://profiles.wordpress.org/oso96_2000">Eduardo Reveles</a>, <a href="https://profiles.wordpress.org/edwin-at-studiojoyocom">Edwin Siebel</a>, <a href="https://profiles.wordpress.org/ehg">ehg</a>, <a href="https://profiles.wordpress.org/erayalakese">erayalakese</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/ejdanderson">Evan Anderson</a>, <a href="https://profiles.wordpress.org/eherman24">Evan Herman</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/fahmiadib">Fahmi Adib</a>, <a href="https://profiles.wordpress.org/feedmeastraycat">feedmeastraycat</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/garhdez">garhdez</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/garza">garza</a>, <a href="https://profiles.wordpress.org/gauravmittal1995">gauravmittal1995</a>, <a href="https://profiles.wordpress.org/gavra">Gavrisimo</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/grahamarmfield">Graham Armfield</a>, <a href="https://profiles.wordpress.org/vancoder">Grant Mangham</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/harrym">harrym</a>, <a href="https://profiles.wordpress.org/hebbet">hebbet</a>, <a href="https://profiles.wordpress.org/hinnerk">Hinnerk Altenburg</a>, <a href="https://profiles.wordpress.org/hlashbrooke">Hugh Lashbrooke</a>, <a href="https://profiles.wordpress.org/iljoja">iljoja</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/issuu">issuu</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jackreichert">Jack Reichert</a>, <a href="https://profiles.wordpress.org/jacobdubail">Jacob Dubail</a>, <a href="https://profiles.wordpress.org/janhenkg">JanHenkG</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/strangerstudios">Jason Coleman</a>, <a href="https://profiles.wordpress.org/jaza613">Jaza613</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/slimndap">Jeroen Schmit</a>, <a href="https://profiles.wordpress.org/jerrysarcastic">Jerry Bates (jerrysarcastic)</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jesper800">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jgadbois">jgadbois</a>, <a href="https://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/johnzanussi">John Zanussi</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jonnyauk">jonnyauk</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/jjeaton">Josh Eaton</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/greenshady">Justin Tadlock</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kapeels">kapeels</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kworthington">Kevin Worthington</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="https://profiles.wordpress.org/layotte">Lew Ayotte</a>, <a href="https://profiles.wordpress.org/lritter">lritter</a>, <a href="https://profiles.wordpress.org/lukecarbis">Luke Carbis</a>, <a href="https://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="https://profiles.wordpress.org/m_i_n">m_i_n</a>, <a href="https://profiles.wordpress.org/funkatronic">Manny Fleurmond</a>, <a href="https://profiles.wordpress.org/targz-1">Manuel Schmalstieg</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/mjbanks">Matt Banks</a>, <a href="https://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="https://profiles.wordpress.org/mattheweppelsheimer">Matthew Eppelsheimer</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/meekyhwang">meekyhwang</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/midxcat">midxcat</a>, <a href="https://profiles.wordpress.org/mauteri">Mike Auteri</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="https://profiles.wordpress.org/mikemanger">Mike Manger</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="https://profiles.wordpress.org/mrmist">mrmist</a>, <a href="https://profiles.wordpress.org/m_uysl">Mustafa Uysal</a>, <a href="https://profiles.wordpress.org/muvimotv">MuViMoTV</a>, <a href="https://profiles.wordpress.org/nabil_kadimi">nabil_kadimi</a>, <a href="https://profiles.wordpress.org/namibia">Namibia</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/nd987">nd987</a>, <a href="https://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/schoenwaldnils">Nils Schonwald</a>, <a href="https://profiles.wordpress.org/ninos-ego">Ninos</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/compute">Patrick Hesselberg</a>, <a href="https://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="https://profiles.wordpress.org/pdclark">Paul Clark</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/philipjohn">Philip John</a>, <a href="https://profiles.wordpress.org/senlin">Piet Bos</a>, <a href="https://profiles.wordpress.org/psoluch">Piotr Soluch</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/purzlbaum">purzlbaum</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rclations">RC Lations</a>, <a href="https://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/rob1n">rob1n</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="https://profiles.wordpress.org/harmr">RobertHarm</a>, <a href="https://profiles.wordpress.org/rohan013">Rohan Rawat</a>, <a href="https://profiles.wordpress.org/rhurling">Rouven Hurling</a>, <a href="https://profiles.wordpress.org/ruudjoyo">Ruud Laan</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sammybeats">Sam Brodie</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sathishn">Sathish Nagarajan</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/nessworthy">Sean Nessworthy</a>, <a href="https://profiles.wordpress.org/sergejmueller">Sergej Muller</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shanebp">shanebp</a>, <a href="https://profiles.wordpress.org/sharonaustin">Sharon Austin</a>, <a href="https://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/sphoid">sphoid</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stompweb">Steven Jones</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/t4k1s">t4k1s</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/taylorde">Taylor Dewey</a>, <a href="https://profiles.wordpress.org/thomasvanderbeek">Thomas van der Beek</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/codenameeli">Tim &#039;Eli&#039; Dalbey</a>, <a href="https://profiles.wordpress.org/tmeister">tmeister</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/torresga">torresga</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/treyhunner">treyhunner</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/winterdev">winterDev</a>, <a href="https://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/katzwebdesign">Zack Katz</a>, <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>, and <a href="https://profiles.wordpress.org/zoerooney">Zoe Rooney</a>. Also thanks to <a href="http://michaelpick.wordpress.com/">Michael Pick</a> for producing the release video, and Helen with <a href="http://adriansandi.com">Adrián Sandí</a> for the music.</p>\n<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.1!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/09/benny/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.0 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Aug 2014 12:20:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3287";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:321:"The first release candidate for WordPress 4.0 is now available! In RC 1, we’ve made refinements to what we&#8217;ve been working on for this release. Check out the Beta 1 announcement post for more details on those features. We hope to ship WordPress 4.0 next week, but we need your help to get there. If you [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2134:"<p>The first release candidate for WordPress 4.0 is now available!</p>\n<p>In RC 1, we’ve made refinements to what we&#8217;ve been working on for this release. Check out the <a href="https://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">Beta 1 announcement post</a> for more details on those features. We hope to ship WordPress 4.0 <em>next week</em>, but we need your help to get there. If you haven’t tested 4.0 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.)</p>\n<p><strong>Think you’ve found a bug? </strong>Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.0 RC1, try the <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.0-RC1.zip">download the release candidate here</a> (zip). If you’d like to learn more about what’s new in WordPress 4.0, visit the awesome About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" alt="" width="16" height="16" /> → About</strong> in the toolbar).</p>\n<p><strong>Developers,</strong> please test your plugins and themes against WordPress 4.0 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.0 before next week. If you find compatibility problems, please be sure to post any issues to the support forums so we can figure those out before the final release. You also may want to <a href="https://make.wordpress.org/core/2014/08/21/introducing-plugin-icons-in-the-plugin-installer/">give your plugin an icon</a>, which we launched last week and will appear in the dashboard along with banners.</p>\n<p><em>It is almost time</em><br />\n<em> For the 4.0 release</em><br />\n<em> And its awesomeness</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:31 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:10:"x-pingback";s:37:"https://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Thu, 12 Mar 2015 23:22:52 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20130911070210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(396, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1426646513', 'no'),
(397, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1426603313', 'no'),
(398, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1426646515', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(399, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Meetups Around the World";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44783";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/03/meetups-around-the-world/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"<p><a href="https://kinsta.com/learn/wordpress-communities-around-the-world/">Here&#8217;s a great article about WordPress meetup communities around the world</a>, including Singapore, Argentina, France, Croatia, India, Serbia, Malta, Norway, South Africa, Canada, Switzerland, Ireland, Estonia, Egypt, Poland, Belgium, and Slovakia.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Mar 2015 05:00:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"WPTavern: Ultimate Member: A New Free Community and User Profile Plugin for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40639";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/ultimate-member-a-new-free-community-and-user-profile-plugin-for-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5307:"<p><a href="https://ultimatemember.com/" target="_blank">Ultimate Member</a> is the newest plugin to join the ranks of WordPress membership solutions after seven months in development. One month after landing in the WordPress.org directory, the <a href="https://wordpress.org/plugins/ultimate-member/" target="_blank">plugin</a> is already active on more than 2,000 WordPress sites and has received a 5-star rating from 73/75 reviewers.</p>\n<p>The WordPress ecosystem is flush with both free and commercial membership plugins, but Ultimate Member takes a unique approach with its heavy emphasis on frontend community features. The plugin goes beyond content restriction to provide beautifully-designed user profiles and directories out of the box.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member.png" rel="prettyphoto[40639]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member.png?resize=949%2C457" alt="ultimate-member" class="aligncenter size-full wp-image-40641" /></a></p>\n<p>It includes searchable member directories and frontend user registration, login, and profiles. Administrators can create custom form fields with conditional logic. The membership features include custom user roles, content restriction, conditional menus, and more. Ultimate Member is compatible with multisite and Mandrill. It was also designed to be developer friendly with dozens of actions and filters for further customization.</p>\n<p><a href="http://ultimatememberdemo.com/" target="_blank">Live demos</a> are available for the user profiles, member directory, and user account pages.</p>\n<h3>Ultimate Member Extensions Sales Hit $1500 in the First 5 Days</h3>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member-extensions.jpg" rel="prettyphoto[40639]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member-extensions.jpg?resize=1019%2C174" alt="ultimate-member-extensions" class="aligncenter size-full wp-image-40701" /></a></p>\n<p>Co-founders <a href="https://twitter.com/calumallison" target="_blank">Calum Allison</a> and Ahmed Elmahd opted to keep the base plugin free and offer additional commercial <a href="https://ultimatemember.com/extensions/" target="_blank">extensions</a>.</p>\n<p>&#8220;We decided to use the free core + paid extensions model as we&#8217;ve seen how successful plugins such as WooCommerce, Ninja Forms, and Easy Digital Downloads have been with this model,&#8221; Allison said. &#8220;We want to try replicate this success in the community/user space.&#8221;</p>\n<p>Initial extension sales indicate that the team has identified a competitive niche. &#8220;We&#8217;ve had sales of just under $1,500 from our first five days and we hope this will grow as more extensions are built and more people learn about the plugin,&#8221; Allison told the Tavern.</p>\n<p>Ultimate Member is not quite a BuddyPress alternative, but its founding duo entered the market to provide basic social features on top of membership functionality.</p>\n<p>&#8220;The plugin is useful for people looking to build a site where users can sign up and become members but are not necessarily looking to create a full-blown social network which is offered by plugins such as BuddyPress or WP Symposium,&#8221; Allison said.</p>\n<p>Currently, the most popular extensions in terms of sales are the bbPress integration and Social Login extensions. More modular social features, such as private messaging and paid membership upgrades, are currently in the works.</p>\n<p>&#8220;Longer term we are considering building themes which are designed specifically for the community niche,&#8221; Allison said.</p>\n<p>In the meantime, the duo is focusing on providing support for all users and have answered more than 400 topics on their community forum and the WordPress.org plugin support forum.</p>\n<p>&#8220;We made a decision from the beginning that we would provide support for all users of the plugin, regardless of whether they purchased an extension or not,&#8221; Allison said. &#8220;We feel that providing at least some support to free users means they are more likely to want to purchase an extension or two.&#8221;</p>\n<p>Ultimate Member is open source and available on <a href="https://github.com/wp-plugins/ultimate-member" target="_blank">GitHub</a> for contribution from developers. Co-founders Allison and Elmahd also maintain a <a href="https://trello.com/b/30quaczv/ultimate-member" target="_blank">Trello board</a> for mapping the future of the plugin and managing current issues.</p>\n<p>With a strong set of <a href="https://ultimatemember.com/features/" target="_blank">core features</a> and solid extensions sales numbers right out of the gate, <a href="https://ultimatemember.com/" target="_blank">Ultimate Member</a> is already demonstrating success with the free core plus commercial extensions business model. Even in a seemingly saturated WordPress membership plugin market, a quality product that can zero in on a specific niche has a decent chance of becoming competitive within a short time after launching. The challenge will be keeping up with the level of support they intend to offer for both commercial and free users, while growing the library of extensions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 Mar 2015 22:55:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: Pods Framework Security Release Fixes Severe Vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40651";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wptavern.com/pods-framework-security-release-fixes-severe-vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3704:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/pods.jpg" rel="prettyphoto[40651]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/pods.jpg?resize=628%2C290" alt="pods" class="aligncenter size-full wp-image-40653" /></a></p>\n<p>Last week <a href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended">a blind SQL injection vulnerability</a> was discovered in Yoast&#8217;s popular WordPress SEO plugin. Given the severity of the vulnerability and the fact that the plugin is installed on more than one million WordPress sites, the security team at WordPress.org pushed <a href="http://wptavern.com/how-to-stay-in-the-loop-if-you-turn-off-wordpress-automatic-updates" target="_blank">a forced update</a> to mitigate the possibility of mass exploitation.</p>\n<p>Following this incident, the <a href="http://pods.io/" target="_blank">Pods framework</a> team proactively performed a security review of their <a href="https://wordpress.org/plugins/pods/" target="_blank">plugin</a> and found an issue similar to the one discovered and disclosed last week in the WordPress SEO plugin. Contributor Josh Pollock describes the issue in the <a href="http://pods.io/2015/03/16/important-security-disclosure/" target="_blank">release announcement</a>:</p>\n<blockquote><p>We believe this is an especially severe issue as this issue occurred in the PodsUI class, which is not only used for the Pods admin, but is also employed by many end-users to create front-end and back-end content management interfaces for non-admin users.</p>\n<p>The issue occurred in approximately Line 859 of the PodsUI class. The orderby parameter, which is passed from the browser in a GET variable was subsequently used in an SQL query without being properly sanitized.</p>\n<p>As a result malicious or other unintended SQL queries could be sent to the database by manipulating the GET request.</p></blockquote>\n<p>Pods 2.5.1.2, released today, is a security update that patches this vulnerability. If you require an earlier version of the plugin, patched versions of older versions are available the <a href="https://wordpress.org/plugins/pods/developers/" target="_blank">releases page</a>. All users are advised to update immediately.</p>\n<p>The Pods framework is used for creating, managing, and deploying customized content types and fields. It&#8217;s active on more than 30,000 WordPress installations. Contributors on the project credit Yoast&#8217;s transparency on the recent security issue as having inspired their team to proactively examine Pods.</p>\n<p>&#8220;Reading the details of their issue led us to search for similar security issues in Pods,&#8221; Pollock said. &#8220;We applaud their responsible disclosure to the community. Publishing the details helps other developers work to improve security in their own codebase.&#8221;</p>\n<h3>More Security Updates on the Way for Popular WordPress Plugins</h3>\n<p>All relatively complex plugins will have security issues pop up from time to time that will require immediate patching. Fortunately, the plugin authors in these scenarios have been quick to respond.</p>\n<p>This particular vulnerability is not limited to Pods and the WordPress SEO plugin by Yoast. Pollock advises that WordPress users should be on the lookout for more security updates to follow for other popular plugins.</p>\n<p>&#8220;Our team has done a search in several other plugins for similar issues and has reported our findings to their authors,&#8221; he said. &#8220;At this time we can not share specifics about theses issues, but will as soon as it is responsible to do so.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 Mar 2015 18:17:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Alex King: In Praise of BackupBuddy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=21405";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://alexking.org/blog/2015/03/15/backupbuddy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1571:"<p>I&#8217;m thrilled with my <a href="https://alexking.org/blog/2015/02/25/hosted-on-webfaction">new hosting set-up</a> for this site, however WebFaction doesn&#8217;t offer daily backups. I knew could spend the time to write a little script to export my database and pass it along to another storage location, but then I thought of <a href="https://ithemes.com/purchase/backupbuddy/">BackupBuddy from iThemes</a>.</p>\n<p>5 minutes later I had BackupBuddy installed, with a nightly job configured to do a full export of my database and store the last 10 days of backups in my Dropbox account.</p>\n<p>Sure, I could have written the code to do this myself. It&#8217;s always tempting to do-it-yourself when you know you <em>can</em> do something. The key is to ask yourself if you <em>should</em> do something. It would have taken much more than 5 minutes to get even a simple backup script written and configured; and I definitely wouldn&#8217;t have had the storage and and automation options that BackupBuddy provides out of the box.</p>\n<p>If you need hassle-free backups for your self-hosted WordPress site<sup id="fnref:1"><a href="http://alexking.org/blog/topic/wordpress/feed#fn:1" rel="footnote">1</a></sup>, give BackupBuddy a try.</p>\n<div class="footnotes">\n<hr />\n<ol>\n<li id="fn:1">\nIf you have a website, <em>please</em> make sure you have an automated backup system, and that you&#8217;ve tested your backups to make sure they actually work.&#160;<a href="http://alexking.org/blog/topic/wordpress/feed#fnref:1" rev="footnote">&#8617;</a>\n</li>\n</ol>\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 15 Mar 2015 20:05:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Live in the Moment";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44759";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/03/live-in-the-moment/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:369:"<p>Jenna Wortham writes on <a href="http://bits.blogs.nytimes.com/2014/10/18/trying-to-live-in-the-moment-and-not-on-the-phone/">Trying to Live in the Moment (and Not on the Phone)</a>. I&#8217;ve been using the Moment app recently too, <a href="https://cloudup.com/cSfRDLJHDiv">here&#8217;s my past week of usage</a>. (I think it might count phone calls as usage.)</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 15 Mar 2015 18:45:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Matt: Series A Struggle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44853";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"http://ma.tt/2015/03/raising-series-a/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:312:"<p><a href="http://firstround.com/review/what-the-seed-funding-boom-means-for-raising-a-series-a/">Josh Kopelman on why raising a Series A is harder than ever, and how startups can adapt to survive the changing investment landscape</a>. Fantastic essay, relevant for every company raising money at any stage.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Mar 2015 20:45:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WPTavern: BuddyPress Live Notification 2.0 Adds Real-Time Notifications for Users";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40500";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/buddypress-live-notification-2-0-adds-real-time-notifications-for-users";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3787:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/08/megaphone.jpg" rel="prettyphoto[40500]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/08/megaphone.jpg?resize=1024%2C484" alt="photo credit: MACSwriter - cc" class="size-full wp-image-28480" /></a>photo credit: <a href="https://www.flickr.com/photos/88758069@N08/8445004895/">MACSwriter</a> &#8211; <a href="http://creativecommons.org/licenses/by-sa/2.0/">cc</a>\n<p>The <a href="https://wordpress.org/plugins/bp-live-notification/">BuddyPress Live Notification</a> plugin was originally released in 2011. Brajesh Singh, prolific plugin author and founder of <a href="http://buddydev.com/" target="_blank">BuddyDev</a>, created the plugin to provide Facebook-style real-time notifications for users. Over the past four years, a number of significant changes in both WordPress and BuddyPress have necessitated a complete rewrite of the extension.</p>\n<p>The <a href="http://buddydev.com/buddypress/introducing-buddypress-live-notification-2-0/" target="_blank">2.0 version</a> of the plugin adds support for BuddyPress&#8217; new <a href="http://wptavern.com/buddypress-1-9-sammy-released-with-new-notifications-component" target="_blank">notifications component</a>, as well as the <a href="http://codex.wordpress.org/Function_Reference/wp_heartbeat_settings" target="_blank">Heartbeat API</a>, which is now used to fetch the notifications.</p>\n<p>The updated version includes the following:</p>\n<ul>\n<li>Complete rewrite of the code to include support for BP notifications component (introduced in BuddyPress 1.9.0)</li>\n<li>Uses WordPress Heartbeat API instead of long AJAX polling for greatly improved performance</li>\n<li>Allows theme authors to change the notifying mechanism by overriding the  notify  method of the  bpln object</li>\n<li>Fires custom JavaScript event bpln:new_notifications when new notifications are received on the client side. A theme author can hook into it to make modifications.</li>\n</ul>\n<p>Because BP Live Notification was designed to be easy to theme and extend, Singh created an <a href="https://github.com/sbrajesh/bp-live-notification-example-module" target="_blank">example plugin</a> to demonstrate how to replace the notify window UI with your own customization.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/jquery-notice-style.png" rel="prettyphoto[40500]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/jquery-notice-style.png?resize=449%2C250" alt="jquery-notice-style" class="aligncenter size-full wp-image-40617" /></a></p>\n<p>The sample plugin repackages the notification window with the <a href="https://github.com/sbrajesh/bp-live-notification-example-module/tree/master/assets/notify" target="_blank">jQuery notice plugin</a>. Check out a <a href="http://creativedream.net/plugins/jquery.notify/" target="_blank">live demo</a> to see how that style of notice is presented.</p>\n<p>If you don&#8217;t like how BP Live Notification styles its alerts by default, you can easily integrate a different jQuery notice plugin using the example Singh posted on GitHub. Searching the web will turn up a <a href="http://jqueryhouse.com/best-jquery-notification-plugins/" target="_blank">wide variety</a> of beautiful notification styles that you can adapt for use with BuddyPress.</p>\n<p>Both Twitter and Facebook use live notifications to keep users interacting on their social networks. When you receive a live notice, it confirms, in an almost tangible way, that you are at the center of where the social activity is happening. If you think this would benefit your BuddyPress network, download <a href="https://wordpress.org/plugins/bp-live-notification/">BP Live Notification</a> 2.0 for free from WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Mar 2015 02:07:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"WPTavern: How to Stay in the Loop if You Turn Off WordPress’ Automatic Updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40498";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wptavern.com/how-to-stay-in-the-loop-if-you-turn-off-wordpress-automatic-updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5514:"<p>When a critical <a href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended" target="_blank">security vulnerability was discovered in Yoast&#8217;s SEO plugin</a> this week, WordPress.org took the initiative to automatically update users&#8217; sites with the patched version of the plugin. Many users were taken by surprise, given that the WordPress codex clearly stated that automatic plugin and theme updates are disabled by default.</p>\n<p>Shortly after the automatic update rolled out, the <a href="http://codex.wordpress.org/Configuring_Automatic_Background_Updates" target="_blank">codex page</a> was updated to reflect the fact that in rare instances WordPress.org will automatically update your plugins and themes unless you opt to turn this feature off entirely. Many users are not comfortable with forced automatic updates, but the good news is that there is a filter to turn them off, including the WordPress.org security updates for popular plugins:</p>\n<pre class="brush: php; light: true; title: ; notranslate">add_filter( ''auto_update_plugin'', ''__return_false'' );</pre>\n<p>Prior to this security issue, users were not aware that they had to opt out of these forced updates. On one side of the fence there are those who think it&#8217;s no big deal and are thankful that WordPress.org is proactive on behalf of user security.</p>\n<p>On the other hand, there are those who are wary of forced updates from plugin authors who are notorious for pushing out problematic updates. The <a href="https://wordpress.org/support/plugin/wordpress-seo">support forum</a> for Yoast&#8217;s SEO plugin contains many threads regarding fatal errors following updates issued in the past.</p>\n<p>In this particular case, Nick Haskins <a href="http://nickhaskins.com/2015/03/on-automatic-wordpress-updates/" target="_blank">summarizes</a> why he was not comfortable with WordPress.org&#8217;s forced update:</p>\n<blockquote><p>The plugin in question is Yoast WordPress SEO. If you’re not familiar with his plugins, the history of updates is awful. In the last two weeks, I’ve updated twice, and both times have resulted in fatal PHP errors which require FTP’ing into the site, to manually remove the plugin. Both cases were due to not checking if a file exists before loading it.</p></blockquote>\n<p>Those who are not comfortable with WordPress.org&#8217;s forced update policy have the option to turn updates off for particular plugins or for all plugins. If you opt to go the route of turning automatic updates off, there are alternative ways that you can stay up-to-date on plugin releases.</p>\n<h3>Get Email Notices When Core, Plugin, and Theme Updates are Available</h3>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/air-mail.jpg" rel="prettyphoto[40498]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/air-mail.jpg?resize=1018%2C494" alt="photo credit: Par avion - (license)" class="size-full wp-image-40600" /></a>photo credit: <a href="http://www.flickr.com/photos/79016591@N07/13204207393">Par avion</a> &#8211; <a href="https://creativecommons.org/licenses/by-nd/2.0/">(license)</a>\n<p>No site admin can realistically be expected to log into his site(s) and check for update every day, let alone follow all the news surrounding plugin and theme security issues. The <a href="https://wordpress.org/plugins/wp-updates-notifier/" target="_blank">WP Updates Notifier</a> plugin will monitor your WordPress installation for updates and will send you an email as they become available. It includes the following features:</p>\n<ul>\n<li>Set the interval of how often to check for updates; hourly, twice daily or daily.</li>\n<li>Sets WordPress to check for updates more often meaning you get to know about updates sooner.</li>\n<li>Get emailed about core, plugin and theme updates.</li>\n<li>Chose if you want to be notified about active only themes and plugins updates.</li>\n<li>Remove upgrade nag message to non-admin users.</li>\n<li>For advanced users there are a number of filters and actions you can use.</li>\n</ul>\n<p>It would be truly awesome if WP Updates Notifier was also able to scan a plugin&#8217;s changelog for the word &#8220;Security&#8221; and tack it onto the email if it is applicable.</p>\n<p>WP Updates Notifier can be useful even if you&#8217;re comfortable allowing WordPress.org to perform occasional forced updates to themes and plugins for security. You may be using a plugin that is not nearly popular enough meet the criteria for a forced automatic update. Regardless, it may be useful for you to know as soon as there is an update available.</p>\n<p>The important thing is to stay in the loop about potential security issues and get patches as soon as they are available. <a href="https://wordpress.org/plugins/wp-updates-notifier/" target="_blank">WP Updates Notifier</a> lets you do that without having to allow any third party update core, plugins, or themes on your server. The plugin is most useful when you have only a handful of sites or fewer. Otherwise, it&#8217;s probably better to utilize a central dashboard service where you check in regularly to see updates across all of your sites at once.</p>\n<p>Your other alternative is to ditch plugins created by authors who you cannot trust to issue clean updates. That will put you in a better position to leave automatic background updates on, which is recommended for the vast majority of WordPress users.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 19:38:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"Post Status: Running a successful membership site in real life, with Jonathan Williamson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=7208";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"https://poststatus.com/running-a-wordpress-membership-website-jonathan-williamson/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:12427:"<p>Jonathan Williamson is the co-founder and COO of <a href="http://cgcookie.com/">CGCookie</a>, a membership website that provides as an educational resource for computer graphics and modeling. CGCookie has been around since 2008, and today is a network of five websites, has thousands of paying members, a team of six full time employees plus a number of contractors.</p>\n<p>CGCookie is built completely on WordPress and has a built in membership component. Some astute readers may recognize both the site and Jonathan&#8217;s name; Jonathan is <a href="https://twitter.com/pippinsplugins">Pippin Williamson&#8217;s</a> identical twin brother, and Pippin has worked with Jonathan on CGCookie many times. So, in this interview, you&#8217;re not listening to me talk to Pippin &#8212; though it sounds like it &#8212; but I&#8217;m talking to Jonathan Williamson.</p>\n<p>Jonathan is as passionate about CG, modeling, 3D printing, and the software that surrounds these disciplines as Pippin is about WordPress and programming. It was a pleasure to talk to Jonathan about what it&#8217;s like to run a membership site that runs on WordPress. I think this interview will be beneficial for those that want to run a membership site, and also those that work with clients who make their living off of their website.</p>\n<p><!--[if lt IE 9]><script>document.createElement(''audio'');</script><![endif]-->\n<a href="http://audio.simplecast.fm/9023.mp3">http://audio.simplecast.fm/9023.mp3</a><br />\n<a href="http://audio.simplecast.fm/9023.mp3">Direct Download</a></p>\n<p><a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">Or subscribe to the Post Status Draft podcast on iTunes!</a></p>\n<h3>How CGCookie evolved</h3>\n<p>CGCookie started as a blog with news, tutorials, and resources for CG enthusiasts. The first form of its monetization was by selling the source files for the various tutorials. Within about two years, Jonathan and co-founder Wes Burke decided to add a membership component that ended up working far better than they anticipated.</p>\n<p>Jonathan has been working full-time on CGCookie since around the summer of 2009. They originally launched on aMember, before eventually migrating to Pippin&#8217;s <a href="https://pippinsplugins.com/restrict-content-pro-premium-content-plugin/">Restrict Content Pro</a> plugin, along with <a href="https://easydigitaldownloads.com/">Easy Digital Downloads</a>.</p>\n<p>Today, CGCookie has more than 120,000 free users, and they have around 4,800 paid members.</p>\n<p>Since 2008, CGCookie have managed to not have a full time web developer until February of 2014, when they hired Nick Haskins. You may recognize Nick as the founder of <a title="Aesop, a Medium-esque “story engine” for WordPress" href="https://poststatus.com/aesop-medium-esque-story-engine-wordpress/">Aesop Stories</a> as well. Nick manages front-end development for the site, and they still don&#8217;t have a backend developer &#8212; though a backend developer and designer are on their roadmap.</p>\n<h3>How CGCookie&#8217;s eCommerce setup runs</h3>\n<p>Considering Jonathan is using his brother&#8217;s own plugins in the real world, it makes for a great avenue for feedback and insight for Pippin to improve those products.</p>\n<p>CGCookie is using Restrict Content Pro for <a href="https://cgcookie.com/membership/">memberships</a> themselves, and EDD plus the <a href="https://easydigitaldownloads.com/extensions/frontend-submissions/">Front-End Submissions</a> add-on for their <a href="http://cgcookiemarkets.com/blender/">marketplace</a>. We talked about whether EDD could be used for both, or if there is room for improvement in the marriage between the two systems, and he believes there is and that it&#8217;s a goal for the two plugins. For instance, currently, reporting and user management and a number of other features are independent between each plugin even though often times the users that utilize the system may overlap.</p>\n<p>I asked Jonathan about scaling WordPress and eCommerce for their large user base. He says that scaling for eCommerce has not been difficult, but with over a hundred thousand users, some default WordPress functionality has not scaled well; for instance, some admin areas create dropdowns for all users, which does not work well. Fortunately, there are some trac tickets in place currently to help solve some of these problems.</p>\n<h3>Prioritizing goals for a membership site</h3>\n<p>When discussing challenges running a membership site, Jonathan highlights the internal battles: balancing new features versus iterative improvements. Based on my short experience managing this membership site, I completely agree.</p>\n<p>For an example, Jonathan told me about a potential question and answer system to help his members get answers for specific technical topics that may be beyond the scope of a specific course. They believe a Stack Exchange style setup that allows them to refer their courses to specific questions would allow them to better serve their customers with the same content they already have.</p>\n<blockquote><p>How do you get people to find your content that answers their question, but you don&#8217;t have a way of just explicitly saying that these are the questions this course answers?</p></blockquote>\n<p>They&#8217;re considering a method of post to post relationships that direct courses as question answers and vice versa. For this feature and others, they try to do things with a short return on investment, but they also don&#8217;t want to be a slave to it. They sometimes do things &#8220;that are important to the quality of CGCookie, that never make a dime.&#8221; They removed ads last year under that very premise, to make CGCookie a better learning experience.</p>\n<h3>Not the only place to learn</h3>\n<p>Jonathan knows CGCookie isn&#8217;t the only place to learn, so they focus on creating an excellent community and learning experience for their customers.</p>\n<p>Realizing that our sites aren&#8217;t the only way to get certain information is an important thing to know to be able to better focus what we create for our users and why we create it.</p>\n<h3>Pricing for CGCookie</h3>\n<p>CGCookie has pricing for monthly, quarterly, or yearly pricing; all plans renew automatically unless explicitly cancelled. This is a feature they actively A/B test to see what&#8217;s working and what&#8217;s not.</p>\n<p>Behavior of customers varies between the three levels. Jonathan says that the users are more invested in their purchases (and getting more out of it) when they sign up for longer. Quarterly members have 10% longer lifetime memberships and spend three times longer on the site.</p>\n<p>However, they do have &#8220;a fair bit&#8221; of what I called &#8220;download and dash&#8221; members that sign up for a month, download a bunch of assets and cancel. Monthly memberships are also the most popular plan. They&#8217;ve considered locking down downloads for monthly signups but it&#8217;s not something they want to do unless it becomes a bigger problem; however they do lose money on those customers that download gigabytes of files and videos but only stay subscribed for one month.</p>\n<h3>Testing</h3>\n<p>During A/B tests, they have found that people will be just as likely to sign up for quarterly as monthly if monthly isn&#8217;t available, and quarterly members are more engaged. One thing they noted is that once people stick around for a few months, the average tenure of a user skyrockets; they have some users that have been a paying member as long as the site has been running.</p>\n<p>One of my big takeaways talking to Jonathan was about how significant testing can be. Their tests help them decide on the optimal pricing and payment plans to maximize a lifetime value.</p>\n<p>For testing, insights, and statistics they use <a href="https://www.optimizely.com/">Optimizely</a>, <a href="https://mixpanel.com/">Mixpanel</a>, and Google Analytics.</p>\n<p>Mixpanel allows you to create custom events in your software, and does require some code knowledge, but it can deliver valuable insights if you use it correctly. Jonathan notes, &#8220;It&#8217;s basically as comprehensive as you make it.&#8221;</p>\n<p>They can also mesh tools. They can track which A/B test from Optimizely a customer signed up with, and then use Mixpanel to track what they did and how they did it. They can get login metrics, renewal numbers, and more for each plan and signup flow.</p>\n<p>Mixpanel requires PHP and JavaScript knowledge to utilize, but Optimizely has an extensive visual interface that doesn&#8217;t require code knowledge to utilize.</p>\n<h3>What encourages membership signups</h3>\n<p>&#8220;It varies day to day, week to week, month to month,&#8221; in regard to how their signups work. A bad month in the economy can make their signups go down. Sometimes quarterly users will spike while monthly users are steady.</p>\n<p>Their biggest thing that affects signup rates is customer support. Some presale, but also support for new members to help answer questions and get people engaged. <span class="pullquote alignright">When we can help someone answer the question, &#8220;Where do I go next?&#8221;, we are able to keep them for a long time.</span></p>\n<p>They have one or two courses that drive a ton of traffic to their site, and it is therefore their largest onboarding channel for new members. However, they don&#8217;t have a silver bullet for what it takes to get new users. They are always trying new things.</p>\n<h3>On competing and the industry</h3>\n<p>Jonathan doesn&#8217;t see themselves as a part of a singular industry. While many think of CG as a part of the film industry, it&#8217;s one of dozens of potential applications, and they don&#8217;t want to narrow themselves to a particular one.</p>\n<p>They also poll users to get a feel for who they are and what industry actual users come from. Based on around a thousand responses, they had no real pattern at all. The results were all over the board.</p>\n<p>So they don&#8217;t want to compete with a film tutorials site or any other industry site. They want to focus on the tool itself. They want to teach people how to use Blender and show them how it can be applied to various industries their users are a part of.</p>\n<h3>Advice for those running membership sites</h3>\n<blockquote><p>&#8220;Build your community would be the main one. It&#8217;s one thing to offer a really good product. It&#8217;s one thing to build a really good website. But if you don&#8217;t have the community behind you that&#8217;s going to be willing to trust in you with their wallet &#8230; it&#8217;s not going to go anywhere long term, sustainably.&#8221;</p></blockquote>\n<p>Jonathan says it&#8217;s about building the community as well as the sense of trust within that community. He believes that customers will want to know that not only the content will be worth it, but that it will continue to be worth it &#8212; and that the communication and support from the team behind the site will be consistent as well.</p>\n<p>He believes that subscriptions and products are very different. With a subscription, the interaction is just as or far more important than specific content itself.</p>\n<p>When he refers to community, he doesn&#8217;t mean it has to be strictly through something like a forum. He considers it a broad term, and for them it evolved out of their Blender community user base. At the time we recorded this, they didn&#8217;t have forums, a dedicated chat system, or an actual community integration part &#8212; though <a href="http://community.cgcookie.com/">they have opened a forum</a> since we chatted. But the community exists and thrives within comments and their gallery functionality.</p>\n<h3>Wrapping up</h3>\n<p>Jonathan is full of great advice and I could listen to him talk about membership sites for a long time. I have no experience with CG but at the end of this interview he had me wanted to go build something with Blender.</p>\n<p>You can (and should) keep up with <a href="https://twitter.com/carter2422">Jonathan on Twitter</a>, or perhaps you&#8217;ll see him at a conference near you &#8212; but you&#8217;ll probably think it&#8217;s Pippin at first. Also be sure to checkout <a href="http://cgcookie.com/">CGCookie&#8217;s website</a>; it&#8217;s really great.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 17:01:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"Matt: Love is the light that sparked when only darkness existed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:79:"http://ma.tt/2015/03/love-is-the-light-that-sparked-when-only-darkness-existed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://ma.tt/2015/03/love-is-the-light-that-sparked-when-only-darkness-existed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:186:"<p>&nbsp;<img alt="" src="http://i1.wp.com/ma.tt/files/2015/03/IMG_5196.jpg?resize=604%2C466" title="" class="size-custom" /></p>\n<p>Taken in Houston today. Happy birthday Mom!&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 15:49:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Matt: Government Taking Over Internet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44766";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://ma.tt/2015/03/government-taking-over-internet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:569:"<p>Since the Title II ruling from the FCC there&#8217;s been a lot of partisan rhetoric about the government taking over the internet, <a href="http://ma.tt/2015/02/net-neutrality-win/">even in the comments of this very blog</a>. I just came across Brad Feld&#8217;s post, <a href="http://feld.com/archives/2015/02/final-thoughts-fcc-title-ii-ahead-tomorrows-vote-net-neutrality.html">Some Final Thoughts on the FCC and Title II Ahead of Tomorrow&#8217;s Vote on Net Neutrality</a> and he does an awesome job breaking down and addressing each of the misconceptions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 02:06:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WordPress 4.2 Beta 1 Now Available for Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40568";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wptavern.com/wordpress-4-2-beta-1-now-available-for-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3336:"<p><a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/" target="_blank">WordPress 4.2 beta 1</a> is now available for early testers to download. It&#8217;s &#8220;pencils down&#8221; time for core contributors as far as new feature requests are concerned. This is the point in the release cycle where contributors are focusing their efforts on bug fixes and inline documentation.</p>\n<p>Drew Jaynes, the 4.2 release lead, posted the <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/" target="_blank">beta release announcement</a> and summarized the main features that could use further testing. The <a href="http://wptavern.com/preview-the-press-this-bookmarklet-redesign-alpha-plugin-now-ready-for-testing" target="_blank">Press This bookmarklet feature has been totally redeigned</a> to be more intuitive and mobile-friendly. If you want to test it out, install the beta and then navigate to the Tools screen in the admin.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/press-this-featured.jpg" rel="prettyphoto[40568]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/press-this-featured.jpg?resize=898%2C408" alt="press-this-featured" class="aligncenter size-full wp-image-24221" /></a></p>\n<p>Jaynes also encourages users to test drive the new theme browsing and switching capabilities that are now built into the customizer. &#8220;We’re especially interested to know if this helps streamline the process of setting up your site,&#8221; he said.</p>\n<p>The customizer theme switcher is one of the more controversial additions to this release. The new feature was met with a significant amount of resistance from our commenters when it was <a href="http://wptavern.com/customizer-theme-switcher-approved-for-merge-into-wordpress-4-2" target="_blank">approved for merge into WordPress 4.2</a>.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg" rel="prettyphoto[40568]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg?resize=1025%2C473" alt="customizer-theme-switcher" class="aligncenter size-full wp-image-38931" /></a></p>\n<p>The installation and update process for plugins has been beautifully re-tooled to provide a smoother, more convenient experience where users can perform these actions without leaving the Plugins screen. Feel free to leave any feedback on the corresponding <a href="https://core.trac.wordpress.org/ticket/29820" target="_blank">ticket</a> for this improvement.</p>\n<p>WordPress 4.2 also <a href="http://wptavern.com/wordpress-4-2-on-track-to-expand-core-support-for-emoji" target="_blank">expands core support for emoji</a>. Jaynes suggested that users go to town on testing it everywhere.</p>\n<p>&#8220;If you felt like emoji were starkly missing from your content toolbox, worry no more,&#8221; he said. &#8220;We’ve added emoji support nearly everywhere, even post slugs.&#8221;</p>\n<p>According to the current <a href="https://make.wordpress.org/core/version-4-2-project-schedule/" target="_blank">4.2 project schedule</a>, the official release is targeted for the week of April 22nd. A series of betas and at least one release candidate are likely to precede the official release during the course of the next month.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 00:01:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WPWeekly Episode 183 – Backing Up The Backup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=40559&preview_id=40559";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wptavern.com/wpweekly-episode-183-backing-up-the-backup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4337:"<p>In this episode of WordPress Weekly, <a title="http://onlinebizcoach.com/" href="http://onlinebizcoach.com/">Marcus Couch</a> and I discuss a lot of different stories. We share our opinions on the redesigned theme and plugin directories. We discuss CodeGuard&#8217;s survey results that indicate WordPress users need a lot more education on backup plugins, strategies, and services. Last but not least, we discuss the WordPress history book. Near the end of the show, Marcus describes a new venture he&#8217;s pursuing to help coach online businesses.</p>\n<h2>Stories Discussed:</h2>\n<p><a title="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1" href="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1">WordPress Version Stats Updated: More Than 1/3 of Sites are Running WordPress 4.1</a><br />\n<a title="http://wptavern.com/wordpress-plugin-directory-launches-new-design" href="http://wptavern.com/wordpress-plugin-directory-launches-new-design">WordPress Plugin Directory Launches New Design</a><br />\n<a title="http://wptavern.com/wordpress-theme-directory-launches-new-design" href="http://wptavern.com/wordpress-theme-directory-launches-new-design">WordPress Theme Directory Launches New Design</a><br />\n<a title="http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review" href="http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review">Version One of The WordPress History Book is Ready For Review</a><br />\n<a title="http://wptavern.com/wordpress-publishes-security-white-paper" href="http://wptavern.com/wordpress-publishes-security-white-paper">WordPress Publishes Security White Paper</a><br />\n<a title="http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress" href="http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress">CodeGuard Survey Shows More Education is Needed on Backup Software, Services, and Strategies For WordPress</a><br />\n<a title="http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities" href="http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities">bbPress 2.5.5 Released, Patches Three Potential Security Vulnerabilities</a><br />\n<a title="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended" href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended">Blind SQL Injection Vulnerability Discovered in WordPress SEO Plugin by Yoast: Immediate Update Recommended</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/custom-upload-folders-plus/" href="https://wordpress.org/plugins/custom-upload-folders-plus/">Custom Upload Folders Plus</a> lets you organize file uploads by file type and logged in users.</p>\n<p><a title="https://wordpress.org/plugins/scratchpad/" href="https://wordpress.org/plugins/scratchpad/">Scratchpad</a> lets you keep running notes when composing your posts. It can be used to keep an outline for the post, be visible next to the post, or to have a list of links or snippets to refer to.</p>\n<p><a title="https://wordpress.org/plugins/gravity-buttons/" href="https://wordpress.org/plugins/gravity-buttons/">Gravity Buttons</a> is a powerful button creation plugin that allows anyone to create great-looking CSS3 buttons that can be used anywhere on your site.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 18th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #183:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 22:58:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"WPTavern: Is a WordPress Plugin a Startup?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wptavern.com/is-a-wordpress-plugin-a-startup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8949:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/petersuhm.jpeg" rel="prettyphoto[40528]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/petersuhm.jpeg?resize=150%2C150" alt="petersuhm" class="alignright size-thumbnail wp-image-40534" /></a>This post was contributed by guest author <a href="http://petersuhm.com/" target="_blank">Peter Suhm</a>. Peter is a web developer from the Land of the Danes. He is the creator of <a href="http://wptavern.com/wp-pusher-aims-to-provide-pain-free-deployment-of-wordpress-themes-and-plugins-from-github" target="_blank">WP Pusher</a> and a huge travel addict, bringing his work along with him as he goes.<br />\n&nbsp;</p>\n<hr />\n<p>About two months ago, I released my first commercial WordPress product, <a href="https://wppusher.com/" target="_blank">WP Pusher</a>, a plugin that makes deploying themes and plugins really easy. WP Pusher was not meant to be &#8220;just a plugin&#8221;. It was supposed to be a SaaS product, and throughout it all, when I was building it, I always thought of it as a startup I was creating.</p>\n<p>For &#8220;just a WordPress plugin&#8221;, I think it has been quite successful so far, and to a large extent, I believe that to be a result of my own perception of the whole thing. I think it was more successful because, even after I realized it was just going to be a plugin, I still treated it as a startup.</p>\n<h2>What Is a Startup?</h2>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/office.jpeg" rel="prettyphoto[40528]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/office.jpeg?resize=1025%2C493" alt="office" class="aligncenter size-full wp-image-40552" /></a></p>\n<p>In the fall of 2014, I was traveling around Southeast Asia, enjoying the digital nomad lifestyle, while making WP Pusher. I spent quite a bit of time in Chiang Mai, the capital of digital nomads, and everyone was talking about a guy named Pieter Levels, who did all kinds of cool things, all related to digital nomadism. One of these things was to take up the challenge of building a new startup every month for 12 months.</p>\n<p>Hearing people talk about Pieter&#8217;s startup quest got me thinking about the term &#8220;startup&#8221;. Honestly, when I first heard about it, I did not think of the 12 startups as real startups &#8211; which Pieter obviously did. To me, creating a portfolio of 12 startups in such a short time seemed a bit silly. In my head, a real startup required more dedication and commitment than that.</p>\n<p>In the meantime, some of Pieter&#8217;s startups have been really successful and the whole process has been really inspiring to follow. I now understand that my idea of a startup was missing some pieces. All of the 12 projects that Pieter created qualified as startups. Some of them were more successful than others, but he validated 12 ideas in a short time and the result is really impressive. And one thing, which is very important, is that Pieter treated all of the 12 projects as startups instead of just another side project (which is how many developers talk about their projects). Calling something a side project is an easy way of protecting yourself against your fear of failure.</p>\n<p>If you ask Steve Blank about his definition of a startup, he will tell you that <a href="http://steveblank.com/2010/01/25/whats-a-startup-first-principles/" target="_blank">&#8220;a startup is an organization formed to search for a repeatable and scalable business model&#8221;</a>. If we break that up, “an organization” can mean anything. It can be you alone or it can be a team. “Repeatable” and “scalable” are two sides of the same coin.</p>\n<p>Building a WordPress plugin and calling it a day is not enough. That is not a startup. Honestly, to me, “repeatable“ is the main factor. I am in it for the freedom &#8211; not the empire building. I want a business to be repeatable in the sense that I can teach someone else how to run it for me &#8211; hence, freedom. It does not have to be scalable in order to put food on my table or allow me to travel around the world &#8211; it just has to be profitable.</p>\n<p>WordPress offers a giant market full of small niches and potential customers. There is no reason why something you are building for WordPress could not be as huge as any other software startup. The market share of the WordPress platform is <a href="http://w3techs.com/technologies/overview/content_management/all/" target="_blank">large enough</a>.</p>\n<p>In relation to the Steve Blank quote, what could you do to make your WordPress plugin a startup instead of a side project? First of all, you need to think about the &#8220;organization&#8221;. Most likely, you are the programmer or the engineer behind your product. But do you know how to design a shiny, high-converting landing page? Do you have any clue about how to approach marketing or customer relations? What about the legal and financial aspects? Maybe you do. If you do not, you need to either be willing to learn or team up with someone who does. At the very minimum, you need to at least consider it.</p>\n<p>How can you build a business around a WordPress plugin that is more &#8220;repeatable&#8221; and &#8220;scalable&#8221;? Well, you could do most of the things that other startups do. Here are a few questions to consider:</p>\n<ul>\n<li>Could you charge more or offer more expensive options?</li>\n<li>Could you turn your plugin into a SaaS or find something that you could charge for on a recurring basis?</li>\n<li>Could you sell additional add-ons or extensions for your plugin?</li>\n<li>Could you offer a service in addition to your plugin?</li>\n<li>Given you solve some kind of pain for your customers, could you copy your idea to other niches or customer segments?</li>\n<li>Could you come up with ways to attract more customers on a recurring basis? (SEO, content marketing, advertising etc.)</li>\n<li>Could you have someone else help you find new customers? (copywriters, affiliate partners etc.)</li>\n</ul>\n<p>You get it.</p>\n<h2>Solving Your Own Problems vs. Solving Other People&#8217;s Problems</h2>\n<p>A very important point I want to make relates to the business idea of your WordPress plugin. In a market like WordPress, programmers tend to be tempted to find solutions to their own problems &#8211; not necessarily other people&#8217;s problems. Finding a solution for a problem you have yourself is a good place to start and great for motivation, domain knowledge and so on, but it is not enough.</p>\n<p>If you want it to be a business, you need to make sure that other people have the same problem and are willing to pay for it. Startups are not made to solve their own problems. The original business idea behind the startup might have been to solve a problem the founder had, but if the only customer in the startup is going to be the founder alone, it is not a very good business model. You need to figure out how you can make your product relevant to more people &#8211; not everyone of course, but more people than yourself.</p>\n<p>As an example, WP Pusher solves a problem I had with clients. There were already solutions to this problem &#8211; both free and paid. Most of them required either Git installed or that I granted them access to my clients&#8217; servers. Given I am actually in control of, or at least have an influence over, most of the server environments of my clients, I could in theory have used one of these existing solutions.</p>\n<p>However, I knew that was not the case for a lot of WordPress developers. I saw the possibility of solving my own problem as well as solving a problem I knew a lot of other developers had. Reading about Pieter&#8217;s 12 startups inspires me to build more products for WordPress. Solve more problems. Build more startups.</p>\n<h2>Say It Out Loud</h2>\n<p>When I thought WP Pusher was going to be a SaaS business, I thought of it as a startup. When I decided to change the business model and rebuild it all as a single plugin, it felt weird calling it a business &#8211; or even a startup. For a short time I think I phrased it as &#8220;just a project for WordPress&#8221;, when telling people about it.</p>\n<p>Personally, I still like to think of it as a startup. I kept the landing page I built for the SaaS and I kept the blog I set up. I kept everything that I initially made when it was a &#8220;startup&#8221; I was working on. Today, I have made a conscious decision that it is in fact a startup &#8211; no matter how big or small it is.</p>\n<p>WP Pusher has many characteristics of a startup. It solves a very obvious pain point that is easy to communicate. It has a simple business model in a very large market. And finally, it has a logo and it has a nice landing page. That is a startup right there.</p>\n<p>What are you missing before you can confidently call your WordPress plugin a startup?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 21:28:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"Matt: Portland + Phoenix Press Publish Events";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44801";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://ma.tt/2015/03/portland-phoenix-press-publish-events/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:775:"<p>We&#8217;re organizing an exciting <a href="http://presspublish.events/">new conference series focused on blogging, called Press Publish</a>. The speaker list has some really awesome folks on it, and will include notable WordPress bloggers telling their stories as well as <a href="http://automattic.com/">Automattic</a> employees teaching tutorials and workshops. Plus, WordPress.com Happiness Engineers will be ready and waiting to help people one-on-one with their blogs.</p>\n<p>The first two events are in <strong>Portland</strong> on March 28 and in <strong>Phoenix</strong> on April 18, and <a href="http://presspublish.events/register/?tix_coupon=MATTBLOG">if you register with this link in the next week or so you get a discount</a>, special for Ma.tt readers.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 04:58:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WPTavern: EDD 2.3 Introduces New Customer Management Interface and Performance Improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40484";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:101:"http://wptavern.com/edd-2-3-introduces-new-customer-management-interface-and-performance-improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4339:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EasyDigitalDownloadsFeaturedImage.png" rel="prettyphoto[40484]"><img class="aligncenter size-full wp-image-40496" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EasyDigitalDownloadsFeaturedImage.png?resize=620%2C223" alt="EasyDigitalDownloadsFeaturedImage" /></a></p>\n<p>Easy Digital Downloads 2.3 is <a title="https://easydigitaldownloads.com/blog/version-2-3-released/" href="https://easydigitaldownloads.com/blog/version-2-3-released/">available for download</a> and includes new features along with performance improvements. One of the highlights is the new customer management interface. The improved interface lets you quickly browse customer data in an intuitive fashion. There&#8217;s also some new API&#8217;s that allow developers to interact with customer data behind the scenes.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EDD23CustomerManagmentInterface.png" rel="prettyphoto[40484]"><img class="size-full wp-image-40487" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EDD23CustomerManagmentInterface.png?resize=1025%2C808" alt="New Customer Management Interface" /></a>New Customer Management Interface\n<p>File download URLs are more secure, have better performance, and are more reliable. URLs now contain secure tokens and expiration dates to maintain the security of files. This decreases the likelihood of individuals being able to tamper with downloadable files. URLs are also shorter and easier to share.</p>\n<p>EDD 2.3 significantly improves stat tracking. For example, when you add or remove Download products on an existing payment record, the earnings and sales for the affected products are now properly updated when the payment record is saved. Performance improvements to reports include:</p>\n<ul>\n<li>Tax reports are now much more efficient</li>\n<li>A race condition related to the update process for Download earnings / sales has been resolved</li>\n<li>Individual customer stats are now much more performant</li>\n<li>The Sales / Earnings widget on the Dashboard now loads via Ajax to improve the first-load performance</li>\n</ul>\n<p>According <a title="https://twitter.com/chriscct7/status/575724923899023360" href="https://twitter.com/chriscct7/status/575724923899023360">to Chris Christoff</a>, core developer of EDD, the product has officially passed 10,000 commits made by 121 people since its inception on Github. Pippin Williamson, founder of EDD, states on Twitter that even though the release adds substantial features, the code base has shrunk significantly.</p>\n<blockquote class="twitter-tweet" width="550"><p>Thanks to the keen eyes of <a href="https://twitter.com/andyfragen">@andyfragen</a>, it''s been noticed that the EDD code base shrunk significantly with 2.3, even though we add a LOT</p>\n<p>&mdash; Pippinsplugins (@pippinsplugins) <a href="https://twitter.com/pippinsplugins/status/575721400650043392">March 11, 2015</a></p></blockquote>\n<p></p>\n<p>EDD 2.3 has eight other notable improvements:</p>\n<ul>\n<li>Download products can now be added to the cart with multiple price IDs at one time</li>\n<li>Better support for the <a href="https://wordpress.org/plugins/polylang/" target="_blank">Polylang</a> plugin has been added</li>\n<li>PayPal Buy Now buttons no longer create pending payment records on each click</li>\n<li>A new {ip_address} email tag has been added</li>\n<li>Numerous new action hooks and filters have been added for developers</li>\n<li>Numerous translation files have been added and several new languages as well</li>\n<li>The display of items in the cart widget has been improved to properly show quantities</li>\n<li>A large number of minor PHP issues have been resolved</li>\n</ul>\n<p>The full list of bugs and improvements is <a title="https://github.com/easydigitaldownloads/Easy-Digital-Downloads/issues?q=is%3Aissue+milestone%3A2.3+is%3Aclosed" href="https://github.com/easydigitaldownloads/Easy-Digital-Downloads/issues?q=is%3Aissue+milestone%3A2.3+is%3Aclosed">available on Github</a>. You can <a title="https://wordpress.org/plugins/easy-digital-downloads/" href="https://wordpress.org/plugins/easy-digital-downloads/">download 2.3</a> from the WordPress plugin directory or update from within WordPress by visiting the Updates screen.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 23:18:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WPTavern: WordPress Foundation Website Gets a Redesign";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40035";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wptavern.com/wordpress-foundation-website-gets-a-redesign";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3663:"<p>The <a href="http://wordpressfoundation.org/" target="_blank">WordPress Foundation</a> website is sporting a fresh coat of paint, based on the Twenty Fifteen default theme released with <a href="http://wptavern.com/wordpress-4-1-dinah-released" target="_blank">WordPress 4.1</a> last December. The foundation exists to further the mission of the open source project, most importantly by ensuring free access to the software for years to come. It also serves to protect the WordPress-related trademarks and educate the public about the software.</p>\n<p>With that mission at its core, it&#8217;s fitting that the foundation selected Twenty Fifteen for the new look. Matt Mullenweg, founder of the organization, <a href="https://twitter.com/photomatt/status/573256190462984192" target="_blank">identified</a> Automattic employee <a href="https://twitter.com/NickHamze" target="_blank">Nick Hamze</a> as responsible for the foundation&#8217;s updated design.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-foundation.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-foundation.png?resize=1025%2C703" alt="wordpress-foundation" class="aligncenter size-full wp-image-40473" /></a></p>\n<p>When we offered a <a href="http://wptavern.com/first-look-at-designs-for-the-twenty-fifteen-default-wordpress-theme" target="_blank">first look at the design of Twenty Fifteen</a> prior to its release, readers made it clear that this theme would be more enthusiastically received than any other default theme in WordPress&#8217; recent history. Twenty Fifteen offers users a clean canvas that easily lends itself to customization.</p>\n<p>Nick Hamze&#8217;s personal <a href="http://blog.nickhamze.com/" target="_blank">blog</a> is another beautiful example of a Twenty Fifteen customization in the wild.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/nick-hamze.png" rel="prettyphoto[40035]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/nick-hamze.png?resize=1025%2C688" alt="nick-hamze" class="aligncenter size-full wp-image-40474" /></a></p>\n<p>WordCamps in particular are making excellent use of the default theme as a base for their event websites. <a href="http://maine.wordcamp.org/2015/" target="_blank">WordCamp Maine 2015</a> is a prime example of how designers are creatively adapting Twenty Fifteen:</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-maine.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-maine.png?resize=1025%2C713" alt="wordcamp-maine" class="aligncenter size-full wp-image-40475" /></a></p>\n<p><a href="http://london.wordcamp.org/2015/" target="_blank">WordCamp London 2015</a> organizers used the default theme to bring a grunge look to their site with the help of Google fonts and spray paint style backgrounds.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-london.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-london.png?resize=1025%2C713" alt="wordcamp-london" class="aligncenter size-full wp-image-40477" /></a></p>\n<p>Armed with a unique background image and a little bit of color inspiration, it&#8217;s easy for anyone to make their own totally unique version of Twenty Fifteen. Thanks to the options built into the customizer, you may not even need to create a child theme.</p>\n<p>Where else have you seen <a href="https://wordpress.org/themes/twentyfifteen/" target="_blank">Twenty Fifteen</a> in the wild?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 22:44:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WPTavern: Akismet Improves User Privacy by Encrypting API Calls";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40459";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wptavern.com/akismet-improves-user-privacy-by-encrypting-api-calls";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2837:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/AkismetSSLFeaturedImage.png" rel="prettyphoto[40459]"><img class="size-full wp-image-40462" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/AkismetSSLFeaturedImage.png?resize=656%2C301" alt="Akismet SSL Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/61423903@N06/7557181168">Secure Cloud Computing</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>Akismet 3.1 <a title="https://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/" href="https://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/">is available for download</a> and contains a bug fix that prevents it from inadvertently modifying a comment’s content during the spam filtering process. In addition to the bug fix, calls made to the Akismet API are now encrypted via SSL.</p>\n<p>While it may not seem like much on the surface, encrypting communications between WordPress and Akismet is an important change that increases the privacy of those who leave comments on your site. Christopher Finke, who works on the Akismet development team, explains why:</p>\n<blockquote><p>Akismet&#8217;s API is being offered over SSL for the same reason that all <a href="http://wordpress.com">wordpress.com</a> subdomains are <a title="https://en.blog.wordpress.com/2014/06/05/reset-the-net/" href="https://en.blog.wordpress.com/2014/06/05/reset-the-net/">now served over SSL by default</a>. Encrypting that connection decreases the chances of surveillance by a third-party. No matter what a commenter is writing about, sending their comment to be checked using SSL ensures that it will only be read by those who are meant to read it.</p></blockquote>\n<p>The move is part of a larger effort to apply SSL across WordPress.com and WordPress.org. In late 2014, almost all of WordPress.org <a title="https://make.wordpress.org/meta/2014/09/23/wordpress-org-is-now-forced-ssl/" href="https://make.wordpress.org/meta/2014/09/23/wordpress-org-is-now-forced-ssl/">was transitioned</a> to load over SSL/HTTPS. As part of the security hardening process of WordPress 3.7, <a title="http://codex.wordpress.org/WordPress.org_API" href="http://codex.wordpress.org/WordPress.org_API">api.wordpress.org,</a> which handles theme, plugin, and core updates, was forced to use SSL if the webserver supports it.</p>\n<p>If you&#8217;re not sure what SSL is or would like to learn how to implement it on your site, read the <a title="https://make.wordpress.org/support/user-manual/web-publishing/https-for-wordpress/" href="https://make.wordpress.org/support/user-manual/web-publishing/https-for-wordpress/">HTTPS section in the WordPress user manual</a>. It has an introduction to the protocol and provides tips on implementing, tweaking, and applying good practices</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 21:12:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:117:"WPTavern: Blind SQL Injection Vulnerability Discovered in WordPress SEO Plugin by Yoast: Immediate Update Recommended";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40433";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:126:"http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4095:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/yoast.jpg" rel="prettyphoto[40433]"><img class="aligncenter size-full wp-image-40456" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/yoast.jpg?resize=1025%2C457" alt="yoast" /></a></p>\n<p>A blind SQL injection vulnerability was discovered today in the popular <a href="https://wordpress.org/plugins/wordpress-seo/" target="_blank">WordPress SEO plugin by Yoast</a>. WPScanVulnerability Database <a href="https://wpvulndb.com/vulnerabilities/7841" target="_blank">issued an advisory</a> after responsibly disclosing the vulnerability to the plugin&#8217;s author:</p>\n<blockquote><p>The latest version at the time of writing (1.7.3.3) has been found to be affected by two authenticated (admin, editor or author user) Blind SQL Injection vulnerabilities.</p>\n<p>The authenticated Blind SQL Injection vulnerability can be found within the &#8216;admin/class-bulk-editor-list-table.php&#8217; file. The orderby and order GET parameters are not sufficiently sanitized before being used within a SQL query.</p></blockquote>\n<p>Yoast was quick to respond with a patch and released version 1.7.4 with the following security fix:</p>\n<blockquote><p>Fixed possible CSRF and blind SQL injection vulnerabilities in bulk editor. Added strict sanitation to order_by and order params. Added extra nonce checks on requests sending additional parameters. Minimal capability needed to access the bulk editor is now Editor. Thanks <a href="https://github.com/ethicalhack3r" target="_blank">Ryan Dewhurst</a> from WPScan for discovering and responsibly disclosing this issue.</p></blockquote>\n<h3>Immediate Update Advised</h3>\n<p>Users running the most recent version are advised to update immediately. If you&#8217;re using Jetpack on all your sites, you can quickly update them by visiting: <a href="https://wordpress.com/plugins/wordpress-seo" target="_blank">https://wordpress.com/plugins/wordpress-seo</a>. There you will see all the sites where you have the plugin installed and can update from your centralized dashboard.</p>\n<p>Hosting companies are scrambling to add a fix to protect customers. The Pressable status blog sent out an <a href="http://status.pressable.com/2015/03/11/wordpress-seo-vulnerability/" target="_blank">advisory</a> on the vulnerability and is immediately updating installations where the plugin is active:</p>\n<blockquote><p>Our systems have already begun updating this plugin across all impacted sites on our systems, and we expect this process to be completed shortly.</p></blockquote>\n<p>SiteGround has added a <a href="https://www.siteground.com/blog/wordpress-seo-by-yoast-vulnerability/" target="_blank">temporary fix</a> to tide customers over in the meantime before they have the chance to update. The company added new security rules to its WAF (web application firewall), which will actively filter any possible incoming hacking attempts that try to exploit the vulnerability.</p>\n<blockquote class="twitter-tweet" width="550"><p>Our security team has just added a fix to protect customers from a vulnerability in <a href="https://twitter.com/hashtag/WP?src=hash">#WP</a> SEO plugin by Yoast <a href="https://t.co/nP9qrJaO0x">https://t.co/nP9qrJaO0x</a></p>\n<p>&mdash; SiteGround (@SiteGround) <a href="https://twitter.com/SiteGround/status/575701133550878720">March 11, 2015</a></p></blockquote>\n<p></p>\n<p><a href="https://wordpress.org/plugins/wordpress-seo/" target="_blank">WordPress SEO by Yoast</a> is active on more than one million websites. While many hosts are being proactive about getting plugin updates to customers, most of the plugin&#8217;s users will not be able to rely on their host to take care of the update. Keeping your site safe from the vulnerability is as easy as logging in and updating to the latest version.</p>\n<p><em><strong>Update</strong></em> Joost de Valk <a title="https://yoast.com/wordpress-seo-security-release/" href="https://yoast.com/wordpress-seo-security-release/">published an update</a> discussing the vulnerabilities and what is fixed.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 18:13:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Akismet: Akismet 3.1 Plugin for WordPress Released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1794";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1197:"<p>Version 3.1 of <a href="http://wordpress.org/plugins/akismet/">the Akismet plugin for WordPress</a> is now available.</p>\n<p>As of version 3.1, all calls to the Akismet API are now made using SSL, increasing the confidentiality of your commenters&#8217; data as it travels over the wire.  Developers of other Akismet libraries are now free to use <code>https</code> URLs for Akismet API endpoints as well.</p>\n<p>This update also includes a bugfix that prevents Akismet from inadvertently modifying a comment&#8217;s content during the spam filtering process.</p>\n<p>To upgrade, visit the Updates page of your WordPress dashboard and follow the instructions. If you need to download the plugin zip file directly, links to all versions are available in <a href="http://wordpress.org/plugins/akismet/">the WordPress plugins directory</a>.</p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1794/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1794/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1794&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 17:00:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Christopher Finke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: Lessons from Jetpack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44701";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://ma.tt/2015/03/lessons-from-jetpack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:375:"<blockquote><p>Personally I can say that it was the Jetpack features that helped provide the defaults that got me hooked on WordPress. If it weren’t for that, I wouldn’t be where I am today.</p></blockquote>\n<p>Josh Pollock at Torque writes about <a href="http://torquemag.io/lessons-can-learn-jetpack-helped-wordpress-succeed/">Lessons we can learn from Jetpack</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 03:01:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: Mentionable Plugin Adds @mentions for WordPress Content with Inline Autocomplete";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39424";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:99:"http://wptavern.com/mentionable-plugin-adds-mentions-for-wordpress-content-with-inline-autocomplete";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3037:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/01/links.jpg" rel="prettyphoto[39424]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/01/links.jpg?resize=1024%2C508" alt="photo credit: gordon2208 - cc" class="size-full wp-image-36986" /></a>photo credit: <a href="https://www.flickr.com/photos/gordon2208/4987669000/">gordon2208</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-nd/2.0/">cc</a>\n<p>Finding and linking to previously published content on your site is a daily necessity for bloggers and content managers. Usually, you have to search the frontend of your site or search posts/pages in the admin to track down the content you&#8217;re trying to link.</p>\n<p><a href="https://wordpress.org/plugins/mentionable/" target="_blank">Mentionable</a> is a handy tool, created by the folks at <a href="https://xwp.co/" target="_blank">XWP</a>, that saves a lot of time on internal linking. The plugin adds @mentions to the visual editor with autocomplete for any content published on the site, including posts, pages, media, and custom post types.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/mentionable.png" rel="prettyphoto[39424]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/mentionable.png?resize=843%2C438" alt="mentionable" class="aligncenter size-full wp-image-40405" /></a></p>\n<p>Mentionable includes a settings panel for specifying the post types for which the plugin will be active. You can also select the post types that the auto-completion will match against. Users can further customize the plugin by replacing the mentionable tag with a custom <em>mentionable.php</em> template.</p>\n<p>The support for custom post types means that users can call out recipes, books, movies, products, or posts from any registered content type as links within pages or posts. This makes it easy to link to the backstory for new content, put together quick reference lists, cross promote products, etc. &#8211; all without ever having to leave the post editor.</p>\n<p>I tested the plugin and found that it works as advertised. When mentioning a post you don&#8217;t even have to start with the first word of the post title. The autocomplete will pick up any word found in a title, in case your memory of the exact title is foggy.</p>\n<p>If you decide later on that you don&#8217;t want to use the plugin anymore, it won&#8217;t affect any of the links you created previously. Your content remains intact even after the plugin is deactivated and uninstalled.</p>\n<p>A healthy amount of internal linking is often recommended for boosting your site&#8217;s SEO. According to Moz, <a href="http://moz.com/learn/seo/internal-link" target="_blank">internal links</a> are critical for establishing site architecture and spreading link juice. If you&#8217;re not in the habit of linking to your own content, the <a href="https://wordpress.org/plugins/mentionable/" target="_blank">Mentionable</a> plugin will help you do it with minimal effort.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 01:17:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"WPTavern: Delicious Brains Publishes In-depth Guides on The WordPress Database";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40388";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://wptavern.com/delicious-brains-publishes-in-depth-guides-on-the-wordpress-database";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1896:"<p><a title="https://deliciousbrains.com/" href="https://deliciousbrains.com/">Delicious Brains</a>, the creators of <a title="https://wordpress.org/plugins/wp-migrate-db/" href="https://wordpress.org/plugins/wp-migrate-db/">WP Migrate DB</a>, <a title="https://deliciousbrains.com/tour-wordpress-database/" href="https://deliciousbrains.com/tour-wordpress-database/">published a guide</a> that walks developers through the WordPress database. The guide describes every database table and there associated columns within WordPress single site. It also features an <a title="http://codex.wordpress.org/Database_Description#Database_Diagram" href="http://codex.wordpress.org/Database_Description#Database_Diagram">entity relationship diagram</a> that explains the relationships between the various tables. Although the image was created for WordPress 3.8, it&#8217;s still accurate.</p>\n<p>For those who want to learn the database structure of WordPress Multisite, check out their <a title="https://deliciousbrains.com/wordpress-multisite-database-tour/" href="https://deliciousbrains.com/wordpress-multisite-database-tour/">Multisite database tour</a> as there are some key database changes to take note of:</p>\n<blockquote><p>When a WordPress site is <a href="http://codex.wordpress.org/Create_A_Network">converted to a Multisite install</a>, a “network” of subsites is created. The existing site is converted to the first subsite in the network. The database classes the network itself as a site (wp_site), and each subsite as a blog (wp_blogs).</p>\n<p>Certain tables are used only by a subsite, and a new set of tables are created every time a site is added to the network. Each set of tables is differentiated by the blog_id for the subsite used in the table prefix. e.g. `wp_2_posts`.</p></blockquote>\n<p>I encourage you to bookmark both guides as they&#8217;re excellent resources.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 21:58:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:116:"WPTavern: CodeGuard Survey Shows More Education is Needed on Backup Software, Services, and Strategies For WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40341";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:124:"http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4426:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardSurveyResultsFeaturedImage.png" rel="prettyphoto[40341]"><img class="aligncenter size-large wp-image-40382" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardSurveyResultsFeaturedImage.png?resize=500%2C187" alt="CodeGuard Survey Results Featured Image" /></a></p>\n<p><a title="https://www.codeguard.com/" href="https://www.codeguard.com/">CodeGuard</a>, a service that specializes in automated backups to the cloud, has published the results of its 2015 WordPress survey. The survey took place between February 18th-20th and was answered by 503 WordPress users. Backing up is an important part of maintaining a website, so it&#8217;s a bit shocking to see such high percentages of people who either don&#8217;t backup on a regular basis or who don&#8217;t think backup plans are important.</p>\n<p>Out of 503 respondents:</p>\n<ul>\n<li>25% have received &#8220;very little training&#8221; in the use of WordPress</li>\n<li>22% haven&#8217;t been trained at all in WordPress backup and have &#8220;no idea&#8221; how to do it</li>\n<li>21% have seen the &#8220;white screen of death&#8221; multiple times, and &#8220;it&#8217;s horrible!&#8221;</li>\n<li>69% have had a plugin fail after an update, and 24% have had it happen &#8220;many times&#8221;</li>\n<li>63% have deleted files that were not backed up</li>\n<li>22% said that a backup plugin seems &#8220;unimportant&#8221; to them</li>\n<li>24% said &#8220;This site is my livelihood, I&#8217;d pay almost anything for a complete restore,&#8221; while 19% said they&#8217;d be willing to spend several thousand dollars, at least</li>\n</ul>\n<p>I&#8217;m surprised to see only 24% of respondents use a backup plugin at all considering there&#8217;s so many <a title="https://wordpress.org/plugins/search.php?q=backup" href="https://wordpress.org/plugins/search.php?q=backup">free options available</a>. There appears to be a correlation between those who have little to no WordPress training and the lack of education on how to establish a backup plan. I realize 503 WordPress users is not a large sample size, but the numbers indicate more education is needed on backup software, services, and strategies.</p>\n<p>It&#8217;s also alarming to see 69% of respondents have had a plugin fail after an update and 24% of those have had it happen several times. This is further proof that WordPress is <a title="http://wptavern.com/its-time-for-wordpress-to-automatically-update-themes-plugins-and-core-by-default" href="http://wptavern.com/its-time-for-wordpress-to-automatically-update-themes-plugins-and-core-by-default">not ready to automatically update plugins</a> by default.</p>\n<p>An important data point missing from the survey is how many of the respondents rely on automatic backups provided by their webhost. Not every user needs a plugin to manage backups and for a number of managed WordPress hosting companies, automatic backups are part of the package. In fact, most managed WordPress hosting providers discourage and disallow backup plugins from being used. An <a title="http://wpengine.com/support/disallowed-plugins/" href="http://wpengine.com/support/disallowed-plugins/">example is WP Engine</a>:</p>\n<blockquote><p>In general, however, we discourage the use of backup plugins. They needlessly duplicate our built-in functionality, rely on a large amount of local storage and can store files in an insecure manner. Not only that, many of these plugins run their backup jobs at inopportune times. This can slow database connectivity with extra — and sometimes very large — MySQL queries and cause timeouts on larger sites.</p></blockquote>\n<p>This infographic provided by CodeGuard visually shows the survey&#8217;s results. When browsing, I suggest replacing <em>WordPress users</em> with <em>respondents</em> as WordPress users sounds too broad. After reviewing the data, let me know if the results surprise you or if it corresponds to what you&#8217;re experiencing with clients.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardInfographic.png" rel="prettyphoto[40341]"><img class="wp-image-40371 size-full" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardInfographic.png?resize=1025%2C4879" alt="CodeGuard Infographic Showing Survey Results" /></a>CodeGuard Infographic Showing Survey Results\n<p>&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 19:49:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: WordPress Antispam Bee Plugin Adds Option to Trust Commenters with a Gravatar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40344";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wordpress-antispam-bee-plugin-adds-option-to-trust-commenters-with-a-gravatar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4082:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/bee.jpg" rel="prettyphoto[40344]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/bee.jpg?resize=1025%2C467" alt="photo credit: Osmia pumila, M, Face, MD_2013-06-25.18.39.16 ZS PMax - (license)" class="size-full wp-image-40353" /></a>photo credit: <a href="http://www.flickr.com/photos/54563451@N08/9302552275">Osmia pumila, M, Face, MD_2013-06-25.18.39.16 ZS PMax</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>Version 2.6.5 of the popular <a href="https://wordpress.org/plugins/antispam-bee/" target="_blank">Antispam Bee</a> plugin is out today with a new feature that allows administrators to trust commenters with a <a href="https://en.gravatar.com/" target="_blank">Gravatar</a>. The idea for the function was suggested by Caspar Hübinger, a long-time user of the plugin.</p>\n<p>&#8220;Have you ever seen a spam comment with a Gravatar image?  I haven’t,&#8221; Hübinger said in a <a href="http://glueckpress.com/6500/trust-the-gravatar/" target="_blank">post</a> introducing the new feature. &#8220;So I suggested to include an option in Antispam Bee to trust commenters with a Gravatar by default, and Sergej, creator of Antispam Bee, was kind enough to implement it.&#8221;</p>\n<p>Although the plugin was mentioned by Matt Mullenweg during his Q&amp;A at WordCamp Europe 2014, English speakers have largely overlooked it in the past. Antispam Bee was created by German WordPress plugin developer <a href="http://wpcoder.de/" target="_blank">Sergej Müller</a> and its description page on WordPress.org is written in German. He has actively developed and maintained the plugin since 2009. It is currently used on 200,000+ installations of WordPress.</p>\n<p>One might think that it would make sense to include an English copy of the description to gain a larger user base, but Müller elected to keep it in German due to the plugin&#8217;s incompatibilities. Antispam Bee is incompatible with many of the major commenting systems used by English speakers, including Disqus, Jetpack Comments, and AJAX Comment Form.</p>\n<p>English speakers who use <a href="http://jetpack.me/support/comments/" target="_blank">Jetpack Comments</a> often use <a href="http://akismet.com/" target="_blank">Akismet</a>, since the two work together seamlessly. Akismet is far more well-known, since it comes packaged with WordPress by default. However, Antispam Bee has a solid set of features that make it a decent alternative:</p>\n<ul>\n<li>Ad-free</li>\n<li>No storage of personal data</li>\n<li>No registration required</li>\n<li>Free for commercial projects</li>\n<li>No adjustment required by theme templates</li>\n<li>All functions can be controlled by the user</li>\n<li>Statistics for the last 30 days displayed as a dashboard widget</li>\n<li>Supports six languages: German, English, French, Russian, Dutch, and Slovenian</li>\n</ul>\n<p>The plugin also comes with 20 configurable options for customizing its spam-blocking features, including the ability to disable spam email notifications, block comments from certain countries, allow comments only in certain languages, delete after X days, and much more. These options allow you to tailor your anti-spam shield to lessen your moderation load.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/antispam-bee.jpg" rel="prettyphoto[40344]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/antispam-bee.jpg?resize=1025%2C714" alt="antispam-bee" class="aligncenter size-full wp-image-40377" /></a></p>\n<p>If you&#8217;re intrigued by <a href="https://wordpress.org/plugins/antispam-bee/" target="_blank">Antispam Bee</a>&#8216;s latest feature that allows you to trust commenters who have a Gravatar, give the plugin a try the next time you&#8217;re reviewing spam-blocking solutions. The option is a creative use of WordPress&#8217; built-in support for Gravatar. Current users of the plugin can find the new setting in the admin under <strong>Settings > Antispam Bee</strong>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 19:06:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: WPupdatePHP Project Aims to Help WordPress Users Get on Newer Versions of PHP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40303";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wpupdatephp-project-aims-to-help-wordpress-users-get-on-newer-versions-of-php";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4470:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/php.jpg" rel="prettyphoto[40303]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/php.jpg?resize=700%2C329" alt="photo credit: Feediza.com" class="size-full wp-image-40331" /></a>photo credit: <a href="http://feediza.com/">Feediza.com</a>\n<p>Developers are anxious for WordPress to bump up the minimum PHP requirement for core, as it&#8217;s currently lingering at 5.2, which is no longer among the <a href="http://php.net/supported-versions.php" target="_blank">supported versions of PHP</a>. As of August 2014, PHP 5.3 no longer receives patches for security vulnerabilities.</p>\n<p><a href="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1" target="_blank">Recent updates to WordPress.org stats</a> indicate that 16.4% of WordPress sites are still running on PHP 5.2 and 38% on PHP 5.3. According to lead developer Andrew Nacin, bumping the minimum required version is not likely to happen soon, due to the sheer number of sites that would be negatively impacted.</p>\n<p>&#8220;One-sixth of all sites running PHP 5.2 is still many millions of sites,&#8221; he said. &#8220;If we move the PHP minimum version too early, we risk stranding millions of installs on older versions of WordPress.&#8221; In the meantime, the WordPress project is researching the current state of PHP offerings available at popular hosts and will soon be urging them to update to more recent versions.</p>\n<p>WordPress developer <a href="http://coenjacobs.me/" target="_blank">Coen Jacobs</a> believes that the effort to contact hosts will not be enough to help everyone. His new <a href="http://www.wpupdatephp.com/" target="_blank">WPupdatePHP</a> project was created to educate end users on outdated versions of PHP. The <a href="https://github.com/WPupdatePHP/wp-update-php" target="_blank">WPupdatePHP library</a> is a tool that developers can bundle into their plugins in order to require users to upgrade to PHP 5.4+ hosting. It is intended for use within new plugins, not for locking users out of existing ones.</p>\n<p>If a user does not meet the minimum PHP version requirements when installing the plugin, he will be presented with an admin notice:</p>\n<blockquote><p>Unfortunately, this plugin can not run on PHP versions older than [ specified version ]. Read more information about <a href="http://www.wpupdatephp.com/update/">how you can update</a>.</p></blockquote>\n<p>The idea of the WPupdatePHP project is to enlist end users in putting pressure on hosts to <a href="http://www.wpupdatephp.com/update/" target="_blank">update their versions of PHP</a>. A future version of the library would add the ability for developers to make the PHP version a “soft requirement,” which would still display the notice but won’t stop the user from using the plugin.</p>\n<p>&#8220;The core WordPress team can’t get every single hosting company to comply,&#8221; Jacobs said in a recent post titled <em><a href="http://coenjacobs.me/updating-php-everyones-responsibility/" target="_blank">Updating PHP is Everyone’s Responsibility</a></em>. &#8220;I admire their intentions, but in reality this is not going to help everybody.&#8221;</p>\n<p>He predicts a need for the WPupdatePHP library even after WordPress bumps its minimum required PHP version. &#8220;PHP 5.4 is actually already nearing its EOL date and we’re still figuring out how to make PHP 5.2 and 5.3 platforms go away,&#8221; he said. In mid-September 2015, PHP 5.4 will not longer receive security fixes.</p>\n<p>Jacobs believes that the changes that need to happen require more than a one-time campaign where the WordPress project successfully badgers hosts to update to PHP 5.4.</p>\n<p>&#8220;In six months we’ll have this same issue all over again,&#8221; he said. &#8220;As soon as webhosting companies have finally finished off their PHP 5.2 and 5.3 environments, we can start this whole campaign all over again to get rid of PHP 5.4. And so on.&#8221;</p>\n<p>If you are a WordPress developer interested in enlisting your plugin&#8217;s users to help push hosts to update PHP versions, check out <a href="https://github.com/WPupdatePHP/wp-update-php" target="_blank">WPupdatePHP on GitHub</a>.</p>\n<p>&#8220;The end user is one of our most important, but underestimated, assets in this battle,&#8221; Jacobs said. &#8220;They have the strongest voice in this all.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 22:24:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: WordPress.com Adds oEmbed Support For CartoDB Maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40265";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/wordpress-com-adds-oembed-support-for-cartodb-maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1371:"<p>WordPress.com <a title="https://en.support.wordpress.com/cartodb-embeds/" href="https://en.support.wordpress.com/cartodb-embeds/">now supports oEmbeds</a> for<a title="http://cartodb.com/" href="http://cartodb.com/"> CartoDB,</a> a tool used to create and share interactive maps. Simply copy and paste a CartoDB map URL into the WordPress.com post editor and a live preview will display. Here&#8217;s an example of a map using the standard HTML embed code.</p>\n<p></p>\n<p>According to an announcement on the <a title="http://blog.cartodb.com/wordpress/" href="http://blog.cartodb.com/wordpress/">official CartoDB blog</a>, embed support has also been added to Jetpack. However, I discovered after testing that it&#8217;s not yet supported. I reached out to Jetpack&#8217;s development team to find out when it will be added, but they&#8217;re <a title="https://wordpress.org/support/topic/jetpack-staff-will-be-unavailable-until-march-16th" href="https://wordpress.org/support/topic/jetpack-staff-will-be-unavailable-until-march-16th">not available</a> until March 16th.</p>\n<p>With more than 60 million users, CartoDB has an incredible opportunity to expand its reach by being accessible on a platform where over <a title="https://wordpress.com/activity/" href="https://wordpress.com/activity/">409 million people</a> view more than 17.6 billion pages each month.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 20:13:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:96:"WPTavern: Lovecraft: New Free WordPress Theme Combines Prominent Imagery with Strong Serif Fonts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40251";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:105:"http://wptavern.com/lovecraft-new-free-wordpress-theme-combines-prominent-imagery-with-strong-serif-fonts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3402:"<p>WordPress theme author <a href="http://www.andersnoren.se/" target="_blank">Anders Norén</a> is back to releasing themes after a brief hiatus over the winder holidays. <a href="https://wordpress.org/themes/lovecraft/" target="_blank">Lovecraft</a>, is his 10th theme to be approved on WordPress.org.</p>\n<p>The Lovecraft design was inspired by the work of <a href="http://en.wikipedia.org/wiki/H._P._Lovecraft" target="_blank">H.P. Lovecraft</a>, an American horror fiction author known for his &#8220;weird realism&#8221; &#8211; the idea that reality is fundamentally weird and the human mind is incapable of realistically representing it.</p>\n<p>Norén&#8217;s tribute to Lovecraft&#8217;s work is conveyed most clearly through the serif-heavy typography of the theme and a strong focus on the imagery assigned to each post. He selected Google Font&#8217;s <a href="http://www.google.com/fonts/specimen/Playfair+Display" target="_blank">Playfair Display</a> for page and post headers, accompanied by Georgia for the body text. The bright red links and red post meta complement the design&#8217;s literary theme.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft.png" rel="prettyphoto[40251]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft.png?resize=880%2C660" alt="lovecraft" class="aligncenter size-full wp-image-40267" /></a></p>\n<p>The homepage showcases a full-width header image and each post replaces that image with its own featured image. These images, along with the rest of the theme, gracefully scale down for smaller devices.</p>\n<p>Lovecraft, like many other recently released themes, adds additional features by offering support for <a href="http://jetpack.me/" target="_blank">Jetpack</a>, including the infinite scroll module and styles for tiled galleries.</p>\n<p>Norén took every small detail into consideration when creating Lovecraft, as you can see with the blockquotes design, ordered lists, post media, and form styles on the <a href="http://andersnoren.se/themes/lovecraft/style-guide/" target="_blank">Style Guide</a> page.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft-blockquote.jpg" rel="prettyphoto[40251]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft-blockquote.jpg?resize=617%2C217" alt="lovecraft-blockquote" class="aligncenter size-full wp-image-40283" /></a></p>\n<p>The theme allows you to select the accent color via the customizer. It also includes support for a custom logo, editor styles, and matching widgets for Flicker, recent posts, and recent comments with thumbnails. Pages have an additional template for full-width display. Check out the <a href="http://andersnoren.se/themes/lovecraft/" target="_blank">live demo</a> to see Lovecraft in action.</p>\n<p>If you&#8217;re looking for a bold new theme for your blog and you appreciate strong serif fonts, Lovecraft is a thoughtfully-designed option. The theme is <a href="http://www.wordpress.org/themes/lovecraft" target="_blank">available for free</a> in the WordPress Theme Directory as of today. For more information on how Anders Norén finds continual inspiration for his free themes, check out our recent <a href="http://wptavern.com/a-chat-with-anders-noren-on-finding-inspiration-for-wordpress-theme-design" target="_blank">interview</a> with the designer.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 18:54:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: NNT of Medicine";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44289";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2015/03/ntt-of-medicine/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:643:"<p><a href="http://www.wired.com/2014/10/number-needed-to-treat/">This Man&#8217;s Simple System Could Transform American Medicine</a>, about a quest to quantify the effects of medicine and treatment differently, which is really needed.</p>\n<p>Update: Looks like it&#8217;s built on WordPress, too:</p>\n<blockquote class="twitter-tweet" width="550"><p>.<a href="https://twitter.com/photomatt">@photomatt</a> Thanks for the link! I built the site with Dave Newman (powered by WordPress)!</p>\n<p>&mdash; Graham Walker (@grahamwalker) <a href="https://twitter.com/grahamwalker/status/575069240140656641">March 9, 2015</a></p></blockquote>\n<p></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 18:47:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WPTavern: bbPress 2.5.5 Released, Patches Three Potential Security Vulnerabilities";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40253";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:907:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/bbpress.png" rel="prettyphoto[40253]"><img class="aligncenter size-full wp-image-24338" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/bbpress.png?resize=1025%2C378" alt="bbpress" /></a></p>\n<p>bbPress 2.5.5 is <a title="https://bbpress.org/blog/2015/03/bbpress-2-5-5-security-release/" href="https://bbpress.org/blog/2015/03/bbpress-2-5-5-security-release/">available for download</a>. This release fixes three potential security vulnerabilities reported by <a title="https://profiles.wordpress.org/jdgrimes" href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a> and was pushed out within nearly 24 hours of being notified. Users should update as soon as possible as all previous 2.x versions are vulnerable. The patches have also been applied to the 2.6 development branch that will soon have a beta release.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 17:24:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Matt: 25k DMCA Win";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44791";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:34:"http://ma.tt/2015/03/25k-dmca-win/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:566:"<blockquote><p>WordPress [actually Automattic] has scored an important victory in court against a man who abused the DMCA to censor an article of a critical journalist. The court agreed that the takedown request was illegitimate and awarded WordPress roughly $25,000 in damages and attorneys fees.</p></blockquote>\n<p>Yes! Good laws become bad when people abuse them. Here&#8217;s the source: <a href="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/">WordPress Wins $25,000 From DMCA Takedown Abuser</a> (s/WordPress/Automattic/).</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 08 Mar 2015 17:55:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:36:"Matt: Psychology of a Small Playlist";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44757";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://ma.tt/2015/03/psychology-of-a-small-playlist/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:240:"<p>Joseph Mosby experiments with my trick of listening to a song on repeat to get work done, <a href="http://josephmosby.com/2015/02/15/the-psychology-of-a-small-playlist-on-repeat.html">and digs a bit into the psychology behind it</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 08 Mar 2015 07:10:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WPTavern: Automattic and Oliver Hotham Win Court Battle Against DMCA Takedown Abuser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40222";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/automattic-and-oliver-hotham-win-court-battle-against-dmca-takedown-abuser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3721:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/AutomatticCourtFeaturedImage.png" rel="prettyphoto[40222]"><img class="size-full wp-image-40224" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/AutomatticCourtFeaturedImage.png?resize=642%2C299" alt="Automattic Court Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/46274125@N00/1558886731">Former Supreme Court, Singapore</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>In August of 2013, <a title="http://www.theguardian.com/technology/2013/aug/13/wordpress-straight-pride-uk" href="http://www.theguardian.com/technology/2013/aug/13/wordpress-straight-pride-uk">Automattic was criticized</a> for its role in taking down <a title="https://oliverhotham.wordpress.com/2013/08/11/the-sordid-tale-of-how-i-was-censored-by-straight-pride-uk/" href="https://oliverhotham.wordpress.com/2013/08/11/the-sordid-tale-of-how-i-was-censored-by-straight-pride-uk/">Oliver Hotham&#8217;s website</a> after the Straight Pride UK group filed a DMCA takedown notice with WordPress.com. In the Guardian article, WordPress.com admitted that the takedown notice was an abuse of the law. In November of 2013, <a title="http://en.blog.wordpress.com/2013/11/21/striking-back-against-censorship/" href="http://en.blog.wordpress.com/2013/11/21/striking-back-against-censorship/">Automattic announced</a> that it teamed up with Hotham in <a title="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-hotham-complaint.pdf" href="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-hotham-complaint.pdf">two</a> separate <a title="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-retraction-watch-complaint.pdf" href="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-retraction-watch-complaint.pdf">lawsuits</a>.</p>\n<p>The lawsuits were filed in federal court under Section 512(f) of the DMCA. Section 512(f) is the provision that allows users to hold people accountable when they make false infringement accusations.</p>\n<p>Torrentfreak reports that <a title="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/" href="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/">Automattic has won the case</a> with a $25K settlement. According to court documents, United States Magistrate Judge Joseph Spero <a title="http://ia601008.us.archive.org/20/items/gov.uscourts.cand.272130/gov.uscourts.cand.272130.31.0.pdf" href="http://ia601008.us.archive.org/20/items/gov.uscourts.cand.272130/gov.uscourts.cand.272130.31.0.pdf">wrote a report</a> and recommendation in favor of Automattic and Hotham. The <a title="http://torrentfreak.com/images/wp-steiner.pdf" href="http://torrentfreak.com/images/wp-steiner.pdf">courts agreed with his report</a> and recommendation. Since the defendant chose to default, the courts saw no reason to require further expenditure of resources and awarded the victory to Automattic.</p>\n<p>The settlement is split between three parties: Automattic&#8217;s employee time, attorneys, and Hotham.</p>\n<blockquote><p>It is Ordered and Adjudged that defendant Nick Steiner pay damages in the amount of $960.00 for Hotham’s work and time, $1,860.00 for time spent by Automattic’s employees, and $22,264.00 for Automattic’s attorney’s fees, for a total award of $25,084.00.</p></blockquote>\n<p>There are two things I take away from the victory. First, it sets a precedent that Automattic can and will fight against those who abuse the <a title="http://automattic.com/dmca-notice/" href="http://automattic.com/dmca-notice/">DMCA takedown procedure</a>. Second, attorneys are expensive.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 07 Mar 2015 04:44:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Standalone Cameras";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44780";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/03/standalone-cameras/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:172:"<p>Om Malik on the decline of cameras as gadgets, <a href="http://om.co/2015/03/06/standalone-camera-shot-dead-by-iphone/">Standalone camera: Shot (Dead) By iPhone</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 07 Mar 2015 02:08:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"WPTavern: New Plugin Adds Openname Avatars to WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39992";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wptavern.com/new-plugin-adds-openname-avatars-to-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4497:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname.jpg?resize=720%2C299" alt="openname" class="aligncenter size-full wp-image-40208" /></a></p>\n<p>In November 2014, Onename <a href="http://blog.onename.io/decentralized-auth-identity-open-source/" target="_blank">announced</a> that it would be extending its Openname protocol to support decentralized authentication. The company also <a href="https://github.com/openname" target="_blank">open sourced the protocol and directory software</a> so that developers can build their own infrastructure with it.</p>\n<blockquote><p>We believe the future of identity will be decentralized, and for any identity system to be truly decentralized, no entity can have a monopoly over registering users or displaying their profiles. Anyone should be able to claim a username and fill out their profiles either using a provider/registrar of their choice or on their own without any third party.</p></blockquote>\n<p>The <a href="https://openname.org/" target="_blank">Openname</a> decentralized identity and naming system is built on the Blockchain. It makes it possible for anyone to create an online identity, which can then be used to make Bitcoin transactions. The company&#8217;s long-term goal is to pioneer a decentralized authentication protocol:</p>\n<blockquote><p>What we need is a password-less authentication process that doesn&#8217;t require any particular third party; an open, decentralized auth protocol that lets users conveniently sign in and be in control of the data they release to apps and where they store it.</p>\n<p>Openname Auth is our work-in-progress proposal for decentralized, password-less authentication in which users login by simply entering a username (their openname) and approving an auth request on their desktop or mobile device.</p></blockquote>\n<p>OneName <a href="http://venturebeat.com/2014/11/14/y-combinator-backed-onename-raises-1-5m-open-sources-its-bitcoin-identity-directory/" target="_blank">raised $1.5 million in funding</a> to continue developing the platform as part of its quest to <a href="http://blog.onename.io/evolution-of-the-internet/" target="_blank">return the web to its decentralized roots</a>.</p>\n<h3>Openname Avatars for WordPress</h3>\n<p>WordPress core supports <a href="https://en.gravatar.com/" target="_blank">Gravatar</a> by default for providing blog and comment author avatars. Thanks to the new <a href="https://wordpress.org/plugins/openname/" target="_blank">Opennname plugin for WordPress</a>, site administrators can now offer users the option to associate a Openname avatars with an account on self-hosted sites.</p>\n<p>In order to test the plugin, you&#8217;ll need to first sign up for an <a href="https://openname.org/" target="_blank">Openname</a> account (which requires an account at Onename or Namecoin).</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-profile.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-profile.jpg?resize=1025%2C307" alt="openname-profile" class="aligncenter size-full wp-image-40190" /></a></p>\n<p>After you install the Openname plugin on your WordPress site, any registered user will be able to elect to use his Openname avatar by visiting /wp-admin/profile.php. Once you add your Openname, the plugin will keep your WordPress avatar in sync (with a short delay) with your Openname Avatar.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-settings.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-settings.jpg?resize=720%2C264" alt="openname-settings" class="aligncenter size-full wp-image-40191" /></a></p>\n<p>The Openname plugin was created by <a href="https://www.larrysalibra.com/" target="_blank">Larry Salibra</a>, founder and CEO of <a href="https://www.pay4bugs.com/" target="_blank">Pay4Bugs</a>. I tested it and found it to work as advertised.</p>\n<p>In the future, once the Openname Auth is more developed, it would be awesome if Salibra added this to his WordPress plugin. Onename might do well to create its own official plugin for this. Given that WordPress currently powers 23% of the world&#8217;s websites, an official Openname authentication plugin might bring wider adoption for its decentralized identity system.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 23:30:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"WPTavern: WordPress Publishes Security White Paper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40096";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wptavern.com/wordpress-publishes-security-white-paper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3694:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/security.jpg" rel="prettyphoto[40096]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/security.jpg?resize=1024%2C514" alt="photo credit: Lock - (license)" class="size-full wp-image-40187" /></a>photo credit: <a href="http://www.flickr.com/photos/58441544@N00/2660230441">Lock</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>As WordPress currently powers 23% of the web, the platform&#8217;s security is constantly under scrutiny. WordPress has long been a favorite target of hackers and spammers who want to get the most return on their efforts. Since the the platform powers millions of websites, a critical vulnerability with a popular plugin or WordPress core can affect a large chunk of the web in a short amount of time.</p>\n<p>WordPress published a <a href="https://wordpress.org/about/security/" target="_blank">security white paper</a> this week to help the public learn more about the core software security. Many consultants have had the experience of clients who are considering WordPress but are wondering if it&#8217;s secure. This document was created both for decision makers who are evaluating WordPress and developers who are building on top of the software.</p>\n<p>The document is available as a <a href="https://github.com/WordPress/Security-White-Paper/blob/master/WordPressSecurityWhitePaper.pdf?raw=true" target="_blank">PDF</a>, and here&#8217;s what you&#8217;ll find inside:</p>\n<blockquote><p>This document is an analysis and explanation of the WordPress core software development and its related security processes, as well as an examination of the inherent security built directly into the software.</p></blockquote>\n<p>The white paper gives an introduction to the core leadership team, the WordPress Security Team, how a release cycle works, and responsible disclosure of vulnerabilities. The second half of the document covers common security vulnerabilities and how WordPress protects itself against those potential risks.</p>\n<p>Just like WordPress itself, the security white paper is open to contribution. Anyone can submit a pull request on the <a href="https://github.com/WordPress/Security-White-Paper" target="_blank">WordPress repository</a>.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-security-whitepaper.png" rel="prettyphoto[40096]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-security-whitepaper.png?resize=1025%2C753" alt="wordpress-security-whitepaper" class="aligncenter size-full wp-image-40178" /></a></p>\n<p>The security white paper is in need of translations in order to be more accessible to WordPress&#8217; global audience. If you can assist with a particular translation, the repository has simple instructions for how to submit it on GitHub.</p>\n<blockquote><p>To translate the white paper, please create a sub-directory of the project, giving it the correct ISO639 code (for example, pt for Portuguese), and submit a pull request.</p></blockquote>\n<p>WordPress consultants will find this white paper to be an excellent resource to refer to during sales negotiations. If you&#8217;re a developer just getting started learning about WordPress&#8217; inherent security, the document is provides a solid overview.</p>\n<p>Hackers who are looking to receive bounty for finding security vulnerabilities can find <a href="https://hackerone.com/automattic" target="_blank">Automattic on HackerOne</a>. The company regularly rewards hackers with bounty for security bugs discovered with WordPress.com, which is powered by the core WordPress software.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 20:11:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WPTavern: Version One of The WordPress History Book is Ready For Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40148";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4283:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressHistoryBookFeaturedImage.png" rel="prettyphoto[40148]"><img class="aligncenter size-full wp-image-40153" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressHistoryBookFeaturedImage.png?resize=657%2C231" alt="WordPress History Book Featured Image" /></a></p>\n<p>During the <a title="http://wordpress.tv/2013/07/29/matt-mullenweg-state-of-the-word-2013/" href="http://wordpress.tv/2013/07/29/matt-mullenweg-state-of-the-word-2013/">2013 State of the Word</a> presentation at WordCamp San Francisco, Matt Mullenweg announced a new project called <a title="https://github.com/WordPress/book" href="https://github.com/WordPress/book">WordPress The Book</a>. After nearly two years of writing, Siobhan McKeown <a title="https://twitter.com/SiobhanPMcKeown/status/573544639170478081" href="https://twitter.com/SiobhanPMcKeown/status/573544639170478081">has announced</a> that version one is ready for review. She also states that the book will be produced in just over a month and that now&#8217;s the time to give feedback.</p>\n<blockquote class="twitter-tweet" width="550"><p>Finished V1 of the WordPress book: <a href="https://t.co/MC59LjeyFH">https://t.co/MC59LjeyFH</a> We''ll be producing it in just over a month so if you have feedback now''s the time</p>\n<p>&mdash; Siobhan McKeown (@SiobhanPMcKeown) <a href="https://twitter.com/SiobhanPMcKeown/status/573544639170478081">March 5, 2015</a></p></blockquote>\n<p></p>\n<p>While you can download the book, I recommend browsing and reading it on Github so you don&#8217;t have to worry about opening files with the .MD extension. It&#8217;s also easier to submit pull requests to correct typos or grammatical errors. The book is <a title="https://github.com/WordPress/book/tree/master/Content" href="https://github.com/WordPress/book/tree/master/Content">divided into six parts</a> that contain a few chapters each.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressBookChapters.png" rel="prettyphoto[40148]"><img class="size-full wp-image-40152" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressBookChapters.png?resize=1025%2C432" alt="Chapters Of The WordPress History Book" /></a>Chapters Of The WordPress History Book\n<p>If you come across any errors while reading the book, you can submit corrections by creating a pull request or an issue on the tracker. Here are a few things to look out for as you read:</p>\n<ul>\n<li>Factual errors: notes about factual errors are welcome. All suggestions for changes should be evidenced with links that back up any claims. Any facts that cannot be corroborated will not be included.</li>\n<li>Clarity: any paragraphs or sections that you feel are not clear. This would be of particular help in sections that are technical in nature.</li>\n<li>Omissions: anything that you feel has been omitted or not sufficiently covered. Note that this is a lengthy piece of writing and many issues have to be condensed to ensure that it is a manageable and interesting read. Suggestions about omissions should be accompanied with information about why it should be included, and backed up with evidence as to their importance.</li>\n<li>Images: if you have any images that you feel would complement the text, we&#8217;d love to have them.</li>\n</ul>\n<p>McKeown is also looking for help writing haikus. Ideally, she&#8217;d like one for the book&#8217;s opening and one for each section. It will be published in two forms, a digital edition for the web and an e-book. McKeown also hinted at the possibility of printing physical copies, &#8220;We&#8217;re investigating different print options, so the feasibility of doing a print run or of offering print on demand.&#8221;</p>\n<p>I&#8217;ve read a few chapters of the book already and it&#8217;s like a trip down memory lane. It&#8217;s interesting to read some of the historical moments of the project&#8217;s history, especially the years of GPL debates. Whether you&#8217;re brand new to WordPress and want to learn its history or you&#8217;re a veteran who needs a refresher, this book delivers. Please help McKeown by proofreading the first version and help make it the best WordPress history book possible.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 17:00:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"Dougal Campbell: WordPress › About » Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://dougal.gunters.org/?p=80603";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://dougal.gunters.org/blog/2015/03/06/wordpress-about-security/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1059:"<p><i>&#8220;This document is an analysis and explanation of the WordPress core software development and its related security processes, as well as an examination of the inherent security built directly into the software. Decision makers evaluating WordPress as a content management system or web application framework should use this document in their analysis and decition-making, and for developers to refer to it to familiarize themselves with the security components and best practices of the software.&#8221;</i></p>\n<p><a href="https://wordpress.org/about/security/">WordPress › About » Security</a></p>\n<p>Original Article: <a rel="nofollow" href="http://dougal.gunters.org/blog/2015/03/06/wordpress-about-security/">WordPress › About » Security</a><br />\n<a rel="nofollow" href="http://dougal.gunters.org">Dougal Campbell&#039;s geek ramblings - WordPress, web development, and world domination.</a></p>\n<div class="yarpp-related-rss yarpp-related-none">\n<img src="http://yarpp.org/pixels/5db43ee24c4f1e1d0e45d08cc91b0130" alt="YARPP" />\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 15:36:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Dougal Campbell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WPTavern: Insight Into WordPress Communities Around The World";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40138";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wptavern.com/insight-into-wordpress-communities-around-the-world";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3508:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/KinstaWordPressCommunitiesFeaturedImage.png" rel="prettyphoto[40138]"><img class="aligncenter size-full wp-image-40141" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/KinstaWordPressCommunitiesFeaturedImage.png?resize=727%2C338" alt="KInsta WordPress Communities Featured Image" /></a></p>\n<p>One of the greatest things about WordPress is its diverse community throughout the world. <a title="https://kinsta.com/" href="https://kinsta.com/">Kinsta</a> has published a <a title="https://kinsta.com/learn/wordpress-communities-around-the-world/" href="https://kinsta.com/learn/wordpress-communities-around-the-world/">fantastic and inspirational post</a> that looks at up and coming WordPress communities in 5 continents and 17 countries.</p>\n<p>My favorite story is Juanfra Aldasoro, co-organizer of WordCamp Buenos Aires, describing how the WordPress community in Argentina was organized. In 2007, Buenos Aires hosted the first WordCamp outside the US. Despite hosting a few more WordCamps, the community lacked organization. Aldasoro explains how celebrating WordPress&#8217; 10th anniversary brought the right group of people together:</p>\n<blockquote><p>When WordPress turned 10, in May of 2013, thanks to a banner in the Codex site we created a celebration meetup. More than 20 people showed up, and the good thing was that we were a bunch of geeks on the same track. We had the people but we were lacking an organization. The ones interested in having an organized community kept in touch, we formed WordPress Argentina (<a href="https://twitter.com/wpargentina" target="_blank">@wpargentina</a>) and during 2014 we started to hold more formal monthly meetups.</p></blockquote>\n<p>One of the things I noticed is that several of the people <a title="https://kinsta.com/learn/wordpress-communities-around-the-world/" href="https://kinsta.com/learn/wordpress-communities-around-the-world/">featured in the article</a> use Facebook groups for communication. Although a number of US based WordPress meetups use <a title="http://www.meetup.com/" href="http://www.meetup.com/">Meetup.com</a>, in other countries, Facebook appears to be the dominant way to communicate and organize members.</p>\n<p>Meetups are grassroots efforts that help WordPress reach every corner of the globe. As Matt Mullenweg said during his 2014 <a title="http://wordpress.tv/2014/10/26/matt-mullenweg-the-state-of-the-word-2014/" href="http://wordpress.tv/2014/10/26/matt-mullenweg-the-state-of-the-word-2014/">State of The Word presentation</a>, &#8220;Organizing a meetup is one of the hardest things to do in terms of contributing to WordPress. Every single month, you have to come up with new stuff.&#8221; Those who help maintain community as a pillar of WordPress&#8217; success are helping to maintain its growth and popularity.</p>\n<p>It&#8217;s exciting to think about the enormous amount of WordPress education, contributions, and learning that takes place across the world everyday, thanks in large part to people like those featured in the article. It&#8217;s wonderful to see so many WordPress communities around the world growing in size to the point of  having their own WordCamps.</p>\n<p>If you&#8217;re having trouble organizing a WordPress meetup in your area, let us know in the comments. Thousands of people across the world access the Tavern on a daily basis and we might be able to help connect you to others in your area.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 05:16:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Matt: Kanye on Color";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44745";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:36:"http://ma.tt/2015/03/kanye-on-color/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:955:"<p><a href="http://ma.tt/2015/03/pink-and-blue/">Speaking of color masculinity</a>, here&#8217;s Kanye on creativity, society, and color from <a href="http://www.thefader.com/2012/11/29/kanye-west-im-amazing">his 2008 FADER interview</a>:</p>\n<blockquote><p>I feel like all the words are in you, you’re just blocking yourself, you’re blocking your creativity. Society has put up so many boundaries, so many limitations on what’s right and wrong that it’s almost impossible to get a pure thought out. It’s like a little kid, a little boy, looking at colors, and no one told him what colors are good, before somebody tells you you shouldn’t like pink because that’s for girls, or you’d instantly become a gay two-year-old. Why would anyone pick blue over pink? Pink is obviously a better color. Everyone’s born confident, and everything’s taken away from you. So many people try to put their personality on someone else.</p></blockquote>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 04:19:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: WPWeekly Episode 182 – John James Jacoby Talks BuddyPress, bbPress, and GlotPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=40127&preview_id=40127";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wpweekly-episode-182-john-james-jacoby-talks-buddypress-bbpress-and-glotpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2988:"<p><a title="http://jjj.me/" href="http://jjj.me/">John James Jacoby</a> is nearly halfway through his <a title="http://wptavern.com/buddypress-bbpress-and-glotpress-development-campaign-is-now-fully-funded" href="http://wptavern.com/buddypress-bbpress-and-glotpress-development-campaign-is-now-fully-funded">six month development cycle</a> on <a title="https://buddypress.org/" href="https://buddypress.org/">BuddyPress</a>, <a title="https://bbpress.org/" href="https://bbpress.org/">bbPress</a>, and <a title="http://blog.glotpress.org/" href="http://blog.glotpress.org/">GlotPress</a>. So, <a title="http://marcuscouch.com/" href="http://marcuscouch.com/">Marcus Couch</a> and I invited him on the show to give us an update on how things are progressing. On average, WordPress Weekly is an hour-long. This episode however, is two hours and nine minutes, but is filled with deep conversations surrounding each project.</p>\n<p>In this episode, we learn the history of BuddyPress and how its connection to WordPress MU (WordPress Multisite), influenced the project&#8217;s direction. Jacoby explains what GlotPress is and why its a cornerstone of the WordPress project. We discuss the future of comments on the web and the role bbPress can play in turning things around. Last but not least, we discuss whether Jacoby&#8217;s successful crowdfunding campaign has opened the door for others who need funding to work on open source projects.</p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/buddypress-identicons/" href="https://wordpress.org/plugins/buddypress-identicons/">BuddyPress Identicons</a> automatically replaces default avatars with GitHub-style identicons. Each member&#8217;s identicon is likely to be unique, because it&#8217;s generated from a hash of their username.</p>\n<p><a title="https://wordpress.org/plugins/buddypress-cover-photo/" href="https://wordpress.org/plugins/buddypress-cover-photo/">BuddyPress Cover Photo</a> allows users to upload a cover photo to their profile.</p>\n<p><a title="https://wordpress.org/plugins/friends-for-bbpress/" href="https://wordpress.org/plugins/friends-for-bbpress/">Friends For bbPress</a> allows users to add friends in bbPress forums. This plugin creates a section on each user’s profile page that contains their friends.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 11th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #182:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 01:22:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"WPTavern: Wocker: Create a Docker-Based WordPress Development Environment in 3 Seconds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40090";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:95:"http://wptavern.com/wocker-create-a-docker-based-wordpress-development-environment-in-3-seconds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5731:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/docker-wordpress.jpg" rel="prettyphoto[40090]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/docker-wordpress.jpg?resize=1025%2C494" alt="docker-wordpress" class="aligncenter size-full wp-image-40098" /></a></p>\n<p>If you haven&#8217;t caught on to the <a href="https://www.docker.com/" target="_blank">Docker</a> craze, it might be time to see what it&#8217;s all about. Fans of the open source container technology appreciate that it&#8217;s lightweight, super fast to boot up, and easy to share containers through the <a href="https://registry.hub.docker.com/" target="_blank">Docker Hub</a>.</p>\n<p>Docker standardizes an app platform and its dependencies so you can hand the box over to another party without worrying about conflicting dependencies or differences between machines. While virtual machines can be rather weighty with an application plus an entire guest operating system, Docker is much lighter, containing just the application and its dependencies.</p>\n<h3>Introducing Wocker</h3>\n<p><a href="http://www.vagrantup.com/blog/vagrant-1-6.html" target="_blank">Vagrant 1.6.0</a>, released last May, introduced support for Docker-based development environments, enabling Vagrant to manage them within Docker-powered Linux containers, instead of virtual machines.</p>\n<p>WordPress developers who want to incorporate Docker into their workflow now have a new tool at their disposal. <a href="http://wckr.github.io/" target="_blank">Wocker</a> is a Docker-based rapid development environment of WordPress.</p>\n<p>If you already have Vagrant, VirtualBox, and the vagrant-hostsupdater plugin installed, then getting started with Wocker takes next to no time. Simply clone the Wocker repository:</p>\n<p><code>$ git clone https://github.com/wckr/wocker.git &#038;&#038; cd wocker</code></p>\n<p>Then run <code>vagrant up</code>.  You can now navigate to your Wocker development site at: <a href="http://wocker.dev/" target="blank">http://wocker.dev/</a>. Here you&#8217;ll find the latest version of WordPress installed with the default theme active.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wocker.png" rel="prettyphoto[40090]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wocker.png?resize=1025%2C650" alt="wocker" class="aligncenter size-full wp-image-40093" /></a></p>\n<p>Running a new Wocker container takes just three seconds:</p>\n<p><code>core@wocker ~ $ wocker run --name wp</code></p>\n<p>The tasks of creating a new container, restarting a stopped container, or shutting down, can all be done in a matter of seconds with <a href="http://wckr.github.io/" target="_blank">Wocker commands</a>.</p>\n<h3>Kite Koga on Creating Wocker</h3>\n<p>Japanese WordPress developer <a href="https://twitter.com/ixkaito" target="_blank">Kite Koga</a> created Wocker to speed up his own development. Koga is also the organizer of the upcoming <a href="https://www.facebook.com/WordCampKansai2015" target="_blank">WordCamp Kansai 2015</a>.</p>\n<p>&#8220;I used to use MAMP and VCCW for developing on WordPress,&#8221; Koga said. &#8220;MAMP is simple and easy but I have to download or copy WordPress core and create a database every time. <a href="http://vccw.cc/" target="_blank">VCCW</a> is a great tool, and I still use it now and then. It has a lot of options and functions but takes awhile to provision.&#8221;</p>\n<p>Koga also experimented with using <a href="https://github.com/Varying-Vagrant-Vagrants/VVV" target="_blank">VVV</a> before creating Wocker. &#8220;Maybe VVV is good for developing WordPress core, but I feel it&#8217;s not fit for developing on WordPress. It takes too long to provision every time,&#8221; he said.</p>\n<p>&#8220;Ultimately, I found that Docker was a good choice for me,&#8221; Koga said. &#8220;Once I have a Docker image, it takes only three seconds for every new WordPress container. However, Docker is a little tricky, and the command line is complex. Therefore, I made the Wocker command line to run containers and sync files with local more easily.&#8221;</p>\n<p>Wocker is intentionally simple and limited to just a handful of options, as Koga&#8217;s primary objective was to make it super fast to create a new WordPress development environment. One drawback is that you cannot run two or more containers at the same time, but it takes just seconds to switch between containers.</p>\n<p>Koga summarized the main reasons that he opted to use Vagrant to manage Docker deployments:</p>\n<ol>\n<li>I could write some provision scripts in the Vagrantfile, so users only have to do `$ vagrant up`</li>\n<li>It was easier to map hostnames to IP addresses.</li>\n<li>Vagrant with CoreOS was simpler to manage Docker images and containers than boot2docker.</li>\n<li>To sync files between local machine, virtual machine, and the Docker container was tricky, so I made Wocker commands to make it easier.</li>\n</ol>\n<p>If you want to test out Wocker and find that it&#8217;s not for you, it&#8217;s easy and fast to uninstall. Simply run <code>$ vagrant destroy</code> to remove the Wocker folder, and your local machine will always be clean.</p>\n<p>I tested Wocker and found that it was insanely fast to create new containers (as well as restart existing ones), a task for which I would require an extra utility (such as <a href="http://wptavern.com/variable-vvv-a-new-vvv-site-creation-wizard-for-wordpress" target="_blank">Variable VVV</a>) to perform with VVV. If you find VVV to be too slow and want to check out an alternative, <a href="http://wckr.github.io/" target="_blank">Wocker</a> provides a faster way to set up simple development environments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 00:52:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: WordCamp Europe Now Taking Applications for 2016 Host City";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40057";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wptavern.com/wordcamp-europe-now-taking-applications-for-2016-host-city";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4150:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/09/wceu-volunteers.jpg" rel="prettyphoto[40057]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/09/wceu-volunteers.jpg?resize=1025%2C485" alt="wceu-volunteers" class="aligncenter size-full wp-image-31631" /></a></p>\n<p>Organizing an event the size of <a href="http://europe.wordcamp.org/2015/" target="_blank">WordCamp Europe</a> is a year-round endeavor. The 2015 event is just four months away, speaker applications are closed, and the organization team is already asking for applications for the next host city. So far, the camp has been held in Leiden and Sofia, and will come to Seville in June.</p>\n<p>Applying to host WordCamp Europe is similar to applying to be an Olympic city. Local WordPress communities in potential host cities must submit applications, including a budget and a convincing plan. Organizers scrutinize the applications for the following factors:</p>\n<ul>\n<li>Preparation of the budget and venue research</li>\n<li>Strength of the local WordPress community</li>\n<li>The merits of the new location, as compared to the previous year</li>\n<li>Affordability for attendees</li>\n<li>Potential travel difficulties</li>\n</ul>\n<p>This year <a href="http://wptavern.com/seville-spain-to-host-wordcamp-europe-2015" target="_blank">Seville, Spain was selected as the host city</a> after a short bidding process. WordCamp Central requested the event be scheduled earlier in the year to avoid calendar conflicts. This was an unusual turn of events but organizers are committed to re-instituting a public bidding process for all future events.</p>\n<h3>WordCamp Europe to Pilot New Organizer Mentorship Program</h3>\n<p>For months in advance, an all-star lineup of WordCamp organizers from around Europe put their heads together, sharing their experiences to plan the best event possible.</p>\n<p>&#8220;Organizing WordCamp Europe is both a pleasure and a challenge,&#8221; co-organizer Petya Raykovska told the Tavern. &#8220;What’s great about it is that you get to work with experienced WordCamp organizers from across Europe. Each organizer brings their own knowledge and perspective to the organizing team which makes it a fantastic opportunity to learn and grow.&#8221;</p>\n<p>The event has traditionally highlighted the diversity of the European WordPress community and its <a href="http://wptavern.com/wordpress-beyond-boundaries-a-recap-of-wordcamp-europe-2014" target="_blank">attendees&#8217; eagerness to connect beyond boundaries</a>.</p>\n<p>&#8220;It’s a challenge because each of us has our own way of doing things and we have to learn how to listen to each other and compromise,&#8221; Raykovska said. &#8220;And, of course, there are all of those idioms that don’t cross language and cultural barriers!&#8221;</p>\n<p>New WordCamp Europe organizers should be equipped with a solid grasp of diplomacy and the ability to work with others across cultural differences.</p>\n<p>This year the current organization team plans to experiment with a mentorship program that would prepare the next crop of organizers to take the helm in 2016.</p>\n<p>&#8220;We&#8217;re introducing a new process that we hope will help not only find the best team for next year, but will also be a pilot for a mentorship program for future WordCamp Europe (or any large 600+ people WordPress event) events,&#8221; Raykovska said.</p>\n<p>&#8220;So what we want to do in 2015 is choose the team for 2016 and get them to work with us for the 2015 edition, so they can get to know what it takes, get introduced to the processes, work closely with the existing team and monitor what&#8217;s required of the local team.&#8221;</p>\n<p>Current organizers are prioritizing mentoring new additions in order to create a seamless transition from one organizational team to the next. Instead of learning the ropes at the last minute, new organizers will have the opportunity to see how it works without all of the pressure.</p>\n<p>&#8220;We believe it will be highly beneficial for them and will ensure smooth sailing for next year&#8217;s organisation,&#8221; Raykovska said.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 19:32:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:100:"WPTavern: New Theme Development Company Makes First Sale Minutes After Being Approved on ThemeForest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40045";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:110:"http://wptavern.com/new-theme-development-company-makes-first-sale-minutes-after-being-approved-on-themeforest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4372:"<p><a title="http://warriorsofcode.com/" href="http://warriorsofcode.com/">Warriors Of Code</a> is a new WordPress theme development shop in Australia. An employee who goes by the name <a title="http://www.reddit.com/user/genesisfan" href="http://www.reddit.com/user/genesisfan">Genesisfan</a> on Reddit, <a title="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/" href="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/">published a post </a>explaining how the company recently had its first theme accepted on ThemeForest and was willing to answer questions others had about the experience. According to the post, he spent the better part of six months with a designer he hired while working a full-time job developing <a title="http://themeforest.net/item/broadsword-a-wordpress-theme-to-share-stories/full_screen_preview/10514496" href="http://themeforest.net/item/broadsword-a-wordpress-theme-to-share-stories/full_screen_preview/10514496">Broadsword</a>.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/BroadSword.png" rel="prettyphoto[40045]"><img class="size-full wp-image-40046" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/BroadSword.png?resize=1025%2C496" alt="BroadSword Single Page View" /></a>BroadSword Single Page View\n<p>When asked what he thought of the ThemeForest submission and review process, he responded, &#8220;We were pleasantly surprised with how quickly they turned around our review, and the level of detail they provided in their soft rejection. Aside from some technicalities that we&#8217;d missed (being more specific about what features we supported), the biggest issue was that we were missing some data validation in our files. Make sure you use the esc_ and sanitize_ functions provided by WordPress!&#8221;</p>\n<p>Once the issues were addressed, ThemeForest approved the submission and the team made its first sale within minutes of it going live. When asked what makes their theme different in the marketplace, he responded, &#8220;We kept the theme options to a minimum. We were both pretty tired of themes that include a thousand options and tend to be more like frameworks than standalone themes.&#8221;</p>\n<p>Based on <a title="http://wptavern.com/envato-continues-to-rake-in-the-cash-from-wordpress-themes-packaged-as-complete-website-solutions" href="http://wptavern.com/envato-continues-to-rake-in-the-cash-from-wordpress-themes-packaged-as-complete-website-solutions">stats that highlight</a> how well ThemeForest is doing, it&#8217;s not surprising that Warriors of code made their first sale within minutes of going live. However, the company used social media to its advantage, so it&#8217;s possible one their followers purchased the theme based on tweets. In fact, the company explains how they handled promotion:</p>\n<blockquote><p>Regarding promotion, we&#8217;ve been tweeting it out and liking the facebook page we&#8217;ve set up and luckily, it&#8217;s now trending on ThemeForest. It helps that I&#8217;m on the east coast of Canada and my partner is in Sydney, Australia, so we&#8217;re able to pretty much cover comment replies quickly at any time of the day. I think that goes a long way to helping promote a positive vibe about the theme.</p></blockquote>\n<p>After 24 hours, the company has six sales at $43 each. It&#8217;s not a huge amount, but it&#8217;s a start. The big takeaways is that ThemeForest reviews are catching insecure coding practices and making the first sale is a quick endeavor, especially if you already have a social media presence. The company <a title="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/" href="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/">answers several other questions</a> related to the experience.</p>\n<p>We know that in this instance, ThemeForest did its job to discover insecure coding practices during reviews. It&#8217;s also refreshing to hear from an up and coming theme company that they&#8217;re tired of theme options. I haven&#8217;t used their product so I can&#8217;t confirm if its claims are true, but it&#8217;s a step in the right direction to see other ThemeForest sellers make such statements in public.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 07:33:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: WIRED Re-launch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44764";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2015/03/wired-re-launch/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2726:"<p>There&#8217;s the smart publishers, and then there&#8217;s the <a href="http://ma.tt/2015/02/developer-employment-act/">ones going out of business</a>. WIRED is one of the smart ones, and just launched an awesome redesign on WordPress. <a href="http://www.wired.com/2015/03/our-new-site/">From their editor-in-chief</a>:</p>\n<blockquote><p>Back in 1994 we launched Hotwired, the first site with original editorial content created for the web. It was a digital home for reporting on the future of science, business, design, and technology. You’ve come to trust us over the past two decades, but our growth online has sometimes come too quickly and with some pain. When I took over as editor in chief in 2012, WIRED had an archive of more than 100,000 stories. That’s good! But they were spread out over more than a dozen different databases, sections, and homepages tenuously connected by virtual duct tape and chewing gum. The cleanup process—onerous and without a shred of glamour—took almost 15 months. But finally, last year, our engineers rolled out a newly unified site architecture built atop a single streamlined WordPress installation. And you didn’t notice a hiccup. Maybe you saw that pages loaded a touch faster. Stories looked more WIRED.</p></blockquote>\n<p>The story of <a href="http://www.wired.com/2015/03/wired-dot-com-from-the-devs/">the engineering behind it from Kathleen Vignos is also cool</a>:</p>\n<blockquote><p>The redesign gives us the third incarnation of our Curator application, which started years ago as a separate Groovy on Grails application maintained by a single Java developer. Curator once consumed articles from 35 different blogs for curation on our homepage. When we migrated our 17 active WordPress blogs into one WordPress install, we also rewrote Curator in Cake PHP to match our WordPress PHP backend. After this, anyone on our team could maintain Curator—but the architecture remained the same and lived outside of WordPress. Using this version of Curator, our web producer team manually constructed the homepage throughout each day as various stories were ready to be promoted.</p>\n<p>Our new and improved Curator is now a custom WordPress plugin—and it’s artificially intelligent! This allows our homepage and section landing pages to be both automated and curated at the same time. Stories flow through automagically based on editorial criteria, but editors can take control of the flow by locking stories in certain slots in our card system. This means our homepage and section landing pages are constantly changing with new stories all day long.</p></blockquote>\n<p>Curator sounds cool, as does the coming &#8220;longform feature article builder.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 02:36:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"WPTavern: Ninja Forms 2.9 Ships With Major Performance Improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wptavern.com/ninja-forms-2-9-ships-with-major-performance-improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5648:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png" rel="prettyphoto[39995]"><img class="aligncenter size-full wp-image-40019" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png?resize=840%2C273" alt="Ninja Forms Featured Image" /></a></p>\n<p>Ninja Forms <a title="https://ninjaforms.com/version-2-9/" href="https://ninjaforms.com/version-2-9/">2.9 is available</a> and features an improved user experience along with major performance enhancements. One of the biggest performance problems 2.9 solves is handling large forms. Prior to 2.9, users had to edit a php.ini file to handle the increased amount of server resources needed to process long forms, something many shared webhosts don&#8217;t allow. According to Kevin Stover, lead developer of Ninja Forms, 2.9 not only solves this problem, but the form builder is more efficient overall.</p>\n<blockquote><p>In our local tests, a 578 field form was 12.8mb and took 33.52 seconds to load. (It also occasionally crashed our browser.) In version 2.9, the same form was only 1.2mb and took only 1.41 seconds to load. We call that progress.</p></blockquote>\n<p>The user experience is vastly improved compared to earlier versions of the plugin. Now when you edit an existing form or want to create a new one, you&#8217;re taken to the form builder instead of a page filled with confusing settings. After installing Ninja Forms, it took less than five minutes to recreate the <a title="http://wptavern.com/contact-me" href="http://wptavern.com/contact-me">Tavern&#8217;s contact form</a>.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29UserInterface.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40012" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29UserInterface.png?resize=1025%2C500" alt="Ninja Forms 2.9 User Interface" /></a>Ninja Forms 2.9 User Interface\n<p>A small but noticeable change is that, when you create a new form without a submit button and save it, a model window pops up reminding you to add one. Or, you can let Ninja Forms add it automatically. It&#8217;s hard to make a form useful without a submit button!</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29SubmitButtonReminder.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40013" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29SubmitButtonReminder.png?resize=549%2C268" alt="Ninja Forms 2.9 Submit Button" /></a>Ninja Forms 2.9 Submit Button Reminder\n<p>One of the major changes to the form building experience is configuring fields. In previous versions of Ninja Forms, all of the configuration options for fields were in view which felt overwhelming. In Ninja Forms 2.9, field options are hidden behind drop down menus that are closed by default. This allows you to configure them at your own pace.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFieldSettings.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40014" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFieldSettings.png?resize=535%2C477" alt="Ninja Forms 2.9 Field Settings" /></a>Ninja Forms 2.9 Field Settings\n<p>Overall, Ninja Forms 2.9 is a solid release and offers a better experience than its predecessors. I found it easier to build forms without having to rely on documentation. Stover says this release, &#8220;lays the groundwork for even better stuff to come down the road.&#8221; You can download Ninja Forms free from the <a title="https://wordpress.org/plugins/ninja-forms/" href="https://wordpress.org/plugins/ninja-forms/">WordPress plugin directory</a>.</p>\n<p>To learn more about James Laws, Co-founder of WP Ninjas and his company, <a title="http://wptavern.com/wpweekly-episode-179-interview-with-james-laws-co-founder-of-wp-ninjas" href="http://wptavern.com/wpweekly-episode-179-interview-with-james-laws-co-founder-of-wp-ninjas">listen to episode 179</a> of WordPress Weekly. In the show, we discuss some of the improvements that made it into Ninja Forms 2.9.</p>\n<div class="audio-shortcode-wrap"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png?resize=175%2C131" alt="Ninja Forms Featured Image" class="landscape thumbnail post-thumbnail audio-image" /><a href="http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3">http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3</a></div><div class="media-shortcode-extend"><div class="media-info audio-info"><ul class="media-meta"><li><span class="prep">Run Time</span> <span class="data">1:17:51</span></li><li><span class="prep">Artist</span> <span class="data">Jeff Chandler and Marcus Couch</span></li><li><span class="prep">Album</span> <span class="data">WordPress Weekly</span></li><li><span class="prep">Track</span> <span class="data">179</span></li><li><span class="prep">File Name</span> <span class="data"><a href="http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3">EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3</a></span></li><li><span class="prep">File Size</span> <span class="data">33.64 MB</span></li><li><span class="prep">File Type</span> <span class="data">MP3</span></li><li><span class="prep">Mime Type</span> <span class="data">audio/mpeg</span></li></ul></div><button class="media-info-toggle">Audio Info</button></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 00:32:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: BuddyPress 2.3 Development Kicks Off, Contributors Prioritize Work on New APIs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/buddypress-2-3-development-kicks-off-contributors-prioritize-work-on-new-apis";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2810:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/04/buddypress-wall.jpg" rel="prettyphoto[39890]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/04/buddypress-wall.jpg?resize=1018%2C458" alt="buddypress-wall" class="aligncenter size-full wp-image-20901" /></a></p>\n<p>The BuddyPress 2.3 development cycle is now in full swing, following a successful 2.2.1 maintenance release that <a href="http://wptavern.com/buddypress-breaks-one-day-download-record-with-2-2-1-release" target="_blank">broke the plugin&#8217;s one-day download record</a> with more than 10,000 downloads in just 24 hours. More minor fixes are on deck for inclusion in the forthcoming 2.2.2 release.</p>\n<p>This week contributors identified priorities for new features and improvements to work on for the <a href="https://bpdevel.wordpress.com/2015/03/03/bp-2-3-0-dev-cycle-contributor-priorities/" target="_blank">2.3 development cycle</a>. Updates to BuddyPress&#8217; existing APIs and work on the following new APIs commenced this week:</p>\n<ul>\n<li><a href="https://buddypress.trac.wordpress.org/ticket/6210" target="_blank">New Invitations API</a> &#8211; a flexible API to create/retrieve invitations across components</li>\n<li><a href="https://buddypress.trac.wordpress.org/ticket/5429" target="_blank">New Attachments API</a> &#8211; a new component to manage BuddyPress attachments</li>\n<li><a href="https://github.com/paulgibbs/buddypress/tree/posts2posts" target="_blank">Possible new Relationships API</a> &#8211; for the Favorites/Likes features</li>\n<li>Improvements to Member Types API &#8211; <a href="https://buddypress.trac.wordpress.org/ticket/5192" target="_blank">ability to create member-type-specific xprofile fields</a>, fixes for existing bugs</li>\n<li>Notifications API &#8211; <a href="https://buddypress.trac.wordpress.org/ticket/6257" target="_blank">add a metadata table</a> &#8211; useful for storing additional data outside the available notification table&#8217;s schema</li>\n</ul>\n<p>New APIs would make it possible for BuddyPress developers to build extensions that bring in more exciting features, such as a core-supported way to manage media/user galleries, local avatar management, invitation capabilities for groups, sites, blogs, docs, etc. The APIs give developers a way to custom tailor those experiences for their communities.</p>\n<p>While none of these APIs and improvements are yet guaranteed to make it into 2.3, contributors have hammered out the tickets they will be investing in during the next three months. The official release is currently targeted for the end of May, 2015. To follow progress on tickets for the 2.3 milestone, check out the <a href="https://buddypress.trac.wordpress.org/milestone/2.3" target="_blank">roadmap</a> on BuddyPress trac.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 22:10:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"Post Status: Adii Pienaar is making a WordPress comeback with stake in Obox";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=9009";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"https://poststatus.com/adii-pienaar-making-wordpress-comeback-stake-obox/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6289:"<p>Adii Pienaar has been largely away from the WordPress community for much of the last year and a half. He&#8217;s one of three co-founders of WooThemes and was instrumental in <a href="http://www.woothemes.com/about/">their growth</a> and success they achieved from 2008 until his departure in late 2013.</p>\n<p>Today, Adii is making the second step of his WordPress comeback. In addition to <a href="https://receiptful.com/">Receiptful</a> &#8212; his new eCommerce receipts product &#8212; he&#8217;s taking on an advisory role with Obox, to go along with a cash investment in the company.</p>\n<p><a href="http://oboxthemes.com/">Obox</a> is based in Cape Town, South Africa &#8212; where Adii and WooThemes are also based. Obox has been around the block as well.</p>\n<p>They were founded in 2009 and are lead by brothers Marc and David Perel. Obox has experienced times of great success &#8212; peaking as a team of 8 in 2012 &#8212; and also years where they&#8217;ve scaled back in response to more competition and watering down of the WordPress theme market.</p>\n<p>Before Adii left WooThemes, he had numerous conversations with Obox about an acquisition, but the parties could never agree on the specifics.</p>\n<h3>Adii now owns a 30% stake in Obox</h3>\n<p>David Perel showed Adii some screenshots of Layers while they were wrapping up development of <a title="Layers, by Obox, introduces a beautiful page building interface" href="https://poststatus.com/layers-theme-obox/">the new product</a>. Adii was intrigued and they started once again talking about joining forces, except this time the direction changed; they started talking about what it would look like for Adii to join Obox.</p>\n<p>Adii has made a cash investment in the Obox team, in return for a 30% stake in the company. The investment gives Obox a valuation in the millions of dollars, &#8220;but less than $10 million.&#8221;</p>\n<p>The cash from Adii&#8217;s investment is largely going to be used for operating expenses for the Obox team as they create the business model around Layers. Obox has also beefed up their team by <a href="http://blog.oboxthemes.com/calyx-joins-obox/">acquihiring Calyx</a>, a two man Cape Town agency.</p>\n<p>According to David, <span class="pullquote alignright">&#8220;Every cent Obox raises and makes will go into Layers.&#8221;</span></p>\n<h3>Roller coaster ride</h3>\n<p>Adii has been on a bit of a roller coaster ride since his departure of WooThemes. I&#8217;ve heard both Adii and his cofounders (Magnus Jepson and Mark Forrester) describe their split as a divorce. It was a hard time.</p>\n<p>The split was complete, and Adii released all ownership of the company for an amount he has <a href="http://mixergy.com/interviews/adii-pienaar-public-beta-interview/">confirmed on Mixergy</a> was seven figures. He tells me that he has been fully paid for his shares.</p>\n<p>With cash in hand, Adii had room to take some risks, and with that risk came a mixture of successes and failures. His first foray into another product was Public Beta, which had many iterations before he ultimately deemed it a lost cause.</p>\n<p>His latest startup seems to have traction; Receiptful has had a successful launch, is getting nice adoption, and is expanding to multiple eCommerce platforms after an initial WooCommerce-only launch.</p>\n<p>Time heals all wounds, and it appears Adii&#8217;s relationship with WooThemes is also mended. They even <a href="http://www.woothemes.com/2015/02/why-customized-receipts-increase-ecommerce-revenue/">blogged about Receiptful</a> recently on the main WooThemes blog.</p>\n<h3>Renewed passion for WordPress</h3>\n<p>Both Receiptful and the Obox investment show renewed passion for WordPress, as well as a sign of Adii getting back to his roots and what he knows best. With the launch of WooCommerce, Adii spearheaded what became a huge success during his time at WooThemes; and WooCommerce has only further grown since his departure.</p>\n<p>Adii hopes to take what he&#8217;s learned &#8212; both at WooThemes and with his adventures since &#8212; to his role at Obox.</p>\n<blockquote><p>One of the biggest challenges within WordPress is the disconnect between how developers and end-users use it, which makes building great WordPress products really hard. It&#8217;s also something that we encountered often at Woo and instead of truly tackling the problem we leaned towards building tools for developers.</p>\n<p>Layers is different in that sense, because it&#8217;s focused on the (end-)user experience from the ground up. I couldn&#8217;t be more excited to work with David &amp; Marc to grow Layers, as they&#8217;re fanatical about UX and it&#8217;s my belief that they&#8217;ll finally make progress to closing the gap between a developer tool and end-user product.</p>\n<p>And in terms of the commercialisation of Layers&#8230; Well, let&#8217;s just say that I see opportunities and patterns that were prevalent in WooCommerce&#8217;s early days too&#8230;</p></blockquote>\n<h3>A new step for a dynamic WordPress figure</h3>\n<p>Adii was a huge and dynamic figure in the early days of WordPress&#8217; commercial product space. He&#8217;s always made bold decisions &#8212; some good and some not so good.</p>\n<p>He has a penchant to make quick decisions and he iterates at a rapid pace; to some it can be off-putting, but for finding a hit it can be hugely important. In contrast, the Obox team makes calculated risks. While they&#8217;ve done a great deal of interesting work and experimentation on their own, they have largely stuck with the theme business while some of their early theme competitors rotated toward plugins and other verticals.</p>\n<p>I believe that the combination of Adii and the Perel brothers will make for a compelling trio of leadership at the helm for Obox. Their Layers launch <a href="http://blog.oboxthemes.com/what-hitting-the-top-spot-on-product-hunt-did-to-our-launch-day/">certainly made waves</a>, and their next steps will be hugely important for the future of a company that has gone all in on a product without a monetization strategy.</p>\n<p>You can read the <a href="http://blog.oboxthemes.com/adii-co-founder-of-woothemes-and-woocommerce-has-joined-obox/">official announcement on the Obox blog</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 15:56:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WordPress Plugin Directory Launches New Design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39957";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wptavern.com/wordpress-plugin-directory-launches-new-design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3778:"<p>The WordPress.org Meta team is on a roll this month. Following the successful <a href="http://wptavern.com/wordpress-theme-directory-launches-new-design" target="_blank">launch of the new theme directory</a>, the <a href="https://wordpress.org/plugins/" target="_blank">plugin directory</a> is getting the same treatment with <a href="https://make.wordpress.org/meta/2015/03/04/new-plugin-directory-theme/" target="_blank">a fresh coat of paint</a> and a set of brand new features.</p>\n<p>Browsing the official plugin directory is now similar to searching via the admin plugin browser. Having all of this code on hand made it easier for the meta team to replicate the experience in the directory.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-plugin-directory.png" rel="prettyphoto[39957]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-plugin-directory.png?resize=1025%2C970" alt="wordpress-plugin-directory" class="aligncenter size-full wp-image-39963" /></a></p>\n<p>In addition to the new design, the directory includes a new section for logged-in users to manage favorited plugins. Previously, users had to navigate to their own profile pages to access this information. With more than 36,000 listings in the directory, favorites are becoming an important feature for users who want to keep track of plugins they use frequently.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/plugin-favorites.png" rel="prettyphoto[39957]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/plugin-favorites.png?resize=1025%2C511" alt="plugin-favorites" class="aligncenter size-full wp-image-39975" /></a></p>\n<p>The &#8220;Popular&#8221; section seems to be populated by extensions with the highest number of active installs. It would be helpful to be able to further sort popular plugins based on different criteria, i.e. the most-favorited plugins and those with the highest ratings.</p>\n<p><a href="https://wordpress.org/plugins/browse/beta/" target="_blank">Beta Testing</a> is a new section which you may recognize from the WordPress admin. It lists all the feature plugins that are currently under consideration for inclusion in core at some point in the future. This more prominent display will help users discover the plugins, resulting in an increase in feedback for contributors.</p>\n<p>Users can also now search for plugins based on author, keyword, or tag. Searching is lightning fast, but it could be improved with filtering options to further narrow down the results.</p>\n<p>Although individual plugin pages did not receive a design update, they now reflect more accurate data with the number of active installs for each plugin. This provides plugin authors with a better understanding of how many sites are actively using that functionality, as opposed to just having downloaded it once and then uninstalled it.</p>\n<p>The new design is more visually-oriented than the previous one, making it easier for users to quickly scan through a long list of results. It is now more important than ever for developers to prioritize <a href="http://wptavern.com/wordpress-4-0-adds-custom-icons-to-the-plugin-installer" target="_blank">plugin branding</a> if they want their work to stand out in the official directory.</p>\n<p>In his <a href="https://make.wordpress.org/meta/2015/03/04/new-plugin-directory-theme/" target="_blank">announcement</a> about updates to the plugin directory, WordPress.org contributor Scott Reilly said that a backend reimplementation of the directory is on the roadmap for a future update. If you find a bug in the current implementation, feel free to open a ticket on <a href="https://meta.trac.wordpress.org/" target="_blank">meta.trac</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 09:25:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Matt: WordPress iOS WYSIWYG";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44747";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"http://ma.tt/2015/03/wordpress-ios-wysiwyg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:499:"<p>It&#8217;s been a long road, but the WordPress mobile apps are finally making some major strides. <a href="https://apps.wordpress.org/2015/02/26/wordpress-for-ios-a-new-visual-editor-more/">WordPress iOS version 4.8 includes a visual editor so you won&#8217;t see code anymore when blogging on the go</a>. (For anyone curious at home, WordPress originally <a href="https://wordpress.org/news/2005/12/wp2/">shipped with WYSIWYG in version 2.0</a>, and it was highly controversial at the time.)</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 04:31:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:33 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"193091";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Tue, 17 Mar 2015 14:30:12 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20130911070210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(400, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1426646515', 'no'),
(401, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1426603315', 'no'),
(402, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1426646516', 'no'),
(403, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Mar 2015 14:19:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"The easiest, most effective way to secure WordPress in seconds.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"MailChimp for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/mailchimp-for-wp/#post-54377";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 10 Jun 2013 17:32:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"54377@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The best MailChimp plugin to get more email subscribers. Easily add MailChimp sign-up forms and sign-up checkboxes to your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Danny van Kooten";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"bbPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/bbpress/#post-14709";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Dec 2009 00:05:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14709@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:50:"bbPress is forum software, made the WordPress way.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"John James Jacoby";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ManageWP Worker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/worker/#post-24528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Feb 2011 13:06:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"24528@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"ManageWP is the ultimate WordPress productivity tool, allowing you to efficiently manage your websites.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Vladimir Prelovac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Contact Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/plugins/contact-form-plugin/#post-26890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 May 2011 07:34:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26890@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:43:"Add Contact Form to your WordPress website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bestwebsoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5468@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"Make your WordPress website mobile-friendly with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/nextgen-facebook/#post-40409";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Jul 2012 20:13:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"40409@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Display your content in the best possible way on Facebook, Google+, Twitter, Pinterest, etc. - no matter how your webpage is shared!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"JS Morisset";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"WP Statistics";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-statistics/#post-25318";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 20 Mar 2011 09:03:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25318@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:44:"Complete statistics for your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Mostafa Soufi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-Optimize";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/wp-optimize/#post-8691";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 21 Jan 2009 04:28:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8691@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Simple but effective plugin allows you to extensively clean up your WordPress database and optimize it without doing manual queries.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"ruhanirabin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Page Links To";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/page-links-to/#post-216";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:53:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"216@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"Lets you make a WordPress page (or other content type) link to an external URL of your choosing, instead of its WordPress URL.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Mark Jaquith";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"NextScripts: Social Networks Auto-Poster";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"https://wordpress.org/plugins/social-networks-auto-poster-facebook-twitter-g/#post-35439";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 02 Mar 2012 00:28:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"35439@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Automatically re-publishes blogposts to Facebook, Twitter, Google+, Pinterest, LinkedIn, Blogger, Tumblr, Delicious, Plurk, etc profiles and/or pages";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"NextScripts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Antispam Bee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/antispam-bee/#post-8484";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Jan 2009 08:43:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8484@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"„... another popular solution to fight spam is Antispam Bee“ – Matt Mullenweg, Q&#38;A WordCamp Europe 2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"stalkerX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:35 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Tue, 17 Mar 2015 14:54:34 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 17 Mar 2015 14:19:34 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20130911070210";}', 'no'),
(404, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1426646516', 'no'),
(405, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1426603316', 'no'),
(406, '_transient_timeout_plugin_slugs', '1426689716', 'no'),
(407, '_transient_plugin_slugs', 'a:9:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"buddypress/bp-loader.php";i:2;s:50:"google-analytics-for-wordpress/googleanalytics.php";i:3;s:39:"siteorigin-panels/siteorigin-panels.php";i:4;s:23:"papercite/papercite.php";i:5;s:27:"theme-check/theme-check.php";i:6;s:27:"woocommerce/woocommerce.php";i:7;s:23:"wordfence/wordfence.php";i:8;s:24:"wordpress-seo/wp-seo.php";}', 'no'),
(408, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1426646516', 'no'),
(409, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/''>WordPress 4.2 Beta 1</a> <span class="rss-date">Marzo 12, 2015</span><div class="rssSummary">WordPress 4.2 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://ma.tt/2015/03/meetups-around-the-world/''>Matt: Meetups Around the World</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/ultimate-member-a-new-free-community-and-user-profile-plugin-for-wordpress''>WPTavern: Ultimate Member: A New Free Community and User Profile Plugin for WordPress</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/pods-framework-security-release-fixes-severe-vulnerability''>WPTavern: Pods Framework Security Release Fixes Severe Vulnerability</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Plugin popular:</span> <a href=''https://wordpress.org/plugins/nextgen-facebook/'' class=''dashboard-news-plugin-link''>NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=nextgen-facebook&amp;_wpnonce=1102ed1f2f&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More''>Instalar</a>)</span></li></ul></div>', 'no'),
(412, '_transient_is_multi_author', '0', 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Volcado de datos para la tabla `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_edit_last', '1'),
(3, 4, '_edit_lock', '1419304298:1'),
(4, 9, '_edit_lock', '1426469588:1'),
(5, 9, '_edit_last', '1'),
(6, 10, '_wp_attached_file', '2015/03/uaiblanco.jpg'),
(7, 10, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1138;s:6:"height";i:352;s:4:"file";s:21:"2015/03/uaiblanco.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"uaiblanco-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"uaiblanco-300x93.jpg";s:5:"width";i:300;s:6:"height";i:93;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"uaiblanco-1024x317.jpg";s:5:"width";i:1024;s:6:"height";i:317;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"uaiblanco-604x270.jpg";s:5:"width";i:604;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(8, 9, '_thumbnail_id', '10'),
(9, 13, '_menu_item_type', 'custom'),
(10, 13, '_menu_item_menu_item_parent', '0'),
(11, 13, '_menu_item_object_id', '13'),
(12, 13, '_menu_item_object', 'custom'),
(13, 13, '_menu_item_target', ''),
(14, 13, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(15, 13, '_menu_item_xfn', ''),
(16, 13, '_menu_item_url', 'http://localhost/wordpress/'),
(18, 14, '_menu_item_type', 'post_type'),
(19, 14, '_menu_item_menu_item_parent', '0'),
(20, 14, '_menu_item_object_id', '6'),
(21, 14, '_menu_item_object', 'page'),
(22, 14, '_menu_item_target', ''),
(23, 14, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(24, 14, '_menu_item_xfn', ''),
(25, 14, '_menu_item_url', ''),
(27, 15, '_menu_item_type', 'post_type'),
(28, 15, '_menu_item_menu_item_parent', '0'),
(29, 15, '_menu_item_object_id', '7'),
(30, 15, '_menu_item_object', 'page'),
(31, 15, '_menu_item_target', ''),
(32, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(33, 15, '_menu_item_xfn', ''),
(34, 15, '_menu_item_url', ''),
(36, 16, '_menu_item_type', 'post_type'),
(37, 16, '_menu_item_menu_item_parent', '0'),
(38, 16, '_menu_item_object_id', '2'),
(39, 16, '_menu_item_object', 'page'),
(40, 16, '_menu_item_target', ''),
(41, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(42, 16, '_menu_item_xfn', ''),
(43, 16, '_menu_item_url', ''),
(45, 17, '_menu_item_type', 'post_type'),
(46, 17, '_menu_item_menu_item_parent', '0'),
(47, 17, '_menu_item_object_id', '4'),
(48, 17, '_menu_item_object', 'page'),
(49, 17, '_menu_item_target', ''),
(50, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(51, 17, '_menu_item_xfn', ''),
(52, 17, '_menu_item_url', ''),
(54, 18, '_menu_item_type', 'post_type'),
(55, 18, '_menu_item_menu_item_parent', '0'),
(56, 18, '_menu_item_object_id', '9'),
(57, 18, '_menu_item_object', 'page'),
(58, 18, '_menu_item_target', ''),
(59, 18, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(60, 18, '_menu_item_xfn', ''),
(61, 18, '_menu_item_url', ''),
(63, 2, '_edit_last', '1'),
(64, 2, '_edit_lock', '1426505334:1'),
(65, 20, '_wp_attached_file', '2015/03/iuai-tech_negro.jpg'),
(66, 20, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:650;s:6:"height";i:200;s:4:"file";s:27:"2015/03/iuai-tech_negro.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"iuai-tech_negro-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"iuai-tech_negro-300x92.jpg";s:5:"width";i:300;s:6:"height";i:92;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"iuai-tech_negro-604x200.jpg";s:5:"width";i:604;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(67, 21, '_wp_attached_file', '2015/03/iuai-tech-transparente.png'),
(68, 21, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:650;s:6:"height";i:200;s:4:"file";s:34:"2015/03/iuai-tech-transparente.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"iuai-tech-transparente-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:33:"iuai-tech-transparente-300x92.png";s:5:"width";i:300;s:6:"height";i:92;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:34:"iuai-tech-transparente-604x200.png";s:5:"width";i:604;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(69, 22, '_wp_attached_file', '2015/03/iuai-tech_blanco.jpg'),
(70, 22, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:650;s:6:"height";i:200;s:4:"file";s:28:"2015/03/iuai-tech_blanco.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"iuai-tech_blanco-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:27:"iuai-tech_blanco-300x92.jpg";s:5:"width";i:300;s:6:"height";i:92;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:28:"iuai-tech_blanco-604x200.jpg";s:5:"width";i:604;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(71, 21, '_wp_attachment_custom_header_last_used_twentythirteen', '1426601036'),
(72, 21, '_wp_attachment_is_custom_header', 'twentythirteen'),
(73, 24, '_edit_lock', '1426606049:1'),
(74, 24, '_edit_last', '1'),
(77, 24, '_yoast_wpseo_focuskw', 'profesores'),
(78, 24, '_yoast_wpseo_linkdex', '40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Bienvenido(a) a WordPress. Esta es su primera entrada. Edítela o bórrela ¡y empiece a publicar! Gracias por usar <a href="http://pe.wordpress.org/">WordPress en español</a>.', '¡Hola mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2014-12-23 02:39:57', '2014-12-23 02:39:57', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Esta es una página de ejemplo. Es diferente a una entrada del blog, ya que se quedará en un lugar y se mostrará en la navegación del sitio (en la mayoría de temas). La mayoría de personas empieza con una página "Acerca de" que brinda información a los visitantes. Se podría decir algo como esto:\n\n<blockquote>¡Hola! Durante el día soy un mensajero, un aspirante a actor por la noche, y este es mi blog. Vivo en Lima, tengo un enorme perro llamado Pocho, y me gusta el Pisco Sour. (Y caminar bajo la lluvia.)</blockquote>\n\n...o algo como esto:\n\n<blockquote>La compañía XYZ, se fundó en 1971, y ha estado desde entonces, proporcionando artilugios de calidad al público. Está situado en la ciudad de Lima, XYZ emplea a más de 2,000 personas y hace todo tipo de cosas sorprendentes para la comunidad limeña.</blockquote>\n\nComo nuevo usuario de WordPress, usted debe ir a <a href="http://localhost/wordpress/wp-admin/">su panel</a> para eliminar esta página y crear nuevas para su contenido. ¡Que se divierta!', 'Noticias', '', 'publish', 'open', 'closed', '', 'pagina-de-ejemplo', '', '', '2015-03-16 11:28:54', '2015-03-16 11:28:54', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 2),
(4, 1, '2014-12-23 03:13:09', '2014-12-23 03:13:09', 'En este espacio van a encontrarse los profesores + adepti + FIC.', 'Personas', '', 'publish', 'open', 'open', '', 'personas', '', '', '2014-12-23 03:13:09', '2014-12-23 03:13:09', '', 0, 'http://localhost/wordpress/?page_id=4', 0, 'page', '', 0),
(5, 1, '2014-12-23 03:13:09', '2014-12-23 03:13:09', 'En este espacio van a encontrarse los profesores + adepti + FIC.', 'Personas', '', 'inherit', 'open', 'open', '', '4-revision-v1', '', '', '2014-12-23 03:13:09', '2014-12-23 03:13:09', '', 4, 'http://localhost/wordpress/?p=5', 0, 'revision', '', 0),
(6, 1, '2014-12-23 03:38:18', '2014-12-23 03:38:18', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2014-12-23 03:38:18', '2014-12-23 03:38:18', '', 0, 'http://localhost/wordpress/?page_id=6', 0, 'page', '', 0),
(7, 1, '2014-12-23 03:38:18', '2014-12-23 03:38:18', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2014-12-23 03:38:18', '2014-12-23 03:38:18', '', 0, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0),
(9, 1, '2015-03-15 23:29:03', '2015-03-15 23:29:03', '', 'Publicaciones', '', 'publish', 'open', 'open', '', 'front-page', '', '', '2015-03-16 01:35:14', '2015-03-16 01:35:14', '', 0, 'http://localhost/wordpress/?page_id=9', 0, 'page', '', 0),
(10, 1, '2015-03-15 23:28:46', '2015-03-15 23:28:46', '', 'uaiblanco', '', 'inherit', 'open', 'open', '', 'uaiblanco', '', '', '2015-03-15 23:28:46', '2015-03-15 23:28:46', '', 9, 'http://localhost/wordpress/wp-content/uploads/2015/03/uaiblanco.jpg', 0, 'attachment', 'image/jpeg', 0),
(11, 1, '2015-03-15 23:29:03', '2015-03-15 23:29:03', '', 'Front page', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-03-15 23:29:03', '2015-03-15 23:29:03', '', 9, 'http://localhost/wordpress/2015/03/9-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2015-03-16 01:35:14', '2015-03-16 01:35:14', '', 'Publicaciones', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-03-16 01:35:14', '2015-03-16 01:35:14', '', 9, 'http://localhost/wordpress/2015/03/9-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 'Inicio', '', 'publish', 'open', 'open', '', 'inicio', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=13', 1, 'nav_menu_item', '', 0),
(14, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', ' ', '', '', 'publish', 'open', 'open', '', '14', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=14', 2, 'nav_menu_item', '', 0),
(15, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', ' ', '', '', 'publish', 'open', 'open', '', '15', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=15', 3, 'nav_menu_item', '', 0),
(16, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 'Noticias', '', 'publish', 'open', 'open', '', 'noticias', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=16', 4, 'nav_menu_item', '', 0),
(17, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', ' ', '', '', 'publish', 'open', 'open', '', '17', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=17', 5, 'nav_menu_item', '', 0),
(18, 1, '2015-03-16 11:23:42', '2015-03-16 11:23:42', ' ', '', '', 'publish', 'open', 'open', '', '18', '', '', '2015-03-16 11:23:42', '2015-03-16 11:23:42', '', 0, 'http://localhost/wordpress/?p=18', 6, 'nav_menu_item', '', 0),
(19, 1, '2015-03-16 11:28:54', '2015-03-16 11:28:54', 'Esta es una página de ejemplo. Es diferente a una entrada del blog, ya que se quedará en un lugar y se mostrará en la navegación del sitio (en la mayoría de temas). La mayoría de personas empieza con una página "Acerca de" que brinda información a los visitantes. Se podría decir algo como esto:\n\n<blockquote>¡Hola! Durante el día soy un mensajero, un aspirante a actor por la noche, y este es mi blog. Vivo en Lima, tengo un enorme perro llamado Pocho, y me gusta el Pisco Sour. (Y caminar bajo la lluvia.)</blockquote>\n\n...o algo como esto:\n\n<blockquote>La compañía XYZ, se fundó en 1971, y ha estado desde entonces, proporcionando artilugios de calidad al público. Está situado en la ciudad de Lima, XYZ emplea a más de 2,000 personas y hace todo tipo de cosas sorprendentes para la comunidad limeña.</blockquote>\n\nComo nuevo usuario de WordPress, usted debe ir a <a href="http://localhost/wordpress/wp-admin/">su panel</a> para eliminar esta página y crear nuevas para su contenido. ¡Que se divierta!', 'Noticias', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-03-16 11:28:54', '2015-03-16 11:28:54', '', 2, 'http://localhost/wordpress/2015/03/2-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2015-03-17 13:59:01', '2015-03-17 13:59:01', '', 'iuai-tech_negro', '', 'inherit', 'open', 'open', '', 'iuai-tech_negro', '', '', '2015-03-17 13:59:01', '2015-03-17 13:59:01', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech_negro.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 'iuai-tech-transparente', '', 'inherit', 'open', 'open', '', 'iuai-tech-transparente', '', '', '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech-transparente.png', 0, 'attachment', 'image/png', 0),
(22, 1, '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 'iuai-tech_blanco', '', 'inherit', 'open', 'open', '', 'iuai-tech_blanco', '', '', '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech_blanco.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2015-03-17 14:41:50', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-03-17 14:41:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=23', 0, 'post', '', 0),
(24, 1, '2015-03-17 15:29:36', '2015-03-17 15:29:36', 'Debe estar en la primera página de todos los profesores.', 'Solo profesores', '', 'publish', 'open', 'open', '', 'solo-profesores', '', '', '2015-03-17 15:29:36', '2015-03-17 15:29:36', '', 0, 'http://localhost/wordpress/?p=24', 0, 'post', '', 0),
(25, 1, '2015-03-17 15:29:36', '2015-03-17 15:29:36', 'Debe estar en la primera página de todos los profesores.', 'Solo profesores', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-03-17 15:29:36', '2015-03-17 15:29:36', '', 24, 'http://localhost/wordpress/2015/03/24-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_signups`
--

CREATE TABLE IF NOT EXISTS `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `title` longtext NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `meta` longtext,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `name` (`name`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'Menú 1', 'menu-1', 0),
(7, 'Laboratorios', 'lab', 0),
(8, 'Grupos de Trabajo', 'grupos', 0),
(9, 'Profesores', 'profes', 0),
(10, 'Grupos de Trabajo', 'grupos', 0),
(11, 'Laboratorios', 'labs', 0),
(12, 'Robótica', 'robots', 0),
(13, 'Emprendimiento', 'emprende', 0),
(14, 'Energía', 'energia', 0),
(15, 'Medio ambiente', 'ma', 0),
(16, 'Estadística', 'est', 0),
(17, 'profesores', 'profesores', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(13, 6, 0),
(14, 6, 0),
(15, 6, 0),
(16, 6, 0),
(17, 6, 0),
(18, 6, 0),
(24, 9, 0),
(24, 17, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 0),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'nav_menu', '', 0, 6),
(7, 7, 'category', 'Aquí estarán las publicaciones exclusivas del personal de Laboratorios Físicos que son alrededor de 3 en total.', 0, 0),
(8, 8, 'category', 'Aquí estarán las publicaciones exclusivas de los grupos de trabajo existentes que son alrededor de 5 en total.', 0, 0),
(9, 9, 'category', 'Aquí estarán las publicaciones exclusivas de los profesores del área informática que son alrededor de 10 en total.', 0, 1),
(10, 10, 'post_tag', '', 0, 0),
(11, 11, 'post_tag', '', 0, 0),
(12, 12, 'post_tag', '', 0, 0),
(13, 13, 'post_tag', '', 0, 0),
(14, 14, 'post_tag', '', 0, 0),
(15, 15, 'post_tag', '', 0, 0),
(16, 16, 'post_tag', '', 0, 0),
(17, 17, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Volcado de datos para la tabla `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'cami2708'),
(2, 1, 'first_name', 'Camila'),
(3, 1, 'last_name', 'Miranda'),
(4, 1, 'description', 'Información básica 1.\r\nEn este recuadro se muestra lo que el usuario dueño desea que sea presentado en su perfil para que sea leído por otros usuarios que deseen saber más sobre el/ella.'),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'sunrise'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"d99a3e83ed64ebc9910be1ea8d2ea75ae1ca4c6cd7698ef9e1adcee22480c1e0";i:1426632613;}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '23'),
(16, 2, 'nickname', 'profesor1'),
(17, 2, 'first_name', 'Profesor'),
(18, 2, 'last_name', '1'),
(19, 2, 'description', ''),
(20, 2, 'rich_editing', 'true'),
(21, 2, 'comment_shortcuts', 'false'),
(22, 2, 'admin_color', 'fresh'),
(23, 2, 'use_ssl', '0'),
(24, 2, 'show_admin_bar_front', 'true'),
(25, 2, 'wp_capabilities', 'a:1:{s:6:"author";b:1;}'),
(26, 2, 'wp_user_level', '2'),
(27, 2, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(28, 3, 'nickname', 'profesor2'),
(29, 3, 'first_name', 'Profesor'),
(30, 3, 'last_name', '2'),
(31, 3, 'description', ''),
(32, 3, 'rich_editing', 'true'),
(33, 3, 'comment_shortcuts', 'false'),
(34, 3, 'admin_color', 'fresh'),
(35, 3, 'use_ssl', '0'),
(36, 3, 'show_admin_bar_front', 'true'),
(37, 3, 'wp_capabilities', 'a:1:{s:6:"author";b:1;}'),
(38, 3, 'wp_user_level', '2'),
(39, 3, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(40, 4, 'nickname', 'Estudiante1'),
(41, 4, 'first_name', 'Estudiante'),
(42, 4, 'last_name', '1'),
(43, 4, 'description', ''),
(44, 4, 'rich_editing', 'true'),
(45, 4, 'comment_shortcuts', 'false'),
(46, 4, 'admin_color', 'fresh'),
(47, 4, 'use_ssl', '0'),
(48, 4, 'show_admin_bar_front', 'true'),
(49, 4, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(50, 4, 'wp_user_level', '0'),
(51, 4, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(52, 5, 'nickname', 'Estudiante2'),
(53, 5, 'first_name', 'Estudiante'),
(54, 5, 'last_name', '2'),
(55, 5, 'description', ''),
(56, 5, 'rich_editing', 'true'),
(57, 5, 'comment_shortcuts', 'false'),
(58, 5, 'admin_color', 'fresh'),
(59, 5, 'use_ssl', '0'),
(60, 5, 'show_admin_bar_front', 'true'),
(61, 5, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(62, 5, 'wp_user_level', '0'),
(63, 5, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(64, 6, 'nickname', 'adepti'),
(65, 6, 'first_name', 'Adepti'),
(66, 6, 'last_name', 'CO'),
(67, 6, 'description', ''),
(68, 6, 'rich_editing', 'true'),
(69, 6, 'comment_shortcuts', 'false'),
(70, 6, 'admin_color', 'fresh'),
(71, 6, 'use_ssl', '0'),
(72, 6, 'show_admin_bar_front', 'true'),
(73, 6, 'wp_capabilities', 'a:1:{s:11:"contributor";b:1;}'),
(74, 6, 'wp_user_level', '1'),
(75, 6, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(76, 1, 'last_activity', '2015-03-17 15:30:16'),
(77, 1, 'wp_user-settings', 'libraryContent=browse'),
(78, 1, 'wp_user-settings-time', '1426462139'),
(79, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(80, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:23:"add-buddypress-nav-menu";i:1;s:8:"add-post";i:2;s:12:"add-post_tag";i:3;s:15:"add-post_format";}'),
(81, 1, 'nav_menu_recently_edited', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'cami2708', '$P$B1RsbJyAbsWPVb8uo2BZ243lJYZ7Q6/', 'cami2708', 'cami2708@yahoo.es', '', '2014-12-23 02:39:57', '', 0, 'Camila Miranda'),
(2, 'profesor1', '$P$BROCH2OaCN0uMvbaLcxPuw1nvwX9Gu.', 'profesor1', 'p@p.p', '', '2014-12-23 03:15:47', '', 0, 'Profesor 1'),
(3, 'profesor2', '$P$Bm4ADbJ9WYwVg3mUE.mk5vFeGFUgej/', 'profesor2', 'p@p.p2', '', '2014-12-23 03:16:30', '', 0, 'Profesor 2'),
(4, 'Estudiante1', '$P$BRd9.XvYDO4u/00sRmzqhOBp8xgTBq1', 'estudiante1', 'e@e.e', '', '2014-12-23 03:17:02', '', 0, 'Estudiante 1'),
(5, 'Estudiante2', '$P$BqvSelSQpQB71EUGxG.UhruJFfV4Ae/', 'estudiante2', 'e@e.e2', '', '2014-12-23 03:17:51', '', 0, 'Estudiante 2'),
(6, 'adepti', '$P$BDVj6fricJZAnpnPINNQw3PIGHt9Iq.', 'adepti', 'a@a.a', 'http://adepti.cl', '2014-12-23 03:18:40', '', 0, 'Adepti CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfbadleechers`
--

CREATE TABLE IF NOT EXISTS `wp_wfbadleechers` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfblocks`
--

CREATE TABLE IF NOT EXISTS `wp_wfblocks` (
  `IP` int(10) unsigned NOT NULL,
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) unsigned DEFAULT '0',
  `blockedHits` int(10) unsigned DEFAULT '0',
  `wfsn` tinyint(3) unsigned DEFAULT '0',
  `permanent` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`IP`),
  KEY `k1` (`wfsn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfblocksadv`
--

CREATE TABLE IF NOT EXISTS `wp_wfblocksadv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockType` char(2) NOT NULL,
  `blockString` varchar(255) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `totalBlocked` int(10) unsigned DEFAULT '0',
  `lastBlocked` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfconfig`
--

CREATE TABLE IF NOT EXISTS `wp_wfconfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `wp_wfconfig`
--

INSERT INTO `wp_wfconfig` (`name`, `val`) VALUES
('actUpdateInterval', ''),
('addCacheComment', 0x30),
('advancedCommentScanning', 0x30),
('alertEmails', ''),
('alertOn_adminLogin', 0x31),
('alertOn_block', 0x31),
('alertOn_critical', 0x31),
('alertOn_loginLockout', 0x31),
('alertOn_lostPasswdForm', 0x31),
('alertOn_nonAdminLogin', 0x30),
('alertOn_throttle', 0x30),
('alertOn_update', 0x30),
('alertOn_warnings', 0x31),
('alert_maxHourly', 0x30),
('allowHTTPSCaching', 0x30),
('apiKey', 0x35616461373730326161393830356631333630333332663936313538306439626265613964393463336637613362653164373066366236363734333334336132316234393936333430653233646530623933313637646361646630393637323363663133316134616566376333633037333464623039313831613863343833366161643537386538633532366530383639636264316666373831336362623061),
('autoBlockScanners', 0x31),
('autoUpdate', 0x31),
('autoUpdateChoice', 0x31),
('bannedURLs', ''),
('blockedTime', 0x333030),
('blockFakeBots', 0x30),
('cbl_restOfSiteBlocked', 0x31),
('checkSpamIP', 0x30),
('currentCronKey', ''),
('debugOn', 0x30),
('deleteTablesOnDeact', 0x30),
('disableCodeExecutionUploads', 0x30),
('disableCookies', 0x30),
('encKey', 0x35396239303030303431666530303030),
('firewallEnabled', 0x31),
('howGetIPs', ''),
('lastAdminLogin', 0x613a363a7b733a363a22757365724944223b693a313b733a383a22757365726e616d65223b733a383a2263616d6932373038223b733a393a2266697273744e616d65223b733a363a2243616d696c61223b733a383a226c6173744e616d65223b733a373a224d6972616e6461223b733a343a2274696d65223b733a32373a2253756e2031357468204d6172636820402031303a35303a3133504d223b733a323a224950223b623a303b7d),
('lastScanCompleted', 0x6f6b),
('lastScheduledScanStart', 0x31343236363030303938),
('liveTrafficEnabled', 0x31),
('liveTraf_ignoreIPs', ''),
('liveTraf_ignorePublishers', 0x31),
('liveTraf_ignoreUA', ''),
('liveTraf_ignoreUsers', ''),
('loginSecurityEnabled', 0x31),
('loginSec_blockAdminReg', 0x31),
('loginSec_countFailMins', 0x323430),
('loginSec_disableAuthorScan', 0x31),
('loginSec_lockInvalidUsers', 0x30),
('loginSec_lockoutMins', 0x323430),
('loginSec_maskLoginErrors', 0x31),
('loginSec_maxFailures', 0x3230),
('loginSec_maxForgotPasswd', 0x3230),
('loginSec_strongPasswds', 0x70756273),
('loginSec_userBlacklist', ''),
('max404Crawlers', 0x44495341424c4544),
('max404Crawlers_action', 0x7468726f74746c65),
('max404Humans', 0x44495341424c4544),
('max404Humans_action', 0x7468726f74746c65),
('maxExecutionTime', ''),
('maxGlobalRequests', 0x44495341424c4544),
('maxGlobalRequests_action', 0x7468726f74746c65),
('maxMem', 0x323536),
('maxRequestsCrawlers', 0x44495341424c4544),
('maxRequestsCrawlers_action', 0x7468726f74746c65),
('maxRequestsHumans', 0x44495341424c4544),
('maxRequestsHumans_action', 0x7468726f74746c65),
('maxScanHits', 0x44495341424c4544),
('maxScanHits_action', 0x7468726f74746c65),
('neverBlockBG', 0x6e65766572426c6f636b5665726966696564),
('other_blockBadPOST', 0x30),
('other_hideWPVersion', 0x31),
('other_noAnonMemberComments', 0x31),
('other_pwStrengthOnUpdate', 0x31),
('other_scanComments', 0x31),
('other_scanOutside', 0x30),
('other_WFNet', 0x31),
('scansEnabled_comments', 0x31),
('scansEnabled_core', 0x31),
('scansEnabled_diskSpace', 0x31),
('scansEnabled_dns', 0x31),
('scansEnabled_fileContents', 0x31),
('scansEnabled_heartbleed', 0x31),
('scansEnabled_highSense', 0x30),
('scansEnabled_malware', 0x31),
('scansEnabled_oldVersions', 0x31),
('scansEnabled_options', 0x31),
('scansEnabled_passwds', 0x31),
('scansEnabled_plugins', 0x30),
('scansEnabled_posts', 0x31),
('scansEnabled_public', 0x30),
('scansEnabled_scanImages', 0x30),
('scansEnabled_themes', 0x30),
('scan_exclude', ''),
('schedScanArgs', 0x613a373a7b693a303b693a313432373032373239353b693a313b693a313432363530393838393b693a323b693a313432363539353837323b693a333b693a313432363638333136393b693a343b693a313432363736383836383b693a353b693a313432363835353337313b693a363b693a313432363934303531323b7d),
('scheduledScansEnabled', 0x31),
('securityLevel', 0x32),
('spamvertizeCheck', 0x30),
('startScansRemotely', 0x30),
('totalAlertsSent', 0x32),
('totalLoginHits', 0x34),
('totalLogins', 0x32),
('totalScansRun', 0x34),
('tourClosed', 0x31),
('vulnRegex', 0x2f283f3a776f726466656e63655f746573745f76756c6e5f6d617463687c5c2f74696d7468756d625c2e7068707c5c2f7468756d625c2e7068707c5c2f7468756d62735c2e7068707c5c2f7468756d626e61696c5c2e7068707c5c2f7468756d626e61696c735c2e7068707c5c2f7468756d6e61696c735c2e7068707c5c2f63726f707065725c2e7068707c5c2f70696373697a655c2e7068707c5c2f726573697a65725c2e7068707c636f6e6e6563746f72735c2f75706c6f6164746573745c2e68746d6c7c636f6e6e6563746f72735c2f746573745c2e68746d6c7c6d696e676c65666f72756d616374696f6e7c75706c6f61646966795c2e7068707c616c6c7765626d656e75732d776f726470726573732d6d656e752d706c7567696e7c77702d6379636c652d706c61796c6973747c636f756e742d7065722d6461797c77702d6175746f796f75747562657c7061792d776974682d74776565747c636f6d6d656e742d726174696e675c2f636b2d70726f636573736b61726d615c2e706870292f69),
('wfKillRequested', 0x30),
('wfPeakMemory', 0x3437363337393932),
('wfsd_engine', ''),
('wfStatusStartMsgs', 0x613a31333a7b693a303b733a303a22223b693a313b733a303a22223b693a323b733a303a22223b693a333b733a303a22223b693a343b733a303a22223b693a353b733a303a22223b693a363b733a303a22223b693a373b733a303a22223b693a383b733a303a22223b693a393b733a303a22223b693a31303b733a303a22223b693a31313b733a303a22223b693a31323b733a303a22223b7d),
('wf_dnsA', ''),
('wf_dnsCNAME', ''),
('wf_dnsLogged', 0x31),
('wf_dnsMX', ''),
('wf_scanRunning', ''),
('wf_summaryItems', 0x613a31363a7b733a31303a22746f74616c5573657273223b693a363b733a31303a22746f74616c5061676573223b733a313a2235223b733a31303a22746f74616c506f737473223b733a313a2231223b733a31333a22746f74616c436f6d6d656e7473223b733a313a2233223b733a31353a22746f74616c43617465676f72696573223b733a313a2231223b733a31313a22746f74616c5461626c6573223b693a34353b733a393a22746f74616c526f7773223b693a343136303b733a31323a22746f74616c506c7567696e73223b693a393b733a31303a226c617374557064617465223b693a313432363630303137323b733a31313a22746f74616c5468656d6573223b693a353b733a393a22746f74616c44617461223b733a383a2234362e3034204d42223b733a31303a22746f74616c46696c6573223b693a333333363b733a393a22746f74616c44697273223b693a3931383b733a31303a226c696e65734f66504850223b693a3637323634313b733a31303a226c696e65734f664a4348223b693a3232353537393b733a383a227363616e54696d65223b643a313432363630303137322e383934363232303837343738363337363935333132353b7d),
('whitelisted', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfcrawlers`
--

CREATE TABLE IF NOT EXISTS `wp_wfcrawlers` (
  `IP` int(10) unsigned NOT NULL,
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  `PTR` varchar(255) DEFAULT '',
  PRIMARY KEY (`IP`,`patternSig`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wffilemods`
--

CREATE TABLE IF NOT EXISTS `wp_wffilemods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `knownFile` tinyint(3) unsigned NOT NULL,
  `oldMD5` binary(16) NOT NULL,
  `newMD5` binary(16) NOT NULL,
  PRIMARY KEY (`filenameMD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `wp_wffilemods`
--

INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('\0rؿ}mI��^���x', 'wp-content/plugins/woocommerce/includes/libraries/class-cssmin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PTV�bc�=.����ɯ�'),
('\0''�\0��g�3y�lf�P', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile-base.php', 0, '�걙l|c"�m�!', '�걙l|c"�m�!'),
('\00��#�9���Z4�j$', 'wp-admin/network/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�s�̶>��Ѕc��'),
('\03/l��$M�a��j��', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/jcb.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k�\r-�x�%�]�)��'),
('\05g���꫔c�0�"D', 'wp-includes/css/media-views-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';��ӽ��j���J'),
('\0C_\n��jD��@k', 'wp-admin/network/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���&G�b)�v/�U'),
('\0`Y�ϭrG����', 'wp-includes/SimplePie/Restriction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*qhd�s�;�y'),
('\0qɢ>''p������l', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/groups-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ӋTb��8��`ʇ'),
('\0�U�.!h� n�~�/''', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/friends/requests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F\rjY�s�=t�%�;'),
('\0�c+k����M��,', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/bbpress-logo.png', 0, '�C����U��(n\\[k��', '�C����U��(n\\[k��'),
('\0��%ΥJ-�p��', 'wp-content/plugins/wordpress-seo/inc/class-rewrite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ũ���J	}�O�kD��'),
('\0��@�K��([|i�ȏ', 'wp-content/plugins/buddypress/bp-forums/bp-forums-bbpress.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K��=#���	�&^'),
('\0��{O����/�W�.', 'wp-content/plugins/buddypress/bp-forums/bb-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��2�A�T�nj�>�Z��'),
('\0��5ZM/\\*��%	;', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/activity/permalink.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s�t���D+�q��gg'),
('\0�|9��u�e���@��', 'wp-admin/includes/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O�d�؛5��,�\n�'),
('\0�������`b�Ӫ�X', 'wp-content/plugins/woocommerce/templates/global/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?\0��J�<c�P���6�'),
('\0�ێx%�d\Z�kK](', 'wp-content/themes/twentyfifteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hYӠ�&��6�	���N'),
('	�}�U(>�o�V��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post.php', 0, 'XT��!&:G����', 'XT��!&:G����'),
('�k��V(\n��@�', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}�~��֤��S��Z@'),
('��Ȅ�7�g�b^I5', 'wp-content/themes/twentyfourteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~m��\\����em,]'),
('+� ǁ�4��)�`b�', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-live-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�Z�{j|�$p֔s�p|'),
('<\0k���M	S��~�7', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-merge.php', 0, 'U�՝P�%�	k��|]', 'U�՝P�%�	k��|]'),
('NQ�"*hz�r�w|\Z�', 'wp-admin/images/media-button-other.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ƴk�|��,O�"�'),
('s�R����||(W�!�', 'wp-content/themes/twentythirteen/content-chat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"� �S>\Z3)�b�1�	'),
('�%�\\i\\j�?��x', 'wp-content/themes/twentythirteen/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;��R�W�k��l�ӗ'),
('��!v�4�����', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MagentoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��{��F�����s'),
('�T�h���zP��r�', 'wp-admin/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ȓբx�r�\\�q�%�K'),
('�Z.swL���\r�����', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WHMCSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:x����+x[��'),
('�_�4t$�n�q�v�I', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' o�4��e΁Eq �'),
('��;A�9�:��k', 'wp-content/themes/hexa/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[�\r#�%�UM�'),
('��`Ƚ�c �)d��', 'wp-content/themes/twentyfourteen/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ky#�$~� p��ǁ'),
('t]�ٟu��u���j�', 'wp-admin/images/menu-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q���L�,_�;1/�E�'),
('��~�w`�5;F㮮', 'wp-includes/js/jquery/ui/effect-size.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o֠��״�lP\r�m^'),
('�=��q�\rljA+', 'wp-admin/user/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*zu�c���m	J��e�'),
(',�-o�}��''����', 'wp-content/plugins/buddypress/bp-activity/bp-activity-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k5��B|Ѧ��L�'),
('*lX��KPqU', 'wp-content/themes/twentyfifteen/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\n߬/���B��� �>V'),
('.�8���G����+8�', 'wp-content/plugins/buddypress/bp-core/js/confirm.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m���Q�/��'),
('<)8T*.�SuS�ĺ�', 'wp-includes/SimplePie/Cache/MySQL.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���B�C�\ZH�xV�'),
('HC���!���"(�', 'wp-includes/js/tinymce/plugins/compat3x/css/dialog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��͕�\0A��It�dH'),
('J4[��]���ā��"', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '΀�''��\n��UQ�&��U'),
('kX��8�c0�V�#', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/jquery.js', 0, 'Q��F��W��IB�9�', 'Q��F��W��IB�9�'),
('u��s��y6''v,��=', 'wp-includes/js/tinymce/plugins/wordpress/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Cm��\rC�r��'),
('����k��� �+SҀ', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}f�j0�2�]��^?'),
('�\Z���?Ş�s�"M�', 'wp-content/plugins/buddypress/bp-friends/bp-friends-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����V\rK-E��\n}�'),
('�Ǽ�%hcQ�xjR��', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jpt\0�����v���'),
('�?~RטnB���6\\�', 'wp-content/plugins/woocommerce/assets/js/admin/quick-edit.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*h��E��"��V'),
('�p�A�jF�bG�	��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-core.php', 0, '�����U��	��{', '�����U��	��{'),
('��T��f�>Ǻ~�', 'wp-content/plugins/woocommerce/includes/walkers/class-product-cat-dropdown-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r}�w�u\0dg,^���c'),
('��]�@;g��;7Ͽ3', 'wp-content/plugins/buddypress/bp-core/admin/css/common-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_�Di��A{Z]��'),
('ؚ��A���\r��Z�', 'wp-content/plugins/woocommerce/assets/js/admin/settings.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���l�Lki)�''|���'),
('����7�&��Ȁ', 'wp-includes/js/tinymce/skins/lightgray/content.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zx+<(��)�����d�'),
('༗!>#�@��7W�''', 'wp-content/themes/twentyfourteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4b��-�+l��'),
('�;Μpne���^@�', 'wp-content/themes/twentyfourteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@����h3>�?i��'),
('�s�\Z��Zt��c�	�', 'wp-content/themes/twentyfourteen/sidebar-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ȃ$��\0DO��K'),
('O,�2g�����H', 'wp-content/plugins/theme-check/lang/theme-check.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��r�f�\0��`f���5'),
('''mK���[t\nj+�', 'wp-content/plugins/buddypress/bp-core/bp-core-wpabstraction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O�4�E"�<�J`l='),
('(���љ����\0H<_', 'wp-admin/includes/nav-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\`�gO��𳇪z��v�'),
('d�p�ժ7Cx0	lXi�', 'wp-content/plugins/google-analytics-for-wordpress/admin/views/content_head.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���R4��\0i�m�ܯ'),
('i��PÙ��ld\0��', 'wp-includes/css/jquery-ui-dialog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�򴆔P4Ԩ]�����'),
('��d��Υ������', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/.hg_archival.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�8�[�0�����?[L'),
('���1����Z��8#', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ֺM�{�U����'),
('���M�a\n�A��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�w���>�R;u_a'),
('!���@|�4��n���', 'wp-includes/class-http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)#��6\Z�z���}L�'),
('''ڞ\0;��?�+VҪ�', 'wp-admin/network/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r�^�Y�&��;^���\Z'),
('6H6�8�H�Yշ�(h', 'wp-content/themes/twentythirteen/content-video.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�xB��\r\Z�Αd\0L�'),
('E�&��VN���"N', 'wp-admin/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '߷G�c�������n�'),
('�l�g<���=�l�', 'wp-content/plugins/akismet/class.akismet-widget.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�"�k<)��K� ��'),
('�m����K��%���A', 'wp-content/plugins/buddypress/bp-core/bp-core-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C5Q^S���w�Y��'),
('�o�E1hީT�O(��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ChefInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't�&�r@;���f���'),
('���&�?��)2ۛ\\��', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-components.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tb�E�.��_�9}��'),
('�����"�]hS�q�$', 'wp-content/plugins/buddypress/bp-core/deprecated/1.6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A��~��\r�>/G�'),
('�P\0''�0l���v�#J<', 'wp-includes/js/jquery/ui/effect-fold.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��JH|!�y��>U�R'),
('Ȅ���xy�����', 'wp-includes/js/tinymce/skins/wordpress/images/embedded.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����p�N��y~�n"'),
('ϴ 3P`#8^��Z', 'wp-admin/css/colors/coffee/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YOY�]�����ua�'),
('�|� z�\n}p`j���', 'wp-content/plugins/google-analytics-for-wordpress/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���y�������p'),
('��G��\ZPp\ZN�U��b', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=���)�pv���x�'),
('"��N߬jj)��\0��N', 'wp-admin/images/menu-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jG�����{�>�^;$��'),
('<B��a^�D@^�)j', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-dependencies.php', 0, '[G7�fZD)���fG^�', '[G7�fZD)���fG^�'),
('Z��d���i�X�g�', 'wp-content/plugins/siteorigin-panels/js/styling.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N��f���@䐖W��'),
('o	CB�~C���wO��', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u�N(zU''�I�x�dW`'),
('tZQ��Yz0����跫', 'wp-admin/images/wordpress-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ư�y��o�8��8S�`�'),
('|q���Bl�mr���0', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-template-check.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r���߻r�*�g��=q\\'),
('���k�5S�H���Ы', 'wp-includes/SimplePie/Author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�q�_�A�%�Nw�1'),
('���e�bW�A0�d', 'wp-admin/images/comment-grey-bubble.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Y�*''����t���F'),
('�29�`�#0TR��|��', 'wp-content/themes/twentythirteen/content-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:{�I0�b�L��K'),
('��c�B�m)�c�Ъ�''', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�7J%��r���z�]�N$'),
('�0����ċ�6\Z\0>', 'wp-content/plugins/wordpress-seo/js/jquery.qtip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V4&��@�ѵ�nh'),
('��O�X���\0�7��', 'wp-content/plugins/wordpress-seo/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�>�A�#�=��!��9'),
('�#�<G}�\Zڅm�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/profile-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U9kϢ�\\�~�%��n'),
('�M���K� �����', 'wp-content/plugins/woocommerce/assets/css/_variables.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ��6r\r��H8��S'),
('"�}�%��x�R:F���', 'wp-content/themes/twentyfourteen/featured-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\�\Z�����x�����'),
('/a�R�a/��+;�Y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/header.php', 0, '��ҙOJ�3��0���', '��ҙOJ�3��0���'),
('K���l}\n*J��(9�<', 'wp-content/plugins/woocommerce/templates/loop/result-count.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s�h�%�����2>'),
('Q� ��(;ؠ|~R8�b', 'wp-admin/includes/user.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%A\0`�6;	����'),
('k5�@�����u�U', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_AuthNone.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��kϋ`���D��&bh'),
('z�S��ͬ�\\�/��', 'wp-content/themes/twentyfourteen/js/keyboard-image-navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g������!�ژ::�'),
('���%bQ�bM<�x', 'wp-includes/js/imgareaselect/border-anim-h.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z��,�ntZ^6�{Lp�4'),
('�Ŋ�`�7��T��a', 'wp-content/plugins/wordfence/lib/menu_whois.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&�:���o�u�)/n6'),
('ѧ�_�4a!�F��', 'wp-admin/css/ie.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}K\r�v1F:xqB�'),
('�E�,���Z�xA��', 'wp-content/plugins/wordpress-seo/images/Premium_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!�\r�s ˵�T\Z���'),
('�\0@���5\r�B', 'wp-content/plugins/woocommerce/includes/class-wc-product-external.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dk����E�+�:��u�'),
('��i)33ܥ��s�*', 'wp-admin/includes/class-wp-ms-users-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\Z���p�#G�'),
('j��o�+��s�7�8', 'wp-content/plugins/wordfence/css/iptraf.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+	���<�dq�7^�'),
('51��y}E���`�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pt_BR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0opK���	�z��'),
('Bs����^�6u�S�p', 'wp-content/plugins/woocommerce/templates/single-product/related.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�V�4��T��[�V�h�'),
('_�5{yS�B��qe�D', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/GravInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@��|\\��B\03CEț�H'),
('���#����	>�7', 'wp-includes/js/tinymce/skins/wordpress/images/pagebreak.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�I��m���LWyݓH'),
('���@���N�� _n', 'wp-content/themes/twentyfifteen/js/color-scheme-control.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g��O:�]ɏ���X��'),
('������Dнy�ZL�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0�Q�-{JaE�Q�t'),
('����ɊK�#"P�', 'wp-content/languages/continents-cities-es_CL.mo', 0, '+�b��=%�*�A�', '+�b��=%�*�A�'),
('	��?0(���J��', 'wp-content/plugins/buddypress/bp-xprofile/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:�N�r��VW6�$�'),
('k����b��gS�', 'wp-includes/js/tinymce/plugins/wplink/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,n^������]'),
('k�Q�;���䈠9FN', 'wp-content/plugins/buddypress/bp-settings/bp-settings-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��.C�E�#�DVQ�;,'),
('}mך�:I��[BCU�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page_header_bblogo.png', 0, '�柽�T�G.	��zq�q', '�柽�T�G.	��zq�q'),
('�������L���m', 'wp-content/themes/twentythirteen/images/headers/diamond.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':ɴ��� ���7'),
('����g�~�w\Z�hh', 'wp-admin/css/themes-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J\Z\\mr�PgP�� �V'),
('�v�|мDF�ZU��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PiwikInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u̎��#!?5�'),
('�����1d���*��f.', 'wp-content/languages/themes/twentytwelve-es_CL.po', 0, '�B������*�:ѐ', '�B������*�:ѐ'),
('	QW���~-�\0d�', 'wp-includes/class-phpass.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#�FDP�\0\Z�f�G�Ƨ'),
('	?������q�uM', 'wp-includes/js/mediaelement/mediaelementplayer.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(��z����`QN���	'),
('	�&)DcU��J�v�WG', 'wp-content/plugins/woocommerce/dummy-data/sample_tax_rates.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;B���tùo�J�t�'),
('	��ɰ犟����A', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-driver.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ʺ���0�$og��uH'),
('	,��/Օ�!�gy�d', 'wp-includes/js/media-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NFX�H���6k�\Z�e�'),
('	P=N>��b"j:~[Q{�', 'wp-includes/js/tinymce/plugins/wpdialogs/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���[ߢ�9��Z�'),
('	X�t\\4vNI5��j��', 'wp-admin/async-upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<Br?d�T''��Z�0X'),
('	�E�qyGb�C�Ό�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('	�9��fވU�f����', 'wp-includes/js/tinymce/tinymce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F׾@*u6�|h��'),
('	����09��-b��ͩW', 'wp-admin/network/users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n�]�̾�6��V&u�'),
('	�.1�6llY��"2R�', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' �������k���'),
('\n�԰���_\\cc5�I', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}x�9��t��{�ݿ�'),
('\n5r�0��`���', 'wp-content/plugins/theme-check/checks/worms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���69p.B�k�f|'),
('\nf���Y��4&�L�', 'wp-admin/images/se.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ȔB�`��.}''7:'),
('\nl��k����& x', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/interface.bp-options.php', 0, '���Z����#��', '���Z����#��'),
('\nl��b��n�mB3\0?', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-frontend-colors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0�-���3��nb\Z���'),
('\n~�7>t��U!	��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/PimcoreInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;��1��cH�$G�$��'),
('\n���b-�V�:��|m��', 'wp-admin/edit-link-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i-�E��''�)^P�'),
('\n��������E��d�', 'wp-content/plugins/woocommerce/assets/js/jquery-payment/jquery.payment.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�� gT1�XID*j�'),
('\n��NNM��ۑ4;�p�4', 'wp-includes/js/customize-models.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'OK�.�q;�t��N�\n'),
('\n�d�[z���d��\r�|', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eѮ�xMQ�<��r<'),
('\n�O���g�	-p��GT', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1Y�%��չ��'),
('\n쮓��''e	PwJv%�', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z��g�Å��m~��v'),
('\n�M����,���6u�', 'wp-content/plugins/papercite/lib/BibTex_pear.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�d�)����L��p�'),
('\n�\r�B��p̭', 'wp-admin/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}1Ըn]��R��'),
('\rB�w��C5TG(�E�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-footer.php', 0, '�ϰ+��(� ��<d�', '�ϰ+��(� ��<d�'),
('"w%�_��K\\��u�', 'wp-admin/images/wpspin_light.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Nm�h����;\Z@��'),
('&c�YD�#�P{+��', 'wp-includes/js/jquery/ui/effect-blind.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o�d-��u���>��~'),
('>-�iLw�n��$��D', 'wp-content/plugins/buddypress/bp-activity/js/mentions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*�[\ZE϶�b���F��'),
('}�!r��,�t.\rh�', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�.6kg��Z\0�{�'),
('�\\�r65��oI	��m', 'wp-content/plugins/woocommerce/templates/checkout/payment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Sw�U��9mJ\n�f('),
('���,H(b�_F�O', 'wp-admin/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P#��''��C�j�[ָQ'),
('��HVե�d��p�Vp', 'wp-includes/images/media/spreadsheet.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4���\0T��̇?�'),
('�F����p@[\0�g�', 'wp-content/plugins/buddypress/bp-core/bp-core-caps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"��ۉ�o�2���\r'),
('�uQ���Q�� ��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W�a`׏(o2Ș��m�'),
('�8�����Zo}3\Z', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ė�(��2Щ��͠{?'),
('�Ǩ�`�r�]���h', 'wp-content/themes/twentyfourteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�Mi���Hj���JBc'),
('���aj\\v�,��\\n[�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/mo.php', 0, 'D��j����〴��t=�', 'D��j����〴��t=�'),
('�c"ml� �Ǟ>o', 'wp-admin/images/wordpress-logo.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A�/yD�e��n���'),
('�P�U�Q&s�9m����', 'wp-content/plugins/woocommerce/templates/cart/cross-sells.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q�3�ڀf��"ܭ\\��'),
('u���%��aN���X', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/AccessToken.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s�;�&0�7 ��'),
('NT�֥��u�V�m', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W���o⵴e.r��'),
('{�M��i�i2n��6�', 'wp-includes/js/jquery/ui/effect-highlight.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�q���vf���FD��'),
('���+	r˧k��m\0�', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-layered-nav-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N�t\01�h�J��`ε_'),
('�v��,���C�(ă�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-recount.php', 0, 'mX�xM���k���8)', 'mX�xM���k���8)'),
('\rF�B��(�ل\Z�', 'wp-content/plugins/woocommerce/includes/class-wc-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���>{�l:W��w�2'),
('\r�b�ߩ�={�����', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-download.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�l����{���z��m0�'),
('\rYGV�����I�?��', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�����B���^��y'),
('\rf��BAcآ�b��', 'wp-content/plugins/buddypress/bp-forums/bbpress/tag-add.php', 0, '�`�������ȅ�}�w', '�`�������ȅ�}�w'),
('\rsk��&+��&\nTAc', 'wp-content/plugins/theme-check/assets/gray-grad.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������ۂ/����-'),
('\rxݍ�^���\Z���<;', 'wp-admin/my-sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i0N��x�L\r���Y]'),
('\r����/�K�M2�$_1', 'wp-content/plugins/woocommerce/templates/myaccount/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��6��q�YW�G'),
('\r�\n�v<�y\r��OF���', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/Generator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A}���\0���v�p<�'),
('\r�ҧxOz���z���h', 'wp-includes/class-wp-customize-panel.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')f�yӝ��%��@кu�'),
('\r��:�:���HH�:d', 'wp-admin/css/edit.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O"���+K2��/�;'),
('\r�A�t�Zrr�\nd����', 'wp-content/plugins/woocommerce/includes/class-wc-countries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L��"yz�Ğvy�~4I�'),
('\r�%����%�yS�`�', 'wp-includes/js/crop/cropper.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����H.s�o����'),
('\rʪ��߱�Ȅ�4>�', 'wp-content/plugins/buddypress/bp-themes/bp-default/editor-style-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Rϫ|&�H�K�iw�{\\'),
('\rѪ1s1=��`(�y', 'wp-admin/options-head.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�֕`^m�N@\nTof~�'),
('\r�9�~���)�Eh��', 'wp-content/plugins/woocommerce/assets/images/help.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q5j�l)��\r)����'),
('\rG$�Pk��W���?', 'wp-content/plugins/wordpress-seo/css/jquery.qtip.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o������''��b�M�!'),
('\r�;*�L���ꦸhP', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/google/text-class-api-google.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v�@W��3͸n+=i�z'),
('\0����&"5wY��8��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CroogoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�vE��"�M\\��M�'),
('��~�	;��\\��K�', 'wp-content/plugins/papercite/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ޓ����;�[��V��/O'),
('L�:��tWc�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Chargeback.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '܂t�;�&@��\n>�y�c'),
('#疭ۭ�v"��M�', 'wp-content/plugins/wordfence/lib/wfAction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@��_����>js'),
('V�a��3Q��Y�$e', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/app.pot', 0, '�a����������o�', '�a����������o�'),
(' gUg#	l=J���', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qҳ�|�=\Z�\\o��<'),
(';���P�o6�4E', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��1���)�t.%�jtm'),
('N��E  ��r�`[W&', 'wp-content/plugins/buddypress/bp-xprofile/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1��|!=�IA'),
('X��H奥(�:�Z�', 'wp-admin/admin-ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���� V�p�r�.n�'),
('go�s�V�;����\n$', 'wp-includes/js/tinymce/plugins/compat3x/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�\\�-����e���U'),
('��E��|2''�X�l�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-formatting.php', 0, 'z)��m�F�i�\n���Q', 'z)��m�F�i�\n���Q'),
('�W��-�g�ʳ�U�e', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/jplayer.premium.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u��? ���ƕ��2a�'),
('�$~��Pp�{<��%��', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2D�t�ٚ�.o����'),
('� ��C�Y���', 'wp-includes/pomo/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}�L�ǼƢ�v�.'),
('�>�M�8� ٵ��|', 'wp-includes/images/crystal/archive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�S������I0An�'),
('��"\rJ\04��''i�', 'wp-admin/js/password-strength-meter.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M�(F�Vp��#*�{�'),
(';�&�nb��i�ٷ�', 'wp-includes/js/mediaelement/silverlightmediaelement.xap', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/��\Z��Th�y��S�'),
('LB�R.ò�Q�O(�', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������y''=l&��j'),
('O��Z�%�l�[�', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ʘ�22�Y8n�(>��݋'),
('\\�����AV*籿', 'wp-includes/js/jquery/ui/slider.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'OpC/Y_���3�q��'),
('h7��tK�D}��	', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/style.css', 0, '��Z鴯1�ސ��N]=', '��Z鴯1�ސ��N]='),
('��u���8u+L���', 'wp-content/plugins/theme-check/main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x)�Z��	qL�qل�'),
('��\nŁ�?Ho��=�S_', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-writing.php', 0, '+-޿&�7qLO�e', '+-޿&�7qLO�e'),
('�ԋ���; &��|/�', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5e�]���l��$��l�'),
('�o����D��qq�Ж', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/replyto_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]"���{_8��|�'),
('�Z����C�P@�`7', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ֆے�Hƹ���F�Z�'),
('������OM�)��', 'wp-content/plugins/papercite/lib/PEAR5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z�gՀ	7*l���8�(�'),
('�ݡ=��Nx��K�`*', 'wp-content/plugins/wordfence/lib/wordfenceClass.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���@�����_��'),
('�뷎wh\\Xs����l', 'wp-content/plugins/wordpress-seo/admin/pages/network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�̯\n��h�(��L,k%'),
('\0��]�a�v���CY', 'wp-includes/class-wp-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aإ�K�<\nЇ	��L"'),
('���NVԱ��z�Z', 'wp-includes/js/jquery/ui/effect-shake.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h�&�@�ܯn2�=4x�'),
('A����lߦ�\0�].', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xLh�.�6��	�I�('),
(')��_���J�����', 'wp-includes/js/media-models.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m�M���9y�k\0#�'),
('`�&��锥~K3/d', 'wp-admin/css/login.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�sI�|�7�K�uM�Q�'),
('���ґ-���\r�{,�', 'wp-content/plugins/wordfence/lib/wfCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�V����^{��x�\\'),
('�~��L��*�,�<:�', 'wp-admin/includes/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Y��<�Tد�U�'),
('����ٷ(z��f���', 'wp-content/plugins/siteorigin-panels/css/images/wpspin_light.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G�ء�ZXA�w�\Z��m'),
('�Sx��4�@o�w�N', 'wp-admin/js/widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���7��*�����77'),
('��Z�`��x����.j)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_PemVerifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ԁ����/$7�L��8'),
('���:m��[ݢ�:#', 'wp-includes/l10n.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B,FNn##��{��g'),
('�I��\\j���x���g', 'wp-admin/images/date-button-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')R�,$k���)6C��c'),
('���j7r[�,���Z��', 'wp-admin/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t����a�Z�,�'),
('����Sqf+�7r��', 'wp-content/themes/twentythirteen/content-gallery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�,|�҈�9�@�$�'),
('�C	����a ��IK', 'wp-content/plugins/woocommerce/templates/emails/email-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\n��^�-wj�?�'),
('-�M2��\0��%Aۉ', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-de_DE.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���y̶���|���a'),
('D�8hFޛBViR�', 'wp-admin/css/colors/blue/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d�c�����=�GSL'),
('J9�?�+��Q�鴵�', 'wp-content/themes/twentyfifteen/genericons/Genericons.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�&tw�4�Љ�pc�$'),
('iM���*�''�|0R', 'wp-content/plugins/woocommerce/includes/class-wc-validation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uJ��ЌIr�-��}�Z'),
('j׻���q.�*;��2', 'wp-admin/css/colors/sunrise/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ui���.І�E����'),
('y�,~''F��l�	/�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"H��{i�;Γ�P'),
('�Z�1h������N3�', 'wp-content/themes/twentyfifteen/js/customize-preview.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��t��?\r�J4��a�)'),
('�r�W�3���᥾V', 'wp-admin/css/color-picker-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rO�d��S�<6$�'),
('�2����3�f	H��', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z�ke��7X�k�'),
('� VØ�������', 'wp-content/plugins/wordpress-seo/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PoNr|�P2/y���'),
('�ƺ���"0�1\Zc�', 'wp-content/plugins/wordpress-seo/admin/class-opengraph-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�Ѧ��E[$<��h'),
('1]L��\\��ۡ', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-admin-report.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4)��?\0T����'),
(':�X��2�M���~��', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�瞸�����g�_��'),
('L����8���\\�ݼ+', 'wp-admin/images/imgedit-icons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',��''��6U�������t'),
('j�+=�d�KCM�\Z�"', 'wp-content/themes/twentytwelve/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o�a��]�z�KOO>�'),
('p۞�2N<:Z�7�r�', 'wp-includes/js/tw-sack.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���������9>���'),
('u�)8FG9�C�(���', 'wp-includes/js/wp-ajax-response.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x�i�->�\n�\\33r'),
('�y.�	�u���*�>[', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Lzs#B�u�q`l�'),
('�$�ކ�k�����a�L', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-universal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~V�Iu�?��7z�V'),
('���Clo�������', 'wp-admin/nav-menus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G����Ӈ���'),
('��v��8�i��', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/pause.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~�q��ϳW\Z0o�Ʈ'),
('�)\n?އ�>���0', 'wp-content/plugins/buddypress/bp-friends/bp-friends-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eP�����X�����A�'),
('ʂ-����=��Υ��', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�in��`���d�ɒ'),
('��-��i>bs��1�', 'wp-includes/js/jquery/ui/resizable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ԫ\Zf��v��|���'),
('''8''�)���BZ`��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������x��B��?'),
('4�J�-<O�iDf�.�', 'wp-content/plugins/wordpress-seo/admin/class-yoast-notification.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'DI��&k���1�M�M '),
('DՀ�R�oe&�WL�KV', 'wp-content/plugins/papercite/format/ieee.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':Q���2}�Ǽ����'),
('_�Y�d�p�Ѿt�=C\n', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/screenshot.png', 0, '��ʥQl{��6��i�', '��ʥQl{��6��i�'),
('b7%(�F9�''Lu�', 'wp-content/plugins/buddypress/bp-activity/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yUD''n��%"�#?��'),
('u�!��>�)��<�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/RedaxoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F[|.�1��x�	&XfN'),
('��4r�%����j���', 'wp-includes/SimplePie/File.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���kU�6�\n�+�)%�'),
('��KS+�e׎A�@��', 'wp-admin/css/colors/light/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' �V{��)\\_~��q�'),
('���&rq�o�%��,', 'wp-content/plugins/woocommerce/templates/loop/add-to-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y��v;B?�89M<p'),
('�����Fe�	57[�', 'wp-content/plugins/wordfence/lib/email_newIssues.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)�c�C��A3�.Ǎ��'),
('�fgk9,J8j\r�iF�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�J��u�.����-�'),
('�U�8c�vD��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�-E�-U4�;�'),
('j����''��c9��k', 'wp-content/themes/twentytwelve/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à�m�܇��-\n����'),
('óYT%(���PK���', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Iރ������K]�o�҅'),
('%�\Z�����9��', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Webhook.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	��2]{?�\rL��'),
('2�%}��,�����3|�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-fr_FR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B~�|rSZyV��X[�\0�'),
('q���<��@8䟉|�a', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/notices-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t����	�K�i�6�D'),
('q��mu��Kۏ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('��@"�:��!��hH�', 'wp-content/plugins/woocommerce/templates/emails/customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�9�9\0����Q�ű�o'),
('��[���v�k��J7', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�$#����ktݐfx'),
('ƾ�%6Ǘ�\0�Nm�FN', 'wp-content/plugins/buddypress/bp-themes/bp-default/onecolumn-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�2�/R��~�obKz�'),
('΢�S˪�\n��B�V"', 'wp-includes/fonts/dashicons.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~�)x䌉��[�w�'),
('�G����8e��@�=', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CodeIgniterInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��H��=�u�]R9��'),
('�_��q���M8�Y', 'wp-content/plugins/buddypress/bp-groups/bp-groups-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A��p"X���B�s}J�'),
('��]��� )��\\��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/compose.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ߴ 6���\r٢��'),
('�8a���R\\�o�1', 'wp-content/plugins/buddypress/bp-core/images/mystery-man-50.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r1�ao#��<��n��'),
('��ܡ9�u_\\\n�9�''', 'wp-admin/css/color-picker.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á�|��w~��#Q'),
('�KU�g0MU�/��ʇ', 'wp-admin/admin-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ga���c�3�aq�'),
('� ''��n1y��T', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��"4r_#h''*ϴ'),
('$���σ)ק�B� ', 'wp-content/plugins/woocommerce/templates/single-product/product-attributes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��0j+K~9����\\h'),
('4;V��''�/����f�', 'wp-includes/js/jquery/ui/effect-scale.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���E�{9��TǦ��'),
('P�1\r�e\07�F��)Ɩ', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-coupon-usage.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\x��q���~T���c'),
('R�@�%U)�p�q*', 'wp-content/plugins/wordpress-seo/css/taxonomy-meta.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��bG��''R��^M:��'),
('_A�&���#G���"', 'wp-content/plugins/woocommerce/assets/js/chosen/ajax-chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@�[*q�>��ؕQ�l'),
('}���fl�u��_�\Z', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-es_MX.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\\j����s�k'),
('���C\n���U���', 'wp-admin/js/custom-header.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2�\0X���`o���uf�'),
('�[EY�bǎ��)���', 'wp-content/plugins/theme-check/checks/dep_recommend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^l����j�#���%�'),
('�L�2j�>�a}W��"', 'wp-content/plugins/woocommerce/assets/js/frontend/cart-fragments.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\n.<*����'),
('�T�I�灞�BQ�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/favorites.php', 0, '\Z��M{I$\rD_H�x�_	', '\Z��M{I$\rD_H�x�_	'),
('��0l��j�0+%�', 'wp-includes/SimplePie/Source.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������S{�*���'),
('Ւ��dِ�"��SI', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-low-in-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y��ƽg|''�U&''}~'),
('����U����,', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topics.php', 0, '��]w*�BM{��3�', '��]w*�BM{��3�'),
('��:ܳ���g��', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/grouped.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K�*�����n��['),
('�\n6F�G���+\n�P;�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/profile-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�?�qS��>�ЖNb='),
('���窒�u��\rZJW+', 'wp-content/plugins/wordfence/images/help.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$N��;''��M���� Y'),
('�)����t\r�,�Jڼ', 'wp-admin/options-permalink.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t��!�Wq�_^s:R�%'),
('=oE�,Wk&5Y"�', 'wp-content/plugins/buddypress/bp-activity/js/mentions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ޠ��7�o�^g�t�Ed'),
(',���F�o�V�dY�', 'wp-content/themes/twentytwelve/page-templates/front-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^����&��[Z�'),
('EL<CCj.ѩ��ENB', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-arrows.gif', 0, '��.�R�Uw�����M�', '��.�R�Uw�����M�'),
('Vf6A��]0��"��', 'wp-content/plugins/woocommerce/assets/css/reports-print.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��W\\̎�*`Ǿ�'),
('Wl��y:�\0Vn`�d\0�', 'wp-includes/js/tinymce/plugins/wpview/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?N����������"'),
('{�����xEMxq��', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/gui.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E\n��|����9�x'),
('�,�4#��(�#', 'wp-signup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F���*�I\n�gF�t'),
('��f�2eֳ�f��r', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/slate.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f1�6�*�o�&��\Z�'),
('�6U��a�ʏ���', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?.�=��I��i\n�M�O'),
('\Z  �}(Ϻ�L�@\n`', 'wp-content/plugins/woocommerce/includes/class-wc-order-factory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M��t0�a(�ʛ�a��'),
(')�Ċ�\\����', 'wp-content/plugins/wordpress-seo/images/banner-news-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r�|f��hQ��8N'),
('S�g|Nl�$��ry�', 'wp-content/plugins/buddypress/bp-messages/bp-messages-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W\\�T�|��IC��'),
('_�N>/2���&�t', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-website-review.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����)3,@�Q���'),
('`��ΦO������H�', 'wp-content/plugins/theme-check/checks/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.\0�2M���D�����'),
('w�A�/	����ĉ\\q', 'wp-content/plugins/wordfence/js/jquery.colorbox-min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4?Jǃ�G�`�\n�N�xl'),
('�x�r{��C�fD�!', 'wp-content/languages/plugins/akismet-es_CL.mo', 0, 'RRL�6��I!���Tޡ�', 'RRL�6��I!���Tޡ�'),
('��R� N+`gVO��Z', 'wp-content/themes/twentyfourteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N�OG(v!$�uL���a'),
('�lQk^G��*0z[U', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/gui.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\Z<gG�$�҅F�-'),
('�:8�Ia��øl�m', 'wp-admin/includes/class-ftp-pure.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�\\.B���������'),
('����KqM���{���', 'wp-admin/css/dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h�9���JB�(@�'),
('�TB��O>�v2��}Ea', 'wp-includes/SimplePie/Locator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s����;�uvf^��'),
('Ë\r�A��W-q43��', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.bgiframe.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ƨ��(��6#2��9c�'),
('�y�$n#\n�H{��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/friends/requests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F\rjY�s�=t�%�;'),
('�m��jg�.��P��', 'wp-content/themes/twentyfourteen/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f��2"�zYl�/���'),
('���d��}�����*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/style.css', 0, 'gV�7���-���C�g', 'gV�7���-���C�g'),
('��]u*�''EYߛ�!', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhook-logs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D�������nf'),
('+�Q?�af�5�L��', 'wp-content/plugins/wordpress-seo/inc/class-sitemaps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ir�Һ�aI�''%���'),
('6�X��3����ck0-', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's���F	xh���B'),
('F��e���}�(��', 'wp-includes/js/jquery/ui/dialog.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F����]���>�'),
('G�U�]�0#,�L�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/external/URITemplateParser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '܂��BH�K�;�^i�'),
('P�ו2y���U�j@', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
(']���e-��E���q+�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_psr4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:\0��>������}LQ\0'),
('���r6��vr��!�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/change-avatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������4�<�j%�*'),
('�i�F�h�<�}ދT', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-notices.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��y�-Ƿ����m�'),
('\0{f�^X��\r�bV-', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WHMCSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:x����+x[��'),
('%h�s+���t�L', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/password-verify.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LC�iÑ82~v���'),
('\Z�׋>\Z�m��k.#', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TYPO3FlowInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���,�oF�D:N��4'),
('�q)���:?�]^�,x', 'wp-content/plugins/siteorigin-panels/inc/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_Y���ꢶ�p�0V'),
('t�0���6i�4�g', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile-edit.php', 0, '۽��� æ*,@�W��=', '۽��� æ*,@�W��='),
('v�i���EcX��G��^', 'wp-content/plugins/woocommerce/includes/wc-notice-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M����1�0pZW��G'),
('��_flM�''�eX_�M&', 'wp-content/plugins/siteorigin-panels/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f~���������g��'),
('����T�il6Cᥜ;', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/restore.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��kR�''Wb�]�a�P�'),
('�<��r������ڝ', 'wp-content/plugins/buddypress/bp-groups/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a�"y���V \\���#'),
('�`1�����o��x', 'wp-content/themes/twentyfourteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '۩�G^p�x��a`!D'),
('��>�/ᡇ_�����', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o/�>ڥ�\Z��tЉq�'),
('�&UX\r�L4{����', 'wp-includes/js/utils.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�9����!�;�	��x�'),
('\Z����\rA���', 'wp-content/plugins/buddypress/bp-themes/bp-default/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c��0�8*|�\r��G'),
('\Z2�]��̉�G�;��', 'wp-content/plugins/buddypress/bp-forums/bbpress/edit.php', 0, '�b�/����|ߩQ', '�b�/����|ߩQ'),
('\ZR�p`X���h>�', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-ga-ecommerce.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���2S\0x�[@���'),
('\Zw���$q�s�33�}', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-pdt-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�p4<�Wi��l''���'),
('\Z��iD��Փ�$�aI', 'wp-content/plugins/woocommerce/templates/loop/loop-start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4��`i���*��C|NA'),
('\Z�e\r���j!^��	��', 'wp-includes/js/mediaelement/bigplay.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qd6�=�Ҟk7�b�Rgj'),
('\Z��k�~�gWN�/m�/', 'wp-content/plugins/woocommerce/templates/notices/success.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y$""��������0\0'),
('\Z������)qtsCI9', 'wp-includes/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�p#��� �C�T���'),
('\Z�y��8R#O�y��', 'wp-admin/css/nav-menus-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�JHyTg��ǲZ�');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('\Z�UE�s(���#E�p', 'wp-includes/images/smilies/icon_mrgreen.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���J����Rw��w��'),
('�w�i�hg$�����', 'wp-content/themes/twentyfourteen/languages/twentyfourteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0�J�7E\n:�tC���'),
('A�Z�哖̅L��(', 'wp-includes/js/mediaelement/skipback.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m�0�E���k��o�HF'),
('\Z��^�|g�\Z�v?#�K', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�LW��8µ�c��l�'),
('C_�8�*c\Z2d`{Y', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9��2��"��?��H�'),
('\\E��b�����', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MODXEvoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� ��Ќ~��^�F'),
('�,[2��3�51��$\0S', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-scripts.php', 0, '7�\0؞\ZU�<"�{�Q', '7�\0؞\ZU�<"�{�Q'),
('�y���!�\0pZ�[A', 'wp-includes/js/mediaelement/mediaelement-and-player.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@�=m�?�� �g���'),
('��E7������jj', 'wp-content/themes/hexa/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~��<�\n߶Rg�|<5�'),
('��V���UԊMq��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.kses.php', 0, '�\Z/L�1n��?����', '�\Z/L�1n��?����'),
('ֻE\n�<�B�[�,', 'wp-includes/class-wp-ajax-response.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?��3���(~���'),
('�k}���yNp:۹', 'wp-content/plugins/buddypress/bp-friends/bp-friends-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A����@g���/ڐ'),
('��*k''l?,Wӟ�', 'wp-content/themes/twentythirteen/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-徭�r���ᑄ'),
('�m��n9�F�6�', 'wp-admin/css/admin-menu-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��G�ƣ�ؔ^�,�'),
('��Ӹ��w0���', 'wp-content/plugins/woocommerce/templates/loop/rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+w(:.s������'),
(')�M��^�ûoz�', 'wp-admin/images/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-[��t�P���d�'),
('1����:sY�8��$', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v���i6��,+�\Z�G'),
('4%�IH�O��ʰ�L', 'wp-includes/css/media-views.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��]���7�B����w�'),
('8�ǀ�)ƨj:��r�', 'wp-content/plugins/wordpress-seo/css/metabox-fresh.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�''N��6+� ~��j��'),
('<B��ʱ�A51ӱ', 'wp-content/plugins/akismet/_inc/form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�4�l*��&��i'),
('C�/�;)��ّ�o', 'wp-admin/js/comment.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���I���4�D�O#]'),
('Lo�SX���9!r�4�', 'wp-content/themes/twentyfourteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B;��a`GԢ�މ'),
('T�gslF��ʞ��Ly', 'wp-admin/js/set-post-thumbnail.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����8�կ!�1z['),
('[�����f��A4���', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_desc_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ԅu��B�D�&"�he�'),
('az$ߚ�	0��n', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen-rtl.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W�l�i\\��椰I�'),
('h�3��p*J''�j�腢', 'wp-content/languages/es_CL.mo', 0, '1��_#n�]�G%��', '1��_#n�]�G%��'),
('vs�%�z�����F�', 'wp-admin/css/ie-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A��^P�#e���1�~'),
('z�|*6�S\\5��3', 'wp-content/plugins/wordfence/lib/wordfenceScanner.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ת`�ک�1�����'),
('�\n$z�X�`�1Bw', 'wp-includes/js/tinymce/plugins/charmap/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k��!�4r���ੇ��'),
('��=b�6��hs���t', 'wp-admin/ms-themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R�K��$�IZ1�i%�'),
('��''��FE�A�vQMv', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Abstract.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>\r��5]xVI�''�i�'),
('�̭��ף�x�}1�j', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��έ��Z�gٷk\r�l�'),
('�����)\Z�+�#�', 'wp-content/plugins/theme-check/checks/postsnav.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��A�XA\Z�a�|�(p�'),
('����)��׸��D', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/unread.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U���d��''�"�S'),
('�-=Q�Cw�tnL�#', 'wp-content/plugins/wordfence/lib/wfBrowscap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Q?SXl��4�Z�>'),
('\n��O�_��;]/^��', 'wp-includes/images/down_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e��]:u�Wv���"��'),
('G_bc�.,]&���', 'wp-admin/js/image-edit.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��c����Ng�f)e�i�'),
('.v��2zX�䩵�|�', 'wp-content/plugins/wordpress-seo/admin/class-taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3��ǹv{~���G�'),
('fMx���	�+9�U�', 'wp-admin/js/customize-widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z=DUk�G�A�ۼ�t'),
('kj~�:�`"��q�R', 'wp-content/plugins/buddypress/bp-forums/bbpress/page.php', 0, '(��aa ��O-�Mn�', '(��aa ��O-�Mn�'),
('\n^ނ��%�Ĳz�L', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-load.php', 0, '�_ ���i�L7�i��@�', '�_ ���i�L7�i��@�'),
('��\Z_7��U���`J^', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/blogs-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ĵ���P�u�+�����'),
('�%��\\��MA�����', 'wp-admin/images/wordpress-logo-white.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c=Yܵ����s����'),
('����J�}F��E\0�9�', 'wp-content/themes/index.php', 0, 'gD,V�=\\�bP', 'gD,V�=\\�bP'),
('��x��F��=\nU�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-topic-tags.php', 0, '�׺C�K��JR�w�K�', '�׺C�K��JR�w�K�'),
('�^�I�(��:궾', 'wp-content/plugins/woocommerce/assets/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YO�?-ò��M(��'),
('��=��u�ܑ����', 'wp-content/plugins/woocommerce/assets/css/woocommerce.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��h�#5E��,�	����'),
('�d�o�6�[?k�N�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/rewrite-rules.php', 0, '7��#��h�B�xx�', '7��#��h�B�xx�'),
('�=�}C���i��HT', 'wp-admin/network/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i&�Q\\Ӣ�綨'),
('�g��I�!٭���_�', 'wp-includes/ms-blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	$x�����^D(pr['),
('��]/~���q��XŎE', 'wp-includes/js/jquery/ui/button.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h��Qֈ/d������\0�'),
('��i^o���49�I', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P�b6QW.�+|h�'),
('�e�H��9��[���1', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���{�AF\\�����'),
('/��F�	`�$%,��K', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.mailer-smtp.php', 0, '��''p�suA���V�', '��''p�suA���V�'),
('2u\0�]*qS���p�\\', 'wp-content/themes/twentythirteen/sidebar-main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���X"_�;�s/�*x'),
('?�j��QFq�GM�', 'wp-content/plugins/woocommerce/templates/content-single-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C3��8�5VZ�G�G'),
('S''� �"�����', 'wp-content/plugins/woocommerce/templates/cart/cart-item-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j%sM�f�03\r8����'),
('o?!ψ��Λp�<�', 'wp-content/plugins/wordpress-seo/frontend/class-opengraph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yʻ��%)��6���!&P'),
('p�c��a��D2���', 'wp-content/plugins/google-analytics-for-wordpress/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('t_z�&���U旜�l\Z', 'wp-content/plugins/woocommerce/assets/js/frontend/address-i18n.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '́@���c�}]є^�i'),
('z���D�>��A�)�a', 'wp-content/plugins/wordpress-seo/inc/wpseo-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!�w�8�?Qo�@|��'),
('|�&;�r�Ls5��', 'wp-admin/includes/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\\�����''3�)ާQ'),
('��B��/�HHLŰ', 'wp-content/plugins/woocommerce/i18n/states/JP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)9Qo3���o�H'),
('���Ye�.�0s��', 'wp-admin/includes/class-wp-comments-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�aܪ�o�4ZB���'),
('��''-�p�-���f�', 'wp-admin/css/l10n-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{5�ɺ�+e�4in@'),
('��v"�:�`A''8��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/buddypress.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ȭ�dW�^�px�'),
('�zdy&c�t �Q�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ȹ	�Z^��+�}i��'),
('E���evG����', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-media.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ü{}2�ƚ���#�'),
('L��bP�-I׭1f�', 'wp-includes/theme-compat/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x������vY����'),
('`�ˡ��^0�+�E� E', 'wp-content/plugins/papercite/tpl/default-bibshow.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]�IH��W�o	Q�I'),
('pB\\pf�zA@�E�t*�', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�캔N��[a�����e'),
('����Fy����P�', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y''BԶ�l���~k��_W'),
('�o�?�M��eȖ��', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.pie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��s\rE�,��B���.��'),
('����>$M�h9��\0�', 'wp-content/plugins/buddypress/bp-members/bp-members-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K\n���˶��Y��A'),
('����4��/�x��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/admin-forums.js', 0, '�K[�@������6vr�', '�K[�@������6vr�'),
('�HK�˕��B', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhook-log.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�e��&�6�{�'),
('  �G��\\mq�\0�Dz�', 'wp-content/plugins/buddypress/bp-core/admin/images/menu-wp.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5��3 3۴^3�+5'),
(' *@ADғ�=pu���E', 'wp-admin/user-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 	�7�,	P�Ǧ*!<g�'),
(' .գ�M�E|��\\��}', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/DokuWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N��]�^g�\r���x�J�'),
(' Q�i*L��$҄~��', 'wp-content/themes/twentytwelve/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ŧП#�!&d%�3'),
(' Y̟���uT����''', 'wp-content/themes/hexa/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$D\\�,������)�\Z'),
(' d�F�e��5�����', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?''�� �K��>����'),
(' g�s͌��I�}$0x�H', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ChefInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't�&�r@;���f���'),
(' �iLI���vm^���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-edit.php', 0, 'q�ϔ�d�m�����', 'q�ϔ�d�m�����'),
(' �={��q��>�F�9��', 'wp-content/plugins/woocommerce/templates/checkout/form-coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?4\Zh&��H1g��j�'),
(' ɷi�S���!O���w', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-plugin-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7��e�]4#�W��0�'),
(' ��752��ɤ�D�[', 'wp-content/plugins/papercite/tests/test-show_links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't+��D���G��^�T'),
(' ��c̫)I�\np,͑��', 'wp-includes/css/jquery-ui-dialog-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gW��.��yj�2g'),
(' �p(?Qn����a��Z', 'wp-includes/js/plupload/plupload.silverlight.xap', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<RGPTmᳪ�o���'),
(' ����2+��jn��O_', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/tags.php', 0, '�^O�Ԋ�kԽ+�x�', '�^O�Ԋ�kԽ+�x�'),
(' ���?&��]k�', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocomplete.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��T}`3Y��̼h'),
('!	�b3�$Ѥ]�l;�', 'wp-content/plugins/woocommerce/includes/admin/views/html-report-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��9idnEzf8�'),
('!o�\r��A��v7��e', 'wp-admin/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���g�S�؍���Jo�'),
('!eю�}\\�w8e�@', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��X�g�0L.ǃ)&�'),
('!1b݅9��*���\\��', 'wp-admin/admin-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nksj����Z����'),
('!T�y^�8��{``��', 'wp-content/plugins/wordpress-seo/changelog.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��U����#�"t'),
('!_��輵p3p�n��L', 'wp-includes/images/smilies/icon_eek.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_��s���jN��_z�'),
('!�(\0�#�)2\Zv`�A', 'wp-content/plugins/woocommerce/i18n/states/TH.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����5�&±b�'),
('!����ޘ��V���U�-', 'wp-content/plugins/buddypress/bp-core/bp-core-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ԺmJ?J.��\Z�p�'),
('!�\Zd�3$M��S��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/read.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U���d��''�"�S'),
('!�&�sb��j��-', 'wp-content/plugins/buddypress/bp-activity/css/mentions.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��C6bB�֣��[�'),
('!�R���p�nL�w�m7', 'wp-includes/js/tinymce/plugins/lists/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YD=''���2B9hU1@��'),
('!ֻ��N������}�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/phpunit.xml.dist', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f�T��4�v�+q ~�'),
('!����Y0-z1�dm>�', 'wp-admin/js/plugin-install.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�v�l뷺�%��,���'),
('!���l��"���Oa', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�J5�q<җPcH�@߮c'),
('!�7(��E�Aةs�xt&', 'wp-content/plugins/wordpress-seo/js/wp-seo-bulk-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#]�-�a�Z����'),
('"(}G��r�	0��V(', 'wp-admin/ms-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''�\0�}��:��ㆯ�'),
('"IFn����@�a�}�9', 'wp-admin/includes/class-wp-themes-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ks��$�@�}%'),
('"Y��2:h�>rF8	�', 'wp-content/plugins/papercite/tpl/av-bibtex.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�3��tWv\rM���'),
('"p�� 1��[wA>G', 'wp-content/themes/hexa/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�U��Tz{\\�N�2��'),
('"����b9��e�|�_�', 'wp-includes/feed-atom-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c�D1;�)��-�B?6s'),
('"�\0�I\n����%՝', 'wp-content/plugins/buddypress/bp-core/admin/css/common.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�\r�o�4� �*���6'),
('"�����u>1�7���', 'wp-includes/class-pop3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K���S��|����/}'),
('"����c���9�&', 'wp-includes/js/plupload/plupload.full.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�I�6�G��\n�!:D'),
('"��6\r+K{�\Z!a', 'wp-admin/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���%YvǱ�!�ئ&	'),
('"���;''|��(hM�*m', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-1.4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"Zd��"~��@F�@'),
('#\n��/��PZ~h���', 'wp-content/plugins/wordfence/lib/email_genericAlert.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v&Z8�Zی"�jsq|8'),
('#_�M���b�r��', 'wp-content/plugins/siteorigin-panels/css/images/dialog-separator.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����a��R����o?<'),
('#2@�~ߨ1D���d�', 'wp-content/plugins/buddypress/bp-core/deprecated/2.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ad�4$���RGUK�t'),
('#c��4���m"C�K', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/mastercard.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���H��\0�"�\\��J�'),
('#���<<=�T5�0K{', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-reset-password.php', 0, ']���I0֕K󑫯��f', ']���I0֕K󑫯��f'),
('#�D���Т�ΚȔ�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/defaults.bb-schema.php', 0, '�\n��z_qw�|	cX�', '�\n��z_qw�|	cX�'),
('#�Xӗ�J;H:ta�I�6', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/button.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7#A~f��O�r���S�'),
('#�?A�~���\0oA��M', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('#�)m��}�\\Z,Ʒ�', 'wp-content/plugins/woocommerce/i18n/states/BG.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�w�c�تI{2X~.6'),
('#��@�a�e	�M���D�', 'wp-content/plugins/buddypress/bp-themes/bp-default/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\!��:=tMEPZu��x'),
('#��N��ww�%��|?�', 'wp-content/plugins/wordpress-seo/css/metabox-classic.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�S�a�樛]X�*'),
('#�:��қ�~}G��ɾ', 'wp-content/plugins/wordpress-seo/css/jquery.qtip.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����J��b�a�/'),
('#������<w��8c', 'wp-content/plugins/woocommerce/i18n/countries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-�N�b���#1ir��r\0'),
('#��<c����o�W#��U', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%���>�h�]9����'),
('$T,��N�.�Pz~ް', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BY�,b���Ix�X\\'),
('$5%Nr�Ԥ��K{r�', 'wp-content/plugins/siteorigin-panels/widgets/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y#+\\p8����%dJ�'),
('$=J�E���W_1\n��+', 'wp-content/plugins/woocommerce/includes/class-wc-ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':E�yĠ"\ZɋD�E��c'),
('$js&��vg���w�&', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/default_header.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-Әg?)�kL\n�Qh��'),
('$o-�n�7���6}7', 'wp-content/plugins/buddypress/bp-core/bp-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_�e����ٝ:L:K'),
('$��`Y�25a"����W', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/rss2.php', 0, '�Q�K�T��H�q3', '�Q�K�T��H�q3'),
('$����0S\r�r���', 'wp-includes/images/smilies/icon_redface.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm��A��R!4a'),
('$�+)J�d�;�\\Ֆ�D', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-meta-boxes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�.�Ks�рr��œ�<'),
('$��������/��4�', 'wp-content/themes/twentyfourteen/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')T��6�^ԧ{�r'),
('$�E���І_zE��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/test-class-api-libs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a�+���ߡ�g=�)'),
('$�p���\\�_��ZNՈ�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�\r��1�������'),
('$���C����/�9��', 'wp-includes/class-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\r����e;��'),
('$��P���Xu�����', 'wp-content/plugins/wordpress-seo/inc/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('$��ͯ��R.�H�ߞ�?', 'wp-content/plugins/buddypress/bp-themes/bp-default/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�5E"t�����d��'),
('$��߰�R�\r��ab8!', 'wp-content/plugins/wordpress-seo/vendor/autoload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h�9��gm�����'),
('%#ZHp��F��S���M�', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.bgiframe.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	���{�j�gkT&ފ�'),
('%9�o�uz�"�	ZI', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin_dashboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��1���c&�E�\0'),
('%<�S��L����hi^�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-error.php', 0, 'H���{���''�.�p魡', 'H���{���''�.�p魡'),
('%N��k����<�m[�~', 'wp-content/themes/twentythirteen/author-bio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�7�҄!�����!'),
('%���V��Ћ]��=w', 'wp-content/plugins/wordpress-seo/admin/class-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%g_8P�3Oh��p'),
('%�k���|\Z�ΩV�N�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���T�i�`���'),
('%����8^�V<�t�', 'wp-admin/edit-tag-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�֮�(�gxh��'),
('%��Nd\0�É0���', 'wp-content/plugins/woocommerce/includes/wc-widget-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z9��%.�B���\\'),
('%��ė��u%.O���ݜ', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_admin_dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"k+C!��մD3Pb'),
('%�\0�F� m%,F��\r�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/password-strength-meter.js', 0, '7�\Z\\3�Sr��8?t9�', '7�\Z\\3�Sr��8?t9�'),
('%�ᓀU|^Sd�ּ', 'wp-content/plugins/buddypress/bp-core/bp-core-avatars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n�K�T�Қ4��d�'),
('&\r����ćH��E��', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_notices.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����''m����4�-'),
('& �kh0�D@˓�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r��T2��@1�3:���Y'),
('&*���dĆָ�	�H5', 'wp-admin/images/align-center.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	�\Zݶ�4y�dY1�e�'),
('&=\Z�+t�"�/k''\n', 'wp-includes/js/jquery/jquery.form.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�À�s���E�VM�-�'),
('&C���)���Eh]���4', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���砍S6������c'),
('&_�����t�fc�CG', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd<����uu�r�z'),
('&ee�\n3K���vZ��', 'wp-admin/ms-delete-site.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����_FS�� ��� '),
('&t!0^g��bJ�c,>3', 'wp-admin/upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�,D���P���k��w'),
('&�R''V�ꫜ�`���ݸ', 'wp-content/plugins/theme-check/checks/navmenu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&ζW�\Z����[�h2�'),
('&�ܟ&�5�j�9��N�', 'wp-content/plugins/woocommerce/includes/class-wc-logger.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�aC���ܹՀ?,�a8{'),
('&���Rw?~�j�hJ�D', 'wp-includes/Text/Diff/Renderer/inline.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n�n5�P�����B''�'),
('&��d�W�<˷)&\r!', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nu��v�}�µ>��z�'),
('&��]0W��\n)�=��', 'wp-includes/js/tinymce/plugins/directionality/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`�W%<�:oJ��9�'),
('&�`�O�Q5�Q�43�', 'wp-admin/theme-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���jM�>��	�5LO'),
('&�l�w�:�,\0�rI�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-deprecated.php', 0, ' lpC,�+�e�Pf��@', ' lpC,�+�e�Pf��@'),
('''�����+Ks��t�', 'wp-content/plugins/theme-check/checks/cdn.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_��wH�����V�'),
('''\n�!�j�8"�]>�', 'wp-content/plugins/buddypress/bp-core/deprecated/1.9.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{���\r�u�t�܅\Z:d'),
('''C����*A��&hs@', 'wp-content/themes/twentytwelve/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�_�n	��@�S��0'),
('''M<��h1���9�L�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-attribute.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o)h�������E�&<'),
('''V>\r�q�y�O�\0v.�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Concrete5Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y�b������\\Ge7a�'),
(''']�d`���g�\0����', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/45pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%%����K�0Jȇ��'),
('''d���Ίj��ӭ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��N*�[�܃���� '),
('''f�9�qe��b��?I�!', 'wp-content/plugins/buddypress/bp-core/admin/images/menu-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��֙�$�haPyz|��'),
('''r�,�qR�G��G�Z', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-taxes-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;"Ǹ�[�0��nc'),
('''�����)\n#�nI�Kn', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.mailer.php', 0, 'ۯ���R3Ќ��S4s�}', 'ۯ���R3Ќ��S4s�}'),
('''���� �o���S��', 'wp-content/plugins/wordfence/images/icons/ajax3.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mw�ߴtꍓ''\n���s'),
('''�)�@��\ryc:�PE', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_CacheParser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5���L<<Š{���'),
('''��Ʒ����M��Y7�@', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':L�3?(�vC)�M��=O'),
('''�Wp_:l����1 ', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�M����U�p{`8w'),
('''����0�Y%n��Tt�', 'wp-content/plugins/buddypress/bp-themes/bp-default/forums/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���{cv�K����+���'),
('''��T��*<�=`�ӿ', 'wp-content/themes/twentyfourteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|\rۯ�as\0''/B�6��'),
('''��)n���ΰo��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MoodleInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}����͍�Z���'),
('''�V:#���\0aIL^�!f', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':6y�!ɩ��R:��'),
('''��e꽊%G�r��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/MediaWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s|�V�Tu⛙귢�'),
('''�F $O�^�n��IR', 'wp-content/plugins/woocommerce/includes/wc-deprecated-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����D��z�V���j'),
('(��g%\0��4��l>��', 'wp-includes/js/jquery/jquery.schedule.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&��T�k�f؞���'),
('(�o��ҟ~�P*���', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/CardToken.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m��ݵ1`{]�J'),
('(0�U ��7�sm�:t�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install.php', 0, '����-{Fi�Zh\\''�', '����-{Fi�Zh\\''�'),
('(?���>��S�N揚�&', 'wp-includes/images/media/default.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-����I�B�h�@���b'),
('(R\0HB�wè:�8', 'wp-content/plugins/woocommerce/i18n/states/ID.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��pN8��w �t[�'),
('([d��������BQ��', 'wp-admin/js/updates.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0�\\�1Q��b�jȱ[�'),
('(uZ/��T�_|���', 'wp-content/plugins/buddypress/bp-core/bp-core-taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����{\n9,^my6'),
('(x*J���,�LÛn�<K', 'wp-content/plugins/wordfence/images/icons/arrow_refresh.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k�w�`�`�|�}$G��'),
('(~6vqV�0�{�"', 'wp-includes/ID3/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Ɯ���VLN[�'),
('(���v|T�— ¥�', 'wp-admin/includes/screen.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FkbV�\n��3{\Z�'),
('(�4\ZoKpk}�j����', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-download-permission.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�q��~�}�\Z�:'),
('(�Hq5�\\������', 'wp-content/plugins/papercite/bib2tpl/bib2tpl-entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��������~����'),
('(�U�{����(\\���', 'wp-content/plugins/woocommerce/assets/js/frontend/cart.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0\r�2y��اh�'),
('(�Z�>!�ݜ��x', 'wp-content/plugins/buddypress/bp-messages/bp-messages-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\>Is�*Xɔٺ	D}�'),
('(�^�3N������3', 'wp-includes/wp-diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5v�ݺL?���t�+'),
(')|��;m8Z\rs�p', 'wp-content/themes/twentythirteen/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\^�@��ms��x�'),
(')1��1@�$8m��&%', 'wp-content/plugins/papercite/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�umJ̼\\�?у�&3'),
('){�jW-_�Q=?�GlҢ', 'wp-includes/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�X�;�����w�XG��Y'),
(')|�x��2@��r��', 'wp-content/themes/twentytwelve/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g�^�s��!�''�����'),
(')�_�7�o�8���?{', 'wp-content/plugins/woocommerce/i18n/states/US.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�VB�..s���r�}>'),
(')�Oz=�u����˷', 'wp-includes/rewrite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��vD;n����#�Fm)'),
(')�	�7�)T�}���P', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����3���!�O�IƑ'),
(')�M���፿�d]�p�', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/blogs-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��p�A�cS��M���~'),
(')̃�2�k�h���! ', 'wp-content/plugins/akismet/akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?�`߱ ���BY&'),
(')�h�Ē��-|B�d��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!\n(��''�n����՝'),
('*=67-{�S�;<��', 'wp-content/plugins/woocommerce/assets/images/storefront.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����[xѧcB�_'),
('*��,����m��', 'wp-content/plugins/papercite/utils/osbib2tpl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H1�����c�hh\Z�'),
('* a�F���4��u�vU', 'wp-admin/images/menu-vs-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�ZY<�i�Y��b�'),
('*B���|�d������', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Deposit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�-��5+8�i%�(B'),
('*K���\rA\0�?�R>�', 'wp-content/themes/twentythirteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�tT�J''A��<'),
('*Rc���a� f3-��', 'wp-content/plugins/buddypress/bp-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_??VC�p�j��a+'),
('*t$�ߋv��n��s�', 'wp-includes/js/swfupload/swfupload.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z%�5�e,�r��HO'),
('*yw.6���:#Z�', 'wp-content/plugins/buddypress/bp-forums/bbpress/license.txt', 0, 'g1��''''�\ZI�]j(*', 'g1��''''�\ZI�]j(*'),
('*��-3�u��E�[�O#', 'wp-includes/images/down_arrow-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s���$�6(�@�a'),
('*Ь��l\n�K�''z��', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ig�2<&�R��FzI'),
('*���L�m&&2��\nb', 'wp-includes/js/tinymce/utils/form_utils.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-�D{}��wk��k|'),
('*Ӵ-�q�;�����', 'wp-content/plugins/woocommerce/templates/global/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*\Z���%�@��'),
('*�\Z07ѥ1O���َ8', 'wp-includes/js/json2.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't������uD�+�'),
('*�.�0��T(\0���ȣ', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Hqq	�ெ��e�hM�1'),
('+9���[BU�E�e', 'wp-admin/js/updates.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E�|Q��\0V��ã�'),
('+m��$`��֐����', 'wp-content/themes/hexa/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<l���뫾�ځ��f\\'),
('+�6-��+���]pu', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-styles.php', 0, '���m\na�?��QKI�D\0', '���m\na�?��QKI�D\0'),
('+��C��=C��\Z��j�', 'wp-content/plugins/buddypress/bp-core/admin/images/member-types.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���jV�g�;J>6&�'),
('+��qKaH����z�', 'wp-content/plugins/siteorigin-panels/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D��m!���9��%lK'),
('+��G*#�������f�', 'wp-admin/network/site-info.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')��峞;�\0T,ʔl'),
('+��P�x�3�����L', 'wp-content/plugins/wordpress-seo/css/xml-sitemap-xsl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ݍ`�g�.2�ʮЗ'),
('+���^2��s1�\0��', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-addons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}jw�]�@:��*�'),
('+���t�%R?������', 'wp-admin/network/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8,�4,���X���u�'),
(',4pkE�����Iے�', 'wp-content/plugins/buddypress/bp-activity/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�����4���s�%'),
(',*H���H����.��', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/class-wc-gateway-simplify-commerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2�ۂC���[UÀ�('),
(',<�� �?C]�0A�', 'wp-includes/js/tinymce/plugins/colorpicker/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(oT���R��a�'),
(',B�c���ԛZ�4Y', 'wp-includes/js/swfupload/plugins/swfupload.speed.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AZ7��k���E`,*�s�'),
(',T�q2ܱr�	g�n', 'wp-content/plugins/buddypress/bp-forums/bbpress/topic.php', 0, '��8tӋuF�2�Q���', '��8tӋuF�2�Q���'),
(',ad�-\\�hi���', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V��oׂ@\n{��''�)x�'),
(',cS̻͘��VgBm���', 'wp-content/plugins/woocommerce/assets/css/menu.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i~RD����	\\�'),
(',x���\Z	l��ź&��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/HuradInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U-0�7���\n}m�\\^'),
(',���@��hj�qrޒ�', 'wp-includes/ID3/module.tag.id3v2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U[��,j�}jAؚ��c'),
(',�hɃs?4B[�^՝', 'wp-includes/SimplePie/Cache/DB.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y�OU���.�b���'),
(',���1`Ц�q;�R|', 'wp-content/themes/twentyfourteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���]z4���f߮'),
(',���^,?x��3Ao�', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-categories.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ٍ�H��(vr�����'),
('-"Q�����[�$���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PPIInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m�Ď妁\r"�Bx�~'),
('-�T��a�P�?�0et', 'wp-content/plugins/wordpress-seo/admin/class-admin-init.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6���)Ғ�MV8�1''�'),
('-6WcƸNo�JJ�S�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/index.php', 0, '�z32��-�]�VH��', '�z32��-�]�VH��'),
('->��]���2j���', 'wp-content/plugins/wordfence/lib/menu_rangeBlocking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��i�ܯ��\Z�1��'),
('-kdϯ���X�w\\7���', 'wp-includes/admin-bar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��} �r��r��3/'),
('-ljZ�\n* (hiu2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_namespaces.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~�(+�K��H&G	�'),
('-s���-Qe�74�t', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-assets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���8p+�\0ĉ?J �'),
('-����Ǹ�%w=��', 'wp-admin/css/colors/ocean/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z|[���l�|ٱf%h'),
('-��)7�5y�8c��Wv�', 'wp-admin/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�׊i�y�7j<'),
('-�_��+��Yn��S', 'wp-includes/js/jquery/ui/tooltip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A�''��ᗴ:�N�T '),
('-�f��4]�#"u��l', 'wp-admin/css/colors/light/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S!0��r��O�p�'),
('-��藂��Y{]ns�', 'wp-includes/css/wp-pointer.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q�U�����|hq*y'),
('-��\r#>0y?=P�pD', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/js/simplify-commerce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����oo��N׉洹'),
('-�&��׾(F%P�5�', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-out-of-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6E�����EY��c5�'),
('-��D3�� ���٦�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/TestCase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!��W=qUL�m�^*�'),
('-�S�|Q''���&T�Ub', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uf/˟�����)�"x�_'),
('.=?�X� �f�T]��', 'wp-content/plugins/buddypress/bp-forums/bbpress/forum.php', 0, '�7��,*� ��NQ��\n', '�7��,*� ��NQ��\n'),
('.Lۡgށ��^�L', 'wp-content/plugins/wordpress-seo/admin/pages/metas.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')B.�dj?�0���D�^'),
('.2��C&ȏ�H��*:�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_ServiceResource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-�M++\r\0�Vq»N�'),
('. �\0_oE�]A�_�0PJ', 'wp-includes/js/tinymce/plugins/wpautoresize/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��u��Æ��+���'),
('..6}.�ǲڣ�~�n	�', 'wp-content/plugins/theme-check/checks/i18n.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���i�y}�������'),
('.HzV:n�#�4���', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rh����x���/'),
('.IhU���3��+B\Z��', 'wp-includes/images/admin-bar-sprite-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q����8��o��'),
('.Mm�v�!�g؃�', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M&�	(o�=�Ӻ��'),
('.[ȯ.��*����:�h', 'wp-content/plugins/woocommerce/assets/js/frontend/credit-card-form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G�I\\�ɲ�O��K�'),
('.�E�[J��l�x��', 'wp-content/plugins/wordfence/images/forward_disabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M_��Z?�N)�Ҋ�:�5'),
('/(R��Uո&%�Z\ZL�k', 'wp-content/plugins/papercite/format/chicago.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Y��	�-�F�/�'),
('/1�H���.��UfA4', 'wp-content/plugins/wordpress-seo/js/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('/<ا^ɼf}�"���$�', 'wp-includes/images/media/document.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v�4�8�Αy�6�d�'),
('/U�(���L+V�����', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-resource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c�5fV�ěa�\Z`'),
('/d��Ê����z\Z�|�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l��ŘAvߗ��*3�-'),
('/�s��C4��������', 'wp-admin/network/setup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Bm>n9z]�њ�'),
('/���NvSAw�M�M\n}', 'wp-content/plugins/siteorigin-panels/inc/default-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y\Z���o=\Z�O$�'),
('/��''�p�i20����	R', 'wp-content/themes/twentyfourteen/sidebar-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��`��kt֙��|,6'),
('/鹠���ΰ1�iw��', 'wp-includes/images/uploader-icons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���&-��O��Õ�~'),
('0��Is]�Ř''Kh���', 'wp-content/plugins/buddypress/bp-groups/bp-groups-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2Z9Q��#mv��/��e'),
('0*��t�(�#�ů�>', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_enabled_hover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���''�k��ȭ\n�&5�'),
('05,y��9=�3���', 'wp-content/plugins/buddypress/bp-themes/bp-default/sidebar-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ƱVA�+6 ��'),
('0<�����lڿ��J��', 'wp-includes/js/wp-backbone.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i���H.�^�V!'),
('0P�������,���', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-1.5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@q	k���HP\0kXiB�'),
('0]�qK''�f�x����', 'wp-includes/js/tinymce/plugins/compat3x/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W����������r��'),
('0a��y\r`r^��Z	T�', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nu��v�}�µ>��z�'),
('0ei7�yD��Rr"W��', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/eBook_261x130.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�){���5�- 4&D�N'),
('0pڨ�&!�_+e㔕3�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh-checkout-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,�^���2k���'),
('0{!�	�y 6$@���q', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.time.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WD����5�z�)I'),
('0�B޽��#q�A�\n', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mO��Z=��N�Xv����'),
('0��:�tu�<F�O��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DokuWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}��=�%����7\\�8V'),
('0���E\00���X�H', 'wp-includes/js/colorpicker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5\n���w�-g���:OH�'),
('0�A�N���7�����S', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/groups.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B=#5�SC�,I�'),
('0؋��/�ؠ��1`F', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@[P�\\�\rs �N�'),
('10��|^�I4�J���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/register.php', 0, 'y��=��>dO���', 'y��=��>dO���'),
('13��e�T|ν9�kX=z', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-he_IL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����.t��O=�Β'),
('1b\r�2l���a]�߸', 'wp-content/plugins/woocommerce/assets/css/reports-print.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@wW��+-��hh���'),
('1s�)6�Ӷ���C��Η', 'wp-admin/user/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��''�$�U�m�x�Z'),
('1�����+���8%I', 'wp-content/plugins/woocommerce/assets/js/frontend/chosen-frontend.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�js�����u\r�'),
('1�[����a��@$�', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.qrcode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uC�V~\rg�7�qi'),
('1�EfQ�v#)�\n�0EkQ', 'wp-admin/images/media-button-image.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~���WÎ�@��b�rճ'),
('1�A�+�m7��`���', 'wp-content/plugins/woocommerce/includes/class-wc-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�(ۺ�xTt+^"�#G�:'),
('1���%��Ʊ��YF', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ҸW�}s��F'),
('1��X�/�t60^Ҁ!�7', 'wp-includes/js/comment-reply.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\Z~��i_'),
('2@�j�j\0�kӲ��Ә', 'wp-admin/includes/template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9m-�#�c���g!��'),
('2j�L,���W\r��W$��', 'wp-admin/css/colors/sunrise/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X��ɕ�K����Ȇ390'),
('2�+�/�psD2 ����', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-el.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm��fS�4�Phe�X�'),
('2�9G:g�oi���', 'wp-content/themes/twentytwelve/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q���Pչ�Vz9�-�'),
('2�%g�_8���`�Ԋ*', 'wp-content/plugins/woocommerce/templates/taxonomy-product_cat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6�מ���K�G��J''�'),
('2��:^�Blj�R�{', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	���ex��2+$F'),
('2�j4yY|/��̫�,', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WolfCMSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LĜ��L�Ȑr4�r'),
('2��^(��ʭ�-^x��', 'wp-includes/SimplePie/Enclosure.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.�B�n΍K�s]'),
('2���x��L2����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-dir-map.php', 0, '��B+q��א�', '��B+q��א�'),
('3�kMf�9j��]�', 'wp-content/themes/twentyfifteen/languages/twentyfifteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��]��0�wK�4��t�i'),
('3eU��@;�`��O', 'wp-content/plugins/woocommerce/includes/gateways/cod/class-wc-gateway-cod.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.¼��9���P�''�'),
('3k��oW�5	k[mq', 'wp-admin/includes/continents-cities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KWٛ���3��ǝ'),
('3��Y%a6𣉍�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�xQb[xҥ�7�U9'),
('3�l���V9Np�', 'wp-content/plugins/wordpress-seo/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������3���F'),
('3���@n���KE�', 'wp-content/plugins/woocommerce/includes/class-wc-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ƃ�$d�t&ى�c�'),
('3���''���RK�Bf�', 'wp-includes/js/tinymce/plugins/wpdialogs/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���G���7�(tt�@�'),
('3��g�	V<�΁5', 'wp-content/plugins/wordpress-seo/admin/class-snippet-preview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$~0O�@Z	\n䗓���}'),
('3�;*4�1:S�>â�)', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����Lb�\0R�)'),
('3��fQ3�h�5[��W�<', 'wp-includes/Text/Diff/Renderer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����������菨)'),
('4"^u�Yu�D��ۗCA#', 'wp-content/themes/twentyfourteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�⢺��-�r�8k�Q�T'),
('4"��:-�n#\n�Dr��', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/ajax-loader.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0���\0ߺ�}��P�W'),
('48�Vt���+^X�', 'wp-includes/pomo/mo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z�h�^2�.��t��a'),
('4>w�Ji�7]�$+�', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.time.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�kr�r@��b5^'),
('4AI�n09��7c`', 'wp-includes/js/tinymce/utils/validate.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hf�\n[�ٺ��V�}4'),
('4A���}O���?��', 'wp-content/plugins/buddypress/bp-forums/bbpress/view.php', 0, ']>\n�.*�4,�}5��', ']>\n�.*�4,�}5��'),
('4Jf��5C>�Ś��R', 'wp-content/plugins/woocommerce/assets/js/frontend/single-product.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0����`��I��>'),
('4M��50��������', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u���61�נ����4'),
('4Pк09����\Z���', 'wp-content/plugins/woocommerce/assets/fonts/star.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3\\�`|U�2�����'''),
('4a��[I�}���H�m)', 'wp-admin/css/deprecated-media.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���:+QZ�On��j}K'),
('4�@x�(�/Y��G}�', 'wp-content/themes/twentythirteen/images/dotted-line-light.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3���<�(��{IW�'),
('4ͧ��B�)]�i>x�', 'wp-content/plugins/theme-check/checks/textdomain.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|����N�,S�'),
('4�s�oA�����4�\Z', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-script-loader.php', 0, '�Y�I!ZnL3�w', '�Y�I!ZnL3�w'),
('4�pr(�p���0\ZMy{', 'wp-content/plugins/buddypress/bp-themes/bp-default/forums/forums-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�8j��?���sȼ�'),
('4ڂ��L$�,K[�u��', 'xmlrpc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\Zu�w��nƻ1��'),
('4������\n������2', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/invites-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��1��WF�Nh��M�2'),
('4�pB�3�[�Y#��U$', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/responsive.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~9<,x�{lu5��Q�'),
('4��cs8O�$�h�N', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-ajax-response.php', 0, '��W���n��ć', '��W���n��ć'),
('5x������+ZωG�', 'wp-content/plugins/papercite/bib2tpl/lang/de.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�C}�h��:��3���V'),
('5�?��y��<�2�', 'wp-admin/css/dashboard-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���`�/�[n��G�n');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('5/��3JǪ���t�!', 'wp-content/plugins/papercite/COPYING', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hnl�f�c���ǥW�ED'),
('58�d�`S61K>ۮ�v', 'wp-admin/css/colors/blue/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c=SH��j\\sH?�J'),
('5?���ׇRR|E^�f*', 'wp-content/themes/twentythirteen/images/headers/star-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7����\n�ON�x\ZZC'),
('5C�)\nWu�꽝/F�cK', 'wp-includes/js/plupload/wp-plupload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e��;�2�@_e��R|'),
('5N���c{���>�,�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/post-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��G����O~�e=��'),
('5Z����Sμ�v�`6�9', 'wp-includes/version.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�i�t�`|f1,'''),
('5\\h>��w	���N�', 'wp-includes/registration.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q�ύH^�ܲ��I��i�'),
('5]���/����\r�', 'wp-content/themes/twentyfifteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vҼjT`Z��Ub��'),
('5`�]\\ͭi\0���\ZJ�T', 'wp-includes/class-wp-embed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x����=s�w2�'),
('5z/⊧I�2��?��', 'wp-content/plugins/theme-check/checks/time_date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T�&V�vY��LJ��V'),
('5�d�4�����a[���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/user-add-new.php', 0, '�`"�k��0�!��A�G', '�`"�k��0�!��A�G'),
('5�`5�.v�\0�3''v', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post-form-anonymous.php', 0, '\n��>�z�]I�p�_g', '\n��>�z�]I�p�_g'),
('5�bY�	��Cw;Ri�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/jquery.color.js', 0, '���X����o���', '���X����o���'),
('5��WB��$���l�', 'wp-content/themes/twentyfourteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g%VҔэ����Ԫc�'),
('5��Ǯ{:&k���T��', 'wp-content/plugins/woocommerce/assets/css/woocommerce-layout.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{�k�E%L0�{��'),
('5�9��!�sٜg��', 'wp-content/plugins/buddypress/bp-messages/bp-messages-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��$k��	�t>�=��'),
('5��ݱ��1���`r	3�', 'wp-content/plugins/siteorigin-panels/css/front.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��2b��Ќ�ö�l'),
('5�����ʽ9�y=�f', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_f+�{�G�q��#:�'),
('6r��w	�q�)���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PPIInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m�Ď妁\r"�Bx�~'),
('6����X/��HL', 'wp-includes/js/mediaelement/wp-playlist.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɘY8@v��''ٿ�'),
('6A�y�-�<F�kQ��', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U�f�ro�Ɖ�\n��,'),
('6#��O��ZD}�v6f:', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-universal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q+���5���&z��a*'),
('62�L�#>�?��g�6�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�w���>�R;u_a'),
('6;I(�H�m�%��f�', 'wp-admin/css/farbtastic-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����q�@!!�Ek�'),
('6S9�6A�\0$r ��X�C', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/forums/forums-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r��)~���\r�l�F�'),
('6Y���I�B��wH�[', 'wp-content/plugins/buddypress/bp-forums/bbpress/statistics.php', 0, '���k�q�C��W�Z��', '���k�q�C��W�Z��'),
('6[f�9�?�� _�', 'wp-content/plugins/wordfence/images/icons/bullet_yellow.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J&���Ɍ����ԔQ<'),
('6�]j�v�W�k\r3-�', 'wp-admin/load-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z2$��]�Kp�j)�'),
('6̠,��_���q���u�', 'wp-admin/includes/class-wp-filesystem-ftpext.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɵ�\r����>A���x�'),
('6٨	��:{�^D�', 'wp-includes/js/jquery/ui/accordion.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=eQ��\rw"�>���&'),
('6�a*�U�2Jxū��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Symfony1Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L����Q\09�m�M�'),
('7d�L������{�戉', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AnnotateCmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�csD�h%�[p!�4"'),
('7eި$����ч0���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MoodleInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}����͍�Z���'),
('7|oOU���z\0Ef���', 'wp-admin/network/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"?}R2{8\\��?R�'),
('7�Ϡ3?��Yv��', 'wp-content/plugins/buddypress/bp-core/js/widget-members.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T�y �����6��S�'),
('7���d�1��F�r�S', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/css/mijireh.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',w�6?k0�.��N�0��'),
('7�%Wy~׹P?�x��', 'wp-includes/js/tinymce/skins/wordpress/images/playlist-video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�lzV6`wmZBs���'),
('7��O+�����ǋ''n', 'wp-includes/js/mediaelement/bigplay.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	\rqm�^@$��ȍ\r'),
('7�c�¢)��S�eb�', 'wp-includes/js/jquery/ui/menu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h_��:7/aZi���$D'),
('7�c�.$P!�"�򹚆', 'wp-content/plugins/wordfence/images/sort_desc.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<���j��_�ˊR�2'),
('7��!�~��ړD�����', 'wp-content/themes/twentytwelve/page-templates/full-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�N��}ϮN~��"�Pat'),
('8\n��,?��f-*�8''', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhooks-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.����NC�T�'),
('83(2=X<4�\0�b��', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����"�l�?���E'),
('8*`�B����r�!H��', 'wp-content/plugins/woocommerce/dummy-data/dummy-products.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8yd�^W�"=�p�:�:='),
('80���0֛^&��OX', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/readme.txt', 0, '\0ғd+U��\0�<d{$', '\0ғd+U��\0�<d{$'),
('82NG�@|�M�8|\n', 'wp-content/themes/twentyfourteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��*<�S�"��\n��s'),
('8=�I��a�%��k�~�', 'wp-admin/js/editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Я!�2u�d��R^\r2^'),
('8�e��zӭ��3�$�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_P12Signer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/fX�����Q���'),
('8��+G���a攷�v�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/GravInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>�ޑ���U�@^L�]'),
('8�R6�DH��q�-{�:`', 'wp-admin/includes/translation-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���y�����@B}C~D'),
('8�@)��6yg[y�sQR', 'wp-admin/css/deprecated-media-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��A�pE~��-ޅJYW'),
('8��f�dQ���k��a��', 'wp-content/plugins/woocommerce/includes/wc-formatting-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V\r�a�\\��w��@��'),
('8ÛZE�Q$}UP�T��', 'wp-content/plugins/wordfence/lib/wfCrawl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\r#Qqo�}v9�'),
('8�6����$`��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/wp-ajax-response.js', 0, '��[5}����zK�', '��[5}����zK�'),
('8깥.AH�WYG�R�', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-graph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%ջ������������y'),
('8�\n1n�!QD���;��', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���r9�8e�z��`'),
('9�\r5''X���>?�', 'wp-includes/js/customize-preview-widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��z{�Y}q�y�ڴ�'),
('9�h[\\��''3��y�{', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/orange.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\nX�,�\Z�4��n'),
('9ψ[�1d{���@', 'wp-includes/class.wp-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MC+�I>��L�DW���'),
('9/���E���4<v', 'wp-content/plugins/buddypress/bp-core/admin/images/icons32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��h�Q\0��N!�W\r'),
('9:��d�o\n��p`Ry��', 'wp-includes/js/tinymce/langs/wp-langs-en.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f�tS�uc�.k�7a7'),
('9@��X�,������4', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/license.bgiframe.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\k<��3=�dUh���'),
('9H��ƍ�����8�8/�', 'wp-content/plugins/woocommerce/templates/cart/cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P��ܗ�/՛Oz�n���'),
('9�&�����DS^�k��B', 'wp-content/plugins/google-analytics-for-wordpress/admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('9�!5u�~��\nO', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���eK��'']G�K�w'),
('9�2����D�,d4\0�', 'wp-content/plugins/papercite/format/apa.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j�Ru���H�=	:e\Z\0'),
('9�} B^��?	�"�', 'wp-includes/script-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|C�4o�P��L�Lc>Na'),
('9�U�	����4e�o�.', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('9ՍҢ��9��d\r�Y', 'wp-includes/ID3/license.commercial.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K�GD �.}�c�H3��'),
('9�5�ix�����-�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/edit-post.php', 0, '�����8�!�f���f��', '�����8�!�f���f��'),
('9����xZ^XF', 'wp-content/plugins/siteorigin-panels/inc/admin-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������e�\\fJ'),
('9��s�3�SZ,p�8g', 'wp-includes/images/media/text.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z��s��0�ȝ�Q�K'),
('9���܏\nhP�@�[�', 'wp-content/plugins/woocommerce/templates/notices/error.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����XN}�`��'),
(':{���{7�9����', 'wp-admin/link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c���Na�b���d'),
(':�|L�H6(��c�g��', 'wp-includes/ID3/module.audio.ogg.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���v�N�5�O۬��'),
(':5��χF,����p�', 'wp-content/plugins/woocommerce/templates/single-product/title.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�JJsbe1�{�j���V'),
(':<o�VS�����w�M', 'wp-content/plugins/woocommerce/includes/wc-webhook-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{�A��B:1oc�{��'),
(':<�$��0,w"&e({', 'wp-includes/class-feed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����n�LI�j�Z<U'),
(':gዬ��\r\nIհ�;��', 'wp-content/plugins/theme-check/checks/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ݝ�����?�d���'),
(':mwvK\r�����Z��~', 'wp-content/plugins/wordfence/images/wordfence-logo-16x16.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\Zy�3z� R���09H'),
(':���%H`!���\r�Z', 'wp-admin/js/media-gallery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2��� Ғ�����n'),
(':��5��-��\Z�h�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�P��Qe=	E��*q�'),
(':��X�&e��ͣ���', 'wp-content/themes/twentyfifteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ĥ��U�S��t�+�'),
(':��(�s;d��ۓM', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-nb_NO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N����s�ņ��im'),
(':�G2?1�H���]R}�', 'wp-content/plugins/buddypress/bp-forums/bbpress/xmlrpc.php', 0, '�i5i\\��=6Q�', '�i5i\\��=6Q�'),
(':�,��O�N1y��', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�m�h�`	��f���'),
(':�Xqݝ�J\\�5P�4', 'wp-includes/images/spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����1c~''�dv�vHq'),
(':�n̣RM�ti#��=', 'wp-includes/images/media/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�taCA����.��Z��'),
(';�b�fȖ0����x', 'wp-admin/css/colors/midnight/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E�=Y��v�^Ψ��'),
(';,�{�n��V\n-ΊK�2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PiwikInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u̎��#!?5�'),
(';1ы#�Y_N��t�', 'wp-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ă9Y�=�h�W�,W�P'),
(';R�yh���RxK�\r', 'wp-admin/js/farbtastic.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:�T�2Aq]����4�'),
(';����9�ǌ�_''', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/qtip/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
(';�r]DÖ$H���[C', 'wp-content/plugins/buddypress/bp-activity/css/mentions-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�di�ٲ]�Z	��'),
(';�"�C��ؘܳ� hc\Z', 'wp-content/themes/twentyfifteen/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�$zx���6ޓ�M#'),
(';�Wct���*+��Br�', 'wp-includes/images/smilies/icon_surprised.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�r�����i\r�^@8��'),
('<Ѿ�Iȫ�����', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ja.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O���5��f��R�D�'),
('<F���Pz�22��~', 'wp-includes/js/imgareaselect/imgareaselect.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}(��()��3���󵕯'),
('<c�c�WX�3�����u', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��>2bH/��R\r�'),
('<s3�.����ϒ�!$��', 'wp-content/plugins/woocommerce/templates/emails/admin-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�a��_Oʇ@�SS�'),
('<��9�u�j����!�$', 'wp-admin/css/install.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���0"2WI�E�Z�a'),
('<�hj�	�4���4a�2�', 'wp-includes/js/utils.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����o���o,Ê'),
('<��u꿖\Zܜ��Y�^', 'wp-includes/js/tinymce/plugins/wpeditimage/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\r\n�����KT'),
('<�;z_�h{��4H�mQ�', 'wp-content/plugins/woocommerce/includes/class-wc-product-factory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��遉���n\r��e��'),
('<���A38f7��ȷ�u', 'wp-content/plugins/woocommerce/includes/wc-user-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6{����"����'),
('=\r;u�5���<�''�', 'wp-content/plugins/buddypress/bp-themes/bp-default/registration/register.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<�}�9�gW'),
('=��!��[m��)5�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/images/logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h��m��/���D��'),
('=v��>1�fp�E��', 'wp-content/themes/twentytwelve/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%�U�H$}X����''�'),
('=9)���)�\\��', 'wp-content/plugins/wordfence/lib/wfGeoIP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�J��\\}��z�Y%�Q'),
('=.?��n���̮���)L', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~��(qq�K\0�\rT�\r'),
('=<ǟ�s�=;�r�z�\nZ', 'wp-content/themes/twentytwelve/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8*�˸�^a���}6'),
('=Fzp\n)�YN�6��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/bb-forum.php', 0, 'B�N��u��R��1�%�', 'B�N��u��R��1�%�'),
('=M�9��gU(��', 'wp-content/plugins/woocommerce/assets/css/select2.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EF�S�[Hzp��JrO�'),
('=WJ9�I	՛�7[G��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/forums/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x��7u\Z�''�B��'),
('=f�u�A><Th���@', 'wp-includes/js/jquery/ui/progressbar.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�S��\r�:��;�5ئ8'),
('=g���<;��3��w�', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���r9�8e�z��`'),
('=t�LR�ʗɽ<Vb:', 'wp-content/plugins/siteorigin-panels/widgets/js/jquery.fitvids.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',0�]x_:�;%I�ؚ�w'),
('=��VW���O�r�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-api-googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�IB����cg��S�V'),
('=��IŜ���4���O�|', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TuskInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R\\�L뺵''����Q'),
('=��;�8�N�.��E�3�', 'wp-content/plugins/wordfence/images/wordfenceFalconEngineSmall.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s�*�f�&@7�=J'),
('=��"n�X��t�M�', 'wp-content/plugins/woocommerce/assets/js/admin/order-backbone-modal.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''(�W�}�6:}�,4'),
('=��k�[4��� ��=�', 'wp-includes/comment-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<pC�@~��%��t�'),
('=�.���Ii�;t�I�\Z', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3���d���HR�.�奮'),
('>/kT��@ۨ�KV�_', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TheliaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R#tX�Ƀt�}7FI7'),
('>D�h�_]�d�4X�:|�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PimcoreInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';�J�;�`ƒ nH�'),
('>E��$�''n���F', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z��g�Å��m~��v'),
('>YJ��	z-�����^�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/AutoloadGenerator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't~��2�B`ԙ��[	'),
('>hЩ�XX*�v1���', 'wp-includes/theme-compat/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	��޴.''B����,K�'),
('>ql�+�m�\05Ħ"�^', 'wp-includes/js/customize-preview.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ix�V��f)�̥�#T'),
('>q���H���)��I�C', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����l�5D?tR�>'),
('>{*�5U1i�.���', 'wp-content/plugins/papercite/lib/UTF8.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����ܿO�"���'),
('>�A�F�9-\rC8c��', 'wp-content/plugins/woocommerce/includes/class-wc-geolocation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	M�\n�������='),
('>�N#������tw�`�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-googleanalytics-reporting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���1�+?+}䩘Xj'),
('>���\\��˜��k', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MagentoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��{��F�����s'),
('>�2�ܧ�EHuŒWfM', 'wp-content/plugins/buddypress/bp-groups/bp-groups-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�>5FY��q�@Nc�'),
('>��X�\r�b��ڟ�$W', 'wp-includes/class-wp-image-editor-gd.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��př�%�y��F�qf'),
('>�9i��n�1\n?`	��z', 'wp-content/languages/themes/twentythirteen-es_CL.mo', 0, 'E���iLբ�=T��K', 'E���iLբ�=T��K'),
('>�$\\Τ�ْa~A�', 'wp-content/themes/twentythirteen/images/headers/star.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���9�co56��Q`'),
('>��k��jr{���', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-permalink-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��mp=F�����,�'),
('>�s���I�y?q�l�', 'wp-content/plugins/siteorigin-panels/css/admin.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Qy�\0�;${Z��9j���'),
('?Yv�q_����ۮXO', 'wp-content/plugins/wordfence/images/sort_both.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��%�B�Qx�SV.D'),
('?]�P�.��1����2b', 'wp-includes/js/tinymce/plugins/textcolor/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I��D*T4����j�'),
('?^V���$k���`3��', 'wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4Ñ��������]��'),
('?���v�i��{��T�\r�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R�=%�`���0u+��x'),
('?�{K�3�O�i�|��u(', 'wp-content/plugins/woocommerce/templates/loop/sale-flash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd�L��M��r�ǡ�'),
('?�I/��U֌ˢ3d�C�', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�tLk���ҏ�5�4bF'),
('?�{��.-l�o���', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-global.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���h��&��)-'),
('@%_�A��	��\0�Z\0�4', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-my-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*��J�h�S|���ݟ'),
('@V�$�K���<�1*��', 'wp-includes/css/jquery-ui-dialog.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nj��S�PG�=�'),
('@hC�f��˻��x�o''�', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/laser.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��aw�n��a��˨-'),
('@k/�����I�?T,', 'wp-includes/js/jquery/ui/datepicker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#��x��q�,�3�x/K'),
('@��̘9�#�L�y(��', 'wp-includes/images/arrow-pointer-blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w��b�·*L���[��'),
('@�)�Vr�a�''��\0c�', 'wp-content/themes/twentythirteen/images/headers/circle-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0(��pCg^e����'),
('@�XD\n�\nRN��t���', 'wp-admin/images/menu.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r�9#�d�Y`	���'),
('@¿ǲd4<���ߡ� �', 'wp-content/plugins/wordpress-seo/css/edit-page.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '̭�a�F n�c1��''�'),
('@ǡ�����"&�2�7', 'wp-content/plugins/buddypress/bp-forums/bp-forums-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���-IZ��K�����'),
('@�;5�X��V��O�Z', 'wp-admin/images/mask.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���g~�"��J��䩎�'),
('@�m����O��W', 'wp-admin/admin-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��s�5�Av��w�xZ\r'),
('@�s�Z��^����q�v', 'wp-admin/images/media-button-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#�WI��\\��?��'),
('@��+�T΄''����٤', 'wp-includes/ID3/module.audio.flac.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,�g�\0.���i�'),
('AE���[�`����', 'wp-includes/js/thickbox/thickbox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���C�eR���wS�%'),
('A���<�X�3�ْg', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-pass.php', 0, '�6C)3>z:�[w�tXl�', '�6C)3>z:�[w�tXl�'),
('A#F�Y��_�O�W�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/TestCase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!��W=qUL�m�^*�'),
('ABl�#�lJ�шL��Z', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-debug.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k�<K�O��݌g����H'),
('Aa�@J������Ł�', 'wp-includes/js/tinymce/plugins/colorpicker/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�{�''sVnш�ӹ|�'),
('Ai�YzF%�S�����d', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-reading.php', 0, '��z����a�t�i`�', '��z����a�t�i`�'),
('Ai�߲w�˙{D��hN', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/streams.php', 0, '�,�&r�1���^', '�,�&r�1���^'),
('AxР.�L��U�E�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/screenshot.png', 0, '�%�$-|���2''.���', '�%�$-|���2''.���'),
('A{&� ��V>��Νs', 'wp-admin/css/login-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b�3�% ��LNj'),
('A���{�u�(��|7��', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile-edit.php', 0, '���;��	�{�@��"L', '���;��	�{�@��"L'),
('A�D�l��!y��1��', 'wp-content/plugins/woocommerce/templates/checkout/payment-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?}~�=}�ϵ��s��'),
('A�(ɞL6�>[���', 'wp-content/plugins/woocommerce/templates/order/order-again.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N�l��!\\���-�\Z�'),
('A���$h��՝`Q�a', 'wp-content/plugins/akismet/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h�� P�Z���ݢ`Ef'),
('BK��q�K���1�C�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%hC��Q,yF�a-(H'),
('B��j�)��q�D�S', 'wp-admin/install-helper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T����R�~����R3Z'),
('B�	t�#�{A��؝', 'wp-content/themes/twentyfourteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[�\r#�%�UM�'),
('B��9[/����D݉���', 'wp-content/plugins/buddypress/bp-core/bp-core-moderation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$v�f�<��T��g�'),
('B����r���*�Is', 'wp-content/plugins/woocommerce/includes/gateways/bacs/class-wc-gateway-bacs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}E���D�s�`\0􈋃�'),
('C2}	��2��-�c��', 'wp-content/themes/twentyfourteen/js/slider.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'UM�>����?�V!�L'),
('CS���A30��"����', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd^S�US��*g�A�ߡ'),
('Cbs�-�x�\n?�\Z;~', 'wp-content/plugins/buddypress/bp-settings/bp-settings-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�x&��\\5���VmVb'),
('Ciٚ��ba*���', 'wp-content/plugins/woocommerce/templates/emails/customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T���v��\r�$�r'),
('Cz���+.Ok1�yr��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install-rtl.css', 0, 'Ȥ=ͅ����6h�RK', 'Ȥ=ͅ����6h�RK'),
('C��XC&&*��[�*N�', 'wp-content/plugins/woocommerce/assets/js/admin/term-ordering.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D�4�B!o�M�I��'),
('C�Ǎ*�q�I�ϳ��', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('C�~4N���O�H��', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WL���6��QL�'),
('C�|Q�KO�EQ��\rt�', 'wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{��ƈ\ZԘ�>�]�'),
('C����f��ٚ�(;w\\''', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-es_ES.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#6Xos��E�ô'),
('Dm�\n��z�H��S���', 'wp-includes/images/crystal/document.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''^c�s���D��3T\\'),
('D&ͩw���&Zn�', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/external.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ѿ{Xow�C�m^�)�'),
('D�@�k�C�}Os�%', 'wp-content/plugins/woocommerce/includes/class-wc-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C<0\\	�8&�+`�z��Z'),
('D.���:�\0��S�R8', 'wp-includes/ID3/module.audio-video.asf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A��H�!�0�� �s�W'),
('D6m�e�r{pK�O�', 'wp-includes/locale.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K�o\ZKf:r��Z'''),
('DU���n��[Rgd�P', 'wp-content/plugins/woocommerce/assets/images/calendar.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Cz��?���;��w��'),
('D|f���U#ٕ?��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/upgrade.php', 0, 'wp+?p��\\������', 'wp+?p��\\������'),
('D����)ba�k��{��', 'wp-admin/includes/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T"AR��hy�ۺCQ)'),
('D����3	���Nيw�', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-api-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0�8+��q������'),
('Dչ������$Oa����', 'wp-admin/css/colors/ectoplasm/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ZgP�\0TS�����)7�'),
('D��5\n''�\\��~W��', 'wp-includes/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#Y����L��oZ'),
('D���ɢ�xT���J�-', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`���^�����!�˓'),
('E#���-v37�6�Ť', 'wp-content/plugins/wordfence/wordfence.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}q)�KT�`s[�\0`�a'),
('E4��fu\r#R:k!jgh', 'wp-includes/js/wp-list-revisions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��OBy��MK�/�l'),
('Eh��������@aq��', 'wp-includes/session.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���''^9�m})��j_'),
('E��(�zRA1;eN�qD3', 'wp-content/plugins/wordfence/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2��e��ª��\\��og'),
('E����\n��f��m�', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;�i.p� �0�*�'),
('E��W�l�Qb��i', 'wp-content/plugins/woocommerce/dummy-data/dummy-data.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�0�#��-_.�'),
('E�V���,�%��,SM=', 'wp-admin/ms-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�Ħý��:E�'),
('E�@�o_�hG�q(T�', 'wp-content/plugins/woocommerce/assets/images/ajax-loader@2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�6�n9��N5��'),
('E�v�up�Tf9��a��:', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-importers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ԭ��B`fm��l�\n'),
('Eݠ(��ǒ#j��i0�', 'wp-content/plugins/buddypress/bp-groups/js/widget-groups.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't[��N��zl"��A��'),
('E��7�''L��"z3��', 'wp-content/plugins/wordpress-seo/admin/pages/internal-links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U��)�D0�ˇ�şi�'),
('E�Kn��/凖�(["p', 'wp-content/plugins/wordpress-seo/frontend/class-googleplus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l�)\ZbڈDR��Z?'),
('E�� GX���/���S�', 'wp-content/plugins/woocommerce/assets/css/admin.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ɐu���)W��*'),
('F�Hȝl�e��#�', 'wp-includes/js/tinymce/skins/wordpress/images/more-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l,��r�%�^x�%'),
('FM<��~��d��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/plugins.php', 0, '�rb�W��sNK���� �', '�rb�W��sNK���� �'),
('F��Oۣ������g�', 'wp-content/plugins/wordfence/images/wordfence-logo-32x32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����y�w�Z��%?�'),
('F/��u��u\0.bH�CN', 'wp-content/plugins/wordpress-seo/admin/class-sitemaps-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�095q}��Ã!_�.�'),
('F58M�IEb��|�oA�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '߫�u��$�Odu��A��'),
('F?烺[\\��|�2��f�', 'wp-content/plugins/woocommerce/templates/global/breadcrumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i2�\ns�N���=�z��'),
('FF�v��V;v�8/�\r��', 'wp-includes/SimplePie/Misc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���y�-���^�\ZK�'),
('FH���30m�:��s��', 'wp-includes/js/tinymce/skins/wordpress/images/dashicon-edit.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xR�	�Y�X���ݤ���'),
('F�&Z����h��Y\Z�)S', 'wp-content/plugins/siteorigin-panels/inc/widgets-bundle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\��*c�8M�Z�7i�'),
('F��?h7@Ѵ�ƍ�UO', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g����w�1�Wϑ'),
('F���h ��P���2�', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��������HeՇ��'),
('F�B���m�7�{�G!', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MODULEWorkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��٢j���@��\nN�'),
('F���Ã\\�O�fg�', 'wp-includes/js/tinymce/skins/wordpress/images/gallery-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��1����v��R'),
('F�''�B�/�4{J�{w', 'wp-admin/js/edit-comments.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��M@#���^�`P�_'),
('F���,;׼�I�-v?�', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.init.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ǹ��|\\��֠i䋘�J'),
('F� lpq�7���u�', 'wp-content/plugins/woocommerce/i18n/languages/woocommerce-admin.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P����&,�潌ɱjp�'),
('F�D����ѣ�?/걼', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K�m;��<m��w'),
('F���?�C;$��H\r\r', 'wp-admin/css/color-picker.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Q���آ�$�x'),
('G''�����J�0\r|MK', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-taxonomies.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$^�U�5�O!�\0'),
('G6U�2\01R������J', 'wp-admin/js/theme.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�>&#���r��|`�?'),
('Gm�a�E*��F�1��', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-es_MX.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j��Jӌ{�<<��7���'),
('Gm��:�MľV��LЉ', 'wp-includes/js/tinymce/utils/editable_selects.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y��\0!�e�f��'),
('Gq�@����gm屪', 'wp-includes/js/mediaelement/controls.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�oZsm������ۊR�'),
('Gu�^�/1��ՁS�7', 'wp-includes/atomlib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�e�.���[�\0\nf�A'),
('Gy������.��:��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����~�B�6'),
('G�9q���=ʥ[3?a�', 'wp-admin/images/bubble_bg-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R=[����;��c��'),
('G�7\Z��I&:�x', 'wp-admin/edit-form-comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0��o,��q;�'),
('G��''�R��G�e��f', 'wp-content/plugins/buddypress/bp-forums/bbpress/index.php', 0, '��iZU��l�*�N�,', '��iZU��l�*�N�,'),
('Gɇ5Ç��Q�ȋ�i', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/bozo.php', 0, '���m=�\\��P�~�', '���m=�\\��P�~�'),
('H����R�%AfQ?', 'wp-content/plugins/buddypress/bp-messages/bp-messages-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''��+�j�)�;���US'),
('H+�E~�}�1Q���', 'wp-includes/js/wp-util.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�f1��bQ\n�ʭ&2'),
('H1����^\ZJH��', 'wp-content/plugins/buddypress/bp-activity/bp-activity-akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�w���3�ڤߟ!�Zz'),
('Hoi�M��F����[�|�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/visit-site-button-grad.gif', 0, 'u�U��e�YGM�:p�Q', 'u�U��e�YGM�:p�Q'),
('H�`H�Ǜ�O.��ViC', 'wp-content/plugins/wordfence/lib/menu_countryBlocking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\ZM2 \0�i1��Hy�_'),
('H��Z?n''DKhE�C', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/KohanaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z �"I���/����'),
('H�6u���B�B%�V�', 'wp-content/plugins/buddypress/bp-forums/bbpress/tag-remove.php', 0, '!���l�=������h', '!���l�=������h'),
('H���wl�U��8��*g+', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/large-play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�QԌE�.�瀥���'),
('Hý��i�Z�U,H�L', 'wp-admin/includes/meta-boxes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sC�RO�[#���Zn\rka'),
('H�����y"�Ӥ��B', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-display.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K��{e��J����r'),
('H�X�2a���$Y� ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f��k@u>`H�U�a�'),
('H��4��?4�\n�\n?r�', 'wp-content/plugins/woocommerce/templates/myaccount/form-lost-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{�+T������p<De�'),
('I�k�����W�Y�', 'wp-content/plugins/siteorigin-panels/tpl/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����;)^�d��/��'),
('IL��Wa�p�&�sKz�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Object.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���+լ�����F'),
('I�Z��:��Z��To�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/credit_cards.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T���hP�}c\rť@�'),
('If@n����;c>�8', 'wp-includes/js/tinymce/wp-mce-help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[A.Գ\0X�C5��޹z'),
('I#E�Hq|�p�^S~�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/js/jquery.dataTables.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-��c��HԊ���_�'),
('IF�_@?��AJ�z�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:��G���w��Z[L'),
('Io9���6c��3��3$-', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/CakePHPInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!������s�4�[Q'),
('I��:Bs�#����@�', 'wp-blog-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_��n:�����5�S�5�'),
('I�P�:�]<r�5qC�', 'wp-content/plugins/woocommerce/includes/wc-order-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '٣���|v��e����;'),
('I�V/��6�s���', 'wp-admin/js/editor-expand.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���-�~�>�Hœ��'),
('Jn�_\rȒa)��.�\0<', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/favicon.ico', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r�`"�E�^�y�t'),
('Jf�3?���_r�C�', 'wp-admin/images/w-logo-white.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*�,K��i�l��<�'),
('J�~*�է������v', 'wp-content/plugins/papercite/lib/bibtex_common.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\v/�ȇw�2�\\�\r�'),
('JE�8ԲF�{�-E', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/input-lock.png', 0, '�vV�gS���/!�&b�', '�vV�gS���/!�&b�'),
('J��E[�7U��\Z�~', 'wp-includes/js/plupload/handlers.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��DK�#;�A��7O��'),
('J{�ֹZi^ùx�I', 'wp-admin/media-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nG��sGQ�r�/(%l�"'),
('J������LykI��n=', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-sk_SK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jj������0��jvX�D'),
('J�B�>ZI����F�C', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n=� ��''V��"�D�'),
('J�\n\Zy\ZT0S:�{��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>�)B#?��ʓX��%�'),
('J����0��\0���;', 'wp-content/themes/twentyfifteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r3���Z�9����;Υ'),
('J򾁬��Oh���sDؾ', 'wp-includes/js/zxcvbn.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L�;��uc���<��'),
('J�t�P[\\=�1�K��', 'wp-content/plugins/buddypress/bp-core/js/jquery-cookie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z�+d1}�$�@�MF'),
('K-�|Y��7�1e�RS�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�EJ�	���,�9���'),
('KY�oUC�P�J�A+#�\n', 'wp-content/languages/admin-network-es_CL.po', 0, '�\0�����P����?"W�', '�\0�����P����?"W�'),
('K�L��R9�k�%��e�''', 'wp-content/plugins/buddypress/bp-themes/bp-default/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���2k2\0�g�XL��'),
('K�ТW%,����xA', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_asc.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lV�O�TD����e��'),
('K�:1o{�,���nū�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin.php', 0, '�a��2��l	�v��', '�a��2��l	�v��'),
('K�9Y*�0����u\r', 'wp-content/plugins/woocommerce/includes/class-wc-product-variable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��<A?Y\r�2zG��*]'),
('K�ߢ���,��S���G�', 'wp-content/themes/twentyfourteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Wfs�Cu�����`}���'),
('K�(��GG"3U��x2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Model.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Op{�p��{f�NZ�'),
('K�@�2S4Aa�z�α:�', 'wp-content/plugins/theme-check/checks/post-formats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d��#�d���}�9'),
('K��W�&\0\0K�\06�G�', 'wp-admin/js/set-post-thumbnail.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+QSWm�@�~��Q'),
('L3 �>А�u/�0z�', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum/topic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(�wzbl���cD�5�'),
('L<#���\Z����}', 'wp-includes/js/tinymce/skins/lightgray/img/loader.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9K���M�:�Tf�9'),
('L �''�V�N��{�S~b�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-plugin-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7��e�]4#�W��0�'),
('L#��/۰*��3���\r', 'wp-admin/includes/class-wp-terms-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V��C��Cխ�׮'),
('L(���n�9[2�C6�', 'wp-includes/js/zxcvbn-async.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1��p9	�9�~��'),
('L;!�@�;k&��H��', 'wp-content/plugins/buddypress/bp-forums/bp-forums-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�/%�8��3����v'),
('LR7Q��ToG|�{', 'wp-content/plugins/wordfence/lib/viewFullActivityLog.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ؤ�=�����ol'),
('Ld�h�?�چ?�[��', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/amex.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K�ifC+��~�c���'),
('Lf�)��sw�=�', 'wp-content/plugins/wordpress-seo/css/metabox-tabs.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n/Y������Q�f�'),
('LsЇś\n�c}>�K��', 'wp-includes/css/editor.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��N���1M�''*�|'),
('L|��ew�EC\r��)�', 'wp-content/plugins/woocommerce/templates/myaccount/form-add-payment-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��D��;$..g��'),
('L���v%2yx"�ц&', 'wp-content/languages/continents-cities-es_CL.po', 0, '''2��{����GH��}�s', '''2��{����GH��}�s'),
('L��lR<������ܩ@', 'wp-content/themes/hexa/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���@:������Ӊ;'),
('L��y��%<���kWǿo', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('L�-d"ӊ�!]4��/', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-locale.php', 0, 'K��ʕ���m׾>�', 'K��ʕ���m׾>�'),
('L��e�t"pc(	�e�', 'wp-includes/wp-db.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T�qBJx�$Kwy�'),
('L�\r��Ȧ:��n�h''', 'wp-content/plugins/akismet/_inc/akismet.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\0\r�q�[���{'),
('L�ߒ��O��l��8�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/PiwikInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�)���ܚb���'),
('L�>t���N�����', 'wp-admin/css/colors/blue/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��5Iה�g,)Z�YM�'),
('L����[��\Z���w��v', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.editorconfig', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E�h&/�Ӈ�����~'),
('L��)��a$�D-�Ӯ�J', 'wp-includes/js/tinymce/plugins/wplink/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W�z!��,L�O�m�;��'),
('L���5�pQO�M�', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-he_IL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��+���kD:5��-�'),
('M?,5�*�����K*�f', 'wp-admin/js/post.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&������)�~Ԫ�'),
('MFE�`U��\r��^]�', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@\0�\\���,FY��'),
('MW�	���:��ي', 'wp-admin/images/align-none.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�eqd2���u����\r'),
('MW�R��f9��] �X�', 'wp-content/plugins/buddypress/bp-activity/bp-activity-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�SY�0�H�I|��l�p�'),
('Mp��.b�Oɧ�{V1@', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-cs_CZ.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�e�2|��4��kc�.�'),
('Mq����\Z�T\n��V�$', 'wp-content/plugins/theme-check/checks/style_suggested.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���v\0Gj����gU�2�'),
('M�w^�}ar[���', 'wp-content/themes/hexa/inc/extras.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C\\��1d(mh�^�'),
('M��m�@��"�^����', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/js/page_slurp.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ȹ.)T�Z{Z �\0v\\'),
('MР\0�A���9Q�+��', 'wp-includes/js/admin-bar.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�xԱK�0��*|'),
('M���I�M����rD��-', 'wp-includes/post-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��s�V���l��?�'),
('N*��Xc8��\\}��1', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-theme-support.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T>o���g�X�+��+'),
('N@������+C>�U', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��u+|-SV� K"R'),
('N_=���=ө���', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7��%��/W,���('),
('Nv�A��Y2��+�K�', 'wp-content/plugins/theme-check/checks/tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r�`�\n�B�t����(�'),
('N|�Jв�zn��sw', 'wp-includes/pluggable-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�۠���v�!l"Ȥ�-'),
('N�3�j@pu5����^��', 'wp-includes/js/tinymce/skins/wordpress/images/more.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\n�\nm\0;�˫�z'),
('N�\0�J��\r4�; T�', 'wp-content/plugins/buddypress/bp-core/admin/images/menu.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j''��0,���z���7v'),
('N��z�貚?ۆgk�', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-shipping-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�zk^I�+�cMnA��'),
('N�E\\���|���J�S�', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_real.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ��2ݧ�R���'),
('N���HV����}�4G', 'wp-admin/css/customize-widgets-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}�.ȱ_��R�@�'''),
('Osi�Mo	�O�}', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+~9�;���#�\Z4�&D'),
('O	��S����#��Yi�v', 'wp-admin/includes/class-wp-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u�#��#�/��x{��'),
('O��H�t�1K;Qbt�', 'wp-content/plugins/buddypress/bp-themes/bp-default/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=�P+�B��d\\JŜ�'),
('O�l��M�MY�݅��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���xle4�^�R�P'),
('OOiߨ�a����<��', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�5lvY��a6�\Z|a'),
('OPC��j��Xَ��JPo', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/sticky.php', 0, '{�Dcs;�ȳ���ׁ', '{�Dcs;�ȳ���ׁ'),
('Ob�������hqA''b|', 'wp-content/plugins/theme-check/checks/title.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�+F�V��Ɍ��Y'),
('OlqCcێ���������', 'wp-admin/css/forms-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�Gok$��(�<�3���'),
('O��\\���P5���{�R�', 'wp-admin/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y�{C��R�|o��4n�'),
('O����Ri��1���`{', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/topic-tags.php', 0, '���Xr�#u�har3�\r�', '���Xr�#u�har3�\r�'),
('O����&�r�蓏�� ', 'wp-admin/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2ͅ�Sh]�O/�7��'),
('O����R�r����D�?�', 'wp-admin/js/postbox.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��#��$�-�!i>'),
('O�hu�G���&\0�L�', 'wp-includes/Text/Diff/Engine/native.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''*�����*�x'),
('PE۫�7r|oI�6��>', 'wp-includes/js/backbone.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mk��"c��д�R4\0�'),
('P''�(���?+�z��$�', 'wp-admin/js/postbox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����o%�zb|䨎�Y'),
('P73o�	��\0�=��', 'wp-admin/js/word-count.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f%i�@Q��1��N'),
('P@:\r�s<���UH��', 'wp-content/plugins/buddypress/bp-themes/bp-default/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��bD���F���o���'),
('PK�([�-F{�Xj�', 'wp-content/plugins/woocommerce/templates/emails/plain/email-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q�HP�&�3�V#��'),
('P�P�s1k�xK�����', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_enabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')��=C�|xW�r\\��'),
('P��iz�t�a�}�a', 'wp-admin/users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����iu9嗢S�');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('P�(�^ցŊ;܇�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DolibarrInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	m_d&Ժ����0w'),
('P��If`�P��\nj��;', 'wp-content/plugins/buddypress/bp-forums/deprecated/1.7.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r��N��Ǳ�O݈���'),
('P�[7�U~�,U\\���P', 'wp-content/plugins/woocommerce/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����h$^��H�)�j��'),
('P�\nof	��W�:�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/feed-icon-16x16.gif', 0, '�`h;�لJ�bX��n��', '�`h;�لJ�bX��n��'),
('P�sX�R�{�SKP�', 'wp-content/plugins/papercite/tests/install-wp-tests.sh', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��l�C�,P��\\d�!�F'),
('P�1$���\\*�C', 'wp-admin/images/stars-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��A���#�S�Me.^'),
('P��0��a��R�z= ', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�g;�ݘ�5�s?W�<Gx'),
('P�5����V����b�', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-post-types.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a�%��Uե��5���'),
('P�՟5�$s�T�t� �', 'wp-content/plugins/woocommerce/templates/loop/price.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���/DT�H�Q"��'),
('P귃qz�J.5����', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J>�����@''lr/�'),
('QB��QP6*J̿��c;', 'wp-content/themes/twentyfourteen/content-video.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_�9Nvt�(ܶ�.'),
('QT���*�f�P��.�', 'wp-admin/includes/file.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0Z6�G��.�'),
('QY/;>�v���nY��', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/members.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������p��]̹�,'),
('QY��1�Tl��Vr<', 'wp-includes/js/customize-views.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��;�z��	�YM�#y�'),
('Q\\����5�yl�_�ө', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Y�퐔�g1s[���'),
('Q`���uE�_qD�&x', 'wp-content/plugins/buddypress/buddypress.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5҄*̉Ш��qŮط'),
('QuoPX��\0��Sڞ', 'wp-admin/images/bubble_bg.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=,����(��\Z2cV� 8'),
('Q�p���\Zf�C�\r1�', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_�0�c�ںg����;�'),
('Q�`���8�M�8', 'wp-admin/press-this.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\0y�����~I��6گ�'),
('Q������l��g�-��', 'wp-admin/js/comment.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�i/y��}��*�C��'),
('R\r\\g+XO�ɼ.v�L�;', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n�\Z4���2�^��-{��'),
('R-��b�:�Uq��V', 'wp-content/plugins/woocommerce/templates/emails/plain/admin-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's�$��t	d��΃��'),
('R3�Us�3��}T���', 'wp-includes/js/autosave.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c�i|}f���C�S�/'),
('R:h��π6����', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/script.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��D�VOG���p<�3k'),
('RB����eL��±�{�', 'wp-content/themes/twentyfourteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��!��$�gBi���\\n'),
('RQ�b7f�� |~ۓ�(', 'wp-admin/js/widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<gu�F f���@p��'),
('R���1?���Y�VDt�', 'wp-content/plugins/wordfence/lib/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�I�z~�i�,L���'),
('R�x�4Mp@�9u\n֊ p', 'wp-includes/images/wpspin.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Nm�h����;\Z@��'),
('R��|Rx/�bzn9\0*�J', 'wp-admin/includes/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���$:�ﶭ�{NV��'),
('R�Q�r����\0�s_', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/BaseInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ur�XĈ�����2'),
('R�W>��p�	\\��', 'wp-content/themes/twentythirteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��	�~��\r_�Py<��'),
('R�\\SC�|ju�9��A', 'wp-includes/js/media-grid.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�$k��dP|/��8�|'),
('R¥�����Le�q	�&�', 'wp-admin/js/user-suggest.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3)��()ݰ4}\n�'),
('R�&��EL���]h��+', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart-variation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�QveK�\0��2���ث'),
('R������#��5�B', 'wp-content/plugins/woocommerce/templates/myaccount/form-edit-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z$M��mܳ-���'),
('S.FȫA�j���(�:', 'wp-includes/js/hoverIntent.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o\0t���C"�<	P�/'),
('S0�־��K/17u���', 'wp-includes/js/jquery/ui/selectmenu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',wfӗ���ɒ!�'),
('SX+7��1?����-', 'wp-includes/js/jcrop/Jcrop.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z��7e�����Q�%K'),
('S����p�>��Wr�YE', 'wp-comments-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�p8��_�$Ü��h��'),
('S��9�4���\Z''�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/OctoberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����%�U3�GJ$��#'),
('S��b�\n�Tl�BȰtc', 'wp-content/plugins/buddypress/bp-activity/css/mentions-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<��c\0�''�g>���'),
('S��2|�7ˎ����', 'wp-content/plugins/woocommerce/i18n/states/ZA.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�HQ�Clbq �Q�'),
('S�5�0p_��g�', 'wp-content/plugins/woocommerce/i18n/states/BR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��u3�1z����L��'),
('S�\\0|	�;���', 'wp-content/themes/twentytwelve/js/theme-customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#��K�-Md�Ʃ��'),
('S��&�az8�Jض9�', 'wp-includes/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0�1���+V���;3>~'),
('S���|��d]�206', 'wp-content/plugins/woocommerce/assets/js/admin/reports.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ƫo������X'),
('TVh�]��eX�hx�', 'wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's؁���4���9��'),
('T5l��4��`7���', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G2B{.yò��Qf	�a'),
('TO���6/��FL~ۗ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-taxonomy.php', 0, '[�����=�e�', '[�����=�e�'),
('TWݯ�(W��قF�B~Q', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|����� !�)�O_�'),
('T\\T��=4�F�DL�P�', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-attributes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$m���9�����2�%'),
('T^Ih�����Ύ���(', 'wp-includes/js/tinymce/plugins/wpfullscreen/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v����W`?�I_����='),
('TqHf��d\0ƃz���', 'wp-content/plugins/buddypress/bp-settings/bp-settings-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W����� ���J��6'),
('T�.o@Ψ2�w�v��X�', 'wp-includes/js/jcrop/jquery.Jcrop.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/a��Lru�4�\Z�'),
('T����,�F1��}�', 'wp-content/themes/hexa/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{b��	�ZȸB�Z�'),
('T���vm?,�a���T4�', 'wp-includes/ID3/module.audio-video.quicktime.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U�`��f�.�0�F˼'),
('T���`Z��d��t^z', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CraftInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@|���*����Y�'),
('T�=۵a[�\\r �O', 'wp-content/plugins/theme-check/checks/screenshot.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')���Wr��m�,jc.'),
('T�A;Dq�>iZ��]', 'wp-content/plugins/woocommerce/assets/js/chosen/ajax-chosen.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z-��M~<���g*���'),
('U�\\p{J��O�Q�&', 'wp-includes/SimplePie/Cache/Base.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C���2]�]#|j'),
('U"�)%f#��Lؑ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-walker.php', 0, '���^�[yq���zR', '���^�[yq���zR'),
('U/��L�K�}��x���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/FuelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^��q�{�3\\�g�'),
('US�?^�Q�w�o���_', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-notes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SS)]��C";�U�eF'),
('U[�4ȫ׏��~�c%', 'wp-content/themes/hexa/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z�����:��t�'),
('Un���I5�Ƣ:M���', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-ga-js.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T�%�@�p���|�vsq'),
('U���$i"u��&���9', 'wp-includes/images/crystal/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����l��ڤ�;�='),
('U��+E�-��+�tx�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Customer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���_ػ���6]�����'),
('U��𚟏2��\r9)�', 'wp-content/languages/plugins/akismet-es_CL.po', 0, '���=�\n�e�^�', '���=�\n�e�^�'),
('U�`\n�lC�gupr�', 'wp-content/plugins/wordpress-seo/css/edit-page.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Lf.G{�R~��m��'),
('V\n��U`�_�5���8', 'wp-includes/js/customize-base.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�.��.f�%����I�D'),
('V33�rTC�@U�~�\n�\n', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/AutoloadGenerator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't~��2�B`ԙ��[	'),
('VL6�7G^l%D5z3��', 'wp-includes/default-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����[�ԧ8��´�'),
('VZ	�A$.��-��Q', 'wp-content/plugins/buddypress/bp-members/bp-members-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0���{�"p�.�wLL'),
('V^==���%��_��׃', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-topics.php', 0, '1~�!�6}����\r�k', '1~�!�6}����\r�k'),
('Vh�ޤ+F��4��', 'wp-content/themes/twentythirteen/images/headers/circle.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��IN��#�O\\/�}�'),
('Vne!�z0u1?��', 'wp-includes/shortcodes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G�	�ȯn\0�~�ڊ(�'),
('Vrm�KE�p�j��6�', 'wp-admin/images/w-logo-blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�[N�W��_p�w�0'),
('Vz�ܫ����\r���', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n�JUn����7v�Ʌ'),
('V�����댏$�x', 'wp-admin/js/post.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$���ВC�z>�@Ս��'),
('V���{��/�:2��', 'wp-content/plugins/wordpress-seo/images/banner-premium-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v��ە����\0�ҥ'),
('VϜI��&t��F���Q', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�n�ӏHL�8�!���'),
('W��u�Q\no<�,	@', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ȹ	�Z^��+�}i��'),
('W0÷g�b%�>4��', 'wp-content/plugins/woocommerce/assets/css/dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�T>�����6f�Y�'),
('W?2.��������W�3', 'wp-content/plugins/woocommerce/assets/js/frontend/add-payment-method.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C�f[���Ҝ\n�S��'),
('WBb�5p]|[��U�y>', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/white-grad.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\n�ŉ!9��ź�N�N'),
('WQ�����F�0�{N	�', 'wp-content/plugins/buddypress/bp-friends/js/widget-friends.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��8��m	�?O x\n�i'),
('Wq� S�~S!w�`"oA�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-sv_SE.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�_H��T��\nb?�'),
('W{Yx9�z3	t�.톊', 'wp-content/plugins/woocommerce/assets/css/_fonts.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��AS���ؔ��+��'),
('W{�g- X���''=n8', 'wp-admin/moderation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TB���YR��"4�o�'),
('W})Ӗ7���e�}5�9,', 'wp-admin/load-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��E��0VO��r����'),
('W�d�	3�)������y', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h6�i���=\r�G�'),
('W�$���`$��V>XY�', 'wp-content/plugins/buddypress/favicon.ico', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5��\0j(\nc������'),
('Xk7���Am�uQD;�w', 'wp-content/themes/twentythirteen/taxonomy-post_format.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��''�h����k�Ҹ�'),
('X���t���b���E', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-price-filter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5� (�\nT�mK��\\e�'),
('X�d$�C���=��', 'wp-content/plugins/papercite/format/turabian.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&���gޚ�ۺ�_�g'),
('Xͮ���xⷙ�#��', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-replace-vars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�W;�7nLkL�k��'),
('X,�E�Cj$_��8I��0', 'wp-includes/images/smilies/icon_cool.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F~��ߢ.���>t8'),
('X6mC^�+3��dC`[', 'wp-content/plugins/buddypress/bp-themes/bp-default/attachment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P���=�㆛����'),
('XI�А���^\0�e�ˣ', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��P�vԢ��E�]��'),
('X\\\rN�᜶d*��A|�', 'wp-content/plugins/woocommerce/assets/js/admin/round.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b�L�ŨZH��+�j�^'),
('X\\t2�f�7�kH��', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Lnl5p>�ʞ\r�X0jV'),
('Xq@W�$)5�ǻZ[2Ӹ', 'wp-content/plugins/woocommerce/assets/images/select2-spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{�vm_��I��\\����'),
('X�:8+˓2>V]��8�', 'wp-admin/images/sort-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nQ&�] �0�-����'),
('X�;ԭ��0���x��R', 'wp-content/plugins/woocommerce/i18n/states/CA.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��҂"\n��2�@Ó�b'),
('X��-V\r�$��)`��_', 'wp-content/themes/twentytwelve/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ӷ��rvIB\Z�v�'),
('X���G������z�X', 'wp-admin/includes/class-wp-upgrader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��@��?:����'),
('X�''�M�-����]�', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/includes/settings-flat-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{���9K�)��7��e��'),
('X�����h��2I���', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o�>��<��ꈕԷ�'),
('X�F2��/"���=h', 'wp-content/plugins/woocommerce/assets/js/frontend/country-select.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ӷr�Wf�@�8+f`='),
('X�E�d���ߒ��+�u\0', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/question-mark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P�3�XXJ����'),
('Y��"S�l���Le��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bpdb-multi.php', 0, 'O���$Z��\n^"э', 'O���$Z��\n^"э'),
('Y\nb��$ݓϴ\rc', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-assets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f\0�[Z�6b-a}Å@�'),
('Y�OT�����(��d', 'wp-content/themes/twentythirteen/images/dotted-line.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��l���8.���;Ւi�'),
('Y/�$�����\Z^iGg', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/i18n-module.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U($P��X&=��''ɨ'),
('Ym�>��h\\ȯ�e��(', 'wp-content/plugins/wordpress-seo/vendor/composer/installed.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k�ċ�䭎��@uQ'),
('Y}�mc/F	=�<��E', 'wp-content/plugins/woocommerce/templates/single-product/price.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��6��?�]A��X+�{'),
('Y�La���h�(', 'wp-admin/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sj�V��ꩣn�X�t'),
('Y�,�e�A��w�`���', 'wp-includes/images/media/archive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9����h�\0��ì�u'),
('Y�68�H;%,�_c\n�', 'wp-includes/css/wp-auth-check.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ڽ�󡎸WM½9N�'),
('Y�v�Wb���Xq�$�', 'wp-content/plugins/buddypress/bp-core/js/jquery-query.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}l҅��}�+�ʮ��'),
('Y����]���ŞI���', 'wp-includes/js/jquery/ui/effect-slide.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c��1��ó�#Cw&�'),
('Y֝��U����}�r/', 'wp-includes/SimplePie/Cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y���:�oMh�vL�4'),
('Y�>����9,����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/license.txt', 0, 'u&\n�TI�z����+�', 'u&\n�TI�z����+�'),
('Z4<n?e�����', 'wp-content/plugins/wordfence/lib/wfConfig.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f��JL����ut5'),
('ZC���u�5[�?}�,֬', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-permalinks.php', 0, 'h-���Y?L�U\\a�R', 'h-���Y?L�U\\a�R'),
('ZU�{��O�����j�"', 'wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����C�z/"�kTE×'),
('Zz����_)Y��u���P', 'wp-content/plugins/woocommerce/uninstall.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't��C#������$/��'),
('ZҌ�[��\nv���	F', 'wp-includes/SimplePie/gzdecode.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�8��a��al�4�'),
('Z����� %/�Z�z9��', 'wp-admin/includes/taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\��Ep\r�������2'),
('Z�\0��Y���� æfg', 'wp-includes/js/crop/marqueeVert.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\0���9��R���'),
('Z�~�D�NQ�K�m�&', 'wp-content/plugins/theme-check/checks/basic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��vE�/�HK��G�'),
('Z�V�sہ��j��2�', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P��]W�f�s)�?ش�'),
('Z�_����Pf<7#��4�', 'wp-content/plugins/woocommerce/assets/js/jquery-tiptip/jquery.tipTip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q-���''�j���.V'),
('[\0�WEGjp�茻ox�', 'wp-content/plugins/woocommerce/templates/emails/email-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S���\\*������<�'),
('[�{�X������c��', 'wp-content/plugins/siteorigin-panels/js/styling.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L&*ITN����I�#z�'),
('[@����|°�]�>)', 'wp-content/themes/twentytwelve/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���,̴[⭝���Y2�'),
('[#��k��Y�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-login.php', 0, '#+�p_�d˰\rBm', '#+�p_�d˰\rBm'),
('[\\�~�q4�; i�''�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��MȰ�&z��M���'),
('[^�!���s)��eч', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/LithiumInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!{�hȡR2˪퀨6'),
('[��#ܧ\Z>]��<�', 'wp-admin/css/colors/ectoplasm/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"rz\Z�Z�\r����X�'),
('[���uPE����x{�', 'wp-content/themes/twentyfourteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��P��:�9L�$��='),
('[���1�YAdk�,', 'wp-includes/SimplePie/Sanitize.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Bظ��F�إ�H��u'),
('[�4�pg�C%*�o�', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��n�;#g�<=�\r���'),
('[ҕ���El{��ȿu��', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ߪ9M����M���9'),
('[�ئ�m��Np�h', 'wp-content/plugins/wordpress-seo/admin/class-yoast-notification-center.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���70�:k�woG@;'),
('[ꠏ�|K�o�یb7�', 'wp-admin/user/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������-x���Nb��'),
('\\�����9������', 'wp-admin/ms-upgrade-network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|��&"�S�m��8h�m'),
('\\5\n�ۢ\0����v���', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-it_IT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��>nC::���d��5_'),
('\\8���d@��b\Zn!�O', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-short-description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�͋zW>�Pk[��L'),
('\\[��i%Ͱ<��e�>�', 'wp-includes/css/wp-pointer-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F���2���&d�vZ@'),
('\\s~�S�"��O��ē<', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CodeIgniterInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��H��=�u�]R9��'),
('\\�{@��b����mGz', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-ru_RU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�"���Lt��-(�x'),
('\\�I��\0t�CM�a��', 'wp-content/plugins/siteorigin-panels/widgets/basic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{;TV�@��~��#��'),
('\\�т�?$�̈́8����', 'wp-admin/includes/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�X6�e�\nV��sl�}JL'),
('\\���i�����>�ߦy', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�ݡ�5N2WF���'),
('\\�2]�U�4�R��_�', 'wp-content/plugins/buddypress/bp-members/bp-members-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S\Z?@��	��.�K�3'),
('\\��+5��¦DW"�', 'wp-content/themes/twentyfifteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��"7ў׉!�T\n�}�'),
('\\�\0��>�+���Fb��', 'wp-admin/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|kJKTfe~�!�]�\n�J'),
('\\�Jh''�{���a�`_�', 'wp-content/themes/twentyfifteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R�ڢd��ɓ�GH��'),
('\\�����R\Z�/	}$�', 'wp-content/plugins/siteorigin-panels/inc/revisions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h_��޽(H��>\r�'),
('\\�t c��1�G�q��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Symfony1Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L����Q\09�m�M�'),
('](R�&!��1;�3��', 'wp-includes/js/wp-ajax-response.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1mƨ��\r����HP�'),
('].9g���gB^���;�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/BaseInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ur�XĈ�����2'),
(']B#�2�z���bU��/', 'wp-includes/Text/Diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%��gkj@b�%���\0�'),
(']c-�E�\ZB$�3�	�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-roles.php', 0, 'bW��P�e`?����J�', 'bW��P�e`?����J�'),
(']h��o�b�oy=��M�', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/handle.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�!e8�ͼ��v3�T'),
(']w5�mZ�Zh�g��8', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/sidebar_back.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+w�[q�}Վ|��~v�'),
(']���ֲ=^Dya�dU', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/feedback-no-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`��G�Fn��(e�:'),
(']����c1���O�����', 'wp-content/plugins/wordpress-seo/wp-seo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���L@��/���/|�'),
(']���Cy�.a�A,�-�', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������f���f�B�'),
(']��P���Tkvt��8A', 'wp-admin/network/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z�=S[�fx�������'),
(']���*������J�', 'wp-content/plugins/wordfence/images/icons/email_go.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��j��E��H)�.��'),
(']���p�[%3QLV��s', 'wp-content/plugins/woocommerce/templates/order/tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')"7�x���i����'),
(']�����"}[�Y�R�', 'wp-admin/css/edit-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@\nN���ZU�z��'),
(']��.PRt!{1�pr}�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/class-wc-gateway-mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���k)FU\nP��#Q'),
(']�ɘ4P�7t����\Z/', 'wp-content/languages/admin-es_CL.po', 0, '�()�����)*�rs�', '�()�����)*�rs�'),
(']�������3���`�', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-recent-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ꦰp�#m�U`}1�'),
(']���)V:e�	���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�b�5�]��Dv''\r�'),
(']뺲�V>d��y���v', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?n�k��''''Q�K'),
('^ ���/�^�^�N��', 'wp-content/plugins/wordpress-seo/js/wp-seo-metabox.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K���]��L�Ҟ/�'),
('^E�n�Q�Ԙ2��A', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-settings.php', 0, '��;��Im��P', '��;��Im��P'),
('^(§3�H����''�ؾ', 'wp-content/plugins/woocommerce/includes/class-wc-order-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�u�����l�Xz�'),
('^*���	���aEn��', 'wp-content/plugins/woocommerce/includes/shipping/local-delivery/class-wc-shipping-local-delivery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U�w��Q�r��쾣��'),
('^9!mS)���_ey�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_real.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Q�}DqS�/��'),
('^9(-(Ų�y ���0q*', 'wp-admin/user/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\0ڍ�KN� ���N�-'),
('^@ղ{''��_���92', 'wp-admin/upgrade-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^����uP�qX\\e��'),
('^yG=ڜFg;3�á�', 'wp-content/plugins/wordfence/images/button-grad-grey.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��RC���Ty��?�'),
('^�Ð����+�y|�', 'wp-includes/images/crystal/spreadsheet.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�9�Т1�T��n��'),
('^�w��*�A�,����f�', 'wp-content/themes/twentytwelve/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�p>�%�/N�������'),
('^˨_���R�6��+6', 'wp-content/themes/twentythirteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��C���a� �A�����'),
('^�<m瀘m��ߪ&Ͽ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/groups/invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8,����ֺ#7��y'),
('_�\0��d �MP~��D', 'wp-includes/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{)8''''���8���u'),
('_�����	,�zbk\Zͧ', 'wp-content/plugins/woocommerce/includes/class-wc-tracker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ww˥�\r�Dm)�6 �'),
('_괽��|<�uN�\0��', 'wp-content/plugins/buddypress/bp-core/js/confirm.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ktЇj"�^U�u\rE�y�'),
('_*�⽞L�0�>\r', 'wp-includes/feed-rss2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A��`''r}��b� QG'),
('_j���_��/���yӱ', 'wp-includes/load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<�^�1<����f^&'),
('_n�2��o�0xl�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ZikulaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K�8I�dp�o?E'),
('_�;N����b��n��v�', 'wp-content/plugins/buddypress/bp-themes/bp-default/registration/activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��]�XlKkQR��.'),
('_����9����˂�', 'wp-content/plugins/woocommerce/assets/js/frontend/checkout.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��^���E��`�c�'),
('_� 92pb0L�����hx', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-hr.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';Ul����y#@��'),
('_�6�����E��3`��', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	�<5L����V\\p'),
('_�80�)C���<��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topic-move.php', 0, '5�,�nP���:�[�', '5�,�nP���:�[�'),
('_�|��T�M^���J', 'wp-includes/css/editor.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a��[:\\���e�X�n'),
('_���4�3���=��', 'wp-includes/images/uploader-icons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\\M�����m��'),
('_�(�C���M6�9�', 'wp-admin/includes/class-wp-links-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q��ӹԖ�2�g1l'),
('_�����8}���?�', 'wp-includes/css/media-views-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_C��z�$S /R�'),
('`��յ���~�,�4', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-global.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�e���N��\r�w'),
('`������mep�Zw�', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/full-screen.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']+-ܔ�?�f#�����'),
('`���S�`NI�^G�', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ڥ.(�؏_�X�\Z%'),
('`%�ֽ�j��''��P��', 'wp-admin/js/edit-comments.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z���+��=*��o-�d'),
('`''�h�''�t��6', 'wp-content/themes/hexa/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Bd�L�@�\\Λw�lE'),
('`ty�b����U̙�', 'wp-content/plugins/papercite/utils/STYLEMAPBIBTEX.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�<�p���\nY��0�i'),
('`���ay3�x�����S', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/register.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���M���d5%G�|�t'),
('`��(\n�IBT���{�', 'wp-content/plugins/buddypress/bp-activity/css/mentions.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��������W^�r�'),
('`�c0���\\���3�', 'wp-content/plugins/wordfence/lib/Diff/SequenceMatcher.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O�"%é�O�DZ�j'),
('`�ږ�wY��u�pC', 'wp-content/plugins/buddypress/bp-core/css/admin-bar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�V�IM�f��Y.�'),
('`���;�"�-���+~;', 'wp-includes/js/tinymce/plugins/media/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ag��j��Z�r�I'),
('`�J�R��[�YJ�H� �', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/rickshaw.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��{m�Aʥc����0'),
('`��؃=�WU׷�~�', 'wp-content/plugins/buddypress/bp-members/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+�_`v��E�j�h�Tՙ'),
('a����H�J<yY�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page-links-background.gif', 0, '�~ ,���\Z�Lڑ�', '�~ ,���\Z�Lڑ�'),
('a\Z�c����r�2���', 'wp-content/plugins/wordfence/js/jquery.tmpl.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\}�"���7ڷ��DZ'),
('a$�r$2@ӭ;�!2>', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/rss.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '쳜�|s@?�hK��y�'),
('a(�\0�''~��u����W', 'wp-content/plugins/wordpress-seo/images/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('a)�TMW�Oo��Q�|�', 'wp-admin/images/media-button.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����6@p�z^ye��'),
('a5���a��Vol�r6��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/class-api-google.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R	��\0e$''S<�N���'),
('aSّ���f�����', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/background.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	k���S��;o$!'),
('a\\c,I"5T��#̋�', 'wp-admin/images/media-button-music.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��]�2\\Z�/��ޕ'),
('an�ܨ�5MgU{�', 'wp-content/themes/twentyfourteen/content-audio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�gd��L#\\����|'),
('a�o�aؓ=犢���)J', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/class-wc-shipping-flat-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\n�$��T\r��]�h'),
('a�ـ�����ֵ��L�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-meta.php', 0, '$�v*R�8�d�v��', '$�v*R�8�d�v��'),
('a�ME��w�:�l��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7�hQ�v<j4�@�'),
('a�?��_�ˢ��6j��X', 'readme.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x�!?pp4e����G'),
('a�65j{O��X��M�', 'wp-content/plugins/buddypress/bp-forums/bp-forums-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� }6 �Y4ݛؐ��A'),
('a�����(m�EB�l�', 'wp-includes/media-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w!YK9-�\0���ي'),
('a�c�CH\r��=l@ĸ', 'wp-admin/plugin-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�[2Irm��''!2`'),
('a�ISy����1ߟ�B', 'wp-content/plugins/woocommerce/templates/single-product/tabs/tabs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\���ZO[g~�{���,'),
('a�|\n��|@X\n��fM\r�', 'wp-content/plugins/wordfence/css/dt_table.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�[�f��\Z��}�I+o'),
('bn���:Z���Y', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-hu_HU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\�^��öQ���2�'),
('b&��Y��,�z���%', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��R!�b�`%u��^X'),
('bY�,��ϥY�r۝�;�', 'wp-includes/js/crop/cropper.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ky5�ni*M(��'),
('bvj�q���[�\nH�q�', 'wp-content/plugins/woocommerce/includes/class-wc-post-types.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��dTJ�?8���r'),
('b�(�o\nl���˵�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	Ɔd=l�ƾ�ID9>\0'),
('b�N���̫O�:Y�ȅ�', 'wp-content/plugins/wordpress-seo/css/taxonomy-meta.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I�xNN���K�~`	'),
('b��[@�EL�;~�/�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Ɲ\n%\0���'),
('b��ki�ؤ��I]�', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/purple.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\Z���7g�j\Z�/�'),
('b���HzfW����gw�', 'wp-content/plugins/wordfence/lib/wfSchema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3y��p#-x��P��$'),
('b�����Ҍ &�?�{', 'wp-includes/js/customize-loader.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����I�+o�\0t�:�'),
('c,?���Db�\r�|��', 'wp-content/plugins/papercite/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!����|�#B3\nV'),
('c,���[xޫ�3�\n�@', 'wp-includes/js/jquery/jquery.masonry.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����R�(��e^'),
('cT�3L�Y�`�?{�7�|', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-taxes-by-code.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|@>OMB\Z�o\n/��'),
('cn�4���f���	��', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.dimensions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������&j�t�+"T'),
('c��g�΢�B7��Z�', 'wp-content/plugins/buddypress/bp-core/bp-core-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��r;�D�ł���pO'),
('c�g���qĐ~�S��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/member-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cio\ZL�c�X�2�胥'),
('c�>�q�D�1	_h\0b', 'wp-content/themes/twentytwelve/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��b*�K���J�X_�'),
('d��:w���O�І', 'wp-includes/ID3/getid3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�\nQ�Q.���b�o�'),
('d��1�쵓-�;O��', 'wp-admin/js/custom-background.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�j�)N���ˈ¨iv#'),
('d#��u=k�f�''�\0��', 'wp-content/themes/twentyfourteen/js/customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�bp�_��[�r�$/��'),
('dF=���j��Hc�����', 'wp-content/plugins/akismet/wrapper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D�ܚIf`�{ҭ�\Z0[x'),
('dO���rnE�����U�', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-schema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\\��_�v��Qw1�'),
('dS�Mr��8�M��[��', 'wp-content/uploads/2015/03/uaiblanco-604x270.jpg', 0, '�B����ͺ�	�N�', '�B����ͺ�	�N�'),
('dT�ѡ���u�6O�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-api-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2~�0�+u�o�c�I(�'''),
('dpE�k�:��ơ''', 'wp-content/plugins/buddypress/bp-core/js/jquery-query.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����,�s5�Q��U'),
('d�E�jHU�<~\n>3�ZW', 'wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<?F]�Z��-y�C4h'),
('d�Yi�+P\r������h', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-coupons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_��2����i��2�'),
('d�on�W>a������', 'wp-content/themes/twentyfifteen/genericons/Genericons.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's/��n]�d���z�?'),
('dӓ�/X����Uw6�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-sql-schema-parser.php', 0, 'ǎ�5c����D����', 'ǎ�5c����D����'),
('d�(��%J���@�G�', 'wp-admin/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���U����]��C�'),
('d���a''�gCM~u��Nd', 'wp-content/themes/twentythirteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<�o�$k)���_-l'),
('d�m�\0$���a��;��', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���05*J�����\n<�'),
('d�hħ{q4�2�K"�', 'wp-includes/SimplePie/Rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=p�m	�K�دat�'),
('d�4�j�2U�V��$�P', 'wp-admin/css/wp-admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�7�H�;�������G'),
('d��,�myK�O$ģ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AglInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Cc�=W*��Dg'),
('e�ڀ�t��	Y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/search-form.php', 0, '̵�`�d��f��b', '̵�`�d��f��b'),
('e.PȴNB�Sx[�&��', 'wp-admin/includes/class-wp-plugin-install-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@_��c}��g���P'),
('eT��\n�C�>��;1�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_real_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�+P<MAo��V�'),
('eW`�%ڵK�v�S��b', 'wp-content/plugins/woocommerce/i18n/states/IR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E�uU��&/�T�莺'),
('e]%2��,���uz�$�', 'wp-content/plugins/buddypress/bp-members/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����A]��f�0i'),
('ek���R��N�jb', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_ApcCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\0�3p\Z|\n�X'),
('en�^�{m�=��U՘�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-styles.php', 0, '7���-��fְ:���', '7���-��fְ:���'),
('e�Ñ5�[q�R"57�X�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-theme-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�O��D�B''q�'),
('e�щ�G�7��X�?\0B', 'wp-content/plugins/wordpress-seo/admin/pages/social.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$#;��;�''�����'),
('e��\Z����ϧ�\0��}y', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.R/�Y ��]�L�'),
('e��__�%��x���', 'wp-includes/class-snoopy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���mMz�Mr�;v��'),
('e�z����؞;"d��', 'wp-content/plugins/woocommerce/templates/loop/orderby.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B����)k�[R�C��['),
('e�q����8xj� /�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/wp-lists.js', 0, '8�Ѩ�>''''��', '8�Ѩ�>''''��'),
('e�^#|ۍ�TЩ��z', 'wp-includes/Text/Diff/Engine/xdiff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ֹ�b�t�X8�GX'),
('e��\Z_��E''��|@S[�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/delete-topic.php', 0, '�!YG*�K�Jk��\n��', '�!YG*�K�Jk��\n��'),
('e��-�(�{2�,	', 'wp-content/plugins/google-analytics-for-wordpress/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������3���F'),
('e�qwV\0�''m����/�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|����� !�)�O_�'),
('f訝��<)�.��_', 'wp-content/themes/hexa/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)��d�.�O&�'),
('f�u��A-sK��N', 'wp-content/plugins/buddypress/bp-forums/deprecated/1.6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ԓ�<t�ڡ��&��'),
('f+ӏbH)��\n���E��', 'wp-content/plugins/woocommerce/templates/myaccount/view-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z�$~W�|�F.rɑ'),
('fO��b�G&!�hi��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/notices-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t����	�K�i�6�D'),
('f^�dY���{w?D��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/FuelphpInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�K���{~tbYb'),
('fw�}WE~�Q"%��', 'wp-content/plugins/woocommerce/assets/css/prettyPhoto.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B0A�?��M��TW'),
('f�u3\n�M\\�}6*0�', 'wp-includes/class-wp-customize-setting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�1�˄Dz�p��U�'),
('f�{2�ᙞ�k>�uS', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables_themeroller.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����''��2'),
('f�?�(�Ƅ�n��f)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MODULEWorkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��٢j���@��\nN�'),
('f�霰f؟|h��U�L', 'wp-admin/includes/ms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm\Z���F�]��C�{:'),
('f��y�jC5\0�4kJ���', 'wp-content/plugins/theme-check/checks/plugin-territory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ʒ�%�o��Fz^�'),
('f�����e��R�)�', 'wp-includes/SimplePie/Item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E�!�Cz�\0�c<ܧ'),
('f��j)&TF���@M��7', 'wp-content/plugins/woocommerce/templates/checkout/thankyou.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ь`b��x�����Q'),
('f�]��Ď�+w��', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!]�-��N�\r��'),
('f��4_��[b>�plM', 'wp-content/plugins/theme-check/checks/style_needed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%P@=��U&2�8��'),
('f��t�צX�	��s]�', 'wp-content/plugins/wordpress-seo/css/wpseo-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o�m�w2�JU�>���'),
('f���[�Ð�F��)�', 'wp-content/plugins/theme-check/lang/theme-check-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-�\n��vi�j��´h'),
('g���!���*�Me�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/members.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*�*�TT���n|�<�'),
('g#L�ͬK�A]ea�2', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_namespaces.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~�(+�K��H&G	�'),
('g#�,vM������:��', 'wp-includes/js/jquery/jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%�nc,���R��*��'),
('g+yr���q����D��/', 'wp-includes/vars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��� QF&b��E�S�pN'),
('gn�Y��n��Q�_��)', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\r����O��An'),
('g�$G\\��;�r���1X', 'wp-includes/images/wpicons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dS��uq��V_���a�'),
('g�݀ᕣɥD�u�X', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-user.php', 0, ' �h�es7����', ' �h�es7����'),
('gԨZ���k�v$��C�', 'wp-content/plugins/woocommerce/includes/walkers/class-product-cat-list-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aq�hd��NʥH���'),
('g��]bR%� Z��E�', 'wp-includes/js/shortcode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�X2\0`y��L8�*�'),
('g�Ed��1��D}�����', 'wp-includes/js/jquery/ui/autocomplete.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�J�S;i��������'),
('h\ZOhl��_��Lm/�', 'wp-includes/class-wp-customize-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2�C;�}��j/�s&�o'),
('h d��껅2��_�r', 'wp-includes/functions.wp-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q��3������s���'),
('h*�@8�	�H�(��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-theme-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�O��D�B''q�'),
('h*b[���\0�q�bX\r�-', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_HttpStreamIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��q���\0-��Z��'),
('h0X-�i����^�G`8', 'wp-includes/pluggable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����.�R��m���.�'),
('h4���#3�`�-݈�"�', 'wp-admin/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���?���>z�ͩ��z&'),
('h@Z�%�R�F�;ti\\m', 'wp-admin/css/login-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P,9��fݏ�O��}G�'),
('hF��Մ����)�i�h', 'wp-content/plugins/woocommerce/assets/js/jquery-tiptip/jquery.tipTip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�K�[��u=�tv3�'),
('h|hE��f:Ʊ2��~', 'wp-admin/network/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&շ�1Up�%��1=$�'),
('h��r�������;�,%', 'wp-content/plugins/buddypress/bp-groups/bp-groups-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S:�,���w���B���'),
('h�s���J2������Z', 'wp-content/plugins/papercite/js/papercite.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''l�� i� v����'),
('h�<�]���OpNCƴ�', 'wp-content/plugins/wordfence/lib/wordfenceURLHoover.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v�#Aq''I�bO��v�D'),
('h� ��Z�/���', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/extensions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��L�S���ԑ&D&º�'),
('h����:��B��/H3�', 'wp-content/plugins/buddypress/bp-core/css/buddybar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\Z��+��7�X3����'),
('iAh{���M(�|J,��', 'wp-admin/js/wp-fullscreen.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x\n����@�����'),
('ia\nO�����''�*�c�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/KohanaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z �"I���/����'),
('irR�R)&��8����K', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�x����O!�NĴ'),
('i�C��<�����N�F�4', 'wp-content/plugins/buddypress/bp-friends/bp-friends-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/��vH���*�h�'),
('i�-��X�8V[~E�', 'wp-admin/css/install-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{�������v~�'),
('i�\\����=X�h$', 'wp-admin/js/language-chooser.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	�P�V0��tJ�J'),
('i�U\\n;���J���', 'wp-content/plugins/woocommerce/includes/class-wc-https.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�o�G!hR\\+''���'),
('iش6��?3��|�?e�L', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_REST.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���z���>�4�`��f'),
('i��_�cF�cƑ��a�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/DokuWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N��]�^g�\r���x�J�'),
('j���f�����_7V�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.bp-options.php', 0, '���<�Џ$�>�$��', '���<�Џ$�>�$��'),
('j����&�\\�U���چ', 'wp-content/themes/twentythirteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_�N�w����(9�w�'),
('j&�V1���6�4����', 'wp-content/plugins/wordfence/images/icons/ajaxWhite32x32.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���r��9 �#��{�'),
('jQ���e���;�e', 'wp-includes/css/wp-pointer-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^AM��>R��S� �,;�'),
('jmE��AX�uw�>܆', 'wp-admin/css/colors/ectoplasm/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AE|0��)D�mX�'),
('j�䱋����%���]�', 'wp-includes/class-wp-xmlrpc-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Sa� n��~�C'),
('j�����5F+���o', 'wp-includes/images/crystal/interactive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�R�m`��`�9��'),
('j�m�*�[g+HFJ�', 'wp-content/plugins/woocommerce/templates/checkout/form-pay.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~[��_߀)�4�`�'),
('j�H��Nw�#=�`��', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-order.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ҕ����2�t��j�'),
('j�ᗨw"�2\\�Da�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Plan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k%N::+?V��lǦy�');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('j҅�6n?h+A��*���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_HttpRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O`�C�GR&���\ns'),
('jڿ�t��1u���}���', 'wp-content/plugins/wordfence/images/wordfence-logo-64x64.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]$�bd�+NY'),
('j��0JWc�m�]�s�', 'wp-content/plugins/papercite/tests/test-highlight.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z4����k�u�E��-'),
('k_|=S��	�\no', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/blank.gif', 0, 'm"���|n�o�	�v�', 'm"���|n�o�	�v�'),
('k���$6O��-N�x�', 'wp-includes/js/tinymce/plugins/charmap/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b~�=	�\Z���'),
('kV''''V�/tb��d�1', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/hello.php', 0, '�=������mc�*\\A��', '�=������mc�*\\A��'),
('kHew+^��Jo�g4', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ZendInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<T����W<l0ӵ'),
('kM�������̙Ysp', 'wp-admin/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}@ۨ�s������IE��'),
('kg��''��c��}�', 'wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�PV��:�G6l��$a'),
('kjG�����O�Y�@|', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-resource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%�g�������p��'),
('k�T��Y���U.����', 'wp-content/themes/twentythirteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÜA�d�pn���ļ�	+'),
('k�~`��j>y�=�눘', 'wp-content/plugins/theme-check/checkbase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dw��#1����Yl�'),
('k�`�;����W\0��?��', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/default-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q򣇇���Y�(챬'),
('k��B˞�b=y��', 'wp-includes/user.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}��\Z���XFiϣ�'),
('k�q�\\�7�n���2�G', 'wp-content/plugins/woocommerce/assets/js/stupidtable/stupidtable.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[�Y`���Q�Z1q�Զ.'),
('l;.7�[�h4�#�8�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{v����\\K�i�S'),
('lY=!{~��(0U���\0', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-media.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s�֣�-IT�'),
('l^�<D֖P%*&�ᲁ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DrupalInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ճw#��R�mR)����'),
('lt����%��L���Մp', 'wp-content/plugins/wordpress-seo/images/question-mark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P�3�XXJ����'),
('lx q�p��џ0��''', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_FileCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\0�Q�tj��@؟�'),
('lQ��Յ����\\I�', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���B�f����#���'),
('l�l��7/X���@', 'wp-content/plugins/buddypress/bp-forums/bp-forums-bbpress-sa.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S~�/D����T\\�'),
('l��''�������	', 'wp-content/plugins/wordpress-seo/admin/TextStatistics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C\n��CF�I}�6��'),
('l��pp�y�b��Ux', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PhpBBInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}��,�S=����T�8�'),
('l��R��FqOw\\���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/akismet.php', 0, '���������\r����', '���������\r����'),
('l��Q%o�?�y�C��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-admin.php', 0, '�]B��T9߅o(�', '�]B��T9߅o(�'),
('m�2]�.��A�Jȟ', 'wp-content/themes/hexa/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�Mi���Hj���JBc'),
('mD��T�ms���A�}', 'wp-includes/certificates/ca-bundle.crt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��vǻ��!�o\n�f��o'),
('mA��Y�����Rb|�S�', 'wp-includes/ms-default-constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NM�����9�b�%'),
('mE������\\�)��o�', 'wp-includes/js/jquery/ui/spinner.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|/���Sɇ��%q	��'),
('mI�0b1�xX��ſ�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0ѸBcF��q���*'),
('mY����}ɽ��?', 'wp-includes/js/jquery/jquery.ui.touch-punch.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L�m�Q4փ��]�'),
('m��U9vG��O�@�<C�', 'wp-content/plugins/buddypress/bp-core/css/buddybar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$��veh�3����d^c'),
('m��-\Zm1�����w��', 'wp-includes/js/jquery/ui/sortable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��L)d���Cr��'),
('m����\Z�/�����', 'wp-content/themes/twentyfifteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�(��� o���-\\'),
('m��L%A�ML><]', 'wp-content/plugins/woocommerce/includes/class-wc-frontend-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MܷZ��$o$ut=$\ZI'),
('m������}�|���', 'wp-content/plugins/woocommerce/includes/wc-coupon-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ڇE��F08t*\0QG'),
('m�''\r�H�9�\\Rm�*sS', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/app.php', 0, 'JS������9-��v��', 'JS������9-��v��'),
('mׂ��G�+�|��ߖ', 'wp-content/plugins/woocommerce/assets/js/jquery-cookie/jquery.cookie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�y/$P��=�TM��'),
('m߃��I\\��/���}', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U�"�+�����6�ח'),
('m�t<��s��Fӗ\Z�', 'wp-content/plugins/papercite/format/ieee_mod.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'rIV�-�!=����%K'),
('n]�j7<3ISsQ�', 'wp-admin/images/post-formats32-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t.E���5G�N\Z��v'),
('n����d/��I\0��', 'wp-content/plugins/siteorigin-panels/widgets/img/textures/light-dashed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\0|�\\w��㜅E'),
('n#�t=�''�����b]{�', 'wp-includes/js/tinymce/themes/modern/theme.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VL]�����Tg2%\Z�'),
('nS�s����E�bҐ�', 'wp-content/plugins/buddypress/bp-activity/bp-activity-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~�Ku(�L��7D'),
('nZ/1T:{&^�/n���', 'wp-admin/js/media-gallery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|��f����8�}+&'),
('nZ�U����zU�x�E', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-bits-rtl.gif', 0, '�26uf�Y�l{M�d�', '�26uf�Y�l{M�d�'),
('nef���A@���R�?��', 'wp-includes/js/jquery/ui/position.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Xk�a��k�ӆ'),
('nr�T�O��bף��', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('nxtD���Pt�_v��', 'wp-content/plugins/woocommerce/templates/loop/no-products-found.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z����4iD�;�T��'),
('n����@��A��F�', 'wp-admin/network/sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�;eMƠ�''\ntmf\\�G'),
('n��$���L�k`s݈', 'wp-content/languages/themes/twentyfourteen-es_CL.po', 0, '�i�UL�UԱ%u#t�', '�i�UL�UԱ%u#t�'),
('n�s���t�Y�Q�''', 'wp-content/plugins/buddypress/bp-messages/bp-messages-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��5d��m�n��h�}Q'),
('n�\no���Jb�\nH@#', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Qi���\Z�9l���C�'),
('n�d��kXivf���k', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/d3.v3.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m������t�ʠ4�'),
('n٢��7��燥��x�', 'wp-content/plugins/wordpress-seo/admin/class-pointers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���>��>�S�Dc'),
('n���O�v�W�#H+�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-da_DK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.��5�V)!�z�P'),
('n�M�z����u��RS', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zo97w�ec�߾{'),
('n�ґ''�	�%�_�?�ޒ', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b���[�j��9�7���Y'),
('n�����O�`����6', 'wp-content/plugins/siteorigin-panels/css/images/dropdown-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5��^ZG����?��?'),
('o"��ż^~*�G����5', 'wp-content/plugins/buddypress/bp-groups/bp-groups-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�eT	��u�1w%.-'),
('o=��-�s�J�\\��%�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/images/page_header_bblogo.png', 0, '�lZv�ⵈ������', '�lZv�ⵈ������'),
('o@e���I(���\niI�', 'wp-content/plugins/theme-check/checks/postthumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V�d�+��&���'),
('oPZ\n�%�o2X!�''^', 'wp-content/themes/twentyfourteen/page-templates/contributors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*��x/>7�e���C�'),
('oP��c����o�.�r', 'wp-includes/js/tinymce/skins/lightgray/img/object.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�rdP�E}u\n/M�A�� '),
('oQ����Aީ�c#���', 'wp-content/plugins/woocommerce/assets/css/woocommerce.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����<��[U �n'),
('oSB\r�Ʈ�4�;K�4', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-object-cache-memcached.php', 0, '�1/��G�O�T�*zS', '�1/��G�O�T�*zS'),
('oV���~��ϵ=��i''', 'wp-content/languages/admin-network-es_CL.mo', 0, 'ߟvL����Zd', 'ߟvL����Zd'),
('oZ0�������<c�0', 'wp-includes/SimplePie/IRI.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n� �憒�;a{�_6�'),
('oeJ�p��ˈMi����)', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin_dashboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"&�Ϊ�8\r���1�'),
('ov��?���)��!�y', 'wp-content/plugins/woocommerce/assets/images/icons/loader.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Α�����ʹ'),
('o�Y4�֌�4{#c^�j', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/404.php', 0, '�1��K\0j�I5�_:�m�', '�1��K\0j�I5�_:�m�'),
('o��4ak24:�Dau�M�', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.resize.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s<\\p�\n�AG\Z��W'),
('o��a��w5h�@+w\r�', 'wp-content/plugins/wordfence/css/main.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�V�����<�\\�Hӯ'),
('o㮚-�;?X:��pҡ', 'wp-trackback.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.��d���#k�l'),
('o�[��n3u��ʹ�P5', 'wp-admin/options-general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z���hba�1����n'),
('p��7u�L�_{2Û�', 'wp-includes/js/jquery/ui/draggable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��;fCJ��[o��qo�'),
('p>�~���F��\Zs', 'wp-content/plugins/woocommerce/includes/class-wc-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.����t�n�ư��S�'),
('pڎ��5�Nu�\\�', 'wp-content/plugins/buddypress/bp-core/bp-core-dependency.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-I���n���j�����'),
('p.�ý �U\\����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-statistics.php', 0, '|@L gF���\Z���h', '|@L gF���\Z���h'),
('p2Y1�ڲ��"��	�', 'wp-content/plugins/theme-check/theme-check.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���)�LM��k�.b8'),
('pG�,�\Z�Գ5,�t�U�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ClanCatsFrameworkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����՝�Vo5��ڐ\\'),
('pUy�a	�b��va�;�8', 'wp-includes/js/comment-reply.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n�(e=N�(ZMV{�'),
('p\\�󍷽���A26o�', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/item_back.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��pC���:���X+:f'),
('pr���g�<ƀ���', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@.V~H���j�\Z�'),
('pzD�o���YC���', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/60pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��YSMi�x ˀ�n�'),
('p�\\��#�:~CF�Q�', 'wp-content/themes/twentytwelve/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G>��+a�Iz�q}�'),
('p����+:�Zo)e�''', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DokuWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}��=�%����7\\�8V'),
('p�cxb�B�R�F�d%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/footer.php', 0, '�z��@?/)�ٶ�v��', '�z��@?/)�ٶ�v��'),
('p��.а��[ÍD�', 'wp-includes/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*NJ�-94Oknh�	��t'),
('p�����zI�[�r�9�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-caps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~�$L��}���;n��s'),
('p�͑����6�Ør', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/logged-in.php', 0, '/�?��q�Ċ�$�', '/�?��q�Ċ�$�'),
('p����2+"��&Ҭ?', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TheliaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R#tX�Ƀt�}7FI7'),
('p�_uNJ�p#B36�Ce', 'wp-content/plugins/wordpress-seo/languages/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('p�/�XU`Is���b�', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',Ң1�B�X���3�g#'),
('p����b�~�oBk�Z', 'wp-content/plugins/akismet/class.akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f�ŧ\r��1\nͪ�l'),
('q�L�� 5%�٨��', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u~�mo�ٔ�L�!'),
('q\0^�mvBsfC~�', 'wp-content/themes/twentyfifteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ɲb�ZK���K�W��:'),
('q"�co���>�2Rh�]', 'wp-admin/includes/plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0xD:̚H�í=���I '),
('q4�]0Kv�l����E~B', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ElggInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Ṕ�����x�ǐ�'),
('qDB���p��4�P�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��jTί��f�F"�O�'),
('qh�665�y|�=�?S	', 'wp-includes/js/jquery/jquery.serialize-object.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\)������J�l<�"'),
('q��\Zp?ǋ�78gt��', 'wp-content/themes/twentytwelve/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9��g0�\ra�Zk��2+�'),
('q��_\ZB6�S(Q�3�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MediaWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#S�]�r���\Z�H�'),
('q�X\n�^����j^A', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Yg_ɖo�\0c���='),
('q�L���is>u�_&�', 'wp-content/plugins/woocommerce/templates/emails/plain/email-addresses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��wb��+�\0h��ވP�'),
('r ��xu�nK�N�$', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bpdb.php', 0, '��k������ؑ		g', '��k������ؑ		g'),
('r��h��v��Lk/��', 'wp-admin/network/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c�q�E\nJw�#U~b'),
('r%�s�qOD�A��ж^', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DolibarrInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	m_d&Ժ����0w'),
('r+zk;� 4��WI', 'wp-includes/js/tinymce/themes/modern/theme.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/�����&H\0T��A��'),
('rG�)u򶕢~�+~U�e', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ClanCatsFrameworkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����՝�Vo5��ڐ\\'),
('rG��#7ث="�	˖', 'wp-content/plugins/woocommerce/templates/cart/cart-totals.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�mf���̧�l���'),
('rS:�`��e࿸�B��', 'wp-content/plugins/woocommerce/templates/single-product-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4դ�-_\r��s'),
('rV8��g''� ���', 'wp-content/plugins/buddypress/bp-core/bp-core-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']�B��1�+]O��N�G'),
('rb�z�-�7���Rg', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2<7qH�)e�Y?65֍'),
('rf���\\�\n�ۏr׍�', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-customer-list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!�"�؂�Ud�6��'),
('ri�v��4,�!$���ڱ', 'wp-content/themes/twentytwelve/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@\r�;ho�1��B'),
('rja�[��ݔo�OkM', 'wp-content/plugins/buddypress/bp-groups/js/widget-groups.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x$UUt����/5K(�'),
('r�(n՞���j��b"', 'wp-admin/js/media.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�bC��t��b�����e'),
('r��L )�L(s���T', 'wp-content/plugins/woocommerce/assets/js/admin/round.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�(]�g��Ļ.�����'),
('r�p�#@�yb�(��W�', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{�<p�,�,o�Rc'),
('rĞ�\\��?E�"ϦQC�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/qtip/jquery.qtip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���y�n��m\r>�ǌX'),
('r�w#����זC��֔', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����sLp��S�i^L'),
('r�+�OܗE}�X�~��m', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\r�\0���Y�q[2װ�'),
('r�_�/��HG=�%�<�', 'wp-includes/images/arrow-pointer-blue-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%m�rތ]4�9c�'),
('r��r�(J�g�(�y�t', 'wp-includes/js/mce-view.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	n"�m�����A�!'),
('r�ِW�DM\0%6��)', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-recently-viewed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�X:���o��pS��)�'),
('r��\n��b��#��', 'wp-admin/css/media-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ߩ��ĭ�B��/��'),
('sg����~=Bf��', 'wp-content/plugins/woocommerce/templates/product-searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T#\\�N}rXАH�+���'),
('s.^Y�W\ZX�UT4,���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/favicon.ico', 0, '�a��s=!.�`\n8+\0�O', '�a��s=!.�`\n8+\0�O'),
('s8P��\Z%?zݜG��z', 'wp-content/themes/twentytwelve/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#���G;�G�����'),
('s_�k֎���oH9պ�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-posts.php', 0, 'NM�M��������~s', 'NM�M��������~s'),
('s|�Bs����p�$�[y', 'wp-content/plugins/siteorigin-panels/inc/css.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_ȸ�$l��� �x]�\n'),
('s��;\Z��=0җW��0', 'wp-content/themes/hexa/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a��Tn������R�_'),
('s��ӣJ���~��k', 'wp-content/plugins/akismet/views/stats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D���E�ax�t/�ZT '),
('s�����F����~�', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-&��26+*�-p�G'),
('sÑmb�έ�&���*', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/post-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_����C��0�N�'),
('s���[���l}R�', 'wp-content/plugins/buddypress/bp-core/deprecated/1.5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�hk^mA>TW�RJ��'),
('s���Aw��e�EE�T', 'wp-content/plugins/woocommerce/includes/wc-page-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��:S6�ٝx�7�M�'),
('s�Av1\r8?���͔�Q', 'wp-content/themes/hexa/inc/wpcom.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��#:˺�J��"�pq'),
('s�0yl�ꃋD\\��"', 'wp-content/plugins/wordpress-seo/wp-seo-main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���&�I��7�J�)'),
('s�K��!��7m�{���]', 'wp-content/plugins/woocommerce/includes/wc-template-hooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ө�\Z�}V�b2N�{7'),
('s�ŏU''���e@�d�', 'wp-includes/js/tinymce/plugins/fullscreen/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}�3�v�8Jed�'),
('s�?g��;�S��!���', 'wp-content/plugins/buddypress/bp-friends/js/widget-friends.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D��*i�*CU�h�'),
('s�C4M�*��*B�)�', 'wp-includes/css/wp-pointer.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����W�T^w_%�H-'),
('t;��ͤ\0�>sr[��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�UQ���&2'),
('t\Z+�Fİ.���D', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���:Z\Z��-�J��\r?'),
('t$:/H���t�*\\���', 'wp-content/plugins/google-analytics-for-wordpress/assets/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('t)������L1{�W', 'wp-content/plugins/siteorigin-panels/inc/plugin-activation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F�P�^T�~�?i���'),
('t6��O�\ra��Ȇ�f', 'wp-admin/js/plugin-install.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.-�$�Z_lRYi\rwZ#$'),
('t8����p�̋�z{jDp', 'wp-includes/css/buttons-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Nf�Ў�DD'),
('tCz�4<�0 P*���N', 'wp-content/plugins/buddypress/bp-core/bp-core-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ʫR�Πl�5�`�c3'),
('tU�/Ds�Iڤ�st�', 'wp-includes/js/wp-auth-check.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��R%K[D��l@��q'),
('th��P��x\Z2��´T', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ZikulaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K�8I�dp�o?E'),
('tm6ۗ�q���.��=j', 'wp-admin/css/colors/blue/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	���u=�j�t~F-'),
('t�D#���$3Y��y', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��o:Li��B�Ã>��'),
('t�	յ�"�;�gF�f�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd�vP��wtF&Q�'),
('u2�~���|3��', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-integration.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T�Q\\���v�U&�rP�'),
('uapF��[t#��(q[', 'wp-content/plugins/wordpress-seo/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('uc첏���?��\\a�', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A¤��R������'),
('ue�,"\n	�h�g.', 'wp-admin/css/colors/_mixins.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S�_���|�''4.o''6�'),
('unY����6�GyI�̐', 'wp-content/plugins/google-analytics-for-wordpress/frontend/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('urm����4�~���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/LithiumInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!{�hȡR2˪퀨6'),
('uv�՞(S5���훨', 'wp-content/themes/twentyfifteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'җ�ugwe�P��gG'),
('u��U�L3�kj4sJ�', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+u+-���F��)[%F�'),
('u��;�yOS�^�)>%�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/BitrixInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>������WO���`H'),
('u��3!pA�f�)R�M�', 'wp-includes/js/tinymce/plugins/wpgallery/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���A�#j�d�&�S�'),
('u����}���eu�ƽ0q', 'wp-content/themes/twentythirteen/images/search-icon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7�ώ=]�\0,U؈4���'),
('u�\r�<�7	C.�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-it_IT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0�f�Gn1u�M�;�'),
('u�qg\Z\0�8�hԭ�\0�', 'wp-admin/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<�9�����-A!K�$s'),
('u��Q"��~W����ð', 'wp-content/themes/twentyfifteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�Mi���Hj���JBc'),
('vڴ����V���K��P', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$�l�ay�l@5���~�n'),
('v5MT�����sN�', 'wp-content/plugins/buddypress/bp-members/bp-members-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@q:�_�.�k٦��'),
('v@���2߭^q�ƠWW', 'wp-content/themes/twentytwelve/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�k�����`Ԗ�6�'),
('vK;@�s�aU1;�	^�', 'wp-config.php', 0, '$�����=G��q�j>d', '$�����=G��q�j>d'),
('vX��%�W�kJ?�-#', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!�O�O�e���J��'),
('v\\R&������2�`u ', 'wp-content/languages/admin-es_CL.mo', 0, '�2�>��9	������v�', '�2�>��9	������v�'),
('vlBT��[6��B�J�', 'wp-content/themes/twentyfifteen/genericons/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u�9\nJ��La7Q��焑'),
('vv�Os�$�R]}�TM', 'wp-content/plugins/buddypress/bp-core/deprecated/1.7.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��D��7?�?Wa�\Z�d>'),
('vw��@�H��z�F�', 'wp-admin/ms-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���@�ͯE�b6�'),
('v]�z������3�tB', 'wp-admin/includes/class-wp-importer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(���VH�t�n0<'),
('v��Ms��5+Ŷ��', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-table-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b_�B�rm���jS'),
('v��|��Z��"�f�i^Z', 'wp-content/uploads/2015/03/uaiblanco-1024x317.jpg', 0, '��NA#0;]�\Z�~ԝ�U', '��NA#0;]�\Z�~ԝ�U'),
('v��ޣ��R�', 'wp-includes/js/jquery/jquery-migrate.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7��5�X��QN�z'),
('v�&�c�*˰���z8�', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocompletefb.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ov�̭�@�)�'),
('v�''�6�J�]zG��', 'wp-content/plugins/theme-check/checks/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lu>D�>���T�50��'),
('v��k�0[��gǌo2', 'wp-content/plugins/theme-check/checks/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b o@�J.��\0�7q'),
('v�G�.�g�A��#�r�', 'wp-admin/images/align-right-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h�l�>r�]�lW��x'),
('v����4�|>�<����', 'wp-admin/js/xfn.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����t�+��n�(k'),
('v�N��#u��M7�����', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ۍ�����F��c�p��'),
('v�{#��l��b\0}��B', 'wp-admin/css/colors/light/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�WZƅT��y}1��'),
('v�Ҹ);�D��~J"��q', 'wp-includes/js/jquery/jquery.form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.�,�+��\nq'),
('w����s��ԡ�V/', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/sep.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���L@o.�㮚WbX�'),
('wu�l|��p��Q', 'wp-includes/js/autosave.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.�,@��g�h/7'),
('w%��o��fn�`>��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MODXEvoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� ��Ќ~��^�F'),
('wxs�����WU��6�', 'wp-content/plugins/woocommerce/includes/shipping/international-delivery/class-wc-shipping-international-delivery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���v	2�����U��,'),
('w�gh���SC�U�', 'wp-content/plugins/buddypress/bp-members/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m�MeR��)��vH'),
('w�a`��i���&����', 'wp-content/plugins/buddypress/bp-core/bp-core-component.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm��掭�i���8��'),
('w�����+Y��\0�f�s�', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/ZeroClipboard.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\{��7�/�Jp��\0&'),
('w��S`j���Is�Q�', 'wp-content/plugins/google-analytics-for-wordpress/frontend/abstract-class-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?6�0���;��ª�d�'),
('w���L��0���]r.', 'wp-includes/images/crystal/code.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`�1������1�9'),
('w�''����aܨ���׾x', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��9�5����׬A'),
('w�`��Y���/UĨ�.', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-plugin-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's\Z�y��ow�ђ��\r�'),
('w�R���=!���4U��', 'wp-content/plugins/buddypress/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0������D�S��_'),
('w��\r��h��B�#	M', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-order-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+�-�� �8Yگ^7,*'),
('w������:}V��P', 'wp-admin/js/common.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɮm��Y[o��*�`\0�'),
('w�f_j:�ϣ��?_}', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/password-reset.php', 0, 'm\0���Wy����ĵ', 'm\0���Wy����ĵ'),
('x	G!N�$�.�d�Tb�', 'wp-includes/ID3/module.audio-video.flv.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ֈ?�d�h�@�D��'),
('x\n��@����F����', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;��s��\\�\n�V���'),
('x$�Z��~�gJ[�r�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����Lb�\0R�)'),
('x.o\Z0L�u ϳ��', 'wp-content/themes/twentyfifteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t���a����=�B'),
('xG��d�C��1xM�p�', 'wp-content/themes/twentytwelve/content-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��8\\�Z���07&4'),
('xIH�.�9�Y��BO', 'wp-admin/css/colors/coffee/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9~8 �z#C0�^%a�'),
('xy�!���q�)�.ˉ"', 'wp-content/plugins/wordfence/images/sort_desc_disabled.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m����͟��r�� 9'),
('x�s�2����"Z�U�®', 'wp-content/themes/twentyfifteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�� ��2�MD�$��'),
('x�^m�]̲�/��L4vU', 'wp-admin/includes/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k�͍1�}�6{ƚ�8�'''),
('x��X$:㈳���o', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-downloads.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J���!G|��Q_��G'),
('x���޶�5LC�}��', 'wp-content/plugins/wordpress-seo/admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('x�w�i\0�/Z.�{%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-header.php', 0, '��?i�8�s�ި��', '��?i�8�s�ި��'),
('x�6x+_�4"���%', 'wp-content/plugins/theme-check/checks/badthings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�AA��рP�=3?'),
('x�?��I|9@��.���D', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-cron.php', 0, '�A�S\r���"�*��', '�A�S\r���"�*��'),
('x�K��e�8|���6[�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7�hQ�v<j4�@�'),
('x�-�o��^\0�̭���m', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MakoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���6g�O5|�� '),
('x���$O%	V��c�1', 'wp-content/languages/es_CL.po', 0, '�C��EO�D�ʀ���ΰ', '�C��EO�D�ʀ���ΰ'),
('x덂��@}Y��i�+', 'wp-includes/js/tinymce/plugins/tabfocus/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TV��#)�{����'),
('x�k!�ͯY��Kz�	�s', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ۊ��mcimhn�'),
('y���1��-�/fIנ', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Html/Array.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(�/FI�2��LXG�\\�.'),
('yqЏD�G��u�ӌ', 'wp-content/plugins/theme-check/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';�w�[�=�/�Y��~I�'),
('y���V�ٜ�^"/', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1Y�%��չ��'),
('y+m��2�{XX��;', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/po.php', 0, '-��Z;tO�ˇ��v\r', '-��Z;tO�ˇ��v\r'),
('y6�Q]ipv����w�', 'wp-content/plugins/woocommerce/assets/js/admin/accounting.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����0!��A�\n6���'),
('yo�_���ϥ	���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AsgardInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\0 =�L��H(�w�MO'),
('yq��\0��)�{TP', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_Cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#Ilk�W��E�~��:�'),
('y���E�a��:�[\0', 'wp-includes/class.wp-dependencies.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��T_[@j��j�\\?ou'),
('y�v��	R� ���S��', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.stack.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5:ǡ0�-<B�'),
('y���G�\\`����MR�', 'wp-admin/network/site-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ԕGM�wU߾ZuY1+'),
('z0Kߤ�� �Д�l<', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-pl_PL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A����@�9MˤQ`'),
('z0O\r�O����Q��r', 'wp-content/plugins/woocommerce/assets/images/chosen-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K�X$PUD�49�W}�q'),
('z;j2WD�6��[�V', 'wp-admin/js/accordion.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^V�\n�8.7p�Ct�7:'),
('zk��0�PyS*���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installed.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Iӳ��r`�'),
('z�{���"��GE��ƞ', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ԃ@�e��"���7T'),
('z�5�*\ZADZCk��j��', 'wp-content/plugins/wordfence/images/icons/magnifier.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���uO�{:qcV��'''),
('z����JX�w{!\rF���', 'wp-admin/includes/class-wp-upgrader-skins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,�����R��\Z'),
('zҽ�#�iB1�cAws*', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/jplayer.siteorigin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����(S��c҆'),
('zވŝ�GH�}g\0��', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/InvoiceItem.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't*]�1�e��?��K'),
('{��a�t�\n">��S', 'wp-includes/js/mediaelement/flashmediaelement.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ʵ��k��5�`*\\�'),
('{N���2�Q�u��=	�', 'wp-admin/network/theme-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O�F��dm����j'),
('{''����]H�d���t�', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����g__����ݢ�'),
('{E\0�;�<DÊ\0�`�B', 'wp-content/plugins/buddypress/bp-groups/bp-groups-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�~�ye��F��`F�'),
('{g��?����ia�)C', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-bits.gif', 0, '����$��sYE}@�', '����$��sYE}@�'),
('{g�e"��i٧�0��}', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'QX�;�7�AԈ�>#^}K'),
('{t�E~��P�A�1��', 'wp-admin/js/tags.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L�Bf�Z��<���/s'),
('{���fΓ࢐1ʁ�o�', 'wp-content/plugins/woocommerce/includes/libraries/class-emogrifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=*�D\0l-��0��{'),
('{�)�4e4p:�fW�', 'wp-includes/js/jquery/jquery.query.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';�Xz�ǰ����wC'),
('{��*��C����U�', 'wp-content/plugins/woocommerce/templates/order/order-details.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�E7UΧ�Y?�\Z�M�'),
('{�RC��\Z�.*"�Q', 'wp-includes/feed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\3!/���)Tj'),
('{��P8���5x��-�', 'wp-includes/js/tinymce/plugins/wpfullscreen/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '݃�r\\�+zJ���'),
('{�;��13�84��/', 'wp-content/plugins/wordpress-seo/admin/ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�sU��r������'),
('{���?����\r��\n''', 'wp-admin/images/imgedit-icons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K�\\2���}�G�i;O'),
('|j��x7�(Q}�0�''�', 'wp-admin/css/list-tables.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ҁ�/���t��4NgS'),
('|��� ��Z7''��/"', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ru_RU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z�GP2�����\Z\\���'),
('|/�D��t�\n��Z�}c�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/CakePHPInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!������s�4�[Q'),
('|/ڒ�\0[*4��x��', 'wp-includes/js/admin-bar.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	} �.�,����'),
('|1�ķ�+V�K�f�', 'wp-content/themes/hexa/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B;��a`GԢ�މ'),
('|;�?���1��2', 'wp-content/themes/twentyfourteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ǎ?�n��Oj��eA'),
('|Z�����M��d�-v', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�爄�!���ƎЭ�hM'),
('|t&<����̫��CQ�', 'wp-content/plugins/papercite/lib/PARSECREATORS.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x_lK�%���K�^'),
('|��\Z��\rW�t�f�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-tr_TR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ڿ�p�����Ɨ�k�'),
('|�t|�Ay��\rA�����', 'wp-content/themes/twentyfourteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	�]X&2��_'),
('|�.M��h��\0', 'wp-content/plugins/woocommerce/templates/emails/email-addresses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3+��e^��0Ƞ#��'),
('|�HfA����O�m=��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-object-cache.php', 0, ':D����Y}��j��', ':D����Y}��j��'),
('|��r�I�}��Y�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/GravInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>�ޑ���U�@^L�]'),
('|��Y�>���	�Ɔ�', 'wp-admin/link-add.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u�G�D�/�ϥ�W��'),
('}ĉ=�t�����', 'wp-includes/images/toggle-arrow-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F���\\����CDr�'),
('}. ƪ{]��bW��y��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/.hgtags', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\r"�-�r�\0'),
('}`��g"P�2��V��', 'wp-includes/images/spinner-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\q��9)hdxR���]l'),
('}dv�@''.\n.��.�', 'wp-content/plugins/woocommerce/assets/css/activation.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ӆ���mea��''�$�'),
('}�%���\rV(���Pc�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{�m��­{(�n��'),
('}���>/\Z���+i�V', 'wp-admin/js/wp-fullscreen.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '54��N�Mj���"\\�'),
('}�7 ޘ�DHD�Pl', 'wp-includes/SimplePie/Registry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ȣ����1v9�d\0�ٸ'),
('}ǰ����r^�\\3��', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-google-analytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�} �%��=�P��'),
('}ٚ�ċc�������Ҏ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/translations.php', 0, 't\r�՘Q�@�L�te�', 't\r�՘Q�@�L�te�'),
('}��������Đ$�', 'wp-content/themes/twentythirteen/images/dotted-line-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��vL����sFw��'),
('}��.0����', 'wp-content/plugins/woocommerce/templates/myaccount/form-edit-address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��u�;\0\r�3\r�|��'),
('}�Ȑ�\\L��`���i)', 'wp-includes/ID3/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�����jQ���#1�'),
('}���{RҢ����"', 'wp-includes/default-constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!��Hʝ.�)Z���tI'),
('~Y������H��#\0�', 'wp-content/plugins/woocommerce/includes/class-wc-query.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LQ�''\Z�,Ui1sY���'),
('~4�9��o�?��S�', 'wp-content/plugins/woocommerce/assets/js/admin/product-ordering.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��p�1�/�~�m&k.�'),
('~9-�:�#�C�n���', 'wp-content/plugins/woocommerce/assets/css/menu.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��n�[��6a����'),
('~?�J�I�b*׺�e�C', 'wp-admin/images/resize.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�D�$�\r�Xv����a'),
('~F��㫎>dy��j�', 'wp-includes/css/jquery-ui-dialog-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7�j��4+\Zn6�x>{'),
('~p�jܟ�wu���', 'wp-content/plugins/buddypress/bp-core/bp-core-update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�1)�W�L(�E(1)'),
('~|�?nJ������=��', 'wp-content/plugins/google-analytics-for-wordpress/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f�XS�e�m�$ג�'),
('~ť�s\0�1y�$�L}h', 'wp-config-sample.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p\0�l�L��;ar�#bf'),
('~��N�ۘ��=�=��', 'wp-content/plugins/theme-check/checks/filenames.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��8��OS��ُm�'),
('~Δ�,z��G�h��', 'wp-content/uploads/woocommerce_uploads/index.html', 0, '��ُ\0��	���B~', '��ُ\0��	���B~'),
('~Ӥ�w�J̼���.�', 'wp-content/plugins/wordfence/lib/schedWeekEntry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D�1�D1����� .V'),
('~�\ZQG0av�߱ֲ�', 'wp-content/plugins/woocommerce/includes/shipping/local-pickup/class-wc-shipping-local-pickup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f:�c������"'),
('~�-`�?��8a�o��', 'wp-content/plugins/wordpress-seo/admin/pages/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�զ�x���Ja��\\'),
('1�*���P	X�', 'wp-content/themes/twentythirteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ؕZ&bC�%m����'),
('h�;�����e��q�>', 'wp-content/plugins/wordpress-seo/vendor/composer/ClassLoader52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ȹ	�Z^��+�}i��'),
('^k�֪Dv6�R�', 'wp-content/plugins/wordfence/lib/wfRate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ӳ��:�''_��G'),
('j&��^����b����', 'wp-includes/ms-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��sv�ɂhz�*�e��'),
('��j��)tP��@)�s', 'wp-content/themes/twentythirteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SğR��$�yj�;��T'),
('�y$yO[��N��Ly��', 'wp-content/plugins/woocommerce/assets/js/admin/wc-enhanced-select.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P��"Ҙ%�Ӿ�B�R�'),
('��b�h)��Du-Z��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AsgardInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\0 =�L��H(�w�MO'),
('�K�Q�}U&;&���Q', 'wp-includes/meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}�{q�	�g���'),
('鍕��c�B�w!��W', 'wp-content/themes/twentyfifteen/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ju���g6�6�'),
('�1hK�jS)J��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-action.php', 0, 'ݷ(�r躣꘽ؠ��', 'ݷ(�r躣꘽ؠ��'),
('�)uGz�(�%d֤�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/change-avatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H���w\n�ՕXp6'),
('�R�*�����������', '.htaccess', 0, '\\C�\Z��{&�P�#	nq', '\\C�\Z��{&�P�#	nq'),
('�X�vR�2��<�?F��', 'wp-content/plugins/buddypress/bp-forums/bbpress/register.php', 0, 'Gǁ��I�-�����	 �', 'Gǁ��I�-�����	 �'),
('�aa߈��J�}�\rP�Z', 'wp-content/plugins/woocommerce/assets/js/jquery-cookie/jquery.cookie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��N��$����W�$k|'),
('�zK�.g��v��%e2��', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��b�>�|''}:��\\'),
('��69H�_A*�@''A8', 'wp-content/plugins/woocommerce/assets/js/admin/quick-edit.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�P�EZu�T��[=�!'),
('���SP�;^ƭz��I', 'wp-content/plugins/wordfence/lib/conntest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��i?jw�z��B��V�'),
('��w�����uyD�)rd', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AglInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Cc�=W*��Dg'),
('��ՠ���d��7��vv', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/loader.wp-object-cache.php', 0, '3銝V��M�X5X6\no', '3銝V��M�X5X6\no'),
('�ϋ҈�S�G@Ҽeu�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TuskInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R\\�L뺵''����Q'),
('����SH���l\r�s', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Concrete5Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y�b������\\Ge7a�'),
('��ں�u���M���[\r', 'wp-admin/images/wpspin_light-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}�3��Y�(�I��m'),
('���+��0�����1', 'wp-content/plugins/wordfence/lib/menu_blockedIPs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D\n�6y!X�T	��&P'),
('����e��97�aJS', 'wp-includes/images/smilies/icon_smile.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��G)ö��u��\\\nM'),
('�@hզ���}���9�\r', 'wp-content/themes/twentythirteen/images/search-icon-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uQ+��00��\\�5(��'),
('�O��R��?��~�Y�', 'wp-content/plugins/woocommerce/includes/api/interface-wc-api-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���nH��R�섧����'),
('�el�5�s��E�úQ�', 'wp-admin/js/media-upload.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a�p�3� \n�^$e&z�'),
('�vZ���5��9F�G', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^,\Zu6��+S<l�s'),
('��,CUU����9i-', 'wp-includes/css/wp-auth-check.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�М�k�7��K��F���'),
('����kSd\n�⤑��A=', 'wp-content/plugins/woocommerce/assets/js/frontend/jquery-ui-touch-punch.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#u�w�<N�Iէ'),
('��~��v�N2G����', 'wp-content/plugins/buddypress/bp-core/bp-core-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '٤;E��A���b�.q�'),
('�ȉV?	��]�)A', 'wp-includes/js/media-views.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���2F���+t_�瓃'),
('��X����-�4�J�_�3', 'wp-content/plugins/wordfence/lib/wordfenceHash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ij[��Z�<�R�6"�'),
('�����''>�[��·�', 'wp-admin/js/user-profile.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼�>�9{7�w�1Ia��'),
('��a�\r�&�''6nm���D', 'wp-content/plugins/theme-check/lang/theme-check-nl_NL.po', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	��J)c��߾��'),
('�\n3#���J���N�', 'wp-content/plugins/siteorigin-panels/video/poster.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\nS�9Bn���F\n��'),
('�3��Ƈe�(ú9�', 'wp-includes/js/jquery/suggest.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!����^�~k�ۥ��'),
('��\\�(��wB��I�', 'wp-admin/network/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E�^�!��u��)�u�'),
('�(tTlDά7&��MP.�', 'wp-includes/js/tinymce/tiny_mce_popup.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i/�����8����'),
('�B��ه�v<Sv稳', 'wp-includes/SimplePie/Parse/Date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n2m0�H�����n''`'),
('�F� �GJ��B��s7�', 'wp-includes/js/media-models.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&�P��	wy�''3o� '),
('�W*A�`U���L�h㬌', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f���l����G{'),
('�]Q%�Ld��ċ�', 'wp-content/plugins/woocommerce/includes/class-wc-product-simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�aD����b><�5s-�L'),
('�]�*��@4%XC:wī', 'wp-content/plugins/siteorigin-panels/inc/live-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=_I�,ן��a����'),
('��\0���+OW+�', 'index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%0;��s��Dm\\�:['),
('���ܸ{:�K�v�=}', 'wp-content/plugins/woocommerce/assets/js/admin/order-backbone-modal.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��3aHj��M%yR?H�'),
('����.M2���\\�', 'wp-content/plugins/wordpress-seo/admin/class-plugin-conflict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#��xY[G�s��'),
('�����A���1\Z�;�', 'wp-includes/rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VYhƤ�3����u	�'),
('���_�8yEX�t�1�F', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-live-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!�9�l��''��b��'),
('�ǫ+�1���T;�N��', 'wp-content/plugins/google-analytics-for-wordpress/admin/views/content-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5���#��d�^�3I');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('�ɽ�\Z7��n�1�', 'wp-content/plugins/woocommerce/includes/wc-product-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}#\Z+��l�X�Ph'),
('�ʥE&U.q�g$�', 'wp-content/plugins/theme-check/checks/artisteer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8<U�\0�_9��f����'),
('��d/&y����ǴS', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/js/simplify-commerce.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���SG�(e���]��'),
('�\\<Jp�#���"���', 'wp-content/plugins/buddypress/bp-core/bp-core-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��!�\Z�*g�w��U+��'),
('�f��b�Y��Ma��', 'wp-content/plugins/siteorigin-panels/video/jplayer/Jplayer.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~���ǈ����.ͱ'),
('�1N�h��b�Q��,6', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-log.php', 0, '1���]�����z', '1���]�����z'),
('�wy/Y�}�TnO�%o', 'wp-content/plugins/siteorigin-panels/css/images/cell-width.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"g�w�,�ڋ-�`1^�'),
('���~���=J�{���k', 'wp-content/plugins/buddypress/bp-messages/bp-messages-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z=���pR�m���BS'),
('��?���z6���aDz', 'wp-content/plugins/wordfence/images/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K:�����m𙗣P�'),
('��\ra���f%dD\0d��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ZendInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<T����W<l0ӵ'),
('��v�JJE;��|\nm�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/OctoberInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���iΌ!��]o�_�'),
('���	��9���ʩ���', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{��P��GT���RFz�'),
('���ʆ��n�D㮖�(', 'wp-admin/css/install.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����E��րΦ{D���'),
('���#��,,0ۖh&', 'wp-content/plugins/buddypress/bp-themes/bp-default/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���uľt@�m4rs�'),
('��f�N�d�����L��', 'wp-content/plugins/wordfence/lib/cronview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|�c{U��>(v'),
('�-6e����m�&\Z�\r�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���	1\r�g�ʴ�'),
('�:+[��g��CZ���', 'wp-includes/template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's�~ǹ��Q9�Zl�=�'),
('�SdPk��י)����', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_WPCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ǉ:9+x��qo�f�'),
('�W6!��:����0�A�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P� ��:�n}�'),
('�b֗���yq�P�K�', 'wp-content/plugins/buddypress/bp-themes/bp-default/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s������e��q�'),
('�c���𫯪��w���', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/closed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��i�6��ڜ��4�c�'),
('�p4ȶ�DU;�<Z/�N', 'wp-content/plugins/siteorigin-panels/inc/styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÔPKP�vwf���V�a'),
('�~w�''��	� ��gU�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Signer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�xvmZ��j��M�1l'),
('�ĝYE	���$��', 'wp-content/themes/twentyfourteen/taxonomy-post_format.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v(���x0Ҧ�%\\v�B>'),
('�������"�i�$l�', 'wp-content/plugins/woocommerce/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ο�}�|�j�^*�8��'),
('��� ��n5�u�����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/utils.js', 0, 'c>%�a��۸��WU4�', 'c>%�a��۸��WU4�'),
('��7�ѕh�q!s�%l', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o �Q�b�~F�b�<22'),
('��A�j��V�-��ߓ�', 'wp-content/plugins/siteorigin-panels/widgets/lib/lessc.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^��Fr���L��譹n'),
('�󕂆@����\\���J', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-slugs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�W�R��W�����:w'),
('�B%v6�I"Jb��4ӡT', 'wp-admin/link-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��K�e��ڝ,�'),
('�I�A���s��hb(ӕ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd����;\\"2\ZŒ9%d'),
('�lɰp �_�8��Y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-taxonomy.php', 0, ':~ǉ�u��v���Ի��', ':~ǉ�u��v���Ի��'),
('�l��I�����{D�F�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-zh_CN.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B1�s5d������O'),
('��>�A�B�7�Sz!�e', 'wp-admin/includes/export.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����B��r��m��'),
('��s�dg�[�+', 'wp-content/plugins/woocommerce/templates/single-product/up-sells.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_�<6n�Yl''�\r�q'),
('�1�eU��MV��^��', 'wp-admin/includes/misc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V��p֪Z��b'),
('�8��l\0t�����c\r�', 'wp-content/plugins/buddypress/bp-forums/bbpress/readme.txt', 0, '��口Xv�/Q��/', '��口Xv�/Q��/'),
('�X`��S�mÂ�=I˧!', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b�9�9�CW�'),
('�r�ȬQn���;�', 'wp-content/plugins/siteorigin-panels/readme.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ӴԿȉ�>�Q��f'),
('��"����ؿ\Zle''j�y', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�&9�\0�w�R�g��'),
('���ʜ�K;C9�4�)', 'wp-content/plugins/wordpress-seo/css/metabox-tabs.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R}�������3uR�P'),
('���������h@�', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-history.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�iJ~��h\n\0E>�z"�'),
('���e�	5�4|`d㥭', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T	Mh�_<�ίW�@'),
('��\0�>#����z(', 'wp-includes/bookmark.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��I���I.e�#�'),
('��Q����i��\n��', 'wp-content/themes/twentythirteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�+��>>���ݪb��<'),
('���������}��', 'wp-admin/media-upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pˋ�Y��B�Z!\r�\\�4'),
('��"^�������?�+', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/users.php', 0, '�r�p]^,�/��', '�r�p]^,�/��'),
('���P�w���0�h�9', 'wp-includes/js/tinymce/plugins/fullscreen/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_"+)^0�b��`�[���'),
('�J�&_#��3S�q���', 'wp-admin/images/spinner-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\q��9)hdxR���]l'),
('��F\nGʐ�6 N�', 'wp-content/plugins/wordpress-seo/images/waiting.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NL2��<���ܲ'),
('��\\:��ڈ��)g,\\', 'wp-includes/images/smilies/icon_twisted.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b���.�8\Z|`�Q�LF'),
('��ꄦe\Zj~Syrju', 'wp-content/plugins/woocommerce/includes/gateways/cheque/class-wc-gateway-cheque.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't�s��4Ч��x�j\0�'),
('��6mU���)�rI��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���T�i�`���'),
('���3v�U�\Z3�P�^O ', 'wp-admin/css/widgets-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ItE���:?t��%.+��'),
('��L �U����f��u�<', 'wp-admin/images/icons32-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�P*���{>v��Uf'),
('��a�B�\0��\\H�`�J@', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/KirbyInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0�57ܚ\\Ңʮ�D��M'),
('��`��kYL_��h%''', 'wp-includes/theme-compat/comments-popup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X�U/����aڌ.u<.'),
('��Yz�*�\nʫē ', 'wp-content/plugins/papercite/papercite.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��qm�b���\rT"��'),
('��8>��``5�坃��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_classmap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j�F�6~Q�B׋�XI�'),
('��y��/��dz�Qg��', 'wp-content/plugins/wordfence/js/tourTip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z/�׳}�d���1Fٝ'),
('��H	��_���E����', 'wp-content/plugins/papercite/documentation/index.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@(Iȿr�M\Z��A@�'),
('��0��{f�Hf(�V<', 'wp-content/plugins/woocommerce/templates/emails/plain/admin-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P��56�≆��B��J�'),
('�$:SZ�ܽ�r2^�', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-session.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '늖�6����{����'),
('�,�ܷO���|��H�', 'wp-content/plugins/woocommerce/templates/single-product/product-thumbnails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?_,R��Y�m��w�'),
('�:=�%�����M�۵', 'wp-includes/template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���`�\r����mv�'),
('�:���y��3�S�x�C', 'wp-content/plugins/woocommerce/includes/class-wc-session-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D�%��)b�W�9���D'),
('�I�{�?��r�]��7', 'wp-admin/images/resize-rtl.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ےc�ZY�6��'),
('�a�k�-����h�8 a', 'wp-content/plugins/woocommerce/includes/admin/wc-admin-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FO�(��)��o�$oY'),
('��Ԫ�;��Ҷ�&��&', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-variation-download.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�Q]�Xs_�N��)'),
('��w��i.�w�(M;0D', 'wp-content/plugins/akismet/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,"�ڨwG�i���'),
('�7*���"{��\n�K<', 'wp-admin/includes/ms-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q4�ab=@����aS'),
('�?�8������Z��N�', 'wp-includes/ID3/module.tag.lyrics3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K�׬㑎��0�'),
('�f����i�m�_����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/functions.php', 0, '.ȓ�Q���dT�D�rJ(', '.ȓ�Q���dT�D�rJ('),
('�j��I���<꟟��iU', 'wp-includes/category-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!�ҧZ�O\0�U�K�'),
('�|�˘F�F[�U��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/notifications-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',��$r��3M2�d��'),
('����kC7b����)', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/tirquoise.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	+�h�����xN��'),
('���V"$6r�`�''i/', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's,�S4�ti���7�'),
('���ݨ1qg@��-�5', 'wp-content/plugins/woocommerce/templates/emails/customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-)��!Ho�Ӡ�,eq'),
('����b\0����uOL<�', 'wp-content/plugins/papercite/bib2tpl/lang/en.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���LW����\r}'),
('��W�R\r��sb���', 'wp-content/plugins/woocommerce/templates/checkout/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/9��{��q���'),
('��B]nȄ�8�7g��', 'wp-includes/images/smilies/icon_rolleyes.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ȼ�_�Ҹ*>,\Z�\Z!j'),
('��\rh�8����ׅ@XA�', 'wp-content/plugins/woocommerce/includes/class-wc-payment-gateways.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����a��~�0�3Nf'),
('�\0�O)@��Of�l�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/feedback-no-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`��G�Fn��(e�:'),
('���,z��]��Ǝ�', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']��ݻ\Z�2�*{���'),
('�4B�i\01������>/�', 'wp-content/themes/twentyfourteen/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����y�*s�$�uR'),
('�Mj�A�M��O�"If', 'wp-includes/SimplePie/Net/IPv6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Fy!j�ـ�����'),
('�ks�+0�7a7� p', 'wp-content/plugins/woocommerce/i18n/states/IN.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�����O`�����'),
('����a�A�-O��8�', 'wp-content/themes/hexa/inc/style-wpcom.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\0ݥМ���''a'),
('��q�7�L��Q>q\rg!', 'wp-content/plugins/woocommerce/includes/class-wc-form-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	���["7��jm�rho'),
('�� ��D{���<W�)', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/global.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r[��;L����k��'),
('����2���@��my�4', 'wp-content/plugins/buddypress/bp-themes/bp-default/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O�<��oX����#h�='),
('��$��xM1>�_8P\0', 'wp-includes/js/swfupload/swfupload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:�E%ρz���s~'),
('��׺Ū�xQ���', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/responsive-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��n_��χ!g�2��.'),
('���6�d��x�D��', 'wp-includes/js/mediaelement/background.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p<e�K�c�\\c8�r~\0l'),
('��-ލݱ$�j�um��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';��y�Wv.\0����'),
('����<�D+q	�;�{��', 'wp-content/languages/plugins/woocommerce-es_CL.mo', 0, 'I����vG)$�2����', 'I����vG)$�2����'),
('�Cf0y�v1/~h�', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-styles.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[k���/��"ȕ�:{g�'),
('�*0�T?��"1i-�:2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/LaravelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����=`��w�2��6�d'),
('�1f*�lw���ȐI', 'wp-content/plugins/wordpress-seo/images/banner-local-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}�s��/Z�.]e��(�'),
('�73��~�;��yZ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��kT���!�ƅ�'),
('�Bf	�pG\n�#���U�I', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile-base.php', 0, '��uj�o߈�hP�#\Z�', '��uj�o߈�hP�#\Z�'),
('�`H��4��p;�M�8', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/friends.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm� �U�v�I�>~�'),
('�n97�I.O�ҝ޿�', 'wp-includes/js/heartbeat.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��톙�@��Cm'),
('����q𷞊�D��`', 'wp-content/themes/twentyfifteen/js/skip-link-focus-fix.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t���>:{������'),
('��_?;g��\\��,�G', 'wp-content/plugins/wordpress-seo/admin/class-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��頫Md����J��\n�'),
('���\r��j�\ZՊ�R5�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/buddypress.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��y��u��M�0'),
('�������clp�,j�', 'wp-content/plugins/wordpress-seo/images/Woo_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3JUC4���t�P���G'),
('����h+��B����', 'wp-includes/js/tw-sack.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���''��7�ē��n�̄'),
('��F�"��vh�$Lb��', 'wp-includes/js/imgareaselect/border-anim-v.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' �z!�<�7������*�'),
('��yc�0O�g)ρ�Mf�', 'wp-admin/network/site-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ܐEw\Zo-yij�'),
('�?�\n5��H�?������', 'wp-admin/css/customize-controls.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M���c?ۮp"D+�'),
('�����juGCtO����', 'wp-admin/css/colors/coffee/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F`a|���h�\0�#��'),
('��l�.H|S���{��', 'wp-includes/js/jquery/ui/effect-transfer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p��+h�6�k���A�'),
('��u��d*�oZ>��', 'wp-content/themes/twentyfourteen/inc/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l�	W�0����b�6�'),
('��ʲ��{$��KZЙ"C', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/ResourceList.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T��"�#�"5r������'),
('���an���V=Ty X�', 'wp-includes/SimplePie/Copyright.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��h�T��	Ù���j'),
('�^���]�_|�]��]', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.pie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����z;5�FdM�ɬ�'),
('�qٺ�W����o��\0��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-query.php', 0, '''��2�T_�Ͻ6԰^�', '''��2�T_�Ͻ6԰^�'),
('�} �yT��Z�H�cDJ', 'wp-admin/js/custom-background.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��#Y>W� �����e�'),
('���<E�O��)��\0�{', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�J���a�_S��#�'),
('��x�q�3����~bV̷', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/class.bb-install.php', 0, '''�\r��5R�2�j�M��', '''�\r��5R�2�j�M��'),
('���m?T��ן4�s#', 'wp-content/plugins/woocommerce/templates/single-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Mx1������)�6'),
('��kR:��lh��Զjq', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.stack.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9}j/L\n�''\r_E����'),
('��{�0l(Ʋu9,wS�u', 'wp-includes/js/media-audiovideo.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z��?����":tp��'),
('�����xv���P��zC', 'wp-content/plugins/woocommerce/templates/global/wrapper-end.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n��a#�ϫ���2P�'),
('��8�Ӆ�E��2�', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���FA_�M�a���'),
('��;\0�����]�oK�S', 'wp-content/plugins/woocommerce/templates/emails/email-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':�x��Jfӌ�h���'),
('��e4� Y��7��.Y-', 'wp-content/themes/hexa/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O<u��[�L�x�Ә��N'),
('� �A$ۤfC�N��37', 'wp-includes/query.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~��{	��>�ϸ�'),
('�(���ה�W�h@=a', 'wp-includes/images/smilies/icon_mad.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '׾�ie\Zc�{��0'),
('�9����>ݴo� e8xy', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-emails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zc�d��Ǐ�wc|�0�'),
('�RLS�f,�@��L=�.', 'wp-content/plugins/wordfence/lib/menu_activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J��@kт&`Ť��rt'),
('����v���ό�Y9�', 'wp-includes/ID3/getid3.lib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����p�sQ�F����0'),
('��֗]NR���S{qv?�', 'wp-admin/css/wp-admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{}��-�G�hՖ�a}'),
('��*Ϡf���Ju�^��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-object-cache.php', 0, '�\0k�<�=o^�H.', '�\0k�<�=o^�H.'),
('���Ĭ+�����0', 'wp-content/themes/twentyfifteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�:OTP��� �0[In�'),
('����#���/ZĆ�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*���9�r<�Ke�qx�'),
('��%:I�*����iȇX', 'wp-content/plugins/theme-check/checks/directories.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ktAÛV�V�k�BN'),
('�$�����j�X�])D:', 'wp-load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:j�ԙ\n[.�|p5�'),
('�*z3x<Z*��\r�D', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����ǆ���'),
('�6�Y��$f\n�3�)z�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V���27�NB�'),
('�d�%Ã��yD�R>nuk', 'wp-content/plugins/woocommerce/includes/admin/wc-meta-box-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��G[\Zߗf�Ϯy��'),
('�j%M�ɍ��p)Z��', 'wp-admin/images/generic.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����''�[#98!�'),
('����������&)', 'wp-content/plugins/buddypress/bp-themes/bp-default/links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2�����_$��9.�'),
('�̶��H!N)&:��f��', 'wp-content/plugins/papercite/papercite_options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���!��xyaǻ�=���'),
('��;(Xp`ҙ��pݷ', 'wp-includes/js/plupload/handlers.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��o��&��0��t'),
('��t�0�g�a�/���', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7�� ���A�hf'),
('�\n�qo�qZVyX��9', 'wp-admin/includes/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FI�ҖT������F'),
('�Z�{g�}�f�-��0\n', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_classmap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w�\n���M�d�P.�"'),
('�?M>�>�;��v�>''', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_styles.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s{;�e~~�3T��'),
('�@�����8O�+�M?�', 'wp-content/plugins/theme-check/checks/more_deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����|9���}H�m'),
('�[\Z� o�o�@ ��)', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ֆے�Hƹ���F�Z�'),
('���mZN^���\nϴ�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_MediaFileUpload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aα�	ꥺ;�Aj|�W'),
('��X,�,���I�7�', 'wp-content/plugins/woocommerce/templates/emails/admin-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0�R�G�Rq��&�+,g'),
('��Ư	''CԻ��ګ\Z', 'wp-includes/images/admin-bar-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S���:�W����^'),
('��"�Z0\0ؿe�Ԧp�', 'wp-admin/css/admin-menu.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']B�7�''x(���s'),
('����x8[!>�X', 'wp-admin/includes/class-wp-users-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?����\0''1��dNX'),
('���A̷�̩X�g�T', 'wp-content/plugins/siteorigin-panels/tpl/admin-home-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�\r&����O����*6'),
('��#��N��Q�M9_ݟ', 'wp-content/plugins/woocommerce/assets/images/chosen-sprite@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�>�!���Tl��V�'),
('��?�6IL�"���r�6', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/interface.js', 0, '�����Ҋ�_����@�C', '�����Ҋ�_����@�C'),
('�)Ƥ���`��?F���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_AssertionCredentials.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4u	��s�����2@�'),
('�7��ȕtR-$T?i1\Z', 'wp-content/themes/hexa/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�X����8.Y���8�'),
('�M4����4��u\Zީ��', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ы/)����K�'),
('�S����KK2iɈ', 'wp-includes/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZmB�元�#&��M�'),
('�\\5��e�%nR1�U��a', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-tag-cloud.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���w��D���(���'),
('�]��e�HA�b����', 'wp-content/plugins/buddypress/bp-activity/bp-activity-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�VzL>�Z�K#���A$'),
('�y�g��zaU"�	XKG', 'wp-includes/js/hoverIntent.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EB���yt�6�'),
('�\r�`��� �7��x�', 'wp-content/plugins/akismet/views/strict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�s�LU1Y��V�s��V'),
('�o�/�d��4x`��', 'wp-content/plugins/akismet/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o��E�f�ι6p'),
('��/¢;̓�̗��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/style-rtl.css', 0, '��m�	���.V�Q�Ό', '��m�	���.V�Q�Ό'),
('�e��ӵ��|��}��', 'wp-content/plugins/woocommerce/assets/css/prettyPhoto.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-ʂW��������]'),
('�v{L�Jlō�Yz�`�(', 'wp-includes/js/thickbox/thickbox.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����*�Fr��fa'),
('�{�;''5�4��''v�Ó�', 'wp-content/plugins/siteorigin-panels/video/jplayer/jquery.jplayer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��O��T5�$��''am'),
('��>��f\0>a�m�I', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����I�k�^�#'),
('��#"	�O��0��k�$', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/notifications-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����RJѤ����j'),
('��Q%*�Pq��yC', 'wp-content/plugins/woocommerce/includes/class-wc-product-variation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:�\r�:ѧ@�W�'),
('�-4�\0AA��N�^�''', 'wp-content/plugins/woocommerce/i18n/states/CN.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\r[z��p��+�m�'),
('�X�VטO|8}���', 'wp-includes/theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'цE����;+�V�ke'),
('�U1Ԙ��wg�OYp��A', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-payment-gateway.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Eg���T5��\Z�'),
('�V}�P���m�/�|I*�', 'wp-includes/js/customize-loader.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\a�Ƅ�7�`��\ZH_'),
('�Wb	������@%A�', 'wp-content/plugins/wordpress-seo/css/adminbar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 2i�j���:��=>�'),
('�d��jW[��y�ϊ�', 'wp-content/themes/twentytwelve/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r���2y���_8�\ZY'),
('��.��v8-rJŕ�qQ', 'wp-includes/js/wp-auth-check.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���������b�c\Z+'),
('��n��4�ۆ�x��', 'wp-content/plugins/wordfence/lib/menu_twoFactor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��J�eS�h[�\Z]ԊԀ'),
('��G����y?��''��M', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_BatchRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��B\n�Msng�$�\Z'),
('��5�xQ���C�N\\r', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-ajax.php', 0, '^(*O�*�)?�����', '^(*O�*�)?�����'),
('��7��E#�wŧj���', 'wp-admin/includes/image-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h��+\n��+O�t� '),
('���j�UWO!�Ul�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/FuelphpInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�K���{~tbYb'),
('��pK6b��1���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-dark.gif', 0, '��1{�������z��o', '��1{�������z��o'),
('�����$g]��\Z�$8', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-config-sample.php', 0, '��.� �DN����', '��.� �DN����'),
('��F�\nK})u�>��n', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocomplete.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(r�Q�B�*R���'),
('��!U@��I����2�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-variation-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��}?5�\0{+R�_�Z'),
('��1/�m#a�]c8��', 'wp-content/plugins/woocommerce/assets/js/admin/wc-enhanced-select.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�c��Q�-H����'),
('��v���|�-��', 'wp-includes/js/tinymce/plugins/tabfocus/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���6������t��'),
('���\Z3��+�W�tNG', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg.mo', 0, '������y4D�N��', '������y4D�N��'),
('�F�[xYYt�>x2', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/diners.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��A��vܰT���S�'),
('�!HUN&�"����z��', 'wp-admin/css/widgets.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�M��V� RB>S_�$'),
('�+���\\<Q��	Z�!+', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/app-side.pot', 0, '��ɪ�h��r��k', '��ɪ�h��r��k'),
('�a�tU�q�^!�0ƣl�', 'wp-includes/post-formats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��	���ꊿ�آ;'),
('�k���zߣ����bo�R', 'wp-admin/post-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ļ��T��}c������'),
('��@��{�J��5䷴X', 'wp-includes/js/tinymce/skins/wordpress/images/playlist-audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U,�:)��؋"�QqY'),
('���zA�<.�]�$6', 'wp-content/plugins/papercite/bib2tpl/helper.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���wʯ\Zޡ��=	'),
('����H��\\�{��B', 'wp-content/plugins/papercite/phpunit.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���M�CX>;��YH�'),
('���:k�+8���Z', 'wp-content/plugins/buddypress/bp-friends/bp-friends-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%��y;�ͮa�պF��'),
('����L��6	���׳', 'wp-includes/ID3/module.audio.ac3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�N��E�p:�A��Z��'),
('��� ���Ad��_5d', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/member-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7Q�K2+ �}c�''+^'),
('��	 ����L�y�w�', 'wp-content/plugins/papercite/bib2tpl/bibtex_converter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>K�fL{&�����~'),
('��T��V�����\\��', 'wp-admin/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��l���@UR`�1*�'),
('��B[���C���*�mb', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/images/cards.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'շ�JT�����:�'),
('�۞��3��2��@-���', 'wp-content/plugins/woocommerce/templates/cart/cart-empty.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6֏���\r͚���FY8'),
('�ܵ[Ҳm%�6�S8:D', 'wp-includes/images/toggle-arrow.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��·�a��;�d��*�'),
('����!ެ��߳���p', 'wp-includes/images/crystal/default.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�>)*/��!�-�'),
('���0�B�iRR�q�y', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/class-api-libs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!3Gu7꟎q''��R�a'),
('�T�)��$�K8�Ú�[', 'wp-content/plugins/woocommerce/templates/single-product/tabs/additional-information.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�o+\0��	݉��v[y'),
('�[�g��{���i=c', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Ɲ\n%\0���'),
('�^#2���\r�u�A�', 'wp-content/plugins/woocommerce/includes/wc-term-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K���O�H7��'),
('�a�<�d��Q�8���', 'wp-content/plugins/wordpress-seo/admin/class-bulk-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't�%)(��[g�X��'),
('�h�����FuQe� �', 'wp-includes/images/wlw/wp-comments.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L�6]P����.s���'),
('��t��L#�ɿf���2', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg.po', 0, '�X���	��zN13', '�X���	��zN13'),
('��f0��ͭ��~�)', 'wp-includes/fonts/dashicons.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x�����a�\rI�~t~�'),
('��FV�<vHta�S���', 'wp-content/plugins/wordpress-seo/css/yst_plugin_tools.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��)�\n�(���F7ɥ#'),
('��2�P�k�Q�OzdW�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-�tjO��1m}p�'),
('�x?ا*ZT~���h��', 'wp-content/plugins/woocommerce/includes/admin/views/html-bulk-edit-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*��[����8r?�{'),
('�6�|;�;8�Q�4�k��', 'wp-admin/install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��-���.>F�V��'),
('�9�e�E��bݾl�3�', 'wp-includes/js/wp-lists.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t|r��5��xŇ�ґ'),
('�W��  ������|�', 'wp-content/plugins/woocommerce/templates/myaccount/my-address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.��H�*Ȫl��\n!��'),
('��\Z5o��#R''/��l', 'wp-includes/fonts/dashicons.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '΢6d����HD��Qك'),
('���k{{_F,� ���', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/send-invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v,f��<���V�/'),
('��ש)�׵�g8����', 'wp-content/themes/twentythirteen/images/dotted-line-light-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<νq3x�wxr\\ 2'),
('����E�?��Юᾠ', 'wp-includes/js/media-views.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<m�P4��[�ݺ�b�'),
('�ĥ�"8Vҹ��i�[�2', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-http-ixr-client.php', 0, '�&9Jfp߻����', '�&9Jfp߻����'),
('�˥`8���(��	�', 'wp-content/plugins/woocommerce/templates/checkout/form-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sk\r��>7<׆��2'),
('�̷i���Y	��8le�', 'wp-content/themes/twentythirteen/languages/twentythirteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MB�-g��GG���m'),
('��Cg����}|�E��', 'wp-admin/js/word-count.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�̮�E��^�:��/_�'),
('����Ѡ�/�5�qaJq�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/loader.wp-object-cache-memcached.php', 0, '�K/_����NHz����', '�K/_����NHz����'),
('�	�2ʹ$�����', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*��0�z�	EF�k^\\R'),
('�	v�O.�|ߤҵ�', 'wp-includes/js/tinymce/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']�t"ٞ3��[�t�|'),
('�ך�GV�˺Ig�Hs', 'wp-content/plugins/woocommerce/includes/class-wc-post-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O�D��X娣.Ы'),
('��uR��0>W�s�1i', 'wp-content/plugins/papercite/papercite_db.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��e����	�t��u.�'),
('�(��wփ������', 'wp-content/themes/twentythirteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c��myb�/"�s��'),
('�A�ęe��[)^-��', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-styles.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t�5	erR� ���y\r'),
('�J\r,5��"��:�k��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/groups.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�t��ɫ[�������'),
('�t����Y������?�', 'wp-content/plugins/siteorigin-panels/widgets/img/textures/dark-dashed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������w\r�u$���'),
('����M�L�^��W', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.0.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l�.pSi�=���P�<ӧ'),
('��w���-���S�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum/topic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\ZJ��Nq�<%L'),
('�����������m', 'wp-content/plugins/woocommerce/templates/notices/notice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't:M��Ⱥ��II����'),
('�ģ�e�Oկ�t9�x', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/FuelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^��q�{�3\\�g�'),
('��b�������|e~�', 'wp-admin/css/customize-widgets.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�N��)��*w�`�n�1�'),
('�\0h�Kf��\0��', 'wp-content/plugins/wordfence/images/forward_enabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U\0/3e4e������'),
('� �dlķ��޾4�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ro_RO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g>���_�\rZ��C�'),
('����8(\Z�j�Z]}', 'wp-includes/js/jquery/ui/effect-pulsate.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r(�;�:�-IQF�ȭ�'),
('�K�t!�����Z�n�', 'wp-content/plugins/buddypress/bp-themes/bp-default/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9��%���(vGJ��m'),
('�X����g5����(�=c', 'wp-includes/js/tinymce/skins/lightgray/img/trans.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7I �1F�Gu�j^'),
('�n��(�}b�ˠT�_�', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oEz���*�\0��z�w6'),
('�pt_ Y����7L�Kt', 'wp-admin/css/deprecated-media-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tA:$��cOu�=NT�'),
('����T��D��F�K1�', 'wp-admin/css/media.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q8j�.��D�����'),
('��F�%l''iӽ8mA�', 'wp-content/themes/hexa/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4b��-�+l��'),
('��/GΞӶ[�ǜ��C', 'wp-admin/js/gallery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K~�l��\Z�'),
('���[�/�9}�`:w�P', 'license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '98��v���h\ZP֡�>q'),
('��+P��l���P$TG', 'wp-content/plugins/theme-check/checks/iframes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z�^�\Z\n\\]�J^S�'),
('��YM��~�B��''', 'wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(Ģ���&λI�f'),
('�\0�����.}�fwA', 'wp-includes/date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ed�WMX�1��'),
('�ȆE�z�Y��:���/', 'wp-content/plugins/buddypress/bp-themes/bp-default/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!��u�>#��9��*�'),
('�"�k��IQ�K�=', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/SilverStripeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(��*A��VMH=I'),
('�3�8�K�����.C�', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-ipn-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɯ����.:(��|2'''),
('�8���Jl;�ؓs��\r', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/LaravelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����=`��w�2��6�d'),
('�O��:������u_Op', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-plugin-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's\Z�y��ow�ђ��\r�'),
('�[���QH"pS1Ȫ�c', 'wp-admin/images/arrows-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� Q��}��ydb#6�'),
('�j��6�J��4����', 'wp-content/plugins/woocommerce/includes/wc-cart-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��	�UGil7���%L'),
('��H@��T&�I�Ĥg', 'wp-content/plugins/woocommerce/templates/cart/cart-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l/i>�Q�m���R�6'),
('�����Sb�g�zJ��', 'wp-content/plugins/woocommerce/includes/api/v1/interface-wc-api-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ͱ�/�P�������'),
('��[ixT�q��~Wv�e', 'wp-admin/network/plugin-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�͚�GM�XZ\ri=�'),
('���B1�\Z*Xs�r��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/messages-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��8ͬ��.��D�q�'),
('����Ⱥ>��6k�笤', 'wp-content/plugins/woocommerce/templates/single-product/short-description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�صB*\r�$tB^l�\\E'),
('��<`�����3[^�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]�{������0�lMD='),
('�ٓ��3�I|qg��,�', 'wp-content/plugins/wordpress-seo/css/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('��EN0����6', 'wp-content/plugins/wordfence/js/jquery.dataTables.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aG��z�����׳�'),
('��)U�t��>;>�	', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-theme-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�ΨDx긠�X��'),
('�����>8������\\�', 'wp-content/themes/twentythirteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�N=2lX�h���,\r&L�'),
('��(|.�z�]ۀ���)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ElggInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Ṕ�����x�ǐ�'),
('�\Z-��x7��(A�4���', 'wp-includes/js/swfupload/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[�`�^�-�o�QWz'),
('�1W;c�����N��"�u', 'wp-includes/pomo/streams.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ܐA6;�`M��'),
('�4=�c�G�Hͺw���', 'wp-content/plugins/wordpress-seo/js/jquery.tablesorter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7jB�=���e�b'),
('�BĶb���N���', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���_�\Z�X���'),
('�J��B�GT�;,l��T', 'wp-includes/images/smilies/icon_exclaim.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\�qE�\Z!HY__=�{_�'),
('�_j����,�TL{��', 'wp-content/plugins/wordpress-seo/CONTRIBUTING.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�zP ��a�k8���=V'),
('�c\n�T��>wѨ���', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�z)���ʺ�E�'),
('��%���h�6+�>�3-', 'wp-content/plugins/woocommerce/includes/class-wc-api.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+����?�/N�\\4��'),
('���7�M3�$��', 'wp-includes/images/smilies/icon_question.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''u��&E�qA���mN�'),
('����2@�k�w>K�2', 'wp-includes/feed-atom.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q5B���4���D\nW'),
('�����H\0ۙ��h�C��', 'wp-admin/css/colors/ectoplasm/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ˣ�56���`�=\n�/w'),
('��wt�H���-s�\0�n', 'wp-includes/js/wplink.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^m��;���q��)<'),
('���LǊ�3��mKM�h', 'wp-content/plugins/wordpress-seo/frontend/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('����=֬H�@-i��', 'wp-includes/css/admin-bar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�3XhH����\0�t�'),
('��K8d��;<����v�', 'wp-content/themes/hexa/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�1k��\ZN��+�>�'),
('��h�L���JH�X#0', 'wp-content/plugins/wordfence/lib/wfUnlockMsg.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ϥA��]Q�!y>�@Y'),
('���^��''�q���0��', 'wp-links-opml.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c���v��Il�mf�'),
('�	�#J�_4j��U�0�', 'wp-content/plugins/wordpress-seo/images/News_SEO.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�|ߣ�H?=��8�y$F'),
('�vn�\\��?<]h��', 'wp-content/themes/twentythirteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� k gd9��5Gp'),
('�dv1r�c����IKr', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PhpBBInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}��,�S=����T�8�'),
('�%n��Tߒ	^�gXΰ', 'wp-admin/js/inline-edit-post.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�8ŏuP|��\Z��P'),
('�,��o��s�uW�A�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ShopwareInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��޹M+�-���6�\\f'),
('�;���������w�D', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/defaults.bb-filters.php', 0, 'Ak�+�؇�j�X����', 'Ak�+�؇�j�X����'),
('�u�aruc0��L��', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.dimensions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b����*�(�	��`;'),
('���T�IG\0=�u��\0�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*n�Y�o��Ƣ\\[]�'),
('���9��:S[K�J�', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J���]qC/�\ZX��'),
('��|�''�R:XL���;�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��3�u]]�>~��'),
('��1I/�P����PX', 'wp-content/themes/hexa/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|l�|	�R��\rإ{'),
('��,�qqM��c���ߛ�', 'wp-content/languages/themes/twentytwelve-es_CL.mo', 0, '�\Zd���`Z�+x:�', '�\Zd���`Z�+x:�'),
('�ҟ÷������', 'wp-content/plugins/woocommerce/includes/shipping/free-shipping/class-wc-shipping-free-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0^�H�FG\Zv@ݠ�(��'),
('��!��4��r��]�', 'wp-content/plugins/wordpress-seo/wpml-config.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�v\\���*9G;��3��d'),
('��)D�~L�:թQ �o', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]�{������0�lMD='),
('�\0�!jy����Ӭ���', 'wp-content/plugins/buddypress/bp-core/images/60pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��YSMi�x ˀ�n�'),
('�$��"�0��syu', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y����*���cz�bo<'),
('�5����\r��k��', 'wp-admin/js/color-picker.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����2dMM��T���'),
('�8�������P5aĨ�	', 'wp-includes/images/smilies/icon_wink.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\ZO�Z���g9�4�'),
('�\\�|\Z�qt�nݤ�.g', 'wp-content/themes/hexa/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�W&� :��\05�-('),
('�d��[���8��4�ky', 'wp-content/plugins/wordfence/images/wordfenceFalconSmall.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��h�j�K�w�~��'),
('�l�d�՟�L�1u0', 'wp-content/themes/twentyfifteen/css/ie7.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dh��=�[KM7��,��'),
('�����y85���æb�', 'wp-admin/css/colors/sunrise/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Hp��������''��'),
('��j|\n��l�V���7�', 'wp-content/plugins/siteorigin-panels/css/images/tooltip-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���`r���j� '),
('��[�	�5�c#�QtF', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_CurlIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-{�2�\n<i�r�d�M�'),
('���Q�V򑨰�Q���', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B����A[K_x���\Z'),
('��0�%XKr���]�*��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=��W�{�\r��A@�'),
('��?Y~ rƵ|����P�', 'wp-content/themes/twentythirteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��z�j+�=�B�m��j�'),
('����PQ�E|E}7+', 'wp-admin/includes/class-wp-filesystem-ftpsockets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$,�=0�G]��*d)rAC'),
('�֢\04��a���\Z7cH�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/autoload_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u��v0At�f��'),
('���1{�����l�7�2�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Verifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�W�\0''���5%��'),
('��U���$�\\*�1^�S�', 'wp-includes/js/jquery/ui/effect-clip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s��� :�(��\0���'),
('��P\Z��/���l%�', 'wp-includes/js/jquery/jquery.hotkeys.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '┃��&�݋\rFư��'),
('�l&I�Z=�\\[�Y��', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-da_DK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��"lu��4�(u���'),
('���@HvS�a�Z��', 'wp-content/plugins/wordpress-seo/admin/class-metabox.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',l���f_�����	'),
('�\n%f[!aE�r�tg�i', 'wp-includes/images/media/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����u�h����q��'),
('�#��>��҆�Kl', 'wp-content/plugins/wordfence/lib/pageTitle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Hh�I��!S�??k'),
('�&�S짿o�$��0�n', 'wp-includes/author-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N��GH:�O�=�D6�'),
('�&`�o�J{6�n[�', 'wp-content/plugins/siteorigin-panels/css/images/cell-selected.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ø�6V�Z&S���0x'),
('�''P��T]�	�6�~�', 'wp-content/plugins/akismet/_inc/img/logo-full-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!M�pP��`-6����'),
('�:���Q��5_Q!b', 'wp-content/plugins/woocommerce/templates/single-product/rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Cp>�^��ҲB��A'),
('�=Ae�8V-�I�\\�m�', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.resize.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f�DU���$��'),
('�Q����ԁ�2�7u�L', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ӣσ�$57�|�}'),
('�p�V�l�i"�"I�p�', 'wp-content/plugins/woocommerce/templates/single-product/sale-flash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b2N��mN��Ts�Qd'),
('��g%�v�C;e�%', 'wp-content/plugins/siteorigin-panels/lang/siteorigin-panels.po', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����W-!m�����'),
('��Ѻ�"�P5��^U�\Zi', 'wp-admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''����\Z�Y��w�/'),
('��m���z4�L��K', 'wp-admin/images/xit.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)�X��`1���H��'),
('����A�G,��<���', 'wp-includes/js/jquery/ui/effect-fade.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G�q�oE�=\0�)'),
('��uU�����`�d�D�V', 'wp-content/plugins/buddypress/bp-core/deprecated/2.1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ʟ?�`qb����d�S'),
('��pX�I}����y�', 'wp-content/themes/twentyfourteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��%���o���''�'),
('���5�K�k�� ��B', 'wp-content/themes/twentythirteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z��k\\���8F2Y�A'),
('�p��fkN�~��', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/discover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�!��_�)t���0B');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('� �n�$��q��^qf��', 'wp-includes/images/smilies/icon_lol.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��M�Z8|����,���'),
('�*T�u\r�����~�m', 'wp-admin/css/colors/ocean/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n����l6�>($n��'),
('�E-j��1j��\r�E�', 'wp-includes/registration-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_?<���&T�xH�X�CL'),
('��g"Wj�ţ8UP�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_WPIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tbA<�]V�R���Ϙ'),
('��p?E^�@�''��PE�', 'wp-admin/edit-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����>ߝ��<r̜�C'),
('����^��?��Çh��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z)�&E�����`�>��'),
('�o����~�4\\:�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-auth.php', 0, '��\Zc��,�8P���', '��\Zc��,�8P���'),
('��r\0����*��R�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ar.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0dk%��f͢yy��'),
('�''�2�)��x��Ǽ�', 'wp-content/plugins/woocommerce/i18n/languages/woocommerce.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��#��+���ϒh�'),
('�<��(����*A]�O�', 'wp-admin/css/colors/ocean/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����e��n�<�$�mk'),
('�Q\rWl�˂�a6�I�s', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.editorconfig', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E�h&/�Ӈ�����~'),
('�bv��E��H���΄', 'wp-includes/js/wp-lists.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L�.�+#/*إ�I08o'),
('�����F7�m�N�Z�', 'wp-content/plugins/woocommerce/templates/myaccount/my-downloads.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8����Oݒ�y�k���'),
('��x��L��Y�����', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-logs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q��a�8S�J�I��y	'),
('��������K��', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g� ��P�mwf����'),
('����&U�D�ɱ���^', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o �Q�b�~F�b�<22'),
('���&��N�,���6P', 'wp-admin/images/icons32-vs-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*04�G4F�	&Z�i}"'),
('��i��x�9p�w疧', 'wp-content/plugins/woocommerce/templates/loop/pagination.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ǳ�R��Ϟ3���lI��'),
('�\Z]�}7�?$j\\�%�', 'wp-content/plugins/papercite/documentation/bibfilter.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_Dz���}Z�K�х�]'''),
('�?�?�4�x�\Z.*Dd��', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����(��f��T#�kB'),
('�q�h���Bc�92��', 'wp-admin/network/site-themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�d��Ej<ֵd�r�'),
('��d]\0F�mŲp�D', 'wp-includes/js/tinymce/plugins/media/moxieplayer.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NY�N�-���3Yj���'),
('����`%��{���+��', 'wp-content/plugins/wordfence/images/icons/error128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:�%7�!��.�'),
('���v��\\Q���-��', 'wp-includes/js/tinymce/plugins/hr/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\#%Z����,3�I�8�'),
('��і�q��SGKy(�', 'wp-includes/kses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�Qg�ٙv�r�'),
('��Ow����>Q�', 'wp-content/plugins/theme-check/checks/include.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':�zs�]V���\\υ'),
('�[�Hn[P�.~���FU|', 'wp-includes/nav-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�ee�{�ٜ���'),
('�tAH(JA��;t�\\�', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/activity-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�9�p��{E�=_KI\r�'),
('����Z�\Zxcy�d��''', 'wp-admin/js/language-chooser.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h"8Jq	t���F��'),
('���+>��o�ґ��', 'wp-content/plugins/wordpress-seo/js/wp-seo-bulk-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'XrSCh�R���\\i/�g+'),
('��$(i*q�&#�z�t', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PuppetInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b�U�y�ͅ���\08'),
('�����:x��=�}�', 'wp-includes/js/jquery/ui/mouse.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';<���ϣ	''�-Ó'),
('��;�;/J�KmR��0�', 'wp-content/plugins/akismet/views/start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W��0Y��Hvַ�#'),
('��C��ByIw�X�ɾB^', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-report.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$5l��l�aB�R���'),
('��y�&a�A�7�]Dm', 'wp-content/plugins/wordfence/images/icons/ajaxRed16.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���%���B\ng�2��;'),
('����4��g�`��k', 'wp-content/plugins/wordpress-seo/admin/pages/bulk-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c����T7kws4PcF�'),
('� a"KwT�bc1S', 'wp-admin/css/revisions.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f��~�~\0�Ckm6'),
('�4\Z�r\0}lq����''�,', 'wp-content/plugins/woocommerce/i18n/states/AU.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7���O�gEV�m�'),
('�4g��e���>���ߝ', 'wp-admin/images/list-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hջIS�2��i�g�'),
('�C-8_�<8�j', 'wp-content/plugins/woocommerce/templates/emails/customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z��w=���M�}S:�0�'),
('�fkj��N�Uei4=%�', 'wp-admin/js/tags.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/I�@�!{�hL�R\Z�'),
('�y%���Ǻ~�ne"V', 'wp-admin/css/list-tables-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a�ޞj!����f,1'),
('��4�Ӑ7��2��', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-�2�tt�\0�r��'),
('��h/�8ϕ/�7N�IF', 'wp-content/plugins/woocommerce/templates/content-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Vo�TƦø�@�'),
('�k��PI,\rc?ۓ�', 'wp-content/plugins/buddypress/bp-core/images/Jcrop.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��!�r,B3�7�[��'),
('�-�׮X*�w�!�F�', 'wp-content/plugins/woocommerce/includes/class-wc-coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':y>''-2�uk�,���&'),
('�1�o%��q�A��', 'wp-admin/js/inline-edit-post.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0kI�rf�s�\nF����'),
('�Cx���o;���', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-history.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���x��fFѭ01�[7z'),
('�_�9�(������Y�', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-en_GB.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u��s���˭?����'),
('�`�t\n`����s��', 'wp-content/plugins/buddypress/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\n�mx;��k\r;�'),
('�zR�u�������	;', 'wp-content/plugins/wordfence/images/wordfenceFalcon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd''m_0�xZb-���%'),
('��[��܀�xM�G�L��', 'wp-content/plugins/wordpress-seo/vendor/autoload_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�sy��q�}��$�~���'),
('��Ias̨�}���q��', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-welcome.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����݋l�RA\np1['),
('��F�����{���A', 'wp-content/plugins/wordfence/lib/sysinfo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '֤�C���C�W���M\Z'),
('���倽���ڊt�%�', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z��g�Å��m~��v'),
('��E����Q?��	(�', 'wp-includes/class-oembed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9fQ��<Ĕ��#���'),
('�.݁B��xK�Y�', 'wp-includes/ms-default-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l��=5-K>�\r֩t���'),
('�*O-�Lτ���\r[�u', 'wp-admin/css/about-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K%����.H���EV�'),
('�*�y\r�}��ZE���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/Google_Client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��0�������#�q'),
('�*�����\\�f0HT��', 'wp-content/plugins/theme-check/checks/nonprintable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C��''둪9+�y����?'),
('�??n������_2g��j', 'wp-includes/js/wp-util.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\n��%;�I���'),
('���r��SXi��', 'wp-content/themes/twentyfourteen/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�Q�ݵ�����Y-'),
('��zoX�����0K�N��', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Payment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T��7\Z���e?iq['),
('���"\\��D�-\\gc�', 'wp-content/themes/twentyfifteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��*�pz.9�{���S'),
('��!�a�������!K', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ugG�R㊭lZ^F��)/'),
('��C�<�p�NkAU1�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/register-success.php', 0, 'ݵ�:����R���B��', 'ݵ�:����R���B��'),
('��6�ڢhs~�N�A', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''\rsT�j����SJ�'),
('�ߥ���S���a��', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-response.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&.���A0���/�'),
('�R;lzO�8m<3�Nie', 'wp-admin/user/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�˹��޳H�t��i.'),
('�afh=F���T�:��6�', 'wp-admin/includes/class-ftp-sockets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T��[���6��+��''<'),
('�tB��u�t�-�zz�5', 'wp-content/plugins/papercite/format/britishmedicaljournal.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���''W8�a�V�A�'),
('�����;~ӷR�>��', 'wp-includes/class.wp-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H--u��9�|\0�����'),
('���nvp�e������}�', 'wp-admin/js/customize-controls.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�T��X;68�_\r:S'),
('��-*��Wy��1g�p', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page_header_tile.png', 0, '}g&�Ja2gІ��?��W', '}g&�Ja2gІ��?��W'),
('�?�&�[�ۆu�,�e', 'wp-content/plugins/woocommerce/templates/order/form-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' �0�yFG�`V27�'),
('�(�|n���sARF�+', 'wp-includes/js/crop/marqueeHoriz.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�̮����;���Lo\n'),
('�NF��m��t�`$��', 'wp-content/plugins/woocommerce/assets/js/frontend/checkout.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B�7�mާ~r�1\nP''�b'),
('���-:)��N6��', 'wp-content/plugins/woocommerce/includes/admin/importers/class-wc-tax-rate-importer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\0\ri�}�O��\nr�UK�'),
('�����:[&b�[�hY��', 'wp-includes/images/smilies/icon_razz.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��˭��=��J�@��'),
('��\0a��>d$p������', 'wp-content/plugins/woocommerce/includes/class-wc-download-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��$�i;�G\0�Ȣ�T'),
('��ю���b��Ʌ�+', 'wp-content/themes/hexa/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ox� $&��炼�$'),
('�ܽ<x)Զݥ\Z�8��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/OxidInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$��]}���X����'),
('�����	�<�2q�C�', 'wp-content/plugins/wordpress-seo/images/banner-website-review.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O��''��n\\�(~'),
('��va�Ǝ�Y���k\nj', 'wp-content/plugins/papercite/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'quuMʩ�8C�l7O���'),
('����8`9��?Bb�Б', 'wp-includes/js/jquery/ui/effect-puff.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c:>��8	ۏiE�~�'),
('���Q����B��', 'wp-content/themes/twentytwelve/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N����c7 h8��:;j\n'),
('�\Z1P=��,�Pj�f', 'wp-content/uploads/2015/03/uaiblanco-300x93.jpg', 0, '���� ����\nD', '���� ����\nD'),
('�\Z����)��-{{��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-wordpress.php', 0, '��Q\Z-B�\rq*�쾴', '��Q\Z-B�\rq*�쾴'),
('�2Kk��\\/�Q��', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-translation-upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',��8�_�9���\ZÕ'),
('�7��i\n���˒��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-capabilities.php', 0, '�E��q�T�Ra&�`\r', '�E��q�T�Ra&�`\r'),
('�I�52�≩?Loa�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/read.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U���d��''�"�S'),
('�c�̎��$\n''@�\r��', 'wp-admin/setup-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[v�3�ߵ��|��1d'),
('�g�26\\P";"5NX_�', 'wp-content/plugins/buddypress/bp-core/js/widget-members.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�-����^��#�d'),
('�p��2Y}}W:�K��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/OctoberInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���iΌ!��]o�_�'),
('���@f	��iz3}�-�y', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/maestro.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�8)hu�/h��'),
('��}X*g�n�s\r\\', 'wp-content/plugins/buddypress/bp-themes/bp-default/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��#J|�ςA����dj�'),
('������OiuD}j^', 'wp-content/plugins/woocommerce/assets/images/select2x2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I���b�����̩'),
('������U7�{p�H��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&[`�\n��I\\�=��<@'),
('��?Z�GW�Y�@��s', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��a�Ai+D���'),
('��ΣBgĂ̎t�h%��', 'wp-content/themes/twentythirteen/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w,2H�V>��y���'),
('���d/�2o�8P	:', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WordPressInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\nx��_��sq�m�0'),
('��Z?%_\Z��#/�-��', 'wp-content/plugins/papercite/screenshot-2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�j�%\n�2��z'),
('�ƻe6� �\nV�Ӄ�"', 'wp-content/languages/plugins/woocommerce-admin-es_CL.po', 0, 'c���[�v�&�)��', 'c���[�v�&�)��'),
('���`�䃽�eW�Y��', 'wp-content/themes/twentyfifteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V��X+�1�'),
('���?ڟ�E���$PF', 'wp-includes/pomo/translations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�fWۥ�"�\0Dwf��'),
('��\\�c��\nU�C(�� ', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.0.9.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ^H��*o���Ww��'),
('�����6��b�g�>_�', 'wp-includes/images/wlw/wp-watermark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';��uMmܭD|�w���D'),
('��X�!��f4���F2�', 'wp-content/plugins/buddypress/bp-forums/bp-forums-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�]ZvO��n{-��'),
('��:G%U\\��7�jT�', 'wp-content/plugins/siteorigin-panels/widgets/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']�8�hB�GQvl<?b�'),
('�#8�`�bSm�:4\r���', 'wp-content/plugins/woocommerce/includes/admin/settings/views/settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i^ z�����vo�C'),
('�#�?���Gc	¯l1e', 'wp-includes/class-wp-theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C#d�\\�:L#��tx�'),
('�2[��s�$��t�X[', 'wp-content/themes/twentyfifteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���F''i�V�1��'),
('�7��_�OI;�M�g�', 'wp-content/plugins/woocommerce/templates/checkout/form-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\r�!u�=���\\�{�'),
('�H�����Pw��%8��', 'wp-includes/images/smilies/icon_sad.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z''=��Oj�?�uA|��'),
('�Q49��Lz�J�', 'wp-content/plugins/wordfence/lib/wfUtils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-MLlI�6��f�Et��'),
('�[�n�G{��''��q:�', 'wp-includes/ms-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���kn���X����c�'),
('�mxS�!�~_l���:�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/delete-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R���P��(0Y��'),
('����s�9(�4', 'wp-content/plugins/woocommerce/i18n/states/BD.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Ʒ�9��(@0��'),
('���Ȁ�~_q�I��S�', 'wp-admin/js/password-strength-meter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1��|��=��m�U��'),
('���\\�D �>�F,���', 'wp-admin/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ތp�Pn�죦�S'),
('����;J3"�\n�¦��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/unread.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U���d��''�"�S'),
('��UQ8 ��-���', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[\\+J��hcm�6�u'),
('����n��.-�b��;', 'wp-content/plugins/theme-check/checks/suggested.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q���E�\n�*�\ZN�'),
('��pC@Sd�\n��`���', 'wp-content/plugins/woocommerce/assets/css/select2.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E\\�����̭��Pj�t'),
('���\Z��NwVl��/̸', 'wp-content/themes/twentyfourteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q3���>z4�Ǹ�b'),
('���R�����~�y\Z��', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f���l����G{'),
('��U���c��e�S�', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.�&]����ͣ�}�'),
('�6������	4	T�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MakoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���6g�O5|�� '),
('���W{&�V8i\\V�', 'wp-content/themes/twentythirteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�	��M:��^,�M'),
('�Bw��:՗k�.I', 'wp-content/plugins/wordpress-seo/frontend/class-breadcrumbs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�vG�r/:���S���'),
('�S��	m�m��.�gP�W', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pt_PT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ok��\Z�#����/�'),
('�kj�\\����t�\Z��@/', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/views/table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.W7��ĒI�.�Ot'),
('��/6؈�m;\\R:�p�', 'wp-content/plugins/theme-check/checks/editorstyle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�n���&�,D"��'),
('��=CѠ��*TX���4', 'wp-admin/css/colors/_variables.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v�w\Z??�h圜q����'),
('���*��\\�<A\0Pn�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f2�\nP��q�R����'),
('��>vBh,O+p9ѹ�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Exceptions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�74�MmW��`q\n4�Po'),
('�� ��It13&', 'wp-admin/js/nav-menu.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z�5�g�S���9��E'),
('��>N��5a��r�,�', 'wp-content/plugins/woocommerce/assets/js/admin/term-ordering.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:���2W��AT�'),
('�!_H9�]IP$��E�', 'wp-content/plugins/buddypress/bp-forums/bbpress/rss.php', 0, 'ne9Uۖڀ��j/�F\\*', 'ne9Uۖڀ��j/�F\\*'),
('�;?2��S��\0��p', 'wp-admin/customize.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�t�L}iہ�d''g�7�\Z'),
('�X��@��%�1C��i', 'wp-content/plugins/wordfence/images/lightbox-controls.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m]�a���\\$��'),
('�]�.�1\rPXL�', 'wp-admin/includes/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E:ӭHet8�I�\Zsx�'),
('�d�͒���w�I���oe', 'wp-content/plugins/woocommerce/assets/js/frontend/cart-fragments.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}�KG��A\r�����t'),
('���Q詗\nX<5K�h', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topic-toggle.php', 0, 'F�-�b#�u�?.���m', 'F�-�b#�u�?.���m'),
('����(�%Nd�|���', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f ��}b�gh�Y�Xl0'),
('������|� ��', 'wp-includes/js/masonry.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l��}M�ј�7�j��'),
('���v{C����ҧ��4I', 'wp-content/plugins/wordfence/lib/wfViewResult.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	qN��K80�O��'),
('��p�$^���d�Z', 'wp-admin/network/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k��Oy_��4�)�\Z���'),
('��[K���b���28�', 'wp-includes/pomo/po.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6+\0��n�_HSl��'),
('��ho�F���H*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-plugin.php', 0, '|�`kJ$B��[��', '|�`kJ$B��[��'),
('�7�''���-CnTPS', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���[X7ɢ�� 5��a'),
('���X����J��p', 'wp-content/plugins/wordfence/lib/wfBrowscapCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�><���|�rG�<g�'),
('�"͇��hy%���;�^', 'wp-content/plugins/buddypress/bp-core/admin/css/common-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�AÌ��.����A�O'),
('�:"+���\\����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/search.php', 0, '�1���p''c\r�\Z�C�6', '�1���p''c\r�\Z�C�6'),
('�o����l>��x~I� �', 'wp-admin/network/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��=���SV��V���'),
('�}�e�������$��F', 'wp-content/plugins/woocommerce/assets/js/admin/product-ordering.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\\~?\r��cÑ�xiu'),
('���0j�l�S��K�', 'wp-includes/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4!�A4�� ��B'),
('��ﯨ>''T��G����', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_OAuth2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	n��;��<b�]�V�'),
('�«��-j=�u�N\\q''', 'wp-admin/css/farbtastic.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��8)���}{��C�h2U'),
('��ؐy�/pV�A%��', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P����#�d���\0��'),
('�����/Z�&��`', 'wp-content/themes/hexa/languages/hexa.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's1�+w��ռ���_�'),
('���ᗏ�3�-��4�', 'wp-admin/css/colors/midnight/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���"�nv٣�7k��'),
('��A��f�sY���Z�', 'wp-content/plugins/siteorigin-panels/css/front.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ĕ�	Ҳ���_�('),
('�"ڕK[@�G����9�', 'wp-admin/includes/class-wp-theme-install-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I^��B�I,�~a5RG'),
('�3!9�=�6�ݡ', 'wp-admin/images/resize-rtl-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ɞ�@��T0:��}'),
('�m7v��,1R.�vk��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/JoomlaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\0fHpg!N�O�'''),
('��1Zb�U ���C$', 'wp-content/plugins/woocommerce/i18n/states/HU.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��82Qz�Ŕ�)�'),
('��)��v�{��c�/', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����#ˇf� ��'),
('��wēv�1���٬�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/delete-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�C T��Kn͔�C�M'),
('�)["J�H��|�jk��$', 'wp-admin/js/customize-widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xP�}����r��T�c'),
('�H��)��-T�uZr�|', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ai''gr%ĳ�{�)�5R'),
('�JTV0D��oTA［@�', 'wp-admin/options-discussion.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r"{V�뵖����'),
('�����,\\ç��d�', 'wp-content/plugins/buddypress/bp-core/deprecated/2.0.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ϭ\r&`��g��C�Q'),
('���GbO�n4�7��~3', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/button-grad.png', 0, 'D[j��\r�Ą���W�', 'D[j��\r�Ą���W�'),
('����S�h���S�%Tz�', 'wp-includes/js/mediaelement/wp-mediaelement.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Uw�\\%���`���'),
('���U4�Ep�B	@w�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-pluggable.php', 0, 'd9WC��;�����"D', 'd9WC��;�����"D'),
('���"ܒ����nzD', 'wp-includes/SimplePie/Caption.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����BjM��g[����'),
('���Wd�;C\r���O�', 'wp-content/plugins/akismet/views/notice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\n��;�8��&�'),
('��Z\nu�oK� ��T;e', 'wp-admin/images/list.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��*��ӳ�S��'),
('��h���-���f:��-', 'wp-content/themes/twentythirteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z~ŉ�_�-����\r'),
('�\0��?��\ZN�;��', 'wp-content/plugins/theme-check/checks/gravatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��nQ��3Y��(,88'),
('���Uy/�*%���;', 'wp-admin/includes/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H��^1˺4�R��b'),
('�\rE��U���̈́��', 'wp-includes/images/wpspin-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}�3��Y�(�I��m'),
('�l)r����M��ȿ�', 'wp-content/plugins/theme-check/checks/malware.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ra��[�\n?p(H�'),
('�����I��Ҏ"�', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/request-membership.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8J�J�W''4H��_��'),
('���=�L�J8*��^�V�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�h����,o]+�W{\r�'),
('��R�8^�����\nɽ�l', 'wp-content/plugins/woocommerce/assets/fonts/star.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�og�����ZV�$�'),
('�ޫH�_N�wW:;', 'wp-content/languages/plugins/woocommerce-admin-es_CL.mo', 0, 'e�\0FO*T2�lZ���', 'e�\0FO*T2�lZ���'),
('������z�����', 'wp-content/plugins/siteorigin-panels/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"9��sF:�t�\rG��'),
('�������sp���e�', 'wp-admin/includes/class-wp-ms-sites-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�8~�!$L������'),
('��L���9��k��o�', 'wp-content/plugins/siteorigin-panels/css/icons/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���z��ZJ�B�\n+�'),
('�-1�8�;�T�/X�]', 'wp-admin/ms-sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']b$�����q����h'),
('�-�VW�igM4|\r�C�B', 'wp-content/themes/twentythirteen/images/headers/diamond-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#�g�a���2��*�{'),
('�4 :� ��\n�Wv��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/phpunit.xml.dist', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f�T��4�v�+q ~�'),
('�D��䷆��^r��.vM', 'wp-content/themes/twentytwelve/languages/twentytwelve.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%�^\r`��(G��'),
('�I�Y	v�1BI��''�', 'wp-content/plugins/wordpress-seo/admin/class-yoast-plugin-conflict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�c�E�1\0���9'),
('�|�����D��z�G-�l', 'wp-content/themes/hexa/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Zi,�$��rۘuȅ\n'),
('��O��|<C��w�y��', 'wp-content/themes/twentythirteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q4��:Dwxj��h*ޖ'),
('��^��!Bu�����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/delete-post.php', 0, '�ҧZ\\�P)vЖu��5�', '�ҧZ\\�P)vЖu��5�'),
('���GM��f��J�o�%', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n4��C[��w��$�'),
('�˽lNVb4�X�e���"', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S�2\n���#{ӳ�t'),
('�Ρ~�ߓ�:�����eo', 'wp-content/plugins/wordfence/images/icons/tick128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ğ��c�h4"���'),
('����(5�aH�yo,X�', 'wp-includes/js/jquery/ui/tabs.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Q^�7u\Z�]��-'),
('�Vq=�T����ݰ�', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen-rtl.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zֆ�v�g��� �g�t'),
('�$�͓�bHn��,\0-', 'wp-includes/images/smilies/icon_confused.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�sYFPZ6��,��'),
('��.�y#��j��i]P3', 'wp-content/plugins/woocommerce/templates/single-product/tabs/description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D��8�ӄ���?���*\n'),
('���ag��@E��:�q�', 'wp-content/plugins/woocommerce/includes/class-wc-integrations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-	G-�:�yU�ȼH'),
('��+����\rx?v�c��k', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/requests-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�gB�Y�5/��"���'),
('���:ı��	K�H*�V', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/groups-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z���b�@�����'),
('�������k8Kݯ�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!\n(��''�n����՝'),
('����`7hRq�bE�q�', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Hm�[;̇8 �'),
('��ر�0�ReU���b�&', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-theme-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E'')j2<n���z�8��'),
('���b�焪�s�}Ca', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-accounts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B�$��EF�a��c�'),
('��m�B��<fh�B�.\0', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Event.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iG�F�!�n��o�!'),
('�\0� M�\\�5̿��c\0', 'wp-content/themes/twentyfourteen/js/featured-content-admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\0���P�wp"�LK6��'),
('�	�6�#A��O�C�R', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/RoundcubeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���l���cc*~j=p*u'),
('�!�J�,û��⼱��', 'wp-content/plugins/woocommerce/includes/wc-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��)t�\nP�n�]\r�W'),
('�L���yE�{��f�', 'wp-includes/css/dashicons.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q�\\�s����~xG�u�'),
('�P3\\�\r���2�էe�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/compose.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ב�:�>ʸ=Zca'),
('�k�UL��ǡ�$���', 'wp-admin/ms-users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H#�f{#ʃ��	6G�'),
('��:Q�m�l�m�c�W', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-taxonomy.php', 0, '�R���>-5��}�7', '�R���>-5��}�7'),
('����{^��W����C�', 'wp-admin/css/colors/ocean/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�������j�*!a��'),
('���-�]�\r�~(#�', 'wp-content/plugins/wordpress-seo/admin/class-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�xm�]?MC���u1'),
('����˄�v��+�nG�', 'wp-content/plugins/wordfence/js/jquery.tools.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:-��Eՠx�$�B'),
('�ݶ���]�4�\\ v', 'wp-content/languages/themes/twentyfourteen-es_CL.mo', 0, '�4\Z�IT�~��Q�B&�', '�4\Z�IT�~��Q�B&�'),
('�3@bI��Z�K����', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�W�q\0�O��ր'),
('�_f��;w�a��ځ�', 'wp-includes/js/tinymce/skins/wordpress/images/gallery.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_���Pw��PU�4'),
('�eԂ�-Z�+��ŋ�', 'wp-content/plugins/buddypress/bp-messages/bp-messages-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X#�q�t�?h�>�����'),
('�u��<e�x��@ֈ>', 'wp-includes/js/underscore.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%!7ӝ{�Y����M*�'),
('��q?%��rp��0�7�q', 'wp-admin/css/colors/coffee/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L��A�".k^{�\Z�'),
('���<�T\r��/���H', 'wp-content/plugins/woocommerce/assets/css/chosen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�5N������\0"G��'),
('���;�*�D����Փ��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/topic.js', 0, '.��<�ل\r��', '.��<�ل\r��'),
('��$c&�s�t��^�?\r', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z?`��U�a)AT��[|'),
('��''ܶ?`��ؤ�%)�', 'wp-content/plugins/woocommerce/includes/class-wc-webhook.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_�!Ю��&ٴ{�'),
('�њ[��e�XH��\\*�', 'wp-content/plugins/woocommerce/templates/content-product_cat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P�,\Z��}�ҢzF��'),
('���B�6[s��M�', 'wp-content/plugins/wordfence/lib/wfCountryMap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']hF�3���k�;�u'),
('����x�Й�)DC��<', 'wp-includes/js/customize-models.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� Һ�zCp�OE�a�V�'),
('�~����U�"�&��', 'wp-includes/images/wpicons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��n�V�o�$��Of~7'),
('�[U��x+��!�', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/animated-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P���?''�88]��'),
('��W2��D��G�7�V', 'wp-admin/css/common-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%~�kț�u�*�'),
('�4c���U�Ѥ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/profile-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�?�qS��>�ЖNb='),
('�6cI�	@۞o����', 'wp-content/plugins/wordfence/lib/menu_scan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���?��+�W�G�R|'),
('�?IhZq_��c�d�g�', 'wp-content/themes/twentythirteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[�\r#�%�UM�'),
('�Vb(kt�W"�6(;ƴ�', 'wp-admin/includes/class-wp-media-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G��D���v���&?�'),
('�b|Lv��_�7���E�', 'wp-content/themes/twentyfourteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���C���KZ��˳?�'),
('�c#yɱ��r)�`W', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-ga-js.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/��k�˻Vf��<=�'),
('�tfF	�r{�܇�_I�x', 'wp-includes/SimplePie/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R�.�b���~����+�'),
('���3}��EM\r:O��?', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/entry.php', 0, '��("��DǏ��6�(', '��("��DǏ��6�('),
('��~8�,_�rAf���', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ߧ)�S{�E1F\Z��='),
('�\0:�zler~�+\nNyw�', 'wp-content/plugins/woocommerce/assets/fonts/star.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kx�L�2��D�\Z^'),
('��߲;��0����', 'wp-includes/feed-rss2-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<����7Uv9Q�7'),
('�.��<b�\0��� Y�', 'wp-content/plugins/papercite/format/mla.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ط�Xm�-@���'),
('�/0��d��rB��ʝ', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�)��,�<q��'),
('�@E�[��''$Y9`�e�', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ێ�&���&* �eI�'),
('�eZx��"&!�tr���', 'wp-content/plugins/woocommerce/assets/js/frontend/single-product.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o�ho#=�x��0�BZ@�'),
('�z��z�am��\Z�', 'wp-content/plugins/buddypress/bp-members/bp-members-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''� ��sO3���gkI�'),
('��3�T.^�ƙ<���', 'wp-mail.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��R:�߱5�$6��'),
('��*괶�Z�3�\\�f�', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?''�� �K��>����'),
('��K���OȖ9�3|<�', 'wp-admin/maint/repair.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';�#\0�24P2�pe�4'),
('�Ԧ��\Z��Ne�m�', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/i18n-module.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ETby�\\�X�'),
('��I����.$U0]''�S_', 'wp-admin/includes/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��efn_�Jx՚Au���'),
('���Q�(\r�WbÆ', 'wp-content/themes/hexa/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��G�V�ݰ_��Ӝ'),
('�66#1Q�E\r���xG', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�[W���FgԴ�	�2�'),
('��+D�FܿTZ[H7', 'wp-admin/images/post-formats-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��S�l��H\\�������'),
('��@"�d�6�y��h`', 'wp-content/uploads/woocommerce_uploads/.htaccess', 0, '\\Ƞ+�a[�Z�ˢ�', '\\Ƞ+�a[�Z�ˢ�'),
('�&~}AyΉ�4�''��', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/price-box.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�)�lH�-��CK�`9'),
('�GV\\z��#���!;��', 'wp-includes/js/media-audiovideo.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ʉ\r�i��.�����'),
('�O�r#���T�G��!', 'wp-includes/js/swfobject.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���,�I}p�e~2�q�'),
('�fq�0�$��⯠oW', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/hoverIntent.js', 0, '����g��ly�Ǩ�', '����g��ly�Ǩ�'),
('�l&�*�������&', 'wp-includes/SimplePie/Content/Type/Sniffer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|r��i�Ub�lw����3'),
('���$(�g�(���P��/', 'wp-admin/css/wp-admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1��g8�΃'),
('�������kM��?�uX', 'wp-admin/css/ie-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}\r��n\0�R��anA$�'),
('���q�K�U�j�', 'wp-includes/SimplePie/Category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~��?��.\nܯd�*'),
('���t��xע����', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q��g\r�l�O���'),
('�ݶyZMK8f�U?���', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/js/onscreen.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�^J��	�&Ҝ���'),
('��-Z���:E�:', 'wp-admin/js/image-edit.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ߒT�(�u�4U(�h5['),
('���|�jX����|�fb', 'wp-admin/css/login.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G�"���S�dy�K�'''),
('�,Lᵙ\\�-��X-��', 'wp-content/plugins/siteorigin-panels/css/mixins.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2���yW�FN"���'),
('�@\r�.��E�î', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4h�$�o^*����w'),
('�MR��l�B�F�u', 'wp-includes/option.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'հ�z�t��7��\r׼�'),
('�aB�~9!����uHZ', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä����''���\r(c��'),
('�r�\\�j�����A$�', 'wp-includes/js/customize-base.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@��f"]e}k�YaB7'),
('�t ���k�b�r�}��', 'wp-content/plugins/woocommerce/assets/js/frontend/cart.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R���c�j3O�Z���G'),
('��_Q([�TJX�ѐPa', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NU�j�o���\r��\ZbD'),
('�����"Sέ`t@', 'wp-admin/network/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A��|��MM0\0���'),
('���\\��.1��-��:', 'wp-admin/options-media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�$''M�˗Q1Y��O%�'),
('��ΝH�*��*.ځS', 'wp-admin/includes/bookmark.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V��._%B)�j�A��\Za'),
('��@�[X������n5', 'wp-content/plugins/buddypress/bp-activity/bp-activity-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~tm�&��l��JlW'),
('��E\rU��c�^ppo+', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-��Z;�6f�H�Zq'),
('��	p����q�I!d�', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/eComm_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ޯ����Td�O�#�'),
('��Ul1�ȕD�bmg�', 'wp-includes/css/buttons-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����BK�+NG~	�'),
('�\nfv�8���1���-I', 'wp-includes/SimplePie/Exception.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	K�v&���<\\ڏ�S5'),
('���D��*,�t�u^', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�$w]"��Չ��'),
('��f$�Y1�{�2�r(i', 'wp-content/plugins/google-analytics-for-wordpress/CONTRIBUTING.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oD��˯J"�C*�\ZSS'),
('���ZQ4��\\(�܇', 'wp-admin/network/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N��5Cs��	�'),
('��(GѶ�cYu��5�s', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/testimonial.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5J�tHؙ����"�p�'),
('��*7b���1q�֒��)', 'wp-content/plugins/woocommerce/assets/js/admin/users.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^W�����In��'),
('�ʍ���	 n՞u''s', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocompletefb.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ǀ�\n���\Z�b\\g�'),
('�ժ���g����o[ B', 'wp-content/plugins/papercite/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PҹD��L��	,,fA'),
('��5v���du�׵J��', 'wp-content/plugins/buddypress/bp-activity/bp-activity-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B��z7��x1wD׋�'),
('�\Z���l����3Ȋ�', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�a��H6��]%P���'),
('�!@+���`(�V�n+', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PimcoreInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';�J�;�`ƒ nH�'),
('�;���;�t��D|�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-cron.php', 0, '�r��|;z�)ɔ&��', '�r��|;z�)ɔ&��'),
('�J|6}�P�,\rٛ', 'wp-admin/css/colors/_admin.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����26�I����'),
('�R~4����$�]�i', 'wp-content/uploads/2015/03/uaiblanco.jpg', 0, '���a@M��IT�', '���a@M��IT�'),
('�X�QR\\���ˠ(�XJ', 'wp-content/plugins/buddypress/bp-members/bp-members-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '՗����ڧ7��򲡭'),
('�y�,LI33@�Ќ', 'wp-content/plugins/theme-check/checks/phpshort.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	;��R?�����'),
('�z�����Q"�a��Ą', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TYPO3CmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ة�ʲ�ȯ�@�:-&'),
('��X�(!��b���q', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-pt_BR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���J��≧\r>Eэ?'),
('�����[��:�����q', 'wp-admin/includes/class-wp-plugins-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���g3At4s\Z�R'),
('���P�Of;���/��', 'wp-includes/SimplePie/Decode/HTML/Entities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E�^/�\rB���Z#�%/a'),
('��J�j�O�3to?��', 'wp-content/plugins/buddypress/bp-core/bp-core-buddybar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uY�A^��:ـ����'),
('���s؅���z8�s;y', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/send-invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��;KW2dl��A�R'),
('��\\ ��Iѻ���,', 'wp-includes/class-simplepie.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ys�r�	�m���D;��.'),
('�Ln��U3\n�����', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WordPressInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\nx��_��sq�m�0'),
('�#@*v�_��>��	V�', 'wp-content/plugins/buddypress/bp-members/bp-members-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�w.�Ht;\r�v1H��%'),
('�/&�����2�ѡ\rgDs', 'wp-includes/http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��w��$~�r�4T$'),
('�F���Rm��V�@wV�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�j0��~��\rs��$'),
('�M���ޯ�r�%\n@�', 'wp-content/plugins/woocommerce/templates/myaccount/my-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$f�sl|�Qr%�\n��'),
('�b�E��3�g''cZ (��', 'wp-content/plugins/akismet/views/get.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-�ԓ$�T$x�#Z�<�c'),
('�x:\n%6�1?����yt', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install.css', 0, ',#Q�~��fB\r��`�', ',#Q�~��fB\r��`�'),
('��?�0|���5uơ��', 'wp-admin/custom-background.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��J�Sy��m����'),
('���1����$�f�fQV', 'wp-content/plugins/theme-check/checks/style_tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ּ���L�ڂ�/t�'),
('���qh�n�J�j�', 'wp-admin/css/nav-menus.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���-Bq��r:��ۗ'),
('��������0����', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��''Ck>���ϐ�'),
('�ÏuL�,�&Ǒ�\r1', 'wp-admin/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r��IR�	v�+/ż\r'),
('����#�>ֳ̭{�*�', 'wp-content/plugins/woocommerce/includes/admin/views/html-email-template-preview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6�[Z�-w��M�\0'),
('��$�<@�Řa���c"', 'wp-includes/js/swfupload/plugins/swfupload.swfobject.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '̵q�V7�T\\���s'),
('���yzCX9���j', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ލl��F.yI�N0�'),
('�WM��{h����(��', 'wp-content/plugins/wordfence/lib/menu_options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O*�FTv��}�|t�'),
('�Wgg9�!`���5KɁk', 'wp-content/plugins/papercite/tests/basic-tests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yP�ý*Hg���˩>'),
('�Z�j��z��%�I��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post-form.php', 0, '�ĐM��6a�y�k��', '�ĐM��6a�y�k��'),
('�^��q��<EP���6', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-integrations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd�A9�Qk�a{Gd��'),
('�a�@o��''��kb���', 'wp-includes/js/jquery/jquery-migrate.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q+�\Z(0�BY�<�4:��'),
('�k��ޥ[qd�w�~o��', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�M���v\\�5�L��'),
('����^[X��i�	�', 'wp-admin/themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��q\r�"���ł�t&'),
('����������)��', 'wp-content/plugins/buddypress/bp-members/bp-members-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V�䫬�E^��gŁ�'),
('��4T�(�\\9''��3�)', 'wp-admin/css/customize-widgets-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U�9\0�zF�Y�W-�g'),
('��8���\\q�U��.w', 'wp-content/plugins/woocommerce/templates/single-product/review.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f��a��,�y@��0�\Z'),
('��k{��&��x\n��', 'wp-includes/class-wp-error.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZΥ��f���U���'),
('���_E&�t�[�+R�', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/green.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"]���G紌�q�l\ne'),
('���s�YX���㞗', 'wp-content/plugins/wordfence/css/phpinfo.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<`�,7��Ju\0�'),
('�\0��%3[$x\0��.��(', 'wp-admin/images/marker.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�*O2/�3I2���'),
('�6��qh�a�nF�\nU', 'wp-content/plugins/buddypress/bp-activity/bp-activity-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ӧ�M��Ql�x���'),
('���4�����=��', 'wp-content/plugins/wordfence/images/icons/ajaxScan.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ʖ�Ѵ��~f���i�'),
('�	���Em[�����l�<', 'wp-includes/js/tinymce/plugins/image/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LKgQ�3�(�?|md/k'),
('���@��:��z3^u', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Cc�ݠد�Gw|�Aۄ'),
('���1*\\�D�!tg', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.compat.php', 0, '��8W9�(�1��@Ep', '��8W9�(�1��@Ep'),
('�-(&�$�����"��', 'wp-content/plugins/woocommerce/templates/cart/shipping-calculator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l.\0���0�"�W�Zx�'),
('�B&趭\Zv��܇Gۍ', 'wp-content/plugins/theme-check/checks/customs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��VVN�1�132X�,a'),
('�L?�Y{ث7��F|!}L', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D,Ѯ	�rr	`Wzz_m;'),
('�x�-M�:������', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen-sprite@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aO�amM�Sg�hP\\�5'),
('����>&U��_��', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^�d��D�\\�T��0�R');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('��<:gZ''��iB��Ω', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�o�M��Hnڴ�ڙ'),
('��5Z�����o��Ү<', 'wp-content/plugins/wordfence/css/fullLog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+����W�jw˄}��'),
('��<_yR�i�PB�u�', 'wp-content/plugins/buddypress/bp-activity/bp-activity-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��3�C>51�H��ё'),
('��}��܃�C��!', 'wp-content/plugins/woocommerce/includes/class-wc-breadcrumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WY�.��y~��\0]��'),
('���\ZgB�}vv�K���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�ܼ''Z�y�{��'),
('��#/S�,��z��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/action.subscribe.php', 0, '�nn-�8�I�K�*�{/', '�nn-�8�I�K�*�{/'),
('��\n�fQ8Wm��=�R', 'wp-content/plugins/wordpress-seo/admin/class-bulk-title-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%�\0��\\{���N�-'),
('�������"�R�Ŝ', 'wp-includes/images/crystal/text.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�� Ѳ��#�d�%�[�'),
('�70�{��4J"����6�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PuppetInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�b�U�y�ͅ���\08'),
('�v%���S�[�̪�Ѿ', 'wp-includes/ms-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U�Z�bU�T9(:-D'),
('�w��O�A�5k_u��', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product-variation.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'el��>p�\\���G�'),
('�}O� �}��lG:Yf', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_real_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\���хk���W�ek�'),
('���^4K5�}>''�Z��', 'wp-content/plugins/woocommerce/includes/class-wc-template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J�NU=�V�]#��e�'),
('����7[��A���Ya', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-general.php', 0, '�^���u���_t''��', '�^���u���_t''��'),
('��Sm�a1���զZC', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_MemcacheCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ű�O-�Iup��'),
('���X"�-{��$48sx', 'wp-admin/css/deprecated-media.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����4םnG5��j��_'),
('�3����$]�D[L�', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-coupons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{�C@��6�i�da'),
('�X8u�c��yĲ���E', 'wp-content/plugins/papercite/lib/PEAR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�P�+��q��@��-�'),
('�gٙʞ0��R�hyV1', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_enabled_hover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)M���)�݇~'),
('�}��%J����g��z��', 'wp-content/themes/twentyfifteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[k�"x�E�7@s}l�'),
('���WWՃo�m����e', 'wp-content/themes/twentyfifteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\\�"�ȶ��jȓ�P'),
('���\\��9�ѕ�F�w�', 'wp-admin/js/revisions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�F�{�~�\r�''Y�i'),
('��c�x���]�Rs�R', 'wp-content/plugins/woocommerce/templates/loop/loop-end.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iN<��\r��{[K�'),
('����-��w�,��D�ψ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�D�"�:..��'),
('��wTw��Ga���/�H�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/drag.gif', 0, '�r{A߀���5B�v�', '�r{A߀���5B�v�'),
('��\\����\0jg�g�5w', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Av''W�z�=�����j\n�'),
('�7���*I,�\\(�{�G', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/RoundcubeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���l���cc*~j=p*u'),
('����N����@�(�3�', 'wp-includes/ID3/module.audio.mp3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#�\Z�~e�����J�8�'),
('��&��KG���)�', 'wp-content/themes/twentyfifteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|\0߮`,�u�p`�s/'),
('��h���)UG@�x��v	', 'wp-admin/edit-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W���9mz s��ap���'),
('��(�[3?�H/�[�e]', 'wp-includes/js/tinymce/skins/lightgray/fonts/readme.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zd��+���E@�1�'),
('����O�څy���}', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/group-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��BY�pC|Kȇ��'),
('��lg�E���$��sh�', 'wp-content/themes/twentyfifteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;�QC��JDuc|i'),
('��2]hqu:�T6E�U�', 'wp-content/plugins/wordfence/lib/wfAPI.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�aC���K��Q���'),
('���"_e�ZC����', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-nb_NO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��@<���3�ۺ�W'),
('�[M���Ʈ��]�7', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u�Rp]��?@mȄB�'),
('��Y����1�؎$ɧ', 'wp-content/themes/twentyfourteen/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''y��F�@���d"'),
('�{g�%�Z��\r`�]�', 'wp-content/plugins/buddypress/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q��_P��E%�~��'),
('�#�AuI.F��/���', 'wp-includes/js/wp-pointer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5ˋ8�.�r:ě���'),
('�<{����,-�![M��', 'wp-includes/js/tinymce/skins/lightgray/skin.ie7.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���m_ҐsԥG'),
('�\\�*Qܡ�{+H�', 'wp-content/plugins/papercite/papercite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pq��ۈ�\n�3�� �AW'),
('�p�N��U7�p7ب��', 'wp-content/plugins/buddypress/bp-members/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L9�Ϸx@F^��'),
('�v�FI��2h����n�', 'wp-content/plugins/wordfence/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N\Z�8©�$�tV�g'),
('���=V;�����N.K', 'wp-includes/js/wp-list-revisions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'GQ\ru`�*�L��n$��'),
('����RڸAOO����o�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CroogoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�vE��"�M\\��M�'),
('��?��0\ns?�iU�S', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/InstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u^P�A�P2����c5'),
('���Ƿ�������\n�H�', 'wp-content/plugins/wordfence/lib/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"6�6�xq}r��\\y3p'),
('��Κ,�Q�a�gl��\Z�', 'wp-includes/class-smtp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��P�����ʄb�.'),
('����J�c�P�y���', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/activity-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G��Lv��\r�@#�N'),
('��dA#���*�Źo7', 'wp-admin/js/customize-controls.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[�����[`�6N�(�'),
('�\0������;��[��W', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-exception.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't���泞`\r!M�g'),
('�\rq���3I=���g ', 'wp-content/plugins/wordpress-seo/images/Local_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ܱ���Y�W�~�iJ�'),
('�6��4�jt�#*�', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile.php', 0, '�:e���켏B=�~', '�:e���켏B=�~'),
('�<��w����ಋ�%�\n', 'wp-content/plugins/siteorigin-panels/video/panels.video.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��e�`T�\0�r�X]��'),
('�T��%�|Ow#e?', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-coupon.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�iVq���ac�))R�'),
('�nqm�?��Y�{�~', 'wp-content/plugins/buddypress/bp-activity/bp-activity-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z_al�e���:�R�#'),
('��3"�(z�a�4�8�', 'wp-includes/images/media/code.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-o��Uʓ��U�U_'),
('�±�`��K/O�Ne ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/styles/simple.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4,���W�2�H\Z�J3'),
('���|��U�C�D��h', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f���l����G{'),
('�9i�䜊 ��C���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/white-grad.png', 0, '0���~�d�	\0��V,��', '0���~�d�	\0��V,��'),
('�GՅYy��]���^;', 'wp-content/plugins/woocommerce/assets/js/frontend/credit-card-form.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�w59t�n®�|�0V�'),
('�P�����B�D�F2UE', 'wp-content/plugins/buddypress/bp-core/bp-core-theme-compatibility.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���wٟGJ֠Ƈ"�:�'),
('�RX@��Wk�zd{�+,', 'wp-content/plugins/woocommerce/assets/js/jquery-payment/jquery.payment.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K-C$���U�w'),
('�ir��	$�M�Ӟ��,', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ė�(��2Щ��͠{?'),
('�kHm�1��`0ѹ��_', 'wp-content/plugins/wordfence/lib/wordfenceConstants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�[�����@��,l�ǉ�'),
('���m�]��!���s�', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����Jd�\\,���^��'),
('��cE*D�5 d��\nc�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-fee.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\rT����\ru�	'),
('��v�{\Z��S�z�G6B', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��!X�~C���WȘ\n�'),
('�ٵ\nh��Jx�dv�ԃ]', 'wp-content/plugins/wordfence/lib/wf503.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���D�G��\\4�*Ɣ'),
('��5��[,	j�(�ƪ�', 'wp-includes/js/mediaelement/controls.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$�"�Ӭ����?�Ȥ'),
('�����g�V�7Q�t�ry', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-coupon.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ܯV�o��x�>��7�'),
('����Η�@�ց�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/style.css', 0, '�%Z��F��."k���', '�%Z��F��."k���'),
('���2zs��4x�EB', 'wp-includes/ID3/module.tag.id3v1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��h؜�ٱal��w�4�'),
('�Obc��" ���|J(', 'wp-includes/images/smilies/icon_evil.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c����VM<�"!�.'),
('�1��WV(2��6����', 'wp-admin/images/icons32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�۬[�m9��J�4�\Z�'),
('�F��wj��"*p�\\�', 'wp-content/plugins/theme-check/checks/commpage.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��N6q���;j�t�DB'),
('�ii��B�e8.��8�', 'wp-content/themes/twentyfourteen/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����2�R���P'),
('¨2�v�����}2��M', 'wp-content/plugins/siteorigin-panels/css/images/dialog-separator@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u���H��>�ё�'),
('��1���|�}���dQ', 'wp-admin/export.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B!�x���+�{��ۺ'),
('��	1��А々�S:(', 'wp-includes/js/thickbox/loadingAnimation.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"h\r�c�����&�'),
('�^��C�O��P�>�', 'wp-content/themes/twentyfifteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{��I��<�<$���~'),
('�:4Y�mcH�=^+G', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��A�Lw���ɰ��3'),
('�C�3�!0Q�o�J�e `', 'wp-includes/js/plupload/plupload.flash.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p)뉯�-�E��<��G'),
('�_���jSX�2�QQ=', 'wp-includes/ms-load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Gґ(�����`�ID'),
('�_����O�h#���ǫ', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\n��u��H�E'),
('�b��_�P���[BJ', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L\Z2�ݡF������A��'),
('���f���+Z����', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-layered-nav.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''����8''��ϲ\r{'),
('��tnR�ؔ����%^�', 'wp-admin/images/align-right.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B���Oe#�l@:P+"v'),
('���5�V"�$$�_��', 'wp-admin/includes/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��$YzirG���ZKb��'),
('��iY����\0\nR)��', 'wp-includes/post-thumbnail-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(Y𫹩�DʭCdL��'),
('��u�X�ݼ#�-����', 'wp-includes/class-wp-http-ixr-client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tJr�P�?��bU��a'),
('��/J���O�y�d�T[', 'wp-content/languages/plugins/woocommerce-es_CL.po', 0, 'Կ�x��Γe.^�/�P', 'Կ�x��Γe.^�/�P'),
('��U�F ����Ԟ', 'wp-content/themes/twentyfourteen/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�1k��\ZN��+�>�'),
('�6��kci�OM', 'wp-content/plugins/woocommerce/assets/js/frontend/add-payment-method.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɓF?��}�D���Ⴣ'),
('�T���a	�,�f~}|�h', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��e�IMq�	N����'),
('�{4Dnzs���I��', 'wp-content/plugins/buddypress/bp-members/bp-members-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ɒ@�f��t5��C�<'),
('�|��\Z����:s�~�', 'wp-content/themes/twentyfifteen/author-bio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�ԡR$)����wZO�'),
('ā��}:g��>�3��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3�\rž��N\\�Oˁ&*'),
('Ĉ^A��+l���o�d��', 'wp-includes/js/tinymce/skins/wordpress/images/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7~!���\0�����"w'),
('đ�ԪV�CT����G', 'wp-content/plugins/wordpress-seo/admin/pages/licenses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ґ�*D�\r��>d�O\\'),
('ĔԼ���pP�Z	H��', 'wp-includes/images/smilies/icon_cry.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E>z?��Ap�mWlA�`'),
('�����{�5�x����', 'wp-content/plugins/buddypress/bp-core/images/admin-menu-arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-���?�iG��:!:'),
('���u*M�=v�I�\0�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/messages-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\0����3PҼ�h'),
('��N���1�J���r', 'wp-content/plugins/woocommerce/assets/css/chosen.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P�{�}���''>����'),
('��ʙ\0}��甠K��.�', 'wp-includes/js/jquery/jquery.color.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-���E�G����>vJ'),
('���TGۃ��g]`��}�', 'wp-content/themes/twentytwelve/editor-style-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a���a.��=̱���%-'),
('��Y�t�udo����\r�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-rename.php', 0, 'њH��@�Hc)�o�', 'њH��@�Hc)�o�'),
('��{A��mm��*�K', 'wp-includes/nav-menu-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jg�$��\\$�)Շ�H�M'),
('�~@�������;S�', 'wp-content/plugins/buddypress/bp-themes/bp-default/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k���Y8˞L�\Zh'),
('�5�a�&��4�"�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/posts.php', 0, '�\n~�M�=�;��', '�\n~�M�=�;��'),
('�`#��G�b�C��֊�', 'wp-includes/js/swfupload/handlers.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Y,k?�X�N�0G�;'),
('�d��CM$q`����<', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/password-verify.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�҄\r�J�e��C�:�'),
('�i��w���e�3CJ\n�', 'wp-content/themes/twentytwelve/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_;�ĸܚ����'),
('Ŕ��ժF.��::���', 'wp-content/plugins/buddypress/bp-members/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%�P����1g��Z'),
('��-�p�lE���k�/�', 'wp-includes/js/jquery/jquery.hotkeys.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�S!}EU�\\b�g�h��='),
('��%y\\ ���2lΥ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/BitrixInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>������WO���`H'),
('�)��}Xq��F =�\\\n�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/AsgardInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~������U�v���'),
('�+���g���q6�^\0�', 'wp-admin/images/wheel.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E0� q0m��\ZY%V�X�'),
('�+�7�7�*u5���7�', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V��u���H#⬌'),
('�1���.ko$''Ԧ��R�', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H4-�)�S�''E��&0\r\\'),
('�x�塩Ί�7��+V�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/style-rtl.css', 0, 'V�XJzN\Z�)���_�', 'V�XJzN\Z�)���_�'),
('ƃJ�{N\n����f��', 'wp-content/plugins/google-analytics-for-wordpress/languages/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('ƅ����|_�i/y��	', 'wp-includes/js/tinymce/plugins/media/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T�''�ڟr맡��B���'),
('ƓO���E��d�P��', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/light.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9W��M��K�����'),
('Ƭ+\Z���I�d^i <\0', 'wp-includes/js/jquery/suggest.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U�k�7*헸Hޞ'),
('ƯHCj,���;K����\Z', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/login-form.php', 0, 'J�����+��@���;', 'J�����+��@���;'),
('Ƽ����~9��~籌�', 'wp-content/plugins/wordpress-seo/inc/wpseo-non-ajax-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�''��V7S�Lŝv�'),
('��E������\0�����', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-&��26+*�-p�G'),
('�킊��5v�ɽ''��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/AsgardInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��~������U�v���'),
('���� �o����3�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/edit-form.php', 0, '|��sL�%M�h�#u�', '|��sL�%M�h�#u�'),
('�%�w��	7���ܳ�L', 'wp-content/plugins/papercite/tests/common.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�{��u,�Uf�Ly'),
('�,�ݘ�$�\Z=D�{g', 'wp-content/plugins/woocommerce/templates/taxonomy-product_tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`�����{�x3;���'),
('�=짹�An¨{��Y', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/.hgtags', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\r"�-�r�\0'),
('�u�+5k��ڔa��K�', 'wp-content/plugins/buddypress/bp-themes/bp-default/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&.u� �����H�'),
('ǂ-i)�.�\\���z�^a', 'wp-includes/Text/Diff/Engine/shell.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u�Aܑ�~J�^t����'),
('ǃ�ܱ	�o��xE', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-discussion.php', 0, '��ۈ�:���xy�U', '��ۈ�:���xy�U'),
('ǅ�9��9:���\Z�', 'wp-includes/cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd[҄ܢ\Zi���B��'),
('Ǥ>z�Ԅ��!J]>', 'wp-includes/css/wp-auth-check-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����"����_qm~�'),
('ǫ�=��m�/���^', 'wp-admin/includes/schema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�>\nV<�*ƭn�&b\0�'''),
('ǳ\\��_L-Y�Ō%$', 'wp-includes/ID3/module.audio.dts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�lA��E��O87�$('),
('��zo��n�i��$', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�^�5-/�\\��9��I�'),
('����ڃ뷷�n�qF', 'wp-content/plugins/woocommerce/assets/js/frontend/price-slider.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m��l����N'),
('��WJ��/!''<d1�l', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xM}�5{�$��d(��k'),
('����ϾB⌊��8�', 'wp-content/plugins/papercite/img/external.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V>�w;�f���f�'),
('�yN�Og�F-�\Zg\nC', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-order.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Z�<������j �*�'),
('�\Z{g��?�3gڢ\Z�', 'wp-admin/images/icons32-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%�*�����g����'),
('�"u@��T��S��5�', 'wp-includes/images/smilies/icon_idea.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��"m%h�����S��r�'),
('�?�v��n�w6x7', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/InstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u^P�A�P2����c5'),
('�E!�솉x�4��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�$w]"��Չ��'),
('�O&���z���m�Ho', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/members-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�c�,e�6ah=Gl߭�z'),
('�Y$''����o���', 'wp-includes/css/wp-auth-check-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ml�����?LI���H'),
('�fy''~��4�?9�f��', 'wp-content/plugins/woocommerce/i18n/states/NZ.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��v4''п\n�:	U\\2'),
('Ȇ���w�}�C�q��', 'wp-content/plugins/woocommerce/i18n/states/GR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�͉RZ#��[ܵ�b�'),
('ȉ4v�G��@�(/���', 'wp-content/plugins/woocommerce/includes/class-wc-order-item-meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j�-���`]1h����'),
('ȍP�� �3����\n��', 'wp-includes/class-wp-customize-control.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\���\r���1k[��'),
('ȢS�9�.v�{�Qy��', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ��G"$��q\\6�,%'),
('Ȯ(I���u�g1��.%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/themes.php', 0, 'ʳ��0����-�鶽', 'ʳ��0����-�鶽'),
('ȱ:�Dl1�D$B��PO', 'wp-content/plugins/theme-check/checks/lineendings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��1;�ky�_�&2d�['),
('��Q�q�}ޅ��[\r��<', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H-�f�+�q���E±'),
('��o��:���S��y�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/white-grad-active.png', 0, 'km.�W#*�Km���', 'km.�W#*�Km���'),
('�����~\r\ZK4(#��', 'wp-admin/user/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� ����ǀ[K}�Z'),
('�uj��e˗�R��A', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���=�\r�;=�:��'),
('�A7�''�C#�w�S�s�', 'wp-admin/css/about.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���� bd�-�u� ��*'),
('�lX�w��B�*X�W�', 'wp-content/plugins/wordfence/images/sort_asc_disabled.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Oɧ���*�X���9e'),
('��W��H-��yR9:(', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_LoginTicket.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@�n�=������}'),
('Ƀ�B�^��;֡L�+�', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''d�����G�Y����'),
('�����2D�i�e�', 'wp-admin/css/l10n.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S�^씗�	{m���w'),
('�''T��Qi@D��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/googleanalytics/test-class-api-googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Vиq�B�6QE�O�'),
('�!&�i�)^�W���R�', 'wp-includes/js/jquery/ui/widget.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i���E�")Ht�jto�'),
('�(�q�4P�}�5Oz�k', 'wp-admin/js/inline-edit-tax.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ZI=�S�g\n؜'),
('�;{�F�/w�gC�', 'wp-content/themes/hexa/js/customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Apm_,`ÂH\\���;5'),
('�P9)6��x�hf�[1HU', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('�R���ш�޿�0', 'wp-admin/css/themes.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n��1��S��]�o��'),
('�hFM<@`%q-��', 'wp-admin/includes/class-wp-filesystem-direct.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a���m��%�s)���W,'),
('�xjP�����!c�x', 'wp-admin/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Cv0��fᪧiR��K'),
('�x�C��u���+��Z\0', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Rest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uh��{�g�	qKO]��'),
('ʊbm:�Iy3���', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-most-stocked.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��<�8�''�k��\r��'),
('ʕ5���\rY�9K�PV', 'wp-content/plugins/wordpress-seo/admin/pages/rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9��;�� `�`hy4'),
('ʜ�A0��r0)�{��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/common.js', 0, '|h��XGR/��(���', '|h��XGR/��(���'),
('��\n��J.�婖 N�', 'wp-content/plugins/theme-check/checks/links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����	&���Pue'),
('��M�aN��`�:�,�', 'wp-content/themes/twentyfifteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�V|}�Yҽ��2��'),
('�}*�|Ēn�ˊ?d��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/RedaxoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F[|.�1��x�	&XfN'),
('��e��� �����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/readme.txt', 0, '�P��	���H́�W�', '�P��	���H́�W�'),
('�!��#��I|���F�', 'wp-includes/js/tinymce/plugins/directionality/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*��V���ʬ� Hy�'),
('�/#l$O7I1cE�%0', 'wp-content/themes/hexa/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�sB���֋�������'),
('�1X�7ҁX�0�K^���', 'wp-content/plugins/woocommerce/i18n/states/HK.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~�~�=���ڏ�N�'),
('�6�<��C�﮿�V:(r', 'wp-includes/js/tinymce/plugins/wpeditimage/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[%P���.�:�D�'),
('�U<�?Y,����ػ(', 'wp-admin/js/svg-painter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����fu���'),
('˃���*���ˣ+<h�', 'wp-content/plugins/woocommerce/i18n/states/TR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k��<�X6SZUDP>��1'),
('ˆ�J�X���X٣����', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-post.php', 0, '�\\�������sh0=?', '�\\�������sh0=?'),
('ˍ�G䯀oe���o�', 'wp-includes/js/shortcode.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� z�>1���J�92�'),
('˫�^��#�FR��~�r�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u\n{2/�rA�]y���'),
('�ߔ�t���K����E�', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/admin-menu-arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��N�{#��*��y\0�\r'),
('��6&f���������', 'wp-content/plugins/buddypress/bp-friends/bp-friends-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�T.��6�gA���P��'),
('��d�I�Kƹ�v\Z�0�', 'wp-content/plugins/wordpress-seo/admin/views/user-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Հj���-/�C���'),
('��Mݢ����[��9GS�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.formatting.php', 0, '\n�I�H���t�\n[S\r', '\n�I�H���t�\n[S\r'),
('��v�E,�-O�{���', 'wp-includes/link-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^���f��zOl�vL�'),
('��d<�D��Mapa��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ݳn��x����1����'),
('��|գ0A�H���h�N', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-users.php', 0, '�{ZV��q�X_)���', '�{ZV��q�X_)���'),
('�!�LT�3��i��x�', 'wp-admin/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�dR���pz	C��n�'),
('�+E���߼�ܸj{��', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pl_PL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J\\b�/�J�V�H��8}'),
('�/��!����B�"E', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����jA��7H���'),
('�If�9��߳�;[�', 'wp-content/plugins/buddypress/bp-friends/bp-friends-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�`�iM�1Su�A�'),
('�M�Tq&[?��>칊�\n', 'wp-admin/css/colors/ectoplasm/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q�9+�"��+��'),
('�V�ڮ����M��jӁ', 'wp-includes/js/plupload/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u&\n�TI�z����+�'),
('�Zs��;��4;�i�H�', 'wp-content/themes/hexa/js/menus.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/2x�wB��[��v��'),
('�d\\1�Ef��a�Ρ\Z�a', 'wp-content/plugins/woocommerce/templates/single-product/share.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	8��i��ֹ[%'),
('̄�uk�ٳ�Ae��', 'wp-content/plugins/buddypress/bp-friends/bp-friends-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B-�eX����Q�pa�9'),
('̕GL_�	L��]�忰', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nt?H�kTIU*Kل��'),
('̽� ���X�$oB�', 'wp-content/plugins/akismet/_inc/akismet.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';Q=1}��P�\0�'),
('�Ê5ff�;,G!''��''-', 'wp-admin/css/colors/ocean/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h�����w�\r�v4ж'),
('�Ǌ�E�v�c,�صyS^', 'wp-includes/images/crystal/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�]�Lc�iG�fQ�\r��'),
('�gslC�9m9FhƗ', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-driver-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���nO�#��T:�1�'),
('����p�j֛`��w', 'wp-admin/css/customize-controls-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c:`H0�n#��ݞb�Rx'),
('�d���lP�O��I�', 'wp-admin/network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E��Wj�y)�6Uk�'),
('���c���''6z��I', 'wp-content/themes/twentyfourteen/page-templates/full-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ce"��m���\0o�s�'),
('�)����\0�e�_�5=�', 'wp-content/plugins/wordfence/lib/diffResult.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'IY��Y8�\\@�6d''r#'),
('�?�uƤ8SV���Q', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/forum.php', 0, '�rt�	8���Ȼ��', '�rt�	8���Ȼ��'),
('�N��{��^wD$@?\n', 'wp-content/plugins/woocommerce/assets/fonts/star.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�v ������\0�9�(<8'),
('�]�pz\r{�H�Xs��0', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/style-rtl.css', 0, 'cOB����D�M�V�', 'cOB����D�M�V�'),
('�a��qb�OaI�-�\r*', 'wp-content/themes/twentyfifteen/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��j?�\\c�K[�o'),
('�b�/�Ɛ�q��+', 'wp-content/themes/hexa/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0��t��o��qh/��'),
('�w�9=�_"h%��v', 'wp-admin/css/install-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4\n�� �\Z�|�\n�'),
('͓�Y�36��l�Y��', 'wp-includes/js/tinymce/plugins/textcolor/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�S+*P�����#�'),
('Ͱ׭G�����!�', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}R���h5��A�m�'),
('ͽ3��=��O�G�|~�', 'wp-includes/SimplePie/Credit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��M猋*>\n�|'),
('�ƭ2�-mCj}�P���', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=�b�5�]��Dv''\r�'),
('�ϣ��.QD�39�"', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/charcoal.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"���Y�����c'),
('����j(g��~jU#��', 'wp-admin/includes/class-wp-filesystem-ssh2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F y!E$J��}�\0'),
('�<���Z&�u\0,E��', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-settings-api.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ʀ�% �OE� ���'),
('�_)-�]�ˌkO	���', 'wp-includes/ID3/module.tag.apetag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�7��l,�iwF�Q�ql'),
('�e�''�ݱ(n��0b_�', 'wp-content/themes/hexa/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''y��F�@���d"'),
('�i�N��9�������', 'wp-content/plugins/woocommerce/i18n/languages/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y�}���}�����F�'),
('δ�Z�n*��_%��:&', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+��{q^dF�^wE�{��'),
('�œ���ϔ�=��#6', 'wp-admin/images/post-formats32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WY~�O��{�+_L�kE;'),
('��,���G� �:�0�/', 'wp-content/themes/twentyfifteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7���Ҋ�F����v�'),
('���\0��)(���Οi�p', 'wp-content/plugins/wordpress-seo/css/metabox-fresh.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6��POe_��:sF�p�'),
('��q�sW�������', 'wp-content/plugins/buddypress/bp-themes/bp-default/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�a�������,�(<�'),
('�;��~j8����גxR', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AnnotateCmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�csD�h%�[p!�4"'),
('�-�+�e���m�u"��x', 'wp-admin/css/colors/sunrise/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�z�̃���UN4�'),
('�c0њ���L,/�', 'wp-content/plugins/woocommerce/assets/css/dashboard.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7F�N]�6�/��gl]�'),
('�p�k��<�ęܻ=', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/gray-grad.png', 0, '������ۂ/����-', '������ۂ/����-'),
('�uF��^G��E+��c', 'wp-admin/network/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����p�O~+�~�1'),
('π�tGȩ�����D', 'wp-includes/js/tinymce/plugins/image/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	1lgʒ<"�4�!�'),
('ϊ=��X���bBz'' �', 'wp-includes/js/jquery/ui/effect-explode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ssM�dV� �\\�'),
('ϊ&�>�2(M�v��l', 'wp-content/plugins/buddypress/bp-themes/bp-default/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W����[vi�a��'),
('ϊ;����!�b945��Q', 'wp-content/plugins/woocommerce/i18n/states/MY.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��RǲԂ�������'),
('ϗ��j�S��cr;��', 'wp-content/plugins/woocommerce/templates/global/wrapper-start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Weɗ�#�I*�'),
('�����HԹ��f�k�', 'wp-includes/js/tinymce/wp-tinymce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7h>=�bHn<�Ҫ�Z'),
('�ݙ�P(���O''E��e', 'wp-includes/js/jquery/ui/effect.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d/����A���b�v'),
('�ݚ�y.\0��؜�i�', 'wp-content/plugins/wordpress-seo/admin/class-admin-user-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H+��ִ�lqQ׉l'),
('��\Z�Aoӄ"�(-&', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J>�����@''lr/�'),
('�/�%*�*i���', 'wp-content/themes/twentytwelve/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z��k\\���8F2Y�A'),
('�>�s�l�WD7�M�', 'wp-includes/bookmark-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���!m<\r������O4'),
('Ї�7u���O�	�	�', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zN��+\05���'),
('Њ�\\��|_߼�؉0', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':�>��=���e`��(�'),
('Т�펹�|����@', 'wp-includes/images/smilies/icon_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ʵ	�������('),
('е7���	�� w', 'wp-content/plugins/wordpress-seo/admin/pages/xml-sitemaps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�,��Yb��}4�H�{�'),
('к�l���q��m�', 'wp-content/plugins/buddypress/bp-activity/bp-activity-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uk�����ѐ���T'),
('��^�\\�X�PvS�\\�{', 'wp-admin/js/media-upload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_f����b�f��\n��'),
('��ۡ�`�A�;ʾ���', 'wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���P���Kǌ܈`'),
('��u���$�w��L�2', 'wp-content/plugins/papercite/img/warning.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nZ���k���,s���'),
('�vIu�.>�Ųv��,', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[��p�^��堪��'),
('�\Z���j>O9o���!\\)', 'wp-content/themes/twentythirteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B;��a`GԢ�މ'),
('�M�P�8�Uk��T���', 'wp-content/plugins/google-analytics-for-wordpress/googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q>ɯ�]������b�\r�'),
('�R~m�L~:��v�w', 'wp-content/plugins/theme-check/checks/required.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�ʊ͢Pݧ,ҝ��}'),
('�X+��B{�8}J��@|', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.plugin-api.php', 0, '�E��K�ֈ�9ٽXV��', '�E��K�ֈ�9ٽXV��'),
('�X0��dn ~�8)rG	�', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_admin_dashboard.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?��9��''�#��v�M�'),
('�_\\c9mL�v��1���', 'wp-includes/compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)g��	�]5��\nb�'),
('ч���j=�d壱', 'wp-content/themes/twentytwelve/js/navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n&ܮ_7�}��D3�Զ'),
('ѫ_w��_��),��U�q', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu.png', 0, 'AV�0et3�s���', 'AV�0et3�s���'),
('ѱր����0\Z�����', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/Sorting icons.psd', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�(}�r�r<5oܴ�='),
('Ѻ��%|O�����-''�', 'wp-content/themes/twentytwelve/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���u8^PC܄>����'),
('Ѿ#��cZ����K��^}', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���r9�8e�z��`'),
('��1�Fz,+i�Z�F��', 'wp-content/plugins/buddypress/bp-core/bp-core-template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� mp�p������'),
('�đ�EXXD��nm#a�', 'wp-content/plugins/buddypress/bp-settings/bp-settings-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ��x^�����`.��'),
('�ęaӶ���_cGj�', 'wp-content/plugins/woocommerce/includes/class-wc-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���G����0�k�8'),
('��v�A�]ՈL?���p�', 'wp-content/plugins/woocommerce/assets/js/frontend/country-select.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����O&��1�Ҏ�M�'),
('�����YA�VH��', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_desc.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ِIuy��vH��/'),
('���\Z��Ka��_=', 'wp-content/plugins/buddypress/bp-members/bp-members-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N����P�4t��i���'),
('�����߀[���n;Z�', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-graph-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';A�p:��i�9��<��'),
('�Jh|��0�`Zp�E', 'wp-admin/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�n65����ʚ��LޗP'),
('�+qK(�e�$k�\\���', 'wp-content/themes/twentyfourteen/content-gallery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��&ΜQWƗ`��w'),
('�`����8�"N�T�', 'wp-content/themes/twentythirteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����o�Gi��sn)m'),
('�s��]z,V��8�0', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/group-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ӭ�/�"�|Jor��.'),
('Ҟ����ǟ�	Ks���', 'wp-includes/images/icon-pointer-flag-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���2�b��&�Z�r'),
('Ҫ*���H���\n;t��', 'wp-admin/includes/ajax-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�e��C`�6�lF���'),
('ҲE5|�ѵ�C�d闼', 'wp-admin/options-reading.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.K�++���6"8��u+'),
('Ҳv=���yn���', 'wp-content/plugins/papercite/screenshot-3.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��T�2��S~���h7'),
('�̾���\ra���g)�"', 'wp-content/plugins/wordpress-seo/css/metabox-classic.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-1�w�-�����8}'),
('��Lt593�u^���)��', 'wp-admin/images/comment-grey-bubble-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�TY�ŝ2�s,\r�m��'),
('��U������Z��kX', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-collector.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p��Z�vGӚ"��R'),
('�����@#bbEL�;��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/stats.php', 0, '�-ts(�2�K�X���', '�-ts(�2�K�X���'),
('�&)-â�\Z�Ι�p', 'wp-content/plugins/wordfence/lib/GeoIP.dat', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vGi5���\\�-7��'),
('�E#l��L��_&ܪ���', 'wp-admin/images/arrows.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�v�$�>����>�Y'),
('�F.�,%}\nKД�P�', 'wp-content/plugins/siteorigin-panels/tpl/js-templates.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|S���5�D�;&'),
('�js��w2��p��qS', 'wp-content/plugins/wordfence/lib/wfIssues.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9����e����k7d'),
('�{ڭd3T�Xy����7;', 'wp-includes/css/admin-bar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+N�#��Ä(�^RMj'),
('ӎ=GK����@V�S', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-duplicate-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~ݿ��k�$w�0�\Z]'),
('Ӗr\nx���+�)�gE', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/ClassLoader52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ȹ	�Z^��+�}i��'),
('өa�FG��5������', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?''�� �K��>����'),
('ӹ�''?meU!�-2�v', 'wp-content/plugins/woocommerce/includes/gateways/paypal/class-wc-gateway-paypal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������\\�����'),
('��c�Ř�B����p�"', 'wp-content/plugins/woocommerce/assets/js/frontend/jquery-ui-touch-punch.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YL�x��k�b҂K�'),
('�دx��^�Ȭ0Mˡ�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MicroweberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hf6}2w��d���q�'),
('��>Zb�o&����', 'wp-content/plugins/akismet/views/config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kjސ�\ZD�_7���'),
('��x\Z�������', 'wp-content/plugins/woocommerce/includes/class-wc-cache-helper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']o��Qlm;��ì�6�p'),
('��)*�"��Dh', 'wp-content/plugins/papercite/format/harvard.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��@���<��q��78L*'),
('��N\Z?�>�o���S', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z����-�fm�֙'),
('������0*�W��', 'wp-content/plugins/index.php', 0, 'gD,V�=\\�bP', 'gD,V�=\\�bP'),
('�����}�vϣ��G�', 'wp-content/themes/twentyfifteen/genericons/Genericons.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '→��(��7k�j'),
('��u�&?��y', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/script.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��D�VOG���p<�3k'),
('�HdK�%9�`U�R', 'wp-content/plugins/buddypress/bp-core/js/jquery-cookie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H�7�R�\Z�9{�գ*'),
('�H}�FI���I�ȕ', 'wp-content/plugins/buddypress/bp-core/deprecated/1.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cl�*,m�q�)@Ѵ'),
('�J���3�K�ag���s', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-fa_IR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�5d�ƾ^"���&�'),
('�W\ZeC����Du��', 'wp-content/plugins/wordpress-seo/frontend/class-twitter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�lq0S�8�YL^�`P'),
('�].�oo�ȦM-n	�', 'wp-admin/images/align-none-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�XC�)[���-�4�'),
('ԝ�r��y2�k�A�', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/settings-paypal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r�d�����twU`4'),
('ԯ����؋���bֳ�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MicroweberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hf6}2w��d���q�'),
('��<�W�	\ZM^�D�q', 'wp-content/plugins/woocommerce/includes/wc-conditional-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��*B=xK���2.��'),
('�Ȇp���]4��L��q�', 'wp-includes/css/admin-bar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����1�J�-8Œ�7'),
('��p��S��`�]T]D�', 'wp-includes/css/dashicons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ώS\Z��yR�zC��d'),
('�������b�B���', 'wp-content/plugins/woocommerce/assets/css/_mixins.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��o��o�bq�W`��'),
('���ӗJ�%�%h�c�%', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_enabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��d�!���x�=�q9u'),
('��P��L.6�6y<��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/HuradInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�U-0�7���\n}m�\\^'),
('�X��$�a��B��^', 'wp-admin/js/user-suggest.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��T\\���\\|�\r�9�'),
('�&�d\0��n%��>���', 'wp-content/plugins/woocommerce/includes/class-wc-geo-ip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'bA��s*�L��͠�96'),
('�M��]>N�\Z4�?��I', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-usergroup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n��#<3}�K�X��x�o'),
('՟�S<t�/f�+"��[', 'wp-content/plugins/woocommerce/includes/libraries/class-lessc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d�*e膨��;��'),
('շ�5�C��E/.�Q', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/visa.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L���evq�KL}��J'),
('���� Z�/:^ $�	', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��dI���^s��ll�;'),
('�笎�Ը�s��*	�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/login.php', 0, '^\0�\\�dh��بN��', '^\0�\\�dh��بN��'),
('��g�IqQsu��\Z�e�', 'wp-content/plugins/papercite/lib/BibTex_osbib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�o-i���8��Ǒ��'),
('����ͤ6�\0/��k���', 'wp-includes/js/imgareaselect/jquery.imgareaselect.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\00ԺLB�wm#��wu�:'),
('� -"�?TD�_�m���', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����$f�X�n��s�Q'),
('�nIm[�_�zl�翂', 'wp-content/plugins/woocommerce/assets/js/frontend/chosen-frontend.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&S�>ۦE�X�G߾''�l'),
('�Z��	r!ޏf���	�', 'wp-includes/images/icon-pointer-flag.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��,���E^�j`'''),
('�oҨ*K��o�7{� <', 'wp-includes/ID3/module.audio-video.matroska.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Y�!�Z0zDj&Cp�'),
('�rY�S�xwDY˚J�[', 'wp-includes/images/media/interactive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R׬˂���ôŉh�H'),
('օ|6pG6�H�)/m;', 'wp-content/plugins/buddypress/bp-core/deprecated/js/jquery-scroll-to.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`k��/a<��1i��R�'),
('֠q	��B�q��Ƽ�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_both.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��O�"K���v#�\Z'),
('ֳ)����vk�''�\ry5', 'wp-content/themes/twentythirteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4b��-�+l��'),
('ֶ��9؞f�po3t', 'wp-includes/class-wp-admin-bar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���?����\Z^W�Ψ'),
('ֽ�B��m�O�*�:q�z', 'wp-content/plugins/wordpress-seo/vendor/composer/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����~�B�6'),
('��J���!�[W6ݧ��', 'wp-content/plugins/wordfence/lib/IPTraf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��t��Q.q��=膫�'),
('���07�e�	�ӟ\n�', 'wp-content/themes/twentythirteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ɺ���庖�4'),
('���v#�9���)?Ip�', 'wp-content/themes/twentyfifteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?<h���>C��Bq��p'),
('�\rn8#Ô��9����|', 'wp-content/themes/twentyfourteen/images/pattern-light.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i���Gp�j���Sݨ'),
('�Q�,��v�7', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5o��ؙ��:,f��I�'),
('�"�̃tq)��l@;̏�', 'wp-content/plugins/woocommerce/assets/js/frontend/lost-password.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$�����d�}�ψA�5�'),
('�Gȩ��6����\0Y', 'wp-admin/includes/class-wp-posts-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i�*\n��]Z����h');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('�|����S�Ru�[\n�', 'wp-content/plugins/woocommerce/assets/images/placeholder.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/���1I�c��f�'),
('׉��\r擬xCy�q�ns', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DrupalInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ճw#��R�mR)����'),
('מ�y�7mE5���O_�', 'wp-admin/js/media.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\ZP˥�d''��1(�'),
('ײ2�D�ɻ&-u��	', 'wp-content/themes/twentyfifteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B�5���^�\0�`�C�'),
('��j0���w�E}®R�', 'wp-admin/css/wp-admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')�9���2�E�p�\0'),
('��^�u����}�G��', 'wp-content/plugins/wordfence/lib/email_unlockRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� �E�28.63R��'),
('���M����R�N�a �', 'wp-content/plugins/wordpress-seo/admin/class-bulk-description-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%���i����e��\\���'),
('��\Zv�I:wm�''~K-', 'wp-includes/ID3/module.audio-video.riff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�TfbpGO�-�'),
('��_��#<BܽI', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-base.php', 0, '''V����/^}&��ͼx', '''V����/^}&��ͼx'),
('�&�Zh�$�Éo�', 'wp-includes/class-json.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L�SA���̈́���%\Z'),
('�8/B��$8���`m�', 'wp-includes/js/imgareaselect/jquery.imgareaselect.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U���K(t���0���'),
('�A�h)I�\Z]Gr���E', 'wp-admin/includes/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9[o.�I�R���\rkH,�'),
('�E�Y��: ��߻��M', 'wp-content/plugins/theme-check/checks/content-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%3��ک�!�`P1�'),
('�M&�3\r��3CMaQ{', 'wp-admin/images/yes.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�+��7܉�\rqZ�Qk'),
('�_�`O�/鋏G\\0�A�', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��^$�1e�h�E��cz'),
('�eO+ ]jq��t�"]', 'wp-content/themes/twentythirteen/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�1k��\ZN��+�>�'),
('�o�ǣ�	ף�f0�Y', 'wp-includes/SimplePie/Core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���#��������\Z�'),
('�v����\r���&X��', 'wp-includes/js/jquery/ui/selectable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�G�P��H�w�����'),
('ؐV\\=lS��l�J�&', 'wp-content/plugins/wordfence/lib/menuHeader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vB��p_0*�k8�oG'),
('ؕ����J��7a��?�', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u"y��!��.q-����'),
('ؚZ����Ƙ��c��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg-side.mo', 0, '�*/��tñ�LE��F$', '�*/��tñ�LE��F$'),
('�����_nZW3�%HO', 'wp-content/plugins/woocommerce/assets/images/storefront-bg.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���=ֲ�(kZ��7�'),
('��=������e�,���', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[7<���;.���+7�'),
('��iѧ9$���z�', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-menus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<��X�a\0�l�W:Y'),
('�,(�i7:^�^�#', 'wp-includes/js/tinymce/plugins/paste/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r|�}N3�d�=9'),
('�;�:ǝ\\�4t�YB�', 'wp-content/themes/twentythirteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���<	�v��q�2	��'),
('�J��^\Z7��uG�k+', 'wp-content/plugins/wordfence/lib/wfDB.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����$y��''�Z��N#'),
('�dT҅:C9$�� �΄9', 'wp-content/plugins/woocommerce/includes/class-wc-customer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LG��{��Mk��l>|7�'),
('�k��/y�����&��G', 'wp-includes/images/rss-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ya[�Q�����rj�'),
('�s[�c������', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/topic.php', 0, 'hd�\nd�(+���%e�', 'hd�\nd�(+���%e�'),
('�w��v?,��ц��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg-side.po', 0, '_�qۅ��M�Gǘ��', '_�qۅ��M�Gǘ��'),
('٘�"P�ܞ��,���', 'wp-content/plugins/wordfence/images/icons/ajax24.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K:�����m𙗣P�'),
('��ʭ�c��c�L��en', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/cacerts.pem', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r�o܁���\\�܆��'),
('��!}�=�`*�gZ=', 'wp-admin/network/themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&��nmZo=O�{�o'),
('��>�~�!�g�q��', 'wp-includes/js/tinymce/skins/lightgray/skin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-�uw*S������-�]'),
('�N�2���_]�]��b>', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�J�h�#�Y�i�d�8�'),
('����;�-qu%�S\Z	n', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-api-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2~�0�+u�o�c�I(�'''),
('��w�=Ţ�O�&�F�', 'wp-admin/css/colors/midnight/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&܍���|DW��!E�4'),
('�''�����<��6��Bt', 'wp-content/plugins/woocommerce/templates/archive-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"Hƿ�H��5�D\n舙'),
('�\\\r~L�5k��p\r`�)', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T�Js�w�lAСX��'),
('�aI��_;$�Ɋ�D�', 'wp-content/plugins/siteorigin-panels/widgets/less/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M9��U��Wݺ�Lg�'),
('�|�#�԰#�{�����', 'wp-admin/js/link.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��F��0�;���3�%-'),
('څ�η�+	v\rI���', 'wp-content/themes/twentytwelve/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A��pk|q��A��'),
('�ǖ��Kd� 3�LiC�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/forums.php', 0, '�-��t=D��ԥp]��\\', '�-��t=D��ԥp]��\\'),
('��!�(t��<Թ', 'wp-includes/js/heartbeat.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� �	�1�]�d*D�G'),
('��_\r�JL�#�@B��', 'wp-admin/css/colors/midnight/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"����+�¾0��'),
('� �I�_X�����?', 'wp-admin/js/gallery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�o����m���dOo'),
('�$��w��^�(�;p#�p', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��n8	Ar�8Ec�g�=+'),
('�4�5N��~��<�(l�', 'wp-content/plugins/wordpress-seo/css/adminbar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����W� ����%�6*'),
('�>T�X��WYZ�l��', 'wp-content/themes/hexa/content-single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f��K����t:`'),
('�L&-�^��=@ȷ4�', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',S�R�J�<�.�'),
('�g�ˑ\0|��7D����d', 'wp-content/plugins/woocommerce/assets/images/select2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�v� SW�aZ�I\0'),
('�vyܼS�x�t7�^��', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/pink.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ѭ������r��0'),
('ە���ֈQc@xŞ', 'wp-content/plugins/woocommerce/i18n/states/NP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@ *M��}���1427�1'),
('ە��|�"D�,+]l=', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/KirbyInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0�57ܚ\\Ңʮ�D��M'),
('ۖJ�Bw�C��|M�v', 'wp-content/plugins/wordfence/lib/Diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R|�$����V;P����'),
('۠5��D꘎�˵>mD�', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-images.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}u�R"@��w�+���'),
('۪���	.�ո�\\���', 'wp-includes/js/tinymce/skins/wordpress/wp-content.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���ChC��\Z���ea�'),
('ۿ���n\06V\r+4%�̀', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/groups/invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?�t�����f�'),
('��r�����؁=�Ԓ�', 'wp-includes/images/rss.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��[�(�.��*NZ�'),
('��m��f�H��5�UQ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MediaWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#S�]�r���\Z�H�'),
('��\np���Gnu:���', 'wp-includes/js/colorpicker.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��V g�����-�'),
('�⩄96(n���L��;', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/jquery.zeroclipboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/��,Z�'')��h#��&�'),
('��vPiZ޴8W����', 'wp-content/themes/twentyfourteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z��k\\���8F2Y�A'),
('���r�x�����7�', 'wp-content/plugins/woocommerce/includes/class-wc-emails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.�ف�:�)�Vw�'),
('��L=f3,$�_��f���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-scripts.php', 0, 'L����2��Y����', 'L����2��Y����'),
('����o�]x�٘���F', 'wp-content/plugins/woocommerce/templates/single-product/product-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ko��� �Z��-0'),
('���\0W��J�6i��w', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/large-play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�QԌE�.�瀥���'),
('�ȼ�؟�''\r`����', 'wp-includes/feed-rdf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<C���H�,D''��7i'),
('�p�D�t(!-G��>�%', 'wp-content/plugins/wordpress-seo/images/Video_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������B�>}�mR'),
('�֗��0c���j6��', 'wp-content/plugins/woocommerce/templates/checkout/review-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']��L���N���܊���'),
('�2G�?�_��\\���-B', 'wp-includes/canonical.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������Ǽ|���N�e'),
('�;�A��PӝZ��y���', 'wp-content/plugins/woocommerce/assets/js/frontend/address-i18n.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����JdՂ�+'),
('�>ڨ\r�;�,�lY5�o', 'wp-content/plugins/woocommerce/includes/class-wc-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=�<}qz���RXr'),
('�F|\n�MN,8�ݪ�''�', 'wp-admin/css/press-this.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B]��B��RT�4��'),
('�P#�\\�6�\\D��Ԏ', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?�܉k�JQZ���ys!'),
('�\\���~��G��J<Z��', 'wp-content/plugins/siteorigin-panels/inc/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X-� h�yA��d�<\n�'),
('ܩ�]c\Z��O�*�`�', 'wp-content/themes/hexa/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���Gv9;�hT<�R��*'),
('ܶO�;hTI�����', 'wp-content/plugins/woocommerce/assets/images/icons/edit.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\n��ƻ3���a��+��'),
('��\r\0FJ��B��e�', 'wp-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Irj��|C�D�B��'),
('�4_;���g�љ���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/autoload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����٧�-��k,'),
('�J0����j�Yg�h�', 'wp-includes/js/tinymce/plugins/lists/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�[�?��(�����|'),
('�[6�5��+�	�n9�', 'wp-admin/images/sort.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.�ˍ���lHj�]'),
('�f��y���ħ�*!', 'wp-admin/js/nav-menu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�0wX�ͥk�!�E��'),
('�{fZ���ߥ���	�KQ', 'wp-content/themes/twentyfourteen/images/pattern-dark.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E��[�.�t5��\0k'),
('ݖy����U�xM�	��', 'wp-content/plugins/woocommerce/templates/global/quantity-input.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��:H�Z��rY��GX�'),
('ݦ:�{�Js�E,Q�a&', 'wp-content/plugins/woocommerce/dummy-data/dummy-variations.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z1��M�_��2r��'),
('���3��E��kW�-@	', 'wp-content/plugins/wordpress-seo/admin/pages/permalinks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_{���K!w&���'),
('�3^��PM�Y���H�D�', 'wp-includes/js/tinymce/skins/wordpress/images/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�¶��B�=\rz��3j�'),
('�Dw�y���3e�z���8', 'wp-content/plugins/woocommerce/woocommerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o8zؗ�ET�4��H�'),
('�N�\\�|�`*�,)@4', 'wp-includes/images/xit-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��r�T��`��?J�/�'),
('�^�K^�8v�8���', 'wp-content/themes/twentyfifteen/content-search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<CUy�Q�O���b�'),
('�j�K����K�T\r<���', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6�PI�?���V�F�cF'),
('ބ�p����AuN���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.passwordhash.php', 0, '�x9�p�x�\\����', '�x9�p�x�\\����'),
('ޠ�����@w�c!�', 'wp-content/themes/twentyfourteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/�P���d+܈��|��'),
('�ދ���1F����a�', 'wp-content/plugins/wordfence/lib/wfArray.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��e�my��V�M�\Z��'),
('��''g!�:�H��),�', 'wp-includes/SimplePie/XML/Declaration/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���p(Å��B��s#b'),
('��m�����F���', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_notices.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R�����=��s�T�ц�'),
('���`��BE�\rDw쭸', 'wp-content/plugins/buddypress/bp-core/css/admin-bar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)�T��-	Tⲋ��'),
('����"�����c)j�"', 'wp-includes/js/wplink.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Չ0�� �3�9�#'),
('�2+gO0��8,h���', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.core.php', 0, '�P��P�=P�	���ʎ', '�P��P�=P�	���ʎ'),
('�=Fh3{DW}��!b��', 'wp-content/themes/twentyfourteen/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d���k��I�9<�'),
('�FI@OR}�t��a�dW', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-webhooks-table-list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ė��F�u��`��'),
('�L��1.��d&�E�]3W', 'wp-content/themes/hexa/js/skip-link-focus-fix.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���!E��fC�5'),
('�`�9���v"V�s/���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/SMFInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�I�0�mj@0�%�U�'),
('�g��]�Ҩ[����', 'wp-content/plugins/woocommerce/i18n/states/IT.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-���wА�Ը��q'),
('�q����%ű� m+', 'wp-admin/css/colors/light/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���f���^���_'),
('ߌ��(������2���', 'wp-includes/js/quicktags.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rz\0�j��7%��\Z 4'),
('ߖ/�2�Z��{�6��', 'wp-content/themes/twentyfourteen/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Gm��Y��8�8'),
('ߗ�Q��u�!ٶx�[', 'wp-includes/js/wpdialog.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-���\0�g\r�Fġ�'),
('߽u��2m����w��F', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-json-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��B���AJ�0y�ɂ'),
('���E"�,V1�=Y��', 'wp-content/plugins/woocommerce/templates/emails/customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L�;P@vg��Ǟʜ�'),
('���6��9&�����R�', 'wp-content/themes/twentyfourteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b$��FS4�M�R�;'''),
('�W".:�fO����', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+~9�;���#�\Z4�&D'),
('�&p��[���?Φ�', 'wp-content/plugins/buddypress/bp-core/admin/css/common.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2d���\Z����:'),
('�%�f\\+,���\0\\Y', 'wp-admin/includes/class-wp-filesystem-base.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	����%?�إb�[�'),
('�\\F���2f�m\\ի�+�', 'wp-content/plugins/buddypress/bp-core/bp-core-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��<N�''�qt��)J2R'),
('�|��B�����5Y��', 'wp-content/plugins/wordfence/lib/menu_sitePerf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ϳ"��x<�%��+�4'),
('�����𒿟�����', 'wp-content/plugins/papercite/screenshot-1.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��g�0RzN,d��I�'),
('௮NN��%dB8��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/view.php', 0, 'S�e䳋�\\TT��J%;', 'S�e䳋�\\TT��J%;'),
('���3A��8#', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������h$�oG�[��'),
('��\r\0S�Q���c\r�', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���4x�Ͷ�����9='),
('��^��bR��SI�!�?', 'wp-includes/class-wp-image-editor-imagick.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�蕇��	$,�G�'),
('�A	!f�Y�j=	qQ|H', 'wp-content/plugins/wordfence/lib/menu_sitePerfStats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0''�+�H��	����i"'),
('�H����7�汙�K', 'wp-content/plugins/buddypress/bp-forums/bbpress/favorites.php', 0, '�c�\\FYw�7s/Z', '�c�\\FYw�7s/Z'),
('�Kf5��**��ۿ�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/.hg_archival.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�8�[�0�����?[L'),
('�Y�	���[R�	d�!)', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Model.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��OʜI�,���/��'),
('�Z���(>(�1bޫ�Z�', 'wp-includes/js/tinymce/skins/lightgray/content.inline.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VBup=��;���t70�k'),
('�]C�SO�Dpԝbsds', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ShopwareInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��޹M+�-���6�\\f'),
('�q�@/��ꦑٞ-M�', 'wp-admin/network/site-users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�޴"ǔJ�m$���/'),
('�Hи��o%p�k}��', 'wp-content/plugins/woocommerce/includes/wc-template-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#�2��O�ϯ��ُ�"'),
('��o2n2�}�:����', 'wp-content/plugins/woocommerce/includes/class-wc-language-pack-upgrader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�z�W�����ٿWA'),
('��J ��A��v1he�', 'wp-content/plugins/wordpress-seo/css/yst_plugin_tools.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K��P_MM�\0�VS�W'),
('��\\9ã>���Iz4�c', 'wp-includes/js/tinymce/plugins/hr/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��<�<{LU798�ۆ'),
('�D�����', 'wp-content/plugins/woocommerce/templates/checkout/cart-errors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m#�\rU����"m��'),
('� *�s\\�O��il�', 'wp-content/plugins/wordfence/lib/menu_scanSchedule.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qy�b����1�s'),
('�Eڑu��h������q', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WolfCMSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LĜ��L�Ȑr4�r'),
('�L�>�ٟ�#{6p}Y��', 'wp-admin/options-writing.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�e��c�\Z\n�6�PK�.�'),
('��|`Ӈ��,��&', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-addons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9p>���\r;�cT�J�'),
('��ĸ:�,p�1��Hr', 'wp-admin/js/dashboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ܯOh|lR<���QR4��'),
('�\0��וoxi3%\r+]kg', 'wp-admin/images/post-formats.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�K���\0���%3���'),
('���|�T{��✞�&', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ma�2�Wп�Z��<'),
('�/}ə���$n��r�', 'wp-content/plugins/wordpress-seo/images/banner-woocommerce-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��4�E,�a�����U@'),
('�0�;�-,�A�Ey�', 'wp-includes/theme-compat/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>\Z���"}Wuo���.H'),
('�L$�@��]����%+X', 'wp-content/themes/twentyfifteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a������� �[�`z'),
('�a�Oj''�ŻD*ցV4', 'wp-cron.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�*�db�iD�x�Z�'),
('�e˿�fi茘`��\\', 'wp-content/plugins/siteorigin-panels/widgets/less/mixins.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':\0��v��j�+���'),
('�i��H���i�$��)�', 'wp-content/plugins/buddypress/bp-core/css/admin-bar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n�9��^��x���V�'),
('��q�82��v�&#M', 'wp-includes/js/tinymce/plugins/wpview/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����5�Nv�ll:��'),
('�䱈�\r���w3ι9�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/JoomlaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\0fHpg!N�O�'''),
('���<kUJv%��1��', 'wp-includes/fonts/dashicons.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ez{�C7|�2�'),
('�w����V���!�', 'wp-admin/includes/class-wp-ms-themes-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(�''��O�Sd�����'),
('�m�]�c�8��+��\ZR', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-http.php', 0, '��Y��*5�ƈjU�E', '��Y��*5�ƈjU�E'),
('�ry @r��t��c�IF', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/variable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S��G@&��\ZLm�KF*�'),
('�x���S�L�W�0�\Z��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/friends.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ko��0i=�	E-�x��'),
('䓼rK\0����vOM��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/forums/topics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '۔����2^�����{�'),
('�I*�yu�)B���w', 'wp-content/plugins/woocommerce/templates/checkout/form-billing.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����i��1�]���v�'),
('�����.���1�e��%5', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��";�E�ؒ�Ι�b'),
('����zpKC�{\\>��', 'wp-admin/js/dashboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9�sE�/�\Z<S�(�ş�'),
('�ਗ਼�|n����|�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/PimcoreInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�;��1��cH�$G�$��'),
('���1�]�M|�K�FZ', 'wp-content/plugins/wordfence/lib/wfBulkCountries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}���M슱���_#9'),
('��\00��q�ĊNy)��', 'wp-includes/plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':�&���{�*���rH�'),
('�\r�`}xJKsʩ���', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��j���b�J"+�`�$'),
('�̈́q|��~�P�w�G', 'wp-content/themes/hexa/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r3��h��>�J'),
('�3���K�ـ<���', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0!�jz�Q8�*(��7'),
('�R��5?�- S�^H��', 'wp-admin/js/editor-expand.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/7�!��z���{��C'),
('�f�M%"$�	����s�', 'wp-content/themes/twentythirteen/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z�ጘH��@���w'),
('������bW��A�#', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�-�tjO��1m}p�'),
('�-қz��H��m��', 'wp-content/plugins/siteorigin-panels/tpl/help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�"�����E1�8'),
('����8�|L�P�	', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_psr4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:\0��>������}LQ\0'),
('�d4\0n�rz����a', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>��REځf�K�pPɂ�'),
('��r��y70��쨒Ӧ�', 'wp-content/plugins/buddypress/bp-messages/bp-messages-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Y��oӱ�\nKQ�j�'),
('�*��W#��\nE�\Z�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1�ܼ''Z�y�{��'),
('�\r�b\\��ɍ�\Z��', 'wp-admin/edit-form-advanced.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�?൹0�Vf���'),
('�e��ۗģ���;:3', 'wp-content/plugins/buddypress/bp-core/css/buddybar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�[��X��ؖ=9�E5h'),
('�3W�	�� #l�2�)[', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��co�G��e(mr'''),
('�G��5�@����07��', 'wp-includes/images/blank.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�+��51	��f]��9'),
('�h���2M�	�25p�', 'wp-content/themes/twentythirteen/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ر.����y���j��G�'),
('�jI�!W������*:G�', 'wp-content/themes/twentyfourteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%쯷�)�M�r;6�'),
('�xԛ:��#-�V�`�8', 'wp-content/plugins/woocommerce/i18n/states/MX.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��M�Co�^�O`j���`'),
('様��7�^��b�"�', 'wp-content/plugins/wordfence/images/back_disabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h���g���i���>'),
('�����uQn���+', 'wp-content/plugins/woocommerce/assets/css/activation.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':f!������5k,ivu'),
('�Oy�uԖ''u�⩎af', 'wp-content/uploads/2015/03/uaiblanco-150x150.jpg', 0, '�%��"��iM{\0rů��', '�%��"��iM{\0rů��'),
('��W���"���Sk:�', 'wp-admin/images/align-center-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���-�r�5*J7�If'),
('���ť�X����Q��', 'wp-content/themes/twentyfourteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0$j7�`����!�h���'),
('�⣣�M�O����U�', 'wp-admin/js/editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z�+�y�"h��叒�'),
('��c�^Z6��#�u��', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/call-to-action.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�?�jK�.���K`'),
('��WN,\r�0r�h�@�', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l��"Wm��t��`a�['),
('�(s$�u<ҍ4��*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.shortcodes.php', 0, '����#2#�X�0�h�U', '����#2#�X�0�h�U'),
('�����\n�	��a��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����;���/��:'),
('�"�ơ���7vs+�', 'wp-admin/includes/class-pclzip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '67(�C���ki��8�'),
('�B����3y�ϫ0�', 'wp-content/plugins/buddypress/bp-themes/bp-default/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0������D�S��_'),
('�b`K�''��컜���K', 'wp-includes/functions.wp-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gxFtyXNg,4�~�J'),
('���x��Agm%����', 'wp-content/themes/twentyfifteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�lC�n���/���'),
('�J��ёe�\rXd��$�', 'wp-includes/class-wp-customize-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k���@Mt� z�n|��'),
('�xuսT?>I�F^$�', 'wp-content/themes/twentytwelve/sidebar-front.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k��,�������ߵ'),
('�l�XNEM�CgVsA:', 'wp-includes/js/swfupload/plugins/swfupload.queue.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�SR/�J��5�-v͏'),
('���K�g���o#�0', 'wp-activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pUȪ�N�ੌ�{eG�'),
('�ŉ�	i����/Э', 'wp-includes/formatting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n��S�G=�0n#Vz�'),
('������Y��p���1', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-frontend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��fѯC!���'),
('��H���l��{!D#�!', 'wp-admin/js/color-picker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z�}"[}����P-�)'),
('��F�ZY��C8��3E', 'wp-admin/css/colors/blue/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�}�R���N\rSO�\0�'),
('��cQH&6�J>\Z���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's�.�>���\Zc����'),
('�%y�>}H�o���(6', 'wp-includes/js/jquery/ui/core.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g1D�����*x⬓��'),
('�?I��\rr����6��4a', 'wp-content/plugins/buddypress/bp-friends/bp-friends-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q%�\\c����''�'),
('�aq��/����ʧ��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-forums.php', 0, '''Ch�iw\n��n�A}B�', '''Ch�iw\n��n�A}B�'),
('�e�u�8��=��E��', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/OctoberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����%�U3�GJ$��#'),
('�f�i�`�=@T��o�', 'wp-admin/images/spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����1c~''�dv�vHq'),
('�w��z�Ow��(q+���', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C��u&ϛw>^��'),
('�{h��=2=a�Ϸ�', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-fr_FR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý��M#�L�����'),
('�J���y��0m�`�/', 'wp-includes/class-IXR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����O��i�*�/'),
('��$-��hꍪr�3K�', 'wp-content/plugins/woocommerce/assets/js/admin/settings.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�avt\\!!W�"��'),
('���E2����:�1', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',�Ӥ_�����B�J�|'),
('���Q�o�H*���(�', 'wp-content/plugins/wordfence/images/sort_asc.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',��I��+ƾ���=��'),
('���ϪZ��-7��5%�', 'wp-content/plugins/buddypress/bp-forums/bp-forums-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����6������''~�O'),
('�����j�P�W�~\0y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/admin-header-logo.gif', 0, '3��6���]��(�@`��', '3��6���]��(�@`��'),
('�"��[Q	����', 'wp-content/plugins/wordfence/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\����*Af5��b>�'),
('�F�j!Y�{.J=,��', 'wp-admin/images/stars.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[����><�k�{��(�'),
('�Io�''��@�F�PE�', 'wp-content/plugins/woocommerce/includes/class-wc-shipping-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�L�h�^�)rB3I'),
('�]�W/>�}<8� VF�', 'wp-admin/includes/theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nL�o��ި�C[4|�''�'),
('�^.�jT}�<��I��', 'wp-admin/js/accordion.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ϡ�M\0���GÁ]��'),
('铼W�[u�H�3\ZX�', 'wp-content/themes/twentytwelve/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�2d���g�t�Cc'),
('�'' ��#s��߾U|', 'wp-includes/js/mediaelement/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v�&��B"o�!e���'),
('頻�yN<���9�o\Z<', 'wp-admin/js/xfn.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f�''�(�.�J9\r^'),
('��m�Mt���W�B', 'wp-admin/images/align-left.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\�y0��d�Z�o.h��'),
('�U�=��(�\n�U5�', 'wp-content/plugins/buddypress/bp-messages/bp-messages-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v��b|ԢV���nXW�>'),
('�����dy��v���4�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��o:Li��B�Ã>��'),
('龄72�n��,���H', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-destroy.php', 0, 'P��ͳ�\r�M�Vq', 'P��ͳ�\r�M�Vq'),
('�Ĉ~��k^8�A�s�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U]�Y4��|/\n��a�'),
('����t���Z�O''� \n', 'wp-includes/js/thickbox/macFFBgHack.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ȱg�W�,/u�'),
('�����V,E@�X���y', 'wp-includes/SimplePie/Cache/File.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=�@��B[	S�'),
('��\n/�|���J�L�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/defaults.bb-htaccess.php', 0, '��m-�~�����f��', '��m-�~�����f��'),
('��>� -/]�Tr&s', 'wp-content/plugins/buddypress/bp-messages/bp-messages-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ֆ�*�����2۪��'),
('���!-��$L�Q�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/js/jquery.dataTables.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n�I?����>y��'),
('��:��\\�B�e@��	�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/OxidInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$��]}���X����'),
('�&�(�yf�\r��*KcA', 'wp-content/themes/twentyfourteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M�;DjR�?���'),
('�0�%I�u! �NB>^', 'wp-content/plugins/wordpress-seo/images/banner-video-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	��m��̽����<=X2'),
('�4���2�)A.;4�', 'wp-includes/js/customize-preview.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6γ��S��w�1U'),
('�Y%v��O���d�e��P', 'wp-content/plugins/buddypress/bp-messages/bp-messages-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E>G�_1ƃ����w'),
('�v���`�O�\n����0', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/PiwikInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�)���ܚb���'),
('ꍥ��2jEbg؈W�x�', 'wp-includes/css/editor-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�_��]���69��x�'),
('�Ǉ���4˓T`�k', 'wp-includes/js/wp-pointer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6��|dMpX\0��fɐ�'),
('���պ�'',��LlQg."', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-users.php', 0, 'g�(�/=n�=Ko��c;', 'g�(�/=n�=Ko��c;'),
('�\0qU���b2`�89�', 'wp-content/plugins/siteorigin-panels/widgets/lib/color.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e��ղ�4��S�+��e�'),
('�-n�$.�#g%�}��', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Html/SideBySide.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p���uQ���: �*'),
('�0���R�J�{y�ˣ��', 'wp-includes/general-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8��e8����0����l'),
('�Bȧ�]�v�*d�Σ�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/export.php', 0, '�sj��<z��˺���', '�sj��<z��˺���'),
('�F �8�+�)��r�P�', 'wp-admin/images/no.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�k�d�$��ܟV7���'),
('�Oӿ�;�=\\J�zy', 'wp-includes/js/tinymce/plugins/wpgallery/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)F.jT&����I�O'),
('�X��fi(���p�f�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tools-recount.php', 0, '\n�|9D�m9솔�q��', '\n�|9D�m9솔�q��'),
('�h��u��_���@', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-coupon-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^ɕzw�LI�-��J�'),
('뭷\r�!z}ML�K�E', 'wp-includes/ms-files.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']�yï�<�r �L�F|'),
('��Sڰp��GMǯ�l�', 'wp-includes/css/media-views.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4�넴��}��'),
('���׮F��p�s��4�', 'wp-content/plugins/wordfence/images/back_enabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����]�����H��'),
('����@��7��\Z�ĕ,', 'wp-content/themes/hexa/inc/jetpack.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8&�7X�xKc�t$<��'),
('��vA�ds�����K�]', 'wp-admin/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~P�	��������B'),
('��YC��o�oR�亞�', 'wp-includes/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'XW(�,\Z�+]�<��U��'),
('��!x��U��x��\Z', 'wp-content/plugins/buddypress/bp-themes/bp-default/.jshintrc', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|u��I�T�V�Mm{�M'),
('�-��FKW��D��j,O', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-xml-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m�H�lЇ���B�'),
('�8�ڧ��s}��ն�Ni', 'wp-includes/class-phpmailer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BqO7W��vai4c'),
('�;��Rz�\r��2\r�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ǂQ�󞨏�H�'),
('�>s��s�Z\Z)8V��', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-id_ID.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��f�S���H_\\Ě�'),
('�?�����h�����;', 'wp-includes/js/quicktags.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�#��:<���T��ʭ'),
('�A����{�̎�~Ɵ�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Mf��Ҏ�up�J��D'),
('�D\rh}�����!\n', 'wp-includes/js/jquery/ui/effect-drop.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q��Qk�A�+��\\�'),
('�Pط��悇̺ƴ$@�', 'wp-includes/SimplePie/HTTP/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W%���4�6���6	'),
('�n)�`�$ąP_��\r�', 'wp-content/plugins/buddypress/bp-forums/bp-forums-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��|�>9Ẏ''fe'),
('�p�2,�!Ke���?H�', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/class-wc-addons-gateway-simplify-commerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*מW����<�W<'),
('��������/7\\', 'wp-content/plugins/woocommerce/templates/content-widget-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q��1�\\�J9�\nժ'),
('��PH�A˝�M8�fh', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/icons32.png', 0, 'ʤ�Tw��c<}sX~', 'ʤ�Tw��c<}sX~'),
('��c��.D�r� |��', 'wp-includes/js/tinymce/skins/wordpress/images/dashicon-no.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R����Z�?f.��8��	'),
('츃�v��6��;�~�', 'wp-includes/js/tinymce/utils/mctabs.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x$��\nd��,�P��'),
('��-x�(�E�oI�=�', 'wp-includes/class-wp-customize-section.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������Y���k��'),
('��ڍ��̝����mY��', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/members-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cr�.�\n�t���+U'),
('���h�ׄ�V�_�?^��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/front-page.php', 0, ';��2w���ͮ \ry��', ';��2w���ͮ \ry��'),
('��hu!�����IU��', 'wp-content/plugins/woocommerce/assets/js/frontend/lost-password.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����\\��쁚>��'),
('�\n� �2H�"F�n�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TYPO3FlowInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���,�oF�D:N��4'),
('�Y^��X���z�S', 'wp-content/plugins/woocommerce/assets/js/select2/select2.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��7�@������'),
('�\Zpr5>��#E���ĕ', 'wp-content/themes/twentyfourteen/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�r���xݘ�\r�"Z��'),
('�1�k���B��zZ�', 'wp-content/plugins/woocommerce/includes/class-wc-product-grouped.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e�`}����4z*ߧ�'),
('�E�a�߀@�Y8��''', 'wp-content/plugins/buddypress/bp-forums/bbpress/tags.php', 0, '�)����%.B�����', '�)����%.B�����'),
('�RT\r`�/z\n�^MM�+', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/default.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_4E���d�d[���s'),
('�]��@�\n��>ĺ�Yn', 'wp-admin/admin-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��"�l�E�)�E�A'),
('�g�PlY�\Z���i�-�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Service.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r9gr����0�!3C'),
('�k��!k��|4���B', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/SMFInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8�I�0�mj@0�%�U�'),
('�QR"��@3��v�S', 'wp-admin/js/link.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�u��5ϳt�{��z�'),
('��\Za�]]�A��''h���', 'wp-admin/network/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�܀��4k��f\\����'),
('����=��c�ه���', 'wp-admin/includes/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�:��ē��0)�U'),
('��F�ޗd�����P�', 'wp-content/plugins/buddypress/bp-members/bp-members-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�����x�J���'),
('���eC����Di!��', 'wp-admin/css/colors/coffee/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ny�s�i����(�'),
('���f�%u�P���', 'wp-includes/js/mce-view.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�=�Ӟ�Z�;e�/'),
('��!�\0n�p����', 'wp-content/plugins/woocommerce/assets/css/_animation.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�k�o�竷�[Z0��|'),
('�1pi��ɲ���I�', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_styles.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�P2;$o�E����_��'),
('�Ig�&9���}\r��P', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/profile-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U9kϢ�\\�~�%��n'),
('�g:�(ܱ~Y��P�>�', 'wp-content/plugins/buddypress/bp-core/css/admin-bar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����#_,/_�I��i'),
('�|��R����[��?��', 'wp-content/plugins/theme-check/assets/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ø����x�ah�K���'),
('����Hb�\08�%(�=', 'wp-content/plugins/buddypress/bp-activity/bp-activity-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\n��g�-:�!�Rc�'),
('W%,Zۗ�u�!�b', 'wp-content/plugins/buddypress/bp-core/bp-core-catchuri.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�w��Vx��(Q|~G���'),
('��gz��d�Ì�X�', 'wp-content/plugins/woocommerce/includes/libraries/geoip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���o�Kp���+}��'),
('��q���5H��䯕\n�p', 'wp-content/themes/twentytwelve/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g�y���qr�q��'),
('���)d�<���e2{L', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/forums/topics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '۔����2^�����{�'),
('���/�h����k�vA�', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-en_GB.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3,A\n����@�	\ro'),
('�"�/Ƭκ�t�z���;', 'wp-content/themes/twentythirteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9.D�C�|S��''Ñ�'),
('�;L�t�׬C����ɣ', 'wp-content/plugins/wordfence/tmp/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�I�z~�i�,L���'),
('�D=Jǅ/	6ރa�', 'wp-includes/js/swfupload/plugins/swfupload.cookies.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�~�\rڈ�k\\ 7̴��'),
('�J�_���5HU��=#�', 'wp-content/plugins/theme-check/checks/admin_menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R����''q1$�\Z7��'),
('�Y^~5~��p�G-���', 'wp-includes/js/customize-views.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_�\Z�%cݹ����'),
('�z�������|�z�xv', 'wp-includes/js/jquery/ui/droppable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q��	���[5XD8�'),
('簾�&��lY�4�@\Z�w', 'wp-content/plugins/woocommerce/templates/cart/mini-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��jH�<	�,�d�]���'),
('���P��a`Xu', 'wp-admin/css/color-picker-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��J�D	�6�+�6&���'),
('�ölyk!�̏��zh�', 'wp-content/plugins/woocommerce/assets/js/stupidtable/stupidtable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�O���%A�L�,\n�'),
('��wT+�U�D���', 'wp-content/plugins/woocommerce/templates/single-product/meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ʌ�n����]�\0'),
('��X=U�pfp���Z', 'wp-includes/taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�i�����XG\r����'),
('�ތt+�\\�+�Xa�ZU', 'wp-content/plugins/wordfence/lib/wfScan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�g��.���\rS"�;�'),
('��V��0���8�ο��', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z����-�fm�֙'),
('�㯩�	''��ި��V', 'wp-includes/images/smilies/icon_biggrin.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�YpR�+�0}k�N{�k'),
('��6X�Ԫ4��[_��=t', 'wp-content/plugins/wordfence/lib/wfScanEngine.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '͉(�}�rt�c��3iD'),
('����9��r�Mԧ��', 'wp-includes/js/customize-preview-widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Q~���6�a���'),
('��<�g�E��t�/�', 'wp-content/plugins/buddypress/bp-groups/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V�|�[̺)��aiby��'),
('�$�ī�I�^��3���', 'wp-admin/menu-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�%^w�,\rw����'),
('�-��kmϻ����A�', 'wp-content/plugins/buddypress/bp-forums/bbpress/search.php', 0, '���-��&	��l課�e', '���-��&	��l課�e'),
('�T%1����KG����', 'wp-content/plugins/woocommerce/templates/myaccount/my-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AY���]�6�U��y'),
('�t��/�F�st>t��v', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile.php', 0, '@�(�f\0(;b@��C�8', '@�(�f\0(;b@��C�8'),
('�!A���\rږ\r>�', 'wp-content/themes/twentyfourteen/content-featured-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`��X�''�gT\\d)�'),
('�з&�L۽¨��VN�', 'wp-includes/css/buttons.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R܃�2���<z�`�`�'),
('�գm��p��驍�9\n', 'wp-content/themes/twentyfourteen/inc/featured-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���$����-x�'),
('�������6$[���O�', 'wp-admin/css/customize-widgets.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\\c��Χ''��T'),
('���Lc��2I�~H', 'wp-content/plugins/buddypress/bp-groups/bp-groups-forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�xFI�vbh�+�*>�'),
('���rp.u�3zx�', 'wp-admin/includes/class-ftp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���2V�u�\\I�L��'),
('�)jE4ڣd��٤�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('�7s�\\]�}�AA�we1�', 'wp-admin/tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p��3�)q��\0ѷ�I='),
('�Z/���{Lt�ծF$�', 'wp-admin/js/svg-painter.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����/�|ĩ���z�'),
('�h@��B8��jX�', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/views/graph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G��]r''j�baßsi�'),
('�k�i��p&h���3T��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����\n	��"��e''a��'),
('��>�֔)��=U�', 'wp-content/themes/twentythirteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���fYK���\0�c'),
('��ҽ.(�!7X0f', 'wp-content/plugins/buddypress/bp-members/admin/bp-members-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*�2d�X�}�Un�#5S'),
('�4g]�/F�z묉�', 'wp-content/themes/hexa/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T9��eCFH����B�'),
('��J]����;�o*��P', 'wp-content/themes/twentyfifteen/genericons/Genericons.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/�=³zeX*�|��b'),
('�ԛK�~D*�,57�', 'wp-content/plugins/wordpress-seo/js/wp-seo-metabox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qS[�#U$�R�l\rYb'),
('���N�ŏ�KlQ�', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6L�2Ӳ�k�1:��B��'),
('�����!�''�>��z�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�x!_���g���7��'),
('�$�gw8��s��9�\n', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bp-options.php', 0, '^�,UX��/`�Ϲx', '^�,UX��/`�Ϲx'),
('�/�Gy9�ǚ�x�X�', 'wp-content/plugins/woocommerce/assets/js/select2/select2.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C��&ҏ�2T�E�1?'),
('�?u[��c�v\0���E', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CakePHPInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a,��X~���Qd?l�T'),
('�?��E_�)�xڅ$��', 'wp-admin/includes/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ۗ4>��k"h��R'),
('�I�''�GK�4_�b��', 'wp-content/plugins/siteorigin-panels/widgets/js/embedded-video.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�M*z�_b�����'),
('�R��	��z1/7m���', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-json-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p�\\�]��!8�T�p�3'),
('�_�NP������ϛ�w', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-upgrade.php', 0, 'zNH�h��m�\\%�-%�1', 'zNH�h��m�\\%�-%�1'),
('�po���X0%������', 'wp-includes/css/editor-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''o"%�v�''@�"IHV'),
('���jK�&����Y', 'wp-content/plugins/akismet/class.akismet-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Ζ7����8x���'),
('��΁N�ή}C]�h"Q', 'wp-content/plugins/buddypress/bp-core/bp-core-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9?L�P''��=Bk""�'),
('�h�l�=�i�H\0�{', 'wp-content/plugins/siteorigin-panels/inc/debug.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����o��$}�''ҤH'),
('��M�٦M�/`�', 'wp-includes/js/swfupload/handlers.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Oۅ��߲�}�'),
('򱠭��B�R�z��Y', 'wp-includes/js/jquery/jquery.table-hotkeys.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�o�go����~i�I	�'),
('�?{o_���''�n�', 'wp-admin/images/resize-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��e?�&h.��\n��'),
('���_f $�O<o', 'wp-admin/js/common.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m���j�w��p�ݠ�'),
('��w�+"+�$��^�', 'wp-content/plugins/wordfence/lib/wfLog.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ɓ��La�����:ӡ');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('��Vƚ}�c�>cfq6�P', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-email.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����a�+"��_x6'),
('�"-�q�5.v�%mOm7V', 'wp-content/plugins/woocommerce/templates/emails/customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���!�k�{�B6'),
('�#\\���/�vXR', 'wp-admin/js/theme.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's�\rn������7'),
('�J��t�������@', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8߬�ag�Q��bv~'),
('�YhF�چT��{�', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ٗk�+���\\K���'),
('�\\Qe�Е�a.�m%>��', 'wp-content/plugins/papercite/tpl/default-bibtex.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S�@ɟ�	~����'),
('�lF����c뒕�L���', 'wp-admin/js/iris.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u�5`�@Ħ�Ue߰�'),
('�~,yW0��Z�.�[', 'wp-content/plugins/woocommerce/includes/class-wc-shortcodes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��ei�-�7��:ah'),
('�ؠ]�f���P����', 'wp-content/plugins/wordfence/lib/wfLockedOut.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��Wѱ�X�e D���'),
('�~���پy��7��', 'wp-content/plugins/papercite/js/jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/F���#NH�Y�Gw'),
('�]z���߭�s���', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/Generator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A}���\0���v�p<�'),
('�l$5v�#���DҸ', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/time-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zv��p��3�]\r�TY&'),
('����ډ�-�q/\rR|', 'wp-content/plugins/woocommerce/assets/js/admin/accounting.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^z�kZ�l��Zx :'),
('��V��k9۴�s���ֿ', 'wp-admin/css/customize-controls-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�3''���R�+�>��b'),
('���;�^𩸴8c�', 'wp-includes/css/buttons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�iڦ�{�><�X�r)�a'),
('�J''#��rN�0a\r�', 'wp-includes/images/crystal/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�nV�:�ω�G��-#k'),
('�Y��R�Yi/��l@HX�', 'wp-includes/js/media-grid.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�l]��W�"�\n ��2�'),
('�e��<g*-}��9X', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CraftInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�@|���*����Y�'),
('�xQ� ]�B���H �)�', 'wp-content/themes/hexa/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��j�d���p�\\/I�u'),
('�x��m�SZ�2���9f�', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/RestJSON.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''74�����>�y˘>��'),
('���ģ��0�4�\\�', 'wp-content/themes/twentythirteen/js/theme-customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7����5ESS$U9\Z��'),
('���?\\Ŀ�/�pd''�', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TYPO3CmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ة�ʲ�ȯ�@�:-&'),
('��j�8���ď�\Z���', 'wp-includes/js/wp-backbone.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���S��Y�|�פ�j)p'),
('�����7T?����', 'wp-content/themes/twentytwelve/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��m�F��d,S��G'),
('���Xzk*���M�ԁ�', 'wp-content/plugins/buddypress/bp-core/bp-core-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ƅ�{�*��,=<��E?'),
('�-"D��ʹD�5a�/', 'wp-includes/cron.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�,��<�fy��J�0�'),
('�A4e���{�^����Z', 'wp-includes/js/wpdialog.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r�9_�M@9\0�S�����'),
('�F��\Z����C��1�P', 'wp-content/plugins/wordfence/lib/wfDict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*��6Att��#�'),
('�TҨ�x�o\r�@%s', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/MediaWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�s|�V�Tu⛙귢�'),
('�r���s���K���)', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/GravInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@��|\\��B\03CEț�H'),
('�u�N���.A_�_�', 'wp-includes/js/media-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0\0YE\r������Y'),
('��e~Q�8����F', 'wp-content/themes/twentythirteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n��K�+M�H%^g�'),
('������>+ܞL[�m', 'wp-includes/js/tinymce/skins/lightgray/img/anchor.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��a5q��ȑ_4�@'),
('����(���%�#�9yn', 'wp-admin/css/forms.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '譒~ٟ����<����'),
('������ݶ�뽹߄��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-l10n.php', 0, 'lQ�\r8��q}H�f �', 'lQ�\r8��q}H�f �'),
('���j�I>��az2��', 'wp-content/plugins/wordpress-seo/admin/pages/files.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�NV\Z�a3��C�P��y'),
('��Γ�k����+3�O', 'wp-content/plugins/buddypress/bp-core/deprecated/js/jquery-scroll-to.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~w��%c��V"��W���'),
('�����y��\0�"��Q', 'wp-admin/user/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)��»�g��E�p�'),
('��;&	�j�tV])�f\\', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/activity_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r\Z�Yr��l�_�"�F��'),
('��~������r�C��', 'wp-admin/link-parse-opml.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�9)!�_n�4k!�{��'),
('�%j�����1`!��', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B���F6�Ѳ���.%'),
('�;ڽ��<�s�nLq', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-template.php', 0, '9���.�:��WE/}K', '9���.�:��WE/}K'),
('�V9��K���goX��7�', 'wp-admin/images/align-left-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�8�O�����^��c'),
('�YZҿ��W!"]�n�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-dark-rtl.gif', 0, '��%�n���7��<J', '��%�n���7��<J'),
('�^�>/�㱎JjB��', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l�a���N�?�8�����'),
('�a4�����=8��Y', 'wp-content/plugins/buddypress/bp-friends/bp-friends-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VjH�M''�R�����V:a'),
('�fg�[�CR��{c', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/tag-single.php', 0, '�3\\���??8��3\r��', '�3\\���??8��3\r��'),
('��ZaO�]�7_��n.F', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/tpl/default.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�H���l���������t'),
('������H�S!;� �', 'wp-admin/js/user-profile.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a��2b-�6��\Z��?'),
('����f�j|ѿ�Hu', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	���ex��2+$F'),
('��������I��', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��C(��z���/x�>�>'),
('���+���q�pW��', 'wp-includes/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��2�2���q�p���'),
('����o~. F�>�!ߵ', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-top-rated-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F�/���F�.:O<�\r'),
('�Җ}hҋ�a��(���', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart-variation.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"�G��k�\0V�b�'),
('���`�&X<�aQ�Vh\\', 'wp-admin/user/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������\0yݤ�&-'),
('��u�-J��&�8K�', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�5�w]�Z���Q�e|�'),
('�휨v�e��O��6', 'wp-content/themes/twentytwelve/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�l�lHƵO��`����'),
('����Pq-�t�@l�', 'wp-includes/images/wlw/wp-icon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1	�ʚ�7w3K��*'),
('�/�(_!*�dK�n', 'wp-content/plugins/buddypress/bp-core/css/buddybar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{���w� (���o�D'),
('� @�;��*��|��', 'wp-includes/Text/Diff/Engine/string.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^��x@�R�ƙ=���'),
('�=�O�����CӬ!', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_IO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(���t�3����{���'),
('�e�-��|��$�\n��', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�v�O�,q�;��R'),
('��xM�5���L�\Z\Z', 'wp-content/plugins/wordpress-seo/frontend/class-frontend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�m	uJ<�\\̦3pA'),
('��K6�V<��E�mۨ��', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-premium-ga.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uNLh��AE�V��G�o'),
('��B�H���w����', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm��6SW�\0''d��2]'),
('���@{���n�\ZO�', 'wp-content/plugins/siteorigin-panels/tpl/metabox-panels.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q�~;xM��#�t<s.y'),
('��^���5r񳲷''�', 'wp-content/plugins/buddypress/bp-themes/bp-default/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ݽ^��I��E�n�S'),
('��%�.7;$���I�', 'wp-content/plugins/woocommerce/templates/emails/email-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���a궘���\Z���'),
('�ܽ�k�''d���brp', 'wp-content/plugins/woocommerce/i18n/states/PE.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ɔW�\r[;K�Y'),
('�,��.����\n�Hv', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-theme-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm�ΨDx긠�X��'),
('�2��X��k�!�pd/', 'wp-content/themes/twentythirteen/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''y��F�@���d"'),
('�@���sB0<�{l�3��', 'wp-includes/wlwmanifest.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ԑ����i�^��'),
('�D@��&4b�Mv��ݱ', 'wp-content/themes/twentytwelve/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�3��{��cذ�К�'),
('�XB���1M�W�w+', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�F�u�A��CŽ��<A�'),
('�^��G�&-:�i�B��', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_asc_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�������uz}�B�'),
('�e?�\Zv[*JZ\\U�r�W', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/ga-premium-banner.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��_F/�B�]NC�ļN'),
('�koZ���z!/��f', 'wp-content/themes/twentyfifteen/js/keyboard-image-navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�/�80r�\ro���'),
('�k����e<F��4', 'wp-admin/js/revisions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2S�l��R;�]2�Lj�'),
('�~,eu��yF�M��', 'wp-content/plugins/woocommerce/includes/class-wc-autoloader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I��@�9F\0(�=����'),
('�����''+��}�R�~0', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5�Q���./�:\n�,��'),
('����SW<��%���o', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/PaymentsApi.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����� T��`V�Z�s'),
('��6K1���(���}/AX', 'wp-admin/network/user-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}�~*�a�ӱ����'),
('�å''�����Mo�cF�', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c	7e6b��B��N=�W'),
('��"�+J����9��u��', 'wp-content/plugins/woocommerce/assets/js/admin/users.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�6&E�Z[J�n Z�Q�4'),
('�惙��w��ѦԚO�', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/js/main.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i�)��d֥L[$��Qd'),
('�l\0Da"��4���', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/focusable/focus-element-overlay.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Yr�D��O[�F�'),
('�!����8:�q|�F6�', 'wp-content/plugins/buddypress/bp-groups/bp-groups-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�\r+�����S��Tt'),
('��H�Mz�@�A��', 'wp-admin/css/press-this-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U\Z>�ϘT�����qlb'),
('��ɱ%��a{Z�j	%�', 'wp-includes/class-wp-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�v��`�14eͽ��%'),
('����I�:4P�U���', 'wp-includes/SimplePie/Cache/Memcache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��JU���1SQ��?�'),
('��:R��G�����', 'wp-content/plugins/buddypress/bp-members/bp-members-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E2��^�52��M'),
('������!VL;A�u�', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/jquery.zeroclipboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']�_m}�-sI�"~H`�'),
('��֫�����"��S�1', 'wp-content/plugins/theme-check/checks/constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�JA��*�x9�b�%&'),
('��Js��[\\fqrAѤ_', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/expand.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��fu�p��3U�Bf�1'),
('����p�l4[���e���', 'wp-admin/js/inline-edit-tax.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� �d��2Q�4]g�p'),
('�����e�����	��', 'wp-content/plugins/buddypress/humans.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����T�3�.l��LΨ'),
('���XiU1`��]���', 'wp-content/plugins/wordfence/js/perf.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uQ�"�wF���R@p'),
('�R��=��*�d��n�', 'wp-admin/includes/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ﰷU��5�O�''G�'),
('�-^g��̺@\0/���', 'wp-content/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gD,V�=\\�bP'),
('�.s�w�װXB''����', 'wp-content/plugins/buddypress/bp-core/admin/images/icons64.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5��U!�VY/,�����'),
('�.ն���Zg{�=��', 'wp-admin/css/customize-controls.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X	\Z�c�Xgt�(��.�'),
('�4��:h��=�-E�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Auth.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�	�A��p��\n�1�'),
('�J��2��b���Λ�', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/request-membership.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����/�����ƿN�'),
('�Y@#���K=�\\5\0Sy�', 'wp-content/languages/themes/twentythirteen-es_CL.po', 0, 'f����M�)��~��N�', 'f����M�)��~��N�'),
('�a<*�t����fE�4�', 'wp-content/plugins/woocommerce/assets/js/admin/reports.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��^�H���=G\Z,\n@'),
('�w���Y���B��qM�', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product-variation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ș�n�+�G:�?�(�'),
('��''_G���>��r-gʯ', 'wp-content/themes/twentyfifteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�B;��a`GԢ�މ'),
('���~��a%��!�P', 'wp-includes/js/tinymce/skins/wordpress/images/pagebreak-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{�6�#UQ:��|>#��'),
('�����L?@��.~O�', 'wp-admin/css/colors/midnight/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''�A`����݆���a�\Z'),
('����T\n����e.(��', 'wp-includes/class-wp-image-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����g]��xCQ�'),
('����-��T�������', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CakePHPInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a,��X~���Qd?l�T'),
('����lԋݱ�у���', 'wp-content/plugins/buddypress/bp-members/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�f*�������w(R'),
('��}���PÛ�P\\�\Z', 'wp-includes/js/tinymce/plugins/wpautoresize/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g٧�Q�M�VN�N�'),
('��R�,�A���\Z�GJ''-', 'wp-includes/default-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3��D��Mߍ[`ݨ�'),
('���\n\\��ɶ.5���', 'wp-includes/images/xit.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�)�X��`1���H��'),
('�C}0%i��p7�\Z�/?', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.init.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��*�;�K�B���'),
('�D����]�|߼�$�', 'wp-includes/js/mediaelement/wp-mediaelement.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�8؟"{�պ��u�Z'),
('�Ph�����rV�', 'wp-admin/css/revisions-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7l(2��w���'),
('�[�&����,��ר+�', 'wp-content/plugins/theme-check/checks/comment_reply.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��`%]�"�N�x+�'),
('�f��� �����j���', 'wp-content/plugins/woocommerce/i18n/states/ES.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�q�,�1�5�(��'),
('��V���xO��$q��`', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2�^X��\rJgC8��'),
('�ŸW_Jc�Z��B���', 'wp-content/plugins/woocommerce/includes/wc-attribute-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�3��<�t��G�Is��'),
('����6Ri*5����æ', 'wp-content/plugins/wordfence/lib/dbview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���(D�e��d�:�]'),
('�߯�@g�l����&!�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/functions.php', 0, '+��%E�"�\Zo^��', '+��%E�"�\Zo^��'),
('�''������}����0', 'wp-includes/js/tinymce/wp-tinymce.js.gz', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd�j��6h0Cb�} P'),
('�D`:���Awh��', 'wp-content/plugins/siteorigin-panels/siteorigin-panels.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�����ȝ���}:�&'),
('�s�E7�!���j�c�', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/rickshaw.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H�).>�ϵ<2(;=,'),
('�])��	���{�?R}', 'wp-includes/feed-rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�kY���>�]DtH/'),
('�!3(^�ܣ�*�LmA C', 'wp-content/themes/twentythirteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ls�1�:	���n��w�'),
('�0<Ps��מH���22', 'wp-includes/js/jquery/jquery.table-hotkeys.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��֔#t�gP�g��'),
('�9(F�Rj2�n6]��', 'wp-admin/css/colors/light/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��������#�,�'),
('�g�"�}_�7����J5', 'wp-includes/js/jcrop/jquery.Jcrop.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V̞��/K�x����'),
('��p��9�6è�R�', 'wp-admin/css/common.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dг^�.�,#�㒧�0�'),
('�����ƪq�悳��', 'wp-includes/js/tinymce/plugins/paste/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��.`��4)�Ud0'),
('��9��yT��>3�T', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/pause.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ziD''��@)S�ƫ'),
('���iH��4������\Z', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xM}�5{�$��d(��k'),
('��<l�a��,�bX,��', 'wp-admin/images/xit-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��r�T��`��?J�/�'),
('���Y.z���V', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��t�~�["�&�''�}�f'),
('���ۿGD����F��', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/SilverStripeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��(��*A��VMH=I'),
('��ŷN	\0��f\ZT��', 'wp-content/plugins/wordfence/css/diff.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�"�����y1���4Z�'),
('���fb���b�KJ���', 'wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�d)�|�q3g���4���'),
('�Wk�)��lz-�nq�', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-google-analytics-client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ܛ��L��i�d�j�'),
('�\rFw+�^�\ne�B(��', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-pingbacks.php', 0, '3�����}(��c&�', '3�����}(��c&�'),
('��1zrn��hJ v�', 'wp-content/plugins/buddypress/bp-core/bp-core-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��?TlO�ᘟs�ʔ�'),
('�!@A�;1)SJ��b��', 'wp-content/plugins/wordfence/css/colorbox.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���\0g/�4BE-����'),
('�$is\Z��ݚ� g�]5', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-widget.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�ˊ�$�l�7�$Ť��e'),
('�2���(�;f��:Q��', 'wp-content/plugins/woocommerce/includes/admin/views/html-quick-edit-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r��w��m����]'),
('�=���c;krAy;', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-theme-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E'')j2<n���z�8��'),
('�B��Y���d��>ީ�g', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/profile-edit.js', 0, '����zg.��y�h%&t', '����zg.��y�h%&t'),
('�G���!#h�9	��&', 'wp-includes/js/tinymce/plugins/wordpress/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��\ñ�>Z&&�D���'),
('�Kj��h����', 'wp-content/plugins/wordfence/images/loading_background.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��''�2��p\nK�X��'),
('�fW�kⶋ/���j�', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.ixr.php', 0, ';�''\\*�^�4��h%', ';�''\\*�^�4��h%'),
('��Ҧ���$2�b�L�$', 'wp-content/themes/twentyfourteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ORn�]&d�������n'),
('���''�B���7S�', 'wp-includes/js/zxcvbn-async.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������\0�V]u#3'),
('������)�(��<��', 'wp-includes/js/json2.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�A��`� �ȡ�@�'),
('��a��''@T瑓����', 'wp-admin/images/date-button.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '���.��I��V�ď�'),
('��?>��yz~K���Qg', 'wp-content/plugins/buddypress/bp-settings/bp-settings-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#12�����)�\ZfK?&�'),
('�����)z]!?��a�', 'wp-admin/images/media-button-video.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������r�x�4Q���'),
('�2�}�+�x4f��	m�X', 'wp-content/plugins/wordpress-seo/admin/pages/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Ɋ2i!i��"5ց9�2'),
('�G����@DX��M�H^�', 'wp-content/plugins/wordpress-seo/js/jquery.qtip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't�`\Z(�Ɖ�@7�''/��'),
('�I"�p��t�Q��[Z6x', 'wp-includes/css/admin-bar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�<B\\܇po/0d>''�H'),
('�c��wk�(���4�3�', 'wp-admin/includes/list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '����T8��>��_߂'),
('�Qֿ6��yq�88', 'wp-includes/theme-compat/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '� ~C~�M������='),
('�����oa''�:\\.-��', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�Z@R����{��st'),
('�ݷ�UA��ڰEn��h�', 'wp-content/plugins/siteorigin-panels/css/images/wpspin_light-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ER��fz�����'),
('���w��''�6)', 'wp-includes/rss-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g�����l]�4j0l=�'),
('�|a�8Q6a��:�', 'wp-content/plugins/papercite/img/pdf.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�iXW�wvHCR�Jf�n6'),
('�;`�$r���$���=', 'wp-content/plugins/wordfence/images/icons/warning128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p�G�I�t*����Np='),
('�?��#���M9\r�', 'wp-content/themes/twentytwelve/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7�~�U�������&�}'),
('�L����e5x?e=�&', 'wp-includes/js/plupload/wp-plupload.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '��S�y�,lf@�@'),
('�M\Z�J���Yٺؾi�', 'wp-content/plugins/woocommerce/assets/js/frontend/price-slider.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�mC��|���@b�T� '),
('�c�I���'' �\r�=Ͱq', 'wp-content/plugins/papercite/format/plain.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Qi`�4}���n���'),
('�r��I�!���', 'wp-content/themes/twentythirteen/content-audio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�E���<cG���\r'),
('�}_0E��s�Ru֯��', 'wp-content/themes/twentythirteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '�4�Mi���Hj���JBc'),
('����M~�^x��;��', 'wp-content/plugins/wordfence/lib/unknownFiles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A�{���U���z�[��'),
('��''��и*�����A', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/includes/html-extra-costs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K���HB�A����\n'),
('��a5[4�5�Me�pC', 'wp-includes/js/jquery/ui/effect-bounce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`��4z������`dS�'),
('��|��ړM����9�', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3sZ��*���p�ͤ'),
('���˖�f�\r�y��(', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Subscription.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h�y\nY)�J�\rh$���'),
('��S�CRC��l��', 'wp-admin/css/colors/sunrise/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V��\Z�z�	h���=�'),
('���±���h����', 'wp-content/plugins/wordpress-seo/css/wpseo-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$Pr�T�;�''Gq�x�'),
('���k��i��.���\\��', 'wp-includes/images/smilies/icon_neutral.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '������	����Z�');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfhits`
--

CREATE TABLE IF NOT EXISTS `wp_wfhits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `jsRun` tinyint(4) DEFAULT '0',
  `is404` tinyint(4) NOT NULL,
  `isGoogle` tinyint(4) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `newVisit` tinyint(3) unsigned NOT NULL,
  `URL` text,
  `referer` text,
  `UA` text,
  PRIMARY KEY (`id`),
  KEY `k1` (`ctime`),
  KEY `k2` (`IP`,`ctime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `wp_wfhits`
--

INSERT INTO `wp_wfhits` (`id`, `ctime`, `IP`, `jsRun`, `is404`, `isGoogle`, `userID`, `newVisit`, `URL`, `referer`, `UA`) VALUES
(1, 1421426932.952714, 0, 1, 0, 0, 0, 1, 'http://localhost/wordpress/', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(2, 1421426948.112102, 0, 1, 0, 0, 0, 0, 'http://localhost/wordpress/activity/', 'http://localhost/wordpress/', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(3, 1421426952.610054, 0, 1, 0, 0, 0, 0, 'http://localhost/wordpress/members/', 'http://localhost/wordpress/activity/', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(4, 1421426958.622280, 0, 1, 0, 0, 0, 0, 'http://localhost/wordpress/pagina-de-ejemplo/', 'http://localhost/wordpress/members/', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(5, 1421431496.607154, 0, 1, 0, 0, 0, 1, 'http://localhost/wordpress/personas/', 'http://localhost/wordpress/pagina-de-ejemplo/', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(6, 1421431522.014456, 0, 1, 0, 0, 0, 0, 'http://localhost/wordpress/activity/', 'http://localhost/wordpress/personas/', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(7, 1421434160.493549, 0, 1, 0, 0, 0, 1, 'http://localhost/wordpress/', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(8, 1426450629.859960, 0, 1, 0, 0, 0, 1, 'http://localhost/wordpress/', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfhoover`
--

CREATE TABLE IF NOT EXISTS `wp_wfhoover` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text,
  `host` text,
  `path` text,
  `hostKey` binary(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k2` (`hostKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfissues`
--

CREATE TABLE IF NOT EXISTS `wp_wfissues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfleechers`
--

CREATE TABLE IF NOT EXISTS `wp_wfleechers` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wp_wfleechers`
--

INSERT INTO `wp_wfleechers` (`eMin`, `IP`, `hits`) VALUES
(23774177, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wflockedout`
--

CREATE TABLE IF NOT EXISTS `wp_wflockedout` (
  `IP` int(10) unsigned NOT NULL,
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) unsigned DEFAULT '0',
  `blockedHits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wflocs`
--

CREATE TABLE IF NOT EXISTS `wp_wflocs` (
  `IP` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `failed` tinyint(3) unsigned NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT '0.0000000',
  `lon` float(10,7) DEFAULT '0.0000000',
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wflogins`
--

CREATE TABLE IF NOT EXISTS `wp_wflogins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `fail` tinyint(3) unsigned NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `UA` text,
  PRIMARY KEY (`id`),
  KEY `k1` (`IP`,`fail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `wp_wflogins`
--

INSERT INTO `wp_wflogins` (`id`, `ctime`, `fail`, `action`, `username`, `userID`, `IP`, `UA`) VALUES
(1, 1421434169.255668, 0, 'loginOK', 'cami2708', 1, 0, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),
(2, 1426459813.761131, 0, 'loginOK', 'cami2708', 1, 0, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfnet404s`
--

CREATE TABLE IF NOT EXISTS `wp_wfnet404s` (
  `sig` binary(16) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `URI` varchar(1000) NOT NULL,
  PRIMARY KEY (`sig`),
  KEY `k1` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfreversecache`
--

CREATE TABLE IF NOT EXISTS `wp_wfreversecache` (
  `IP` int(10) unsigned NOT NULL,
  `host` varchar(255) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfscanners`
--

CREATE TABLE IF NOT EXISTS `wp_wfscanners` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` int(10) unsigned NOT NULL,
  `hits` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfstatus`
--

CREATE TABLE IF NOT EXISTS `wp_wfstatus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `k1` (`ctime`),
  KEY `k2` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=254 ;

--
-- Volcado de datos para la tabla `wp_wfstatus`
--

INSERT INTO `wp_wfstatus` (`id`, `ctime`, `level`, `type`, `msg`) VALUES
(1, 1421426937.348345, 1, 'info', 'Scheduled Wordfence scan starting at Friday 16th of January 2015 04:48:57 PM'),
(2, 1421426938.943520, 10, 'info', 'SUM_PREP:Preparing a new scan.'),
(3, 1421426939.001742, 10, 'info', 'SUM_PAIDONLY:Remote scan of public facing site only available to paid members'),
(4, 1421426941.006552, 10, 'info', 'SUM_PAIDONLY:Check if your site is being Spamvertized is for paid members only'),
(5, 1421426943.028298, 10, 'info', 'SUM_PAIDONLY:Checking if your IP is generating spam is for paid members only'),
(6, 1421426945.045436, 10, 'info', 'SUM_START:Scanning your site for the HeartBleed vulnerability'),
(7, 1421426945.719868, 10, 'info', 'SUM_ENDOK:Scanning your site for the HeartBleed vulnerability'),
(8, 1421426945.731267, 1, 'info', 'Contacting Wordfence to initiate scan'),
(9, 1421426946.177994, 2, 'info', 'Getting plugin list from WordPress'),
(10, 1421426946.228386, 2, 'info', 'Found 8 plugins'),
(11, 1421426946.243291, 2, 'info', 'Getting theme list from WordPress'),
(12, 1421426946.257525, 2, 'info', 'Found 4 themes'),
(13, 1421426946.275162, 10, 'info', 'SUM_START:Fetching core, theme and plugin file signatures from Wordfence'),
(14, 1421426962.628975, 10, 'info', 'SUM_ENDSUCCESS:Fetching core, theme and plugin file signatures from Wordfence'),
(15, 1421426962.647683, 10, 'info', 'SUM_START:Fetching list of known malware files from Wordfence'),
(16, 1421426968.648960, 1, 'error', '<br />\n<b>Fatal error</b>:  Maximum execution time of 30 seconds exceeded in <b>C:\\xampp\\htdocs\\wordpress\\wp-content\\plugins\\wordfence\\lib\\wfAPI.php</b> on line <b>46</b><br />\n'),
(17, 1426450635.404210, 1, 'info', 'Scheduled Wordfence scan starting at Sunday 15th of March 2015 08:17:15 PM'),
(18, 1426450636.925783, 10, 'info', 'SUM_PREP:Preparing a new scan.'),
(19, 1426450636.942207, 10, 'info', 'SUM_PAIDONLY:Remote scan of public facing site only available to paid members'),
(20, 1426450638.953402, 10, 'info', 'SUM_PAIDONLY:Check if your site is being Spamvertized is for paid members only'),
(21, 1426450640.969079, 10, 'info', 'SUM_PAIDONLY:Checking if your IP is generating spam is for paid members only'),
(22, 1426450642.993720, 10, 'info', 'SUM_START:Scanning your site for the HeartBleed vulnerability'),
(23, 1426450644.807986, 10, 'info', 'SUM_ENDOK:Scanning your site for the HeartBleed vulnerability'),
(24, 1426450644.820099, 1, 'info', 'Contacting Wordfence to initiate scan'),
(25, 1426450645.707181, 2, 'info', 'Getting plugin list from WordPress'),
(26, 1426450645.745632, 2, 'info', 'Found 9 plugins'),
(27, 1426450645.765060, 2, 'info', 'Getting theme list from WordPress'),
(28, 1426450645.779417, 2, 'info', 'Found 4 themes'),
(29, 1426450645.806989, 10, 'info', 'SUM_START:Fetching core, theme and plugin file signatures from Wordfence'),
(30, 1426450648.752424, 10, 'info', 'SUM_ENDSUCCESS:Fetching core, theme and plugin file signatures from Wordfence'),
(31, 1426450648.778986, 10, 'info', 'SUM_START:Fetching list of known malware files from Wordfence'),
(32, 1426450650.589755, 10, 'info', 'SUM_ENDSUCCESS:Fetching list of known malware files from Wordfence'),
(33, 1426450650.610394, 10, 'info', 'SUM_START:Comparing core WordPress files against originals in repository'),
(34, 1426450650.615885, 10, 'info', 'SUM_DISABLED:Skipping theme scan'),
(35, 1426450650.623577, 10, 'info', 'SUM_DISABLED:Skipping plugin scan'),
(36, 1426450650.644101, 10, 'info', 'SUM_START:Scanning for known malware files'),
(37, 1426450652.611955, 2, 'info', 'Analyzed 100 files containing 1.04 MB of data so far'),
(38, 1426450653.503449, 2, 'info', 'Analyzed 200 files containing 2.39 MB of data so far'),
(39, 1426450654.580781, 2, 'info', 'Analyzed 300 files containing 4.1 MB of data so far'),
(40, 1426450655.679211, 2, 'info', 'Analyzed 400 files containing 4.75 MB of data so far'),
(41, 1426450657.847402, 2, 'info', 'Analyzed 500 files containing 7.69 MB of data so far'),
(42, 1426450658.803488, 2, 'info', 'Analyzed 600 files containing 8.75 MB of data so far'),
(43, 1426450660.145879, 2, 'info', 'Analyzed 700 files containing 9.81 MB of data so far'),
(44, 1426450662.791715, 2, 'info', 'Analyzed 800 files containing 10.64 MB of data so far'),
(45, 1426450663.990906, 2, 'info', 'Analyzed 900 files containing 12.11 MB of data so far'),
(46, 1426450665.156614, 2, 'info', 'Analyzed 1000 files containing 12.69 MB of data so far'),
(47, 1426450666.169262, 2, 'info', 'Analyzed 1100 files containing 13.41 MB of data so far'),
(48, 1426450667.227517, 2, 'info', 'Analyzed 1200 files containing 13.87 MB of data so far'),
(49, 1426450668.375016, 2, 'info', 'Analyzed 1300 files containing 15.4 MB of data so far'),
(50, 1426450669.438019, 2, 'info', 'Analyzed 1400 files containing 16.38 MB of data so far'),
(51, 1426450670.587582, 2, 'info', 'Analyzed 1500 files containing 16.96 MB of data so far'),
(52, 1426450671.857363, 2, 'info', 'Analyzed 1600 files containing 17.75 MB of data so far'),
(53, 1426450673.336244, 2, 'info', 'Analyzed 1700 files containing 19.51 MB of data so far'),
(54, 1426450674.419734, 1, 'error', '<br />\n<b>Fatal error</b>:  Maximum execution time of 30 seconds exceeded in <b>C:\\xampp\\htdocs\\wordpress\\wp-includes\\class-http.php</b> on line <b>1421</b><br />\n'),
(55, 1426450674.750484, 2, 'info', 'Analyzed 1800 files containing 20.6 MB of data so far'),
(56, 1426450676.302484, 2, 'info', 'Analyzed 1900 files containing 21.68 MB of data so far'),
(57, 1426450680.197852, 2, 'info', 'Analyzed 2000 files containing 21.86 MB of data so far'),
(58, 1426450681.505042, 2, 'info', 'Analyzed 2100 files containing 27.51 MB of data so far'),
(59, 1426450682.857971, 2, 'info', 'Analyzed 2200 files containing 28.78 MB of data so far'),
(60, 1426450683.977941, 2, 'info', 'Analyzed 2300 files containing 31.35 MB of data so far'),
(61, 1426450685.047296, 2, 'info', 'Analyzed 2400 files containing 32.68 MB of data so far'),
(62, 1426450686.337328, 2, 'info', 'Analyzed 2500 files containing 34.39 MB of data so far'),
(63, 1426450687.413191, 2, 'info', 'Analyzed 2600 files containing 36.82 MB of data so far'),
(64, 1426450688.381935, 2, 'info', 'Analyzed 2700 files containing 37.83 MB of data so far'),
(65, 1426450689.579791, 2, 'info', 'Analyzed 2800 files containing 38.99 MB of data so far'),
(66, 1426450690.719551, 2, 'info', 'Analyzed 2900 files containing 40.07 MB of data so far'),
(67, 1426450691.855205, 2, 'info', 'Analyzed 3000 files containing 42.97 MB of data so far'),
(68, 1426450691.995795, 2, 'info', 'Analyzed 3011 files containing 43.13 MB of data.'),
(69, 1426450692.002092, 10, 'info', 'SUM_ENDOK:Comparing core WordPress files against originals in repository'),
(70, 1426450692.015137, 10, 'info', 'SUM_ENDOK:Scanning for known malware files'),
(71, 1426450692.095917, 10, 'info', 'SUM_START:Scanning file contents for infections and vulnerabilities'),
(72, 1426450692.111697, 10, 'info', 'SUM_START:Scanning files for URLs in Google''s Safe Browsing List'),
(73, 1426450693.076171, 2, 'info', 'Starting scan of file contents'),
(74, 1426450695.361838, 2, 'info', 'Scanned contents of 49 additional files at 48.44 per second'),
(75, 1426450696.413224, 2, 'info', 'Scanned contents of 91 additional files at 44.11 per second'),
(76, 1426450697.413346, 2, 'info', 'Scanned contents of 127 additional files at 41.46 per second'),
(77, 1426450698.423505, 2, 'info', 'Scanned contents of 173 additional files at 42.47 per second'),
(78, 1426450699.429521, 2, 'info', 'Scanned contents of 222 additional files at 43.71 per second'),
(79, 1426450699.775991, 2, 'info', 'Scanned contents of 230 additional files at 42.39 per second'),
(80, 1426450699.779568, 2, 'info', 'Asking Wordfence to check URL''s against malware list.'),
(81, 1426450699.785183, 2, 'info', 'Checking 129 host keys against Wordfence scanning servers.'),
(82, 1426450700.658048, 2, 'info', 'Done host key check.'),
(83, 1426450700.777649, 2, 'info', 'Done file contents scan'),
(84, 1426450700.784805, 10, 'info', 'SUM_ENDOK:Scanning file contents for infections and vulnerabilities'),
(85, 1426450700.799781, 10, 'info', 'SUM_ENDOK:Scanning files for URLs in Google''s Safe Browsing List'),
(86, 1426450700.817773, 10, 'info', 'SUM_START:Scanning posts for URL''s in Google''s Safe Browsing List'),
(87, 1426450700.863659, 2, 'info', 'Examining URLs found in posts we scanned for dangerous websites'),
(88, 1426450700.867117, 2, 'info', 'Checking 2 host keys against Wordfence scanning servers.'),
(89, 1426450701.743159, 2, 'info', 'Done host key check.'),
(90, 1426450701.748243, 2, 'info', 'Done examining URls'),
(91, 1426450701.839967, 10, 'info', 'SUM_ENDOK:Scanning posts for URL''s in Google''s Safe Browsing List'),
(92, 1426450701.867349, 10, 'info', 'SUM_START:Scanning comments for URL''s in Google''s Safe Browsing List'),
(93, 1426450701.980474, 2, 'info', 'Checking 3 host keys against Wordfence scanning servers.'),
(94, 1426450702.937550, 2, 'info', 'Done host key check.'),
(95, 1426450703.053332, 10, 'info', 'SUM_ENDOK:Scanning comments for URL''s in Google''s Safe Browsing List'),
(96, 1426450703.073760, 10, 'info', 'SUM_START:Scanning for weak passwords'),
(97, 1426450703.080788, 2, 'info', 'Starting password strength check on 6 users.'),
(98, 1426450704.852009, 10, 'info', 'SUM_ENDOK:Scanning for weak passwords'),
(99, 1426450704.868326, 10, 'info', 'SUM_START:Scanning DNS for unauthorized changes'),
(100, 1426450704.872598, 2, 'info', 'Starting DNS scan for localhost'),
(101, 1426450706.574807, 10, 'info', 'SUM_ENDOK:Scanning DNS for unauthorized changes'),
(102, 1426450706.596314, 10, 'info', 'SUM_START:Scanning to check available disk space'),
(103, 1426450706.600251, 2, 'info', 'Total disk space: 100.0937GB -- Free disk space: 47.1544GB'),
(104, 1426450706.603699, 2, 'info', 'The disk has 48286.13 MB space available'),
(105, 1426450706.607815, 10, 'info', 'SUM_ENDOK:Scanning to check available disk space'),
(106, 1426450706.622652, 10, 'info', 'SUM_START:Scanning for old themes, plugins and core files'),
(107, 1426450706.703910, 10, 'info', 'SUM_ENDBAD:Scanning for old themes, plugins and core files'),
(108, 1426450706.789636, 1, 'info', '-------------------'),
(109, 1426450706.795334, 1, 'info', 'Scan Complete. Scanned 3011 files, 9 plugins, 4 themes, 5 pages, 3 comments and 3636 records in 70 seconds.'),
(110, 1426450706.801024, 10, 'info', 'SUM_FINAL:Scan complete. You have 8 new issues to fix. See below.'),
(111, 1426450706.827055, 2, 'info', 'Wordfence used 11.67MB of memory for scan. Server peak memory usage was: 36.05MB'),
(112, 1426459810.105251, 1, 'info', 'Scheduled Wordfence scan starting at Sunday 15th of March 2015 10:50:10 PM'),
(113, 1426459811.790006, 10, 'info', 'SUM_PREP:Preparing a new scan.'),
(114, 1426459811.806864, 10, 'info', 'SUM_PAIDONLY:Remote scan of public facing site only available to paid members'),
(115, 1426459813.817012, 10, 'info', 'SUM_PAIDONLY:Check if your site is being Spamvertized is for paid members only'),
(116, 1426459815.834209, 10, 'info', 'SUM_PAIDONLY:Checking if your IP is generating spam is for paid members only'),
(117, 1426459817.847938, 10, 'info', 'SUM_START:Scanning your site for the HeartBleed vulnerability'),
(118, 1426459818.980794, 10, 'info', 'SUM_ENDOK:Scanning your site for the HeartBleed vulnerability'),
(119, 1426459818.993830, 1, 'info', 'Contacting Wordfence to initiate scan'),
(120, 1426459819.903442, 2, 'info', 'Getting plugin list from WordPress'),
(121, 1426459819.945956, 2, 'info', 'Found 9 plugins'),
(122, 1426459819.965034, 2, 'info', 'Getting theme list from WordPress'),
(123, 1426459820.032089, 2, 'info', 'Found 4 themes'),
(124, 1426459820.095268, 10, 'info', 'SUM_START:Fetching core, theme and plugin file signatures from Wordfence'),
(125, 1426459822.965428, 10, 'info', 'SUM_ENDSUCCESS:Fetching core, theme and plugin file signatures from Wordfence'),
(126, 1426459822.979733, 10, 'info', 'SUM_START:Fetching list of known malware files from Wordfence'),
(127, 1426459824.659356, 10, 'info', 'SUM_ENDSUCCESS:Fetching list of known malware files from Wordfence'),
(128, 1426459824.682583, 10, 'info', 'SUM_START:Comparing core WordPress files against originals in repository'),
(129, 1426459824.687876, 10, 'info', 'SUM_DISABLED:Skipping theme scan'),
(130, 1426459824.693661, 10, 'info', 'SUM_DISABLED:Skipping plugin scan'),
(131, 1426459824.707082, 10, 'info', 'SUM_START:Scanning for known malware files'),
(132, 1426459826.454835, 2, 'info', 'Analyzed 100 files containing 1.04 MB of data so far'),
(133, 1426459827.224716, 2, 'info', 'Analyzed 200 files containing 2.39 MB of data so far'),
(134, 1426459828.046702, 2, 'info', 'Analyzed 300 files containing 4.1 MB of data so far'),
(135, 1426459828.791404, 2, 'info', 'Analyzed 400 files containing 4.75 MB of data so far'),
(136, 1426459830.642947, 2, 'info', 'Analyzed 500 files containing 7.69 MB of data so far'),
(137, 1426459831.416239, 2, 'info', 'Analyzed 600 files containing 8.75 MB of data so far'),
(138, 1426459832.316532, 2, 'info', 'Analyzed 700 files containing 9.81 MB of data so far'),
(139, 1426459833.389435, 2, 'info', 'Analyzed 800 files containing 10.64 MB of data so far'),
(140, 1426459834.195964, 2, 'info', 'Analyzed 900 files containing 12.11 MB of data so far'),
(141, 1426459837.624936, 2, 'info', 'Analyzed 1000 files containing 12.69 MB of data so far'),
(142, 1426459838.710292, 2, 'info', 'Analyzed 1100 files containing 13.41 MB of data so far'),
(143, 1426459839.776547, 2, 'info', 'Analyzed 1200 files containing 13.87 MB of data so far'),
(144, 1426459840.846100, 2, 'info', 'Analyzed 1300 files containing 15.4 MB of data so far'),
(145, 1426459841.843117, 2, 'info', 'Analyzed 1400 files containing 16.38 MB of data so far'),
(146, 1426459842.841469, 2, 'info', 'Analyzed 1500 files containing 16.96 MB of data so far'),
(147, 1426459843.955339, 2, 'info', 'Analyzed 1600 files containing 17.75 MB of data so far'),
(148, 1426459845.117612, 2, 'info', 'Analyzed 1700 files containing 19.51 MB of data so far'),
(149, 1426459846.232547, 2, 'info', 'Analyzed 1800 files containing 20.6 MB of data so far'),
(150, 1426459847.499427, 2, 'info', 'Analyzed 1900 files containing 21.68 MB of data so far'),
(151, 1426459848.587589, 2, 'info', 'Analyzed 2000 files containing 21.86 MB of data so far'),
(152, 1426459848.702625, 1, 'error', '<br />\n<b>Fatal error</b>:  Maximum execution time of 30 seconds exceeded in <b>C:\\xampp\\htdocs\\wordpress\\wp-includes\\class-http.php</b> on line <b>1421</b><br />\n'),
(153, 1426459849.680545, 2, 'info', 'Analyzed 2100 files containing 27.51 MB of data so far'),
(154, 1426459850.730101, 2, 'info', 'Analyzed 2200 files containing 28.69 MB of data so far'),
(155, 1426600098.491950, 1, 'info', 'Scheduled Wordfence scan starting at Tuesday 17th of March 2015 01:48:18 PM'),
(156, 1426600100.492300, 10, 'info', 'SUM_PREP:Preparing a new scan.'),
(157, 1426600100.506966, 10, 'info', 'SUM_PAIDONLY:Remote scan of public facing site only available to paid members'),
(158, 1426600102.529687, 10, 'info', 'SUM_PAIDONLY:Check if your site is being Spamvertized is for paid members only'),
(159, 1426600104.540105, 10, 'info', 'SUM_PAIDONLY:Checking if your IP is generating spam is for paid members only'),
(160, 1426600106.573812, 10, 'info', 'SUM_START:Scanning your site for the HeartBleed vulnerability'),
(161, 1426600107.915006, 10, 'info', 'SUM_ENDOK:Scanning your site for the HeartBleed vulnerability'),
(162, 1426600107.934843, 1, 'info', 'Contacting Wordfence to initiate scan'),
(163, 1426600108.784109, 2, 'info', 'Getting plugin list from WordPress'),
(164, 1426600108.832244, 2, 'info', 'Found 9 plugins'),
(165, 1426600108.850614, 2, 'info', 'Getting theme list from WordPress'),
(166, 1426600108.899668, 2, 'info', 'Found 5 themes'),
(167, 1426600108.985580, 10, 'info', 'SUM_START:Fetching core, theme and plugin file signatures from Wordfence'),
(168, 1426600112.543544, 10, 'info', 'SUM_ENDSUCCESS:Fetching core, theme and plugin file signatures from Wordfence'),
(169, 1426600112.555326, 10, 'info', 'SUM_START:Fetching list of known malware files from Wordfence'),
(170, 1426600113.946773, 10, 'info', 'SUM_ENDSUCCESS:Fetching list of known malware files from Wordfence'),
(171, 1426600113.961211, 10, 'info', 'SUM_START:Comparing core WordPress files against originals in repository'),
(172, 1426600113.964705, 10, 'info', 'SUM_DISABLED:Skipping theme scan'),
(173, 1426600113.968492, 10, 'info', 'SUM_DISABLED:Skipping plugin scan'),
(174, 1426600113.977577, 10, 'info', 'SUM_START:Scanning for known malware files'),
(175, 1426600114.959532, 2, 'info', 'Analyzed 100 files containing 1.06 MB of data so far'),
(176, 1426600115.855139, 2, 'info', 'Analyzed 200 files containing 2.32 MB of data so far'),
(177, 1426600116.777951, 2, 'info', 'Analyzed 300 files containing 4.15 MB of data so far'),
(178, 1426600117.608200, 2, 'info', 'Analyzed 400 files containing 4.8 MB of data so far'),
(179, 1426600118.431577, 2, 'info', 'Analyzed 500 files containing 7.85 MB of data so far'),
(180, 1426600119.301119, 2, 'info', 'Analyzed 600 files containing 8.88 MB of data so far'),
(181, 1426600120.509180, 2, 'info', 'Analyzed 700 files containing 9.91 MB of data so far'),
(182, 1426600121.801129, 2, 'info', 'Analyzed 800 files containing 10.77 MB of data so far'),
(183, 1426600122.784206, 2, 'info', 'Analyzed 900 files containing 12.36 MB of data so far'),
(184, 1426600123.861058, 2, 'info', 'Analyzed 1000 files containing 13 MB of data so far'),
(185, 1426600126.912970, 2, 'info', 'Analyzed 1100 files containing 13.55 MB of data so far'),
(186, 1426600128.145037, 2, 'info', 'Analyzed 1200 files containing 14.97 MB of data so far'),
(187, 1426600129.342001, 2, 'info', 'Analyzed 1300 files containing 15.36 MB of data so far'),
(188, 1426600130.481799, 2, 'info', 'Analyzed 1400 files containing 15.95 MB of data so far'),
(189, 1426600131.540268, 2, 'info', 'Analyzed 1500 files containing 16.92 MB of data so far'),
(190, 1426600132.696114, 2, 'info', 'Analyzed 1600 files containing 17.49 MB of data so far'),
(191, 1426600133.973861, 2, 'info', 'Analyzed 1700 files containing 18.32 MB of data so far'),
(192, 1426600135.462296, 2, 'info', 'Analyzed 1800 files containing 20.08 MB of data so far'),
(193, 1426600136.929613, 2, 'info', 'Analyzed 1900 files containing 21.06 MB of data so far'),
(194, 1426600137.575550, 1, 'error', '<br />\n<b>Fatal error</b>:  Maximum execution time of 30 seconds exceeded in <b>C:\\xampp\\htdocs\\wordpress\\wp-includes\\class-http.php</b> on line <b>1511</b><br />\n'),
(195, 1426600138.384145, 2, 'info', 'Analyzed 2000 files containing 22.06 MB of data so far'),
(196, 1426600139.714472, 2, 'info', 'Analyzed 2100 files containing 22.95 MB of data so far'),
(197, 1426600143.681947, 2, 'info', 'Analyzed 2200 files containing 23.17 MB of data so far'),
(198, 1426600145.010087, 2, 'info', 'Analyzed 2300 files containing 29.23 MB of data so far'),
(199, 1426600146.168006, 2, 'info', 'Analyzed 2400 files containing 31.56 MB of data so far'),
(200, 1426600147.531332, 2, 'info', 'Analyzed 2500 files containing 32.6 MB of data so far'),
(201, 1426600148.746851, 2, 'info', 'Analyzed 2600 files containing 33.39 MB of data so far'),
(202, 1426600149.781110, 2, 'info', 'Analyzed 2700 files containing 34.98 MB of data so far'),
(203, 1426600150.799892, 2, 'info', 'Analyzed 2800 files containing 36.79 MB of data so far'),
(204, 1426600151.819833, 2, 'info', 'Analyzed 2900 files containing 39.18 MB of data so far'),
(205, 1426600152.771323, 2, 'info', 'Analyzed 3000 files containing 40.47 MB of data so far'),
(206, 1426600153.756580, 2, 'info', 'Analyzed 3100 files containing 41.22 MB of data so far'),
(207, 1426600154.803964, 2, 'info', 'Analyzed 3200 files containing 42.72 MB of data so far'),
(208, 1426600155.760285, 2, 'info', 'Analyzed 3300 files containing 45.02 MB of data so far'),
(209, 1426600156.128249, 2, 'info', 'Analyzed 3336 files containing 46.04 MB of data.'),
(210, 1426600156.134541, 10, 'info', 'SUM_ENDOK:Comparing core WordPress files against originals in repository'),
(211, 1426600156.148027, 10, 'info', 'SUM_ENDOK:Scanning for known malware files'),
(212, 1426600156.256206, 10, 'info', 'SUM_START:Scanning file contents for infections and vulnerabilities'),
(213, 1426600156.269888, 10, 'info', 'SUM_START:Scanning files for URLs in Google''s Safe Browsing List'),
(214, 1426600157.729798, 2, 'info', 'Starting scan of file contents'),
(215, 1426600160.019793, 2, 'info', 'Scanned contents of 43 additional files at 40.51 per second'),
(216, 1426600161.150902, 2, 'info', 'Scanned contents of 90 additional files at 41.05 per second'),
(217, 1426600162.160095, 2, 'info', 'Scanned contents of 121 additional files at 37.79 per second'),
(218, 1426600163.177756, 2, 'info', 'Scanned contents of 163 additional files at 38.63 per second'),
(219, 1426600164.191324, 2, 'info', 'Scanned contents of 211 additional files at 40.32 per second'),
(220, 1426600164.699751, 2, 'info', 'Scanned contents of 227 additional files at 39.54 per second'),
(221, 1426600164.728293, 2, 'info', 'Asking Wordfence to check URL''s against malware list.'),
(222, 1426600164.756226, 2, 'info', 'Checking 102 host keys against Wordfence scanning servers.'),
(223, 1426600165.802970, 2, 'info', 'Done host key check.'),
(224, 1426600165.895174, 2, 'info', 'Done file contents scan'),
(225, 1426600165.900489, 10, 'info', 'SUM_ENDOK:Scanning file contents for infections and vulnerabilities'),
(226, 1426600165.912946, 10, 'info', 'SUM_ENDOK:Scanning files for URLs in Google''s Safe Browsing List'),
(227, 1426600165.929520, 10, 'info', 'SUM_START:Scanning posts for URL''s in Google''s Safe Browsing List'),
(228, 1426600166.018947, 2, 'info', 'Examining URLs found in posts we scanned for dangerous websites'),
(229, 1426600166.026884, 2, 'info', 'Checking 2 host keys against Wordfence scanning servers.'),
(230, 1426600166.907114, 2, 'info', 'Done host key check.'),
(231, 1426600166.915457, 2, 'info', 'Done examining URls'),
(232, 1426600167.016238, 10, 'info', 'SUM_ENDOK:Scanning posts for URL''s in Google''s Safe Browsing List'),
(233, 1426600167.035219, 10, 'info', 'SUM_START:Scanning comments for URL''s in Google''s Safe Browsing List'),
(234, 1426600167.142286, 2, 'info', 'Checking 3 host keys against Wordfence scanning servers.'),
(235, 1426600169.095675, 2, 'info', 'Done host key check.'),
(236, 1426600169.216262, 10, 'info', 'SUM_ENDOK:Scanning comments for URL''s in Google''s Safe Browsing List'),
(237, 1426600169.238896, 10, 'info', 'SUM_START:Scanning for weak passwords'),
(238, 1426600169.251085, 2, 'info', 'Starting password strength check on 6 users.'),
(239, 1426600171.003532, 10, 'info', 'SUM_ENDOK:Scanning for weak passwords'),
(240, 1426600171.016676, 10, 'info', 'SUM_START:Scanning DNS for unauthorized changes'),
(241, 1426600171.020015, 2, 'info', 'Starting DNS scan for localhost'),
(242, 1426600171.489187, 1, 'error', '<br />\n<b>Fatal error</b>:  Maximum execution time of 30 seconds exceeded in <b>C:\\xampp\\htdocs\\wordpress\\wp-includes\\class-http.php</b> on line <b>1511</b><br />\n'),
(243, 1426600172.720591, 10, 'info', 'SUM_ENDOK:Scanning DNS for unauthorized changes'),
(244, 1426600172.755613, 10, 'info', 'SUM_START:Scanning to check available disk space'),
(245, 1426600172.763691, 2, 'info', 'Total disk space: 100.0937GB -- Free disk space: 48.5480GB'),
(246, 1426600172.769130, 2, 'info', 'The disk has 49713.19 MB space available'),
(247, 1426600172.775457, 10, 'info', 'SUM_ENDOK:Scanning to check available disk space'),
(248, 1426600172.800027, 10, 'info', 'SUM_START:Scanning for old themes, plugins and core files'),
(249, 1426600172.805575, 10, 'info', 'SUM_ENDOK:Scanning for old themes, plugins and core files'),
(250, 1426600172.884029, 1, 'info', '-------------------'),
(251, 1426600172.887518, 1, 'info', 'Scan Complete. Scanned 3336 files, 9 plugins, 5 themes, 6 pages, 3 comments and 4160 records in 72 seconds.'),
(252, 1426600172.890689, 10, 'info', 'SUM_FINAL:Scan complete. Congratulations, no problems found.'),
(253, 1426600172.904661, 2, 'info', 'Wordfence used 20.41MB of memory for scan. Server peak memory usage was: 45.43MB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfthrottlelog`
--

CREATE TABLE IF NOT EXISTS `wp_wfthrottlelog` (
  `IP` int(10) unsigned NOT NULL,
  `startTime` int(10) unsigned NOT NULL,
  `endTime` int(10) unsigned NOT NULL,
  `timesThrottled` int(10) unsigned NOT NULL,
  `lastReason` varchar(255) NOT NULL,
  PRIMARY KEY (`IP`),
  KEY `k2` (`endTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_wfvulnscanners`
--

CREATE TABLE IF NOT EXISTS `wp_wfvulnscanners` (
  `IP` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` longtext,
  `attribute_type` varchar(200) NOT NULL,
  `attribute_orderby` varchar(200) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`,`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_order_itemmeta`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_order_items`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_tax_rates`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`),
  KEY `tax_rate_class` (`tax_rate_class`),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_woocommerce_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `woocommerce_term_id` (`woocommerce_term_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
