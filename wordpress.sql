-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generaciÃ³n: 31-03-2015 a las 17:44:14
-- VersiÃ³n del servidor: 5.6.14
-- VersiÃ³n de PHP: 5.5.6

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
(1, 1, 'SeÃ±or WordPress', '', 'https://wordpress.org/', '', '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Hola, esto es un comentario.\nPara eliminar un comentario sÃ³lo inicie sesiÃ³n debe y vea los comentarios de la entrada. AllÃ­ tendrÃ¡ la opciÃ³n de editar o eliminarlos.', 0, '1', '', '', 0, 0),
(2, 2, 'cami2708', 'cami2708@yahoo.es', '', '::1', '2014-12-23 02:50:18', '2014-12-23 02:50:18', 'Hola, esto es el comentario nÃºmero 1 que tiene por objetivo demostrar que la funciÃ³n estÃ¡ funcionando correctamente y que se pueden hacer mÃ¡s cosas con Ã©l.\r\n<code>\r\n/**\r\n * CSSReset.com - How To Keep Footer At Bottom of Page with CSS\r\n * \r\n * Original Tutorial: http://www.cssreset.com/2010/css-tutorials/how-to-keep-footer-at-bottom-of-page-with-css/\r\n * License: Free - do whatever you like with it! Credit and linkbacks much appreciated.\r\n *\r\n * NB: Make sure the value for ''padding-bottom'' on #content is equal to or greater than the height of #footer.\r\n */\r\nhtml,\r\nbody {\r\n	margin:0;\r\n	padding:0;\r\n	height:100%;\r\n}\r\n#wrapper {\r\n	min-height:100%;\r\n	position:relative;\r\n}\r\n#header {\r\n	background:#ededed;\r\n	padding:10px;\r\n}\r\n#content {\r\n	padding-bottom:100px; /* Height of the footer element */\r\n}\r\n#footer {\r\n	background:#ffab62;\r\n	width:100%;\r\n	height:100px;\r\n	position:absolute;\r\n	bottom:0;\r\n	left:0;\r\n}\r\n\r\n\r\n</code>', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '', 0, 1),
(3, 2, 'cami2708', 'cami2708@yahoo.es', '', '::1', '2014-12-23 02:52:24', '2014-12-23 02:52:24', 'Comentario respuesta a otro comentario anterior.\r\nEn esta oportunidad se probarÃ¡ con cÃ³digo HTML\r\n<code>\r\n<?php\r\n$countt=1;\r\nfor($i=1;$i<=5;$i++){\r\n	if(isset($_REQUEST["a$i"])){\r\n	$_SESSION[''data''][$countt]=$_REQUEST["a$i"];\r\n	$countt++;\r\n	}\r\n}\r\n\r\n$data=$_SESSION[''data''];\r\n//var_dump($data);?>\r\n<html>\r\n    <head>\r\n        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\r\n        <meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />\r\n        <title></title>\r\n    </head>\r\n    <body>\r\n        \r\n        <?php\r\n        include "connection.php";\r\n    foreach ($data as $key => $value) {\r\n        $sql="Select * from recetas where Id=".$value;\r\n        mysql_set_charset(''utf8'');\r\n        $result=  mysql_query($sql);\r\n        \r\n        while($fila=  mysql_fetch_assoc($result)){            \r\n            $sql2="select * from ingr_receta where RecetaId =".$fila[''Id'']." ";\r\n            $result2=  mysql_query($sql2);\r\n            while($fila2=  mysql_fetch_assoc($result2)){                \r\n                $sql3="select * from alimentos where id = ".$fila2[''AlimentoId'']." ";\r\n                $result3=  mysql_query($sql3);               \r\n                while($fila3=  mysql_fetch_assoc($result3)){\r\n                	if(isset($cosa[$fila3[''nombre'']][1]))\r\n                	$cosa[$fila3[''nombre'']][1]=$cosa[$fila3[''nombre'']][1]+$fila2[''Cantidad''];   \r\n                	else\r\n                		$cosa[$fila3[''nombre'']][1]=$fila2[''Cantidad''];\r\n                	$cosa[$fila3[''nombre'']][2]=$fila2[''Umedida''];\r\n                }\r\n            }\r\n        }\r\n    }\r\n    echo "<h1>Lista:</h1><ul>";\r\n\r\n    $_SESSION[''Total'']=$cosa;\r\n    foreach ($cosa as $key => $value) {\r\n    	echo "<li>".$value[1]." ".$value[2]." de ".$key.".</li>";\r\n    }\r\n    echo "</ul>";\r\n        mysql_close();\r\n        ?>\r\n    </body>\r\n</html>\r\n\r\n\r\n\r\n\r\n</code>', 0, '1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', '', 2, 1);

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
(395, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 23:22:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=4.2-beta1-31800";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.2 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 23:22:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3446";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.2 Beta 1 is now available! This software is still in development, so we donâ€™t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (youâ€™ll want â€œbleeding edge nightliesâ€). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Drew Jaynes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4259:"<p>WordPress 4.2 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we donâ€™t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (youâ€™ll want â€œbleeding edge nightliesâ€). Or you can <a href="https://wordpress.org/wordpress-4.2-beta1.zip">download the beta here</a> (zip).</p>\n<p>4.2 is due out next month, but to get there, we need your help testing what we&#8217;ve been working on:</p>\n<ul>\n<li><strong>Press This</strong> has been completely revamped to make sharing content from around the web easier than ever. The new workflow is mobile friendly, and we&#8217;d love for you to try it out on all of your devices. Navigate to the Tools screen in your WordPress backend to get started (<a href="https://core.trac.wordpress.org/ticket/31373">#31373</a>). </li>\n<li><strong>Browsing and switching installed themes</strong> has been added to the Customizer to make switching faster and more convenient. We&#8217;re especially interested to know if this helps streamline the process of setting up your site (<a href="https://core.trac.wordpress.org/ticket/31303">#31303</a>).</li>\n<li>The workflow for <strong>updating and installing plugins</strong> just got more intuitive with the ability to install or update in-place from the Plugins screens. Try it out and let us know what you think! (<a href="https://core.trac.wordpress.org/ticket/29820">#29820</a>)</li>\n<li>If you felt like <strong>emoji</strong> were starkly missing from your content toolbox, worry no more. We&#8217;ve added emoji support nearly everywhere, even post slugs <img src="https://s0.wp.com/wp-content/mu-plugins/emoji/twemoji/72x72/1f44d.png" class="wp-smiley" style="height: 1em;" /> (<a href="https://core.trac.wordpress.org/ticket/31242">#31242</a>).</li>\n</ul>\n<p><strong>Developers</strong>: There have been a lot of changes for you to test as well, including:</p>\n<ul>\n<li><strong>Taxonomy Roadmap:</strong> Terms shared across multiple taxonomies will <a href="https://make.wordpress.org/core/2015/02/16/taxonomy-term-splitting-in-4-2-a-developer-guide/">now be split</a> into separate terms when one of them is updated. Please let us know if you hit any snags (<a href="https://core.trac.wordpress.org/ticket/5809/">#5809</a>).</li>\n<li>New <code>wp.a11y.speak()</code> functionality helps your JavaScript talk to screen readers to better inform impaired users what&#8217;s happening on-screen. Try it out in your plugin or theme and let us know if you notice any adverse affects (<a href="https://core.trac.wordpress.org/ticket/31368/">#31368</a>).</li>\n<li>Named clause support has been added to <code>WP_Query</code>, <code>WP_Comment_Query</code>, and <code>WP_User_Query</code>, allowing specific <code>meta_query</code> clauses to be used with <code>orderby</code>. If you have any complex queries, please test them (<a href="https://core.trac.wordpress.org/ticket/31045/">#31045</a>, <a href="https://core.trac.wordpress.org/ticket/31265/">#31265</a>).</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.2, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a> on the main development blog.</p>\n<p><strong>If you think youâ€™ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Weâ€™d love to hear from you! If youâ€™re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.2">everything weâ€™ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Press This: switch a theme</em><br />\n<em>Save time installing plugins</em><br />\n<em>Testing makes us</em> <img src="https://s0.wp.com/wp-content/mu-plugins/emoji/twemoji/72x72/1f603.png" class="wp-smiley" style="height: 1em;" /></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 4.1.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/02/wordpress-4-1-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/02/wordpress-4-1-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 23:40:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3436";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.1.1 is now available.Â This maintenance release fixes 21 bugs in versionÂ 4.1. Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1Â was a smooth-sailing release and has seen more than 14 million downloads in the last two months. For a full [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3086:"<p>WordPress 4.1.1 is now available.Â This maintenance release fixes 21 bugs in versionÂ 4.1.</p>\n<p>Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1Â was a smooth-sailing release and has seen more than 14 million downloads in the last two months.</p>\n<p class="p1"><span class="s1">For a full list of changes, consult the <a href="https://core.trac.wordpress.org/query?milestone=4.1.1&amp;group=severity&amp;order=component">list of tickets</a> and the <a href="https://core.trac.wordpress.org/log/branches/4.1?stop_rev=30974&amp;rev=31474">changelog</a>. We fixed one annoying issue where a tag and a category with the same name could get muddled and prevent each otherÂ from being updated.</span></p>\n<p>If you are one of the millions already running WordPress 4.1 and your site, weâ€™ve started rolling out automatic background updates for 4.1.1 for sitesÂ <a href="https://wordpress.org/plugins/background-update-tester/">that support them</a>. Otherwise, <a href="https://wordpress.org/download/">download WordPress 4.1.1</a>Â or visitÂ <strong>Dashboard â†’ Updates</strong>Â and simply click â€œUpdate Now.â€</p>\n<p>Thanks to everyone who contributed to 4.1.1: <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/hissy">Takuro Hishikawa</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/iseulde">Iseulde</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/sippis">sippis</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, and <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n<p>It is with both great honor and sadness we also recognize Kim Parsell as a contributor to this release and a <a href="https://make.wordpress.org/docs/2015/01/05/rip-kim-parsell/">truly beloved member of the community</a> until her untimely passing in December. The project is working to establish a conference travel <a href="https://make.wordpress.org/community/2015/01/15/remembering-kim-parsell/">scholarship</a> in her memory. We miss you, Kim.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/02/wordpress-4-1-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.1 â€œDinahâ€";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/12/dinah/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/12/dinah/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 18:35:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3386";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:360:"Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer Dinah Washington, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style. Introducing TwentyÂ Fifteen Our newest default theme, Twenty Fifteen, is [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:24563:"<p>Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer <a href="http://wikipedia.org/wiki/Dinah_Washington">Dinah Washington</a>, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style.</p>\n<hr />\n<h2 style="text-align: center">Introducing TwentyÂ Fifteen</h2>\n<p><img class="aligncenter size-large wp-image-3389" src="https://wordpress.org/news/files/2014/12/2015-laptop-1024x533.png" alt="2015-laptop" width="692" height="360" /></p>\n<h3>Our newest default theme, Twenty Fifteen, is a blog-focused theme designed forÂ clarity.</h3>\n<p><img class="alignright wp-image-3426 size-medium" src="https://wordpress.org/news/files/2014/12/2015-phones-languages-small-300x250.png" alt="" width="300" height="250" />Twenty Fifteen has flawless language support, with help from <a href="https://www.google.com/get/noto/">Googleâ€™s Noto font family</a>.</p>\n<p>The straightforward typography is readable on any screen size.</p>\n<p>Your content always takes center stage, whether viewed on a phone, tablet, laptop, or desktop computer.</p>\n<hr />\n<h2 style="text-align: center">Distraction-free writing</h2>\n<p><img class="aligncenter size-large wp-image-3392" src="https://wordpress.org/news/files/2014/12/dfw-screen-1024x614.png" alt="dfw-screen" width="692" height="415" /></p>\n<h3 style="text-align: center"><em>Just write.</em></h3>\n<p>Sometimes, you just need to concentrate on putting your thoughts into words. Try turning on <strong>distraction-free writing mode</strong>. When you start typing, all the distractions will fade away, letting you focus solely on your writing. All your editing tools instantly return when you need them.</p>\n<hr />\n<h2 style="text-align: center">The Finer Points</h2>\n<h5><strong><img class="alignleft wp-image-3405" src="https://wordpress.org/news/files/2014/12/icon-language2.png" alt="" width="80" height="80" /></strong>Choose a language</h5>\n<p>Right now, WordPress 4.1 is already translated into over forty languages, with more always in progress. You can switch to any translation on the General Settings screen.</p>\n<h5><strong><img class="alignleft wp-image-3406" src="https://wordpress.org/news/files/2014/12/icon-logout1.png" alt="" width="80" height="80" /></strong>Log out everywhere</h5>\n<p>If youâ€™ve ever worried you forgot to sign out from a shared computer, you can now go to your profile and log out everywhere.</p>\n<h5><strong><img class="alignleft wp-image-3407" src="https://wordpress.org/news/files/2014/12/icon-vine1.png" alt="" width="80" height="80" /></strong>Vine embeds</h5>\n<p>Embedding videos from Vine is as simple as pasting a URL onto its own line in a post. See the <a href="https://codex.wordpress.org/Embeds">full list</a> of supported embeds.</p>\n<h5><strong><img class="alignleft wp-image-3408" src="https://wordpress.org/news/files/2014/12/icon-recommended1.png" alt="" width="80" height="80" /></strong>Plugin recommendations</h5>\n<p>The plugin installer suggests plugins for you to try. Recommendations are based on the plugins you and other users have installed.</p>\n<hr />\n<h2 style="text-align: center">Under the Hood</h2>\n<h5>Complex Queries</h5>\n<p>Metadata, date, and term queries now support advanced conditional logic, like nested clauses and multiple operators â€” <code>AÂ ANDÂ (Â BÂ ORÂ CÂ )</code>.</p>\n<h5>Customizer API</h5>\n<p>The customizer now supports conditionally showing panels and sections based on the page being previewed.</p>\n<h5><code>&lt;title&gt;</code> tags in themes</h5>\n<p><code>add_theme_support( ''title-tag'' )</code> tells WordPress to handle the complexities of document titles.</p>\n<h5>Developer Reference</h5>\n<p>Continued improvements to inline code documentation have made theÂ <a href="https://developer.wordpress.org/reference/">developer reference</a> more complete than ever.</p>\n<hr />\n<h2 style="text-align: center">The Choir</h2>\n<p>This release was led by <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, with the help of these awesome folks. Check out some of their profiles while listening to Dinah Washington on the music service of your choice:</p>\n<a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/akumria">akumria</a>, <a href="https://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/momo360modena">Amaury Balmer</a>, <a href="https://profiles.wordpress.org/amruta123b">Amruta Bhosale</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andg">Andrea Gandino</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andrewryno">Andrew Ryno</a>, <a href="https://profiles.wordpress.org/rarst">Andrey "Rarst" Savchenko</a>, <a href="https://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/arippberger">arippberger</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/bainternet">Bainternet</a>, <a href="https://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/benjmay">Ben May</a>, <a href="https://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bobbingwide">bobbingwide</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/briandichiara">Brian DiChiara</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/bswatson">Brian Watson</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/captaintheme">Captain Theme</a>, <a href="https://profiles.wordpress.org/hiwhatsup">Carlos</a>, <a href="https://profiles.wordpress.org/caspie">Caspie</a>, <a href="https://profiles.wordpress.org/ccprice">ccprice</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/aprea">Chris Aprea</a>, <a href="https://profiles.wordpress.org/chrisbliss18">Chris Jean</a>, <a href="https://profiles.wordpress.org/cmmarslender">Chris Marslender</a>, <a href="https://profiles.wordpress.org/jazzs3quence">Chris Reynolds</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/cfoellmann">Christian Foellmann</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/cyclometh">Corey Snow</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/curtjen">curtjen</a>, <a href="https://profiles.wordpress.org/colorful-tones">Damon Cook</a>, <a href="https://profiles.wordpress.org/dancameron">Dan Cameron</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/convissor">Daniel Convissor</a>, <a href="https://profiles.wordpress.org/nerrad">Darren Ethier (nerrad)</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/davidjlaietta">David Laietta</a>, <a href="https://profiles.wordpress.org/technical_mastermind">David Wood</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/dcavins">dcavins</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/wedi">Dirk Weise</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/dominikschwind-1">Dominik Schwind</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="https://profiles.wordpress.org/dustinhartzler">Dustin Hartzler</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ew_holmes">Eric Holmes</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Lewis</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/florianziegler">Florian Ziegler</a>, <a href="https://profiles.wordpress.org/hereswhatidid">Gabe Shackle</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="https://profiles.wordpress.org/babbardel">George Olaru</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/gregrickaby">Greg Rickaby</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/tivnet">Gregory Karpinsky (@tivnet)</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/hardy101">hardy101</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-SandÃ­</a>, <a href="https://profiles.wordpress.org/heshiming">heshiming</a>, <a href="https://profiles.wordpress.org/honeysilvas">honeysilvas</a>, <a href="https://profiles.wordpress.org/hugodelgado">hugodelgado</a>, <a href="https://profiles.wordpress.org/iandstewart">Ian Stewart</a>, <a href="https://profiles.wordpress.org/ianmjones">ianmjones</a>, <a href="https://profiles.wordpress.org/igmoweb">Ignacio Cruz Moreno</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/ivankristianto">Ivan Kristianto</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jaimieolmstead">jaimieolmstead</a>, <a href="https://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="https://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/japh">Japh</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/jarednova">jarednova</a>, <a href="https://profiles.wordpress.org/jeanyoungkim">jeanyoungkim</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jeherve">Jeremy Herve</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/johneckman">John Eckman</a>, <a href="https://profiles.wordpress.org/johnrom">johnrom</a>, <a href="https://profiles.wordpress.org/johnstonphilip">johnstonphilip</a>, <a href="https://profiles.wordpress.org/jb510">Jon Brown</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jbrinley">Jonathan Brinley</a>, <a href="https://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/julien731">Julien Liabeuf</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kamelkev">kamelkev</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/keesiemeijer">keesiemeijer</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kdoran">Kiko Doran</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kosvrouvas">Kostas Vrouvas</a>, <a href="https://profiles.wordpress.org/kristastevens">kristastevens</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/offereins">Laurens Offereins</a>, <a href="https://profiles.wordpress.org/linuxologos">linuxologos</a>, <a href="https://profiles.wordpress.org/ideag">Liuiza Arunas</a>, <a href="https://profiles.wordpress.org/loushou">loushou</a>, <a href="https://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="https://profiles.wordpress.org/manoz69">Manoz69</a>, <a href="https://profiles.wordpress.org/mantismamita">mantismamita</a>, <a href="https://profiles.wordpress.org/marcosf">Marco Schmoecker</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/landakram">Mark Hudnall</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/senff">Mark Senff</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/marsjaninzmarsa">marsjaninzmarsa</a>, <a href="https://profiles.wordpress.org/matveb">Matias Ventura</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattkeys">mattkeys</a>, <a href="https://profiles.wordpress.org/mlteal">Maura Teal</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/merty">Mert Yazicioglu</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="https://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="https://profiles.wordpress.org/smashcut">Michael Pick</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/chellycat">Michelle Langston</a>, <a href="https://profiles.wordpress.org/mcsf">Miguel Fonseca</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/studionashvegas">Mitch Canter (studionashvegas)</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/mor10">Morten Rand-Hendriksen</a>, <a href="https://profiles.wordpress.org/mvd7793">mvd7793</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nikv">Nikhil Vimal</a>, <a href="https://profiles.wordpress.org/nikolovtmw">Nikola Nikolov</a>, <a href="https://profiles.wordpress.org/nobleclem">nobleclem</a>, <a href="https://profiles.wordpress.org/noplanman">noplanman</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="https://profiles.wordpress.org/p_enrique">p_enrique</a>, <a href="https://profiles.wordpress.org/pushplaybang">Paul</a>, <a href="https://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/peterchester">Peter Chester</a>, <a href="https://profiles.wordpress.org/donutz">Peter J. Herrel</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/phpmypython">phpmypython</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="https://profiles.wordpress.org/psycleuk">psycleuk</a>, <a href="https://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="https://profiles.wordpress.org/quietnic">quietnic</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/ramiabraham">ramiabraham</a>, <a href="https://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/richardmtl">Richard Archambault</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/ryankienstra">Ryan Kienstra</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sakinshrestha">Sakin Shrestha</a>, <a href="https://profiles.wordpress.org/samhotchkiss">Sam Hotchkiss</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shooper">Shawn Hooper</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/skaeser">skaeser</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/socki03">socki03</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/tacoverdo">TacoVerdo</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="https://profiles.wordpress.org/karmatosed">Tammie</a>, <a href="https://profiles.wordpress.org/tareq1988">Tareq Hasan</a>, <a href="https://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="https://profiles.wordpress.org/kraftner">Thomas Kraftner</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/tschutter">Tobias Schutter</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tmtrademark">Toby McKes</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/tomasm">Tomas Mackevicius</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/transom">transom</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/nobinobi">Yuta Sekine</a>, <a href="https://profiles.wordpress.org/zrothauser">Zack Rothauser</a>, and <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.\n<p>There were 283 contributors to this release, again a new high.</p>\n<p>If you want to help out or follow along, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>.</p>\n<p>Thanks for choosing WordPress. Happy holidays and see you next year for version 4.2!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/12/dinah/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 4.1 Release Candidate 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 02:22:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3411";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:429:"The nextÂ release candidate for WordPress 4.1 is now available for testing. SeventyÂ changes have gone in since the first release candidate. With no known issues left, weÂ plan to release 4.1 tomorrow,Â December 18. To test, try theÂ WordPress Beta TesterÂ plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you canÂ download the release candidate hereÂ (zip).Â If you&#8217;d like to learn more about [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1465:"<p>The nextÂ release candidate for WordPress 4.1 is now available for testing.</p>\n<p><a href="https://core.trac.wordpress.org/log/trunk?rev=30961&amp;stop_rev=30827">SeventyÂ changes</a> have gone in since the <a href="https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/">first release candidate</a>. With no known issues left, weÂ plan to release 4.1 tomorrow,Â December 18.</p>\n<p>To test, try theÂ <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a>Â plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you canÂ <a href="https://wordpress.org/wordpress-4.1-RC3.zip">download the release candidate here</a>Â (zip).Â If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the updated About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" />Â â†’ About</strong>Â in the toolbar) and also check outÂ <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the Beta 1 post</a>.</p>\n<p><strong>Plugin authors:</strong>Â Remember to test your plugins against 4.1, and if they&#8217;re compatible, make sure they are marked as tested up to 4.1. Be sure to follow along the core development blog; we&#8217;ve been postingÂ <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes forÂ developers for 4.1</a> as always.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.1 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Dec 2014 11:52:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3375";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:341:"The release candidate for WordPress 4.1 is now available. We&#8217;ve made a lotÂ of refinements over the last few weeks. RC means we think weâ€™re done, but with millions of users and thousands of plugins and themes, itâ€™s possible weâ€™ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2301:"<p>The release candidate for WordPress 4.1 is now available.</p>\n<p>We&#8217;ve made a lotÂ of refinements over the last few weeks. RC means we think weâ€™re done, but with millions of users and thousands of plugins and themes, itâ€™s possible weâ€™ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your help to get there. If you havenâ€™t tested 4.1 yet, now is the time! (Please though, not on your live site unless youâ€™re adventurous.)</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to theÂ <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able toÂ <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.1 RC1, you can use theÂ <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a>Â plugin or you canÂ <a href="https://wordpress.org/wordpress-4.1-RC1.zip">download the release candidate here</a>Â (zip).Â If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" />Â â†’ About</strong>Â in the toolbar) or check out the <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">beta announcement</a>.</p>\n<p><strong>Developers</strong>,Â please test your plugins and themes against WordPress 4.1 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.1 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>\n<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes for developers</a> for 4.1. (For example: if you&#8217;ve written a child theme for Twenty Fifteen, some of the new pagination functions have been renamed for clarity.)</p>\n<p><em>Testing four point one</em><br />\n<em>Why are we up at this hour?</em><br />\n<em>Code is poetry</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.0.1 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/11/wordpress-4-0-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/11/wordpress-4-0-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Nov 2014 18:55:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3363";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.0.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3395:"<p>WordPress 4.0.1 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be updated to 3.9.3, 3.8.5, or 3.7.5 to keep everything secure. (We donâ€™t support older versions, so please update to 4.0.1 for the latest and greatest.)</p>\n<p>WordPress versions 3.9.2 and earlier are affected by a critical cross-site scripting vulnerability, which could enable anonymous users to compromise a site. This was reported by <a href="http://klikki.fi/">Jouko Pynnonen</a>. This issue does not affect version 4.0, but version 4.0.1 does address these eight security issues:</p>\n<ul>\n<li>Three cross-site scripting issuesÂ that a contributor or author couldÂ use to compromise a site. Discovered by <a href="http://joncave.co.uk/">Jon Cave</a>, <a href="http://www.miqrogroove.com/">Robert Chapin</a>, and <a href="https://johnblackbourn.com/">John Blackbourn</a> of the WordPress security team.</li>\n<li>A cross-site request forgery that could be used to trick a user intoÂ changing their password.</li>\n<li>An issue that could lead to a denial of service when passwords are checked. Reported by <a href="http://www.behindthefirewalls.com/">Javier Nieto Arevalo</a> and <a href="http://www.devconsole.info/">Andres Rojas Guerrero</a>.</li>\n<li>Additional protections for server-side request forgery attacks when WordPress makes HTTP requests. Reported by Ben Bidner (vortfu).</li>\n<li>An extremely unlikely hash collision could allow a user&#8217;s account to be compromised, that also required that they haven&#8217;t logged in since 2008 (I wish I were kidding). Reported by <a href="http://david.dw-perspective.org.uk">David Anderson</a>.</li>\n<li>WordPress now invalidates the links in a password reset email if the user remembers their password, logs in, and changes their email address. Reported separately by <a href="https://twitter.com/MomenBassel">Momen Bassel</a>, <a href="http://c0dehouse.blogspot.in/">Tanoy Bose</a>, andÂ <a href="https://managewp.com/">Bojan SlavkoviÄ‡ of ManageWP</a>.</li>\n</ul>\n<p>Version 4.0.1 also fixes 23 bugs with 4.0, and we&#8217;veÂ made two hardening changes, including better validation of EXIF data we are extracting from uploaded photos. Reported by <a href="http://www.securesolutions.no/">Chris AndrÃ¨ Dale</a>.</p>\n<p>We appreciated theÂ <a href="https://codex.wordpress.org/FAQ_Security">responsible disclosure</a> of these issues directly to our security team.Â For more information, see the <a href="https://codex.wordpress.org/Version_4.0.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.0?rev=30475&amp;stop_rev=29710">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.0.1</a> or venture over to <strong>Dashboard â†’ Updates</strong> and simply click â€œUpdate Nowâ€.</p>\n<p><em>Already testing WordPress 4.1? The second beta is now available (<a href="https://wordpress.org/wordpress-4.1-beta2.zip">zip</a>) and it contains these security fixes. For more on 4.1, see <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the beta 1 announcement post</a>.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-0-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.1 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Nov 2014 22:35:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:4:"beta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3352";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:346:"Welcome, everyone, to WordPress 4.1 Beta 1! This software is still in development, so we donâ€™t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the WordPress Beta Tester plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3409:"<p>Welcome, everyone, to WordPress 4.1 Beta 1!</p>\n<p><strong>This software is still in development,</strong> so we donâ€™t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="//wordpress.org/wordpress-4.1-beta1.zip">download the beta here</a> (zip).</p>\n<p>WordPress 4.1 is due for release next month, so we need your help with testing. Here are someÂ highlights of what to test:</p>\n<ul>\n<li>Our beautiful new default theme, <a href="https://make.wordpress.org/core/2014/09/09/twenty-fifteen/">Twenty Fifteen</a>. It&#8217;s a clean, mobile-first, blog-focused theme designed through simplicity.</li>\n<li>A new <a href="https://make.wordpress.org/core/2014/11/11/focus-v2-demo-video/">distraction-free writing mode for the editor</a>. It&#8217;s enabled by default for beta, and we&#8217;d love feedback on it.</li>\n<li>The ability to automatically install new language packs right from the General Settings screen (available as long as your site&#8217;s filesystem is writable).</li>\n<li>A new inline formatting toolbar for images embedded into posts.</li>\n</ul>\n<p>There have been a lot of changes for developers to test as well:</p>\n<ul>\n<li><a href="https://make.wordpress.org/core/2014/10/20/update-on-query-improvements-in-4-1/">Improvements to meta, date, comment, and taxonomy queries</a>, including complex (nested, multiple relation) queries; and querying comment types (<a href="https://core.trac.wordpress.org/ticket/12668">#12668</a>).</li>\n<li>A single termÂ shared across multipleÂ taxonomies isÂ now split into two when updated. For more,Â <a href="https://make.wordpress.org/core/2014/11/12/an-update-on-the-taxonomy-roadmap/">see this post</a>,Â <a href="https://core.trac.wordpress.org/ticket/5809">#5809</a>, and <a href="https://core.trac.wordpress.org/ticket/30335">#30335</a>.</li>\n<li>A new and better way for <a href="https://make.wordpress.org/core/2014/10/29/title-tags-in-4-1/">themes to handle title tags</a>.</li>\n<li>Several <a href="https://make.wordpress.org/core/2014/10/27/toward-a-complete-javascript-api-for-the-customizer/">improvements to the Customizer API</a>, including contextual panels and sections, and JavaScript templates for controls.</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.1, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a>Â on the main development blog.</p>\n<p><strong>If you think youâ€™ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Weâ€™d love to hear from you! If youâ€™re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.1">everything weâ€™ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Twenty Fifteen theme</em><br />\n<em> The beautiful face which hides</em><br />\n<em> Many improvements</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Watch WordCamp San Francisco Livestream";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/10/wcsf-livestream/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/10/wcsf-livestream/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Oct 2014 20:18:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3341";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:381:"WordCamp SanÂ Francisco is the official annualÂ WordPress conference,Â gathering the community every yearÂ since 2006. This is the timeÂ when Matt Mullenweg addresses the community in his annualÂ State of the Word presentation â€“ a recap of Â the year in WordPress and giving us a glimpse into its future. This year the speaker lineup is stellar. ThereÂ will be talks by [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Nikolay Bachiyski";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1975:"<p><a title="2014 edition" href="http://2014.sf.wordcamp.org">WordCamp SanÂ Francisco</a> is the official annualÂ WordPress conference,Â gathering the community every yearÂ <a title="An old website for a WordPress long time ago" href="http://2006.sf.wordcamp.org">since 2006</a>. This is the timeÂ when Matt Mullenweg addresses the community in his annualÂ <a href="http://wordpress.tv/?s=state+of+the+word">State of the Word</a> presentation â€“ a recap of Â the year in WordPress and giving us a glimpse into its future.</p>\n<p>This year the speaker lineup is stellar. ThereÂ will be talks by three of the lead WordPress developers: <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-andrew-nacin">Andrew Nacin</a>, <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-helen-hou-sandi">Helen Hou-SandÃ­</a>, and <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-mark-jaquith">Mark Jaquith</a>. Weâ€™re also looking forward to speakers likeÂ <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jenny-lawson">Jenny Lawson</a>, also known as The Bloggess, and <a href="http://2014.sf.wordcamp.org/speaker/chris-lema/">Chris Lema</a>. If youâ€™re at all interested in the web, you will appreciate the appearance of <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jeff-veen">Jeff Veen</a> â€“ one of theÂ creators of Google Analytics and co-founder of Typekit.</p>\n<p>Even though San Francisco is far far away for most of you, you can still be part of the fun and watch all presentations in real-time viaÂ livestream:</p>\n<p><a href="http://2014.sf.wordcamp.org/tickets/">Get a livestream ticket and watch all talks from WordCamp San Francisco live</a></p>\n<p>If you hurry, you can get one of the special livestream tickets, including a WordCamp San Francisco 2104 t-shirt. You can find all the technical details and start times <a href="http://2014.sf.wordcamp.org/live-stream/">at the WordCamp San Francisco website</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/10/wcsf-livestream/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.0 â€œBennyâ€";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/09/benny/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/09/benny/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Sep 2014 17:05:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3296";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:370:"Version 4.0 of WordPress, named â€œBennyâ€ in honor of jazz clarinetist and bandleader Benny Goodman, is availableÂ for downloadÂ or update in your WordPress dashboard.Â While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:23575:"<p>Version 4.0 of WordPress, named â€œBennyâ€ in honor of jazz clarinetist and bandleader <a href="http://en.wikipedia.org/wiki/Benny_Goodman">Benny Goodman</a>, is availableÂ <a href="https://wordpress.org/download/">for download</a>Â or update in your WordPress dashboard.Â While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience we think you&#8217;ll enjoy.</p>\n<div id="v-bUdzKMro-1" class="video-player"><embed id="v-bUdzKMro-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=bUdzKMro&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 4.0 &quot;Benny&quot;" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<hr />\n<h2 style="text-align: center">Manage your media with style</h2>\n<p><img class="alignnone size-full wp-image-3316" src="https://wordpress.org/news/files/2014/09/media.jpg" alt="Media Library" width="1000" height="586" />Explore your uploads in a beautiful, endless grid. A new details preview makes viewing and editing any amount of media in sequence a snap.</p>\n<hr />\n<h2 style="text-align: center">Working with embeds has never been easier</h2>\n<div style="width: 632px; " class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<video class="wp-video-shortcode" id="video-3296-1" width="632" height="445" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/embed.mp4?_=1" /><source type="video/webm" src="//s.w.org/images/core/4.0/embed.webm?_=1" /><source type="video/ogg" src="//s.w.org/images/core/4.0/embed.ogv?_=1" /><a href="//s.w.org/images/core/4.0/embed.mp4">//s.w.org/images/core/4.0/embed.mp4</a></video></div>\n<p>Paste in a YouTube URL on a new line, and watch it magically become an embedded video. Now try it with a tweet. Oh yeah â€” embedding has become a visual experience. The editor shows a true preview of your embedded content, saving you time and giving you confidence.</p>\n<p>Weâ€™ve expanded the services supported by default, too â€” you can embed videos from CollegeHumor, playlists from YouTube, and talks from TED.Â <a href="https://codex.wordpress.org/Embeds">Check out all of the embeds</a> that WordPress supports.</p>\n<hr />\n<h2 style="text-align: center">Focus on your content</h2>\n<div style="width: 632px; " class="wp-video"><video class="wp-video-shortcode" id="video-3296-2" width="632" height="356" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/focus.mp4?_=2" /><source type="video/webm" src="//s.w.org/images/core/4.0/focus.webm?_=2" /><source type="video/ogg" src="//s.w.org/images/core/4.0/focus.ogv?_=2" /><a href="//s.w.org/images/core/4.0/focus.mp4">//s.w.org/images/core/4.0/focus.mp4</a></video></div>\n<p>Writing and editing is smoother and more immersive with an editor that expands to fit your content as you write, and keeps the formatting tools available at all times.</p>\n<hr />\n<h2 style="text-align: center">Finding the right plugin</h2>\n<p><img class="aligncenter size-large wp-image-3309" src="https://wordpress.org/news/files/2014/09/add-plugin1-1024x600.png" alt="Add plugins" width="692" height="405" /></p>\n<p>There are more than 30,000 free and open source plugins in the WordPress plugin directory. WordPress 4.0 makes it easier to find the right one for your needs, with new metrics, improved search, and a more visual browsing experience.</p>\n<hr />\n<h2 style="text-align: center">The Ensemble</h2>\n<p>This release was led by <a href="http://helenhousandi.com">Helen Hou-SandÃ­</a>, with the help of these fine individuals. There are 275 contributors with props in this release, a new high. Pull up some Benny Goodman on your music service of choice, as a bandleader or in one of his turns as a classical clarinetist, and check out some of their profiles:</p>\n<p><a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/alexanderrohmann">Alexander Rohmann</a>, <a href="https://profiles.wordpress.org/aliso">Alison Barrett</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/amit">Amit Gupta</a>, <a href="https://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andrezrv">Andres Villarreal</a>, <a href="https://profiles.wordpress.org/zamfeer">Andrew Mowe</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andy">Andy Skelton</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="https://profiles.wordpress.org/arnee">Arne Brachhold</a>, <a href="https://profiles.wordpress.org/aubreypwd">Aubrey Portwood</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/kau-boy">Bernhard Kau</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chouby">Chouby</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/caxelsson">Christian Axelsson</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/boda1982">Christopher Spires</a>, <a href="https://profiles.wordpress.org/clifgriffin">Clifton Griffin</a>, <a href="https://profiles.wordpress.org/jupiterwise">Corey McKrill</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/ghost1227">Dan Griffiths</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/danielhuesken">Daniel Husken</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/dannydehaan">Danny de Haan</a>, <a href="https://profiles.wordpress.org/dkotter">Darin Kotter</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dllh">Daryl L. L. Houston (dllh)</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/dnaber-de">David Naber</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/debaat">DeBAAT</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/donncha">Donncha O Caoimh</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyn">Dustyn Doyle</a>, <a href="https://profiles.wordpress.org/eddiemoya">Eddie Moya</a>, <a href="https://profiles.wordpress.org/oso96_2000">Eduardo Reveles</a>, <a href="https://profiles.wordpress.org/edwin-at-studiojoyocom">Edwin Siebel</a>, <a href="https://profiles.wordpress.org/ehg">ehg</a>, <a href="https://profiles.wordpress.org/erayalakese">erayalakese</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/ejdanderson">Evan Anderson</a>, <a href="https://profiles.wordpress.org/eherman24">Evan Herman</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/fahmiadib">Fahmi Adib</a>, <a href="https://profiles.wordpress.org/feedmeastraycat">feedmeastraycat</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/garhdez">garhdez</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/garza">garza</a>, <a href="https://profiles.wordpress.org/gauravmittal1995">gauravmittal1995</a>, <a href="https://profiles.wordpress.org/gavra">Gavrisimo</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/grahamarmfield">Graham Armfield</a>, <a href="https://profiles.wordpress.org/vancoder">Grant Mangham</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/harrym">harrym</a>, <a href="https://profiles.wordpress.org/hebbet">hebbet</a>, <a href="https://profiles.wordpress.org/hinnerk">Hinnerk Altenburg</a>, <a href="https://profiles.wordpress.org/hlashbrooke">Hugh Lashbrooke</a>, <a href="https://profiles.wordpress.org/iljoja">iljoja</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/issuu">issuu</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jackreichert">Jack Reichert</a>, <a href="https://profiles.wordpress.org/jacobdubail">Jacob Dubail</a>, <a href="https://profiles.wordpress.org/janhenkg">JanHenkG</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/strangerstudios">Jason Coleman</a>, <a href="https://profiles.wordpress.org/jaza613">Jaza613</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/slimndap">Jeroen Schmit</a>, <a href="https://profiles.wordpress.org/jerrysarcastic">Jerry Bates (jerrysarcastic)</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jesper800">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jgadbois">jgadbois</a>, <a href="https://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/johnzanussi">John Zanussi</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jonnyauk">jonnyauk</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/jjeaton">Josh Eaton</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/greenshady">Justin Tadlock</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kapeels">kapeels</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kworthington">Kevin Worthington</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="https://profiles.wordpress.org/layotte">Lew Ayotte</a>, <a href="https://profiles.wordpress.org/lritter">lritter</a>, <a href="https://profiles.wordpress.org/lukecarbis">Luke Carbis</a>, <a href="https://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="https://profiles.wordpress.org/m_i_n">m_i_n</a>, <a href="https://profiles.wordpress.org/funkatronic">Manny Fleurmond</a>, <a href="https://profiles.wordpress.org/targz-1">Manuel Schmalstieg</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/mjbanks">Matt Banks</a>, <a href="https://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="https://profiles.wordpress.org/mattheweppelsheimer">Matthew Eppelsheimer</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/meekyhwang">meekyhwang</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/midxcat">midxcat</a>, <a href="https://profiles.wordpress.org/mauteri">Mike Auteri</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="https://profiles.wordpress.org/mikemanger">Mike Manger</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="https://profiles.wordpress.org/mrmist">mrmist</a>, <a href="https://profiles.wordpress.org/m_uysl">Mustafa Uysal</a>, <a href="https://profiles.wordpress.org/muvimotv">MuViMoTV</a>, <a href="https://profiles.wordpress.org/nabil_kadimi">nabil_kadimi</a>, <a href="https://profiles.wordpress.org/namibia">Namibia</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/nd987">nd987</a>, <a href="https://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/schoenwaldnils">Nils Schonwald</a>, <a href="https://profiles.wordpress.org/ninos-ego">Ninos</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/compute">Patrick Hesselberg</a>, <a href="https://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="https://profiles.wordpress.org/pdclark">Paul Clark</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/philipjohn">Philip John</a>, <a href="https://profiles.wordpress.org/senlin">Piet Bos</a>, <a href="https://profiles.wordpress.org/psoluch">Piotr Soluch</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/purzlbaum">purzlbaum</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rclations">RC Lations</a>, <a href="https://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/rob1n">rob1n</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="https://profiles.wordpress.org/harmr">RobertHarm</a>, <a href="https://profiles.wordpress.org/rohan013">Rohan Rawat</a>, <a href="https://profiles.wordpress.org/rhurling">Rouven Hurling</a>, <a href="https://profiles.wordpress.org/ruudjoyo">Ruud Laan</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sammybeats">Sam Brodie</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sathishn">Sathish Nagarajan</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/nessworthy">Sean Nessworthy</a>, <a href="https://profiles.wordpress.org/sergejmueller">Sergej Muller</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shanebp">shanebp</a>, <a href="https://profiles.wordpress.org/sharonaustin">Sharon Austin</a>, <a href="https://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/sphoid">sphoid</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stompweb">Steven Jones</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/t4k1s">t4k1s</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/taylorde">Taylor Dewey</a>, <a href="https://profiles.wordpress.org/thomasvanderbeek">Thomas van der Beek</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/codenameeli">Tim &#039;Eli&#039; Dalbey</a>, <a href="https://profiles.wordpress.org/tmeister">tmeister</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/torresga">torresga</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/treyhunner">treyhunner</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/winterdev">winterDev</a>, <a href="https://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/katzwebdesign">Zack Katz</a>, <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>, and <a href="https://profiles.wordpress.org/zoerooney">Zoe Rooney</a>.Â Also thanks to <a href="http://michaelpick.wordpress.com/">Michael Pick</a> for producing the release video, and Helen with <a href="http://adriansandi.com">AdriÃ¡n SandÃ­</a> for the music.</p>\n<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.1!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/09/benny/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.0 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Aug 2014 12:20:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3287";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:321:"The first release candidate for WordPress 4.0 is now available! In RC 1, weâ€™ve made refinements to what we&#8217;ve been working on for this release. Check out the Beta 1 announcement post for more details on those features. We hope to ship WordPress 4.0 next week, but we need your help to get there.Â If you [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2134:"<p>The first release candidate for WordPress 4.0 is now available!</p>\n<p>In RC 1, weâ€™ve made refinements to what we&#8217;ve been working on for this release. Check out the <a href="https://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">Beta 1 announcement post</a> for more details on those features. We hope to ship WordPress 4.0 <em>next week</em>, but we need your help to get there.Â If you havenâ€™t tested 4.0 yet, thereâ€™s no time like the present. (Please, not on a production site, unless youâ€™re adventurous.)</p>\n<p><strong>Think youâ€™ve found a bug?Â </strong>Please post to theÂ <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, youâ€™ll be able toÂ <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.0 RC1, try theÂ <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a>Â plugin (youâ€™ll want â€œbleeding edge nightliesâ€). Or you canÂ <a href="https://wordpress.org/wordpress-4.0-RC1.zip">download the release candidate here</a>Â (zip).Â If youâ€™d like to learn more about whatâ€™s new in WordPress 4.0, visit the awesome About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" alt="" width="16" height="16" />Â â†’ About</strong>Â in the toolbar).</p>\n<p><strong>Developers,</strong>Â please test your plugins and themes against WordPress 4.0 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.0 before next week. If you find compatibility problems, please be sure to post any issues to the support forums so we can figure those out before the final release.Â You also may want to <a href="https://make.wordpress.org/core/2014/08/21/introducing-plugin-icons-in-the-plugin-installer/">give your plugin an icon</a>, which we launched last week and will appear in the dashboard along with banners.</p>\n<p><em>It is almost time</em><br />\n<em> For the 4.0 release</em><br />\n<em> And its awesomeness</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:31 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:10:"x-pingback";s:37:"https://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Thu, 12 Mar 2015 23:22:52 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20130911070210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(396, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1426646513', 'no'),
(397, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1426603313', 'no'),
(398, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1426646515', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(399, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Meetups Around the World";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44783";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/03/meetups-around-the-world/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"<p><a href="https://kinsta.com/learn/wordpress-communities-around-the-world/">Here&#8217;s a great article about WordPress meetup communities around the world</a>, including Singapore, Argentina, France, Croatia, India, Serbia, Malta, Norway, South Africa, Canada, Switzerland, Ireland, Estonia, Egypt, Poland, Belgium, and Slovakia.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Mar 2015 05:00:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"WPTavern: Ultimate Member: A New Free Community and User Profile Plugin for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40639";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/ultimate-member-a-new-free-community-and-user-profile-plugin-for-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5307:"<p><a href="https://ultimatemember.com/" target="_blank">Ultimate Member</a> is the newest plugin to join the ranks of WordPress membership solutions after seven months in development. One month after landing in the WordPress.org directory, the <a href="https://wordpress.org/plugins/ultimate-member/" target="_blank">plugin</a> is already active on more than 2,000 WordPress sites and has received a 5-star rating from 73/75 reviewers.</p>\n<p>The WordPress ecosystem is flush with both free and commercial membership plugins, but Ultimate Member takes a unique approach with its heavy emphasis on frontend community features. The plugin goes beyond content restriction to provide beautifully-designed user profiles and directories out of the box.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member.png" rel="prettyphoto[40639]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member.png?resize=949%2C457" alt="ultimate-member" class="aligncenter size-full wp-image-40641" /></a></p>\n<p>It includes searchable member directories and frontend user registration, login, and profiles. Administrators can create custom form fields with conditional logic. The membership features include custom user roles, content restriction, conditional menus, and more. Ultimate Member is compatible with multisite and Mandrill. It was also designed to be developer friendly with dozens of actions and filters for further customization.</p>\n<p><a href="http://ultimatememberdemo.com/" target="_blank">Live demos</a> are available for the user profiles, member directory, and user account pages.</p>\n<h3>Ultimate Member Extensions Sales Hit $1500 in the First 5 Days</h3>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member-extensions.jpg" rel="prettyphoto[40639]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/ultimate-member-extensions.jpg?resize=1019%2C174" alt="ultimate-member-extensions" class="aligncenter size-full wp-image-40701" /></a></p>\n<p>Co-founders <a href="https://twitter.com/calumallison" target="_blank">Calum Allison</a> and Ahmed Elmahd opted to keep the base plugin free and offer additional commercial <a href="https://ultimatemember.com/extensions/" target="_blank">extensions</a>.</p>\n<p>&#8220;We decided to use the free core + paid extensions model as we&#8217;ve seen how successful plugins such as WooCommerce, Ninja Forms, and Easy Digital Downloads have been with this model,&#8221; Allison said. &#8220;We want to try replicate this success in the community/user space.&#8221;</p>\n<p>Initial extension sales indicate that the team has identified a competitive niche. &#8220;We&#8217;ve had sales of just under $1,500 from our first five days and we hope this will grow as more extensions are built and more people learn about the plugin,&#8221; Allison told the Tavern.</p>\n<p>Ultimate Member is not quite a BuddyPress alternative, but its founding duo entered the market to provide basic social features on top of membership functionality.</p>\n<p>&#8220;The plugin is useful for people looking to build a site where users can sign up and become members but are not necessarily looking to create a full-blown social network which is offered by plugins such as BuddyPress or WP Symposium,&#8221; Allison said.</p>\n<p>Currently, the most popular extensions in terms of sales are the bbPress integration and Social Login extensions. More modular social features, such as private messaging and paid membership upgrades, are currently in the works.</p>\n<p>&#8220;Longer term we are considering building themes which are designed specifically for the community niche,&#8221; Allison said.</p>\n<p>In the meantime, the duo is focusing on providing support for all users and have answered more than 400 topics on their community forum and the WordPress.org plugin support forum.</p>\n<p>&#8220;We made a decision from the beginning that we would provide support for all users of the plugin, regardless of whether they purchased an extension or not,&#8221; Allison said. &#8220;We feel that providing at least some support to free users means they are more likely to want to purchase an extension or two.&#8221;</p>\n<p>Ultimate Member is open source and available on <a href="https://github.com/wp-plugins/ultimate-member" target="_blank">GitHub</a> for contribution from developers. Co-founders Allison and Elmahd also maintain a <a href="https://trello.com/b/30quaczv/ultimate-member" target="_blank">Trello board</a> for mapping the future of the plugin and managing current issues.</p>\n<p>With a strong set of <a href="https://ultimatemember.com/features/" target="_blank">core features</a> and solid extensions sales numbers right out of the gate, <a href="https://ultimatemember.com/" target="_blank">Ultimate Member</a> is already demonstrating success with the free core plus commercial extensions business model. Even in a seemingly saturated WordPress membership plugin market, a quality product that can zero in on a specific niche has a decent chance of becoming competitive within a short time after launching. The challenge will be keeping up with the level of support they intend to offer for both commercial and free users, while growing the library of extensions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 Mar 2015 22:55:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: Pods Framework Security Release Fixes Severe Vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40651";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wptavern.com/pods-framework-security-release-fixes-severe-vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3704:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/pods.jpg" rel="prettyphoto[40651]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/pods.jpg?resize=628%2C290" alt="pods" class="aligncenter size-full wp-image-40653" /></a></p>\n<p>Last week <a href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended">a blind SQL injection vulnerability</a> was discovered in Yoast&#8217;s popular WordPress SEO plugin. Given the severity of the vulnerability and the fact that the plugin is installed on more than one million WordPress sites, the security team at WordPress.org pushed <a href="http://wptavern.com/how-to-stay-in-the-loop-if-you-turn-off-wordpress-automatic-updates" target="_blank">a forced update</a> to mitigate the possibility of mass exploitation.</p>\n<p>Following this incident, the <a href="http://pods.io/" target="_blank">Pods framework</a> team proactively performed a security review of their <a href="https://wordpress.org/plugins/pods/" target="_blank">plugin</a> and found an issue similar to the one discovered and disclosed last week in the WordPress SEO plugin. Contributor Josh Pollock describes the issue in the <a href="http://pods.io/2015/03/16/important-security-disclosure/" target="_blank">release announcement</a>:</p>\n<blockquote><p>We believe this is an especially severe issue as this issue occurred in the PodsUI class, which is not only used for the Pods admin, but is also employed by many end-users to create front-end and back-end content management interfaces for non-admin users.</p>\n<p>The issue occurred in approximately Line 859 of the PodsUI class. The orderby parameter, which is passed from the browser in a GET variable was subsequently used in an SQL query without being properly sanitized.</p>\n<p>As a result malicious or other unintended SQL queries could be sent to the database by manipulating the GET request.</p></blockquote>\n<p>Pods 2.5.1.2, released today, is a security update that patches this vulnerability. If you require an earlier version of the plugin, patched versions of older versions are available the <a href="https://wordpress.org/plugins/pods/developers/" target="_blank">releases page</a>. All users are advised to update immediately.</p>\n<p>The Pods framework is used for creating, managing, and deploying customized content types and fields. It&#8217;s active on more than 30,000 WordPress installations. Contributors on the project credit Yoast&#8217;s transparency on the recent security issue as having inspired their team to proactively examine Pods.</p>\n<p>&#8220;Reading the details of their issue led us to search for similar security issues in Pods,&#8221; Pollock said. &#8220;We applaud their responsible disclosure to the community. Publishing the details helps other developers work to improve security in their own codebase.&#8221;</p>\n<h3>More Security Updates on the Way for Popular WordPress Plugins</h3>\n<p>All relatively complex plugins will have security issues pop up from time to time that will require immediate patching. Fortunately, the plugin authors in these scenarios have been quick to respond.</p>\n<p>This particular vulnerability is not limited to Pods and the WordPress SEO plugin by Yoast. Pollock advises that WordPress users should be on the lookout for more security updates to follow for other popular plugins.</p>\n<p>&#8220;Our team has done a search in several other plugins for similar issues and has reported our findings to their authors,&#8221; he said. &#8220;At this time we can not share specifics about theses issues, but will as soon as it is responsible to do so.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 Mar 2015 18:17:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Alex King: In Praise of BackupBuddy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=21405";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://alexking.org/blog/2015/03/15/backupbuddy";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1571:"<p>I&#8217;m thrilled with my <a href="https://alexking.org/blog/2015/02/25/hosted-on-webfaction">new hosting set-up</a> for this site, however WebFaction doesn&#8217;t offer daily backups. I knew could spend the time to write a little script to export my database and pass it along to another storage location, but then I thought of <a href="https://ithemes.com/purchase/backupbuddy/">BackupBuddy from iThemes</a>.</p>\n<p>5 minutes later I had BackupBuddy installed, with a nightly job configured to do a full export of my database and store the last 10 days of backups in my Dropbox account.</p>\n<p>Sure, I could have written the code to do this myself. It&#8217;s always tempting to do-it-yourself when you know you <em>can</em> do something. The key is to ask yourself if you <em>should</em> do something. It would have taken much more than 5 minutes to get even a simple backup script written and configured; and I definitely wouldn&#8217;t have had the storage and and automation options that BackupBuddy provides out of the box.</p>\n<p>If you need hassle-free backups for your self-hosted WordPress site<sup id="fnref:1"><a href="http://alexking.org/blog/topic/wordpress/feed#fn:1" rel="footnote">1</a></sup>, give BackupBuddy a try.</p>\n<div class="footnotes">\n<hr />\n<ol>\n<li id="fn:1">\nIf you have a website, <em>please</em> make sure you have an automated backup system, and that you&#8217;ve tested your backups to make sure they actually work.&#160;<a href="http://alexking.org/blog/topic/wordpress/feed#fnref:1" rev="footnote">&#8617;</a>\n</li>\n</ol>\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 15 Mar 2015 20:05:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Live in the Moment";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44759";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/03/live-in-the-moment/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:369:"<p>Jenna Wortham writes on <a href="http://bits.blogs.nytimes.com/2014/10/18/trying-to-live-in-the-moment-and-not-on-the-phone/">Trying to Live in the Moment (and Not on the Phone)</a>. I&#8217;ve been using the Moment app recently too, <a href="https://cloudup.com/cSfRDLJHDiv">here&#8217;s my past week of usage</a>. (I think it might count phone calls as usage.)</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 15 Mar 2015 18:45:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Matt: Series A Struggle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44853";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"http://ma.tt/2015/03/raising-series-a/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:312:"<p><a href="http://firstround.com/review/what-the-seed-funding-boom-means-for-raising-a-series-a/">Josh Kopelman on why raising a Series A is harder than ever, and how startups can adapt to survive the changing investment landscape</a>. Fantastic essay, relevant for every company raising money at any stage.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Mar 2015 20:45:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WPTavern: BuddyPress Live Notification 2.0 Adds Real-Time Notifications for Users";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40500";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/buddypress-live-notification-2-0-adds-real-time-notifications-for-users";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3787:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/08/megaphone.jpg" rel="prettyphoto[40500]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/08/megaphone.jpg?resize=1024%2C484" alt="photo credit: MACSwriter - cc" class="size-full wp-image-28480" /></a>photo credit: <a href="https://www.flickr.com/photos/88758069@N08/8445004895/">MACSwriter</a> &#8211; <a href="http://creativecommons.org/licenses/by-sa/2.0/">cc</a>\n<p>The <a href="https://wordpress.org/plugins/bp-live-notification/">BuddyPress Live Notification</a> plugin was originally released in 2011. Brajesh Singh, prolific plugin author and founder of <a href="http://buddydev.com/" target="_blank">BuddyDev</a>, created the plugin to provide Facebook-style real-time notifications for users. Over the past four years, a number of significant changes in both WordPress and BuddyPress have necessitated a complete rewrite of the extension.</p>\n<p>The <a href="http://buddydev.com/buddypress/introducing-buddypress-live-notification-2-0/" target="_blank">2.0 version</a> of the plugin adds support for BuddyPress&#8217; new <a href="http://wptavern.com/buddypress-1-9-sammy-released-with-new-notifications-component" target="_blank">notifications component</a>, as well as the <a href="http://codex.wordpress.org/Function_Reference/wp_heartbeat_settings" target="_blank">Heartbeat API</a>, which is now used to fetch the notifications.</p>\n<p>The updated version includes the following:</p>\n<ul>\n<li>Complete rewrite of the code to include support for BP notifications component (introduced in BuddyPress 1.9.0)</li>\n<li>Uses WordPress Heartbeat API instead of long AJAX polling for greatly improved performance</li>\n<li>Allows theme authors to change the notifying mechanism by overriding the  notify  method of the  bpln object</li>\n<li>Fires custom JavaScript event bpln:new_notifications when new notifications are received on the client side. A theme author can hook into it to make modifications.</li>\n</ul>\n<p>Because BP Live Notification was designed to be easy to theme and extend, Singh created an <a href="https://github.com/sbrajesh/bp-live-notification-example-module" target="_blank">example plugin</a> to demonstrate how to replace the notify window UI with your own customization.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/jquery-notice-style.png" rel="prettyphoto[40500]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/jquery-notice-style.png?resize=449%2C250" alt="jquery-notice-style" class="aligncenter size-full wp-image-40617" /></a></p>\n<p>The sample plugin repackages the notification window with the <a href="https://github.com/sbrajesh/bp-live-notification-example-module/tree/master/assets/notify" target="_blank">jQuery notice plugin</a>. Check out a <a href="http://creativedream.net/plugins/jquery.notify/" target="_blank">live demo</a> to see how that style of notice is presented.</p>\n<p>If you don&#8217;t like how BP Live Notification styles its alerts by default, you can easily integrate a different jQuery notice plugin using the example Singh posted on GitHub. Searching the web will turn up a <a href="http://jqueryhouse.com/best-jquery-notification-plugins/" target="_blank">wide variety</a> of beautiful notification styles that you can adapt for use with BuddyPress.</p>\n<p>Both Twitter and Facebook use live notifications to keep users interacting on their social networks. When you receive a live notice, it confirms, in an almost tangible way, that you are at the center of where the social activity is happening. If you think this would benefit your BuddyPress network, download <a href="https://wordpress.org/plugins/bp-live-notification/">BP Live Notification</a> 2.0 for free from WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Mar 2015 02:07:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"WPTavern: How to Stay in the Loop if You Turn Off WordPressâ€™ Automatic Updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40498";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wptavern.com/how-to-stay-in-the-loop-if-you-turn-off-wordpress-automatic-updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5514:"<p>When a critical <a href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended" target="_blank">security vulnerability was discovered in Yoast&#8217;s SEO plugin</a> this week, WordPress.org took the initiative to automatically update users&#8217; sites with the patched version of the plugin. Many users were taken by surprise, given that the WordPress codex clearly stated that automatic plugin and theme updates are disabled by default.</p>\n<p>Shortly after the automatic update rolled out, the <a href="http://codex.wordpress.org/Configuring_Automatic_Background_Updates" target="_blank">codex page</a> was updated to reflect the fact that in rare instances WordPress.org will automatically update your plugins and themes unless you opt to turn this feature off entirely. Many users are not comfortable with forced automatic updates, but the good news is that there is a filter to turn them off, including the WordPress.org security updates for popular plugins:</p>\n<pre class="brush: php; light: true; title: ; notranslate">add_filter( ''auto_update_plugin'', ''__return_false'' );</pre>\n<p>Prior to this security issue, users were not aware that they had to opt out of these forced updates. On one side of the fence there are those who think it&#8217;s no big deal and are thankful that WordPress.org is proactive on behalf of user security.</p>\n<p>On the other hand, there are those who are wary of forced updates from plugin authors who are notorious for pushing out problematic updates. The <a href="https://wordpress.org/support/plugin/wordpress-seo">support forum</a> for Yoast&#8217;s SEO plugin contains many threads regarding fatal errors following updates issued in the past.</p>\n<p>In this particular case, Nick Haskins <a href="http://nickhaskins.com/2015/03/on-automatic-wordpress-updates/" target="_blank">summarizes</a> why he was not comfortable with WordPress.org&#8217;s forced update:</p>\n<blockquote><p>The plugin in question is Yoast WordPress SEO. If youâ€™re not familiar with his plugins, the history of updates is awful. In the last two weeks, Iâ€™ve updated twice, and both times have resulted in fatal PHP errors which require FTPâ€™ing into the site, to manually remove the plugin. Both cases were due to not checking if a file exists before loading it.</p></blockquote>\n<p>Those who are not comfortable with WordPress.org&#8217;s forced update policy have the option to turn updates off for particular plugins or for all plugins. If you opt to go the route of turning automatic updates off, there are alternative ways that you can stay up-to-date on plugin releases.</p>\n<h3>Get Email Notices When Core, Plugin, and Theme Updates are Available</h3>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/air-mail.jpg" rel="prettyphoto[40498]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/air-mail.jpg?resize=1018%2C494" alt="photo credit: Par avion - (license)" class="size-full wp-image-40600" /></a>photo credit: <a href="http://www.flickr.com/photos/79016591@N07/13204207393">Par avion</a> &#8211; <a href="https://creativecommons.org/licenses/by-nd/2.0/">(license)</a>\n<p>No site admin can realistically be expected to log into his site(s) and check for update every day, let alone follow all the news surrounding plugin and theme security issues. The <a href="https://wordpress.org/plugins/wp-updates-notifier/" target="_blank">WP Updates Notifier</a> plugin will monitor your WordPress installation for updates and will send you an email as they become available. It includes the following features:</p>\n<ul>\n<li>Set the interval of how often to check for updates; hourly, twice daily or daily.</li>\n<li>Sets WordPress to check for updates more often meaning you get to know about updates sooner.</li>\n<li>Get emailed about core, plugin and theme updates.</li>\n<li>Chose if you want to be notified about active only themes and plugins updates.</li>\n<li>Remove upgrade nag message to non-admin users.</li>\n<li>For advanced users there are a number of filters and actions you can use.</li>\n</ul>\n<p>It would be truly awesome if WP Updates Notifier was also able to scan a plugin&#8217;s changelog for the word &#8220;Security&#8221; and tack it onto the email if it is applicable.</p>\n<p>WP Updates Notifier can be useful even if you&#8217;re comfortable allowing WordPress.org to perform occasional forced updates to themes and plugins for security. You may be using a plugin that is not nearly popular enough meet the criteria for a forced automatic update. Regardless, it may be useful for you to know as soon as there is an update available.</p>\n<p>The important thing is to stay in the loop about potential security issues and get patches as soon as they are available. <a href="https://wordpress.org/plugins/wp-updates-notifier/" target="_blank">WP Updates Notifier</a> lets you do that without having to allow any third party update core, plugins, or themes on your server. The plugin is most useful when you have only a handful of sites or fewer. Otherwise, it&#8217;s probably better to utilize a central dashboard service where you check in regularly to see updates across all of your sites at once.</p>\n<p>Your other alternative is to ditch plugins created by authors who you cannot trust to issue clean updates. That will put you in a better position to leave automatic background updates on, which is recommended for the vast majority of WordPress users.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 19:38:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"Post Status: Running a successful membership site in real life, with Jonathan Williamson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=7208";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"https://poststatus.com/running-a-wordpress-membership-website-jonathan-williamson/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:12427:"<p>Jonathan Williamson is the co-founder and COO of <a href="http://cgcookie.com/">CGCookie</a>, a membership websiteÂ that provides as an educational resource for computer graphics and modeling. CGCookie has been around since 2008, and today is a network of five websites, has thousands of paying members, a team of six full time employees plusÂ a number of contractors.</p>\n<p>CGCookie is built completely on WordPress and has a built in membership component. Some astute readers may recognize both the site and Jonathan&#8217;s name; Jonathan is <a href="https://twitter.com/pippinsplugins">Pippin Williamson&#8217;s</a>Â identical twin brother, and Pippin has worked with Jonathan onÂ CGCookie many times. So, in this interview, you&#8217;re not listening to me talk to Pippin &#8212; though it sounds like it &#8212; but I&#8217;m talking to Jonathan Williamson.</p>\n<p>Jonathan is as passionate about CG, modeling, 3D printing, and the software that surrounds these disciplines as Pippin is about WordPress and programming. It was a pleasure to talk to Jonathan about what it&#8217;s like to run a membership site that runs on WordPress. I think this interview will be beneficial for those that want to run a membership site, and also those that work with clients who make their living off of their website.</p>\n<p><!--[if lt IE 9]><script>document.createElement(''audio'');</script><![endif]-->\n<a href="http://audio.simplecast.fm/9023.mp3">http://audio.simplecast.fm/9023.mp3</a><br />\n<a href="http://audio.simplecast.fm/9023.mp3">Direct Download</a></p>\n<p><a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">Or subscribe toÂ the Post Status Draft podcast on iTunes!</a></p>\n<h3>How CGCookie evolved</h3>\n<p>CGCookie started as a blog with news, tutorials, and resources for CG enthusiasts. The first form of its monetization was by selling the source files for the various tutorials. Within about two years, Jonathan and co-founder Wes Burke decided to add a membership componentÂ that ended up working far better than they anticipated.</p>\n<p>Jonathan has been working full-time on CGCookie since around the summer of 2009. They originally launched on aMember, before eventually migrating to Pippin&#8217;s <a href="https://pippinsplugins.com/restrict-content-pro-premium-content-plugin/">Restrict Content Pro</a> plugin, along with <a href="https://easydigitaldownloads.com/">Easy Digital Downloads</a>.</p>\n<p>Today, CGCookie has more than 120,000 free users, and they have around 4,800 paid members.</p>\n<p>Since 2008, CGCookie haveÂ managed to not have a full time web developer until February of 2014, when they hired Nick Haskins. You may recognize Nick as the founder of <a title="Aesop, a Medium-esque â€œstory engineâ€ for WordPress" href="https://poststatus.com/aesop-medium-esque-story-engine-wordpress/">Aesop Stories</a> as well. Nick manages front-end development for the site, and they still don&#8217;t have a backend developer &#8212; though a backend developer and designer are on their roadmap.</p>\n<h3>How CGCookie&#8217;s eCommerce setup runs</h3>\n<p>Considering Jonathan isÂ usingÂ his brother&#8217;s own plugins in the real world, it makes for a great avenue for feedback and insight for Pippin to improve those products.</p>\n<p>CGCookie is using Restrict Content Pro for <a href="https://cgcookie.com/membership/">memberships</a> themselves, and EDD plus the <a href="https://easydigitaldownloads.com/extensions/frontend-submissions/">Front-End Submissions</a> add-on for their <a href="http://cgcookiemarkets.com/blender/">marketplace</a>. We talked about whether EDD could be used for both, or if there is room for improvement in the marriage between the two systems, and he believes there is and that it&#8217;s a goal for the two plugins. For instance,Â currently, reporting and user management and a number of other features are independent between each plugin even though often times the users that utilize the system may overlap.</p>\n<p>I asked Jonathan about scaling WordPress and eCommerce for their large user base. He says that scaling for eCommerce has not been difficult, but with over a hundred thousand users, some default WordPress functionality has not scaled well; for instance, some admin areas create dropdowns for all users, which does not work well. Fortunately, there are some trac tickets in place currently to help solve some of these problems.</p>\n<h3>Prioritizing goals for a membership site</h3>\n<p>When discussing challenges running a membership site, Jonathan highlights the internal battles: balancing new features versus iterative improvements. Based on my short experience managingÂ this membership site, I completely agree.</p>\n<p>For an example, Jonathan told me about a potential question and answer system to help his members get answers for specific technical topics that may be beyond the scope of a specific course. They believe a Stack Exchange style setup that allows them to refer their courses to specific questions would allow them to better serve their customers with the same content they already have.</p>\n<blockquote><p>How do you get people to find your content that answers their question, but you don&#8217;t haveÂ a way of just explicitly saying that these are the questions this course answers?</p></blockquote>\n<p>They&#8217;re considering a method of post to post relationships that direct courses as question answers and vice versa. For this feature and others, they try to do things with a short return on investment, but they also don&#8217;t want to be a slave to it. They sometimesÂ do things &#8220;that are important to the quality of CGCookie, that never make a dime.&#8221; They removed ads last year under that very premise, to make CGCookie a better learning experience.</p>\n<h3>Not the only place to learn</h3>\n<p>Jonathan knows CGCookie isn&#8217;t the only place to learn, so they focus on creating an excellent community and learning experience for their customers.</p>\n<p>Realizing that our sites aren&#8217;t the only way to get certain information is an important thing to know to be able to better focus what we create for our users and why we create it.</p>\n<h3>Pricing for CGCookie</h3>\n<p>CGCookie has pricing for monthly, quarterly, or yearly pricing; all plans renew automatically unless explicitly cancelled. This is a feature they actively A/B test to see what&#8217;s working and what&#8217;s not.</p>\n<p>Behavior of customers varies between the three levels. Jonathan says that the users are more invested in their purchases (and getting more out of it) when they sign up for longer.Â Quarterly members have 10% longer lifetime memberships and spend three times longer on the site.</p>\n<p>However, they do have &#8220;a fair bit&#8221; of what I called &#8220;download and dash&#8221; members that sign up for a month, download a bunch of assets and cancel. Monthly memberships are also the most popular plan. They&#8217;ve considered locking down downloads for monthly signups but it&#8217;s not something they want to do unless it becomes a bigger problem; however they do lose money on those customers that download gigabytes of files and videos butÂ only stay subscribed for one month.</p>\n<h3>Testing</h3>\n<p>During A/B tests, they have found that people will be just as likely to sign up for quarterly as monthly if monthly isn&#8217;t available, and quarterly members are more engaged. One thing they noted is that once people stick around for a few months, the average tenure of a user skyrockets; they have some users that have been a paying member as long as the site has been running.</p>\n<p>One of my big takeaways talking to Jonathan was about how significant testing can be. Their tests help them decide on theÂ optimal pricing and payment plans to maximize a lifetime value.</p>\n<p>For testing, insights, and statistics they useÂ <a href="https://www.optimizely.com/">Optimizely</a>, <a href="https://mixpanel.com/">Mixpanel</a>, and Google Analytics.</p>\n<p>Mixpanel allows you to create custom events in your software, and does require some code knowledge, but it can deliver valuable insights if you use it correctly.Â Jonathan notes, &#8220;It&#8217;s basically as comprehensive as you make it.&#8221;</p>\n<p>They can also mesh tools. They can track which A/B test from Optimizely a customer signed up with, and then use Mixpanel to track what they did and how they did it. They can get login metrics, renewal numbers, and more for each plan and signup flow.</p>\n<p>Mixpanel requires PHP and JavaScript knowledge to utilize, but Optimizely has an extensive visual interface that doesn&#8217;t require code knowledge to utilize.</p>\n<h3>What encourages membership signups</h3>\n<p>&#8220;It varies day to day, week to week, month to month,&#8221; in regard to how their signups work. A bad month in the economy can make their signups go down. Sometimes quarterly users will spike while monthly users are steady.</p>\n<p>Their biggest thing that affects signup rates is customer support. Some presale, but also support for new members to help answer questions and get people engaged. <span class="pullquote alignright">When we can help someone answer the question, &#8220;Where do I go next?&#8221;, we are able to keep them for a long time.</span></p>\n<p>They have one or two courses that drive a ton of traffic to their site, and it is therefore their largest onboarding channel for new members. However, they don&#8217;t have a silver bullet for what it takes to get new users. They are always trying new things.</p>\n<h3>On competing and the industry</h3>\n<p>Jonathan doesn&#8217;t see themselves as a part of a singular industry. While many think of CG as a part of the film industry, it&#8217;s one of dozens of potential applications, and they don&#8217;t want to narrow themselves to a particular one.</p>\n<p>They also poll users to get a feel for who they are and what industry actual users come from. Based on around a thousand responses, they had no real pattern at all. The results were all over the board.</p>\n<p>So they don&#8217;t want to compete with a film tutorials site or any other industry site. They want to focus on the tool itself. They want to teach people how to use Blender and show them how it can be applied to various industries their users are a part of.</p>\n<h3>Advice for those running membership sites</h3>\n<blockquote><p>&#8220;Build your community would be the main one. It&#8217;s one thing to offer a really good product. It&#8217;s one thing toÂ build a really good website. But if you don&#8217;t have theÂ community behind you that&#8217;s going to be willing to trust in you with their wallet &#8230; it&#8217;s not going to go anywhere long term, sustainably.&#8221;</p></blockquote>\n<p>Jonathan says it&#8217;s about building the community as well as the sense of trust within that community. He believes that customers will want to know that not only the content will be worth it, but that it will continue to be worth it &#8212; and that the communication and support from the team behind the site will be consistent as well.</p>\n<p>He believes that subscriptions and products are very different. With a subscription, the interaction is just as or far more important than specific content itself.</p>\n<p>When he refers to community, he doesn&#8217;t mean it has to be strictly through something like a forum. He considers it a broad term, and for them it evolved out of their Blender community user base. At the time we recorded this, they didn&#8217;t have forums, a dedicated chat system, or an actual community integration part &#8212; though <a href="http://community.cgcookie.com/">they have opened a forum</a> since we chatted. But the community exists and thrives within comments and their gallery functionality.</p>\n<h3>Wrapping up</h3>\n<p>Jonathan is full of great advice and I could listen to him talk about membership sites for a long time. I have no experience with CG but at the end of this interview he had me wanted to go build something with Blender.</p>\n<p>You can (and should) keep up with <a href="https://twitter.com/carter2422">Jonathan on Twitter</a>, or perhaps you&#8217;ll see him at a conference near you &#8212; but you&#8217;ll probably think it&#8217;s Pippin at first. Also be sure to checkout <a href="http://cgcookie.com/">CGCookie&#8217;s website</a>; it&#8217;s really great.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 17:01:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"Matt: Love is the light that sparked when only darkness existed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:79:"http://ma.tt/2015/03/love-is-the-light-that-sparked-when-only-darkness-existed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://ma.tt/2015/03/love-is-the-light-that-sparked-when-only-darkness-existed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:186:"<p>&nbsp;<img alt="" src="http://i1.wp.com/ma.tt/files/2015/03/IMG_5196.jpg?resize=604%2C466" title="" class="size-custom" /></p>\n<p>Taken in Houston today. Happy birthday Mom!&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 15:49:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Matt: Government Taking Over Internet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44766";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://ma.tt/2015/03/government-taking-over-internet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:569:"<p>Since the Title II ruling from the FCC there&#8217;s been a lot of partisan rhetoric about the government taking over the internet, <a href="http://ma.tt/2015/02/net-neutrality-win/">even in the comments of this very blog</a>. I just came across Brad Feld&#8217;s post, <a href="http://feld.com/archives/2015/02/final-thoughts-fcc-title-ii-ahead-tomorrows-vote-net-neutrality.html">Some Final Thoughts on the FCC and Title II Ahead of Tomorrow&#8217;s Vote on Net Neutrality</a> and he does an awesome job breaking down and addressing each of the misconceptions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 02:06:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WordPress 4.2 Beta 1 Now Available for Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40568";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wptavern.com/wordpress-4-2-beta-1-now-available-for-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3336:"<p><a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/" target="_blank">WordPress 4.2 beta 1</a> is now available for early testers to download. It&#8217;s &#8220;pencils down&#8221; time for core contributors as far as new feature requests are concerned. This is the point in the release cycle where contributors are focusing their efforts on bug fixes and inline documentation.</p>\n<p>Drew Jaynes, the 4.2 release lead, posted the <a href="https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/" target="_blank">beta release announcement</a> and summarized the main features that could use further testing. The <a href="http://wptavern.com/preview-the-press-this-bookmarklet-redesign-alpha-plugin-now-ready-for-testing" target="_blank">Press This bookmarklet feature has been totally redeigned</a> to be more intuitive and mobile-friendly. If you want to test it out, install the beta and then navigate to the Tools screen in the admin.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/press-this-featured.jpg" rel="prettyphoto[40568]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/press-this-featured.jpg?resize=898%2C408" alt="press-this-featured" class="aligncenter size-full wp-image-24221" /></a></p>\n<p>Jaynes also encourages users to test drive the new theme browsing and switching capabilities that are now built into the customizer. &#8220;Weâ€™re especially interested to know if this helps streamline the process of setting up your site,&#8221; he said.</p>\n<p>The customizer theme switcher is one of the more controversial additions to this release. The new feature was met with a significant amount of resistance from our commenters when it was <a href="http://wptavern.com/customizer-theme-switcher-approved-for-merge-into-wordpress-4-2" target="_blank">approved for merge into WordPress 4.2</a>.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg" rel="prettyphoto[40568]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg?resize=1025%2C473" alt="customizer-theme-switcher" class="aligncenter size-full wp-image-38931" /></a></p>\n<p>The installation and update process for plugins has been beautifully re-tooled to provide a smoother, more convenient experience where users can perform these actions without leaving the Plugins screen. Feel free to leave any feedback on the corresponding <a href="https://core.trac.wordpress.org/ticket/29820" target="_blank">ticket</a> for this improvement.</p>\n<p>WordPress 4.2 also <a href="http://wptavern.com/wordpress-4-2-on-track-to-expand-core-support-for-emoji" target="_blank">expands core support for emoji</a>. Jaynes suggested that users go to town on testing it everywhere.</p>\n<p>&#8220;If you felt like emoji were starkly missing from your content toolbox, worry no more,&#8221; he said. &#8220;Weâ€™ve added emoji support nearly everywhere, even post slugs.&#8221;</p>\n<p>According to the current <a href="https://make.wordpress.org/core/version-4-2-project-schedule/" target="_blank">4.2 project schedule</a>, the official release is targeted for the week of April 22nd. A series of betas and at least one release candidate are likely to precede the official release during the course of the next month.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 13 Mar 2015 00:01:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WPWeekly Episode 183 â€“ Backing Up The Backup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=40559&preview_id=40559";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wptavern.com/wpweekly-episode-183-backing-up-the-backup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4337:"<p>In this episode of WordPress Weekly, <a title="http://onlinebizcoach.com/" href="http://onlinebizcoach.com/">Marcus Couch</a> and I discuss a lot of different stories. We share our opinions on the redesigned theme and plugin directories. We discuss CodeGuard&#8217;s survey results that indicate WordPress users need a lot more education on backup plugins, strategies, and services. Last but not least, we discuss the WordPress history book. Near the end of the show, Marcus describes a new venture he&#8217;s pursuing to help coach online businesses.</p>\n<h2>Stories Discussed:</h2>\n<p><a title="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1" href="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1">WordPress Version Stats Updated: More Than 1/3 of Sites are Running WordPress 4.1</a><br />\n<a title="http://wptavern.com/wordpress-plugin-directory-launches-new-design" href="http://wptavern.com/wordpress-plugin-directory-launches-new-design">WordPress Plugin Directory Launches New Design</a><br />\n<a title="http://wptavern.com/wordpress-theme-directory-launches-new-design" href="http://wptavern.com/wordpress-theme-directory-launches-new-design">WordPress Theme Directory Launches New Design</a><br />\n<a title="http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review" href="http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review">Version One of The WordPress History Book is Ready For Review</a><br />\n<a title="http://wptavern.com/wordpress-publishes-security-white-paper" href="http://wptavern.com/wordpress-publishes-security-white-paper">WordPress Publishes Security White Paper</a><br />\n<a title="http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress" href="http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress">CodeGuard Survey Shows More Education is Needed on Backup Software, Services, and Strategies For WordPress</a><br />\n<a title="http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities" href="http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities">bbPress 2.5.5 Released, Patches Three Potential Security Vulnerabilities</a><br />\n<a title="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended" href="http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended">Blind SQL Injection Vulnerability Discovered in WordPress SEO Plugin by Yoast: Immediate Update Recommended</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/custom-upload-folders-plus/" href="https://wordpress.org/plugins/custom-upload-folders-plus/">Custom Upload Folders Plus</a> lets you organize file uploads by file type and logged in users.</p>\n<p><a title="https://wordpress.org/plugins/scratchpad/" href="https://wordpress.org/plugins/scratchpad/">Scratchpad</a> lets you keep running notes when composing your posts. It can be used to keep an outline for the post, be visible next to the post, or to have a list of links or snippets to refer to.</p>\n<p><a title="https://wordpress.org/plugins/gravity-buttons/" href="https://wordpress.org/plugins/gravity-buttons/">Gravity Buttons</a> is a powerful button creation plugin that allows anyone to create great-looking CSS3 buttons that can be used anywhere on your site.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 18th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #183:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 22:58:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"WPTavern: Is a WordPress Plugin a Startup?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wptavern.com/is-a-wordpress-plugin-a-startup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8949:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/petersuhm.jpeg" rel="prettyphoto[40528]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/petersuhm.jpeg?resize=150%2C150" alt="petersuhm" class="alignright size-thumbnail wp-image-40534" /></a>This post was contributed by guest author <a href="http://petersuhm.com/" target="_blank">Peter Suhm</a>. Peter is a web developer from the Land of the Danes. He is the creator of <a href="http://wptavern.com/wp-pusher-aims-to-provide-pain-free-deployment-of-wordpress-themes-and-plugins-from-github" target="_blank">WP Pusher</a> and a huge travel addict, bringing his work along with him as he goes.<br />\n&nbsp;</p>\n<hr />\n<p>About two months ago, I released my first commercial WordPress product, <a href="https://wppusher.com/" target="_blank">WP Pusher</a>, a plugin that makes deploying themes and plugins really easy. WP Pusher was not meant to be &#8220;just a plugin&#8221;. It was supposed to be a SaaS product, and throughout it all, when I was building it, I always thought of it as a startup I was creating.</p>\n<p>For &#8220;just a WordPress plugin&#8221;, I think it has been quite successful so far, and to a large extent, I believe that to be a result of my own perception of the whole thing. I think it was more successful because, even after I realized it was just going to be a plugin, I still treated it as a startup.</p>\n<h2>What Is a Startup?</h2>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/office.jpeg" rel="prettyphoto[40528]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/office.jpeg?resize=1025%2C493" alt="office" class="aligncenter size-full wp-image-40552" /></a></p>\n<p>In the fall of 2014, I was traveling around Southeast Asia, enjoying the digital nomad lifestyle, while making WP Pusher. I spent quite a bit of time in Chiang Mai, the capital of digital nomads, and everyone was talking about a guy named Pieter Levels, who did all kinds of cool things, all related to digital nomadism. One of these things was to take up the challenge of building a new startup every month for 12 months.</p>\n<p>Hearing people talk about Pieter&#8217;s startup quest got me thinking about the term &#8220;startup&#8221;. Honestly, when I first heard about it, I did not think of the 12 startups as real startups &#8211; which Pieter obviously did. To me, creating a portfolio of 12 startups in such a short time seemed a bit silly. In my head, a real startup required more dedication and commitment than that.</p>\n<p>In the meantime, some of Pieter&#8217;s startups have been really successful and the whole process has been really inspiring to follow. I now understand that my idea of a startup was missing some pieces. All of the 12 projects that Pieter created qualified as startups. Some of them were more successful than others, but he validated 12 ideas in a short time and the result is really impressive. And one thing, which is very important, is that Pieter treated all of the 12 projects as startups instead of just another side project (which is how many developers talk about their projects). Calling something a side project is an easy way of protecting yourself against your fear of failure.</p>\n<p>If you ask Steve Blank about his definition of a startup, he will tell you that <a href="http://steveblank.com/2010/01/25/whats-a-startup-first-principles/" target="_blank">&#8220;a startup is an organization formed to search for a repeatable and scalable business model&#8221;</a>. If we break that up, â€œan organizationâ€ can mean anything. It can be you alone or it can be a team. â€œRepeatableâ€ and â€œscalableâ€ are two sides of the same coin.</p>\n<p>Building a WordPress plugin and calling it a day is not enough. That is not a startup. Honestly, to me, â€œrepeatableâ€œ is the main factor. I am in it for the freedom &#8211; not the empire building. I want a business to be repeatable in the sense that I can teach someone else how to run it for me &#8211; hence, freedom. It does not have to be scalable in order to put food on my table or allow me to travel around the world &#8211; it just has to be profitable.</p>\n<p>WordPress offers a giant market full of small niches and potential customers. There is no reason why something you are building for WordPress could not be as huge as any other software startup. The market share of the WordPress platform is <a href="http://w3techs.com/technologies/overview/content_management/all/" target="_blank">large enough</a>.</p>\n<p>In relation to the Steve Blank quote, what could you do to make your WordPress plugin a startup instead of a side project? First of all, you need to think about the &#8220;organization&#8221;. Most likely, you are the programmer or the engineer behind your product. But do you know how to design a shiny, high-converting landing page? Do you have any clue about how to approach marketing or customer relations? What about the legal and financial aspects? Maybe you do. If you do not, you need to either be willing to learn or team up with someone who does. At the very minimum, you need to at least consider it.</p>\n<p>How can you build a business around a WordPress plugin that is more &#8220;repeatable&#8221; and &#8220;scalable&#8221;? Well, you could do most of the things that other startups do. Here are a few questions to consider:</p>\n<ul>\n<li>Could you charge more or offer more expensive options?</li>\n<li>Could you turn your plugin into a SaaS or find something that you could charge for on a recurring basis?</li>\n<li>Could you sell additional add-ons or extensions for your plugin?</li>\n<li>Could you offer a service in addition to your plugin?</li>\n<li>Given you solve some kind of pain for your customers, could you copy your idea to other niches or customer segments?</li>\n<li>Could you come up with ways to attract more customers on a recurring basis? (SEO, content marketing, advertising etc.)</li>\n<li>Could you have someone else help you find new customers? (copywriters, affiliate partners etc.)</li>\n</ul>\n<p>You get it.</p>\n<h2>Solving Your Own Problems vs. Solving Other People&#8217;s Problems</h2>\n<p>A very important point I want to make relates to the business idea of your WordPress plugin. In a market like WordPress, programmers tend to be tempted to find solutions to their own problems &#8211; not necessarily other people&#8217;s problems. Finding a solution for a problem you have yourself is a good place to start and great for motivation, domain knowledge and so on, but it is not enough.</p>\n<p>If you want it to be a business, you need to make sure that other people have the same problem and are willing to pay for it. Startups are not made to solve their own problems. The original business idea behind the startup might have been to solve a problem the founder had, but if the only customer in the startup is going to be the founder alone, it is not a very good business model. You need to figure out how you can make your product relevant to more people &#8211; not everyone of course, but more people than yourself.</p>\n<p>As an example, WP Pusher solves a problem I had with clients. There were already solutions to this problem &#8211; both free and paid. Most of them required either Git installed or that I granted them access to my clients&#8217; servers. Given I am actually in control of, or at least have an influence over, most of the server environments of my clients, I could in theory have used one of these existing solutions.</p>\n<p>However, I knew that was not the case for a lot of WordPress developers. I saw the possibility of solving my own problem as well as solving a problem I knew a lot of other developers had. Reading about Pieter&#8217;s 12 startups inspires me to build more products for WordPress. Solve more problems. Build more startups.</p>\n<h2>Say It Out Loud</h2>\n<p>When I thought WP Pusher was going to be a SaaS business, I thought of it as a startup. When I decided to change the business model and rebuild it all as a single plugin, it felt weird calling it a business &#8211; or even a startup. For a short time I think I phrased it as &#8220;just a project for WordPress&#8221;, when telling people about it.</p>\n<p>Personally, I still like to think of it as a startup. I kept the landing page I built for the SaaS and I kept the blog I set up. I kept everything that I initially made when it was a &#8220;startup&#8221; I was working on. Today, I have made a conscious decision that it is in fact a startup &#8211; no matter how big or small it is.</p>\n<p>WP Pusher has many characteristics of a startup. It solves a very obvious pain point that is easy to communicate. It has a simple business model in a very large market. And finally, it has a logo and it has a nice landing page. That is a startup right there.</p>\n<p>What are you missing before you can confidently call your WordPress plugin a startup?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 21:28:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"Matt: Portland + Phoenix Press Publish Events";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44801";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://ma.tt/2015/03/portland-phoenix-press-publish-events/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:775:"<p>We&#8217;re organizing an exciting <a href="http://presspublish.events/">new conference series focused on blogging, called Press Publish</a>. The speaker list has some really awesome folks on it, and will include notable WordPress bloggers telling their stories as well as <a href="http://automattic.com/">Automattic</a> employees teaching tutorials and workshops. Plus, WordPress.com Happiness Engineers will be ready and waiting to help people one-on-one with their blogs.</p>\n<p>The first two events are in <strong>Portland</strong> on March 28 and in <strong>Phoenix</strong> on April 18, and <a href="http://presspublish.events/register/?tix_coupon=MATTBLOG">if you register with this link in the next week or so you get a discount</a>, special for Ma.tt readers.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Mar 2015 04:58:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WPTavern: EDD 2.3 Introduces New Customer Management Interface and Performance Improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40484";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:101:"http://wptavern.com/edd-2-3-introduces-new-customer-management-interface-and-performance-improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4339:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EasyDigitalDownloadsFeaturedImage.png" rel="prettyphoto[40484]"><img class="aligncenter size-full wp-image-40496" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EasyDigitalDownloadsFeaturedImage.png?resize=620%2C223" alt="EasyDigitalDownloadsFeaturedImage" /></a></p>\n<p>Easy Digital Downloads 2.3 is <a title="https://easydigitaldownloads.com/blog/version-2-3-released/" href="https://easydigitaldownloads.com/blog/version-2-3-released/">available for download</a> and includes new features along with performance improvements. One of the highlights is the new customer management interface. The improved interface lets you quickly browse customer data in an intuitive fashion. There&#8217;s also some new API&#8217;s that allow developers to interact with customer data behind the scenes.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EDD23CustomerManagmentInterface.png" rel="prettyphoto[40484]"><img class="size-full wp-image-40487" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/EDD23CustomerManagmentInterface.png?resize=1025%2C808" alt="New Customer Management Interface" /></a>New Customer Management Interface\n<p>File download URLs are more secure, have better performance, and are more reliable. URLs now contain secure tokens and expiration dates to maintain the security of files. This decreases the likelihood of individuals being able to tamper with downloadable files. URLs are also shorter and easier to share.</p>\n<p>EDD 2.3 significantly improves stat tracking. For example, when you add or remove Download products on an existing payment record, the earnings and sales for the affected products are now properly updated when the payment record is saved. Performance improvements to reports include:</p>\n<ul>\n<li>Tax reports are now much more efficient</li>\n<li>A race condition related to the update process for Download earnings / sales has beenÂ resolved</li>\n<li>Individual customer stats are now much more performant</li>\n<li>The Sales / Earnings widget on the Dashboard now loads via Ajax to improve the first-load performance</li>\n</ul>\n<p>According <a title="https://twitter.com/chriscct7/status/575724923899023360" href="https://twitter.com/chriscct7/status/575724923899023360">to Chris Christoff</a>, core developer of EDD, the product has officially passed 10,000 commits made by 121 peopleÂ since its inception on Github. Pippin Williamson, founder of EDD, states on Twitter that even though the release adds substantial features, the code base has shrunk significantly.</p>\n<blockquote class="twitter-tweet" width="550"><p>Thanks to the keen eyes of <a href="https://twitter.com/andyfragen">@andyfragen</a>, it''s been noticed that the EDD code base shrunk significantly with 2.3, even though we add a LOT</p>\n<p>&mdash; Pippinsplugins (@pippinsplugins) <a href="https://twitter.com/pippinsplugins/status/575721400650043392">March 11, 2015</a></p></blockquote>\n<p></p>\n<p>EDD 2.3 has eight other notable improvements:</p>\n<ul>\n<li>Download products can now be added to the cart with multiple price IDs at one time</li>\n<li>Better support for the <a href="https://wordpress.org/plugins/polylang/" target="_blank">Polylang</a>Â plugin has been added</li>\n<li>PayPal Buy Now buttons no longer create pending payment records on each click</li>\n<li>A new {ip_address} email tag has been added</li>\n<li>Numerous newÂ action hooks and filters have been added for developers</li>\n<li>Numerous translation files have been added and several new languages as well</li>\n<li>The display of items in the cart widget has been improved to properly show quantities</li>\n<li>A large number of minor PHP issues have been resolved</li>\n</ul>\n<p>The full list of bugs and improvements is <a title="https://github.com/easydigitaldownloads/Easy-Digital-Downloads/issues?q=is%3Aissue+milestone%3A2.3+is%3Aclosed" href="https://github.com/easydigitaldownloads/Easy-Digital-Downloads/issues?q=is%3Aissue+milestone%3A2.3+is%3Aclosed">available on Github</a>. You can <a title="https://wordpress.org/plugins/easy-digital-downloads/" href="https://wordpress.org/plugins/easy-digital-downloads/">download 2.3</a> from the WordPress plugin directory or update from within WordPress by visiting the Updates screen.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 23:18:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WPTavern: WordPress Foundation Website Gets a Redesign";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40035";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wptavern.com/wordpress-foundation-website-gets-a-redesign";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3663:"<p>The <a href="http://wordpressfoundation.org/" target="_blank">WordPress Foundation</a> website is sporting a fresh coat of paint, based on the Twenty Fifteen default theme released with <a href="http://wptavern.com/wordpress-4-1-dinah-released" target="_blank">WordPress 4.1</a> last December. The foundation exists to further the mission of the open source project, most importantly by ensuring free access to the software for years to come. It also serves to protect the WordPress-related trademarks and educate the public about the software.</p>\n<p>With that mission at its core, it&#8217;s fitting that the foundation selected Twenty Fifteen for the new look. Matt Mullenweg, founder of the organization, <a href="https://twitter.com/photomatt/status/573256190462984192" target="_blank">identified</a> Automattic employee <a href="https://twitter.com/NickHamze" target="_blank">Nick Hamze</a> as responsible for the foundation&#8217;s updated design.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-foundation.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-foundation.png?resize=1025%2C703" alt="wordpress-foundation" class="aligncenter size-full wp-image-40473" /></a></p>\n<p>When we offered a <a href="http://wptavern.com/first-look-at-designs-for-the-twenty-fifteen-default-wordpress-theme" target="_blank">first look at the design of Twenty Fifteen</a> prior to its release, readers made it clear that this theme would be more enthusiastically received than any other default theme in WordPress&#8217; recent history. Twenty Fifteen offers users a clean canvas that easily lends itself to customization.</p>\n<p>Nick Hamze&#8217;s personal <a href="http://blog.nickhamze.com/" target="_blank">blog</a> is another beautiful example of a Twenty Fifteen customization in the wild.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/nick-hamze.png" rel="prettyphoto[40035]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/nick-hamze.png?resize=1025%2C688" alt="nick-hamze" class="aligncenter size-full wp-image-40474" /></a></p>\n<p>WordCamps in particular are making excellent use of the default theme as a base for their event websites. <a href="http://maine.wordcamp.org/2015/" target="_blank">WordCamp Maine 2015</a> is a prime example of how designers are creatively adapting Twenty Fifteen:</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-maine.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-maine.png?resize=1025%2C713" alt="wordcamp-maine" class="aligncenter size-full wp-image-40475" /></a></p>\n<p><a href="http://london.wordcamp.org/2015/" target="_blank">WordCamp London 2015</a> organizers used the default theme to bring a grunge look to their site with the help of Google fonts and spray paint style backgrounds.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-london.png" rel="prettyphoto[40035]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordcamp-london.png?resize=1025%2C713" alt="wordcamp-london" class="aligncenter size-full wp-image-40477" /></a></p>\n<p>Armed with a unique background image and a little bit of color inspiration, it&#8217;s easy for anyone to make their own totally unique version of Twenty Fifteen. Thanks to the options built into the customizer, you may not even need to create a child theme.</p>\n<p>Where else have you seen <a href="https://wordpress.org/themes/twentyfifteen/" target="_blank">Twenty Fifteen</a> in the wild?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 22:44:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WPTavern: Akismet Improves User Privacy by Encrypting API Calls";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40459";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wptavern.com/akismet-improves-user-privacy-by-encrypting-api-calls";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2837:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/AkismetSSLFeaturedImage.png" rel="prettyphoto[40459]"><img class="size-full wp-image-40462" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/AkismetSSLFeaturedImage.png?resize=656%2C301" alt="Akismet SSL Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/61423903@N06/7557181168">Secure Cloud Computing</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>Akismet 3.1 <a title="https://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/" href="https://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/">is available for download</a> and contains a bug fix that prevents it from inadvertently modifying a commentâ€™s content during the spam filtering process. In addition to the bug fix, calls made to the Akismet API are now encrypted via SSL.</p>\n<p>While it may not seem like much on the surface, encrypting communications between WordPress and Akismet is an important change that increases the privacy of those who leave comments on your site. Christopher Finke, who works on the Akismet development team, explains why:</p>\n<blockquote><p>Akismet&#8217;s API is being offered over SSL for the same reason that all <a href="http://wordpress.com">wordpress.com</a> subdomains are <a title="https://en.blog.wordpress.com/2014/06/05/reset-the-net/" href="https://en.blog.wordpress.com/2014/06/05/reset-the-net/">now served over SSL by default</a>. Encrypting that connection decreases the chances of surveillance by a third-party. No matter what a commenter is writing about, sending their comment to be checked using SSL ensures that it will only be read by those who are meant to read it.</p></blockquote>\n<p>The move is part of a larger effort to apply SSL across WordPress.com and WordPress.org. In late 2014, almost all of WordPress.org <a title="https://make.wordpress.org/meta/2014/09/23/wordpress-org-is-now-forced-ssl/" href="https://make.wordpress.org/meta/2014/09/23/wordpress-org-is-now-forced-ssl/">was transitioned</a> to load over SSL/HTTPS. As part of the security hardening process of WordPress 3.7, <a title="http://codex.wordpress.org/WordPress.org_API" href="http://codex.wordpress.org/WordPress.org_API">api.wordpress.org,</a> which handles theme, plugin, and core updates, was forced to use SSL if the webserver supports it.</p>\n<p>If you&#8217;re not sure what SSL is or would like to learn how to implement it on your site, read the <a title="https://make.wordpress.org/support/user-manual/web-publishing/https-for-wordpress/" href="https://make.wordpress.org/support/user-manual/web-publishing/https-for-wordpress/">HTTPS section in the WordPress user manual</a>. It has an introduction to the protocol and provides tips on implementing, tweaking, and applying good practices</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 21:12:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:117:"WPTavern: Blind SQL Injection Vulnerability Discovered in WordPress SEO Plugin by Yoast: Immediate Update Recommended";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40433";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:126:"http://wptavern.com/blind-sql-injection-vulnerability-discovered-in-wordpress-seo-plugin-by-yoast-immediate-update-recommended";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4095:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/yoast.jpg" rel="prettyphoto[40433]"><img class="aligncenter size-full wp-image-40456" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/yoast.jpg?resize=1025%2C457" alt="yoast" /></a></p>\n<p>A blind SQL injection vulnerability was discovered today in the popular <a href="https://wordpress.org/plugins/wordpress-seo/" target="_blank">WordPress SEO plugin by Yoast</a>. WPScanVulnerability Database <a href="https://wpvulndb.com/vulnerabilities/7841" target="_blank">issued an advisory</a> after responsibly disclosing the vulnerability to the plugin&#8217;s author:</p>\n<blockquote><p>The latest version at the time of writing (1.7.3.3) has been found to be affected by two authenticated (admin, editor or author user) Blind SQL Injection vulnerabilities.</p>\n<p>The authenticated Blind SQL Injection vulnerability can be found within the &#8216;admin/class-bulk-editor-list-table.php&#8217; file. The orderby and order GET parameters are not sufficiently sanitized before being used within a SQL query.</p></blockquote>\n<p>Yoast was quick to respond with a patch and released version 1.7.4 with the following security fix:</p>\n<blockquote><p>Fixed possible CSRF and blind SQL injection vulnerabilities in bulk editor. Added strict sanitation to order_by and order params. Added extra nonce checks on requests sending additional parameters. Minimal capability needed to access the bulk editor is now Editor. Thanks <a href="https://github.com/ethicalhack3r" target="_blank">Ryan Dewhurst</a> from WPScan for discovering and responsibly disclosing this issue.</p></blockquote>\n<h3>Immediate Update Advised</h3>\n<p>Users running the most recent version are advised to update immediately. If you&#8217;re using Jetpack on all your sites, you can quickly update them by visiting: <a href="https://wordpress.com/plugins/wordpress-seo" target="_blank">https://wordpress.com/plugins/wordpress-seo</a>. There you will see all the sites where you have the plugin installed and can update from your centralized dashboard.</p>\n<p>Hosting companies are scrambling to add a fix to protect customers. The Pressable status blog sent out an <a href="http://status.pressable.com/2015/03/11/wordpress-seo-vulnerability/" target="_blank">advisory</a> on the vulnerability and is immediately updating installations where the plugin is active:</p>\n<blockquote><p>Our systems have already begun updating this plugin across all impacted sites on our systems, and we expect this process to be completed shortly.</p></blockquote>\n<p>SiteGround has added a <a href="https://www.siteground.com/blog/wordpress-seo-by-yoast-vulnerability/" target="_blank">temporary fix</a> to tide customers over in the meantime before they have the chance to update. The company added new security rules to its WAF (web application firewall), which will actively filter any possible incoming hacking attempts that try to exploit the vulnerability.</p>\n<blockquote class="twitter-tweet" width="550"><p>Our security team has just added a fix to protect customers from a vulnerability in <a href="https://twitter.com/hashtag/WP?src=hash">#WP</a> SEO plugin by Yoast <a href="https://t.co/nP9qrJaO0x">https://t.co/nP9qrJaO0x</a></p>\n<p>&mdash; SiteGround (@SiteGround) <a href="https://twitter.com/SiteGround/status/575701133550878720">March 11, 2015</a></p></blockquote>\n<p></p>\n<p><a href="https://wordpress.org/plugins/wordpress-seo/" target="_blank">WordPress SEO by Yoast</a> is active on more than one million websites. While many hosts are being proactive about getting plugin updates to customers, most of the plugin&#8217;s users will not be able to rely on their host to take care of the update. Keeping your site safe from the vulnerability is as easy as logging in and updating to the latest version.</p>\n<p><em><strong>Update</strong></em> Joost de Valk <a title="https://yoast.com/wordpress-seo-security-release/" href="https://yoast.com/wordpress-seo-security-release/">published an update</a> discussing the vulnerabilities and what is fixed.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 18:13:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Akismet: Akismet 3.1 Plugin for WordPress Released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1794";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://blog.akismet.com/2015/03/11/akismet-3-1-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1197:"<p>Version 3.1 of <a href="http://wordpress.org/plugins/akismet/">the Akismet plugin for WordPress</a> is now available.</p>\n<p>As of version 3.1, all calls to the Akismet API are now made using SSL, increasing the confidentiality of your commenters&#8217; data as it travels over the wire.  Developers of other Akismet libraries are now free to use <code>https</code> URLs for Akismet API endpoints as well.</p>\n<p>This update also includes a bugfix that prevents Akismet from inadvertently modifying a comment&#8217;s content during the spam filtering process.</p>\n<p>To upgrade, visit the Updates page of your WordPress dashboard and follow the instructions. If you need to download the plugin zip file directly, links to all versions are available in <a href="http://wordpress.org/plugins/akismet/">the WordPress plugins directory</a>.</p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1794/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1794/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1794&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 17:00:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Christopher Finke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: Lessons from Jetpack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44701";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://ma.tt/2015/03/lessons-from-jetpack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:375:"<blockquote><p>Personally I can say that it was the Jetpack features that helped provide the defaults that got me hooked on WordPress. If it werenâ€™t for that, I wouldnâ€™t be where I am today.</p></blockquote>\n<p>Josh Pollock at Torque writes about <a href="http://torquemag.io/lessons-can-learn-jetpack-helped-wordpress-succeed/">Lessons we can learn from Jetpack</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 03:01:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: Mentionable Plugin Adds @mentions for WordPress Content with Inline Autocomplete";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39424";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:99:"http://wptavern.com/mentionable-plugin-adds-mentions-for-wordpress-content-with-inline-autocomplete";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3037:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/01/links.jpg" rel="prettyphoto[39424]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/01/links.jpg?resize=1024%2C508" alt="photo credit: gordon2208 - cc" class="size-full wp-image-36986" /></a>photo credit: <a href="https://www.flickr.com/photos/gordon2208/4987669000/">gordon2208</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-nd/2.0/">cc</a>\n<p>Finding and linking to previously published content on your site is a daily necessity for bloggers and content managers. Usually, you have to search the frontend of your site or search posts/pages in the admin to track down the content you&#8217;re trying to link.</p>\n<p><a href="https://wordpress.org/plugins/mentionable/" target="_blank">Mentionable</a> is a handy tool, created by the folks at <a href="https://xwp.co/" target="_blank">XWP</a>, that saves a lot of time on internal linking. The plugin adds @mentions to the visual editor with autocomplete for any content published on the site, including posts, pages, media, and custom post types.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/mentionable.png" rel="prettyphoto[39424]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/mentionable.png?resize=843%2C438" alt="mentionable" class="aligncenter size-full wp-image-40405" /></a></p>\n<p>Mentionable includes a settings panel for specifying the post types for which the plugin will be active. You can also select the post types that the auto-completion will match against. Users can further customize the plugin by replacing the mentionable tag with a custom <em>mentionable.php</em> template.</p>\n<p>The support for custom post types means that users can call out recipes, books, movies, products, or posts from any registered content type as links within pages or posts. This makes it easy to link to the backstory for new content, put together quick reference lists, cross promote products, etc. &#8211; all without ever having to leave the post editor.</p>\n<p>I tested the plugin and found that it works as advertised. When mentioning a post you don&#8217;t even have to start with the first word of the post title. The autocomplete will pick up any word found in a title, in case your memory of the exact title is foggy.</p>\n<p>If you decide later on that you don&#8217;t want to use the plugin anymore, it won&#8217;t affect any of the links you created previously. Your content remains intact even after the plugin is deactivated and uninstalled.</p>\n<p>A healthy amount of internal linking is often recommended for boosting your site&#8217;s SEO. According to Moz, <a href="http://moz.com/learn/seo/internal-link" target="_blank">internal links</a> are critical for establishing site architecture and spreading link juice. If you&#8217;re not in the habit of linking to your own content, the <a href="https://wordpress.org/plugins/mentionable/" target="_blank">Mentionable</a> plugin will help you do it with minimal effort.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Mar 2015 01:17:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"WPTavern: Delicious Brains Publishes In-depth Guides on The WordPress Database";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40388";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://wptavern.com/delicious-brains-publishes-in-depth-guides-on-the-wordpress-database";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1896:"<p><a title="https://deliciousbrains.com/" href="https://deliciousbrains.com/">Delicious Brains</a>, the creators of <a title="https://wordpress.org/plugins/wp-migrate-db/" href="https://wordpress.org/plugins/wp-migrate-db/">WP Migrate DB</a>, <a title="https://deliciousbrains.com/tour-wordpress-database/" href="https://deliciousbrains.com/tour-wordpress-database/">published a guide</a> that walks developers through the WordPress database. The guide describes every database table and there associated columns within WordPress single site. It also features an <a title="http://codex.wordpress.org/Database_Description#Database_Diagram" href="http://codex.wordpress.org/Database_Description#Database_Diagram">entity relationship diagram</a> that explains the relationships between the various tables. Although the image was created for WordPress 3.8, it&#8217;s still accurate.</p>\n<p>For those who want to learn the database structure of WordPress Multisite, check out their <a title="https://deliciousbrains.com/wordpress-multisite-database-tour/" href="https://deliciousbrains.com/wordpress-multisite-database-tour/">Multisite database tour</a> as there are some key database changes to take note of:</p>\n<blockquote><p>When a WordPress site is <a href="http://codex.wordpress.org/Create_A_Network">converted to a Multisite install</a>, a â€œnetworkâ€ of subsites is created. The existing site is converted to the first subsite inÂ theÂ network. The database classes the network itself as a site (wp_site), and each subsite as a blog (wp_blogs).</p>\n<p>Certain tables are used only by a subsite, and a new set of tables are created every time a site is added to the network. Each set of tables is differentiated by the blog_id for the subsite used in the table prefix. e.g. `wp_2_posts`.</p></blockquote>\n<p>I encourage you to bookmark both guides as they&#8217;re excellent resources.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 21:58:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:116:"WPTavern: CodeGuard Survey Shows More Education is Needed on Backup Software, Services, and Strategies For WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40341";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:124:"http://wptavern.com/codeguard-survey-shows-more-education-is-needed-on-backup-software-services-and-strategies-for-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4426:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardSurveyResultsFeaturedImage.png" rel="prettyphoto[40341]"><img class="aligncenter size-large wp-image-40382" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardSurveyResultsFeaturedImage.png?resize=500%2C187" alt="CodeGuard Survey Results Featured Image" /></a></p>\n<p><a title="https://www.codeguard.com/" href="https://www.codeguard.com/">CodeGuard</a>, a service that specializes in automated backups to the cloud, has published the results of its 2015 WordPress survey. The survey took place between February 18th-20th and was answered by 503 WordPress users. Backing up is an important part of maintaining a website, so it&#8217;s a bit shocking to see such high percentages of people who either don&#8217;t backup on a regular basis or who don&#8217;t think backup plans are important.</p>\n<p>Out of 503 respondents:</p>\n<ul>\n<li>25% have received &#8220;very little training&#8221; in the use of WordPress</li>\n<li>22% haven&#8217;t been trained at all in WordPress backup and have &#8220;no idea&#8221; how to do it</li>\n<li>21% have seen the &#8220;white screen of death&#8221; multiple times, and &#8220;it&#8217;s horrible!&#8221;</li>\n<li>69% have had a plugin fail after an update, and 24% have had it happen &#8220;many times&#8221;</li>\n<li>63% have deleted files that were not backed up</li>\n<li>22% said that a backup plugin seems &#8220;unimportant&#8221; to them</li>\n<li>24% said &#8220;This site is my livelihood, I&#8217;d pay almost anything for a complete restore,&#8221; while 19% said they&#8217;d be willing to spend several thousand dollars, at least</li>\n</ul>\n<p>I&#8217;m surprised to see only 24% of respondents use a backup plugin at all considering there&#8217;s so many <a title="https://wordpress.org/plugins/search.php?q=backup" href="https://wordpress.org/plugins/search.php?q=backup">free options available</a>. There appears to be a correlation between those who have little to no WordPress training and the lack of education on how to establish a backup plan. I realize 503 WordPress users is not a large sample size, but the numbers indicate more education is needed on backup software, services, and strategies.</p>\n<p>It&#8217;s also alarming to see 69% of respondents have had a plugin fail after an update and 24% of those have had it happen several times. This is further proof that WordPress is <a title="http://wptavern.com/its-time-for-wordpress-to-automatically-update-themes-plugins-and-core-by-default" href="http://wptavern.com/its-time-for-wordpress-to-automatically-update-themes-plugins-and-core-by-default">not ready to automatically update plugins</a> by default.</p>\n<p>An important data point missing from the survey is how many of the respondents rely on automatic backups provided by their webhost. Not every user needs a plugin to manage backups and for a number of managed WordPress hosting companies, automatic backups are part of the package. In fact, most managed WordPress hosting providers discourage and disallow backup plugins from being used. An <a title="http://wpengine.com/support/disallowed-plugins/" href="http://wpengine.com/support/disallowed-plugins/">example is WP Engine</a>:</p>\n<blockquote><p>In general, however, we discourage the use of backup plugins. They needlessly duplicate our built-in functionality, rely on a large amount of local storage and can store files in an insecure manner. Not only that, many of these plugins run their backup jobs at inopportune times. This can slow database connectivity with extra â€” and sometimes very large â€” MySQL queries and cause timeouts on larger sites.</p></blockquote>\n<p>This infographic provided by CodeGuard visually shows the survey&#8217;s results. When browsing, I suggest replacing <em>WordPress users</em> with <em>respondents</em> as WordPress users sounds too broad. After reviewing the data, let me know if the results surprise you or if it corresponds to what you&#8217;re experiencing with clients.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardInfographic.png" rel="prettyphoto[40341]"><img class="wp-image-40371 size-full" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/CodeGuardInfographic.png?resize=1025%2C4879" alt="CodeGuard Infographic Showing Survey Results" /></a>CodeGuard Infographic Showing Survey Results\n<p>&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 19:49:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: WordPress Antispam Bee Plugin Adds Option to Trust Commenters with a Gravatar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40344";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wordpress-antispam-bee-plugin-adds-option-to-trust-commenters-with-a-gravatar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4082:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/bee.jpg" rel="prettyphoto[40344]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/bee.jpg?resize=1025%2C467" alt="photo credit: Osmia pumila, M, Face, MD_2013-06-25.18.39.16 ZS PMax - (license)" class="size-full wp-image-40353" /></a>photo credit: <a href="http://www.flickr.com/photos/54563451@N08/9302552275">Osmia pumila, M, Face, MD_2013-06-25.18.39.16 ZS PMax</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>Version 2.6.5 of the popular <a href="https://wordpress.org/plugins/antispam-bee/" target="_blank">Antispam Bee</a> plugin is out today with a new feature that allows administrators to trust commenters with a <a href="https://en.gravatar.com/" target="_blank">Gravatar</a>. The idea for the function was suggested by Caspar HÃ¼binger, a long-time user of the plugin.</p>\n<p>&#8220;Have you ever seen a spam comment with a Gravatar image?  I havenâ€™t,&#8221; HÃ¼binger said in a <a href="http://glueckpress.com/6500/trust-the-gravatar/" target="_blank">post</a> introducing the new feature. &#8220;So I suggested to include an option in Antispam Bee to trust commenters with a Gravatar by default, and Sergej, creator of Antispam Bee, was kind enough to implement it.&#8221;</p>\n<p>Although the plugin was mentioned by Matt Mullenweg during his Q&amp;A at WordCamp Europe 2014, English speakers have largely overlooked it in the past. Antispam Bee was created by German WordPress plugin developer <a href="http://wpcoder.de/" target="_blank">Sergej MÃ¼ller</a> and its description page on WordPress.org is written in German. He has actively developed and maintained the plugin since 2009. It is currently used on 200,000+ installations of WordPress.</p>\n<p>One might think that it would make sense to include an English copy of the description to gain a larger user base, but MÃ¼ller elected to keep it in German due to the plugin&#8217;s incompatibilities. Antispam Bee is incompatible with many of the major commenting systems used by English speakers, including Disqus, Jetpack Comments, and AJAX Comment Form.</p>\n<p>English speakers who use <a href="http://jetpack.me/support/comments/" target="_blank">Jetpack Comments</a> often use <a href="http://akismet.com/" target="_blank">Akismet</a>, since the two work together seamlessly. Akismet is far more well-known, since it comes packaged with WordPress by default. However, Antispam Bee has a solid set of features that make it a decent alternative:</p>\n<ul>\n<li>Ad-free</li>\n<li>No storage of personal data</li>\n<li>No registration required</li>\n<li>Free for commercial projects</li>\n<li>No adjustment required by theme templates</li>\n<li>All functions can be controlled by the user</li>\n<li>Statistics for the last 30 days displayed as a dashboard widget</li>\n<li>Supports six languages: German, English, French, Russian, Dutch, and Slovenian</li>\n</ul>\n<p>The plugin also comes with 20 configurable options for customizing its spam-blocking features, including the ability to disable spam email notifications, block comments from certain countries, allow comments only in certain languages, delete after X days, and much more. These options allow you to tailor your anti-spam shield to lessen your moderation load.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/antispam-bee.jpg" rel="prettyphoto[40344]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/antispam-bee.jpg?resize=1025%2C714" alt="antispam-bee" class="aligncenter size-full wp-image-40377" /></a></p>\n<p>If you&#8217;re intrigued by <a href="https://wordpress.org/plugins/antispam-bee/" target="_blank">Antispam Bee</a>&#8216;s latest feature that allows you to trust commenters who have a Gravatar, give the plugin a try the next time you&#8217;re reviewing spam-blocking solutions. The option is a creative use of WordPress&#8217; built-in support for Gravatar. Current users of the plugin can find the new setting in the admin under <strong>Settings > Antispam Bee</strong>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Mar 2015 19:06:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: WPupdatePHP Project Aims to Help WordPress Users Get on Newer Versions of PHP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40303";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wpupdatephp-project-aims-to-help-wordpress-users-get-on-newer-versions-of-php";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4470:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/php.jpg" rel="prettyphoto[40303]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/php.jpg?resize=700%2C329" alt="photo credit: Feediza.com" class="size-full wp-image-40331" /></a>photo credit: <a href="http://feediza.com/">Feediza.com</a>\n<p>Developers are anxious for WordPress to bump up the minimum PHP requirement for core, as it&#8217;s currently lingering at 5.2, which is no longer among the <a href="http://php.net/supported-versions.php" target="_blank">supported versions of PHP</a>. As of August 2014, PHP 5.3 no longer receives patches for security vulnerabilities.</p>\n<p><a href="http://wptavern.com/wordpress-version-stats-updated-more-than-13-of-sites-are-running-wordpress-4-1" target="_blank">Recent updates to WordPress.org stats</a> indicate that 16.4% of WordPress sites are still running on PHP 5.2 and 38% on PHP 5.3. According to lead developer Andrew Nacin, bumping the minimum required version is not likely to happen soon, due to the sheer number of sites that would be negatively impacted.</p>\n<p>&#8220;One-sixth of all sites running PHP 5.2 is still many millions of sites,&#8221; he said. &#8220;If we move the PHP minimum version too early, we risk stranding millions of installs on older versions of WordPress.&#8221; In the meantime, the WordPress project is researching the current state of PHP offerings available at popular hosts and will soon be urging them to update to more recent versions.</p>\n<p>WordPress developer <a href="http://coenjacobs.me/" target="_blank">Coen Jacobs</a> believes that the effort to contact hosts will not be enough to help everyone. His new <a href="http://www.wpupdatephp.com/" target="_blank">WPupdatePHP</a> project was created to educate end users on outdated versions of PHP. The <a href="https://github.com/WPupdatePHP/wp-update-php" target="_blank">WPupdatePHP library</a> is a tool that developers can bundle into their plugins in order to require users to upgrade to PHP 5.4+ hosting. It is intended for use within new plugins, not for locking users out of existing ones.</p>\n<p>If a user does not meet the minimum PHP version requirements when installing the plugin, he will be presented with an admin notice:</p>\n<blockquote><p>Unfortunately, this plugin can not run on PHP versions older than [ specified version ]. Read more information about <a href="http://www.wpupdatephp.com/update/">how you can update</a>.</p></blockquote>\n<p>The idea of the WPupdatePHP project is to enlist end users in putting pressure on hosts to <a href="http://www.wpupdatephp.com/update/" target="_blank">update their versions of PHP</a>. A future version of the library would add the ability for developers to make the PHP version a â€œsoft requirement,â€ which would still display the notice but wonâ€™t stop the user from using the plugin.</p>\n<p>&#8220;The core WordPress team canâ€™t get every single hosting company to comply,&#8221; Jacobs said in a recent post titled <em><a href="http://coenjacobs.me/updating-php-everyones-responsibility/" target="_blank">Updating PHP is Everyoneâ€™s Responsibility</a></em>. &#8220;I admire their intentions, but in reality this is not going to help everybody.&#8221;</p>\n<p>He predicts a need for the WPupdatePHP library even after WordPress bumps its minimum required PHP version. &#8220;PHP 5.4 is actually already nearing its EOL date and weâ€™re still figuring out how to make PHP 5.2 and 5.3 platforms go away,&#8221; he said. In mid-September 2015, PHP 5.4 will not longer receive security fixes.</p>\n<p>Jacobs believes that the changes that need to happen require more than a one-time campaign where the WordPress project successfully badgers hosts to update to PHP 5.4.</p>\n<p>&#8220;In six months weâ€™ll have this same issue all over again,&#8221; he said. &#8220;As soon as webhosting companies have finally finished off their PHP 5.2 and 5.3 environments, we can start this whole campaign all over again to get rid of PHP 5.4. And so on.&#8221;</p>\n<p>If you are a WordPress developer interested in enlisting your plugin&#8217;s users to help push hosts to update PHP versions, check out <a href="https://github.com/WPupdatePHP/wp-update-php" target="_blank">WPupdatePHP on GitHub</a>.</p>\n<p>&#8220;The end user is one of our most important, but underestimated, assets in this battle,&#8221; Jacobs said. &#8220;They have the strongest voice in this all.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 22:24:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: WordPress.com Adds oEmbed Support For CartoDB Maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40265";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/wordpress-com-adds-oembed-support-for-cartodb-maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1371:"<p>WordPress.com <a title="https://en.support.wordpress.com/cartodb-embeds/" href="https://en.support.wordpress.com/cartodb-embeds/">now supports oEmbeds</a> for<a title="http://cartodb.com/" href="http://cartodb.com/"> CartoDB,</a> a tool used to create and share interactive maps. Simply copy and paste a CartoDB map URL into the WordPress.com post editor and a live preview will display. Here&#8217;s an example of a map using the standard HTML embed code.</p>\n<p></p>\n<p>According to an announcement on the <a title="http://blog.cartodb.com/wordpress/" href="http://blog.cartodb.com/wordpress/">official CartoDB blog</a>, embed support has also been added to Jetpack. However, I discovered after testing that it&#8217;s not yet supported. I reached out to Jetpack&#8217;s development team to find out when it will be added, but they&#8217;re <a title="https://wordpress.org/support/topic/jetpack-staff-will-be-unavailable-until-march-16th" href="https://wordpress.org/support/topic/jetpack-staff-will-be-unavailable-until-march-16th">not available</a> until March 16th.</p>\n<p>With more than 60 million users, CartoDB has an incredible opportunity to expand its reach by being accessible on a platform where over <a title="https://wordpress.com/activity/" href="https://wordpress.com/activity/">409 million people</a> view more than 17.6 billion pages each month.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 20:13:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:96:"WPTavern: Lovecraft: New Free WordPress Theme Combines Prominent Imagery with Strong Serif Fonts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40251";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:105:"http://wptavern.com/lovecraft-new-free-wordpress-theme-combines-prominent-imagery-with-strong-serif-fonts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3402:"<p>WordPress theme author <a href="http://www.andersnoren.se/" target="_blank">Anders NorÃ©n</a> is back to releasing themes after a brief hiatus over the winder holidays. <a href="https://wordpress.org/themes/lovecraft/" target="_blank">Lovecraft</a>, is his 10th theme to be approved on WordPress.org.</p>\n<p>The Lovecraft design was inspired by the work of <a href="http://en.wikipedia.org/wiki/H._P._Lovecraft" target="_blank">H.P. Lovecraft</a>, an American horror fiction author known for his &#8220;weird realism&#8221; &#8211; the idea that reality is fundamentally weird and the human mind is incapable of realistically representing it.</p>\n<p>NorÃ©n&#8217;s tribute to Lovecraft&#8217;s work is conveyed most clearly through the serif-heavy typography of the theme and a strong focus on the imagery assigned to each post. He selected Google Font&#8217;s <a href="http://www.google.com/fonts/specimen/Playfair+Display" target="_blank">Playfair Display</a> for page and post headers, accompanied by Georgia for the body text. The bright red links and red post meta complement the design&#8217;s literary theme.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft.png" rel="prettyphoto[40251]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft.png?resize=880%2C660" alt="lovecraft" class="aligncenter size-full wp-image-40267" /></a></p>\n<p>The homepage showcases a full-width header image and each post replaces that image with its own featured image. These images, along with the rest of the theme, gracefully scale down for smaller devices.</p>\n<p>Lovecraft, like many other recently released themes, adds additional features by offering support for <a href="http://jetpack.me/" target="_blank">Jetpack</a>, including the infinite scroll module and styles for tiled galleries.</p>\n<p>NorÃ©n took every small detail into consideration when creating Lovecraft, as you can see with the blockquotes design, ordered lists, post media, and form styles on the <a href="http://andersnoren.se/themes/lovecraft/style-guide/" target="_blank">Style Guide</a> page.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft-blockquote.jpg" rel="prettyphoto[40251]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/lovecraft-blockquote.jpg?resize=617%2C217" alt="lovecraft-blockquote" class="aligncenter size-full wp-image-40283" /></a></p>\n<p>The theme allows you to select the accent color via the customizer. It also includes support for a custom logo, editor styles, and matching widgets for Flicker, recent posts, and recent comments with thumbnails. Pages have an additional template for full-width display. Check out the <a href="http://andersnoren.se/themes/lovecraft/" target="_blank">live demo</a> to see Lovecraft in action.</p>\n<p>If you&#8217;re looking for a bold new theme for your blog and you appreciate strong serif fonts, Lovecraft is a thoughtfully-designed option. The theme is <a href="http://www.wordpress.org/themes/lovecraft" target="_blank">available for free</a> in the WordPress Theme Directory as of today. For more information on how Anders NorÃ©n finds continual inspiration for his free themes, check out our recent <a href="http://wptavern.com/a-chat-with-anders-noren-on-finding-inspiration-for-wordpress-theme-design" target="_blank">interview</a> with the designer.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 18:54:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: NNT of Medicine";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44289";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2015/03/ntt-of-medicine/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:643:"<p><a href="http://www.wired.com/2014/10/number-needed-to-treat/">This Man&#8217;s Simple System Could Transform American Medicine</a>, about a quest to quantify the effects of medicine and treatment differently, which is really needed.</p>\n<p>Update: Looks like it&#8217;s built on WordPress, too:</p>\n<blockquote class="twitter-tweet" width="550"><p>.<a href="https://twitter.com/photomatt">@photomatt</a> Thanks for the link! I built the site with Dave Newman (powered by WordPress)!</p>\n<p>&mdash; Graham Walker (@grahamwalker) <a href="https://twitter.com/grahamwalker/status/575069240140656641">March 9, 2015</a></p></blockquote>\n<p></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 18:47:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WPTavern: bbPress 2.5.5 Released, Patches Three Potential Security Vulnerabilities";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40253";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/bbpress-2-5-5-released-patches-three-potential-security-vulnerabilities";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:907:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/bbpress.png" rel="prettyphoto[40253]"><img class="aligncenter size-full wp-image-24338" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/bbpress.png?resize=1025%2C378" alt="bbpress" /></a></p>\n<p>bbPress 2.5.5 is <a title="https://bbpress.org/blog/2015/03/bbpress-2-5-5-security-release/" href="https://bbpress.org/blog/2015/03/bbpress-2-5-5-security-release/">available for download</a>. This release fixes three potential security vulnerabilities reported by <a title="https://profiles.wordpress.org/jdgrimes" href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a> and was pushed out within nearly 24 hours of being notified. Users should update as soon as possible as all previous 2.x versions are vulnerable. The patches have also been applied to the 2.6 development branch that will soon have a beta release.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2015 17:24:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Matt: 25k DMCA Win";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44791";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:34:"http://ma.tt/2015/03/25k-dmca-win/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:566:"<blockquote><p>WordPress [actually Automattic] has scored an important victory in court against a man who abused the DMCA to censor an article of a critical journalist. The court agreed that the takedown request was illegitimate and awarded WordPress roughly $25,000 in damages and attorneys fees.</p></blockquote>\n<p>Yes! Good laws become bad when people abuse them. Here&#8217;s the source: <a href="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/">WordPress Wins $25,000 From DMCA Takedown Abuser</a>Â (s/WordPress/Automattic/).</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 08 Mar 2015 17:55:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:36:"Matt: Psychology of a Small Playlist";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44757";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://ma.tt/2015/03/psychology-of-a-small-playlist/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:240:"<p>Joseph Mosby experiments with my trick of listening to a song on repeat to get work done, <a href="http://josephmosby.com/2015/02/15/the-psychology-of-a-small-playlist-on-repeat.html">and digs a bit into the psychology behind it</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 08 Mar 2015 07:10:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WPTavern: Automattic and Oliver Hotham Win Court Battle Against DMCA Takedown Abuser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40222";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/automattic-and-oliver-hotham-win-court-battle-against-dmca-takedown-abuser";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3721:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/AutomatticCourtFeaturedImage.png" rel="prettyphoto[40222]"><img class="size-full wp-image-40224" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/AutomatticCourtFeaturedImage.png?resize=642%2C299" alt="Automattic Court Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/46274125@N00/1558886731">Former Supreme Court, Singapore</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>In August of 2013, <a title="http://www.theguardian.com/technology/2013/aug/13/wordpress-straight-pride-uk" href="http://www.theguardian.com/technology/2013/aug/13/wordpress-straight-pride-uk">Automattic was criticized</a> for its role in taking down <a title="https://oliverhotham.wordpress.com/2013/08/11/the-sordid-tale-of-how-i-was-censored-by-straight-pride-uk/" href="https://oliverhotham.wordpress.com/2013/08/11/the-sordid-tale-of-how-i-was-censored-by-straight-pride-uk/">Oliver Hotham&#8217;s website</a> after the Straight Pride UK group filed a DMCA takedown notice with WordPress.com. In the Guardian article, WordPress.com admitted that the takedown notice was an abuse of the law. In November of 2013, <a title="http://en.blog.wordpress.com/2013/11/21/striking-back-against-censorship/" href="http://en.blog.wordpress.com/2013/11/21/striking-back-against-censorship/">Automattic announced</a> that it teamed up with Hotham in <a title="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-hotham-complaint.pdf" href="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-hotham-complaint.pdf">two</a> separate <a title="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-retraction-watch-complaint.pdf" href="http://en.blog.files.wordpress.com/2013/11/2013-11-21-final-retraction-watch-complaint.pdf">lawsuits</a>.</p>\n<p>The lawsuits were filed in federal court under Section 512(f) of the DMCA. Section 512(f) is the provision that allows users to hold people accountable when they make false infringement accusations.</p>\n<p>Torrentfreak reports that <a title="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/" href="http://torrentfreak.com/wordpress-wins-25000-from-dmca-takedown-abuser-150305/">Automattic has won the case</a> with a $25K settlement. According to court documents,Â United States Magistrate JudgeÂ Joseph Spero <a title="http://ia601008.us.archive.org/20/items/gov.uscourts.cand.272130/gov.uscourts.cand.272130.31.0.pdf" href="http://ia601008.us.archive.org/20/items/gov.uscourts.cand.272130/gov.uscourts.cand.272130.31.0.pdf">wrote a report</a> and recommendation in favor of Automattic and Hotham. The <a title="http://torrentfreak.com/images/wp-steiner.pdf" href="http://torrentfreak.com/images/wp-steiner.pdf">courts agreed with his report</a> and recommendation. Since the defendant chose to default, the courts saw no reason to require further expenditure of resources and awarded the victory to Automattic.</p>\n<p>The settlement is split between three parties: Automattic&#8217;s employee time, attorneys, and Hotham.</p>\n<blockquote><p>It is Ordered and Adjudged that defendant Nick Steiner pay damages in the amount of $960.00 for Hothamâ€™s work and time, $1,860.00 for time spent by Automatticâ€™s employees, and $22,264.00 for Automatticâ€™s attorneyâ€™s fees, for a total award of $25,084.00.</p></blockquote>\n<p>There are two things I take away from the victory. First, it sets a precedent that Automattic can and will fight against those who abuse the <a title="http://automattic.com/dmca-notice/" href="http://automattic.com/dmca-notice/">DMCA takedown procedure</a>. Second, attorneys are expensive.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 07 Mar 2015 04:44:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Standalone Cameras";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44780";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/03/standalone-cameras/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:172:"<p>Om Malik on the decline of cameras as gadgets, <a href="http://om.co/2015/03/06/standalone-camera-shot-dead-by-iphone/">Standalone camera: Shot (Dead) By iPhone</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 07 Mar 2015 02:08:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"WPTavern: New Plugin Adds Openname Avatars to WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39992";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wptavern.com/new-plugin-adds-openname-avatars-to-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4497:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname.jpg?resize=720%2C299" alt="openname" class="aligncenter size-full wp-image-40208" /></a></p>\n<p>In November 2014, Onename <a href="http://blog.onename.io/decentralized-auth-identity-open-source/" target="_blank">announced</a> that it would be extending its Openname protocol to support decentralized authentication. The company also <a href="https://github.com/openname" target="_blank">open sourced the protocol and directory software</a> so that developers can build their own infrastructure with it.</p>\n<blockquote><p>We believe the future of identity will be decentralized, and for any identity system to be truly decentralized, no entity can have a monopoly over registering users or displaying their profiles. Anyone should be able to claim a username and fill out their profiles either using a provider/registrar of their choice or on their own without any third party.</p></blockquote>\n<p>The <a href="https://openname.org/" target="_blank">Openname</a> decentralized identity and naming system is built on the Blockchain. It makes it possible for anyone to create an online identity, which can then be used to make Bitcoin transactions. The company&#8217;s long-term goal is to pioneer a decentralized authentication protocol:</p>\n<blockquote><p>What we need is a password-less authentication process that doesn&#8217;t require any particular third party; an open, decentralized auth protocol that lets users conveniently sign in and be in control of the data they release to apps and where they store it.</p>\n<p>Openname Auth is our work-in-progress proposal for decentralized, password-less authentication in which users login by simply entering a username (their openname) and approving an auth request on their desktop or mobile device.</p></blockquote>\n<p>OneName <a href="http://venturebeat.com/2014/11/14/y-combinator-backed-onename-raises-1-5m-open-sources-its-bitcoin-identity-directory/" target="_blank">raised $1.5 million in funding</a> to continue developing the platform as part of its quest to <a href="http://blog.onename.io/evolution-of-the-internet/" target="_blank">return the web to its decentralized roots</a>.</p>\n<h3>Openname Avatars for WordPress</h3>\n<p>WordPress core supports <a href="https://en.gravatar.com/" target="_blank">Gravatar</a> by default for providing blog and comment author avatars. Thanks to the new <a href="https://wordpress.org/plugins/openname/" target="_blank">Opennname plugin for WordPress</a>, site administrators can now offer users the option to associate a Openname avatars with an account on self-hosted sites.</p>\n<p>In order to test the plugin, you&#8217;ll need to first sign up for an <a href="https://openname.org/" target="_blank">Openname</a> account (which requires an account at Onename or Namecoin).</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-profile.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-profile.jpg?resize=1025%2C307" alt="openname-profile" class="aligncenter size-full wp-image-40190" /></a></p>\n<p>After you install the Openname plugin on your WordPress site, any registered user will be able to elect to use his Openname avatar by visiting /wp-admin/profile.php. Once you add your Openname, the plugin will keep your WordPress avatar in sync (with a short delay) with your Openname Avatar.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-settings.jpg" rel="prettyphoto[39992]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/openname-settings.jpg?resize=720%2C264" alt="openname-settings" class="aligncenter size-full wp-image-40191" /></a></p>\n<p>The Openname plugin was created by <a href="https://www.larrysalibra.com/" target="_blank">Larry Salibra</a>, founder and CEO of <a href="https://www.pay4bugs.com/" target="_blank">Pay4Bugs</a>. I tested it and found it to work as advertised.</p>\n<p>In the future, once the Openname Auth is more developed, it would be awesome if Salibra added this to his WordPress plugin. Onename might do well to create its own official plugin for this. Given that WordPress currently powers 23% of the world&#8217;s websites, an official Openname authentication plugin might bring wider adoption for its decentralized identity system.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 23:30:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"WPTavern: WordPress Publishes Security White Paper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40096";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wptavern.com/wordpress-publishes-security-white-paper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3694:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/security.jpg" rel="prettyphoto[40096]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/03/security.jpg?resize=1024%2C514" alt="photo credit: Lock - (license)" class="size-full wp-image-40187" /></a>photo credit: <a href="http://www.flickr.com/photos/58441544@N00/2660230441">Lock</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>As WordPress currently powers 23% of the web, the platform&#8217;s security is constantly under scrutiny. WordPress has long been a favorite target of hackers and spammers who want to get the most return on their efforts. Since the the platform powers millions of websites, a critical vulnerability with a popular plugin or WordPress core can affect a large chunk of the web in a short amount of time.</p>\n<p>WordPress published a <a href="https://wordpress.org/about/security/" target="_blank">security white paper</a> this week to help the public learn more about the core software security. Many consultants have had the experience of clients who are considering WordPress but are wondering if it&#8217;s secure. This document was created both for decision makers who are evaluating WordPress and developers who are building on top of the software.</p>\n<p>The document is available as a <a href="https://github.com/WordPress/Security-White-Paper/blob/master/WordPressSecurityWhitePaper.pdf?raw=true" target="_blank">PDF</a>, and here&#8217;s what you&#8217;ll find inside:</p>\n<blockquote><p>This document is an analysis and explanation of the WordPress core software development and its related security processes, as well as an examination of the inherent security built directly into the software.</p></blockquote>\n<p>The white paper gives an introduction to the core leadership team, the WordPress Security Team, how a release cycle works, and responsible disclosure of vulnerabilities. The second half of the document covers common security vulnerabilities and how WordPress protects itself against those potential risks.</p>\n<p>Just like WordPress itself, the security white paper is open to contribution. Anyone can submit a pull request on the <a href="https://github.com/WordPress/Security-White-Paper" target="_blank">WordPress repository</a>.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-security-whitepaper.png" rel="prettyphoto[40096]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-security-whitepaper.png?resize=1025%2C753" alt="wordpress-security-whitepaper" class="aligncenter size-full wp-image-40178" /></a></p>\n<p>The security white paper is in need of translations in order to be more accessible to WordPress&#8217; global audience. If you can assist with a particular translation, the repository has simple instructions for how to submit it on GitHub.</p>\n<blockquote><p>To translate the white paper, please create a sub-directory of the project, giving it the correct ISO639 code (for example, pt for Portuguese), and submit a pull request.</p></blockquote>\n<p>WordPress consultants will find this white paper to be an excellent resource to refer to during sales negotiations. If you&#8217;re a developer just getting started learning about WordPress&#8217; inherent security, the document is provides a solid overview.</p>\n<p>Hackers who are looking to receive bounty for finding security vulnerabilities can find <a href="https://hackerone.com/automattic" target="_blank">Automattic on HackerOne</a>. The company regularly rewards hackers with bounty for security bugs discovered with WordPress.com, which is powered by the core WordPress software.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 20:11:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WPTavern: Version One of The WordPress History Book is Ready For Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40148";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://wptavern.com/version-one-of-the-wordpress-history-book-is-ready-for-review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4283:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressHistoryBookFeaturedImage.png" rel="prettyphoto[40148]"><img class="aligncenter size-full wp-image-40153" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressHistoryBookFeaturedImage.png?resize=657%2C231" alt="WordPress History Book Featured Image" /></a></p>\n<p>During the <a title="http://wordpress.tv/2013/07/29/matt-mullenweg-state-of-the-word-2013/" href="http://wordpress.tv/2013/07/29/matt-mullenweg-state-of-the-word-2013/">2013 State of the Word</a> presentation at WordCamp San Francisco, Matt Mullenweg announced a new project called <a title="https://github.com/WordPress/book" href="https://github.com/WordPress/book">WordPress The Book</a>. After nearly two years of writing, Siobhan McKeown <a title="https://twitter.com/SiobhanPMcKeown/status/573544639170478081" href="https://twitter.com/SiobhanPMcKeown/status/573544639170478081">has announced</a> that version one is ready for review. She also states that the book will be produced in just over a month and that now&#8217;s the time to give feedback.</p>\n<blockquote class="twitter-tweet" width="550"><p>Finished V1 of the WordPress book: <a href="https://t.co/MC59LjeyFH">https://t.co/MC59LjeyFH</a> We''ll be producing it in just over a month so if you have feedback now''s the time</p>\n<p>&mdash; Siobhan McKeown (@SiobhanPMcKeown) <a href="https://twitter.com/SiobhanPMcKeown/status/573544639170478081">March 5, 2015</a></p></blockquote>\n<p></p>\n<p>While you can download the book, I recommend browsing and reading it on Github so you don&#8217;t have to worry about opening files with the .MD extension. It&#8217;s also easier to submit pull requests to correct typos or grammatical errors. The book is <a title="https://github.com/WordPress/book/tree/master/Content" href="https://github.com/WordPress/book/tree/master/Content">divided into six parts</a> that contain a few chapters each.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressBookChapters.png" rel="prettyphoto[40148]"><img class="size-full wp-image-40152" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/WordPressBookChapters.png?resize=1025%2C432" alt="Chapters Of The WordPress History Book" /></a>Chapters Of The WordPress History Book\n<p>If you come across any errors while reading the book, you can submit corrections by creating a pull request or an issue on the tracker. Here are a few things to look out for as you read:</p>\n<ul>\n<li>Factual errors: notes about factual errors are welcome. All suggestions for changes should be evidenced with links that back up any claims. Any facts that cannot be corroborated will not be included.</li>\n<li>Clarity: any paragraphs or sections that you feel are not clear. This would be of particular help in sections that are technical in nature.</li>\n<li>Omissions: anything that you feel has been omitted or not sufficiently covered. Note that this is a lengthy piece of writing and many issues have to be condensed to ensure that it is a manageable and interesting read. Suggestions about omissions should be accompanied with information about why it should be included, and backed up with evidence as to their importance.</li>\n<li>Images: if you have any images that you feel would complement the text, we&#8217;d love to have them.</li>\n</ul>\n<p>McKeown is also looking for help writing haikus. Ideally, she&#8217;d like one for the book&#8217;s opening and one for each section. It will be published in two forms, a digital edition for the web and an e-book. McKeown also hinted at the possibility of printing physical copies, &#8220;We&#8217;re investigating different print options, so the feasibility of doing a print run or of offering print on demand.&#8221;</p>\n<p>I&#8217;ve read a few chapters of the book already and it&#8217;s like a trip down memory lane. It&#8217;s interesting to read some of the historical moments of the project&#8217;s history, especially the years of GPL debates. Whether you&#8217;re brand new to WordPress and want to learn its history or you&#8217;re a veteran who needs a refresher, this book delivers. Please help McKeown by proofreading the first version and help make it the best WordPress history book possible.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 17:00:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"Dougal Campbell: WordPress â€º About Â» Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"http://dougal.gunters.org/?p=80603";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://dougal.gunters.org/blog/2015/03/06/wordpress-about-security/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1059:"<p><i>&#8220;This document is an analysis and explanation of the WordPress core software development and its related security processes, as well as an examination of the inherent security built directly into the software. Decision makers evaluating WordPress as a content management system or web application framework should use this document in their analysis and decition-making, and for developers to refer to it to familiarize themselves with the security components and best practices of the software.&#8221;</i></p>\n<p><a href="https://wordpress.org/about/security/">WordPress â€º About Â» Security</a></p>\n<p>Original Article: <a rel="nofollow" href="http://dougal.gunters.org/blog/2015/03/06/wordpress-about-security/">WordPress â€º About Â» Security</a><br />\n<a rel="nofollow" href="http://dougal.gunters.org">Dougal Campbell&#039;s geek ramblings - WordPress, web development, and world domination.</a></p>\n<div class="yarpp-related-rss yarpp-related-none">\n<img src="http://yarpp.org/pixels/5db43ee24c4f1e1d0e45d08cc91b0130" alt="YARPP" />\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 15:36:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Dougal Campbell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WPTavern: Insight Into WordPress Communities Around The World";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40138";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wptavern.com/insight-into-wordpress-communities-around-the-world";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3508:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/KinstaWordPressCommunitiesFeaturedImage.png" rel="prettyphoto[40138]"><img class="aligncenter size-full wp-image-40141" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/KinstaWordPressCommunitiesFeaturedImage.png?resize=727%2C338" alt="KInsta WordPress Communities Featured Image" /></a></p>\n<p>One of the greatest things about WordPress is its diverse community throughout the world. <a title="https://kinsta.com/" href="https://kinsta.com/">Kinsta</a> has published a <a title="https://kinsta.com/learn/wordpress-communities-around-the-world/" href="https://kinsta.com/learn/wordpress-communities-around-the-world/">fantastic and inspirational post</a> that looks at up and coming WordPress communities in 5 continents and 17 countries.</p>\n<p>My favorite story is Juanfra Aldasoro, co-organizer of WordCamp Buenos Aires, describing how the WordPress community in Argentina was organized. In 2007, Buenos Aires hosted the first WordCamp outside the US. Despite hosting a few more WordCamps, the community lacked organization. Aldasoro explains how celebrating WordPress&#8217; 10th anniversary brought the right group of people together:</p>\n<blockquote><p>When WordPress turned 10, in May of 2013, thanks to a banner in the Codex site we created a celebration meetup. More than 20 people showed up, and the good thing was that we were a bunch of geeks on the same track. We had the people but we were lacking an organization. The ones interested in having an organized community kept in touch, we formed WordPress Argentina (<a href="https://twitter.com/wpargentina" target="_blank">@wpargentina</a>) and during 2014 we started to hold more formal monthly meetups.</p></blockquote>\n<p>One of the things I noticed is that several of the people <a title="https://kinsta.com/learn/wordpress-communities-around-the-world/" href="https://kinsta.com/learn/wordpress-communities-around-the-world/">featured in the article</a> use Facebook groups for communication. AlthoughÂ a number of US based WordPress meetups use <a title="http://www.meetup.com/" href="http://www.meetup.com/">Meetup.com</a>,Â in other countries, Facebook appears to be the dominant way to communicate and organize members.</p>\n<p>Meetups are grassroots efforts that help WordPress reach every corner of the globe. As Matt Mullenweg said during his 2014 <a title="http://wordpress.tv/2014/10/26/matt-mullenweg-the-state-of-the-word-2014/" href="http://wordpress.tv/2014/10/26/matt-mullenweg-the-state-of-the-word-2014/">State of The Word presentation</a>, &#8220;Organizing a meetup is one of the hardest things to do in terms of contributing to WordPress. Every single month, you have to come up with new stuff.&#8221; Those who help maintain community as a pillar of WordPress&#8217; success are helping to maintain its growth and popularity.</p>\n<p>It&#8217;s exciting to think about the enormous amount of WordPress education, contributions, and learning that takes place across the world everyday, thanks in large part to people like those featured in the article. It&#8217;s wonderful to see so many WordPress communities around the world growing in size to the point ofÂ  having their own WordCamps.</p>\n<p>If you&#8217;re having trouble organizing a WordPress meetup in your area, let us know in the comments. Thousands of people across the world access the Tavern on a daily basis and we might be able to help connect you to others in your area.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 05:16:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Matt: Kanye on Color";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44745";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:36:"http://ma.tt/2015/03/kanye-on-color/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:955:"<p><a href="http://ma.tt/2015/03/pink-and-blue/">Speaking of color masculinity</a>, here&#8217;s Kanye on creativity, society, and color from <a href="http://www.thefader.com/2012/11/29/kanye-west-im-amazing">his 2008 FADER interview</a>:</p>\n<blockquote><p>I feel like all the words are in you, youâ€™re just blocking yourself, youâ€™re blocking your creativity. Society has put up so many boundaries, so many limitations on whatâ€™s right and wrong that itâ€™s almost impossible to get a pure thought out. Itâ€™s like a little kid, a little boy, looking at colors, and no one told him what colors are good, before somebody tells you you shouldnâ€™t like pink because thatâ€™s for girls, or youâ€™d instantly become a gay two-year-old. Why would anyone pick blue over pink? Pink is obviously a better color. Everyoneâ€™s born confident, and everythingâ€™s taken away from you. So many people try to put their personality on someone else.</p></blockquote>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 04:19:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: WPWeekly Episode 182 â€“ John James Jacoby Talks BuddyPress, bbPress, and GlotPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=40127&preview_id=40127";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/wpweekly-episode-182-john-james-jacoby-talks-buddypress-bbpress-and-glotpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2988:"<p><a title="http://jjj.me/" href="http://jjj.me/">John James Jacoby</a> is nearly halfway through his <a title="http://wptavern.com/buddypress-bbpress-and-glotpress-development-campaign-is-now-fully-funded" href="http://wptavern.com/buddypress-bbpress-and-glotpress-development-campaign-is-now-fully-funded">six month development cycle</a> on <a title="https://buddypress.org/" href="https://buddypress.org/">BuddyPress</a>, <a title="https://bbpress.org/" href="https://bbpress.org/">bbPress</a>, and <a title="http://blog.glotpress.org/" href="http://blog.glotpress.org/">GlotPress</a>. So, <a title="http://marcuscouch.com/" href="http://marcuscouch.com/">Marcus Couch</a> and I invited him on the show to give us an update on how things are progressing. On average, WordPress Weekly is an hour-long. This episode however, is two hours and nine minutes, but is filled with deep conversations surrounding each project.</p>\n<p>In this episode, we learn the history of BuddyPress and how its connection to WordPress MU (WordPress Multisite), influenced the project&#8217;s direction. Jacoby explains what GlotPress is and why its a cornerstone of the WordPress project. We discuss the future of comments on the web and the role bbPress can play in turning things around. Last but not least, we discuss whether Jacoby&#8217;s successful crowdfunding campaign has opened the door for others who need funding to work on open source projects.</p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/buddypress-identicons/" href="https://wordpress.org/plugins/buddypress-identicons/">BuddyPress Identicons</a> automatically replaces default avatars with GitHub-style identicons. Each member&#8217;s identicon is likely to be unique, because it&#8217;s generated from a hash of their username.</p>\n<p><a title="https://wordpress.org/plugins/buddypress-cover-photo/" href="https://wordpress.org/plugins/buddypress-cover-photo/">BuddyPress Cover Photo</a> allows users to upload a cover photo to their profile.</p>\n<p><a title="https://wordpress.org/plugins/friends-for-bbpress/" href="https://wordpress.org/plugins/friends-for-bbpress/">Friends For bbPress</a> allows users to add friends in bbPress forums. This plugin creates a section on each userâ€™s profile page that contains their friends.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 11th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #182:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 01:22:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:86:"WPTavern: Wocker: Create a Docker-Based WordPress Development Environment in 3 Seconds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40090";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:95:"http://wptavern.com/wocker-create-a-docker-based-wordpress-development-environment-in-3-seconds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5731:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/docker-wordpress.jpg" rel="prettyphoto[40090]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/docker-wordpress.jpg?resize=1025%2C494" alt="docker-wordpress" class="aligncenter size-full wp-image-40098" /></a></p>\n<p>If you haven&#8217;t caught on to the <a href="https://www.docker.com/" target="_blank">Docker</a> craze, it might be time to see what it&#8217;s all about. Fans of the open source container technology appreciate that it&#8217;s lightweight, super fast to boot up, and easy to share containers through the <a href="https://registry.hub.docker.com/" target="_blank">Docker Hub</a>.</p>\n<p>Docker standardizes an app platform and its dependencies so you can hand the box over to another party without worrying about conflicting dependencies or differences between machines. While virtual machines can be rather weighty with an application plus an entire guest operating system, Docker is much lighter, containing just the application and its dependencies.</p>\n<h3>Introducing Wocker</h3>\n<p><a href="http://www.vagrantup.com/blog/vagrant-1-6.html" target="_blank">Vagrant 1.6.0</a>, released last May, introduced support for Docker-based development environments, enabling Vagrant to manage them within Docker-powered Linux containers, instead of virtual machines.</p>\n<p>WordPress developers who want to incorporate Docker into their workflow now have a new tool at their disposal. <a href="http://wckr.github.io/" target="_blank">Wocker</a> is a Docker-based rapid development environment of WordPress.</p>\n<p>If you already have Vagrant, VirtualBox, and the vagrant-hostsupdater plugin installed, then getting started with Wocker takes next to no time. Simply clone the Wocker repository:</p>\n<p><code>$ git clone https://github.com/wckr/wocker.git &#038;&#038; cd wocker</code></p>\n<p>Then run <code>vagrant up</code>.  You can now navigate to your Wocker development site at: <a href="http://wocker.dev/" target="blank">http://wocker.dev/</a>. Here you&#8217;ll find the latest version of WordPress installed with the default theme active.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wocker.png" rel="prettyphoto[40090]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wocker.png?resize=1025%2C650" alt="wocker" class="aligncenter size-full wp-image-40093" /></a></p>\n<p>Running a new Wocker container takes just three seconds:</p>\n<p><code>core@wocker ~ $ wocker run --name wp</code></p>\n<p>The tasks of creating a new container, restarting a stopped container, or shutting down, can all be done in a matter of seconds with <a href="http://wckr.github.io/" target="_blank">Wocker commands</a>.</p>\n<h3>Kite Koga on Creating Wocker</h3>\n<p>Japanese WordPress developer <a href="https://twitter.com/ixkaito" target="_blank">Kite Koga</a> created Wocker to speed up his own development. Koga is also the organizer of the upcoming <a href="https://www.facebook.com/WordCampKansai2015" target="_blank">WordCamp Kansai 2015</a>.</p>\n<p>&#8220;I used to use MAMP and VCCW for developing on WordPress,&#8221; Koga said. &#8220;MAMP is simple and easy but I have to download or copy WordPress core and create a database every time. <a href="http://vccw.cc/" target="_blank">VCCW</a> is a great tool, and I still use it now and then. It has a lot of options and functions but takes awhile to provision.&#8221;</p>\n<p>Koga also experimented with using <a href="https://github.com/Varying-Vagrant-Vagrants/VVV" target="_blank">VVV</a> before creating Wocker. &#8220;Maybe VVV is good for developing WordPress core, but I feel it&#8217;s not fit for developing on WordPress. It takes too long to provision every time,&#8221; he said.</p>\n<p>&#8220;Ultimately, I found that Docker was a good choice for me,&#8221; Koga said. &#8220;Once I have a Docker image, it takes only three seconds for every new WordPress container. However, Docker is a little tricky, and the command line is complex. Therefore, I made the Wocker command line to run containers and sync files with local more easily.&#8221;</p>\n<p>Wocker is intentionally simple and limited to just a handful of options, as Koga&#8217;s primary objective was to make it super fast to create a new WordPress development environment. One drawback is that you cannot run two or more containers at the same time, but it takes just seconds to switch between containers.</p>\n<p>Koga summarized the main reasons that he opted to use Vagrant to manage Docker deployments:</p>\n<ol>\n<li>I could write some provision scripts in the Vagrantfile, so users only have to do `$ vagrant up`</li>\n<li>It was easier to map hostnames to IP addresses.</li>\n<li>Vagrant with CoreOS was simpler to manage Docker images and containers than boot2docker.</li>\n<li>To sync files between local machine, virtual machine, and the Docker container was tricky, so I made Wocker commands to make it easier.</li>\n</ol>\n<p>If you want to test out Wocker and find that it&#8217;s not for you, it&#8217;s easy and fast to uninstall. Simply run <code>$ vagrant destroy</code> to remove the Wocker folder, and your local machine will always be clean.</p>\n<p>I tested Wocker and found that it was insanely fast to create new containers (as well as restart existing ones), a task for which I would require an extra utility (such as <a href="http://wptavern.com/variable-vvv-a-new-vvv-site-creation-wizard-for-wordpress" target="_blank">Variable VVV</a>) to perform with VVV. If you find VVV to be too slow and want to check out an alternative, <a href="http://wckr.github.io/" target="_blank">Wocker</a> provides a faster way to set up simple development environments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 06 Mar 2015 00:52:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: WordCamp Europe Now Taking Applications for 2016 Host City";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40057";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wptavern.com/wordcamp-europe-now-taking-applications-for-2016-host-city";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4150:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/09/wceu-volunteers.jpg" rel="prettyphoto[40057]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/09/wceu-volunteers.jpg?resize=1025%2C485" alt="wceu-volunteers" class="aligncenter size-full wp-image-31631" /></a></p>\n<p>Organizing an event the size of <a href="http://europe.wordcamp.org/2015/" target="_blank">WordCamp Europe</a> is a year-round endeavor. The 2015 event is just four months away, speaker applications are closed, and the organization team is already asking for applications for the next host city. So far, the camp has been held in Leiden and Sofia, and will come to Seville in June.</p>\n<p>Applying to host WordCamp Europe is similar to applying to be an Olympic city. Local WordPress communities in potential host cities must submit applications, including a budget and a convincing plan. Organizers scrutinize the applications for the following factors:</p>\n<ul>\n<li>Preparation of the budget and venue research</li>\n<li>Strength of the local WordPress community</li>\n<li>The merits of the new location, as compared to the previous year</li>\n<li>Affordability for attendees</li>\n<li>Potential travel difficulties</li>\n</ul>\n<p>This year <a href="http://wptavern.com/seville-spain-to-host-wordcamp-europe-2015" target="_blank">Seville, Spain was selected as the host city</a> after a short bidding process. WordCamp Central requested the event be scheduled earlier in the year to avoid calendar conflicts. This was an unusual turn of events but organizers are committed to re-instituting a public bidding process for all future events.</p>\n<h3>WordCamp Europe to Pilot New Organizer Mentorship Program</h3>\n<p>For months in advance, an all-star lineup of WordCamp organizers from around Europe put their heads together, sharing their experiences to plan the best event possible.</p>\n<p>&#8220;Organizing WordCamp Europe is both a pleasure and a challenge,&#8221; co-organizer Petya Raykovska told the Tavern. &#8220;Whatâ€™s great about it is that you get to work with experienced WordCamp organizers from across Europe. Each organizer brings their own knowledge and perspective to the organizing team which makes it a fantastic opportunity to learn and grow.&#8221;</p>\n<p>The event has traditionally highlighted the diversity of the European WordPress community and its <a href="http://wptavern.com/wordpress-beyond-boundaries-a-recap-of-wordcamp-europe-2014" target="_blank">attendees&#8217; eagerness to connect beyond boundaries</a>.</p>\n<p>&#8220;Itâ€™s a challenge because each of us has our own way of doing things and we have to learn how to listen to each other and compromise,&#8221; Raykovska said. &#8220;And, of course, there are all of those idioms that donâ€™t cross language and cultural barriers!&#8221;</p>\n<p>New WordCamp Europe organizers should be equipped with a solid grasp of diplomacy and the ability to work with others across cultural differences.</p>\n<p>This year the current organization team plans to experiment with a mentorship program that would prepare the next crop of organizers to take the helm in 2016.</p>\n<p>&#8220;We&#8217;re introducing a new process that we hope will help not only find the best team for next year, but will also be a pilot for a mentorship program for future WordCamp Europe (or any large 600+ people WordPress event) events,&#8221; Raykovska said.</p>\n<p>&#8220;So what we want to do in 2015 is choose the team for 2016 and get them to work with us for the 2015 edition, so they can get to know what it takes, get introduced to the processes, work closely with the existing team and monitor what&#8217;s required of the local team.&#8221;</p>\n<p>Current organizers are prioritizing mentoring new additions in order to create a seamless transition from one organizational team to the next. Instead of learning the ropes at the last minute, new organizers will have the opportunity to see how it works without all of the pressure.</p>\n<p>&#8220;We believe it will be highly beneficial for them and will ensure smooth sailing for next year&#8217;s organisation,&#8221; Raykovska said.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 19:32:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:100:"WPTavern: New Theme Development Company Makes First Sale Minutes After Being Approved on ThemeForest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=40045";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:110:"http://wptavern.com/new-theme-development-company-makes-first-sale-minutes-after-being-approved-on-themeforest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4372:"<p><a title="http://warriorsofcode.com/" href="http://warriorsofcode.com/">Warriors Of Code</a> is a new WordPress theme development shop in Australia. An employee who goes by the name <a title="http://www.reddit.com/user/genesisfan" href="http://www.reddit.com/user/genesisfan">Genesisfan</a> on Reddit, <a title="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/" href="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/">published a post </a>explaining how the company recently had its first theme accepted on ThemeForest and was willing to answer questions others had about the experience. According to the post, he spent the better part of six months with a designer he hired while working a full-time job developing <a title="http://themeforest.net/item/broadsword-a-wordpress-theme-to-share-stories/full_screen_preview/10514496" href="http://themeforest.net/item/broadsword-a-wordpress-theme-to-share-stories/full_screen_preview/10514496">Broadsword</a>.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/BroadSword.png" rel="prettyphoto[40045]"><img class="size-full wp-image-40046" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/BroadSword.png?resize=1025%2C496" alt="BroadSword Single Page View" /></a>BroadSword Single Page View\n<p>When asked what he thought of the ThemeForest submission and review process, he responded, &#8220;We were pleasantly surprised with how quickly they turned around our review, and the level of detail they provided in their soft rejection. Aside from some technicalities that we&#8217;d missed (being more specific about what features we supported), the biggest issue was that we were missing some data validation in our files. Make sure you use the esc_ and sanitize_ functions provided by WordPress!&#8221;</p>\n<p>Once the issues were addressed, ThemeForest approved the submission and the team made its first sale within minutes of it going live. When asked what makes their theme different in the marketplace, he responded, &#8220;We kept the theme options to a minimum. We were both pretty tired of themes that include a thousand options and tend to be more like frameworks than standalone themes.&#8221;</p>\n<p>Based on <a title="http://wptavern.com/envato-continues-to-rake-in-the-cash-from-wordpress-themes-packaged-as-complete-website-solutions" href="http://wptavern.com/envato-continues-to-rake-in-the-cash-from-wordpress-themes-packaged-as-complete-website-solutions">stats that highlight</a> how well ThemeForest is doing, it&#8217;s not surprising that Warriors of code made their first sale within minutes of going live. However, the company used social media to its advantage, so it&#8217;s possible one their followers purchased the theme based on tweets. In fact, the company explains how they handled promotion:</p>\n<blockquote><p>Regarding promotion, we&#8217;ve been tweeting it out and liking the facebook page we&#8217;ve set up and luckily, it&#8217;s now trending on ThemeForest. It helps that I&#8217;m on the east coast of Canada and my partner is in Sydney, Australia, so we&#8217;re able to pretty much cover comment replies quickly at any time of the day. I think that goes a long way to helping promote a positive vibe about the theme.</p></blockquote>\n<p>After 24 hours, the company has six sales at $43 each. It&#8217;s not a huge amount, but it&#8217;s a start. The big takeaways is that ThemeForest reviews are catching insecure coding practices and making the first sale is a quick endeavor, especially if you already have a social media presence. The company <a title="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/" href="http://www.reddit.com/r/Wordpress/comments/2xs8l2/just_had_our_first_wordpress_theme_accepted_at/">answers several other questions</a> related to the experience.</p>\n<p>We know that in this instance, ThemeForest did its job to discover insecure coding practices during reviews.Â It&#8217;s also refreshing to hear from an up and coming theme company that they&#8217;re tired of theme options. I haven&#8217;t used their product so I can&#8217;t confirm if its claims are true, but it&#8217;s a step in the right direction to see other ThemeForest sellers make such statements in public.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 07:33:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: WIRED Re-launch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44764";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2015/03/wired-re-launch/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2726:"<p>There&#8217;s the smart publishers, and then there&#8217;s the <a href="http://ma.tt/2015/02/developer-employment-act/">ones going out of business</a>. WIRED is one of the smart ones, and just launched an awesome redesign on WordPress. <a href="http://www.wired.com/2015/03/our-new-site/">From their editor-in-chief</a>:</p>\n<blockquote><p>Back in 1994 we launched Hotwired, the first site with original editorial content created for the web. It was a digital home for reporting on the future of science, business, design, and technology. Youâ€™ve come to trust us over the past two decades, but our growth online has sometimes come too quickly and with some pain. When I took over as editor in chief in 2012, WIRED had an archive of more than 100,000 stories. Thatâ€™s good! But they were spread out over more than a dozen different databases, sections, and homepages tenuously connected by virtual duct tape and chewing gum. The cleanup processâ€”onerous and without a shred of glamourâ€”took almost 15 months. But finally, last year, our engineers rolled out a newly unified site architecture built atop a single streamlined WordPress installation. And you didnâ€™t notice a hiccup. Maybe you saw that pages loaded a touch faster. Stories looked more WIRED.</p></blockquote>\n<p>The story of <a href="http://www.wired.com/2015/03/wired-dot-com-from-the-devs/">the engineering behind it from Kathleen Vignos is also cool</a>:</p>\n<blockquote><p>The redesign gives us the third incarnation of our Curator application, which started years ago as a separate Groovy on Grails application maintained by a single Java developer. Curator once consumed articles from 35 different blogs for curation on our homepage. When we migrated our 17 active WordPress blogs into one WordPress install, we also rewrote Curator in Cake PHP to match our WordPress PHP backend. After this, anyone on our team could maintain Curatorâ€”but the architecture remained the same and lived outside of WordPress. Using this version of Curator, our web producer team manually constructed the homepage throughout each day as various stories were ready to be promoted.</p>\n<p>Our new and improved Curator is now a custom WordPress pluginâ€”and itâ€™s artificially intelligent! This allows our homepage and section landing pages to be both automated and curated at the same time. Stories flow through automagically based on editorial criteria, but editors can take control of the flow by locking stories in certain slots in our card system. This means our homepage and section landing pages are constantly changing with new stories all day long.</p></blockquote>\n<p>Curator sounds cool, as does the coming &#8220;longform feature article builder.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 02:36:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"WPTavern: Ninja Forms 2.9 Ships With Major Performance Improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wptavern.com/ninja-forms-2-9-ships-with-major-performance-improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5648:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png" rel="prettyphoto[39995]"><img class="aligncenter size-full wp-image-40019" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png?resize=840%2C273" alt="Ninja Forms Featured Image" /></a></p>\n<p>Ninja Forms <a title="https://ninjaforms.com/version-2-9/" href="https://ninjaforms.com/version-2-9/">2.9 is available</a> and features an improved user experience along with major performance enhancements. One of the biggest performance problems 2.9 solves is handling large forms. Prior to 2.9, users had to edit a php.ini file to handle the increased amount of server resources needed to process long forms, something many shared webhosts don&#8217;t allow. According to Kevin Stover, lead developer of Ninja Forms, 2.9 not only solves this problem, but the form builder is more efficient overall.</p>\n<blockquote><p>In our local tests, a 578 field form was 12.8mb and took 33.52 seconds to load. (It also occasionally crashed our browser.) In version 2.9, the same form was only 1.2mb and took only 1.41 seconds to load. We call that progress.</p></blockquote>\n<p>The user experience is vastly improved compared to earlier versions of the plugin. Now when you edit an existing form or want to create a new one, you&#8217;re taken to the form builder instead of a page filled with confusing settings. After installing Ninja Forms, it took less than five minutes to recreate the <a title="http://wptavern.com/contact-me" href="http://wptavern.com/contact-me">Tavern&#8217;s contact form</a>.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29UserInterface.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40012" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29UserInterface.png?resize=1025%2C500" alt="Ninja Forms 2.9 User Interface" /></a>Ninja Forms 2.9 User Interface\n<p>A small but noticeable change is that, when you create a new form without a submit button and save it, a model window pops up reminding you to add one. Or, you can let Ninja Forms add it automatically. It&#8217;s hard to make a form useful without a submit button!</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29SubmitButtonReminder.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40013" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaForms29SubmitButtonReminder.png?resize=549%2C268" alt="Ninja Forms 2.9 Submit Button" /></a>Ninja Forms 2.9 Submit Button Reminder\n<p>One of the major changes to the form building experience is configuring fields. In previous versions of Ninja Forms, all of the configuration options for fields were in view which felt overwhelming. In Ninja Forms 2.9, field options are hidden behind drop down menus that are closed by default. This allows you to configure them at your own pace.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFieldSettings.png" rel="prettyphoto[39995]"><img class="size-full wp-image-40014" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFieldSettings.png?resize=535%2C477" alt="Ninja Forms 2.9 Field Settings" /></a>Ninja Forms 2.9 Field Settings\n<p>Overall, Ninja Forms 2.9 is a solid release and offers a better experience than its predecessors. I found it easier to build forms without having to rely on documentation. Stover says this release, &#8220;lays the groundwork for even better stuff to come down the road.&#8221; You can download Ninja Forms free from the <a title="https://wordpress.org/plugins/ninja-forms/" href="https://wordpress.org/plugins/ninja-forms/">WordPress plugin directory</a>.</p>\n<p>To learn more about James Laws, Co-founder of WP Ninjas and his company,Â <a title="http://wptavern.com/wpweekly-episode-179-interview-with-james-laws-co-founder-of-wp-ninjas" href="http://wptavern.com/wpweekly-episode-179-interview-with-james-laws-co-founder-of-wp-ninjas">listen to episode 179</a> of WordPress Weekly. In the show, we discuss some of the improvements that made it into Ninja Forms 2.9.</p>\n<div class="audio-shortcode-wrap"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/NinjaFormsFeaturedImage.png?resize=175%2C131" alt="Ninja Forms Featured Image" class="landscape thumbnail post-thumbnail audio-image" /><a href="http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3">http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3</a></div><div class="media-shortcode-extend"><div class="media-info audio-info"><ul class="media-meta"><li><span class="prep">Run Time</span> <span class="data">1:17:51</span></li><li><span class="prep">Artist</span> <span class="data">Jeff Chandler and Marcus Couch</span></li><li><span class="prep">Album</span> <span class="data">WordPress Weekly</span></li><li><span class="prep">Track</span> <span class="data">179</span></li><li><span class="prep">File Name</span> <span class="data"><a href="http://wptavern.com/wp-content/uploads/2015/02/EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3">EPISODE-179-Interview-With-James-Laws-Co-Founder-of-WP-Ninjas.mp3</a></span></li><li><span class="prep">File Size</span> <span class="data">33.64 MB</span></li><li><span class="prep">File Type</span> <span class="data">MP3</span></li><li><span class="prep">Mime Type</span> <span class="data">audio/mpeg</span></li></ul></div><button class="media-info-toggle">Audio Info</button></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 05 Mar 2015 00:32:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: BuddyPress 2.3 Development Kicks Off, Contributors Prioritize Work on New APIs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/buddypress-2-3-development-kicks-off-contributors-prioritize-work-on-new-apis";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2810:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/04/buddypress-wall.jpg" rel="prettyphoto[39890]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/04/buddypress-wall.jpg?resize=1018%2C458" alt="buddypress-wall" class="aligncenter size-full wp-image-20901" /></a></p>\n<p>The BuddyPress 2.3 development cycle is now in full swing, following a successful 2.2.1 maintenance release that <a href="http://wptavern.com/buddypress-breaks-one-day-download-record-with-2-2-1-release" target="_blank">broke the plugin&#8217;s one-day download record</a> with more than 10,000 downloads in just 24 hours. More minor fixes are on deck for inclusion in the forthcoming 2.2.2 release.</p>\n<p>This week contributors identified priorities for new features and improvements to work on for the <a href="https://bpdevel.wordpress.com/2015/03/03/bp-2-3-0-dev-cycle-contributor-priorities/" target="_blank">2.3 development cycle</a>. Updates to BuddyPress&#8217; existing APIs and work on the following new APIs commenced this week:</p>\n<ul>\n<li><a href="https://buddypress.trac.wordpress.org/ticket/6210" target="_blank">New Invitations API</a> &#8211; a flexible API to create/retrieve invitations across components</li>\n<li><a href="https://buddypress.trac.wordpress.org/ticket/5429" target="_blank">New Attachments API</a> &#8211; a new component to manage BuddyPress attachments</li>\n<li><a href="https://github.com/paulgibbs/buddypress/tree/posts2posts" target="_blank">Possible new Relationships API</a> &#8211; for the Favorites/Likes features</li>\n<li>Improvements to Member Types API &#8211; <a href="https://buddypress.trac.wordpress.org/ticket/5192" target="_blank">ability to create member-type-specific xprofile fields</a>, fixes for existing bugs</li>\n<li>Notifications API &#8211; <a href="https://buddypress.trac.wordpress.org/ticket/6257" target="_blank">add a metadata table</a> &#8211; useful for storing additional data outside the available notification table&#8217;s schema</li>\n</ul>\n<p>New APIs would make it possible for BuddyPress developers to build extensions that bring in more exciting features, such as a core-supported way to manage media/user galleries, local avatar management, invitation capabilities for groups, sites, blogs, docs, etc. The APIs give developers a way to custom tailor those experiences for their communities.</p>\n<p>While none of these APIs and improvements are yet guaranteed to make it into 2.3, contributors have hammered out the tickets they will be investing in during the next three months. The official release is currently targeted for the end of May, 2015. To follow progress on tickets for the 2.3 milestone, check out the <a href="https://buddypress.trac.wordpress.org/milestone/2.3" target="_blank">roadmap</a> on BuddyPress trac.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 22:10:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"Post Status: Adii Pienaar is making a WordPress comeback with stake in Obox";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=9009";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"https://poststatus.com/adii-pienaar-making-wordpress-comeback-stake-obox/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6289:"<p>Adii Pienaar has been largely away from the WordPress community for much of the last year and a half. He&#8217;s one of three co-founders of WooThemes and was instrumental in <a href="http://www.woothemes.com/about/">their growth</a> and success they achieved from 2008 until his departure in late 2013.</p>\n<p>Today, Adii isÂ making the second step of his WordPress comeback. In addition to <a href="https://receiptful.com/">Receiptful</a> &#8212; his new eCommerce receipts product &#8212; he&#8217;s taking on an advisory role with Obox, to go along with a cashÂ investment in the company.</p>\n<p><a href="http://oboxthemes.com/">Obox</a> is based in Cape Town, South Africa &#8212; where Adii and WooThemes are also based. Obox has been around the block as well.</p>\n<p>They were founded in 2009 and are lead by brothers Marc and David Perel. Obox has experiencedÂ times of great success &#8212; peaking as a team of 8 in 2012 &#8212; and also years where they&#8217;ve scaled back in response to more competition and watering down of the WordPress theme market.</p>\n<p>Before Adii left WooThemes, he had numerous conversations with Obox about an acquisition, but the parties could never agree on the specifics.</p>\n<h3>Adii now owns a 30% stake in Obox</h3>\n<p>David Perel showed Adii some screenshots of Layers while they were wrapping up development of <a title="Layers, by Obox, introduces a beautiful page building interface" href="https://poststatus.com/layers-theme-obox/">the new product</a>. Adii was intrigued and they started once again talking about joining forces, except this time the direction changed; they started talking about what it would look like for Adii to join Obox.</p>\n<p>Adii has made a cash investment in the Obox team, in return for a 30% stake in the company. The investment gives Obox a valuation in the millions of dollars, &#8220;butÂ less than $10 million.&#8221;</p>\n<p>The cash from Adii&#8217;s investment is largely going to be used for operating expenses for the Obox team as they create the business model around Layers. Obox has also beefed up their team by <a href="http://blog.oboxthemes.com/calyx-joins-obox/">acquihiring Calyx</a>, a two man Cape Town agency.</p>\n<p>According to David, <span class="pullquote alignright">&#8220;Every cent Obox raises and makes will go into Layers.&#8221;</span></p>\n<h3>Roller coaster ride</h3>\n<p>Adii has been on a bit of a roller coaster ride since his departure of WooThemes. I&#8217;ve heard both Adii and his cofounders (Magnus Jepson and Mark Forrester) describe their split as a divorce. It was a hard time.</p>\n<p>The split was complete, and Adii released all ownership of the company for an amount he has <a href="http://mixergy.com/interviews/adii-pienaar-public-beta-interview/">confirmed on Mixergy</a> was seven figures. He tells me that he has been fully paid for his shares.</p>\n<p>With cash in hand, Adii had room to takeÂ some risks, and with that risk came a mixture of successes and failures. His first foray into another product was Public Beta, which had many iterations before he ultimately deemed it a lost cause.</p>\n<p>His latest startup seems to haveÂ traction; Receiptful has had a successful launch, is getting nice adoption, and is expanding to multiple eCommerce platforms after an initial WooCommerce-only launch.</p>\n<p>Time heals all wounds, and it appears Adii&#8217;s relationship with WooThemes is also mended. They even <a href="http://www.woothemes.com/2015/02/why-customized-receipts-increase-ecommerce-revenue/">blogged about Receiptful</a> recently on the main WooThemes blog.</p>\n<h3>Renewed passion for WordPress</h3>\n<p>Both Receiptful and the Obox investment show renewed passion for WordPress, as well as a sign of Adii getting back to his roots and what he knows best. With the launch of WooCommerce, Adii spearheaded what became a huge success during his time at WooThemes; and WooCommerce has only further grown since his departure.</p>\n<p>Adii hopes to take what he&#8217;s learned &#8212; both at WooThemes and with his adventures since &#8212; to his role at Obox.</p>\n<blockquote><p>One of the biggest challenges within WordPress is the disconnect between how developers and end-users use it, which makes building great WordPress products really hard. It&#8217;s also something that we encountered often at Woo and instead of truly tackling the problem we leaned towards building tools for developers.</p>\n<p>Layers is different in that sense, because it&#8217;s focused on the (end-)user experience from the ground up. I couldn&#8217;t be more excited to work with David &amp; Marc to grow Layers, as they&#8217;re fanatical about UX and it&#8217;s my belief that they&#8217;ll finally make progress to closing the gap between a developer tool and end-user product.</p>\n<p>And in terms of the commercialisation of Layers&#8230; Well, let&#8217;s just say that I see opportunities and patterns that were prevalent in WooCommerce&#8217;s early days too&#8230;</p></blockquote>\n<h3>A new step for a dynamic WordPress figure</h3>\n<p>Adii was a huge and dynamic figure in the early days of WordPress&#8217; commercial product space. He&#8217;s always made bold decisions &#8212; some good and some not so good.</p>\n<p>He has a penchantÂ to make quick decisions and he iterates at a rapid pace; to some it can be off-putting, but for finding a hit it can be hugely important. In contrast, the Obox team makes calculated risks. While they&#8217;ve done a great deal of interesting work and experimentation on their own, they have largely stuck with the theme business while some of their early theme competitors rotated toward plugins and other verticals.</p>\n<p>I believe that the combination of Adii and the Perel brothers will make for a compelling trio of leadership at the helm for Obox. Their Layers launch <a href="http://blog.oboxthemes.com/what-hitting-the-top-spot-on-product-hunt-did-to-our-launch-day/">certainly made waves</a>, and their next steps will be hugely important for the future of a company that has gone all in on a product without a monetization strategy.</p>\n<p>You can read the <a href="http://blog.oboxthemes.com/adii-co-founder-of-woothemes-and-woocommerce-has-joined-obox/">official announcement on the OboxÂ blog</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 15:56:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WPTavern: WordPress Plugin Directory Launches New Design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39957";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wptavern.com/wordpress-plugin-directory-launches-new-design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3778:"<p>The WordPress.org Meta team is on a roll this month. Following the successful <a href="http://wptavern.com/wordpress-theme-directory-launches-new-design" target="_blank">launch of the new theme directory</a>, the <a href="https://wordpress.org/plugins/" target="_blank">plugin directory</a> is getting the same treatment with <a href="https://make.wordpress.org/meta/2015/03/04/new-plugin-directory-theme/" target="_blank">a fresh coat of paint</a> and a set of brand new features.</p>\n<p>Browsing the official plugin directory is now similar to searching via the admin plugin browser. Having all of this code on hand made it easier for the meta team to replicate the experience in the directory.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-plugin-directory.png" rel="prettyphoto[39957]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/03/wordpress-plugin-directory.png?resize=1025%2C970" alt="wordpress-plugin-directory" class="aligncenter size-full wp-image-39963" /></a></p>\n<p>In addition to the new design, the directory includes a new section for logged-in users to manage favorited plugins. Previously, users had to navigate to their own profile pages to access this information. With more than 36,000 listings in the directory, favorites are becoming an important feature for users who want to keep track of plugins they use frequently.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/plugin-favorites.png" rel="prettyphoto[39957]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/03/plugin-favorites.png?resize=1025%2C511" alt="plugin-favorites" class="aligncenter size-full wp-image-39975" /></a></p>\n<p>The &#8220;Popular&#8221; section seems to be populated by extensions with the highest number of active installs. It would be helpful to be able to further sort popular plugins based on different criteria, i.e. the most-favorited plugins and those with the highest ratings.</p>\n<p><a href="https://wordpress.org/plugins/browse/beta/" target="_blank">Beta Testing</a> is a new section which you may recognize from the WordPress admin. It lists all the feature plugins that are currently under consideration for inclusion in core at some point in the future. This more prominent display will help users discover the plugins, resulting in an increase in feedback for contributors.</p>\n<p>Users can also now search for plugins based on author, keyword, or tag. Searching is lightning fast, but it could be improved with filtering options to further narrow down the results.</p>\n<p>Although individual plugin pages did not receive a design update, they now reflect more accurate data with the number of active installs for each plugin. This provides plugin authors with a better understanding of how many sites are actively using that functionality, as opposed to just having downloaded it once and then uninstalled it.</p>\n<p>The new design is more visually-oriented than the previous one, making it easier for users to quickly scan through a long list of results. It is now more important than ever for developers to prioritize <a href="http://wptavern.com/wordpress-4-0-adds-custom-icons-to-the-plugin-installer" target="_blank">plugin branding</a> if they want their work to stand out in the official directory.</p>\n<p>In his <a href="https://make.wordpress.org/meta/2015/03/04/new-plugin-directory-theme/" target="_blank">announcement</a> about updates to the plugin directory, WordPress.org contributor Scott Reilly said that a backend reimplementation of the directory is on the roadmap for a future update. If you find a bug in the current implementation, feel free to open a ticket on <a href="https://meta.trac.wordpress.org/" target="_blank">meta.trac</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 09:25:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Matt: WordPress iOS WYSIWYG";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44747";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"http://ma.tt/2015/03/wordpress-ios-wysiwyg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:499:"<p>It&#8217;s been a long road, but the WordPress mobile apps are finally making some major strides. <a href="https://apps.wordpress.org/2015/02/26/wordpress-for-ios-a-new-visual-editor-more/">WordPress iOS version 4.8 includes a visual editor so you won&#8217;t see code anymore when blogging on the go</a>. (For anyone curious at home, WordPress originally <a href="https://wordpress.org/news/2005/12/wp2/">shipped with WYSIWYG in version 2.0</a>, and it was highly controversial at the time.)</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Mar 2015 04:31:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:33 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"193091";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Tue, 17 Mar 2015 14:30:12 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20130911070210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(400, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1426646515', 'no'),
(401, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1426603315', 'no'),
(402, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1426646516', 'no'),
(403, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins Â» View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins Â» View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Mar 2015 14:19:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"The easiest, most effective way to secure WordPress in seconds.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"MailChimp for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/mailchimp-for-wp/#post-54377";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 10 Jun 2013 17:32:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"54377@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The best MailChimp plugin to get more email subscribers. Easily add MailChimp sign-up forms and sign-up checkboxes to your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Danny van Kooten";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"bbPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/bbpress/#post-14709";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Dec 2009 00:05:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14709@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:50:"bbPress is forum software, made the WordPress way.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"John James Jacoby";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ManageWP Worker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/worker/#post-24528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Feb 2011 13:06:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"24528@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"ManageWP is the ultimate WordPress productivity tool, allowing you to efficiently manage your websites.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Vladimir Prelovac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Contact Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/plugins/contact-form-plugin/#post-26890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 May 2011 07:34:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26890@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:43:"Add Contact Form to your WordPress website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bestwebsoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5468@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"Make your WordPress website mobile-friendly with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/nextgen-facebook/#post-40409";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Jul 2012 20:13:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"40409@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Display your content in the best possible way on Facebook, Google+, Twitter, Pinterest, etc. - no matter how your webpage is shared!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"JS Morisset";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"WP Statistics";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-statistics/#post-25318";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 20 Mar 2011 09:03:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25318@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:44:"Complete statistics for your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Mostafa Soufi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-Optimize";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/wp-optimize/#post-8691";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 21 Jan 2009 04:28:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8691@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Simple but effective plugin allows you to extensively clean up your WordPress database and optimize it without doing manual queries.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"ruhanirabin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Page Links To";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/page-links-to/#post-216";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:53:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"216@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"Lets you make a WordPress page (or other content type) link to an external URL of your choosing, instead of its WordPress URL.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Mark Jaquith";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"NextScripts: Social Networks Auto-Poster";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"https://wordpress.org/plugins/social-networks-auto-poster-facebook-twitter-g/#post-35439";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 02 Mar 2012 00:28:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"35439@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:149:"Automatically re-publishes blogposts to Facebook, Twitter, Google+, Pinterest, LinkedIn, Blogger, Tumblr, Delicious, Plurk, etc profiles and/or pages";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"NextScripts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Antispam Bee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/antispam-bee/#post-8484";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Jan 2009 08:43:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8484@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"â€ž... another popular solution to fight spam is Antispam Beeâ€œ â€“ Matt Mullenweg, Q&#38;A WordCamp Europe 2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"stalkerX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 17 Mar 2015 14:41:35 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Tue, 17 Mar 2015 14:54:34 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 17 Mar 2015 14:19:34 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20130911070210";}', 'no'),
(404, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1426646516', 'no'),
(405, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1426603316', 'no'),
(406, '_transient_timeout_plugin_slugs', '1426689716', 'no'),
(407, '_transient_plugin_slugs', 'a:9:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"buddypress/bp-loader.php";i:2;s:50:"google-analytics-for-wordpress/googleanalytics.php";i:3;s:39:"siteorigin-panels/siteorigin-panels.php";i:4;s:23:"papercite/papercite.php";i:5;s:27:"theme-check/theme-check.php";i:6;s:27:"woocommerce/woocommerce.php";i:7;s:23:"wordfence/wordfence.php";i:8;s:24:"wordpress-seo/wp-seo.php";}', 'no'),
(408, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1426646516', 'no'),
(409, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/03/wordpress-4-2-beta-1/''>WordPress 4.2 Beta 1</a> <span class="rss-date">Marzo 12, 2015</span><div class="rssSummary">WordPress 4.2 Beta 1 is now available! This software is still in development, so we donâ€™t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.2, try the WordPress Beta Tester plugin (youâ€™ll want â€œbleeding edge nightliesâ€). Or you can [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://ma.tt/2015/03/meetups-around-the-world/''>Matt: Meetups Around the World</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/ultimate-member-a-new-free-community-and-user-profile-plugin-for-wordpress''>WPTavern: Ultimate Member: A New Free Community and User Profile Plugin for WordPress</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/pods-framework-security-release-fixes-severe-vulnerability''>WPTavern: Pods Framework Security Release Fixes Severe Vulnerability</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Plugin popular:</span> <a href=''https://wordpress.org/plugins/nextgen-facebook/'' class=''dashboard-news-plugin-link''>NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=nextgen-facebook&amp;_wpnonce=1102ed1f2f&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More''>Instalar</a>)</span></li></ul></div>', 'no'),
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
(1, 1, '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Bienvenido(a) a WordPress. Esta es su primera entrada. EdÃ­tela o bÃ³rrela Â¡y empiece a publicar! Gracias por usar <a href="http://pe.wordpress.org/">WordPress en espaÃ±ol</a>.', 'Â¡Hola mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2014-12-23 02:39:57', '2014-12-23 02:39:57', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2014-12-23 02:39:57', '2014-12-23 02:39:57', 'Esta es una pÃ¡gina de ejemplo. Es diferente a una entrada del blog, ya que se quedarÃ¡ en un lugar y se mostrarÃ¡ en la navegaciÃ³n del sitio (en la mayorÃ­a de temas). La mayorÃ­a de personas empieza con una pÃ¡gina "Acerca de" que brinda informaciÃ³n a los visitantes. Se podrÃ­a decir algo como esto:\n\n<blockquote>Â¡Hola! Durante el dÃ­a soy un mensajero, un aspirante a actor por la noche, y este es mi blog. Vivo en Lima, tengo un enorme perro llamado Pocho, y me gusta el Pisco Sour. (Y caminar bajo la lluvia.)</blockquote>\n\n...o algo como esto:\n\n<blockquote>La compaÃ±Ã­a XYZ, se fundÃ³ en 1971, y ha estado desde entonces, proporcionando artilugios de calidad al pÃºblico. EstÃ¡ situado en la ciudad de Lima, XYZ emplea a mÃ¡s de 2,000 personas y hace todo tipo de cosas sorprendentes para la comunidad limeÃ±a.</blockquote>\n\nComo nuevo usuario de WordPress, usted debe ir a <a href="http://localhost/wordpress/wp-admin/">su panel</a> para eliminar esta pÃ¡gina y crear nuevas para su contenido. Â¡Que se divierta!', 'Noticias', '', 'publish', 'open', 'closed', '', 'pagina-de-ejemplo', '', '', '2015-03-16 11:28:54', '2015-03-16 11:28:54', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 2),
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
(19, 1, '2015-03-16 11:28:54', '2015-03-16 11:28:54', 'Esta es una pÃ¡gina de ejemplo. Es diferente a una entrada del blog, ya que se quedarÃ¡ en un lugar y se mostrarÃ¡ en la navegaciÃ³n del sitio (en la mayorÃ­a de temas). La mayorÃ­a de personas empieza con una pÃ¡gina "Acerca de" que brinda informaciÃ³n a los visitantes. Se podrÃ­a decir algo como esto:\n\n<blockquote>Â¡Hola! Durante el dÃ­a soy un mensajero, un aspirante a actor por la noche, y este es mi blog. Vivo en Lima, tengo un enorme perro llamado Pocho, y me gusta el Pisco Sour. (Y caminar bajo la lluvia.)</blockquote>\n\n...o algo como esto:\n\n<blockquote>La compaÃ±Ã­a XYZ, se fundÃ³ en 1971, y ha estado desde entonces, proporcionando artilugios de calidad al pÃºblico. EstÃ¡ situado en la ciudad de Lima, XYZ emplea a mÃ¡s de 2,000 personas y hace todo tipo de cosas sorprendentes para la comunidad limeÃ±a.</blockquote>\n\nComo nuevo usuario de WordPress, usted debe ir a <a href="http://localhost/wordpress/wp-admin/">su panel</a> para eliminar esta pÃ¡gina y crear nuevas para su contenido. Â¡Que se divierta!', 'Noticias', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-03-16 11:28:54', '2015-03-16 11:28:54', '', 2, 'http://localhost/wordpress/2015/03/2-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2015-03-17 13:59:01', '2015-03-17 13:59:01', '', 'iuai-tech_negro', '', 'inherit', 'open', 'open', '', 'iuai-tech_negro', '', '', '2015-03-17 13:59:01', '2015-03-17 13:59:01', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech_negro.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 'iuai-tech-transparente', '', 'inherit', 'open', 'open', '', 'iuai-tech-transparente', '', '', '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech-transparente.png', 0, 'attachment', 'image/png', 0),
(22, 1, '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 'iuai-tech_blanco', '', 'inherit', 'open', 'open', '', 'iuai-tech_blanco', '', '', '2015-03-17 13:59:02', '2015-03-17 13:59:02', '', 0, 'http://localhost/wordpress/wp-content/uploads/2015/03/iuai-tech_blanco.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2015-03-17 14:41:50', '0000-00-00 00:00:00', '', 'Borrador automÃ¡tico', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-03-17 14:41:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=23', 0, 'post', '', 0),
(24, 1, '2015-03-17 15:29:36', '2015-03-17 15:29:36', 'Debe estar en la primera pÃ¡gina de todos los profesores.', 'Solo profesores', '', 'publish', 'open', 'open', '', 'solo-profesores', '', '', '2015-03-17 15:29:36', '2015-03-17 15:29:36', '', 0, 'http://localhost/wordpress/?p=24', 0, 'post', '', 0),
(25, 1, '2015-03-17 15:29:36', '2015-03-17 15:29:36', 'Debe estar en la primera pÃ¡gina de todos los profesores.', 'Solo profesores', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-03-17 15:29:36', '2015-03-17 15:29:36', '', 24, 'http://localhost/wordpress/2015/03/24-revision-v1/', 0, 'revision', '', 0);

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
(1, 'Sin categorÃ­a', 'sin-categoria', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'MenÃº 1', 'menu-1', 0),
(7, 'Laboratorios', 'lab', 0),
(8, 'Grupos de Trabajo', 'grupos', 0),
(9, 'Profesores', 'profes', 0),
(10, 'Grupos de Trabajo', 'grupos', 0),
(11, 'Laboratorios', 'labs', 0),
(12, 'RobÃ³tica', 'robots', 0),
(13, 'Emprendimiento', 'emprende', 0),
(14, 'EnergÃ­a', 'energia', 0),
(15, 'Medio ambiente', 'ma', 0),
(16, 'EstadÃ­stica', 'est', 0),
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
(7, 7, 'category', 'AquÃ­ estarÃ¡n las publicaciones exclusivas del personal de Laboratorios FÃ­sicos que son alrededor de 3 en total.', 0, 0),
(8, 8, 'category', 'AquÃ­ estarÃ¡n las publicaciones exclusivas de los grupos de trabajo existentes que son alrededor de 5 en total.', 0, 0),
(9, 9, 'category', 'AquÃ­ estarÃ¡n las publicaciones exclusivas de los profesores del Ã¡rea informÃ¡tica que son alrededor de 10 en total.', 0, 1),
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
(4, 1, 'description', 'InformaciÃ³n bÃ¡sica 1.\r\nEn este recuadro se muestra lo que el usuario dueÃ±o desea que sea presentado en su perfil para que sea leÃ­do por otros usuarios que deseen saber mÃ¡s sobre el/ella.'),
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
('\0rØ¿}mIÞÕ^ô æx', 'wp-content/plugins/woocommerce/includes/libraries/class-cssmin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PTV»bcÉ=.ÆìÝíÉ¯ÿ'),
('\0''è\0¯­g¡3yŒlf†P', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile-base.php', 0, '‚ê±™l|c"±mê!', '‚ê±™l|c"±mê!'),
('\00öñ#Š9ýœ¬Z4Îj$', 'wp-admin/network/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1s¶Ì¶>Ø£Ð…cÃÿ'),
('\03/lû°$M a¹ãj‰õ', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/jcb.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kû\r-Ãxí%Ü]Ã)õñ'),
('\05gÀËÏê«”c‹0‰"D', 'wp-includes/css/media-views-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';­ÒÓ½œìjéµùÑJ'),
('\0C_\nìÂjD¨é@k', 'wp-admin/network/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“§&Gób)Ýv/ÿU'),
('\0`Y±Ï­rG¦¦”„', 'wp-includes/SimplePie/Restriction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*qhdsˆ;Õy'),
('\0qÉ¢>''pšèÉÿËl', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/groups-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©Ó‹Tb°÷8áË`Ê‡'),
('\0‚U.!h‚ nä~©/''', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/friends/requests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F\rjYÝs¢=t–% ;'),
('\0‘c+k„ÕñëM­ä,', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/bbpress-logo.png', 0, '¿CãÌðêUºº(n\\[k›²', '¿CãÌðêUºº(n\\[k›²'),
('\0”Â%Î¥J-šp¾É', 'wp-content/plugins/wordpress-seo/inc/class-rewrite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Å©¥ÍJ	}êªOîkDºé'),
('\0£Ô@–K•Þ([|iýÈ', 'wp-content/plugins/buddypress/bp-forums/bp-forums-bbpress.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÌK©Ý=#ŠÉþ	&^'),
('\0¯ÿ{O¤Žì/éW¿.', 'wp-content/plugins/buddypress/bp-forums/bb-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÆÞ2çAëTÿnjƒ>æZþò'),
('\0»ó5ZM/\\*´ˆ%	;', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/activity/permalink.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sºt‘«¯D+³q‰îgg'),
('\0Ç|9è×u…eäñá–@ƒµ', 'wp-admin/includes/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'îO–düØ›5þª,­\n±'),
('\0ë„çÖÉÓÑÞ`b›Óª¨X', 'wp-content/plugins/woocommerce/templates/global/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?\0¿ÆJº<cÜPùÛß6•'),
('\0ûÛŽx%™d\ZÎkK](', 'wp-content/themes/twentyfifteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hYÓ ¨&é„ß6Ó	Œý‡N'),
('	¢}¿U(>ÝoVŽ•', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post.php', 0, 'XTú´!&:G·„­ª', 'XTú´!&:G·„­ª'),
('‡kÆãV(\nþÄ@·', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê}ƒ~ÃèÖ¤«šSÿœZ@'),
('’¤È„˜7Ùgäb^I5', 'wp-content/themes/twentyfourteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ~mþó\\¦£ªem,]'),
('+ò Çò4íù)Ô`bö', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-live-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ÿZÿ{j|ï$pÖ”sÏp|'),
('<\0këàòM	S´Â~ª7', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-merge.php', 0, 'UÞÕP %°	kíÁ|]', 'UÞÕP %°	kíÁ|]'),
('NQž"*hzªrÃw|\Zø', 'wp-admin/images/media-button-other.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹Æ´kÇ|Üæ,Oã"œ'),
('sÒRÃÁ·†||(W¿!‘', 'wp-content/themes/twentythirteen/content-chat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"á ÕS>\Z3)Þbè1È	'),
('%¿\\i\\jí?™Šx', 'wp-content/themes/twentythirteen/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ª;£ŽRëWå†k°ÿlˆÓ—'),
('’Ç!vª4‘î¤¯üùÀ¾', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MagentoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ{ü’F‹‰ç¹ÁÊs'),
('™TêhËÔìzPŸùré', 'wp-admin/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È’Õ¢x‰rã\\ìq‹%K'),
('ªZ.swLù¿\rÛûž« ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WHMCSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨:x«‘ëœ+x[·Ä'),
('½_Þ4t$¾n‹q¡v­I', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' oã²4¸eÎEq æ'),
('Ëó³;ÂœAÓ9³:ð«k', 'wp-content/themes/hexa/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤ó¢[ü\r#©%¥UM‹'),
('ßâ`È½¶c †)dœ¸', 'wp-content/themes/twentyfourteen/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ky#¨$~ä£ p³éÇ'),
('t]•ÙŸuÃÕuÛüåjû', 'wp-admin/images/menu-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q™€òLð,_¥;1/ïE¬'),
('¨‘~¸w`²5;Fã®®', 'wp-includes/js/jquery/ui/effect-size.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oÖ íÎ×´ÑlP\r‰m^'),
('ô=üðq¯\rljA+', 'wp-admin/user/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*zu£c°øm	J‘ïeê'),
(',¢-o§}¢Ã''µÇèÅ', 'wp-content/plugins/buddypress/bp-activity/bp-activity-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k5ûè°B|Ñ¦ÐL™'),
('*lXóª±ÌKPqU', 'wp-content/themes/twentyfifteen/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nß¬/ÅÏò«Bèñé ³>V'),
('.ƒ8¶¨ÑGŸ¾‰“+8 ', 'wp-content/plugins/buddypress/bp-core/js/confirm.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õõm©©˜QØ/åŒÃÂ'),
('<)8T*.SuSÒÄºŸ', 'wp-includes/SimplePie/Cache/MySQL.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è‘ÎßBÊC™\ZHÕxV‡'),
('HCƒìÜ!ó«ª"(ˆ', 'wp-includes/js/tinymce/plugins/compat3x/css/dialog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—ÝÍ•Õ\0AŒÒItÿdH'),
('J4[½¸]Ñˆ›Ä¸À"', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Î€‘''Š¶\n–¬UQ“&ïÓU'),
('kX¿´8ýc0ÍVë#', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/jquery.js', 0, 'Q‚ÆF¾ÿW˜IB‘9Ô', 'Q‚ÆF¾ÿW˜IB‘9Ô'),
('uÞÇs¶›y6''v,ªÞ=', 'wp-includes/js/tinymce/plugins/wordpress/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷ÌCm¸ï\rC¼r›ñ±'),
('€Ÿ êkš ä¯ Õ+SÒ€', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ú}f¬j0Ï2è]¼æ°^?'),
('ƒ\Z€—?Åž¿sî"MŸ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'èø†»V\rK-E–µ\n}ª'),
('ŠÇ¼µ%hcQºxjRªÄ', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jpt\0ç«ƒ‡ÙÜvðþ'),
('¼?~R×˜nB»ƒš6\\Ë', 'wp-content/plugins/woocommerce/assets/js/admin/quick-edit.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥*hÚêE–Ë"žþV'),
('¿pËAÏjF£bGÕ	›©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-core.php', 0, '¿ÀèÄðU®»	½‰{', '¿ÀèÄðU®»	½‰{'),
('Çè†T¶’f>Çº~ÿ', 'wp-content/plugins/woocommerce/includes/walkers/class-product-cat-dropdown-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òr}Èwªu\0dg,^¬ šc'),
('ÍÛ]´@;g«ù;7Ï¿3', 'wp-content/plugins/buddypress/bp-core/admin/css/common-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_ÃDiÛÍA{Z]µÎ'),
('Øš÷ðAÛÎÒ\rïàZÊ', 'wp-content/plugins/woocommerce/assets/js/admin/settings.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÚìl€Lki)''|¸µÇ'),
('Þ”ä¥ê7™&‡òÈ€', 'wp-includes/js/tinymce/skins/lightgray/content.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zx+<(ÈÓ)ÈÊÿå×d­'),
('à¼—!>#’@×ð7WÜ''', 'wp-content/themes/twentyfourteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÂÊ4b‰Ø-¯+l‘ö'),
('á;Îœpne‚šÃ^@´', 'wp-content/themes/twentyfourteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@´¹´µh3>—?iÎÎ'),
('øsÍ\ZÓøZtãcú	é', 'wp-content/themes/twentyfourteen/sidebar-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿£üÈƒ$ÑÒ\0DO¦±K'),
('O,2gÿ¨ìóH', 'wp-content/plugins/theme-check/lang/theme-check.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž‰ræf’\0¨î`fýš‡5'),
('''mKéðÿ[t\nj+ü', 'wp-content/plugins/buddypress/bp-core/bp-core-wpabstraction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Oæµ4ÏE"•<¨J`l='),
('(¿€—Ñ™—ÉÚ\0H<_', 'wp-admin/includes/nav-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\`ÑgOš¦ð³‡ªzú‰v˜'),
('díp¸Õª7Cx0	lXià', 'wp-content/plugins/google-analytics-for-wordpress/admin/views/content_head.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û°þR4ý\0i“mµÜ¯'),
('iô¢PÃ™û–ld\0ú‘', 'wp-includes/css/jquery-ui-dialog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ò´†”P4Ô¨]ééñÃÕ'),
('¾ìd¥Î¥¦¼ÂÀ£“', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/.hg_archival.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iì8È[æ0®éåãõ?[L'),
('áîÙ1ñÌðÔZ½ß8#', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊÖºMˆ{÷U»‘Íî'),
('¼„Mãa\nóAýå', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fÞw½®á>˜R;u_a'),
('!›”È@|˜4«°n­ô', 'wp-includes/class-http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©)#ûÓ6\Zïzû­›}Lÿ'),
('''Úž\0;¾¿?Ã+VÒªÎ', 'wp-admin/network/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rë^ YÂ&Œ—;^ üÒ\Z'),
('6H6Ï8”HñYÕ·Õ(h', 'wp-content/themes/twentythirteen/content-video.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±xB•°\r\Zå•Î‘d\0Lä±'),
('Eø&¯ÑVN®³‘"N', 'wp-admin/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß·G³càÐÅ·¨ºÚnü'),
('„ló¿g<Ðë¹É=Æl‰', 'wp-content/plugins/akismet/class.akismet-widget.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬/Â"Ùk<)¼ÇK„ ±€'),
('‡mµ¾«K ¥%¨±ÄA', 'wp-content/plugins/buddypress/bp-core/bp-core-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºC5Q^S²ÎáwY­×'),
('‘oÙE1hÞ©TæŽO(¯ý', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ChefInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't—&ïr@;…ìæfà€'),
('œÛã&§?Ôð)2Û›\\†Ñ', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-components.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tb…Eí».¼_Œ9}‘ß'),
('µøÓ²Ð"ú]hS£qì$', 'wp-content/plugins/buddypress/bp-core/deprecated/1.6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…AÏ÷~ôÂ\r‰>/Gš'),
('·P\0''Ø0l§Ÿ¯vÈ#J<', 'wp-includes/js/jquery/ui/effect-fold.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õ…JH|!ƒy³à>UÏR'),
('È„”ÎÓxy¨åõ‹Ö', 'wp-includes/js/tinymce/skins/wordpress/images/embedded.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õª pÝN¢Öy~Ãn"'),
('Ï´ 3P`#8^ÝÖZ', 'wp-admin/css/colors/coffee/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YOYš]‘ÐÀóua§'),
('Û|ó zÔ\n}p`jÙáÍ', 'wp-content/plugins/google-analytics-for-wordpress/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž½ôyµÿ¬ ‡­p'),
('öÞGž\ZPp\ZNÚU©´b', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß=”¢°)µpv”÷øxÐ'),
('"’ŸNß¬jj)…Ÿ\0Œ•N', 'wp-admin/images/menu-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jGÿõþâù{¿>¯^;$‚Ó'),
('<BÙëa^ØD@^­)j', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-dependencies.php', 0, '[G7ŒfZD)õ°àfG^È', '[G7ŒfZD)õ°àfG^È'),
('Z‚èdÔÿ×i˜X•gö', 'wp-content/plugins/siteorigin-panels/js/styling.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Néªç—fœº@ä–W–'),
('o	CBº~CŽÝîwO™­', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uãN(zU''êIøxždW`'),
('tZQ¥Yz0…ú½ßè·«', 'wp-admin/images/wordpress-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ°ùy¹æoÃ8ôË8S¥`Š'),
('|q¯´ÖBl€mrÚñÃ0', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-template-check.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ržŒøß»rñ*Šgçß=q\\'),
('œý—k’5SHåÐçÐ«', 'wp-includes/SimplePie/Author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4€qí_ðA‹%–Nw£1'),
('¢ØÀeßbWüA0Ïd', 'wp-admin/images/comment-grey-bubble.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y*''´‰°©tÀ¶²F'),
('¹29·`í#0TRô¾|Ÿ’', 'wp-content/themes/twentythirteen/content-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ã:{«I0—bóLå…K'),
('¿‰c€Bçm)ÑcÔÐª‚''', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´7J%ÁörúøŒz´]ÞN$'),
('î0û›¨ÍÄ‹û6\Z\0>', 'wp-content/plugins/wordpress-seo/js/jquery.qtip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V4&ù¸@åÑµnh'),
('õ©O­X²–Æ\0ú7ØÈ', 'wp-content/plugins/wordpress-seo/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä>ŠAŸ#ö=Îñ!‡ì9'),
('§#Ô<G}¶\ZÚ…mƒ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/profile-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U9kÏ¢ž\\ÿ~ä%ŸÂn'),
('M™ØàKµ ªù‚Ÿ·', 'wp-content/plugins/woocommerce/assets/css/_variables.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ù­6r\r’´H8Ï®S'),
('"Ñ}­%ù•xðR:F·Ûî', 'wp-content/themes/twentyfourteen/featured-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\¦\Zïûú›Îx“˜ÂÐä'),
('/a×Ra/›ø+;íY', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/header.php', 0, 'éØÒ™OJ‹3´¦0ŒÊô', 'éØÒ™OJ‹3´¦0ŒÊô'),
('KØêÉl}\n*Jíá(9¸<', 'wp-content/plugins/woocommerce/templates/loop/result-count.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®sèh²%¯·ÐËï2>'),
('Q¡ ·Ô(;Ø |~R8¿b', 'wp-admin/includes/user.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«%A\0`«6;	ƒ·—º'),
('k5@¹®ÏØüuèU', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_AuthNone.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£”kÏ‹` ’ÖDÞá&bh'),
('zÏS²úÍ¬€\\Ó/ùêŠ', 'wp-content/themes/twentyfourteen/js/keyboard-image-navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g™£ÞÇþØ!²Ú˜::‹'),
('“—¬%bQñ£“bM<Öx', 'wp-includes/js/imgareaselect/border-anim-h.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZÃÄ,ÈntZ^6¶{Lp¡4'),
('—ÅŠë`ö7§þTê³a', 'wp-content/plugins/wordfence/lib/menu_whois.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&–:©„ÿouì)/n6'),
('Ñ§›_ƒ4a!¢F¤ñ', 'wp-admin/css/ie.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}K\rÀv1F:xqBÏ'),
('ÜEÅ,×ë³ZŽxAÏå', 'wp-content/plugins/wordpress-seo/images/Premium_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×!§\rÌs ËµãT\Z²í'),
('ð\0@„²Ñ5\rB', 'wp-content/plugins/woocommerce/includes/class-wc-product-external.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dk€¤€õEˆ+Ã:‰¶uÔ'),
('ü«i)33Ü¥ÑÇsÚ*', 'wp-admin/includes/class-wp-ms-users-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÝ³³í\Z³°œpÒ#Gô'),
('j«æo¤+ˆ±sÛ7Û8', 'wp-content/plugins/wordfence/css/iptraf.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+	Îæë<¼dq…7^³'),
('51¸y}E£Üø`§', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pt_BR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´0opKº¦Ù	Ôz•Ý'),
('BsÑøõ^•6uüSÜp', 'wp-content/plugins/woocommerce/templates/single-product/related.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VÀ4‡ùT˜¨[ÂVáhÎ'),
('_¤5{yS”B qeÜD', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/GravInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@°•|\\ÆÆB\03CEÈ›ŒH'),
('½½“#­ùÛ	>û7', 'wp-includes/js/tinymce/skins/wordpress/images/pagebreak.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äIãÚmÅ…üLWyÝ“H'),
('¾Ý–@ºŒ¨N”¦ _n', 'wp-content/themes/twentyfifteen/js/color-scheme-control.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g½¤O:Ë]ÉÁ¼ÆX„Û'),
('ú®Ÿëõ›DÐ½y–ZL±', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡0¯Q¨-{JaEºQ¯t'),
('ÿÀ™”ÉŠKî#"Pæ', 'wp-content/languages/continents-cities-es_CL.mo', 0, '+²b”±=%ø*ÛA´', '+²b”±=%ø*ÛA´'),
('	äí?0(Áœ‰J¬ ', 'wp-content/plugins/buddypress/bp-xprofile/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î¸:ÖN’r÷×VW6®$¬'),
('k˜‘²Ðb…ÉgSˆ', 'wp-includes/js/tinymce/plugins/wplink/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½Ÿ,n^¬©ƒ®ÛÙ]'),
('k¡Qá;ëâÎäˆ 9FN', 'wp-content/plugins/buddypress/bp-settings/bp-settings-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÜÐ.CáEÐ#ÖDVQé;,'),
('}m×šø:Iôá–[BCU', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page_header_bblogo.png', 0, 'òæŸ½®TéG.	´üzq…q', 'òæŸ½®TéG.	´üzq…q'),
('ŽÜ£èÂÚÏL’™¿m', 'wp-content/themes/twentythirteen/images/headers/diamond.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':É´’çžô ÍÁå‰7'),
('¦±–ëg„~Òw\ZÐhh', 'wp-admin/css/themes-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J\Z\\mrÆPgP›Ž ÊV'),
('Âvˆ|Ð¼DF¸ZUŒÂ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PiwikInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó…uÌŽ¢¯#!?5—'),
('Þåý¾1d§šà*ŠÝf.', 'wp-content/languages/themes/twentytwelve-es_CL.po', 0, 'ÔBùö¼¼çÌ*Ú:Ñ', 'ÔBùö¼¼çÌ*Ú:Ñ'),
('	QW¯ïŒˆ~-Ê\0dÅ', 'wp-includes/class-phpass.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#ÕFDPú\0\ZÉf—GçÆ§'),
('	?±Ïä†æÛ™q™uM', 'wp-includes/js/mediaelement/mediaelementplayer.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(¨¢zªõâ`QN§Ýô	'),
('	å&)DcUÂÛJœv÷WG', 'wp-content/plugins/woocommerce/dummy-data/sample_tax_rates.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';Bõ‚ªtÃ¹o›Jåt'),
('	¸ÍÉ°çŠŸ¹«¾îA', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-driver.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Êº…Š§0™$og‘íuH'),
('	,¹©/Õ•‹!ç›gyþd', 'wp-includes/js/media-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NFXÑH«î³Ò6k•\ZŒe´'),
('	P=N>Œ¨b"j:~[Q{á', 'wp-includes/js/tinymce/plugins/wpdialogs/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷®Ë[ß¢‡9î ¤˜ÑZ'),
('	XÎt\\4vNI5‚ØjËÂ', 'wp-admin/async-upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø<Br?d‡T''‚‹Zœ0X'),
('	¶EôqyGbÍC’ÎŒ½', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('	Ö9„ƒfÞˆUœfòþæœ', 'wp-includes/js/tinymce/tinymce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óµF×¾@*u6Ù|hÏÐ'),
('	éñÏÛ09÷-b±…Í©W', 'wp-admin/network/users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nÙ]½Ì¾õ6“£V&u»'),
('	õ.1ú6llY˜ß"2Rì', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' £ý–áÀéÜk½®á'),
('\n†Ô°ýíÉ_\\cc5îI', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}xä9·ÔtÉî{±Ý¿Ý'),
('\n5rÙ0ÖâÂœ`Åö¿', 'wp-content/plugins/theme-check/checks/worms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üµ›69p.Bœk¾f|'),
('\nf†‰Y¡·4&üLð¦', 'wp-admin/images/se.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÖÈ”BÃ`½Ú.}''7:'),
('\nl—±k…¿Ãý& x', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/interface.bp-options.php', 0, 'ÐÅåZÑìÒãª#Éú', 'ÐÅåZÑìÒãª#Éú'),
('\nlšŒb£ÿn³mB3\0?', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-frontend-colors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0È-‰¨¿3£nb\Z”Ó'),
('\n~Ó7>tµ«U!	éç', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/PimcoreInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§;¶„1‚¢cHç$Gš$½â'),
('\n“µ‘b-ÓVø:ˆƒ|mµÿ', 'wp-admin/edit-link-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i-ÜEŒ×''ä)^Pú'),
('\n“¾¸‰ü¤©ñ´EÚÌdé–', 'wp-content/plugins/woocommerce/assets/js/jquery-payment/jquery.payment.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üï¤ gT1‹XID*jÞ'),
('\n£ÜNNM¼ÔÛ‘4;úpÐ4', 'wp-includes/js/customize-models.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'OK….†q;ŸtçNè‚\n'),
('\n«dÉ[z÷¬©dòá\ræ|', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eÑ®îxMQ€<óár<'),
('\nÂOÁ°ëgö	-p¾¶GT', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1Â“Yª%à½ÛÕ¹·Ö'),
('\nì®“ºá''e	PwJv%ã', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ûz³gäÃ…‘¾m~—˜v'),
('\ní¨”M¢½ûò,¢ö«6u§', 'wp-content/plugins/papercite/lib/BibTex_pear.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3¸dë)ÔÏÂ¼L³«p•'),
('\nô\r£Bƒä®pÌ­', 'wp-admin/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à}1Ô¸n]Ž®Róø'),
('\rB³wœŒC5TG(¦E¤', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-footer.php', 0, '¥Ï°+«©(î„ ÔÎ<dÿ', '¥Ï°+«©(î„ ÔÎ<dÿ'),
('"w%â_ƒ„K\\ áuË', 'wp-admin/images/wpspin_light.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝNmÒh§äÁÅ;\Z@’Ý'),
('&cµYDØ#èP{+¢', 'wp-includes/js/jquery/ui/effect-blind.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o²d-Žµu§–Ë>’æº~'),
('>-ûiLw†n„ƒ$ðÈD', 'wp-content/plugins/buddypress/bp-activity/js/mentions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*Ž[\ZEÏ¶¾böÁÆF¾Ü'),
('}›!rö¡,¨t.\rh»', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž.6kg‡Z\0©{ï'),
('ˆ\\úr65•îoI	¿œm', 'wp-content/plugins/woocommerce/templates/checkout/payment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿSw¼Uñé9mJ\nƒf('),
('”ˆ¦,H(bæ_F”O', 'wp-admin/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P#ßæ''¼þC“j¨[Ö¸Q'),
('œ«HVÕ¥½dà³pÕVp', 'wp-includes/images/media/spreadsheet.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñÀ 4äñÖ\0TüÞÌ‡?²'),
('¥F»¯¬Ùp@[\0Ôgó', 'wp-content/plugins/buddypress/bp-core/bp-core-caps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"º¦Û‰äoÀ2™©å\r'),
('¨uQÖÆ»Q­Ô ›×', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W”a`×(o2È˜„ámð'),
('¬8¬¦ÌÚüZo}3\Z', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8Ä—ï(æÝ2Ð©²ƒÍ {?'),
('¼Ç¨•`Ér÷]›ª²h', 'wp-content/themes/twentyfourteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²4îMiõüäHj€ý¯JBc'),
('ñåèaj\\vÍ,Åã\\n[ã', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/mo.php', 0, 'Dÿ©j”áû®ã€´’¤t=Ý', 'Dÿ©j”áû®ã€´’¤t=Ý'),
('òc"ml ÿÇž>o', 'wp-admin/images/wordpress-logo.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´A/yD›eßçnùÑè'),
('þPÑUÝQ&sÌ9m¬¢©³', 'wp-content/plugins/woocommerce/templates/cart/cross-sells.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Qâ3Ú€f¶Ó"Ü­\\’€'),
('uééí%®»aNƒ¯îX', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/AccessToken.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ës‹;¹&07 ÌÕ'),
('NTéÖ¥–ŠuÄVµm', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Wÿ›ýoâµ´e.râƒ'),
('{çMŒ“i»i2n•Ã6Ü', 'wp-includes/js/jquery/ui/effect-highlight.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eØqþÌÕvfî£ßFD§à'),
('áÛÎ+	rË§kØám\0³', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-layered-nav-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Nˆt\01åhÖJšã˜`Îµ_'),
('ò›v…¿,ƒÝÛCÄ(Äƒ¥', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-recount.php', 0, 'mXà¨xM¢–­k±æ×8)', 'mXà¨xM¢–­k±æ×8)'),
('\rFŠBŒŠ(ÝÙ„\Zº', 'wp-content/plugins/woocommerce/includes/class-wc-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËèÌ>{¤l:W¢±wž2'),
('\rîb’ß©¡={‡ ¬½ù', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-download.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Él•±»{øþözÒìm0Ä'),
('\rYGV˜¯÷£¾IÃ?ŽŽ', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?ûâëÙÁB©à¾^ÐÈy'),
('\rfÖãBAcØ¢ñŸˆb§ú', 'wp-content/plugins/buddypress/bp-forums/bbpress/tag-add.php', 0, '¶`•ÏÓÇïìñÈ…Â}Åw', '¶`•ÏÓÇïìñÈ…Â}Åw'),
('\rskž&+ñÝ&\nTAc', 'wp-content/plugins/theme-check/assets/gray-grad.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Åý•¸ÞÄÛ‚/©£÷¹-'),
('\rxÝ^´§¿\Z ƒ½<;', 'wp-admin/my-sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i0Nôx©L\rúºÊY]'),
('\r†ÜËµ/ÿK¶M2³$_1', 'wp-content/plugins/woocommerce/templates/myaccount/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ–6Ô«q²YWÓG'),
('\r‹\nÉv<Æy\rÞûOF½©æ', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/Generator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A}øÀñµ\0À”ïvóp<ª'),
('\r˜Ò§xOzäâ†÷z‚¾h', 'wp-includes/class-wp-customize-panel.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')fšyÓö×%‡£@Ðºu…'),
('\rœ:‰:‰ìõHHù:d', 'wp-admin/css/edit.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O"½«Ë+K2óæ/‘;'),
('\ržAÈtµZrr’\ndÈÑÍá', 'wp-content/plugins/woocommerce/includes/class-wc-countries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Lž‚"yz‘Äžvyú~4IÖ'),
('\rÃ%ÛáãÏ%¼ySý`ð', 'wp-includes/js/crop/cropper.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—²–ÙH.sÅo¿ö¨â'),
('\rÊª“Áß±ä¬È„Œ4>Š', 'wp-content/plugins/buddypress/bp-themes/bp-default/editor-style-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'RÏ«|&H“KÅiw{\\'),
('\rÑª1s1=¬¡`(˜y', 'wp-admin/options-head.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºÖ•`^m°N@\nTof~·'),
('\rÒ9ì~Äï›)¼Ehöý', 'wp-content/plugins/woocommerce/assets/images/help.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õQ5j«l)“¢\r)·¹'),
('\rï¶G$™Pk¸¿WÌþ‡?', 'wp-content/plugins/wordpress-seo/css/jquery.qtip.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o¡·ÎÀ½É''Éöb÷Mß!'),
('\rõ;*ÎLøû…ê¦¸hP', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/google/text-class-api-google.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v@WÂÉ3Í¸n+=iöz'),
('\0óÛÜ&"5wYåõ8´À', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CroogoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AÃvE…‰"¹Â™M\\ÙñMÃ'),
('¢~ô	;àý\\™ÈK´', 'wp-content/plugins/papercite/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Þ“¡ÁÁþ;ý[„ÁVÀà/O'),
('LÅ:»ã”tWc•', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Chargeback.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü‚t·;ê&@þÍ\n>—y¬c'),
('#ç–­Û­ªv"þ—M¼', 'wp-content/plugins/wordfence/lib/wfAction.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@â’Ó_Ïí­…òµÉ>js'),
('V­aúœ3QôYû$e', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/app.pot', 0, 'óa˜ÕŸ–½¸‰¹ëo‚', 'óa˜ÕŸ–½¸‰¹ëo‚'),
(' gUg#	l=J˜Žô', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qÒ³Ð|…=\Z¥\\o³æ<'),
(';íé°àPç‹o6È4E', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³Ä1ù¬¬)¡t.%œjtm'),
('NŒ–E  ªÄrç`[W&', 'wp-content/plugins/buddypress/bp-xprofile/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1½‹|!=èIA'),
('XÿæHå¥¥(»:ÈZí©', 'wp-admin/admin-ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Œ¡ V²pØrí.n '),
('go¬sœVã£;íÇÿ…\n$', 'wp-includes/js/tinymce/plugins/compat3x/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=´\\©-ÌÅÇìe«¿‹U'),
(' ’E€ý|2''¨Xžlú', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-formatting.php', 0, 'z)Çûm¶FÊi¨\n‚ú´Q', 'z)Çûm¶FÊi¨\n‚ú´Q'),
('‹Wªž-•g¤Ê³øUÊe', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/jplayer.premium.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u˜´? „÷·Æ•…è€2aâ'),
('˜$~ÝõPp©{<‡Õ% Å', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦2Dt–Ùš•.o¨˜Õ'),
('Ì ‡ì¡CªY–Žñ', 'wp-includes/pomo/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëŒ}ÛL–Ç¼Æ¢ÒvÂ.'),
('Í>ÿMÒ8¸ Ùµ­Ñ|', 'wp-includes/images/crystal/archive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–SÊúðŽœÌI0Anë'),
('ëå"\rJ\04°¹''i´', 'wp-admin/js/password-strength-meter.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M‘(F—VpÉâ#*ï{´'),
(';ˆ&œnb±ËiÞÙ·©', 'wp-includes/js/mediaelement/silverlightmediaelement.xap', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/±¼\ZÑÝThšy´ÏS¬'),
('LBëˆR.Ã²ÊQáO(Ÿ', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠŒçúÁ‰y''=l&Ñäj'),
('O§ÌZŽ%õl×[ÿ', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê˜˜22™Y8n€(>êÎÝ‹'),
('\\Üàã”·ðAV*ç±¿', 'wp-includes/js/jquery/ui/slider.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'OpC/Y_­ãÅ3™q’…'),
('h7ŸŒtKæD}¼ì¯	', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/style.css', 0, 'ÁðZé´¯1¹ÞñÞN]=', 'ÁðZé´¯1¹ÞñÞN]='),
('ŒúuŒ¢Ý8u+LÎ×ï', 'wp-content/plugins/theme-check/main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x)²ZÑâ¾	qLãqÙ„È'),
('’ò\nÅ®?Hoº¢=´S_', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-writing.php', 0, '+-Þ¿&°7qLO¡e', '+-Þ¿&°7qLO¡e'),
('šÔ‹Ë¯½; &›È|/¥', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5e¬]îñÔlÙü$€œlä›'),
('Ÿo‚êåDÎÚqq¾Ð–', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/replyto_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ç]"ˆü{_8Œù|ô'),
('¢Z÷¼œÇCµP@ê`7', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ–Û’»HÆ¹íúFZó'),
('¤¸ô´øÀOMÝ)Âˆ¹Š', 'wp-content/plugins/papercite/lib/PEAR5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ZgÕ€	7*l¼ÝÖ8±(Ï'),
('ÇÝ¡=½½Nx¼‡KÔ`*', 'wp-content/plugins/wordfence/lib/wordfenceClass.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðôÞ@¡ÜÈì–‘_¸Ÿ'),
('éë·Žwh\\Xs‡±èl', 'wp-content/plugins/wordpress-seo/admin/pages/network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½Ì¯\nÚÿhØ(ÀåL,k%'),
('\0õª]Àaðv•”¾CY', 'wp-includes/class-wp-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AØ¥£Kî¬<\nÐ‡	ö”L"'),
('“¢þNVÔ±³æˆzÃZ', 'wp-includes/js/jquery/ui/effect-shake.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íh¼&¶@çÜ¯n2ê=4xí'),
('AŒÙû¬lß¦’\0„].', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xLh.ì6ëá³	ËIç('),
(')Ÿ_æö’J¯‡×™Ô', 'wp-includes/js/media-models.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'öm¾MìÚÈ9y‡k\0#ç'),
('`™&­¸é”¥~K3/d', 'wp-admin/css/login.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•sIº|ü7óK¦uMÓQë'),
('¸œÒ‘-èÌôŠ\rŠ{,ï', 'wp-content/plugins/wordfence/lib/wfCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—V†Îÿ§^{ÜÚxñ\\'),
('“~˜âLÉÎ*Ä,Ä<:¥', 'wp-admin/includes/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê—Y¤<ûTØ¯ŠU´'),
('¥‘ð”ÿÙ·(zßðfá÷…', 'wp-content/plugins/siteorigin-panels/css/images/wpspin_light.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'GÀØ¡®ZXA•wã\Z¶®m'),
('®SxÃß4®@oÁwïN', 'wp-admin/js/widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–‹•7¨þ*ˆ‡¤¤‰77'),
('Á¶ZÂ`§¾x™ÀŸã.j)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_PemVerifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô€›âùë/$7¡L©ç8'),
('Éèë:m¡°[Ý¢¯:#', 'wp-includes/l10n.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B,FNn##ÿÂ{šßg'),
('ÏI¢Ø\\j¶¬ÑxÌÍËg', 'wp-admin/images/date-button-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')R“,$kù‚„)6C¨»c'),
('éáæj7r[¼,”ÌüZÖè', 'wp-admin/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðt¢ñ¢šîa÷Zö,”'),
('äüè’ÙSqf+¯7r¬¥', 'wp-content/themes/twentythirteen/content-gallery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'º,|å£ÒˆÜ9Ô@¼$·'),
('ñC	®éØÌa ÈíIK', 'wp-content/plugins/woocommerce/templates/emails/email-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ôà\n­¶^Ä-wjª?Ø'),
('- M2º\0ç×%AÛ‰', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-de_DE.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›Èà£yÌ¶ßü|œéìa'),
('D©8hFÞ›BViRî¨', 'wp-admin/css/colors/blue/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…däcÕ§ºü=¿GSL'),
('J9?Å+‹æQÓé´µÃ', 'wp-content/themes/twentyfifteen/genericons/Genericons.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½&twØ4·Ð‰”pc$'),
('iM²àù*Ó''ð|0R', 'wp-content/plugins/woocommerce/includes/class-wc-validation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uJþÐÐŒIrý-£Þ}äZ'),
('j×»ý‚óq.»*;§á2', 'wp-admin/css/colors/sunrise/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ui¸¢‚.Ð†ç†E°ÉñÞ'),
('yÇ,~''Fàlð	/Ã', 'wp-content/plugins/buddypress/bp-groups/bp-groups-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"Hûâ‚{iö;Î“ P'),
('œZß1h¦Šý–‘ŒN3Æ', 'wp-content/themes/twentyfifteen/js/customize-preview.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àÙtµñ?\rÍJ4¼ÅaÃ)'),
('ÒrˆWê®3¨™ãá¥¾V', 'wp-admin/css/color-picker-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rO‚díì»Sï<6$¨'),
('ê2åâ°ªì3€f	Höù', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ûz©ke¿·7Xýk´'),
('ð VÃ˜øþø©÷àÈ', 'wp-content/plugins/wordpress-seo/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PoNr|‡P2/y†ü‹'),
('ßÆº¼€"0é1\Zc‡', 'wp-content/plugins/wordpress-seo/admin/class-opengraph-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9î‚Ñ¦‰óE[$<š‘h'),
('1]LÝû\\äîÛ¡', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-admin-report.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'îìÃ4)òºæ?\0Túý™¼'),
(':²Xæ2ìMÓþÖ~ûÈ', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eÝçž¸ž˜ª¾gú_ëÂ'),
('LÖÄüý8àï€õ\\¨Ý¼+', 'wp-admin/images/imgedit-icons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',ãî''ƒ£6U¦½ýÃÌát'),
('j”+=ºd›KCM±\Z…"', 'wp-content/themes/twentytwelve/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oÝaãÕ]»zèKOO>È'),
('pÛžÔ2N<:Z¥7»r‚', 'wp-includes/js/tw-sack.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹‰¥½„öëËÁ9>Àæé‘'),
('uŒ)8FG9¡C°(¶š', 'wp-includes/js/wp-ajax-response.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÉxÉi˜->Æ\nˆ\\33r'),
('‹y.Ú	öuÑÊæ¥*…>[', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûLzs#B¤uÌq`lŠ'),
('˜$âÞ†kµîÜôºaˆL', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-universal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾»~V²Iuÿ?¢7zÛV'),
('¸·áClo¦¶±–¯éÒ', 'wp-admin/nav-menus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çGÛñ©—Ì×Ó‡ÏÑÐ'),
('»évÝï8²iÌÂ', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/pause.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü¼~¤q¹¦Ï³W\Z0oÐÆ®'),
('Á)\n?Þ‡ê>¡üÜ0', 'wp-content/plugins/buddypress/bp-friends/bp-friends-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ePüÄ°®‘X¤ÉúûêAˆ'),
('Ê‚-áÿõ‡=üêÎ¥¢§', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëin“Ö`ñ–ÙdÃÉ’'),
('ÿ´-¹†i>bsŒ›1é', 'wp-includes/js/jquery/ui/resizable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âÔ«\ZfÁìvÂá|Çà'),
('''8''»)öùžBZ`‹À', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü¾ÛâÏûÞx¼µBŒå?'),
('4€JÇ-<O³iDfü.‡', 'wp-content/plugins/wordpress-seo/admin/class-yoast-notification.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'DI­£&k”é£1 M•M '),
('DÕ€×R½oe&¶WLäKV', 'wp-content/plugins/papercite/format/ieee.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':QÚÔû2}íÇ¼ª—œŽ'),
('_®YÍdìpÓÑ¾tò=C\n', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/screenshot.png', 0, '›ÓÊ¥Ql{‚Ë6Ž ið', '›ÓÊ¥Ql{‚Ë6Ž ið'),
('b7%(óº¬F9…''LuÀ', 'wp-content/plugins/buddypress/bp-activity/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yUD''n³¨%"¬#?Ìä'),
('uƒ!öÜ>½)©®<Á', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/RedaxoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘F[|.Ó1×Ðxë	&XfN'),
('ƒ¶4rèˆ%ÞãÓÉj¸ž—', 'wp-includes/SimplePie/File.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®º­kU‡6ê\n¯+ë)%·'),
('ˆÞKS+¡e×ŽA†@“Š', 'wp-admin/css/colors/light/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ¨V{§”)\\_~Ùàq·'),
('˜ùë&rqúož%Ýñ,', 'wp-content/plugins/woocommerce/templates/loop/add-to-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yèÅv;B?Œ89M<p'),
('›» ÆíFe±	57[é', 'wp-content/plugins/wordfence/lib/email_newIssues.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø)òcÿC¿ˆA3Ø.ÇƒÞ'),
('Ôfgk9,J8j\r•iFð', 'wp-content/plugins/buddypress/bp-groups/bp-groups-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈJ¥²u.ß×ïä¥-¨'),
('úU’8c¬vDõ¼', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸/ä-E¥-U4â;ö'),
('j¼žöÊ''ñ¹c9…k', 'wp-content/themes/twentytwelve/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã Ÿm¦Ü‡¾Ü-\n¡…§Þ'),
('Ã³YT%(öúÓPK÷±›', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'IÞƒ–úÁü–êK]¼o˜Ò…'),
('%¯\Z½²êÇª9××', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Webhook.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€	¿¸2]{?ø\rLŽ¬'),
('2Ú%}°ù,Îëö³3|â', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-fr_FR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B~‚|rSZyV¢ËX[‚\0ô'),
('q©²Ñ<¶â@8äŸ‰|ða', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/notices-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³tíÌøÂ	×KªiÖ6™D'),
('q²–muèå’KÛ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('Ÿ@"§:½»!™éhHë', 'wp-content/plugins/woocommerce/templates/emails/customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ž9º9\0’™‘ÈQùÅ±òo'),
('¦[ãýì¡vÞk¦‡J7', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4¥$#é°ÌÀktÝfx'),
('Æ¾ý%6Ç—³\0¶Nm‘FN', 'wp-content/plugins/buddypress/bp-themes/bp-default/onecolumn-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Õ2Ú/R°›~®obKzé¾'),
('Î¢ƒSËªÄ\n´–BáV"', 'wp-includes/fonts/dashicons.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~›)xäŒ‰ùœ[ï¯wø'),
('×Gþ†·8eü‰@š=', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CodeIgniterInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûH‹Û=ªuÍ]R9ÙÙ'),
('à_ìçq·éþM8¨Y', 'wp-content/plugins/buddypress/bp-groups/bp-groups-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AŸõp"XÁŽÃB£s}JÛ'),
('ù±]üÝÜ )¹¿\\õé', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/compose.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þóß´ 6‘ˆÁ\rÙ¢¦Û'),
('»8a’š¤R\\¶oÚ1', 'wp-content/plugins/buddypress/bp-core/images/mystery-man-50.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r1Ýao#®å<÷ºn¹÷'),
('˜¯Ü¡9îu_\\\nÃ9Á''', 'wp-admin/css/color-picker.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ãù|Ÿäw~“±#Q'),
('ÈKUõg0MU¿/šöÊ‡', 'wp-admin/admin-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãóga¢ÍÎc3­aq½'),
('ü ''Ûún1yŽ¥T', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÕÜ"4r_#h''*Ï´'),
('$Á¨Ïƒ)×§ŸBË ', 'wp-content/plugins/woocommerce/templates/single-product/product-attributes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ýù0j+K~9ÖÆÎò±\\h'),
('4;VÏô''Œ/¶òæ¨fº', 'wp-includes/js/jquery/ui/effect-scale.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇÜåEÝ{9òáTÇ¦Ÿá³'),
('PÇ1\r½e\07÷FŽÉ)Æ–', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-coupon-usage.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë\\x¬ªq‰¤ö~T°üÍc'),
('Rí» @ð%U)pŽq*', 'wp-content/plugins/wordpress-seo/css/taxonomy-meta.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µøbGå‚''R…^M:÷ø'),
('_AÑ&‡—×#GêÁ¨"', 'wp-content/plugins/woocommerce/assets/js/chosen/ajax-chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è@Ÿ[*qý>«ªØ•QÒl'),
('}ð¹ö´fl£u¤ãµ_þ\Z', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-es_MX.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÛÃ\\jäëïésœk'),
('ÛÞC\nŽ—äU¾„ü', 'wp-admin/js/custom-header.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2³\0X‡¤Ë`oìÀœuf»'),
('”[EYÁbÇŽ·Ö)±¡', 'wp-content/plugins/theme-check/checks/dep_recommend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^l“À±Äjí£#ÊöÚ%ô'),
('˜L·2j¢>Ùa}W½Ô"', 'wp-content/plugins/woocommerce/assets/js/frontend/cart-fragments.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°²þœ\n.<*¡Åö'),
('›T¤IÙçžªBQÃ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/favorites.php', 0, '\Z’¼M{I$\rD_Hÿxñ_	', '\Z’¼M{I$\rD_Hÿxñ_	'),
('¤Ê0l±ÝjÆ0+%ò', 'wp-includes/SimplePie/Source.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Žƒ»ãàðS{³*Œ–ÿ'),
('Õ’çÞdÙó»"êSI', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-low-in-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y”¿Æ½g|''ÅU&''}~'),
('×÷äçUíÙÈß,', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topics.php', 0, '¥ž]w*‘BM{Þè3Å', '¥ž]w*‘BM{Þè3Å'),
('àÐ:Ü³ªŒ½gž', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/grouped.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°KÕ*°òŸú†n†Œ['),
('ì\n6F²G‹ü+\n—P;ú', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/profile-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3‚?¾qS„ñ>±Ð–Nb='),
('û÷Þçª’·u£¡\rZJW+', 'wp-content/plugins/wordfence/images/help.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$NÇü;''ý‡MÏÏùò Y'),
('ü)§£™Št\rî,½JÚ¼', 'wp-admin/options-permalink.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆtçÕ!ŒWq·_^s:RÏ%'),
('=oE±,Wk&5Y"‡', 'wp-content/plugins/buddypress/bp-activity/js/mentions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òÞ ­¨7†oý^gætÁEd'),
(',„„îF¼o„V“dY‹', 'wp-content/themes/twentytwelve/page-templates/front-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×^ÄøÇæ&†Ù[Zƒ'),
('EL<CCj.Ñ©òáENB', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-arrows.gif', 0, 'ø‡.¢RÕUwïøŸ÷ÇMÌ', 'ø‡.¢RÕUwïøŸ÷ÇMÌ'),
('Vf6A“­]0éî"³óƒ', 'wp-content/plugins/woocommerce/assets/css/reports-print.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û™W\\ÌŽô*`Ç¾è£'),
('Wl…Øy:Ï\0Vn`„d\0–', 'wp-includes/js/tinymce/plugins/wpview/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?N¸—ÁÑ¯ŒßÁ€Š"'),
('{Çëº³¯òxEMxq€à', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/gui.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á—E\nŽÄ|óÎÜÞ9ˆx'),
('Œ,4#¢…(ç#', 'wp-signup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F¶áê¸*ÉI\nšgF„t'),
('Àífº2eÖ³…f¾§r', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/slate.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f1ä¼6¼*œo”&—Þ\Z™'),
('Ë6UÊ¶aþÊ¹•¬', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?.¯=ÎéI”ói\nýMÇO'),
('\Z  Ä}(Ïº¼L…@\n`', 'wp-content/plugins/woocommerce/includes/class-wc-order-factory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M¸Êt0Ïa(ÐÊ›¹aÈÈ'),
(')ûÄŠâŽ\\š²Œê´', 'wp-content/plugins/wordpress-seo/images/banner-news-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ärâ|f«¨hQ€­8N'),
('S÷g|NlŽ$Àæryà', 'wp-content/plugins/buddypress/bp-messages/bp-messages-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W\\—T˜|ƒì®ICô§'),
('_¢N>/2–í©ô&¤t', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-website-review.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤¸±Ð)3,@ŸQÿ®'),
('`¹¾Î¦O²°å¥€”HÒ', 'wp-content/plugins/theme-check/checks/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.\0Ý2MÂÆåDÝÞïÿÇ'),
('wËAÉ/	¢ÿþ»Ä‰\\q', 'wp-content/plugins/wordfence/js/jquery.colorbox-min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4?JÇƒ³Gý`’\nÖNÊxl'),
('xür{¡ÆCéfD™!', 'wp-content/languages/plugins/akismet-es_CL.mo', 0, 'RRL¬6õ‘I!€ô¢TÞ¡È', 'RRL¬6õ‘I!€ô¢TÞ¡È'),
('ÚR¾ N+`gVOŽ¦Z', 'wp-content/themes/twentyfourteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NþOG(v!$ŠuLùšâa'),
('£lQk^GàÏ*0z[U', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/gui.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷ø\Z<gGš$ÀÒ…Fç¨-'),
('©:8ÏIaö¹Ã¸lÕm', 'wp-admin/includes/class-ftp-pure.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',ý\\.BˆÎö­ÛíïøÓ'),
('²þ£²KqMÃä{ƒ±»', 'wp-admin/css/dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hå9“±íJB¿(@æ'),
('ÂTB›¤O>ßv2íî}Ea', 'wp-includes/SimplePie/Locator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€s¤ÆÚ³;‡uvf^õêµ'),
('Ã‹\r‡AšßW-q43ÄÃ', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.bgiframe.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ§’™(„6#2ù–9c¦'),
('Éyò$n#\n¢H{™¦', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/friends/requests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F\rjYÝs¢=t–% ;'),
('Ómò‰ÜjgÝ.ØåP±Ø', 'wp-content/themes/twentyfourteen/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fÚÓ2"ÙzYlú/œ¶ƒ'),
('äùdÙþ}¥ÇÎ¸™*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/style.css', 0, 'gV¦7¯ÀÜ-÷ÄèC‚g', 'gV¦7¯ÀÜ-÷ÄèC‚g'),
('ùæ]u*Ó''EYß››!', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhook-logs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šD‹îŒËünf'),
('+Q?af5ŠLŒü', 'wp-content/plugins/wordpress-seo/inc/class-sitemaps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷ir«ÒºäaIÑ''%„þ‚'),
('6ŽX‹–3ñèøàck0-', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's ’ÉF	xhËÂüB'),
('F«ÒeÀûÖ}í(·å¿', 'wp-includes/js/jquery/ui/dialog.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F‹ëÌâ]âþØ>ý'),
('G UÚ]´0#,ýL’', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/external/URITemplateParser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü‚ÝBHâ¼Kø;û^iŒ'),
('Pú×•2yð´ùU½j@', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
(']¸«³e-£E×Øßq+–', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_psr4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý:\0ðÑ>²—íØÇ}LQ\0'),
('µÛÂr6Øóvr·é!ç', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/change-avatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„øþÁþ4ó<­j%ú*'),
('êiôFÎh<Ž}Þ‹T', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-notices.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªŸy¦-Ç·¬¿…ìm¡'),
('\0{fž^Xþ¢\ræbV-', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WHMCSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨:x«‘ëœ+x[·Ä'),
('%h»s+Âœíïƒët˜L', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/password-verify.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LCðiÃ‘82~v“Œ¾'),
('\Zç–×‹>\Z‡mµ k.#', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TYPO3FlowInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’Íö,œoFÝD:Nˆ¾4'),
('šq)ÑäÝ:?Ñ]^»,x', 'wp-content/plugins/siteorigin-panels/inc/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒ_Y“ˆÚê¢¶ˆpÙ0V'),
('t¶0Ž¡á½6ií4Øg', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile-edit.php', 0, 'Û½ø¾¸ Ã¦*,@¸WÚ=', 'Û½ø¾¸ Ã¦*,@¸WÚ='),
('v¸iÐéãEcX’¥G¯£^', 'wp-content/plugins/woocommerce/includes/wc-notice-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M½Óûç…1£0pZW¿íG'),
('”„_flMÓ''ˆeX_ÕM&', 'wp-content/plugins/siteorigin-panels/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³¿f~”—¯“»òÎõgé'),
('½ÊüÚT†il6Cá¥œ;', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/restore.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜ÎkR¤''Wbî]±ažPŠ'),
('à½<Êýrä€·¿ÛüÚ', 'wp-content/plugins/buddypress/bp-groups/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a"yîìˆÍV \\‚—ç#'),
('å¼`1¡ž¤Ü÷oãëx', 'wp-content/themes/twentyfourteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Û©âG^pà¿xöça`!D'),
('û³>Ù/á¡‡_ó³éÃÀ', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o/ð>Ú¥œ\Z”¾tÐ‰qî'),
('ü&UX\rèL4{šâÑÔ', 'wp-includes/js/utils.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aú9¼ïÎÞ!¹;ë	œúx×'),
('\Z‘å“Â™\rAˆ†Ÿ', 'wp-content/plugins/buddypress/bp-themes/bp-default/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µcéé0ð8*|ù\r¤»G'),
('\Z2£]ÖãÌ‰G«;¬“', 'wp-content/plugins/buddypress/bp-forums/bbpress/edit.php', 0, 'æ¡b/Þóøå|ß©Q', 'æ¡b/Þóøå|ß©Q'),
('\ZR¤p`XÁäëh>Ð', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-ga-ecommerce.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰Æá2S\0xì[@–À’'),
('\Zw‹¨Á$qÍs…33Ã}', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-pdt-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾p4<²Wi–¥l''÷Âú'),
('\Z¤ÓiDÄùÕ“Ä$¡aI', 'wp-content/plugins/woocommerce/templates/loop/loop-start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4˜Ï`i¹ýõ*ÛÚC|NA'),
('\Z±e\rÖóäj!^²¸	ã÷', 'wp-includes/js/mediaelement/bigplay.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qd6û=ðÒžk7ÝbÙRgj'),
('\ZààkÂ~ÔgWNë/m¹/', 'wp-content/plugins/woocommerce/templates/notices/success.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y$""À•¯ØÞøý“0\0'),
('\ZëãèÁ¡•)qtsCI9', 'wp-includes/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™p#ùË£ CæTÇÔÌ'),
('\Zïy‚„8R#O¬yÎÆ', 'wp-admin/css/nav-menus-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËJHyTgÓñ½Ç²Z');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('\ZýUEäs(î±÷ž#Eöp', 'wp-includes/images/smilies/icon_mrgreen.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýéäJŠ®‰½Rw’´wšÊ'),
('Ówäiøhg$¢•óÒ', 'wp-content/themes/twentyfourteen/languages/twentyfourteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0ìJÚ7E\n:ÙtCñÓ¢'),
('A”ZÊå“–Ì…Lƒ›(', 'wp-includes/js/mediaelement/skipback.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍmÈ0ëE³¥©k¼“oõHF'),
('\Zœœ^Õ|g‡\Zÿv?#ˆK', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËLWâö8Âµ£cÅìl¯'),
('C_æ†8ë*c\Z2d`{Y', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9üß2×Ê"Õú?çHç'),
('\\Eàçb’‹åÃé', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MODXEvoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç ¾ùÐŒ~þ…^´F'),
('˜,[2öÚ3Š51—Ï$\0S', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-scripts.php', 0, '7É\0Øž\ZUì<"¼{ûQ', '7É\0Øž\ZUì<"¼{ûQ'),
('§y´ÝÚ!¡\0pZèˆ[A', 'wp-includes/js/mediaelement/mediaelement-and-player.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚@Î=mý?úª ×g¹åÝ'),
('½—E7Œ³Õ¸ÂÞjj', 'wp-content/themes/hexa/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~ˆ”<Ê\nß¶Rgè|<5ù'),
('ÍÀVÇþðUÔŠMqñÁ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.kses.php', 0, 'Ñ\Z/L°1nœ„?Çÿ‘Ú', 'Ñ\Z/L°1nœ„?Çÿ‘Ú'),
('Ö»E\n»<¥B„[ì,', 'wp-includes/class-wp-ajax-response.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?¯‡3·Íœ(~ã÷¥'),
('åk}´äòyNp:Û¹', 'wp-content/plugins/buddypress/bp-friends/bp-friends-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aø½† @gýšòš/Ú'),
('æ…*k''l?,WÓŸ’', 'wp-content/themes/twentythirteen/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-å¾­Ìrë¯éÃá‘„'),
('”mÇn9ÆF±6·', 'wp-admin/css/admin-menu-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨G³Æ£ºØ”^ˆ,¯'),
('¨ëÓ¸ÍÏw0¯Žª', 'wp-content/plugins/woocommerce/templates/loop/rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+w(:.s¶¯æ¾õ'),
(')úMæÈ^ð¶Ã»ozð©', 'wp-admin/images/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-[’¶tÈP¿ðì¯dì'),
('1’…Ý:sYÞ8ñï$', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'võÞùi6³˜,+Â\ZœG'),
('4%·IHÄO‘‹Ê°ÒL', 'wp-includes/css/media-views.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»Û]âÿ¡7B¡àÁäwÖ'),
('8çÇ€ý)Æ¨j:¹àr²', 'wp-content/plugins/wordpress-seo/css/metabox-fresh.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f›''N¦©6+ò ~³ÉjåÐ'),
('<B¹¢Ê±íA51Ó±', 'wp-content/plugins/akismet/_inc/form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''×4Îl*úÏ&‚çi'),
('Cð/ù;)ŸªÙ‘î°o', 'wp-admin/js/comment.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£þûI˜³õ4áDÛO#]'),
('Lo¦SX÷‘ó9!rÀ4‚', 'wp-content/themes/twentyfourteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹B;–ëa`GÔ¢·Þ‰'),
('TËgslFí¢æÊžàõLy', 'wp-admin/js/set-post-thumbnail.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹ÅÊú8¦Õ¯!1z['),
('[ñãÄÓÎf³ðA4Ùñð', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_desc_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô„uæÇB”Dæ&"áhe¹'),
('az$ßš©	0›´n', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen-rtl.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WŒlÙi\\ŽŠæ¤°I–'),
('hõ3—óp*J''‚jîè…¢', 'wp-content/languages/es_CL.mo', 0, '1›_#nïŠ] G%Äóš', '1›_#nïŠ] G%Äóš'),
('vs%Âz¡ï´úø¾FÓ', 'wp-admin/css/ie-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aù^PÙ#e®á»1±~'),
('z˜|*6žS\\5·ã¯3', 'wp-content/plugins/wordfence/lib/wordfenceScanner.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü×ª`åÚ©’1üö¸çæ'),
('œ\n$zßX£`Î1Bw', 'wp-includes/js/tinymce/plugins/charmap/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kùå!œ4rŠ‰áà©‡æÐ'),
('´=b¤6šÞhs€ªæt', 'wp-admin/ms-themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R¹K•Ê$¼IZ1Æi%Ø'),
('Ÿ¸''úFEŸA–vQMv', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Abstract.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>\r°Ã5]xVIÖ''Œiµ'),
('¥Ì­ü›×£à­x÷}1šj', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁŽÎ­ÌâZågÙ·k\rÿl«'),
('¦¨±Õù)\Z©+Ì#³', 'wp-content/plugins/theme-check/checks/postsnav.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å«ÛA¿XA\Zìaˆ|²(p±'),
('ç†íÝæ)û¬×¸¨D', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/unread.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uôì«ïd“»''äµ"ÁS'),
('ê-=Q°CwàtnLà¡#', 'wp-content/plugins/wordfence/lib/wfBrowscap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€äQ?SXl†µ4¶Zõ>'),
('\nœßO‚_˜«;]/^™ç', 'wp-includes/images/down_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eÜÈ]:uÿWvûãß"·â'),
('G_bc©.,]&Åè', 'wp-admin/js/image-edit.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ôÚcåÉÆæNgÙf)e¯iØ'),
('.v×û2zXÎä©µÑ|Å', 'wp-content/plugins/wordpress-seo/admin/class-taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3ÂÓÇ¹v{~ÃÌ¢G®'),
('fMx’íª¹®	é+9•U§', 'wp-admin/js/customize-widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z=DUkúGÁAóÛ¼õt'),
('kj~å:ñ®`"‰ûqÎR', 'wp-content/plugins/buddypress/bp-forums/bbpress/page.php', 0, '(íÀaa ¢»O-ÞMn“', '(íÀaa ¢»O-ÞMn“'),
('\n^Þ‚¿ª%ÄÄ²zÐL', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-load.php', 0, '‹_ ®©¿iµL7Ôi®Š@’', '‹_ ®©¿iµL7Ôi®Š@’'),
('ƒ¾\Z_7¢¬U»•ó`J^', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/blogs-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'JÌ‚ÇÚÊPîuë+Âô“ÅÈ'),
('‹%„ä\\ùÂMA‚íÒïÿ', 'wp-admin/images/wordpress-logo-white.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á¯c=YÜµ˜Œ¬ÿs¶Þéÿ'),
('Žšƒ¬JÌ}F·ßE\0Þ9³', 'wp-content/themes/index.php', 0, 'gD,Vë§=\\ÆbP', 'gD,Vë§=\\ÆbP'),
('››x›•FÝæ—=\nUû', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-topic-tags.php', 0, 'í×ºC½K¤ÑJRïw¼K›', 'í×ºC½K¤ÑJRïw¼K›'),
('§^ÕI–(…¨:ê¶¾', 'wp-content/plugins/woocommerce/assets/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YOú?-Ã²¶ÛM(¢È'),
('´ë=“©uð‘Ü‘—ôìÏ', 'wp-content/plugins/woocommerce/assets/css/woocommerce.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰ÇhŒ#5E‡ê,±	°‘ô'),
('¶d¬oÄ6Ì[?köNÐ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/rewrite-rules.php', 0, '7äí#áåhá¶B¹xxÉ', '7äí#áåhá¶B¹xxÉ'),
('Æ=Å}CðãîiðÜHT', 'wp-admin/network/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Øi&§Q\\Ó¢ð¥ç¶¨'),
('Óg¹›I†!Ù­ÑÇÖ_Æ', 'wp-includes/ms-blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	$x§ðÅø^D(pr['),
('Üå]/~ÿøÕq¡¥XÅŽE', 'wp-includes/js/jquery/ui/button.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hü³QÖˆ/d£åâóÖý\0³'),
('ìôi^o®æì49I', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡PÖb6QW.Þ+|h”'),
('ÓeîHá÷9¾ø[àû°1', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ³{—AF\\¦À¥÷'),
('/–ÊF”	`ï¿$%,â×K', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.mailer-smtp.php', 0, '¿«''p†suA¸Šì·V»', '¿«''p†suA¸Šì·V»'),
('2u\0·]*qS†¹pó\\', 'wp-content/themes/twentythirteen/sidebar-main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð™ÅX"_·;“s/ò*x'),
('?ßjÎÛQFqÂGMý', 'wp-content/plugins/woocommerce/templates/content-single-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚C3ù¶8Ü5VZÍGG'),
('S''È œ"–çëà', 'wp-content/plugins/woocommerce/templates/cart/cart-item-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j%sM±fù03\r8Ÿ¬Ù”'),
('o?!Ïˆ‘ÒÎ›pÚ<Ä', 'wp-content/plugins/wordpress-seo/frontend/class-opengraph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yÊ»ü»%)÷ì6”¿Û!&P'),
('p—cÓôaíò­D2ƒÈÎ', 'wp-content/plugins/google-analytics-for-wordpress/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('t_zå&œšÅUæ—œÅl\Z', 'wp-content/plugins/woocommerce/assets/js/frontend/address-i18n.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Í@ðÆÍcÿ}]Ñ”^ši'),
('z•öDð·> ËA”)¬a', 'wp-content/plugins/wordpress-seo/inc/wpseo-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ð’wÖ8Â?Qo¯@|ŸÛ'),
('|Ú&;Œr¢Ls5ùŠ', 'wp-admin/includes/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢¤é\\ÚÀ¸¢ä''3®)Þ§Q'),
('„ËB§Á/ÜHHLÅ°', 'wp-content/plugins/woocommerce/i18n/states/JP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'é)9Qo3×ÿo¥H'),
('‹öÂYe¸.ð0s–‚', 'wp-admin/includes/class-wp-comments-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éaÜªÜoÆ4ZBžæÈ'),
('¡Ð''-ôpÚ-Ïûñf¢', 'wp-admin/css/l10n-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'í{5ìÉº‹+eæ4in@'),
('³Ùv"Ë:„`A''8û', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/buddypress.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¬“dW^Üpx®'),
('èzdy&c‰t ÞQ›', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¹	â¦Z^ÎÄ+Á}iô˜'),
('EõÛ§evGëÀÕÞ', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-media.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–ÀÃœ{}2µÆš¾ëÙ#˜'),
('LäåbPÞ-I×­1f€', 'wp-includes/theme-compat/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´xª¢üˆvY¢²ˆŒ'),
('`Ë¡ª¶^0˜+°E° E', 'wp-content/plugins/papercite/tpl/default-bibshow.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú]öIHãàªW‹o	QìI'),
('pB\\pfzA@°Eªt*÷', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Íìº”Nýˆ[aÏ”±‘Ûe'),
('†æá¦äFy´ÕîÐP¦', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y''BÔ¶Þl¸ìÄ~kÅÍ_W'),
('‘o¸?ªMÁÍeÈ–ô', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.pie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«·s\rEë,†¨B²úã.ÞÐ'),
('°ÿÙì>$MÐh9©´\0Ž', 'wp-content/plugins/buddypress/bp-members/bp-members-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŽK\níõŠË¶àþYýýA'),
('Áö Ÿ4¬«/¨x™–', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/admin-forums.js', 0, 'éK[™@Øÿ”­žè6vrý', 'éK[™@Øÿ”­žè6vrý'),
('ôHKÇË•È¹B', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhook-log.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð~±eéµø&ˆ6Ì{¾'),
('  ôG­á\\mqì\0°DzÍ', 'wp-content/plugins/buddypress/bp-core/admin/images/menu-wp.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5—˜3 3Û´^3õ+5'),
(' *@ADÒ“ˆ=pu°˜ÓE', 'wp-admin/user-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 	ü7ª,	PßÇ¦*!<g½'),
(' .Õ£¶M¢E|…¿\\‚†}', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/DokuWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N¾ƒ]ñ^g¯\r´©†x¢JÂ'),
(' Q‘i*L¿$Ò„~éó', 'wp-content/themes/twentytwelve/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎåÅ§ÐŸ#þ!&d%è3'),
(' YÌŸ’¢åuT‹ÞÉÃ''', 'wp-content/themes/hexa/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$D\\†,¼äõøýº)¡\Z'),
(' dûFöeÑë5··Óóö', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø?''ûý ÖK¢®>ªô±Ê'),
(' gÎsÍŒŽäI‚}$0xH', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ChefInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't—&ïr@;…ìæfà€'),
('  iLI¬ƒãvm^€·á', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-edit.php', 0, 'qçÏ”¬d€m»õ£””', 'qçÏ”¬d€m»õ£””'),
(' ´={½ßq¸‹>³FÂ9ëà', 'wp-content/plugins/woocommerce/templates/checkout/form-coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?4\Zh&ž…H1g¼†jà'),
(' É·iòSþ€Í!O‚¸áw', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-plugin-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž©7 ºe‡]4#¤WÈÂ0€'),
(' ÚÑ752’ŸÉ¤…D§[', 'wp-content/plugins/papercite/tests/test-show_links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't+¯¯Dõˆ‘G‰²^ÞT'),
(' àôcÌ«)IŒ\np,Í‘«ƒ', 'wp-includes/css/jquery-ui-dialog-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÂgWû›.Ôìyj–2g'),
(' âp(?Qníˆ¬ÕaÛZ', 'wp-includes/js/plupload/plupload.silverlight.xap', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<RGPTmá³ª³oö®»'),
(' çáŸÿ×2+ÉíjnÐ×O_', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/tags.php', 0, '«^OÛÔŠkÔ½+êžx³', '«^OÛÔŠkÔ½+êžx³'),
(' ëçÅ?&®ã‘]kÅ', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocomplete.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶T}`3Yæ¼î­Ì¼h'),
('!	þb3ì$Ñ¤]›l;‰', 'wp-content/plugins/woocommerce/includes/admin/views/html-report-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>¢ñ9idnEzf8Œ'),
('!o\r¿ÍAˆŽv7àÜe', 'wp-admin/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿ÁgœSØØÑìJoú'),
('!eÑŽÂ}\\þw8eä²@', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÞÂXþg‚0L.Çƒ)&Œ'),
('!1bÝ…9 ª*ãÀÿ\\áÆ', 'wp-admin/admin-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nksjº®…óˆZœÎ×'),
('!TÁy^”8š‘{``Ò÷', 'wp-content/plugins/wordpress-seo/changelog.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð¿U‘ÃâŠ#ª"t'),
('!_Ÿè¼µp3p™n×ÓL', 'wp-includes/images/smilies/icon_eek.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦Æ_¦ÿsŽöÄjN€¦_z '),
('!¿(\0Œ#Ë)2\Zv`¹A', 'wp-content/plugins/woocommerce/i18n/states/TH.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½±¨ÎÌ5Þ&Â±bœ'),
('!¢˜’àÞ˜ðËV›“êU•-', 'wp-content/plugins/buddypress/bp-core/bp-core-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÅÔºmJ?J.ø‚\ZÂp¬'),
('!£\ZdÔ3$M¬ÑS¬’', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/read.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uôì«ïd“»''äµ"ÁS'),
('!Ò&ÀsbÅ‰j™í-', 'wp-content/plugins/buddypress/bp-activity/css/mentions.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ã³üC6bB”Ö£â³Ü[µ'),
('!ÕR•á›pûnLÑwâm7', 'wp-includes/js/tinymce/plugins/lists/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YD=''˜ˆ×2B9hU1@–£'),
('!Ö»¹æN×’ÿ¹Î÷}ò', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/phpunit.xml.dist', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŒÌf‘Tˆ¼4Ôv†+q ~¡'),
('!ôÿ·íY0-z1àdm>‡', 'wp-admin/js/plugin-install.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'év•lë·ºÎ%Š,úÃ'),
('!úªÖlöª"ðÊÕOa', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÉJ5Åq<Ò—PcH˜@ß®c'),
('!û7(›»E§AØ©sxt&', 'wp-content/plugins/wordpress-seo/js/wp-seo-bulk-editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#]¹-ÂaÞZ —êš'),
('"(}GÅÅrç	0—ŽV(', 'wp-admin/ms-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢''Ž\0Ê}Ìþ:Ôã†¯©'),
('"IFnº§­¸@÷aÂ}’9', 'wp-admin/includes/class-wp-themes-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾âKsê‹$à@}%'),
('"YëÚ2:hç>rF8	ƒ', 'wp-content/plugins/papercite/tpl/av-bibtex.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð3Ì¯tWv\rMõõ'),
('"p®¹ 1ü®[wA>G', 'wp-content/themes/hexa/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fîUéÃTz{\\¨N¶2çÎ'),
('"¡žŽ¾b9®‹eÑ|®_Ë', 'wp-includes/feed-atom-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c«D1;)®“-ŠB?6s'),
('"¬\0ƒI\nºøõ%Õ', 'wp-content/plugins/buddypress/bp-core/admin/css/common.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZÕ\r½o—4Ÿ ©*÷—„6'),
('"µòÉàÉu>1Ð7þŽŸ', 'wp-includes/class-pop3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©K²™ÃS·å|Ÿ˜ê/}'),
('"ÂáûÂ†²c„¬Ì9Ð&', 'wp-includes/js/plupload/plupload.full.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“Iö6ÇG¥éƒ\n·!:D'),
('"ÓÄ6\r+K{×\Z!a', 'wp-admin/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µ×ï%YvÇ±º!žØ¦&	'),
('"÷åç;''|÷»(hMÏ*m', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-1.4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"Zd‘¼"~•ÿ@Fí @'),
('#\nÁô/†ÛPZ~h„Îø', 'wp-content/plugins/wordfence/lib/email_genericAlert.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v&Z8ÀZÛŒ"ºjsq|8'),
('#_âMçîðb§r‘Ø', 'wp-content/plugins/siteorigin-panels/css/images/dialog-separator.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“…ÿŠ›a«‘R½ý›o?<'),
('#2@â~ß¨1D…”àd¨', 'wp-content/plugins/buddypress/bp-core/deprecated/2.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ad×4$®žÛRGUKÊt'),
('#cÖÜ4©ÿøm"CþK', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/mastercard.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö±ÂH†ø\0³"Ä\\õJŠ'),
('#‰¹è²<<=ïT5ì¯0K{', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-reset-password.php', 0, ']’àÎI0Ö•Kó‘«¯€›f', ']’àÎI0Ö•Kó‘«¯€›f'),
('#¢D±ð¤ä¦Ð¢¿ÎšÈ”ò', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/defaults.bb-schema.php', 0, '\n›§z_qwÅ|	cXè', '\n›§z_qwÅ|	cXè'),
('#©XÓ—‡J;H:tañI6', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/button.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7#A~f¼²OórŒ–ˆSÉ'),
('#ª?A‡~¡§í\0oAÙÌM', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('#­)m®ñ}±\\Z,Æ·Ÿ', 'wp-content/plugins/woocommerce/i18n/states/BG.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eòwÉc™ØªI{2X~.6'),
('#Åü@aÔe	ÙM¶¨±D—', 'wp-content/plugins/buddypress/bp-themes/bp-default/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\!à‚:=tMEPZuŠx'),
('#ÌËNø¼wwè%»í|?È', 'wp-content/plugins/wordpress-seo/css/metabox-classic.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S’a™æ¨›]X½*'),
('#Í:ŠÔÒ›˜~}G×àÉ¾', 'wp-content/plugins/wordpress-seo/css/jquery.qtip.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ¬æJ÷Òb²aß/'),
('#Ð“ËËöü<wõ8c', 'wp-content/plugins/woocommerce/i18n/countries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-ÆNÏbØ÷ˆ#1ir­ßr\0'),
('#ÐÉ<c´‡âìo˜W#üÉU', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š%í±ø÷>þhè]9©’­‰'),
('$T,‹òNÌ.½Pz~Þ°', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BYð,b³ûƒIx€X\\'),
('$5%NrªÔ¤£ýK{rÞ', 'wp-content/plugins/siteorigin-panels/widgets/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y#+\\p8¶í ß%dJû'),
('$=JøE¶¡ÜW_1\nû¶+', 'wp-content/plugins/woocommerce/includes/class-wc-ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':EüyÄ "\ZÉ‹D¼E×Ôc'),
('$js&‚Âvg½ôÊwî&', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/default_header.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-Ó˜g?)ªkL\n¯QhÎÿ'),
('$o-ˆnö7´ôþ6}7', 'wp-content/plugins/buddypress/bp-core/bp-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆëŸ_Ÿe­ÁŸÉÙ:L:K'),
('$¨`Y®25a"·÷ò×W', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/rss2.php', 0, 'ÞQÖKÉT’•Hôq3', 'ÞQÖKÉT’•Hôq3'),
('$’„õ³0S\r˜rþ®©', 'wp-includes/images/smilies/icon_redface.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm‹‚AùƒR!4a'),
('$›+)JÁdŽ;Î\\Õ–ÐD', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-meta-boxes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°.„KsúÑ€rÎÅ“È<'),
('$¥†µæçþ®/†²4Ï', 'wp-content/themes/twentyfourteen/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')TÊ“6¶^Ô§{…r'),
('$±EÇä®ÐÐ†_zEÓâ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/test-class-api-libs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a¬+üÎýß¡‹g=Ý)'),
('$±pÄÐÓ\\Ò_ÛÁZNÕˆ€', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f¼\r¯Ä1¿»¼½¿¿'),
('$¹Á¼CÁ®Àó/¼9¹¸', 'wp-includes/class-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þœÐÀ¤\rüð•že;º»'),
('$¼æPÿâåXuûœÐäÙ', 'wp-content/plugins/wordpress-seo/inc/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('$ÆÂÍ¯¥ÍR.¶HÄßž–?', 'wp-content/plugins/buddypress/bp-themes/bp-default/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'À5E"tÔÀÖøªdÛÀ'),
('$òìß°Rí\r­Êab8!', 'wp-content/plugins/wordpress-seo/vendor/autoload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€h¦9³¦gm¡ÿ³ôÀ'),
('%#ZHpü’FÝîS®–M™', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.bgiframe.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù	—ÎË{ïj­gkT&ÞŠ­'),
('%9€o…uz†"Â	ZI', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin_dashboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óó1¨ö¹c&âE•\0'),
('%<šS˜¨L·ýªÞhi^ë', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-error.php', 0, 'H™÷ê{«¸Ø''.”pé­¡', 'H™÷ê{«¸Ø''.”pé­¡'),
('%NŒ˜kÿþäÛ<Öm[Í~', 'wp-content/themes/twentythirteen/author-bio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó7µÒ„!ç­’ñ”ÊÔ!'),
('%—‹ñVÚúÐ‹]¿í=w', 'wp-content/plugins/wordpress-seo/admin/class-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦%g_8P¸3OhÁËp'),
('%Ÿkú‚§|\ZâÎ©VžNÈ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•ÁâTÆi`‡‰¡'),
('%ºÒàë8^œV<ÑtË', 'wp-admin/edit-tag-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÖ®€(ÌgxhŽ'),
('%àÜNd\0ÑÃ‰0ª ç†', 'wp-content/plugins/woocommerce/includes/wc-widget-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡z9ÖŠ%.ÀBûô\\'),
('%éçÄ—¦ûu%.O£ÅÄÝœ', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_admin_dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×"k+C!íÍÕ´D3Pb'),
('%ú\0’F© m%,FÞ\r…', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/password-strength-meter.js', 0, '7\Z\\3ÔSrÞ²8?t9Í', '7\Z\\3ÔSrÞ²8?t9Í'),
('%ÿá“€U|^Sd”Ö¼', 'wp-content/plugins/buddypress/bp-core/bp-core-avatars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ú\nÑKŽT—Òš4øÑd“'),
('&\rÍ‹èÞÄ‡HïØE‰', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_notices.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±‘öô''m™è¥î4’-'),
('& ºkh0ŽD@Ë“ã', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'rêÒT2µ¨@1¸3:¥ûòY'),
('&*ƒÊÄdÄ†Ö¸	ÖH5', 'wp-admin/images/align-center.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	Ù\ZÝ¶µ4yæŒdY1ÙeŽ'),
('&=\Z½+tí’"¢/k''\n', 'wp-includes/js/jquery/jquery.form.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛÃ€„sÞðÎEþVMÇ-Ë'),
('&C¿ÐÐ)® ¶Eh]«ßå4', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çë×ç S6¦¾¢ƒïc'),
('&_†‹‘²¯tâfcÉCG', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd<Ê…³˜uu‰r»z'),
('&eeî\n3KèÔãvZ¦•', 'wp-admin/ms-delete-site.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆØ„ð—_FSÆÍ óòû '),
('&t!0^g‡ÛbJˆc,>3', 'wp-admin/upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž,D÷ÙÔPˆ­k¤…w'),
('&…R''VÓê«œ´`±ˆùÝ¸', 'wp-content/plugins/theme-check/checks/navmenu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&Î¶Wƒ\ZçÞêþ[Þh2ƒ'),
('&«ÜŸ&Ý5Âj‡9ÊçN¢', 'wp-content/plugins/woocommerce/includes/class-wc-logger.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­aCà‘”Ü¹Õ€?,Ïa8{'),
('&¬‘•Rw?~„j­hJ¤D', 'wp-includes/Text/Diff/Renderer/inline.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ\nån5±P´²ÇéÙB''è'),
('&­×d‘W<Ë·)&\r!', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nuÿ¿vü}¿Âµ>çÖz­'),
('&¼‹]0Wñì\n)ÿ=’¿', 'wp-includes/js/tinymce/plugins/directionality/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`ÞW%<©:oJÿü9Ò'),
('&É`×OËQ5‘QÕ43¿', 'wp-admin/theme-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½ý„jMø>®ä	ƒ5LO'),
('&Úlüw:,\0‚rIç ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-deprecated.php', 0, ' lpC,²+áeïPfŒú@', ' lpC,²+áeïPfŒú@'),
('''¨µØäÐ+Ks–ÏtÂ', 'wp-content/plugins/theme-check/checks/cdn.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_ñ¯á†wHü“…˜ŠVä'),
('''\nï™!ãj…8"„]>ð', 'wp-content/plugins/buddypress/bp-core/deprecated/1.9.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ï{¡º©\rüuÓtèÜ…\Z:d'),
('''CÅæÕÃ*A†â&hs@', 'wp-content/themes/twentytwelve/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eà_én	¢æ@÷S²¦0'),
('''M<Úë±h1êÏê9ÃL', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-attribute.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o)hÀñÖìÕ¦€E‡&<'),
('''V>\rÀqÄyÀO€\0v.›', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Concrete5Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yÑbˆ–‘§¨™\\Ge7aö'),
(''']°d`¢ºègí\0»ÄÖÔ', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/45pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ç%%¦ÚÄK¹0JÈ‡äÅ'),
('''dØ…âÎŠj¨â„Ó­', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìêN*ø[òÜƒ„ËýŽ '),
('''fƒ9Åqe´Îb½Ç?Ià!', 'wp-content/plugins/buddypress/bp-core/admin/images/menu-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜ÈÖ™†$ËhaPyz|”'),
('''rÐ,¢qRÂ†þGÑÈG¼Z', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-taxes-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð;"Ç¸Ý[ï0Î‘nc'),
('''–úº‰)\n#ônI¡Kn', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.mailer.php', 0, 'Û¯ãð†R3ÐŒ‘¿S4sü}', 'Û¯ãð†R3ÐŒ‘¿S4sü}'),
('''‹ü»ž ˜oÈÍSŠ', 'wp-content/plugins/wordfence/images/icons/ajax3.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mwßß´tê“''\n¤ñís'),
('''Œ)”@×Å\ryc:æ³PE', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_CacheParser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5þéàL<<Å {²Ž‡'),
('''‘ÈÆ·«“€¯MÎÓY7ç@', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':L€3?(ËvC)¶Mô¹=O'),
('''¤Wp_:lŸóÓá1 ', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æM²ãªûUâp{`8w'),
('''¬¶›®0×Y%nÿÀTtÕ', 'wp-content/plugins/buddypress/bp-themes/bp-default/forums/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Êö»{cväKåôºÎ+þµÚ'),
('''²¥Tëð*<œ=`²Ó¿', 'wp-content/themes/twentyfourteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|\rÛ¯®as\0''/B6§×'),
('''¾Ð)nÒÌãÎ°o°­', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MoodleInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿î}‰§‚ëÍÝZ™ÜÒ'),
('''ÈV:# ïë\0aIL^¤!f', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':6y–!É©¾‚R:Íè'),
('''Êêeê½Š%Gùršë…', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/MediaWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Øs|VõTuâ›™ê·¢À'),
('''ÏF $O¾^ËnäìIR', 'wp-content/plugins/woocommerce/includes/wc-deprecated-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹«¡ÛÙD¬Îz€V…½j'),
('(ˆÔg%\0ÏÃ4ÝÛl>œ', 'wp-includes/js/jquery/jquery.schedule.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&³—TªkÇfØž¤Ä½'),
('(æoÂÉÒŸ~ÈP*ó±ü¾', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/CardToken.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËÏm´îÝµ1`{]£J'),
('(0 U ·æ7èsmù:tÝ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install.php', 0, '‚ü•ã-{Fi”Zh\\''·', '‚ü•ã-{Fi”Zh\\''·'),
('(?ËÜ×>¹ôS©Næšœ&', 'wp-includes/images/media/default.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-¶©æÍIÒB–hÎ@àÞçb'),
('(R\0HBð’wÃ¨:Û8', 'wp-content/plugins/woocommerce/i18n/states/ID.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÒÊpN8Ú÷w “t[ñ«'),
('([d‰˜ùº±¡×ïBQµ‹', 'wp-admin/js/updates.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0Ü\\¾1Qð­ãbájÈ±[Ÿ'),
('(uZ/è·ã£T²_|º', 'wp-content/plugins/buddypress/bp-core/bp-core-taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ–îŒ{\n9,^my6'),
('(x*J û…,…LÃ›nç<K', 'wp-content/plugins/wordfence/images/icons/arrow_refresh.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k•w„`ö`ª|ô}$G€§'),
('(~6vqVì0ô{†"', 'wp-includes/ID3/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“–ßáÆœ“Ž±VLN[«'),
('( ïv|Tâ€” Â¥Ô', 'wp-admin/includes/screen.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FkbVÔ\n¹Œ3{\ZÖ'),
('(Œ4\ZoKpk}€j¶ïÿð', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-download-permission.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J„q£ñ~á¹}„\Z¹:'),
('(Hq5¡\\©ããàª', 'wp-content/plugins/papercite/bib2tpl/bib2tpl-entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë­’þ¦÷ë­Ù~éÀôÒ'),
('(ÛUÔ{ÄÒòÁ(\\¿¿æ™', 'wp-content/plugins/woocommerce/assets/js/frontend/cart.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0\rÛ2yÅ†Ø§hð'),
('(áZ¡>!µÝœÍèx', 'wp-content/plugins/buddypress/bp-messages/bp-messages-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\>Isµ*XÉ”Ùº	D}ü'),
('(ï^¦3N½š©“‘¢3', 'wp-includes/wp-diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5vÌÝºL?‘ÓÝt+'),
(')|äˆù;m8Z\rsÔp', 'wp-content/themes/twentythirteen/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö\\^î@½¼msÍÕxÀ'),
(')1©Å1@$8m«Í&%', 'wp-content/plugins/papercite/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºumJÌ¼\\Ô?Ñƒ¿&3'),
('){ôjW-_€Q=?íGlÒ¢', 'wp-includes/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õXÁ;ý„÷âwšXG¸ÄY'),
(')|öxÉÃ2@“¿rˆÆ', 'wp-content/themes/twentytwelve/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gã^Ñsˆ©!²''®Ž£ì'),
(')²_ª7Ôo¾8¶­¨?{', 'wp-content/plugins/woocommerce/i18n/states/US.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”VBÆ..sž§¦rƒ}>'),
(')¾Oz=œu©‡î£ÄË·', 'wp-includes/rewrite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®ÙvD;n—ÍÂì®#ßFm)'),
(')É	â7ë)T³}ä–ÐP', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íÌãÐÝ3øÇ!ªOŽIÆ‘'),
(')ÌM’áÉá¿“d]ðp‚', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/blogs-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð×pšAÆcSŠÛM²þ»~'),
(')ÌƒÕ2±kÕh¯Ÿò! ', 'wp-content/plugins/akismet/akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ?€`ß± ïïåBY&'),
(')Ïh Ä’Ã-|BÒdåà', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!\n(£''­n—¤´ÉÕ'),
('*=67-{ìˆS»;<Ÿß', 'wp-content/plugins/woocommerce/assets/images/storefront.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œƒ–§[xÑ§cB³_'),
('*ô‡,Åö®êmŠ‰', 'wp-content/plugins/papercite/utils/osbib2tpl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™H1ƒ´™ˆò›c³hh\Z‚'),
('* aØF²Ìð4Ÿ°uÛvU', 'wp-admin/images/menu-vs-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J¨ZY<÷iÇY®„bø'),
('*BÀÙæ|âd÷µÞà‚•', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Deposit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iÖ-ÝÚ5+8îi%¯(B'),
('*KžùÜ\rA\0È?ØR>õ', 'wp-content/themes/twentythirteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"ètTïŸ‡œJ''AŽ<'),
('*Rc«Ÿ±a¡ f3-­ê', 'wp-content/plugins/buddypress/bp-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_??VC—p·jÞía+'),
('*t$ªß‹vÃÑnåÝsñ', 'wp-includes/js/swfupload/swfupload.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½Z%ò5‰e,¤rÔáHO'),
('*yw.6íúë’:#Z£', 'wp-content/plugins/buddypress/bp-forums/bbpress/license.txt', 0, 'g1íï''''å\ZI‹]j(*', 'g1íï''''å\ZI‹]j(*'),
('*®ä-3öu¬EÂ[ÕO#', 'wp-includes/images/down_arrow-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' s¸¡î›$‚6(Ú@¨a'),
('*Ð¬¥ùl\näKñ''z®÷', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸IgÄ2<&ÀRÕÙFzI'),
('*ÑþLím&&2ýÕ\nb', 'wp-includes/js/tinymce/utils/form_utils.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£-¼D{}ÐÒwk¢‚k|'),
('*Ó´-—qß;»“ïöÅ', 'wp-content/plugins/woocommerce/templates/global/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìš*\ZâÞò%Ô@á·'),
('*ç\Z07Ñ¥1OÓÓÙŽ8', 'wp-includes/js/json2.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tÙ–ƒå»êœËuD¤+Ê'),
('*ê. 0ø«T(\0‚ÆÈÈ£', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Hqq	à¯†¯ŠeýhM1'),
('+9…£Œ[BUûE–e', 'wp-admin/js/updates.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±E|Q­«\0VüÄÃ£Î'),
('+m¼“$`íõÖ‡¯ûÏ', 'wp-content/themes/hexa/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<lœÉóë«¾¾Ú©©f\\'),
('+€6-Äã+€è]pu', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-styles.php', 0, 'Ž®Øm\na¸?™›QKI²D\0', 'Ž®Øm\na¸?™›QKI²D\0'),
('+˜¼C´Å=CÙç\ZÀŒjÇ', 'wp-content/plugins/buddypress/bp-core/admin/images/member-types.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§ÁÍjVÆgª;J>6&«'),
('+£ÆqKaH‡éÅzç', 'wp-content/plugins/siteorigin-panels/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D´£m!¹§°9Þî%lK'),
('+³§G*#ô±íô¦”ýf´', 'wp-admin/network/site-info.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')¨§å³ž;ì\0T,Ê”l'),
('+¿ÅPìxø3Üø§ì¼þL', 'wp-content/plugins/wordpress-seo/css/xml-sitemap-xsl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§Ý`Ègá“.2ËÊ®Ð—'),
('+Àüµ^2¥ãˆs1¡\0Þæ', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-addons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥ç}jwÈ]÷@:Õä*ì'),
('+Äãøt¨%R?ÒÛõø Ì', 'wp-admin/network/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8,Þ4,ÇìõXõŽôuð'),
(',4pkEªóð’¸IÛ’‰', 'wp-content/plugins/buddypress/bp-activity/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÄóÎ‚¥4ƒ¨¼s§%'),
(',*H–ü°HÅ»¿à.±ü', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/class-wc-gateway-simplify-commerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2âÛ‚C¾ë³Å[UÃ€ä('),
(',<“ª ß?C]á0AŒ', 'wp-includes/js/tinymce/plugins/colorpicker/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»(oT´ûÎRÒïaÇ'),
(',BÚcÅÝÖÔ›Zù4Y', 'wp-includes/js/swfupload/plugins/swfupload.speed.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AZ7‡„k¶Â×E`,*ûs¬'),
(',T’q2Ü±r…	gÁn', 'wp-content/plugins/buddypress/bp-forums/bbpress/topic.php', 0, 'ìÒ8tÓ‹uFÇ2 QŽŒ¯', 'ìÒ8tÓ‹uFÇ2 QŽŒ¯'),
(',adè²-\\ÊhiÅêÚ', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Vùõo×‚@\n{íä''ã)xÞ'),
(',cSÌ»Í˜ÛÆVgBm¥ëÀ', 'wp-content/plugins/woocommerce/assets/css/menu.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆi~RDÁ¾ÑÅ	\\ê'),
(',xþÞ\Z	l‘ç¨Åº&·ü', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/HuradInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘U-07ÜÀì\n}m•\\^'),
(',†áÔ@µšhjäqrÞ’ÿ', 'wp-includes/ID3/module.tag.id3v2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U[…¯,j¹}jAØš÷üc'),
(',ŠhÉƒs?4B[Ë^Õ', 'wp-includes/SimplePie/Cache/DB.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Y¿OU£õ’.Üb¼ûö'),
(',åýÎ1`Ð¦ô…šq;ÒR|', 'wp-content/themes/twentyfourteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²šÇ]z4©Íñ«žfß®'),
(',îàû^,?xåóƒ3Ao', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-categories.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÙÛH£Ç(vrùüÚÚé'),
('-"Q·‹‚÷÷[Ò$…·', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PPIInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒºm°ÄŽå¦\r"³BxÊ~'),
('-¬TªÚaÌP‰?è0et', 'wp-content/plugins/wordpress-seo/admin/class-admin-init.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü6“ªÆ)Ò’ÍMV8ˆ1''Ñ'),
('-6WcÆ¸NoºJJó¶†S¶', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/index.php', 0, 'ôz32ÿÎ-³]ÉVHî¬', 'ôz32ÿÎ-³]ÉVHî¬'),
('->ûê]ÔÍµ2j´·Õ', 'wp-content/plugins/wordfence/lib/menu_rangeBlocking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²»iÎÜ¯·ë\Z’1™¡'),
('-kdÏ¯‘ªXßw\\7ŸÀ¯', 'wp-includes/admin-bar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éô} Àr¨¥rž”3/'),
('-ljZî\n* (hiu2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_namespaces.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~â(+­KïÌH&G	Ä'),
('-süùÖ-Qeîˆ74¹t', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-assets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ©8p+Ê\0Ä‰?J Î'),
('-²êÑáÇ¸†%w=õâ', 'wp-admin/css/colors/ocean/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z|[ýŸ¯lÇ|Ù±f%h'),
('-‡º)7¦5y°8cÚâWvØ', 'wp-admin/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•×Ši‰y7j<'),
('-Š_º×+ÍÔYn¨ÙS', 'wp-includes/js/jquery/ui/tooltip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈAÀ''ñœá—´:žN¦T '),
('-ŽfâÈ4]Û#"u¸³l', 'wp-admin/css/colors/light/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S!0ŽÿrOæpþ'),
('-œçŸè—‚ ‡Y{]nsƒ', 'wp-includes/css/wp-pointer.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q·UñÐÏæÉ|hq*y'),
('-¿Ö\r#>0y?=PçpD', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/js/simplify-commerce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ôÿ§ïoo›ÚN×‰æ´¹'),
('-Ë&Û²×¾(F%PÍ5Û', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-out-of-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6E­£ßÞçEYóÝc5à'),
('-ïÝD3Äá™ âàþÙ¦ò', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/TestCase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ùÍW=qUL¼mö^*³'),
('-òSª|Q''¯©ö&TþUb', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uf/ËŸø„®¢»)ˆ"x¢_'),
('.=?ÌXž ´fÝT]‘', 'wp-content/plugins/buddypress/bp-forums/bbpress/forum.php', 0, '¢7Óâ,*ÿ âÛNQª‰\n', '¢7Óâ,*ÿ âÛNQª‰\n'),
('.LÛ¡gÞÈÛ^L', 'wp-content/plugins/wordpress-seo/admin/pages/metas.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')B.Údj?Ä0ÜóíD–^'),
('.2»ÞC&ÈÄH€Ø*:', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_ServiceResource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-ËM++\r\0¨VqÂ»N†Â'),
('. Ó\0_oEÿ]Aµ_Ô0PJ', 'wp-includes/js/tinymce/plugins/wpautoresize/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÚÁuÎ—Ã†òì+±‰ƒ'),
('..6}.šÇ²Ú£Þ~Žn	Æ', 'wp-content/plugins/theme-check/checks/i18n.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡À€iªy}·«¹€§®ª'),
('.HzV:n‡#ƒ4òœ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rh‚‘õÜx¥ˆ»/'),
('.IhUœŽâ3Ž¿+B\Z„¼', 'wp-includes/images/admin-bar-sprite-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëQ¬ë›Æ8þôo€Ê'),
('.Mmæv‘î¾¡!³gØƒø', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M&Í	(o˜=õÓº¨ìš'),
('.[È¯.éÂ*¡¿¹ù:h', 'wp-content/plugins/woocommerce/assets/js/frontend/credit-card-form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÄGç„I\\ÃÉ²ŽOËþKØ'),
('.¦EÇ[JõÏlžxßã', 'wp-content/plugins/wordfence/images/forward_disabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M_ÚÖZ?ÚN)ºÒŠê:Ü5'),
('/(RÞñUÕ¸&%ÎZ\ZL´k', 'wp-content/plugins/papercite/format/chicago.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³¨‚±Y‰£	Ø-ÂFõ/À'),
('/1¸Hù¾û.ªUfA4', 'wp-content/plugins/wordpress-seo/js/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('/<Ø§^É¼f}–"×øû$¸', 'wp-includes/images/media/document.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vå4™8öÎ‘y“6Þd£'),
('/Uù(½ÐÅL+V‰›°×è°', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-resource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c©5fVÄ›aÔ\Z`'),
('/dêÃŠ“ÆÃz\Zþ|Ú', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lö¯Å˜Avß—û®*3ð-'),
('/»s»µC4Œ˜àÖÀ€ž', 'wp-admin/network/setup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'îÏBm>n9z]‰Ñšâ'),
('/ÜÍçNvSAw³M‡M\n}', 'wp-content/plugins/siteorigin-panels/inc/default-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y\ZÁo=\ZÄO$ž'),
('/áñ''†p•i20ŒÜ÷ï	R', 'wp-content/themes/twentyfourteen/sidebar-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à«`éÜktÖ™óÌ|,6'),
('/é¹ ìÄïÎ°1Êiw‡§', 'wp-includes/images/uploader-icons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­Áç°&-€äO¢‡Ã•Ë~'),
('0ÁòIs]ƒÅ˜''Kh‚‘À', 'wp-content/plugins/buddypress/bp-groups/bp-groups-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø2Z9Q–Æ#mvˆŸ/Ž­e'),
('0*ÇütŒ(Ì#ÐÅ¯±>', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_enabled_hover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›åó''ñkÊÓÈ­\né&5Ø'),
('05,yƒå9=¬3ÍÉ', 'wp-content/plugins/buddypress/bp-themes/bp-default/sidebar-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁÆ±VAÎ+6 öà'),
('0<’ÎÅÈÿlÚ¿þöJ­â', 'wp-includes/js/wp-backbone.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µiâŸøýH.ç^”V!'),
('0P­ÂàÊ•¨”,ô·ó', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-1.5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@q	k–³ HP\0kXiBâ'),
('0]qK''ûf˜xÁ»Ïã¨', 'wp-includes/js/tinymce/plugins/compat3x/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W˜ãÒû€©›‹×ÏrŽ®'),
('0a“†y\r`r^óìZ	Tð', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nuÿ¿vü}¿Âµ>çÖz­'),
('0ei7µyD²ÒRr"W½£', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/eBook_261x130.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'º){¯¿ù5ä- 4&DúN'),
('0pÚ¨ª&!¾_+eã”•3¢', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh-checkout-logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µº,æ^¥®‹2k»’­'),
('0{!Ì	‡y 6$@´¢Ûq', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.time.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WDùó«í¨—–5øz‰)I'),
('0‡BÞ½õƒ#qäAð\n', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mOÊZ=úìN¯Xv«š—ã'),
('0ŽÒ:Ótu“<FæOÑÊ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DokuWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}‰–=æ%ü¿“7\\Ñ8V'),
('0¤ç€ÅE\00Œ‚XÏH', 'wp-includes/js/colorpicker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5\nõ¯w¦-gºáó:OHü'),
('0ÓA•N¾ûÈ7®¼¸²S', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/groups.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B=#5™SCš,I±'),
('0Ø‹¾ò/¢Ø óÀ1`F', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦@[Pù\\™\rs ãNÃ'),
('10Ü|^òI4¨JüÆÔ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/register.php', 0, 'yÚø=„ž>dO‘·ž', 'yÚø=„ž>dO‘·ž'),
('13ôeºT|Î½9ÄkX=z', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-he_IL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±üœîÞ.tú”O=²Î’'),
('1b\r’2l€ñÿa]Þß¸', 'wp-content/plugins/woocommerce/assets/css/reports-print.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@wW¼Ï+-áòhh·ðÚ'),
('1s¸)6ªÓ¶™•¯C§…Î—', 'wp-admin/user/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è…''ù$´Uûm»xòZ'),
('1šïé®Âù+ «š8%I', 'wp-content/plugins/woocommerce/assets/js/frontend/chosen-frontend.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òjsµ¢æä‘ßu\rœ'),
('1¦[›‰´a¤é@$ï´', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.qrcode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uC³V~\rg¸7öqi'),
('1ÜEfQ¤v#)ó\nÙ0EkQ', 'wp-admin/images/media-button-image.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~¢ÉÁWÃŽÛ@±ÎbÕrÕ³'),
('1ßAÿ+¤m7£þ`í–öâ', 'wp-content/plugins/woocommerce/includes/class-wc-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë(Ûº´xTt+^"Ô#GÊ:'),
('1õ«™%±âÆ±Î…YF', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž¦Ò¸Wá}sô÷F'),
('1ùÎXŠ/²t60^Ò€!Ü7', 'wp-includes/js/comment-reply.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üÅ\Z~ˆ¼i_'),
('2@Üjåj\0¡kÓ²”¡Ó˜', 'wp-admin/includes/template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9m-Ë#ï©c¡²Ìg!ˆÙ'),
('2jÿL,ÃÙÞW\rº®W$›é', 'wp-admin/css/colors/sunrise/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X‰©É•ÑK¯ïáåÈ†390'),
('2…+î/ÞpsD2 ø«Ñ', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-el.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mŠ¯fSØ4ÓPhe“Xã'),
('2”9G:gä¿oiæÓø', 'wp-content/themes/twentytwelve/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qöØäPÕ¹ßVz9¥-Š'),
('2š%gŸ_8•¾ß`¤ÔŠ*', 'wp-content/plugins/woocommerce/templates/taxonomy-product_cat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü6Ë×žŸôþKïG´†J''½'),
('2±Ì:^•Bljä…Rþ{', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	”û½ex¯ï€2+$F'),
('2Ãj4yY|/óëÌ«Ê,', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WolfCMSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÄœÂÒL¦Èr4òr'),
('2ðì^(ÁúÊ­à-^x½¯', 'wp-includes/SimplePie/Enclosure.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.†BënÎKûs]'),
('2ö¾„x¹±L2ö±™êœ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-dir-map.php', 0, '¾ûB+qÐä×™', '¾ûB+qÐä×™'),
('3ÏkMfâ9jæäž]“', 'wp-content/themes/twentyfifteen/languages/twentyfifteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†°]Žò0´wKÂ4—™tôi'),
('3eUþÊ@;­`¶ñ½O', 'wp-content/plugins/woocommerce/includes/gateways/cod/class-wc-gateway-cod.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆá.Â¼­¥9º½ÁP—''¶'),
('3k­¨oW‘5	k[mq', 'wp-admin/includes/continents-cities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KWÙ›¾‹ž3ÑéÇ'),
('3¼á¶Y%a6ð£‰Ì', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ï¥xQb[xÒ¥Ó7’U9'),
('3ÃløáÛV9Np„', 'wp-content/plugins/wordpress-seo/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žï‘Š›ìó3ÚëÇF'),
('3Ùæ“°@n£¦ë˜KEº', 'wp-content/plugins/woocommerce/includes/class-wc-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ‚‘$dÇt&Ù‰üc§'),
('3ÛÕé''º°ÁRKšBfý', 'wp-includes/js/tinymce/plugins/wpdialogs/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'êû±G‰ã7˜(ttâ@¸'),
('3ÜùgÊ	V<…Î5', 'wp-content/plugins/wordpress-seo/admin/class-snippet-preview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$~0Oö@Z	\nä—“»ö…}'),
('3Þ;*4¦1:SÌ>Ã¢ÿ)', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎÁŠûäLbÌ\0R¶)'),
('3âÉfQ3àhð5[À£W¹<', 'wp-includes/Text/Diff/Renderer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë¾úˆ†àÁ…Š¢è¨)'),
('4"^uïYu­DØæÛ—CA#', 'wp-content/themes/twentyfourteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çâ¢º–Ö-”r8kÒQèT'),
('4"óÐ:-Ün#\nãDréû', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/ajax-loader.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0ÍïÃ\0ßºË}²PÛW'),
('48²VtÔºš+^Xô', 'wp-includes/pomo/mo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zê†hÈ^2¹.‘ßtÖé²a'),
('4>wÆJi¨7]™$+û', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.time.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã~Ñkrâr@ºŒb5^'),
('4AIŽn09ˆ†7c`', 'wp-includes/js/tinymce/utils/validate.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hfå˜\n[™ÙºííVÆ}4'),
('4Aáª¨}O¢¼¯?½ª', 'wp-content/plugins/buddypress/bp-forums/bbpress/view.php', 0, ']>\nÞ.*°4,ï}5½Á', ']>\nÞ.*°4,ï}5½Á'),
('4Jfæ«5C>ºÅšóR', 'wp-content/plugins/woocommerce/assets/js/frontend/single-product.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0‰ôáà`‰ËIÝÆ>'),
('4M™¹50Ñð¨¡Â¶ãß', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u£üä61´× àßéã4'),
('4PÐº09¨×Ø\Z¼öû', 'wp-content/plugins/woocommerce/assets/fonts/star.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3\\¿`|Uª2ý€ž±'''),
('4aäþ[Iº}çØÜHÿm)', 'wp-admin/css/deprecated-media.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®õ½:+QZ¸OnŸÿj}K'),
('4œ@x(Ó/YŠ´G}ñ', 'wp-content/themes/twentythirteen/images/dotted-line-light.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3¯¶´<‡(‚È{IW»'),
('4Í§ñ‘îB›)]£i>x‹', 'wp-content/plugins/theme-check/checks/textdomain.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë¯|™½šN¡,S—'),
('4ÓsoA€äìÀÎ4Å\Z', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-script-loader.php', 0, 'ƒY¹I!ZnL3¨w', 'ƒY¹I!ZnL3¨w'),
('4Ópr(ëpî¸Þ0\ZMy{', 'wp-content/plugins/buddypress/bp-themes/bp-default/forums/forums-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý8jÜå¢?˜¤sÈ¼¿'),
('4Ú‚œÙL$¼,K[œuÌâ„', 'xmlrpc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›¤·\Zuøw¾÷nÆ»1÷ò'),
('4íÕô¡Šª\nâÉî®ãÍ2', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/invites-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«Û1¨úWFÄNhÙ×M•2'),
('4î²pB©3[ºY#¹õU$', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/responsive.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~9<,x×{lu5ÚþQò'),
('4ôècs8O$ÊhãN', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-ajax-response.php', 0, 'ƒÞWéÎînâ“Ä‡', 'ƒÞWéÎînâ“Ä‡'),
('5x´©ßæðÿ+ZÏ‰GÕ', 'wp-content/plugins/papercite/bib2tpl/lang/de.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eíC}³hðŽ:Žˆ3©ö·V'),
('5ê?‰y˜Ä<Ù2Ì', 'wp-admin/css/dashboard-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÞÎé`Ò/Ê[n”ê¦G•n');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('5/Íè3JÇª»³þtµ!', 'wp-content/plugins/papercite/COPYING', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hnlµfýc‚ÉüÇ¥W¿ED'),
('58çdá`S61K>Û®†v', 'wp-admin/css/colors/blue/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c=SHí¸¸Ñj\\sH?©J'),
('5?ëßÆ×‡RR|E^Þf*', 'wp-content/themes/twentythirteen/images/headers/star-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7Š…¾¦\nšON”x\ZZC'),
('5C‚)\nWu¾ê½/FÒcK', 'wp-includes/js/plupload/wp-plupload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e;ý2Ï@_e‘ÐR|'),
('5N„›àºc{˜¾”>›,·', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/post-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇËGÐ÷‡µO~‹e=óõ'),
('5Z¬ÌäàSÎ¼ãvÙ`6—9', 'wp-includes/version.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ç–itŽ`|f1,'''),
('5\\h>óÎw	—‡NË', 'wp-includes/registration.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q˜ÏH^Ü²³»I¦ÐiÚ'),
('5]ÿôÃ/€„„õ\rÐ', 'wp-content/themes/twentyfifteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vÒ¼jT`ZóõUbªÐ'),
('5`à]\\Í­i\0¥ßí\ZJT', 'wp-includes/class-wp-embed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜xë—«ø=súw2¾'),
('5z/âŠ§Ió¾2œ¢?Ÿû', 'wp-content/plugins/theme-check/checks/time_date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„T•&VÙvY¤„LJ¬¹V'),
('5—dê4¼ñÄÇ˜a[¦µë', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/user-add-new.php', 0, 'ô`"ÿk©Ë0à!ãØAôG', 'ô`"ÿk©Ë0à!ãØAôG'),
('5`5Ü.vª\0Ë3''v', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post-form-anonymous.php', 0, '\n¹Ò>æz²]I¼p”_g', '\n¹Ò>æz²]I¼p”_g'),
('5±bY‰	´îCw;Ri›', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/jquery.color.js', 0, 'ì˜³X„ìÉÞoïæ¸', 'ì˜³X„ìÉÞoïæ¸'),
('5ºÇWB¦®$£“î“l€', 'wp-content/themes/twentyfourteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g%VÒ”ÑêêøŽÔªc¢'),
('5½ÜÇ®{:&kÌÅýTÈå', 'wp-content/plugins/woocommerce/assets/css/woocommerce-layout.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñ£{¸küE%L0ì{åÆ'),
('5Í9™!ÉsÙœgˆÅ', 'wp-content/plugins/buddypress/bp-messages/bp-messages-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Üï$k•ö	ºt>õ=æ§'),
('5ÑøÝ±ì1¯±Ô`r	3', 'wp-content/plugins/siteorigin-panels/css/front.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²’2bûÜÐŒÄÃ¶‹l'),
('5êðˆœáÊ½9¯y=¦f', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð_f+à{×G³q¹†#:Â'),
('6räÀw	üqµ)ƒ·ä', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PPIInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒºm°ÄŽå¦\r"³BxÊ~'),
('6ÛÚß¨X/€¿HL', 'wp-includes/js/mediaelement/wp-playlist.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É˜Y8@vðå''Ù¿³'),
('6A¯yã-¿<FþkQœÿ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U™f‚roËÆ‰Ø\nÙö,'),
('6#¢ÃO€ÈZD}¬v6f:', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-universal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q+Ãìú5Œ¶“&zßÞa*'),
('62™Là#>…?¿ÝgØ6’', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fÞw½®á>˜R;u_a'),
('6;I(ÖH²mÉ%¬Ãfº', 'wp-admin/css/farbtastic-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰ÿ»qà@!!µEkÂ'),
('6S9à6A†\0$r ÙèXýC', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/forums/forums-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r³é)~ÉÃï\rÏlÑF·'),
('6Y«çÖI…B’«wH“[', 'wp-content/plugins/buddypress/bp-forums/bbpress/statistics.php', 0, 'Òõ˜k±qôC¡»WZùæ', 'Òõ˜k±qôC¡»WZùæ'),
('6[fÀ9¸?†“ _Ç', 'wp-content/plugins/wordfence/images/icons/bullet_yellow.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J&ûÞÓÉŒŠýìîÔ”Q<'),
('6‚]jàvÙW¹k\r3-ç', 'wp-admin/load-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àZ2$šï]çKpÒj)ð¨®'),
('6Ì ,õø_‹ìqòêùu…', 'wp-admin/includes/class-wp-filesystem-ftpext.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Éµä\r½Ö×‰>A°ÌÉxë'),
('6Ù¨	Îÿ:{”^Dá‰', 'wp-includes/js/jquery/ui/accordion.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=eQ…¶\rw"í­>ÛÔë&'),
('6àa*¡U‘2JxÅ«¹²', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Symfony1Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L‘øò©Q\09§mšM˜'),
('7d†LÐ­¡øœ‚{™æˆ‰', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AnnotateCmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ßcsD‰h%éŒ[p!˜4"'),
('7eÞ¨$ª¾üùÑ‡0™¹º', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MoodleInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿î}‰§‚ëÍÝZ™ÜÒ'),
('7|oOU›’ùz\0Ef»œä', 'wp-admin/network/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡"?}R2{8\\¬ƒ?Rê'),
('7•Ï 3?ëÂYv€ò', 'wp-content/plugins/buddypress/bp-core/js/widget-members.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Tëy Á‘‘¦Ð6‹ÎS¡'),
('7žùÓdï®1“âFârÝS', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/css/mijireh.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',w¨6?k0ž.‚N›0àÚ'),
('7«%Wy~×¹P?«xòç', 'wp-includes/js/tinymce/skins/wordpress/images/playlist-video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥lzV6`wmZBsÏÖ'),
('7µØO+²»¾—ŠÇ‹''n', 'wp-includes/js/mediaelement/bigplay.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê	\rqmÐ^@$Â’ƒóÈ\r'),
('7ÀcîÂ¢)ÜæSóebµ', 'wp-includes/js/jquery/ui/menu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h_²÷:7/aZi¨Í$D'),
('7Àc÷.$P!×"Œò¹š†', 'wp-content/plugins/wordfence/images/sort_desc.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©<„®ÕjÿŒ_³ËŠR2'),
('7éù!Á~þ™Ú“D™„‹Áœ', 'wp-content/themes/twentytwelve/page-templates/full-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™NäÕ}Ï®N~«Ž"ÅPat'),
('8\n›à,?ûîf-*8''', 'wp-content/plugins/woocommerce/includes/admin/settings/views/html-webhooks-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.À›¦éNC«T¦'),
('83(2=X<4Ø\0Æbþ­', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›‚¢à"ºlò?ã¤ùªE'),
('8*`êB‹ù¢ƒr¤!H³', 'wp-content/plugins/woocommerce/dummy-data/dummy-products.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ydƒ^Wâ"=ápÇ:•:='),
('80 Ÿ‡0Ö›^&°éOX', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/readme.txt', 0, '\0Ò“d+Uð‹\0”<d{$', '\0Ò“d+Uð‹\0”<d{$'),
('82NGô@|ÍMâŸ8|\n', 'wp-content/themes/twentyfourteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹±*<ƒSÆ"‹£\nä‚÷s'),
('8=ÀIå¯ôa÷%œƒkÒ~¯', 'wp-admin/js/editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð¯!—2u»døÑR^\r2^'),
('8eü¬zÓ­üÅ3Ú$Í', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_P12Signer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/fX‹îùãÖQùÿŠ'),
('8™Ã+G²àaæ”·¬vº', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/GravInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>âÞ‘®»—Uì@^LŸ]'),
('8žR6ÚDH°Šq£-{Ž:`', 'wp-admin/includes/translation-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘¹‹yÉÿÒö@B}C~D'),
('8©@)ý±6yg[yåsQR', 'wp-admin/css/deprecated-media-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®ÁAêpE~Ô-Þ…JYW'),
('8°¡fÙdQµ…ÐkÙÈa¬¤', 'wp-content/plugins/woocommerce/includes/wc-formatting-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V\ra¬\\©Ðwïï¤@”Œ'),
('8Ã›ZE‘Q$}UPöT£à', 'wp-content/plugins/wordfence/lib/wfCrawl.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬ä\r#Qqoá}v9’'),
('8Ë6ï ©ÞÂŽ$`“á', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/wp-ajax-response.js', 0, 'ÝÆ[5}¼´©î¹zK×', 'ÝÆ[5}¼´©î¹zK×'),
('8ê¹¥.AHàWYGõRÑ', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-graph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%Õ»ÿ§²¿½Œ³ø•‚ØÆy'),
('8ÿ\n1n”!QDÖï ä;Ž©', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ð“±ìr9À8e¨zæÖ`'),
('9º\r5''XùýÆ>?’', 'wp-includes/js/customize-preview-widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ¼z{ì´Y}qÓy¼Ú´¾'),
('9ûh[\\ú ''3ãõyç{', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/orange.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“Ô\nX†,Á\Zý4‡œn'),
('9Ïˆ[Ÿ1d{Äôî@', 'wp-includes/class.wp-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MC+êI>£­LƒDW¿°'),
('9/ÉÅÙEù‚ƒ4<v', 'wp-content/plugins/buddypress/bp-core/admin/images/icons32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›ËhðQ\0’è—N!ËW\r'),
('9:ù—d¯o\n‘ðp`Ry¨¢', 'wp-includes/js/tinymce/langs/wp-langs-en.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øfŸtS±uc¦.k»7a7'),
('9@ã»X¢,¦ÄÉÎ°É4', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/license.bgiframe.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\k<ŒÛ3=šdUh¥ƒ×'),
('9HÅÁÆõ½½í8Ð8/ø', 'wp-content/plugins/woocommerce/templates/cart/cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PˆšÜ—í/Õ›OzónðÖÒ'),
('9€&Š³ýÎDS^¡kƒ¨B', 'wp-content/plugins/google-analytics-for-wordpress/admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('9Œ!5uý~³ô\nO', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'êœ•eK“‹'']GõK™w'),
('92¾·­ùDÎ,d4\0ã', 'wp-content/plugins/papercite/format/apa.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jçRuû‚ÛHç=	:e\Z\0'),
('9—} B^¿²?	ë"ë', 'wp-includes/script-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|Cø4oáPêøLŒLc>Na'),
('9ºUä	äðˆˆ4e˜oü.', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('9ÕÒ¢Õì9ñëd\rëŠY', 'wp-includes/ID3/license.commercial.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÓK×GD â.}¤c´H3¥ù'),
('9Ø5ï¥ix®Õèá-ë', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/edit-post.php', 0, '¯›•ñÜ8Þ!ÎfôËúfÁ¼', '¯›•ñÜ8Þ!ÎfôËúfÁ¼'),
('9êªéËÁxZ^XF', 'wp-content/plugins/siteorigin-panels/inc/admin-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'úÐÊ÷¹ÆÖeë\\fJ'),
('9í‰æs´3ÙSZ,pé8g', 'wp-includes/images/media/text.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z¹‡sæä0÷ÈŸQ€K'),
('9÷ŒêÜ\nhP„@ó[Õ', 'wp-content/plugins/woocommerce/templates/notices/error.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—Ÿ¥±XN}Ý`­š'),
(':{Ãâì{7Ê9°‰Ÿð', 'wp-admin/link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c­ý×Naàbá¡äÓd'),
(':®|LûH6(Îßcµg‚Ö', 'wp-includes/ID3/module.audio.ogg.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÄäÏv¥N5OÛ¬…á'),
(':5€ûÏ‡F, ¨é»þp²', 'wp-content/plugins/woocommerce/templates/single-product/title.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÃJJsbe1Â{ì‘j›Ÿ·V'),
(':<oVSëý–üˆwÄM', 'wp-content/plugins/woocommerce/includes/wc-webhook-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö{ÖA’­B:1ocø{æú'),
(':<·$ŽÍ0,w"&e({', 'wp-includes/class-feed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éÇØân¤LIŠjéZ<U'),
(':gá‹¬•³\r\nIÕ°ï;¿ñ', 'wp-content/plugins/theme-check/checks/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý¶˜·ÐÉ?®dÂ¾Ä'),
(':mwvK\rÿž”‘‚Z‰Œ~', 'wp-content/plugins/wordfence/images/wordfence-logo-16x16.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zyð3zŠ R¼³ø09H'),
(':ŒŠå%H`!¬ûá\rè€Z', 'wp-admin/js/media-gallery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2–Ñú Ò’°»¡ñºn'),
(':™ïª5ó¥-¯ð¢\ZãhÄ', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J¬Pù”Qe=	Eþ*q÷'),
(':¿¨Xï&eÜÓÍ£–§À', 'wp-content/themes/twentyfifteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä¥ñÂUÆSáÿt¯+¯'),
(':ÉÀ(·s;d€ÁÛ“M', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-nb_NO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NŠ Âìs­Å†½¬im'),
(':×G2?1ðH¦ò]R}»', 'wp-content/plugins/buddypress/bp-forums/bbpress/xmlrpc.php', 0, 'Êi5i\\¥ÿ=6QÃ', 'Êi5i\\¥ÿ=6QÃ'),
(':ä£,Ôè¢O·N1yÎÁ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9àmþhƒ`	œá˜f‚¿‡'),
(':ïXqÝ¯J\\¦5Pò¶4', 'wp-includes/images/spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°£Ýã1c~''ªdvÔvHq'),
(':ùnÌ£RMëti#šõ=', 'wp-includes/images/media/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†taCAñ¾Åþ².·çZßÀ'),
(';Þb­fÈ–0ÿ–¦­x', 'wp-admin/css/colors/midnight/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†EÖ=Y¹â¸vÒ^Î¨µ‘'),
(';,ã{–nª€V\n-ÎŠK‹2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PiwikInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó…uÌŽ¢¯#!?5—'),
(';1Ñ‹#ÁY_N„¥t÷', 'wp-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Äƒ9Yé=“h£Wå,WÆP'),
(';RÞyh›ëŸÐRxK\r', 'wp-admin/js/farbtastic.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§:óT 2Aq]†˜þê4’'),
(';“‡‘½9ýÇŒ¶_''', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/qtip/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
(';ªr]DÃ–$HÃãÝ[C', 'wp-content/plugins/buddypress/bp-activity/css/mentions-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œdi°Ù²]ŸZ	ßè'),
(';Á"ÂCèÁØ˜Ü³ƒ hc\Z', 'wp-content/themes/twentyfifteen/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú$zxâÄø6Þ““M#'),
(';ñWctÔÓç*+÷¬BrÊ', 'wp-includes/images/smilies/icon_surprised.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')™rµÍÑñài\rÙ^@8½‡'),
('<Ñ¾ÈIÈ«¢¨¥­', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ja.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•OÅÇÕ5ƒõfÄÊRýDñ'),
('<FéëïPzÌ22£‡~', 'wp-includes/js/imgareaselect/imgareaselect.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}(ÊÙ()³Ö3 ‡µóµ•¯'),
('<còc’WXÎ3Žù³•Öu', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>Ôé­>2bH/—äR\r‚'),
('<s3ï.™ÄøËÏ’´!$—¢', 'wp-content/plugins/woocommerce/templates/emails/admin-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²aŸ™_OÊ‡@øSSì'),
('<‰9þuþj³®ÿ„!Á$', 'wp-admin/css/install.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬êÿ0"2WIÊE€ZÝa'),
('<æhjØ	Ž4½»˜4aÐ2ö', 'wp-includes/js/utils.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·ø–¿£oþàŸo,ÃŠ'),
('<ïÎuê¿–\ZÜœµÇYÔ^', 'wp-includes/js/tinymce/plugins/wpeditimage/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿©¡ƒ\r\n‘ëÇ÷KT'),
('<ð;z_àh{³†4HšmQÏ', 'wp-content/plugins/woocommerce/includes/class-wc-product-factory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á‹é‰œŠ˜n\rþ¬e¾´'),
('<ø¡ÄA38f7ÜóÈ·¶u', 'wp-content/plugins/woocommerce/includes/wc-user-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸6{àÚ÷ö"·©‚£'),
('=\r;uÚ5–ºí<ó¼''¦', 'wp-content/plugins/buddypress/bp-themes/bp-default/registration/register.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<ì}‰9Þgï‘–W'),
('=Öö!àé[mˆ°)5²', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/images/logo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hîÓmŠã/îõDêö'),
('=v—>1›fp•E‚”', 'wp-content/themes/twentytwelve/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%òUÄH$}X ÷éø''®'),
('=9)œ‘­)Â\\Õ–', 'wp-content/plugins/wordfence/lib/wfGeoIP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£JŽ\\}ßÞzÝY%Q'),
('=.?ºŸn‘œÙÌ®¶ÔÛ)L', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹†~“½(qqõK\0 \rTŽ\r'),
('=<ÇŸ•sé=;„rßzØ\nZ', 'wp-content/themes/twentytwelve/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8*ªË¸”^a›¸ô}6'),
('=Fzp\n)¨YNä6´‡', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/bb-forum.php', 0, 'BÌNÅðuËÊRÑ1„%Ç', 'BÌNÅðuËÊRÑ1„%Ç'),
('=Mä‡9íïgU(½Ò', 'wp-content/plugins/woocommerce/assets/css/select2.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EF˜Så[HzpœˆJrOó'),
('=WJ9¥I	Õ›Ú7[G¿»', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/forums/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xðŠ7u\Zî''‘BŒæ'),
('=féuñ¥A><Th–ÉÏ@', 'wp-includes/js/jquery/ui/progressbar.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ùS¡ø\rãŠ:©³;5Ø¦8'),
('=gÝßä<;ý¡3ŒÎwˆ', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ð“±ìr9À8e¨zæÖ`'),
('=týLRƒÊ—É½<Vb:', 'wp-content/plugins/siteorigin-panels/widgets/js/jquery.fitvids.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',0ë]x_:’;%I£ØšÐw'),
('=‚½VWžò¡¼ÂO¤rž', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-api-googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷IBêëÝÙcgÍçSåV'),
('=ŒÞIÅœ£ë4üŽåO‰|', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TuskInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R\\ûLëºµ''ð÷ãQ'),
('=˜Ó;Ô8‘N×.‚’Eó3ø', 'wp-content/plugins/wordfence/images/wordfenceFalconEngineSmall.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–sŸ*ífð&@7…=J'),
('=¯®"nˆXŠÔt­M¼', 'wp-content/plugins/woocommerce/assets/js/admin/order-backbone-modal.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹''(ÜWé”}ö6:}ž,4'),
('=°Šk˜[4œ“¢ ¼=Î', 'wp-includes/comment-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á<pCö@~ú%ìöt“'),
('=¸.¡°ùIiÊ;t¸IÙ\Z', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3÷°Ñdª¬ºHRŒ.¨å¥®'),
('>/kTÌÄ@Û¨°KVÁ_', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TheliaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R#tXîÉƒtÀ}7FI7'),
('>D®hð_]±dÆ4X©:|´', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PimcoreInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';÷JÉ;á`Æ’ nH¿'),
('>EÄõ$ð''n»²¾F', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ûz³gäÃ…‘¾m~—˜v'),
('>YJâÔ	z-¬åâØî^', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/AutoloadGenerator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't~ððž2³B`Ô™œ[	'),
('>hÐ©ìXX*ÿv1•©¹', 'wp-includes/theme-compat/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	ÑÃÞ´.''BäÊÖò,K¤'),
('>qlî+ªmÈ\05Ä¦"†^', 'wp-includes/js/customize-preview.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ix‡V¸ÿf)«Ì¥„#T'),
('>q¹âÜHÞóù)ˆ„I£C', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ª‘¯òlø5D?tR¬>'),
('>{*ñ5U1i¿.­ö•', 'wp-content/plugins/papercite/lib/UTF8.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üÂ›Šæ•Ü¿Oˆ"„à¨Ã'),
('>‚A‚Fú9-\rC8c¬²', 'wp-content/plugins/woocommerce/includes/class-wc-geolocation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	Má\n¿þöÕ£©ç='),
('>‹N#öêûÍÁÏtwŒ`„', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-googleanalytics-reporting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚Èà1Û+?+}ä©˜Xj'),
('>¨ö¢\\ý°Ëœú©k', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MagentoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ{ü’F‹‰ç¹ÁÊs'),
('>©2´Ü§ÿEHuÅ’WfM', 'wp-content/plugins/buddypress/bp-groups/bp-groups-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z’>5FYßÁqÿ@Nc–'),
('>©ÆX¹\rýbõßÚŸ®$W', 'wp-includes/class-wp-image-editor-gd.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µå‡pÅ™ê%úy´§F•qf'),
('>É9i…ån¥1\n?`	Žëz', 'wp-content/languages/themes/twentythirteen-es_CL.mo', 0, 'E»°õiLÕ¢Â=TœÊK', 'E»°õiLÕ¢Â=TœÊK'),
('>Ô$\\Î¤€Ù’a~A°', 'wp-content/themes/twentythirteen/images/headers/star.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿÓÄ9¼co56±ŸQ`'),
('>ç¾¨k±Œjr{¿‘è', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-permalink-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ì‹mp=F¶ôÖ–Ï,â'),
('>òsö¬Iã¬y?q¯lˆ', 'wp-content/plugins/siteorigin-panels/css/admin.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'QyÒ\0Ô;${ZÖà9jŸ’Û'),
('?YvŽq_ê—ÿ³Û®XO', 'wp-content/plugins/wordfence/images/sort_both.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Åá%ÙB¬QxÁSV.D'),
('?]ýPû.£˜1ÿ´ƒÌ2b', 'wp-includes/js/tinymce/plugins/textcolor/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I±¡D*T4’º“ð¶jÕ'),
('?^VßýÛ$k“ù`3öÑ', 'wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4Ã‘óâûõ…«è]Úë'),
('?˜væi³°{ÕTÞ\ræ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R¢=%‰`›Ü‡0u+žëx'),
('?’{K¯3ìOšiÞ|Ëýu(', 'wp-content/plugins/woocommerce/templates/loop/sale-flash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd·LæÆM¡îr°Ç¡Å'),
('?•I/íïUÖŒË¢3d€C¢', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹tLkšÚáÒÏ5×4bF'),
('?Í{£.-lùoéê½Ø', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-global.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ¶h„×&ü)-'),
('@%_ìAýæ	²…\0ÁZ\0Ï4', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-my-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ*›„JºhèS|—Å€ÝŸ'),
('@Vó$õKÆçò<Þ1*à¬À', 'wp-includes/css/jquery-ui-dialog.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'njäïî´±S•PGÖ=—'),
('@hCf¼‰Ë»·´x·o''»', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/laser.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢·awünŒ aÞÀË¨-'),
('@k/ Á¡ŒæI‰?T,', 'wp-includes/js/jquery/ui/datepicker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#‘Æx­˜q ,Ê3Áx/K'),
('@€žÌ˜9Š#¯LÃy(ÐÚ', 'wp-includes/images/arrow-pointer-blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'wŸübãÎ‡*L«²Ã[»ù'),
('@­)ßVr‘a’''çû\0cÈ', 'wp-content/themes/twentythirteen/images/headers/circle-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–0(ý§pCg^e¤þü'),
('@ºXD\nÃ\nRN†tëÍÓ', 'wp-admin/images/menu.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á\r9#‹dóY`	Œÿ'),
('@Â¿Ç²d4<•øúß¡ø ’', 'wp-content/plugins/wordpress-seo/css/edit-page.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ì­öa—F n˜c1‘ ''×'),
('@Ç¡±®ý ò¶"&Â27', 'wp-content/plugins/buddypress/bp-forums/bp-forums-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾Îø-IZ©‡KêóÀˆ'),
('@Þ;5‹XõñV¨”OÆZ', 'wp-admin/images/mask.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üö“g~¨"æÒJ÷²ä©Ž™'),
('@èm¾·ëÅOÅÝW', 'wp-admin/admin-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„þs¾5Av©éw€xZ\r'),
('@÷sZö”^™¥Óèqv', 'wp-admin/images/media-button-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#ÛWIå…\\¸Ð?ÈÉ'),
('@ø‘+âTÎ„''··¥Ù¤', 'wp-includes/ID3/module.audio.flac.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øœ,…gë¼\0.ù¥ši“'),
('AE¶ûô[€`Œ·•', 'wp-includes/js/thickbox/thickbox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´º‚CØeRÝÇþwSï‰%'),
('AÈÜü<áX°3‰Ù’g', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-pass.php', 0, 'Ù6C)3>z:‹[wƒtXl½', 'Ù6C)3>z:‹[wƒtXl½'),
('A#FÌYìç_ÉO‡W¡', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/TestCase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ùÍW=qUL¼mö^*³'),
('ABl¨#´lJ§ÑˆLãÕZ', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-debug.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k<KˆO˜ÝŒgÏÓÐÛH'),
('Aa÷@J§÷óñÂ×Å·', 'wp-includes/js/tinymce/plugins/colorpicker/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fí{ï»''sVnÑˆáÓ¹|Ä'),
('Ai¥YzF%¿Sœ‡¡õõd', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-reading.php', 0, 'ÑózŽ½àÝa«tÖi`ü', 'ÑózŽ½àÝa«tÖi`ü'),
('Aißß²w¤Ë™{D÷¢hN', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/streams.php', 0, 'Û,ê&r™1±„‘^', 'Û,ê&r™1±„‘^'),
('AxÐ .¬L°®U˜Eî¡', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/screenshot.png', 0, 'ä%“$-|‘¶ç2''.ÿ‰†', 'ä%“$-|‘¶ç2''.ÿ‰†'),
('A{&Ï Š¢V>ì²Îs', 'wp-admin/css/login-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çbÅ3ê% ÔüLNj'),
('AŠõ{çuð(€·|7£¹', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile-edit.php', 0, '†¼;…´	 {Ö@·Ï"L', '†¼;…´	 {Ö@·Ï"L'),
('A‘DÚlªá!yñƒÓ1¦ä', 'wp-content/plugins/woocommerce/templates/checkout/payment-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?}~×=}åÏµÈsýÞ'),
('A§(ÉžL6À>[ÇÐÔ', 'wp-content/plugins/woocommerce/templates/order/order-again.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Nêl›é!\\Ž¶Ï-Ÿ\Zâ'),
('Aý°‰$hÜõÕ`Qøa', 'wp-content/plugins/akismet/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ïh•¯ PëZçÀºÝ¢`Ef'),
('BK­q¼K´1´C¡', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'â%hC¢¼Q,yFœa-(H'),
('B†¡j„)ßÐq¼DŠS', 'wp-admin/install-helper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T€°ú¿RÃ~î‹þÖÛR3Z'),
('B¼	tï#à{Aî‘ÂØ', 'wp-content/themes/twentyfourteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤ó¢[ü\r#©%¥UM‹'),
('BÔÔ9[/ý ÝûDÝ‰¨¤ö', 'wp-content/plugins/buddypress/bp-core/bp-core-moderation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$v¦fœ<üœTúòg¬'),
('Bó¢Ã¥“r‡ÅÆ*ËIs', 'wp-content/plugins/woocommerce/includes/gateways/bacs/class-wc-gateway-bacs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}E”–D’sŒ`\0ôˆ‹ƒÎ'),
('C2}	¶ù2ƒï†-¸c‰¹', 'wp-content/themes/twentyfourteen/js/slider.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'UMÍ>§£†?ÚV!í·L'),
('CS‡ãÊA30§»"Ž—”À', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd^S²US“Œ*gœA¦ß¡'),
('Cbs¤-˜x«\n?Ž\Z;~', 'wp-content/plugins/buddypress/bp-settings/bp-settings-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Ìx&ìÈ\\5šñÞVmVb'),
('CiÙšæóba*õéú', 'wp-content/plugins/woocommerce/templates/emails/customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'áT£«ºv§õ\rÃ$ør'),
('CzãÜÔ+.Ok1Îyršõ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install-rtl.css', 0, 'È¤=Í…ìÜ÷±6h‰RK', 'È¤=Í…ìÜ÷±6h‰RK'),
('CƒðŸXC&&*îØ[‹*N‰', 'wp-content/plugins/woocommerce/assets/js/admin/term-ordering.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Dš4ÕB!oÞMïIÌÈ'),
('C•Ç*ÂqäIÂÏ³Íê', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('CÒ~4N‘žOäHÀô', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WLÛéŽ³6®î”QLº'),
('CÜ|QÄKO¢EQ½\rtî', 'wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð{„ßÆˆ\ZÔ˜ß>â]Ò'),
('CêöÇ÷fº×ÙšÁ(;w\\''', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-es_ES.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚#6Xos¾—E²Ã´'),
('Dm·\n»½z—H‚ÃS”ïï', 'wp-includes/images/crystal/document.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰''^cšsÀùÄD‹ù3T\\'),
('D&Í©w¼°å&Zné´', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/external.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ¾{Xow”Cém^‹)þ'),
('Dà@Äk­C”}OsÖ%', 'wp-content/plugins/woocommerce/includes/class-wc-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C<0\\	æ8&â+`–zËñZ'),
('D.÷îˆö:•\0¾¥SÔR8', 'wp-includes/ID3/module.audio-video.asf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A‚›Hå!î¬0ÙÐ –s¸W'),
('D6mËeŽr{pKèO’', 'wp-includes/locale.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†KÛo\ZKf:ršä’Z'''),
('DU½ã¨ÕnÇó[RgdÍP', 'wp-content/plugins/woocommerce/assets/images/calendar.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Cz‘É?š‘ñ;šòw·˜'),
('D|fÍóÍU#Ù•?æÖ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/upgrade.php', 0, 'wp+?p ¶\\¤÷ ±ÊÁ', 'wp+?p ¶\\¤÷ ±ÊÁ'),
('D’Éñ¾Õ)baëkÚÅ{ËË', 'wp-admin/includes/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾T"ARò´ìhyÿÛºCQ)'),
('D¥ÕÓÖ3	©ÿ­NÙŠwÌ', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-api-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð0Š8+ÆqŽ½ãíù«'),
('DÕ¹ïÚø»åØ$Oaª£éô', 'wp-admin/css/colors/ectoplasm/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ZgPœ\0TS¯ ÍÛâ)7§'),
('Dï²Ö5\n''å\\¥Ã~W“‰', 'wp-includes/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›#Y¤šŽÄL±àoZ'),
('DÿšÄÉ¢õxTàÀªJß-', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`“ëÆ^å¾ÚÕ!ÈË“'),
('E#ÍÕç-v37Ù6ëÅ¤', 'wp-content/plugins/wordfence/wordfence.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}q)KTó`s[®\0`¨a'),
('E4í×fu\r#R:k!jgh', 'wp-includes/js/wp-list-revisions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´ÏOBy¾†MKØ/Äl'),
('Ehû¡°Ëýí¹ìÐ@aq»Œ', 'wp-includes/session.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼† ''^9æm})Ùûj_'),
('E„»(ýzRA1;eNÇqD3', 'wp-content/plugins/wordfence/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2ÁèeØÂÂª­ë\\ÆÁog'),
('EŒ„¤»\nÇ”f–Šm‰', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾;Ûi.p —0û*³'),
('E§ûWËlQbºŒi', 'wp-content/plugins/woocommerce/dummy-data/dummy-data.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ÿ0ß#¾¾-_.ú'),
('E¸Vàó÷,Õ%¦×,SM=', 'wp-admin/ms-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô/öÄ¦Ã½”º:E‚'),
('EÅ@ìo_ØhGq(TÉ', 'wp-content/plugins/woocommerce/assets/images/ajax-loader@2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×4¨6¼n9šã“N5¢ç'),
('EÖvíupÓTf9’òaàÀ:', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-importers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›Ô­¼”B`fmžŠlŸ\n'),
('EÝ (½ïÇ’#j‡¬i0¡', 'wp-content/plugins/buddypress/bp-groups/js/widget-groups.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't[²©N¹ôzl"ÚèA®Ò'),
('Eýî7·''L¾ø"z3¹ß', 'wp-content/plugins/wordpress-seo/admin/pages/internal-links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡UõÄ)åD0‰Ë‡œÅŸiö'),
('EÿKn›/å‡–»(["p', 'wp-content/plugins/wordpress-seo/frontend/class-googleplus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lÉ)\ZbÚˆDRÛÛZ?'),
('Eÿ  GXæ–ï/šÿýSÉ', 'wp-content/plugins/woocommerce/assets/css/admin.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š†Éu±‰Ž)WõÕ*'),
('F–HÈlëe“É#Ý', 'wp-includes/js/tinymce/skins/wordpress/images/more-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l,×‰rÏ%¸^x¥%'),
('FM<™Š~²ºdÐìµ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/plugins.php', 0, 'ÐrbæWŸÞsNKöÉÓû †', 'ÐrbæWŸÞsNKöÉÓû †'),
('FàèOÛ£ ÿÔÿçëg', 'wp-content/plugins/wordfence/images/wordfence-logo-32x32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦¶ûáÖy¥wŠZÀã%?ü'),
('F/ì±u‘žu\0.bHýCN', 'wp-content/plugins/wordpress-seo/admin/class-sitemaps-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë095q}ØÆÃƒ!_ê.˜'),
('F58M´IEb°û|îºoAÆ', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/mijireh.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß«›u’¦$—Oduƒ†A‰û'),
('F?çƒº[\\áü|2œîfÕ', 'wp-content/plugins/woocommerce/templates/global/breadcrumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Òi2ˆ\nsÖN”›ü=èz‡‚'),
('FFvŒ‘V;vð8/ž\rµ', 'wp-includes/SimplePie/Misc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎÍæyÆ-ÕØÒ^Î\ZK‰'),
('FHŒŽ¼30m:½¸s›¶', 'wp-includes/js/tinymce/skins/wordpress/images/dashicon-edit.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xRÞ	¬YµXžÔÛÝ¤äÞæ'),
('F‚&Z†–ÎÃhæÏY\Z)S', 'wp-content/plugins/siteorigin-panels/inc/widgets-bundle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\«á¬*c†8MÞZÁ7iù'),
('F–©?h7@Ñ´Æé¬UO', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.jquery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gÜêïñµwû1”WÏ‘'),
('F­¼¥h ŸÔPÇ¼æ2Þ', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°Öþƒ¿„¯žHeÕ‡ž'),
('F´BÓùmÊ7ñ{—G!', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MODULEWorkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö¤Ù¢júú@±›\nN­'),
('FÁô¬Ãƒ\\ŸOç¡fgî', 'wp-includes/js/tinymce/skins/wordpress/images/gallery-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Êî1ìíõv•ŠR'),
('FÐ''£B¤/í4{JÍ{w', 'wp-admin/js/edit-comments.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'áÖM@#þ¬Õ^á`P¡_'),
('FàÛú,;×¼•Iä-v?˜', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.init.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç¹ž¢|\\€»Ö iä‹˜¸J'),
('Fè lpq7²úuí', 'wp-content/plugins/woocommerce/i18n/languages/woocommerce-admin.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PÈËïÌ&,·æ½ŒÉ±jpº'),
('FíDœ½¡¹Ñ£ð?/ê±¼', 'wp-content/plugins/siteorigin-panels/widgets/widgets/list/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿KÇm;ñ¤<mèŽðw'),
('FóÂï?æ‰C;$ŒéH\r\r', 'wp-admin/css/color-picker.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µ„¤ÓQ¢îØ¢æ$€x'),
('G''ÉÕð…ÝJ‡0\r|MK', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-taxonomies.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$^ÚU£5ÄO!™\0'),
('G6Uæ2\01Rü¸“¢ÏJ', 'wp-admin/js/theme.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É>&#ÔýØrˆ´|`‡?'),
('Gm•aìE*ÁèFó1‡­', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-es_MX.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j¢ìJÓŒ{ƒ<<—à7§ÉÄ'),
('Gm¹™:†MÄ¾VÀ‘LÐ‰', 'wp-includes/js/tinymce/utils/editable_selects.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'y«Ë\0!eØfÀ…'),
('GqÜ@¯üÝÓgmå±ª', 'wp-includes/js/mediaelement/controls.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@õoZsm¤ïþ·ÎÛŠRð'),
('Guµ^¨/1ÆÔÕSñŽ7', 'wp-includes/atomlib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—eº.€„ì[êŠ\0\nfÁA'),
('Gyå¦ü·ƒø.×ñ:ÃÍ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œá©ë“à~äB¥6'),
('G€9qóñë=Ê¥[3?aè', 'wp-admin/images/bubble_bg-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R=[ùïØÊ;’çcßÅ'),
('G–7\Zžæ²I&:íx', 'wp-admin/edit-form-comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê¾0É±o,†´q;Å'),
('G¡·''ÉRÜÀGÈe¿åªf', 'wp-content/plugins/buddypress/bp-forums/bbpress/index.php', 0, 'ëÃiZUÇ·lŸ*ŠNÖ,', 'ëÃiZUÇ·lŸ*ŠNÖ,'),
('GÉ‡5Ã‡úQóÈ‹Ãi', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/bozo.php', 0, '²Üîm=Š\\²™PÕ~Ë', '²Üîm=Š\\²™PÕ~Ë'),
('H”‚Ž»R¥%AfQ?', 'wp-content/plugins/buddypress/bp-messages/bp-messages-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''ÏÛ+µjÖ)±;·‚ÂUS'),
('H+€E~™}§1QÛð½®Ù', 'wp-includes/js/wp-util.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9Êf1ŽöbQ\nëÊ­&2'),
('H1›Žè¤á^\ZJH†¥', 'wp-content/plugins/buddypress/bp-activity/bp-activity-akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÕwÃ÷¹3ËÚ¤ßŸ!êZz'),
('HoiŠMŠˆF€ÿ¤Ò[ë|ï', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/visit-site-button-grad.gif', 0, 'uåUçÝe†YGMû:pèQ', 'uåUçÝe†YGMû:pèQ'),
('H‡`HÇ›ïO.ºëViC', 'wp-content/plugins/wordfence/lib/menu_countryBlocking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»î\ZM2 \0×i1ÜÁHyÈ_'),
('H‹Z?n''DKhE©C', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/KohanaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z Š"IîóË/„ú…®'),
('H³6u ÈÙB·B%©Vú', 'wp-content/plugins/buddypress/bp-forums/bbpress/tag-remove.php', 0, '!–ÀÏlŽ=°ÍÌÖ÷Šh', '!–ÀÏlŽ=°ÍÌÖ÷Šh'),
('H¿®‚wlÁUÜí8†Í*g+', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/large-play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£QÔŒEå.Ûç€¥Øø×'),
('HÃ½ÍñiíZ¾U,H»L', 'wp-admin/includes/meta-boxes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sCÑRO×[#©‡Zn\rka'),
('HÊù‡Ó°y"ËÓ¤ËÀB', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-display.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆK÷à{eŠJú·”r'),
('Hð¼‰X‡2a¥€ß$Y½ ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹f±Ûk@u>`HŸUí¥aÞ'),
('Hû4©ý?4’\n°\n?r˜', 'wp-content/plugins/woocommerce/templates/myaccount/form-lost-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{Â+TŽÙåü¡ p<DeŽ'),
('Išk÷‰°ƒ×W´Y‘', 'wp-content/plugins/siteorigin-panels/tpl/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬÷üå£;)^¤d³¯/ö–'),
('ILª©Wa©p•&òsKz‡', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Object.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹ÛÒ+Õ¬ü·¾‘ûF'),
('I©Z½•:¤³ZÝÑTo®', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/images/credit_cards.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âT´¡˜hP¿}c\rÅ¥@Ü'),
('If@n½ÍÈæ;c>–8', 'wp-includes/js/tinymce/wp-mce-help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[A.Ô³\0XžC5¦ÖÞ¹z'),
('I#E„Hq|™pƒ^S~×', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/js/jquery.dataTables.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-ÏîcÅÎHÔŠ¹‰ñ”_€'),
('IFÊ_@?ùÄAJ¬zï', 'wp-content/plugins/buddypress/bp-groups/bp-groups-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü:¥¹G¢ŽÍwÅîZ[L'),
('Io9£þö6c½3Ž«3$-', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/CakePHPInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ø“² –œsû4£[Q'),
('I•Ä:BsÞ#×çÿÞ@×', 'wp-blog-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_ån:Èëõžá5ÂS¸5Ø'),
('I°Pà:ˆ]<rÇ5qCª', 'wp-content/plugins/woocommerce/includes/wc-order-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù£«›õ|v›eý¼á;'),
('IñV/’ðµ6¤sãÃø', 'wp-admin/js/editor-expand.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰ê³Æ-Š~>ÖHÅ“Óý'),
('Jnä_\rÈ’a)˜Þ.Ÿ\0<', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/favicon.ico', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã\rÅ`"ÌEµ^ÿy´t'),
('Jf¸3?ö“‡_rÛC‘', 'wp-admin/images/w-logo-white.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯*á¦,KÛìiþl‡Æ<­'),
('Jå~*ÒÕ§‚¾¥´Êäv', 'wp-content/plugins/papercite/lib/bibtex_common.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\v/«È‡wÚ2¶\\ä\rÃ'),
('JE±8Ô²F´{„-E', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/input-lock.png', 0, 'ÉvVâgS«‰Ú/!è&bö', 'ÉvVâgS«‰Ú/!è&bö'),
('Jþ‰E[¥7UÒÓ\Zï~', 'wp-includes/js/plupload/handlers.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—˜DK—#;³A±Ÿ7O…Á'),
('J{£Ö¹Zi^Ã¹x•I', 'wp-admin/media-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nGÂõsGQ×r‹/(%lò"'),
('JÂÄ¨ˆý•LykIŒ…n=', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-sk_SK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jj±ˆ³µÙÇ0õõjvX£D'),
('JËBå…>ZI¥õ¸FûC', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²\n= º¬''Vö¬"”D€'),
('JÞ\n\Zy\ZT0S:ð{±³', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>Î)B#?žÃÊ“XñÛ%å'),
('Jìˆ¨úø0ãÆ\0ÉÂÂ;', 'wp-content/themes/twentyfifteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r3îø“Z…9è¾éà;Î¥'),
('Jò¾¬´ÊOhÓýÐsDØ¾', 'wp-includes/js/zxcvbn.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡LÕ;ÐÕucÁ©¶<®ø'),
('JùtÔP[\\=À1‚KÌÁ', 'wp-content/plugins/buddypress/bp-core/js/jquery-cookie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zÇ+d1}ä$à@ÓMF'),
('K-ª|YâÃ7å1eûRSÈ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–EJó’	”¢è,å9€²Ö'),
('KY©oUCÄP½J©A+#«\n', 'wp-content/languages/admin-network-es_CL.po', 0, 'ß\0°‚‡°³P²´£ž?"Wß', 'ß\0°‚‡°³P²´£ž?"Wß'),
('KL¹ÜR9±kÖ%°Åe‚''', 'wp-content/plugins/buddypress/bp-themes/bp-default/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—Íë2k2\0Âgî®XL“¢'),
('K¦Ð¢W%,£·çí©xA', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_asc.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lV¹OÐTD§Œßõe°®'),
('KØ:1o{,«ÊnÅ«‡', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin.php', 0, '«ašÚ2Él	ãvá²×', '«ašÚ2Él	ãvá²×'),
('Kâ9Y*‡0æžòÿ÷u\r', 'wp-content/plugins/woocommerce/includes/class-wc-product-variable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥£<A?Y\r†2zGíÛ*]'),
('Kîß¢©ØÉ,¯ÞSÈóÁG¯', 'wp-content/themes/twentyfourteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WfsˆCu‡šÎÚï`}£ôà'),
('Kô(ˆçGG"3UßÏx2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Model.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Op{Íp³Ò{f…NZØ'),
('Kù@†2S4Aa­z®Î±:ð', 'wp-content/plugins/theme-check/checks/post-formats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™dÃÖ#¨d•‡}û9'),
('KúÚWÿ&\0\0Kµ\06‚Gô', 'wp-admin/js/set-post-thumbnail.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+QSWmî@û~ÙåƒQ'),
('L3 ‡>Ð»u/Ñ0zé', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum/topic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(ì»wzblùý cDÈ5˜'),
('L<#³ó†\ZÒá¼ÓÜ}', 'wp-includes/js/tinymce/skins/lightgray/img/loader.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9K¯ÃÌMû:äŒTf•9'),
('L û''VãNœô{ßS~bž', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-plugin-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž©7 ºe‡]4#¤WÈÂ0€'),
('L#Ö¬/Û°*Ìø3òÒì\r', 'wp-admin/includes/class-wp-terms-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘¼VüŒC¾ŽCÕ­ ×®'),
('L(Êý¢nø9[2ÀC6åš', 'wp-includes/js/zxcvbn-async.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1–é¶p9	á9Î~šý'),
('L;!ò@¯;k&ÁŽHÑë', 'wp-content/plugins/buddypress/bp-forums/bp-forums-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æ~œ/%³8˜å3²Ðùèv'),
('LR7Q¼äToG|Ä{', 'wp-content/plugins/wordfence/lib/viewFullActivityLog.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üØ¤½=ðøÉñª³ol'),
('Ld‡hÆ?»Ú†?•[ô', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/amex.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KifC+ùµ~‡cÈÇ'),
('LfÃ)ç›øsw±=¸', 'wp-content/plugins/wordpress-seo/css/metabox-tabs.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n/Yš¼‰ú£«QÜf‚'),
('LsÐ‡Å›\n²c}>ÿK—‡', 'wp-includes/css/editor.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨¡Ný›…1M¬''* |'),
('L|½ÙewÃEC\rëò³”)À', 'wp-content/plugins/woocommerce/templates/myaccount/form-add-payment-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯ªDÈÌ;$..gý§'),
('LŸ“‘v%2yx"ÁÑ†&', 'wp-content/languages/continents-cities-es_CL.po', 0, '''2¸ß{“¿›âGHêù}Ës', '''2¸ß{“¿›âGHêù}Ës'),
('L¤ÜlR<¶ÈáÙÍýÜ©@', 'wp-content/themes/hexa/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è÷’@:ª˜ôÑûóÓ‰;'),
('L¨Žy¿§%<Š¥¬kWÇ¿o', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('L¶-d"ÓŠê!]4Éú/', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-locale.php', 0, 'KùÞÊ•Š·‘m×¾> ', 'KùÞÊ•Š·‘m×¾> '),
('LÂŠe¡t"pc(	’eÇ', 'wp-includes/wp-db.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TŠqBJxÖ$KwyÄ'),
('Læ¿\r¡†È¦:Õènòh''', 'wp-content/plugins/akismet/_inc/akismet.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øÂ›\0\rõq“[ßñô{'),
('Líß’ºíOŽôl‚ì¡8Ô', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/PiwikInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8à´)ÁêäÜšb—«ß'),
('Lñ>t™õšNÿˆ†‹Ý', 'wp-admin/css/colors/blue/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÙÐ5I×”„g,)Z­YM³'),
('Lõëù€[¾ä\Z±ª“w¾v', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.editorconfig', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EÓh&/üÓ‡ ÅøéÌ~'),
('L÷…)ÑÙa$­D-ïÓ®ªJ', 'wp-includes/js/tinymce/plugins/wplink/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Wüz!Ñß,L¼O°mÔ;ÜÆ'),
('Lú·œ5…pQOøM', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-he_IL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨÷+ƒ½ïkD:5Æè-¸'),
('M?,5Ø*îóÉúÜK*Åf', 'wp-admin/js/post.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&žË®³úØ)¾~ÔªÍ'),
('MFE’`UÀ \rèò^]ê', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@\0¼\\Æ’ë,FYŸÚ'),
('MW€	å¦¾:Éä˜ÙŠ', 'wp-admin/images/align-none.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñ­eqd2 ¡Úu‘¥Âñ\r'),
('MWíR¨¯f9üç] ðX˜', 'wp-content/plugins/buddypress/bp-activity/bp-activity-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÀSYÛ0ƒHI|‚Óløp'),
('MpëÊ.bƒOÉ§ï{V1@', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-cs_CZ.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@²e…2|Çð4š»kc˜.Ù'),
('Mqý±Â\Z¬T\nÕ×V¥$', 'wp-content/plugins/theme-check/checks/style_suggested.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ý‘v\0GjÂÁëægU÷2Í'),
('M³w^˜}ar[ÊÉ½', 'wp-content/themes/hexa/inc/extras.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C\\¥Þ1d(mhà^ð'),
('M·ãm¾@‘é"Ž^àŽþ‰', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/assets/js/page_slurp.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÈ¹.)TÖZ{Z Û\0v\\'),
('MÐ \0šAŸª»9QÞ+ Í', 'wp-includes/js/admin-bar.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=ÅxÔ±KÚ0ËÏ*|'),
('MüÁI‚MÔïüÀrDõ-', 'wp-includes/post-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁñsÉVå»µlü?´'),
('N*‰¢Xc8‰¿\\}Ïìº1', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-theme-support.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÕT>o–…Ãg÷XÕ+Òã+'),
('N@ýÌÿŒú+C>“U', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø˜u+|-SVí K"R'),
('N_=„ÉÚ=Ó©æÛÝ', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7¢ó%Èÿ/W,ƒãÿ('),
('Nv‹A§ëY2ÎÍ+ÓKï', 'wp-content/plugins/theme-check/checks/tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rÀ`‰\nÚBŠtÏÉÚä(Ò'),
('N|þÂ‡JÐ²ªzn×ösw', 'wp-includes/pluggable-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Û ùÔë„v¾!l"È¤ó-'),
('N3Ýj@pu5“«¶¿^›†', 'wp-includes/js/tinymce/skins/wordpress/images/more.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü·¼Ô\n¼\nm\0;üË«æz'),
('N£\0¤JÂì\r4ë; Tú', 'wp-content/plugins/buddypress/bp-core/admin/images/menu.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'j''“Ú0,ŽƒÇz×Ò÷7v'),
('N§zÍè²š?Û†gkî', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-shipping-method.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äzk^Iï+ùcMnAäç'),
('NÒE\\™ºæ|‘ŠJ…S€', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_real.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' îó„2Ý§óRòåê'),
('NñãþHVû®Õõ}¶4G', 'wp-admin/css/customize-widgets-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©}è¸.È±_¯›R@…'''),
('OsiûMo	õOÇ}', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+~9»;ÚÒÀ#Ï\Z4þ&D'),
('O	‡ÒS ý•Ç#ÅÿYiòv', 'wp-admin/includes/class-wp-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'êu #Ž‹#õ/¼äx{óÁ'),
('O»ûH²tº1K;Qbtë', 'wp-content/plugins/buddypress/bp-themes/bp-default/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­=P+ìB—þd\\JÅœ®'),
('OÛl¸ÍM¿MY¥Ý…Öà', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½Æúxle4·^µR„P'),
('OOiß¨ÐaÃ ÕÐ<©ñ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ5lvY˜Âa6©\Z|a'),
('OPC ÛjçøXÙŽ†åJPo', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/sticky.php', 0, '{¼Dcs;¹È³ùæÂ×', '{¼Dcs;¹È³ùæÂ×'),
('Ob»½ž†¬¨µhqA''b|', 'wp-content/plugins/theme-check/checks/title.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6æ„+FöV©¬ÉŒ©ê Y'),
('OlqCcÛŽÐïÖÊãÏÌÐÍ', 'wp-admin/css/forms-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÇGok$„Ç(í<×3¬€»'),
('Oû\\©¢µP5ÑÓÿ{¾R®', 'wp-admin/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yñ{C’çRÏ|oõ±4n“'),
('O¬ÿ‡RiÅ°1–˜½`{', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/topic-tags.php', 0, '¨‡ÄXrô#uÕhar3õ\r°', '¨‡ÄXrô#uÕhar3õ\r°'),
('O§ƒµà&Ârè“•ê ', 'wp-admin/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2Í…‹Sh]œO/¥7ƒ»'),
('O¬¬ú³R¯r¾©£èD•?—', 'wp-admin/js/postbox.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹ð#Úû$-‹!i>'),
('Oþhu²G¯ýá²&\0ïLÿ', 'wp-includes/Text/Diff/Engine/native.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å­''*‚¾ãÃß*èx'),
('PEÛ«½7r|oI±6ÿð>', 'wp-includes/js/backbone.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mkÆÔ"cÂÿÐ´¶R4\0Å'),
('P''ƒ(µôë?+‹z´“$¡', 'wp-admin/js/postbox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡ Œ¨o%î™zb|ä¨ŽÃY'),
('P73oè©	§ë\0æ=áŠÒ', 'wp-admin/js/word-count.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f%i•@Q¥ù1¡ÁN'),
('P@:\rþs<ßí¡UHú‡', 'wp-content/plugins/buddypress/bp-themes/bp-default/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëöbDš¯ÂF©‚éo€Ã'),
('PK‚([ä±-F{½Xj‡', 'wp-content/plugins/woocommerce/templates/emails/plain/email-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±Q‰HPñ&·3¯V#õî'),
('PŠPŽs1k’xK²ÌãäÊ', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_enabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')˜â=C¯|xW›r\\ÊÖ'),
('PŠÅiz¡tîaé}Ôa', 'wp-admin/users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÞÛã¤iu9ï©»Sá');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('Pž(›^ÖÅŠ;Ü‡ú', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DolibarrInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»	m_d&Ôºô—‚0w'),
('P²²If`ÞPëƒ\nj‹î;', 'wp-content/plugins/buddypress/bp-forums/deprecated/1.7.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r´Nœ°Ç±ôOÝˆóÀ¸'),
('PÂ[7öU~¹,U\\®ÀP', 'wp-content/plugins/woocommerce/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µÉÓh$^ôÿHª)Þjµ½'),
('PÙ\nof	±‡W„:‘', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/feed-icon-16x16.gif', 0, '—`h;ðÙ„J…bX ¯n¼Ð', '—`h;ðÙ„J…bX ¯n¼Ð'),
('PÙsX•Rí{‘SKPü', 'wp-content/plugins/papercite/tests/install-wp-tests.sh', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·Ìl¬Cà,P–å\\dÉ!ÖF'),
('PÞ1$¶‰ó\\*åC', 'wp-admin/images/stars-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õêA”§œ#æS²Me.^'),
('Pã…ñ0¹a‹¼RÓz= ', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Òg;ÒÝ˜å5›s?Wî<Gx'),
('Pã5æþÙäV¬ÁŠ£bº', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-post-types.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aÍ%üëUÕ¥ù“5‹ü«'),
('Pè¨ÕŸ5ø$sãTºt¢ ó', 'wp-content/plugins/woocommerce/templates/loop/price.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûãã°/DTÆH¤Q"ûå'),
('Pê·ƒqz´J.5ò‡åà¹', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J>ê¢éšËÍÙ@''lr/ò'),
('QB‡ŒQP6*JÌ¿éíŒc;', 'wp-content/themes/twentyfourteen/content-video.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø_ã9NvtÐ(Ü¶À.'),
('QT«ñò*f×P„å¥.¿', 'wp-admin/includes/file.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰0Z6…Gúø.Ç'),
('QY/;>ÙvÛç¥ÛnY¤à', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/members.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËÒú˜Ç‰pÀ—]Ì¹Ã,'),
('QY—ê1ðTl’¹Vr<', 'wp-includes/js/customize-views.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­’;½zœ¯	YM‘#yÈ'),
('Q\\ïÀž¸5­ylô_†Ó©', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜‘Y´í”¿g1s[¯áÃ'),
('Q`…áÿuEç_qDî&x', 'wp-content/plugins/buddypress/buddypress.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Ò„*Ì‰Ð¨×èqÅ®Ø·'),
('QuoPXØØ\0«¸SÚž', 'wp-admin/images/bubble_bg.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=,³÷º¦(Éå\Z2cVç 8'),
('Qƒp§²·\Zf©CÛ\r1ì', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_‚0ÆcÐÚºg”ïÙÖ;½'),
('Q·`ºöä8þM¸8', 'wp-admin/press-this.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö\0yþÀåÔÖ~I­£6Ú¯’'),
('Qý©ƒÏÛÁlêg´-Äó', 'wp-admin/js/comment.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ÿi/y£å}ù¹*žC´ê'),
('R\r\\g+XOÅÉ¼.v‰L©;', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nÓ\Z4¼„ç2‹^˜Ù-{¶Ø'),
('R-ÿ©bõ:õUq¿€V', 'wp-content/plugins/woocommerce/templates/emails/plain/admin-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sþ$úˆt	dÿÕÎƒ…•'),
('R3ð¸Usë3ÃÈ}TêœÛÁ', 'wp-includes/js/autosave.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cýi|}fðïÆCŒSÉ/'),
('R:h²ŠÏ€6¯÷¥ë‘', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/script.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚DœVOG—ÇÒp<¶3k'),
('RB‹·ÜòeL ˜Â±«{Ý', 'wp-content/themes/twentyfourteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œù!ÙÙ$ÿgBi½ƒù\\n'),
('RQ÷b7f§È |~Û“†(', 'wp-admin/js/widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«<gu¯F f½´…@p¤›'),
('RŽµú1?™ûˆYÓVDt»', 'wp-content/plugins/wordfence/lib/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·I z~Òi¶,Lžÿè'),
('R–x®4Mp@°9u\nÖŠ p', 'wp-includes/images/wpspin.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝNmÒh§äÁÅ;\Z@’Ý'),
('R—§|Rx/ãbzn9\0*ÑJ', 'wp-admin/includes/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Óö—$:ñï¶­ü{NVš÷'),
('R¡QÝrâ·ÖÒ\0És_', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/BaseInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªurøXÄˆŽŠ ¯‰2'),
('R¤W>£¯pÞ	\\öÚ', 'wp-content/themes/twentythirteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'úŸ	•~ÖÓ\r_åPy<Ÿ¡'),
('R¯\\SC¯|juÓ9µ¿A', 'wp-includes/js/media-grid.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë$k­ódP|/ÛŽ8Ç|'),
('RÂ¥ø²®ÍÊLeýq	ð&Ô', 'wp-admin/js/user-suggest.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3)ú‹()Ý°4}\n“'),
('Rô&„ÕELö¼”]h¥¹+', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart-variation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹QveK«\0‡û2ûÞÕØ«'),
('R÷’û™äè#ÂÞ5´B', 'wp-content/plugins/woocommerce/templates/myaccount/form-edit-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ùz$M™ mÜ³-þšó¥'),
('S.FÈ«A¾j®ÿä( :', 'wp-includes/js/hoverIntent.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o\0tñòÑC"¼<	P¬/'),
('S0ôÖ¾â×K/17uüŽì”', 'wp-includes/js/jquery/ui/selectmenu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',wfÓ—ð°ÊÄÉ’!Ò'),
('SX+7Êû1?ÅõÏî-', 'wp-includes/js/jcrop/Jcrop.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z‹ý7e½¯¼òÍQ°%K'),
('Sˆÿ÷ÜpØ>ÙÝWr½YE', 'wp-comments-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬p8£_é$Ãœ–¤h¿¶'),
('S‰‚Â‰9·4ˆ†€\Z''È', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/OctoberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž‚Œ%íU3GJ$†·#'),
('S”øbì\nÙTlÕBÈ°tc', 'wp-content/plugins/buddypress/bp-activity/css/mentions-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'º<±Çc\0‰''Îg>Þúç'),
('S¼ä2|ä¦7ËŽè‚÷¨ú', 'wp-content/plugins/woocommerce/i18n/states/ZA.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÚHQÁClbq ³Qµ'),
('SÏ5 0p_•…gÿ', 'wp-content/plugins/woocommerce/i18n/states/BR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ØÂu3ê1zÎô¾ÄL¯³'),
('SÒ\\0|	ª;’Ñ', 'wp-content/themes/twentytwelve/js/theme-customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø#ªêKŠ-MdþÆ©¬„'),
('SÛÊ&ëaz8öJØ¶9§', 'wp-includes/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ0†1½Éõ+V¾Éþ;3>~'),
('Sû¯Ù|¥á„d]¢206', 'wp-content/plugins/woocommerce/assets/js/admin/reports.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä²Æ«o²œž»Ì×X'),
('TVh§]£ÆeX”hx¦', 'wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sØ¾û¼4¶ÏÛ9–ó'),
('T5l …4Óï`7¦¸æ', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G2B{.yÃ²îÎQf	òa'),
('TO­ëÓ6/ÓòFL~Û—', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-taxonomy.php', 0, '[À´Ãæ†=Ée¹', '[À´Ãæ†=Ée¹'),
('TWÝ¯–(W†ÞÙ‚FÙB~Q', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|øå–÷’‹ !)ØO_¾'),
('T\\TØä¾=4 FÝDLÛPÃ', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-attributes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$m¿ƒà9á°ÊÁ—2ã™%'),
('T^Ih³‡ôÅÌÎŽ¹¤ê(', 'wp-includes/js/tinymce/plugins/wpfullscreen/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vÁ•åñW`?ëI_ãÿûÃ='),
('TqHf•šd\0ÆƒzøøÕ', 'wp-content/plugins/buddypress/bp-settings/bp-settings-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Wþ£«§– ™õŠJü¾6'),
('T‡.o@Î¨2ÿwõvŽŸX¹', 'wp-includes/js/jcrop/jquery.Jcrop.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/a«˜LruÇ4ÿ\ZÁ'),
('T‰Ìèþ,“F1›ö}„', 'wp-content/themes/hexa/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{bø	•ZÈ¸Bï’ZÎ'),
('TŒŠ³vm?,³aÞéãT4ê', 'wp-includes/ID3/module.audio-video.quicktime.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øU½`ÔÕfá.˜0FË¼'),
('TÍç¹`Z™êd»™t^z', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CraftInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö@|ýõÝ*ðþáY°'),
('TÞ=Ûµa[þ\\r ÑO', 'wp-content/plugins/theme-check/checks/screenshot.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')ÌÉÔWržîmº,jc.'),
('TæA;DqŒ>iZ¿ê]', 'wp-content/plugins/woocommerce/assets/js/chosen/ajax-chosen.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z-îüM~<Œ½îg*­˜á'),
('Uð\\p{Jþ˜OÃQË&', 'wp-includes/SimplePie/Cache/Base.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”Cí¡‰»Ù2]œ]#|j'),
('U"Â)%f#ïŠLØ‘', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-walker.php', 0, 'ßËÚ^¢[yq×à”zR', 'ßËÚ^¢[yq×à”zR'),
('U/©äL©KÂ}œ©xÂÛø', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/FuelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß^ûq÷{û3\\Ýg€'),
('US¶?^ÞQ¶wåo°¥á_', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-notes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SS)]ÖåC";ËU˜eF'),
('U[Æ4È«×ËÙ~ïc%', 'wp-content/themes/hexa/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³zõÌ´ï·Ä:¸¥tÆ'),
('Un››êI5¬Æ¢:MÃ¤‰', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-ga-js.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Tá%Ý@ÆpôÕ÷|Èvsq'),
('UÃåà$i"uÂÊ&Ëô¸9', 'wp-includes/images/crystal/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”ÛýŽl¥‰Ú¤¸;õ='),
('UË+Eæ-º½+Ótx—', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Customer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®šº_Ø»„ùÜ6]ô­ÈÖí'),
('UÓüðšŸ2Ý÷\r9)ù', 'wp-content/languages/plugins/akismet-es_CL.po', 0, 'ê…çÎ=ï¦\nóe^£', 'ê…çÎ=ï¦\nóe^£'),
('U×`\núlCÓguprÙ', 'wp-content/plugins/wordpress-seo/css/edit-page.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žLf.G{‡R~ÌémÞå'),
('V\nÕÉU`½_š5ú˜­8', 'wp-includes/js/customize-base.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø.ùê.fç%¬¢†ßIð–D'),
('V33ÊrTC©@U÷~Ñ\nˆ\n', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/AutoloadGenerator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't~ððž2³B`Ô™œ[	'),
('VL6Ý7G^l%D5z3Èè', 'wp-includes/default-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ¾¶™ì[ÙÔ§8÷ŒÂ´¡'),
('VZ	öA$.•¢-œÕQ', 'wp-content/plugins/buddypress/bp-members/bp-members-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0Ð÷{Ç"pó.©wLL'),
('V^==üãð%³î_®˜×ƒ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-topics.php', 0, '1~™!–6}ö Äõ\räk', '1~™!–6}ö Äõ\räk'),
('Vh—Þ¤+Fãè4¤­', 'wp-content/themes/twentythirteen/images/headers/circle.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ÔIN§ë#¡O\\/Š}ê'),
('Vne!Êz0u1?¬¿', 'wp-includes/shortcodes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G¯	¼È¯n\0‘~ÿÚŠ(ó'),
('Vrm‘KE§p¼j×ä6—', 'wp-admin/images/w-logo-blue.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý[N°W¢ð_pàw®0'),
('Vz˜Ü«¡ôèû\r»·§', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nþJUnëœ»Ú7väÉ…'),
('Vž…ï‚™ëŒ$ØïŒŠx', 'wp-admin/js/post.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$Úô•Ð’Cþz>°@ÕÜÇ'),
('VËü…{üþ/à:2Ü±', 'wp-content/plugins/wordpress-seo/images/banner-premium-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vóšÛ•Â©¸\0­Ò¥'),
('VÏœI°˜&t“‡F®²Q', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³n¨ÓHL‡8À!ìæì¡'),
('W‘ñ…u“Q\no<,	@', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/lib/xrstf/Composer52/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¹	â¦Z^ÎÄ+Á}iô˜'),
('W0Ã·gÉb%ƒ>4µû', 'wp-content/plugins/woocommerce/assets/css/dashboard.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')˜T>Úôñä³Ñ6fïYµ'),
('W?2.¨ŽÐÌö™¥W 3', 'wp-content/plugins/woocommerce/assets/js/frontend/add-payment-method.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶C¬f[ðƒÔÒœ\nÝSîà'),
('WBbå5p]|[ÐüUçy>', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/white-grad.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\n‰Å‰!9…ÅºÉN‘N'),
('WQ¶ã¨êFÍ0õ{N	š', 'wp-content/plugins/buddypress/bp-friends/js/widget-friends.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ü8•¬m	—?O x\ni'),
('Wq™ Sç~S!wý`"oA', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-sv_SE.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Hˆ_HÝÓTèÔ\nb?„'),
('W{Yx9¸z3	tõ.í†Š', 'wp-content/plugins/woocommerce/assets/css/_fonts.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìòAS¶·£Ø”ø+û'),
('W{°g- Xòéû''=n8', 'wp-admin/moderation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TB¢“€YR â"4ðo©'),
('W})Ó–7£Œêeç}5æ9,', 'wp-admin/load-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äþE…¿0VOøÕr ¥êÂ'),
('W›dÃ	3Ö)ãÝö¼êäy', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢h6”iµë¨=\r½Gï'),
('Wü$‘ŸÀ`$¬¥V>XY€', 'wp-content/plugins/buddypress/favicon.ico', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5É§\0j(\ncÇàúäáð'),
('Xk7¸½™Am¢uQD;©w', 'wp-content/themes/twentythirteen/taxonomy-post_format.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶²''õh°¿²k–Ò¸ü'),
('Xœ°tðïåbÂþÄE', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-price-filter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5” (\nT•mKÿó—\\eÐ'),
('Xµd$ Cóèªè=üî', 'wp-content/plugins/papercite/format/turabian.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&¾ãëgÞšùÛºª_¼g'),
('XÍ®™Ñàxâ·™Ä#ˆÆ', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-replace-vars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’W;Ž7nLkLík×Ú'),
('X,çEõCj$_ƒ¬8I§‚0', 'wp-includes/images/smilies/icon_cool.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–F~µ®ß¢.¡Àú>t8'),
('X6mC^á+3ÁðdC`[', 'wp-content/plugins/buddypress/bp-themes/bp-default/attachment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Pšåî‡=¸ã†›³’Óö'),
('XIÐ–“ê–^\0êeŒË£', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[õÙPÎvÔ¢ÀõEÞ]Ÿõ'),
('X\\\rNËáœ¶d*ºŒA|’', 'wp-content/plugins/woocommerce/assets/js/admin/round.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'býLðÅ¨ZHÙþ+·jÞ^'),
('X\\t2¡fà7ÃkHðª', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šLnl5p>×Êž\r¡X0jV'),
('Xq@W¹$)5ÿÇ»Z[2Ó¸', 'wp-content/plugins/woocommerce/assets/images/select2-spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{—vm_ÎïI“µ\\“ƒÞÝ'),
('X—:8+Ë“2>V]¬Ë8à', 'wp-admin/images/sort-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nQ&Ê] ²0Ç-š‰ƒî'),
('X´;Ô­º®0˜¯xˆ R', 'wp-content/plugins/woocommerce/i18n/states/CA.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÕåÒ‚"\nûâ2ô@Ã“ëb'),
('X¾É-V\rœ$Áó)`ˆí_', 'wp-content/themes/twentytwelve/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó·ÜÕrvIB\Zùv¯'),
('XÂ×ßG°¦“ö•åz„X', 'wp-admin/includes/class-wp-upgrader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈÊ@¶×?:Üûþã'),
('XÖ''ËMì-ó¥ïÇ]Æ', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/includes/settings-flat-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{±†ý9Kè)”º7»ãeäØ'),
('XãŒÚÂ÷ðh¥¡2IÚÜè', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oê>‡ú<ôúêˆ•Ô·'),
('Xä€F2“Þ/"ª¥Ñ=h', 'wp-content/plugins/woocommerce/assets/js/frontend/country-select.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó¶r©Wfû@Ò8+f`='),
('XëEŠd‰ú½ß’±ä+Žu\0', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/question-mark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁPÖ3ÐXXJ¼óùÌ'),
('Y™ß"Sžl˜¼öLeôù', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bpdb-multi.php', 0, 'Oæ¨áñ$Zœ´\n^"Ñ', 'Oæ¨áñ$Zœ´\n^"Ñ'),
('Y\nbâË$Ý“Ï´\rc', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-assets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿f\0‹[Zú6b-a}Ã…@«'),
('YÝOTŒÉÑóÄ(ÝÒd', 'wp-content/themes/twentythirteen/images/dotted-line.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÖÃlúáÆ8.ùšÑ;Õ’iÖ'),
('Y/¨$õš¾¼Ã\Z^iGg', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/i18n-module.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U($P¤›X&=¶á''É¨'),
('Ymð¼>Ûóh\\È¯¬eùõ(', 'wp-content/plugins/wordpress-seo/vendor/composer/installed.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k€Ä‹µä­Ž‹×@uQ'),
('Y}Ýmc/F	=„<‡¾E', 'wp-content/plugins/woocommerce/templates/single-product/price.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ã6Œ›?³]AößX+ì{'),
('Y…LaØ€µhÐ(', 'wp-admin/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SjíV’ÿê©£nóXt'),
('Yˆ,eêAõ¼wÀ`áÄ', 'wp-includes/images/media/archive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9Òîßòhû\0ÚÓÃ¬‘u'),
('Y 68ÔH;%,¹_c\n€', 'wp-includes/css/wp-auth-check.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žÙÚ½”ó¡Ž¸WMÂ½9NÒ'),
('Y¾vºWbÔü˜Xqû$À', 'wp-content/plugins/buddypress/bp-core/js/jquery-query.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}lÒ…âè›}»+ËÊ®•¡'),
('YÔäÖí]¦®ÅžI†•¨', 'wp-includes/js/jquery/ui/effect-slide.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«c“í1Ö§Ã³×#Cw&¤'),
('YÖ»Uª€ÕÏ}Ãr/', 'wp-includes/SimplePie/Cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yü¢:ƒoMh÷vL§4'),
('Yï>Ë‘»9,ãþÆÉ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/license.txt', 0, 'u&\n©TIŸzº«ªˆ+¾', 'u&\n©TIŸzº«ªˆ+¾'),
('Z4<n?e˜ñ²', 'wp-content/plugins/wordfence/lib/wfConfig.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊÔf§œJL³Üöôut5'),
('ZCìÌÔu•5[Ý?}Ý,Ö¬', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-permalinks.php', 0, 'h-¦°œY?L¡U\\aâR', 'h-¦°œY?L¡U\\aâR'),
('ZU…{ßÜOÚö´èå“jä"', 'wp-content/plugins/buddypress/bp-core/images/mystery-man.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«úÓÀCÕz/"ÀkTEÃ—'),
('Zz©Ž·Š_)Y›—u™¢ôP', 'wp-content/plugins/woocommerce/uninstall.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tØC#¬þ¦ËÊù$/˜×'),
('ZÒŒ£[¼ø\nvâËâ	F', 'wp-includes/SimplePie/gzdecode.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Å8â¼†a—Ûal„4Ô'),
('Z¬ÊèÄ %/»Z¿z9ýì', 'wp-admin/includes/taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\ÞÑEp\r¥¦èÀ Œè2'),
('Z±\0ƒœYˆ³’³ Ã¦fg', 'wp-includes/js/crop/marqueeVert.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®šÌñ\0¤¹“9­ÿRÔÜÇ'),
('Z±~äDøNQÖKÎm“&', 'wp-content/plugins/theme-check/checks/basic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>Á¬vE—/»HKÖ¶Gƒ'),
('ZÔVá¯sÛ«·jøå2à', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PÔ”]Wƒf–s)€?Ø´±'),
('Z×_ôÃÂÌPf<7#¦™4Û', 'wp-content/plugins/woocommerce/assets/js/jquery-tiptip/jquery.tipTip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Üq-ðõû''¾j›¤ç.V'),
('[\0¥WEGjp°èŒ»ox€', 'wp-content/plugins/woocommerce/templates/emails/email-order-items.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sý¿Þ\\*ŠñÊöÇ<ù'),
('[â{ýXýèž›ƒÝc¼Ý', 'wp-content/plugins/siteorigin-panels/js/styling.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­L&*ITNÖ×çÏI#z'),
('[@‘‹Œ¼|Â°ê]>)', 'wp-content/themes/twentytwelve/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òÀ°,Ì´[â­ùôÜY2²'),
('[#Ûûk¾úYÔ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-login.php', 0, '#+Â©p_§dË°\rBm', '#+Â©p_§dË°\rBm'),
('[\\»~øq4õ; iË''ì­', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±¥MÈ°™&z½³MÏ¦¿'),
('[^»!‘Ãs)™³eÑ‡', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/LithiumInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!{ÖhÈ¡R2Ëªí€¨6'),
('[ŒÃ#Ü§\Z>]¿<¦', 'wp-admin/css/colors/ectoplasm/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"rz\ZâZÓ\rüæËXÚ'),
('[ÎÅuPEŒ¢´òx{¾', 'wp-content/themes/twentyfourteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëÔP··:ù9Lÿ$œü='),
('[±€à1¶YAdkö,', 'wp-includes/SimplePie/Sanitize.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BØ¸ÀÏFµØ¥à®H¸u'),
('[Á4Þpgã¯C%*±o÷', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðünŸ;#g÷<=Â\rô®ò'),
('[Ò•¯Ž§El{¦åÈ¿uùÿ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/forum/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ßª9M³ƒåÅM¦¾Ï9'),
('[ÝØ¦­m’ÅNpçh', 'wp-content/plugins/wordpress-seo/admin/class-yoast-notification-center.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ØËï‰70Ã:k¢woG@;'),
('[ê æ|KòoÊÛŒb7ð', 'wp-admin/user/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Èý˜÷ýÕ-x½­÷Nb‰ú'),
('\\ÜÜ…•Œ9‡ƒ·ÈÌ÷', 'wp-admin/ms-upgrade-network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|´’&"îSm–¾8h¾m'),
('\\5\n­Û¢\0·óÃâv¶ü¶', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-it_IT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïÖ>nC::¨ìõdÑà5_'),
('\\8ÏÜûd@ïáb\Zn!ÿO', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-short-description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æÍ‹zW>¿Pk[Úñ L'),
('\\[æíi%Í°<ú˜e“>©', 'wp-includes/css/wp-pointer-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑFœÔ˜2„­&dêvZ@'),
('\\s~ÅSå"’ÚOÐîºÄ“<', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CodeIgniterInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûH‹Û=ªuÍ]R9ÙÙ'),
('\\‚{@ÜËbá®ù¥×mGz', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-ru_RU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8­"ƒ§þLt¨-(Õx'),
('\\ƒI·à\0tÓCMèaòì', 'wp-content/plugins/siteorigin-panels/widgets/basic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{;TV@å~ŸÎ#ÅÝ'),
('\\šÑ‚’?$€Í„8À’¡æ', 'wp-admin/includes/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑX6¿eÏ\nV‚òsl²}JL'),
('\\¥¼¼iªØÐø¤>«ß¦y', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=¿Ý¡§5N2WF§îÑ'),
('\\¬2]²U4äŠRÊÝ_¸', 'wp-content/plugins/buddypress/bp-members/bp-members-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S\Z?@òÎ	°.ÛK×3'),
('\\Ìç+5®éÂ¦DW"ï˜', 'wp-content/themes/twentyfifteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>·Ä"7Ñž×‰!ðT\nª}ò'),
('\\Ó\0õ£>¦+¢³ÁFbÐí', 'wp-admin/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|kJKTfe~£!Ö]Û\n J'),
('\\ÔJh''ò{­áàaÓ`_Ó', 'wp-content/themes/twentyfifteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R÷Ú¢dý½É“¨GHÕñ'),
('\\ôÜøÆR\Zø/	}$ï™', 'wp-content/plugins/siteorigin-panels/inc/revisions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Àh_›ï¤Þ½(Hš®>\rº'),
('\\øt c‘î±1ªGÁqŠ–', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Symfony1Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L‘øò©Q\09§mšM˜'),
('](Rª&!âÆ1;™3˜ê', 'wp-includes/js/wp-ajax-response.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1mÆ¨Šõ\r÷¾àœHPè'),
('].9g¥¨—gB^£±ò;ž', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/BaseInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªurøXÄˆŽŠ ¯‰2'),
(']B#Í2èzÚìúbUœÉ/', 'wp-includes/Text/Diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%þgkj@bÀ%ÆßÜ\0Ù'),
(']c-¬Eé¸\ZB$þ3È	ñ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-roles.php', 0, 'bW»ÇPðe`?ž×þ¾J‡', 'bW»ÇPðe`?ž×þ¾J‡'),
(']hªÞo§bõoy=¥ùMò', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/handle.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"ó½!e8îÍ¼²‰v3ÖT'),
(']w5ŠmZªZhØg¡œ8', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/sidebar_back.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+w™[qï}ÕŽ|¿Ú~vý'),
(']–üäÖ²=^DyaödU', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/feedback-no-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`üÊG«Fn—Ð(e:'),
(']œú†’c1ý‘O‰”³Êü', 'wp-content/plugins/wordpress-seo/wp-seo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ª¯L@™Ñ/™™/|œ'),
(']£úÍCyð.aÓA,Ç-ê', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ÜÑøê«fØãÜf÷B¥'),
(']¥‚P·¿îTkvtŠº8A', 'wp-admin/network/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zá=S[¥fxÄàŠÏ‰£Õ'),
(']¥¤Ê*…¤…ÿJ–', 'wp-content/plugins/wordfence/images/icons/email_go.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºªjÌÙEü´H)«.½í'),
(']¥Úæp‡[%3QLVÙÏs', 'wp-content/plugins/woocommerce/templates/order/tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')"7·x˜›äi²ºÅÙ'),
(']§Ÿ‹âù"}[’YÜRÚ', 'wp-admin/css/edit-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë@\nN™ƒ‰ZUÏz ‹'),
(']¨ž.PRt!{1Ïpr}€', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/class-wc-gateway-mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÀÇk)FU\nPûÝ#Q'),
(']¬É˜4Põ7tôýÒæ\Z/', 'wp-content/languages/admin-es_CL.po', 0, 'é()¹­ãáº)*órs©', 'é()¹­ãáº)*órs©'),
(']Àš°À–•Á3›ÞÉ`ò', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-recent-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ê¦°pŸ#mÚU`}1‹'),
(']âÞçœ)V:eÛ	êžò', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=èb¬5°]ú¹Dv''\rÛ'),
(']ëº²ñV>d¼Œy’¸‰v', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´?nÜkþ‚''''Q²K'),
('^ ­ª/¨^û^îNží ', 'wp-content/plugins/wordpress-seo/js/wp-seo-metabox.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑKú™Ú]³ºLêÒž/þ'),
('^E×næQµÔ˜2å©ÕA', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-settings.php', 0, 'ÙÂ;àî¦º‰Im¾¹P', 'ÙÂ;àî¦º‰Im¾¹P'),
('^(Â§3„H¸Þú²''îØ¾', 'wp-content/plugins/woocommerce/includes/class-wc-order-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mïu‰˜ÿÃlÈXzó'),
('^*”‹æ	¹Âó´aEn½™', 'wp-content/plugins/woocommerce/includes/shipping/local-delivery/class-wc-shipping-local-delivery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'UÅw”¨Q†r£ì¾£±Ê'),
('^9!mS)€µ _eyÛ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_real.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€ÔÕùQ°}DqSÊ/Ž½'),
('^9(-(Å²Åy ‰÷Ê0q*', 'wp-admin/user/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ì\0Ú‘KNý ˜£äN¾-'),
('^@Õ²{''«©_èâ›92', 'wp-admin/upgrade-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^ößØìuPàqX\\eŽü'),
('^yG=ÚœFg;3‘Ã¡©', 'wp-content/plugins/wordfence/images/button-grad-grey.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•ÄRCì¿ÊTyÕý?Þ'),
('^åƒÃ¯ðˆ¯+…y|Ð', 'wp-includes/images/crystal/spreadsheet.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5†9øÐ¢1€TËÇn¤ê'),
('^‡w•Ô*¿AÄ,èÿØÇf·', 'wp-content/themes/twentytwelve/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òp>Ð%Ô/N‹×ƒäÕÌã'),
('^Ë¨_ª¾ñ‡RÉ6ÃÓ+6', 'wp-content/themes/twentythirteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇÀCŠÓÍaÁ ¾A´„ÿÔÂ'),
('^Ö<mç€˜m›Àßª&Ï¿', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/groups/invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8,ÃŒ½”Öº#7¸¥y'),
('_°\0ßÅd •MP~ÛëD', 'wp-includes/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€{)8''''®îªÜ8Œ•øu'),
('_Ž¯÷§Ÿ	,þzbk\ZÍ§', 'wp-content/plugins/woocommerce/includes/class-wc-tracker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ówwË¥ê\r—Dm)ž6 š'),
('_ê´½¨Ž|<¸uNÞ\0ßÏ', 'wp-content/plugins/buddypress/bp-core/js/confirm.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ktÐ‡j"Ã^U›u\rEðyå'),
('_*Äâ½žLÿ0â>\r', 'wp-includes/feed-rss2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A¨£`''r}—Ÿbˆ QG'),
('_jõð‡_±¨/ÔÌÖyÓ±', 'wp-includes/load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä<‘^ò1<½ñáÔf^&'),
('_nã‘2¤oÌ0xl÷', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ZikulaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K«8Iºdp˜o?E'),
('_‚;NÀ¢ØÔb““nèÏv', 'wp-content/plugins/buddypress/bp-themes/bp-default/registration/activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ùê]XlKkQR„„.'),
('_¨Žœø9ùçÇÕË‚Ô', 'wp-content/plugins/woocommerce/assets/js/frontend/checkout.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§¨^¼ˆ˜E†Õ`÷c€'),
('_Â 92pb0L«æéæãhx', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-hr.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';Ulœ˜ã¯ºy#@Œá'),
('_È6Çâò‹ÅüE™3`ô', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•	Á<5Lô”óë«V\\p'),
('_Ò80ð)CÂ²ã<¢¨', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topic-move.php', 0, '5®,ÆnPô¯Ö:ª[û', '5®,ÆnPô¯Ö:ª[û'),
('_Ö|œ¯T¢M^î½õÄJ', 'wp-includes/css/editor.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aÆß[:\\öëÕeËXùn'),
('_Öà4ä3“ÍË=Ž“', 'wp-includes/images/uploader-icons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´“\\MÏÿÀùm–€'),
('_î‘(íC˜ŒÂM6˜9É', 'wp-admin/includes/class-wp-links-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q÷÷Ó¹Ô–Ý2å°g1l'),
('_õ´ïýá8}Ìßœ?åŽ', 'wp-includes/css/media-views-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'í_CÔ†zõ$S /RÝ'),
('`ØúÕµ… ×~è,Õ4', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-global.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»e¶”ƒNû¿\rw'),
('`Œ–ÖÀ«ïmepƒZwÎ', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/full-screen.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']+-Ü”½?×f#†ëÖìÆ'),
('`ÎþÇS”`NI‹^Gï', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú¥.(¿Ø_µXå\Z%'),
('`%­Ö½áj®±''‡ÒPù´', 'wp-admin/js/edit-comments.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZŸÑÅ+«=*ûªo-Ïd'),
('`''žhÄ''¨t¯Ë6', 'wp-content/themes/hexa/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þBd©L”@ì\\Î›wîlE'),
('`tyžb˜¯å‰UÌ™ˆ', 'wp-content/plugins/papercite/utils/STYLEMAPBIBTEX.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',<÷pÀÞï \nY—¯0èi'),
('`‚ÈÑay3îxó£±œŠS', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/register.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ùú®MåÚàd5%Gô|…t'),
('`·›(\nÃIBTêûÉ{Ã', 'wp-content/plugins/buddypress/bp-activity/css/mentions.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ‰…á¾ÞõÊì“W^’r“'),
('`»c0¯žÙ\\ùâë•3æ', 'wp-content/plugins/wordfence/lib/Diff/SequenceMatcher.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰OÒ"%Ã©¾O²DZÞj'),
('`àÚ–ÈwYƒ‰u’pC', 'wp-content/plugins/buddypress/bp-core/css/admin-bar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿVïIMÈf­î¶Y.'),
('`ö¦”; "­-¹ÿÈ+~;', 'wp-includes/js/tinymce/plugins/media/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊAgÎ™jæóZørI'),
('`ûJÅR¦À[ÖYJÃH¸ ¡', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/rickshaw.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü’{mÖAÊ¥c·¼²ñ0'),
('`ýŽØƒ=¦WU×·¬~š', 'wp-content/plugins/buddypress/bp-members/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+—_`vÁ EËj’h•TÕ™'),
('aŸ™’†H§J<yY»', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page-links-background.gif', 0, '¢~ ,Ìöù\ZûLÚ‘¢', '¢~ ,Ìöù\ZûLÚ‘¢'),
('a\ZÈcŸ³ür•2äô¬', 'wp-content/plugins/wordfence/js/jquery.tmpl.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€\\}Ã"£†‹7Ú·’•DZ'),
('a$Úr$2@Ó­;¿!2>', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/rss.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ì³œå|s@?ÐhK÷æyä˜'),
('a(Â\0È''~¯§u”õÎ˜W', 'wp-content/plugins/wordpress-seo/images/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('a)žTMWá¸Ooˆ¸Q”|Ü', 'wp-admin/images/media-button.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²¶Ãã6@pè’z^yeóÎ'),
('a5œº«a¨™Volær6«‰', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/class-api-google.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R	„Ï\0e$''S<£N‘ûÑ'),
('aSÙ‘¡á°Ðf”ø„€¹', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/background.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ô	k¹ÐSñè;o$!'),
('a\\c,I"5TÍ±#Ì‹þ', 'wp-admin/images/media-button-music.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïõ]ó2\\Z®/äÙÞ•'),
('an–Ü¨«5MÂ“gU{Ä', 'wp-content/themes/twentyfourteen/content-audio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýgdØèL#\\öÞ¢¬|'),
('a†o²aØ“=çŠ¢­¥Í)J', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/class-wc-shipping-flat-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤—’\n·$§¬T\r­ã]Çh'),
('a†Ù€½¼‚«Öµƒ¬Lœ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-meta.php', 0, '$év*R‚8ìd£ví§Ô', '$év*R‚8ìd£ví§Ô'),
('a¦ME¨µwÑ:“l÷ˆ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7³hQ¶v<j4½@¡'),
('a§?£ª_×Ë¢¾Ð6j¨ìX', 'readme.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Îx²!?pp4eŒðÉG'),
('a¯65j{OåþXò¶ßM”', 'wp-content/plugins/buddypress/bp-forums/bp-forums-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æŽ }6 âY4Ý›Ø‹ÃA'),
('aÆÅƒÉû(màEBýlÉ', 'wp-includes/media-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w!YK9-¹\0¢÷¶ÙŠ'),
('aÉcµCH\r…‘=l@Ä¸', 'wp-admin/plugin-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fû[2Irmßé''!2`'),
('aÔISyÇÇÔÕ1ßŸ¿B', 'wp-content/plugins/woocommerce/templates/single-product/tabs/tabs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰\\«•ŽZO[g~ô{Îèø,'),
('aå|\n‚ü|@X\n¶œfM\r§', 'wp-content/plugins/wordfence/css/dt_table.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢[¡fþæ\Z™ª}ÁI+o'),
('bnÑì©Ã:ZªœÍY', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-hu_HU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õ\\Š^‰‘Ã¶QíÒö2ê'),
('b&‰óYÑ,”z×û¨%', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žñR!Öbú`%uˆà^X'),
('bYÆ,¥°Ï¥YªrÛÑ;¾', 'wp-includes/js/crop/cropper.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ky5ôni*M(í™'),
('bvjŽq¨óù[ð\nHÛq¹', 'wp-content/plugins/woocommerce/includes/class-wc-post-types.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÚødTJÓ?8é÷ñ¶r'),
('b¡(áo\nløû¶Ëµ¼', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	Æ†d=lßÆ¾¬ID9>\0'),
('b©N»ûÌ«OÏ:YæÈ…Ê', 'wp-content/plugins/wordpress-seo/css/taxonomy-meta.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I¡xNN©È¦K¤~`	'),
('b²Ê[@íEL¨;~/ç£', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Þ¨™Æ\n%\0åï‘'),
('bÆÓki÷Ø¤àÉI]ˆ', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/purple.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÙÑ\ZŒ¦Ã7g×j\Z¯/£'),
('bÊ¥ñHzfW˜ …­gw›', 'wp-content/plugins/wordfence/lib/wfSchema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3yöŸp#-x´ùP¨þ$'),
('bà”û¿”ÒŒ &é?¬{', 'wp-includes/js/customize-loader.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠÌ¯ÈIÐ+oÔ\0t©:›'),
('c,?¬¾µDb–\rî|½Ú', 'wp-content/plugins/papercite/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!Êëù½|¶#B3\nV'),
('c,½…°[xÞ«ô3¥\nù@', 'wp-includes/js/jquery/jquery.masonry.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’ŠÜíÍR¸(åžÂ‘e^'),
('cTœ3LªYø`‹?{Ü7Å|', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-taxes-by-code.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™„|@>OMB\Zõo\n/‹Ê'),
('cnƒ4£¦´fè¾ÄÕ	¨¼', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.dimensions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø¯‰´°û&jÕt¹+"T'),
('c¢égþÎ¢”B7ÚôZ•', 'wp-content/plugins/buddypress/bp-core/bp-core-options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ðìr;µD½Å‚ÐÓâpO'),
('c¥gÏöÓqÄ~¥Sïõ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/member-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cio\ZL‚cèXŽ2Àèƒ¥'),
('cò>ýqýDŽ1	_h\0b', 'wp-content/themes/twentytwelve/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãýb*†K¥«¢Jí£X_”'),
('dõå:w¤îÐOÍÐ†', 'wp-includes/ID3/getid3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"ð¤\nQÇQ.ÅÁùb²oâ'),
('dãì­1íìµ“-…;O˜ö', 'wp-admin/js/custom-background.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òj÷)Nà¹ ËˆÂ¨iv#'),
('d#»u=k§fî›''ð\0²Ö', 'wp-content/themes/twentyfourteen/js/customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Âbp—_–‡[„rã$/ºÍ'),
('dF=úˆÏjˆ²Hcÿ ‚–', 'wp-content/plugins/akismet/wrapper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'DÜšIf`“{Ò­Ç\Z0[x'),
('dO¿êÑrnE“º€¼U¡', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-schema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý\\í§í_§vëˆåQw1¼'),
('dS·Mrüã8§MÑÉ[õ', 'wp-content/uploads/2015/03/uaiblanco-604x270.jpg', 0, 'íB£ì»îÅÍº¬	ã˜NÅ', 'íB£ì»îÅÍº¬	ã˜NÅ'),
('dT·Ñ¡´„úuÜ6Oð¾', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-api-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2~õ0é+u“oÐcïI('''),
('dpE‡kÙ:¾ÓÆ¡''', 'wp-content/plugins/buddypress/bp-core/js/jquery-query.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤÷î,«s5¹Q¿ßU'),
('d‹E•jHU†<~\n>3±ZW', 'wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å<?F]ÎZæÈ-yçC4h'),
('dŽYiž+P\rô¬¯‡ü×h', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-coupons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_ÈÙ2ØÌÝ€i£2¾'),
('d®on¦W>aÌ§™Àóì', 'wp-content/themes/twentyfifteen/genericons/Genericons.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's/ðýn]d²ÈÈzÈ?'),
('dÓ“¿/XêÎóèUw6²', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-sql-schema-parser.php', 0, 'ÇŽÓ5c¸¯“§DÖàúú', 'ÇŽÓ5c¸¯“§DÖàúú'),
('dÕ(ÄÈ%JéùÞ@õG†', 'wp-admin/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜¥ð™UãÑãà²]éöC¦'),
('dàŽõa''ŒgCM~u¼ÕNd', 'wp-content/themes/twentythirteen/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<ðoþ$k)¢²ž_-l'),
('dáŽmÞ\0$¥‡ÍaÏé;›Ê', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Üý»05*JÝþ¹ìÀ\n<…'),
('dâºhÄ§{q4‡2÷K"ß', 'wp-includes/SimplePie/Rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=p¤m	ÇKãØ¯atû'),
('dè4jà2UÂVŽ·$öP', 'wp-admin/css/wp-admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ7¤HÒ;¤ìÀš˜ÚG'),
('dü¶,àmyK¸O$Ä£', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AglInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íàCcŒ=W*Îò±‹Dg'),
('eýÚ€é¸t¼ë	Y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/search-form.php', 0, 'Ìµ `ød¿´f–ƒb', 'Ìµ `ød¿´f–ƒb'),
('e.PÈ´NB‡Sx[Û&Á¼', 'wp-admin/includes/class-wp-plugin-install-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡@_ïÊc}àâgëP'),
('eT¾»\nÇCÁ>ãÝ;1×', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_real_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤+P<MAoºÑVØ'),
('eW`ø%ÚµKåvS›õb', 'wp-content/plugins/woocommerce/i18n/states/IR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EºuU¬å&/ð¤TŒèŽº'),
('e]%2¾µ,ðÑàuz¹$‘', 'wp-content/plugins/buddypress/bp-members/admin/css/admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ´®ŒâA]¾Ñf0i'),
('ekÙþ¯Rî N°jb', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_ApcCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð¥\0å‚3p\Z|\n÷X'),
('en‚^¸{mÜ=¤ÚUÕ˜Ð', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-styles.php', 0, '7èâû-†æfÖ°:…£¿', '7èâû-†æfÖ°:…£¿'),
('e˜Ã‘5£[q¤R"57ÎXÿ', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-theme-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9èOøëD«B''qÞ'),
('eœÑ‰²G–7ÑðXñ?\0B', 'wp-content/plugins/wordpress-seo/admin/pages/social.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$#;‹‚;¹''Ì«¼ª'),
('eœÚ\ZµˆÏ§Ô\0©˜}y', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.R/ûY ¢µ]ÇLž'),
('e®ä__ó%÷è®xˆÀÛ', 'wp-includes/class-snoopy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÜËÒmMzèMr’;vž–'),
('e±z‹‡üØž;"d»ï²', 'wp-content/plugins/woocommerce/templates/loop/orderby.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BŠŸÀ¿)k˜[RÃC»ê£['),
('e¸q½«™Â8xj¡ /®', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/wp-lists.js', 0, '8„Ñ¨Ï>''''ÚØ', '8„Ñ¨Ï>''''ÚØ'),
('e½^#|Û¢TÐ©’ˆz', 'wp-includes/Text/Diff/Engine/xdiff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö¹ÈbŠt­X8šGX'),
('eÙÝ\Z_žéE''ÀÝ|@S[Í', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/delete-topic.php', 0, '×!YG*½KÑJkøš\n¢', '×!YG*½KÑJkøš\n¢'),
('eïî“-†(ù{2ª,	', 'wp-content/plugins/google-analytics-for-wordpress/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žï‘Š›ìó3ÚëÇF'),
('e÷qwV\0Æ''móà¸Æ/ï', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|øå–÷’‹ !)ØO_¾'),
('fè¨ëÿ<)—.Âè_', 'wp-content/themes/hexa/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê)õödó£Š.ƒO&È'),
('f¹uÄàA-sK”N', 'wp-content/plugins/buddypress/bp-forums/deprecated/1.6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚‚€Ô“Ð<t°Ú¡ŒÛ&¾'),
('f+ÓbH)™µ\n’ØóEýÊ', 'wp-content/plugins/woocommerce/templates/myaccount/view-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zù$~Wì |ÜF.rÉ‘'),
('fOäªÛbÙG&!ühiª±', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/notices-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³tíÌøÂ	×KªiÖ6™D'),
('f^„dY½þ§{w?D¤¾', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/FuelphpInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@½KÌ¢½{~tbYb'),
('fwÃ}WE~ÅQ"%…õ', 'wp-content/plugins/woocommerce/assets/css/prettyPhoto.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìB0AÏ?¦öMÑðTW'),
('f…u3\n¸M\\Á}6*0íž', 'wp-includes/class-wp-customize-setting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø1„Ë„DzœpšÏU¡'),
('fŠ{2ê­á™ž«k>âuS', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables_themeroller.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øÿé„ïžà''®Ô2'),
('f“?‰(áÆ„Ñnöëf)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MODULEWorkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö¤Ù¢júú@±›\nN­'),
('f éœ°fØŸ|hû¹U’L', 'wp-admin/includes/ms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm\ZáÞèFš]ÕåCâ¨{:'),
('fÇóy£jC5\0©4kJáÑà', 'wp-content/plugins/theme-check/checks/plugin-territory.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÔÆ·¨%Ÿo‰ÑFz^Ã'),
('fÎä ÙýÂe«ªR¹)Ú', 'wp-includes/SimplePie/Item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Eâ!úCzì\0Žc<Ü§'),
('fÑïj)&TF¿ùå@MØÈ7', 'wp-content/plugins/woocommerce/templates/checkout/thankyou.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£âÐ¬`b¼›x²“¼¥æQ'),
('f×]ÐœÄŽÐ+w¶µ', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Î!]É-Ó‹Nò\r¨Ì'),
('fñÕ4_âî[b>µplM', 'wp-content/plugins/theme-check/checks/style_needed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'í%P@=œìU&2Â8 Ä'),
('fõ°tŠ×¦X¦	„s]€', 'wp-content/plugins/wordpress-seo/css/wpseo-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oÃm¬w2®JUÈ>†¹¦'),
('fü«ã[œÃàF»¢)õ', 'wp-content/plugins/theme-check/lang/theme-check-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-º\nø°vi×j³ÚÂ´h'),
('g˜¢Ð!‡Ã*¯MeæŽ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/members.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*—*©TT¬¯˜n|Œ<¼'),
('g#LæÍ¬KÄA]eaã•2', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_namespaces.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~â(+­KïÌH&G	Ä'),
('g#é,vM‘ÿŽ‹—ß:õä', 'wp-includes/js/jquery/jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%Çnc,âòÒR’·*ÌÔ'),
('g+yr‰äÐq„€ö€D©´/', 'wp-includes/vars.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘Óá QF&b³¯ES¢pN'),
('gnÍY–ÎnÂæQã_”)', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü½¿\ræ†óóO…ÙAn'),
('g”$G\\¾ë±;©rÄÄÏ1X', 'wp-includes/images/wpicons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dSüøuq‘V_®Üãaô'),
('g–Ý€á•£É¥DÌuüX', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-user.php', 0, ' Šh÷es7Óü¥¸', ' Šh÷es7Óü¥¸'),
('gÔ¨Z©Š’k¦v$ðæCÃ', 'wp-content/plugins/woocommerce/includes/walkers/class-product-cat-list-walker.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aq‡hd›ÆNÊ¥HÅÖá'),
('gõä]bR%ˆ ZÛEº', 'wp-includes/js/shortcode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºX2\0`yó¼½ëL8É*ß'),
('gþEdÉã1¢ÒD}ÂÂü‘Š', 'wp-includes/js/jquery/ui/autocomplete.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´Jè€S;iëª‹«»²¨'),
('h\ZOhløç_øÍLm/å·', 'wp-includes/class-wp-customize-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰2øC;·}ÏÌj/¥s&Ôo'),
('h dÑ’ê»…2öÃ_Àr', 'wp-includes/functions.wp-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q›Ï3¥ÓÚ§æs†à'),
('h*«@8›	êHî(ª‰', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-theme-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9èOøëD«B''qÞ'),
('h*b[ñù©\0çqÆbX\r£-', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_HttpStreamIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²›qŠž“\0-ì•ZÂé'),
('h0X-Èiÿ»Õá^ÌG`8', 'wp-includes/pluggable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ±Á‘Õ.ÍR•šmìÙø.²'),
('h4¬‹ò#3Ç`Ž-Ýˆ¨"¢', 'wp-admin/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘„å?–ºÞ>zçÍ©íßz&'),
('h@ZÉ%Rë•Fß;ti\\m', 'wp-admin/css/login-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½P,9ö¬fÝÁOÆÄ}GÆ'),
('hFšµÕ„¶çØ)ßiäh', 'wp-content/plugins/woocommerce/assets/js/jquery-tiptip/jquery.tipTip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eÅKÏ[–©u=¬tv3‹'),
('h|hEˆˆf:Æ±2š‚~', 'wp-admin/network/theme-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&Õ·Í1UpÐ%àž1=$ä'),
('h ’r³¹¼¿™åþ;,%', 'wp-content/plugins/buddypress/bp-groups/bp-groups-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S:¾,ú½Úwº¯¨BñäÓ'),
('h²sÀ¹J2µª¡çëéZ', 'wp-content/plugins/papercite/js/papercite.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸''lëã… i£ vÉæÀŠ'),
('h»<²]“”ìOpNCÆ´æ', 'wp-content/plugins/wordfence/lib/wordfenceURLHoover.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vÍ#Aq''I‰bOµòv¸D'),
('hÊ ¯Áî™‘Z¡/ª®Ú', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/extensions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“¶L·S±ìÑÔ‘&D&ÂºÂ'),
('hø›Óñ:ô¸BÆù/H3û', 'wp-content/plugins/buddypress/bp-core/css/buddybar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Í\Zùë+ÈÞ7¹X3ú¬€„'),
('iAh{‹ÏãM(‚|J,×ç', 'wp-admin/js/wp-fullscreen.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x\n’¬äÇ@¾½¢ìœÅ'),
('ia\nOÀ›Éõç''…*Õcç', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/KohanaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z Š"IîóË/„ú…®'),
('irR’R)&˜8°»³¿K', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ex•¡ÂüO!ÖNÄ´'),
('iŠC¸Ó<ºùû…ÙNïFÞ4', 'wp-content/plugins/buddypress/bp-friends/bp-friends-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý/ÀÓvHŠ¯™*ºhÊ'),
('i²-ÿÐX±8V[~Eû', 'wp-admin/css/install-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ò{Åÿý‡ÙìÏv~³'),
('iÀ\\´¯›=Xïh$', 'wp-admin/js/language-chooser.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	âPÇV0×tJ»J'),
('iÔU\\n;Á°ìJð…ý', 'wp-content/plugins/woocommerce/includes/class-wc-https.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦oûG!hR\\+''š›'),
('iØ´6ÿ?3‡Ô|³?e§L', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_REST.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äÐÿz­‚ê>²4Ý`³ýf'),
('iÞð_ªcFòcÆ‘…ªa…', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/DokuWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N¾ƒ]ñ^g¯\r´©†x¢JÂ'),
('j•‘Æfø²„²Ú_7V©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.bp-options.php', 0, '“¥<…Ð$•>ï•$µÚ', '“¥<…Ð$•>ï•$µÚ'),
('j±­Ýÿ&š\\³U¾žÕÚ†', 'wp-content/themes/twentythirteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±_…N¿wÿ´ÁÏ(9ºw£'),
('j&ºV1™¬®6“4ª¯ëâ', 'wp-content/plugins/wordfence/images/icons/ajaxWhite32x32.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾íér‰Á9 #Ó{…'),
('jQûõ—e÷Šø;âe', 'wp-includes/css/wp-pointer-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^AM§Ã>RèîS® Ì,;Ø'),
('jmE¤ÑAXÝuw›>Ü†', 'wp-admin/css/colors/ectoplasm/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AE|0Öð)DÈmXñ'),
('jä±‹¹¿áð%ˆÝÃ]€', 'wp-includes/class-wp-xmlrpc-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù¡Sa³ nì½Ã~êC'),
('j—£Éÿ5F+¸¯ío', 'wp-includes/images/crystal/interactive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯RÏm`òíº`™9§æ'),
('j§mÃ*Ž[g+HFJ¯', 'wp-content/plugins/woocommerce/templates/checkout/form-pay.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š~[çè†_ß€)Á4¾`Å'),
('j¿H®ìNw#=`éÂ', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-order.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åÙÒ•îÛú•2žt¾ñj®'),
('jÀá—¨w"æ2\\àDaÛ', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Plan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k%N::+?VÜÚlÇ¦yŽ');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('jÒ…ƒ6n?h+A¼ã*ýÌþ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_HttpRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûO`ÔCíGR&²µ•\ns'),
('jÚ¿´tØÁ1u©¬†}£§¾', 'wp-content/plugins/wordfence/images/wordfence-logo-64x64.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø]$Òbdù+NY'),
('j÷êŽ0JWc‚mÍ]ÝsÏ', 'wp-content/plugins/papercite/tests/test-highlight.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õZ4¿éíÉkÜu½EÊð-'),
('k_|=S»“	¹\no', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/blank.gif', 0, 'm"äòÒ|no«	Žvè', 'm"äòÒ|no«	Žvè'),
('k‚ˆ¸$6O³Ò-N…x ', 'wp-includes/js/tinymce/plugins/charmap/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬b~=	±\Z¶Ïæ‹'),
('kV''''Vš/tbðÒd×1', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/hello.php', 0, 'Ó=‘²íøÚÚmcÅ*\\A÷ã', 'Ó=‘²íøÚÚmcÅ*\\A÷ã'),
('kHew+^°¾Jo§g4', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ZendInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•<T‚•ñŒW<l0Óµ'),
('kMÏü–œ¦šîÌ™Ysp', 'wp-admin/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}@Û¨¸sÁù‚«ª‰IE„ñ'),
('kg›ö''Ñãžcáâ}§', 'wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢PV–°:´G6l­—$a'),
('kjG±Ø×ÇÜOžYÏ@|', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-resource.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë%g»‡îÿôÜÏpÀü'),
('k™TäþY¸‚¬U.Š€íû', 'wp-content/themes/twentythirteen/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÃœA®d¡pnùýæÄ¼°	+'),
('k¡~`¡’j>y‘=ëˆ˜', 'wp-content/plugins/theme-check/checkbase.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dwðœÜ#1ùÀìµÉYlÄ'),
('k³`ì;¬öÃùW\0Óý?‡Ú', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/default-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qò£‡‡¦“ÂYÿ(ì±¬'),
('k½úBËžãb=y†Ú', 'wp-includes/user.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Î}œ„\Zˆ…™XFiÏ£ø'),
('kÒq‘\\ª7ßnüö˜2úG', 'wp-content/plugins/woocommerce/assets/js/stupidtable/stupidtable.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[‰Y`×Ê×Q¨Z1q·Ô¶.'),
('l;.7º[Éh4Ì#Ð8é', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´{vã€Ù§\\KÃiÊS'),
('lY=!{~Íõ(0UŒ—¿\0', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin-media.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'såÖ£§-ITÅ'),
('l^ó<DÖ–P%*&Äá²', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DrupalInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ³w#ÞÖRímR)Æâ§Îâ'),
('ltíö´¼%°ØLÚçïÕ„p', 'wp-content/plugins/wordpress-seo/images/question-mark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁPÖ3ÐXXJ¼óùÌ'),
('lx qãp§ÍÑŸ0³Ô''', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_FileCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìé\0Q’tjŒ @ØŸñ'),
('lQ¨¼Õ…ôŽ¾…\\I¾', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢¨ìB—fÎÓèè#žˆé'),
('l†lî¥7/X’Ï@', 'wp-content/plugins/buddypress/bp-forums/bp-forums-bbpress-sa.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S~ñ/Dô”™ÿT\\Ý'),
('lŒæ''“×âƒ÷†•	', 'wp-content/plugins/wordpress-seo/admin/TextStatistics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íC\nÕÖCFõI}á6žì'),
('l¬³ppâyb±»Ux', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PhpBBInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}×ì,¼S=–ÐÍØT³8¨'),
('l²“RìíFqOw\\žý©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-plugins/akismet.php', 0, '‰…éÛúŒýôÃ\rÿõÀ™', '‰…éÛúŒýôÃ\rÿõÀ™'),
('l³ªQ%oØ?µyßCäò', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-admin.php', 0, 'Ù]BÑæT9ß…o(´', 'Ù]BÑæT9ß…o(´'),
('mÚ2]À.èÕAúJÈŸ', 'wp-content/themes/hexa/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²4îMiõüäHj€ý¯JBc'),
('mD’ÆTŽms‘·òA©}', 'wp-includes/certificates/ca-bundle.crt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—‰vÇ»ú¹!šo\nŠf¤Úo'),
('mAçðY·àÊÀ®Rb|ÞSŽ', 'wp-includes/ms-default-constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NM“í¢¨ÀŠÖ9ñˆbü%'),
('mEš¯ñö¾º\\ç)ÞØoÔ', 'wp-includes/js/jquery/ui/spinner.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|/´ÿ¤SÉ‡“Ý%q	¹³'),
('mIé0b1ò„xX…ôÅ¿ë', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õ0Ñ¸BcF“®q–ýû*'),
('mY·Á“š}É½ë…?', 'wp-includes/js/jquery/jquery.ui.touch-punch.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÈmÄQ4Öƒãˆ]±'),
('m†þU9vGÈíOÀ@¢<C÷', 'wp-content/plugins/buddypress/bp-core/css/buddybar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$šõvehó3®æàÕd^c'),
('mˆº-\Zm1½¥Èû£wÇï', 'wp-includes/js/jquery/ui/sortable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÉùL)dûèšôCräÖ'),
('mœÿ¥Æ\Z•/·®‘„Â', 'wp-content/themes/twentyfifteen/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð(ù°ò ož›“-\\'),
('m´·L%AöML><]', 'wp-content/plugins/woocommerce/includes/class-wc-frontend-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MÜ·Z¼Ù$o$ut=$\ZI'),
('m»»ÖÄàï}ß|üµí—', 'wp-content/plugins/woocommerce/includes/wc-coupon-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·ÍÚ‡E¸¬F08t*\0QG'),
('mÐ''\rÎHà9Œ\\RmÚ*sS', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/app.php', 0, 'JSìëÄûäÕ9-åòvœƒ', 'JSìëÄûäÕ9-åòvœƒ'),
('m×‚èíGÁ+Û|ìÍß–', 'wp-content/plugins/woocommerce/assets/js/jquery-cookie/jquery.cookie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Áy/$PÊÓ=ãTMó·½'),
('mßƒü”I\\‡¹/ ›”}', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹U¨"ç+Õâî’6ò×—'),
('mèt<¨äsºãFÓ—\Z¿', 'wp-content/plugins/papercite/format/ieee_mod.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'rIV½-!=˜ù¢î%K'),
('n]ûj7<3ISsQß', 'wp-admin/images/post-formats32-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·t.E¶­ê5G¥N\Zóþv'),
('nˆÌàÄd/Ü½I\0ÊÄ', 'wp-content/plugins/siteorigin-panels/widgets/img/textures/light-dashed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨‚ø\0|Ä\\wèðãœ…E'),
('n#©t=•''…’ÁÞõb]{ñ', 'wp-includes/js/tinymce/themes/modern/theme.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VL]õçùŠèTg2%\Zê²'),
('nSîsªÚþé¹E‚bÒÄ', 'wp-content/plugins/buddypress/bp-activity/bp-activity-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ôê~ƒKu(óL¡Ë7D'),
('nZ/1T:{&^„/n¿ý†', 'wp-admin/js/media-gallery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|ò¸f’§„ö8÷}+&'),
('nZéU¼ÇæŽÁzU¾xœE', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-bits-rtl.gif', 0, 'ä26ufÿY½l{Mõd·', 'ä26ufÿY½l{Mõd·'),
('nef¾³°A@´ÿ¹R‡?¤ý', 'wp-includes/js/jquery/ui/position.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'XkÁaŸâªkïÓ†'),
('nrTåOâ‹Æb×£éá', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('nxtD‹û¹Pt_vÆì', 'wp-content/plugins/woocommerce/templates/loop/no-products-found.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z¤žü¢4iD½;ªT…¹'),
('n“ÆíÄ@’§AŽùF´', 'wp-admin/network/sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''Ï;eMÆ ×''\ntmf\\«G'),
('n ‘$÷«ºLòk`sÝˆ', 'wp-content/languages/themes/twentyfourteen-es_CL.po', 0, '¥iÌUL€UÔ±%u#tò', '¥iÌUL€UÔ±%u#tò'),
('n­sžÏÞt¿YøQ¼''', 'wp-content/plugins/buddypress/bp-messages/bp-messages-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Òì5dÿÀmšnæüh†}Q'),
('nÉ\no§áäJb­\nH@#', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëQi™¼ª\Z²9lÜÒCÀ'),
('n×dÖ·kXivf¶©ñk', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/d3.v3.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äãm¯×ÝÛ÷¶t¶Ê 4º'),
('nÙ¢íÆ7Øùç‡¥¸×x³', 'wp-content/plugins/wordpress-seo/admin/class-pointers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–°„>ÅÐ>ÒS«Dc'),
('nã”ìÛOÒv™WÓ#H+', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-da_DK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿…Ÿ.ÙÛ5®V)!éz¼P'),
('nåMàzž‘¸ÀuÐé•RS', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zo97wªec‡ß¾{'),
('nëÒ‘''Á	Ð%¤_”?šÞ’', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'bÊà‹[új›Å9Û7“žY'),
('níþÎÀôOì¤`Âééö6', 'wp-content/plugins/siteorigin-panels/css/images/dropdown-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Î¾^ZGÖ÷ÔÖ?àç?'),
('o"’®Å¼^~*‹G½™Òß5', 'wp-content/plugins/buddypress/bp-groups/bp-groups-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝeT	üóuœ1w%.-'),
('o=§´-àsJÛ\\ÏÖ%÷', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/images/page_header_bblogo.png', 0, 'lZv†âµˆÅÝÙŠÓë', 'lZv†âµˆÅÝÙŠÓë'),
('o@eÀ©îI(ü€ü\niIŠ', 'wp-content/plugins/theme-check/checks/postthumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·îVdà+Êï&»”À'),
('oPZ\nÉ%ão2X!á''^', 'wp-content/themes/twentyfourteen/page-templates/contributors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*¢ðx/>7ÿe‡‹éCµ'),
('oPðûc™‡ìo©.är', 'wp-includes/js/tinymce/skins/lightgray/img/object.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'órdP×E}u\n/M”AÇî '),
('oQ¢ö¬ˆAÞ©ºc#˜ëñ', 'wp-content/plugins/woocommerce/assets/css/woocommerce.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æúõì¢<óß[U ùn'),
('oSB\r–Æ®³4š;Kô4', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-object-cache-memcached.php', 0, 'Ô1/ûÇGÅO‚Tð*zS', 'Ô1/ûÇGÅO‚Tð*zS'),
('oV™’~¨¦Ïµ=ž”i''', 'wp-content/languages/admin-network-es_CL.mo', 0, 'ßŸvL‘—”ÜZd', 'ßŸvL‘—”ÜZd'),
('oZ0†š÷ùÑØÔ<cÍ0', 'wp-includes/SimplePie/IRI.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nÿ Óæ†’Ï;a{‡_6õ'),
('oeJŸp§ÆËˆMi›ž±ï)', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/yoast_ga_admin_dashboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"&ÍÎªô‹8\r“øñ1'),
('ov¸Ü?ÉÏò—)™ª!Áy', 'wp-content/plugins/woocommerce/assets/images/icons/loader.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿÀÎ‘ãÒüâ‚ÚÍ´'),
('oŠY4ÖŒƒ4{#c^Èj', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/404.php', 0, '·1–äK\0j‰I5á_:Óm¯', '·1–äK\0j‰I5á_:Óm¯'),
('o³ž4ak24:DauM°', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.resize.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­s<\\pŸ\núAG\ZúW'),
('oÐåaÈæw5hÞ@+w\r¼', 'wp-content/plugins/wordfence/css/main.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''óV ´šà<Ó\\–HÓ¯'),
('oã®š-×;?X:ûpÒ¡', 'wp-trackback.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìñ.Ž¡dº˜Ø#kµl'),
('oí“[¬Ðn3u‚ÈÊ¹ŸP5', 'wp-admin/options-general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÐZ»îñhba·1ê÷¶’n'),
('pôô7uÌLÍ_{2Ã›–', 'wp-includes/js/jquery/ui/draggable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µ™;fCJ™ë[oŒÝqoÐ'),
('p>¼~ àŠF®é¼\Zs', 'wp-content/plugins/woocommerce/includes/class-wc-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.”•ìåtÿnéÆ°ºçS‘'),
('pÚŽŸ÷5ÿNuÞ\\°', 'wp-content/plugins/buddypress/bp-core/bp-core-dependency.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-I€º‘næúëj‰é¶ýŒ÷'),
('p.ÊÃ½ ÈU\\çåª‘œ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-statistics.php', 0, '|@L gF‹»ä\Z÷’ìh', '|@L gF‹»ä\Z÷’ìh'),
('p2Y1íÚ²ð¾Æ"ÏÝ	ê', 'wp-content/plugins/theme-check/theme-check.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿åÚ)ìLM„ôk.b8'),
('pGž,›\ZéÔ³5,ƒtÓUã', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ClanCatsFrameworkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×ÐöçÕâVo5€ìÚ\\'),
('pUyüa	êb¯àva„;¡8', 'wp-includes/js/comment-reply.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó\nÐ(e=N¬(ZMV{½'),
('p\\ó·½ÆÿæA26oä', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/item_back.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™pC·Œÿ:¸³ÂX+:f'),
('prÒ…¦g´<Æ€…ÿ’', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î@.V~H„›Ðj‹\Zé'),
('pzD˜oýÔˆYCÏÆØ', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/60pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝËYSMiÓx Ë€ªnü'),
('p„\\óÕ#ó‹:~CFâQ–', 'wp-content/themes/twentytwelve/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñG>¶¨+aƒIzÚq}Ù'),
('pŠÎÊÝ+:œZo)eí''', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/DokuWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}‰–=æ%ü¿“7\\Ñ8V'),
('p“cxbàBßRšF¨d%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/footer.php', 0, 'z¬ðŸ@?/)¯Ù¶·v«¢', 'z¬ðŸ@?/)¯Ù¶·v«¢'),
('p•ð´.Ð°”ó[ÃD¡', 'wp-includes/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*NJö-94Oknh”	ÕÇt'),
('pšÏ×ÕìzIÞ[÷r™9ø', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-caps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~ó$L›ë}üÌ÷;nžús'),
('pŸÍ‘‘­Óñ­6ÆÃ˜r', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/logged-in.php', 0, '/Ú?¨†qÖÄŠÿ$²', '/Ú?¨†qÖÄŠÿ$²'),
('p¨Äàåª2+"•ƒ&Ò¬?', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TheliaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R#tXîÉƒtÀ}7FI7'),
('pØ_uNJp#B36ÌCe', 'wp-content/plugins/wordpress-seo/languages/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('pÚ/ð°XU`Is›¤b', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',Ò¢1§BÉXþöé3Êg#'),
('pùÀö—b¥~ƒoBkÌZ', 'wp-content/plugins/akismet/class.akismet.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òf‚Å§\rÐÐ1\nÍªÏl'),
('q´Lµ 5%ßÙ¨•ù', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/entry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œu~õmoÜÙ”ÖL!'),
('q\0^ômvBsfC~Ì', 'wp-content/themes/twentyfifteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„É²b®ZK“ž“K­WØî:'),
('q"coëÞ£>«2Rhé]', 'wp-admin/includes/plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0xD:ÌšH‚Ã­=§½ÑI '),
('q4‹]0KvlÎù ÍE~B', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ElggInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Ž“PÌ†©¿¨‘x¥Ç‹'),
('qDB¨²Öpï¨Ò4óµŠP¨', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿ÞjTÎ¯ìÌfÓF"«Oã¯'),
('qhÿ665—y|ò=ï?S	', 'wp-includes/js/jquery/jquery.serialize-object.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ\\)¡Ÿú‹›Jèl<ú"'),
('q‹€\Zp?Ç‹¾78gtµ ', 'wp-content/themes/twentytwelve/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9±Æg0Ç\ra“Zk–É2+á'),
('qßÀ_\ZB6¡S(Qã3¼', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MediaWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡#Sé]³r·ýò\ZÅHÔ'),
('qä¼X\nÀ^°ª±Øj^A', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Yg_É–oó\0c­Èâ='),
('qêL¾Ûis>uÃ_&±', 'wp-content/plugins/woocommerce/templates/emails/plain/email-addresses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'îöwb¾+Ù\0hòÛÞˆPâ'),
('r  •xuínKßNé$', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bpdb.php', 0, 'º»kþðô­†ÂØ‘		g', 'º»kþðô­†ÂØ‘		g'),
('r”®h’Åv†ÏLk/…ö', 'wp-admin/network/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' cºq‡E\nJwÞ#U~b'),
('r%ÑsýqODöA—ÚÐ¶^', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DolibarrInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»	m_d&Ôºô—‚0w'),
('r+zk;» 4¯æWI', 'wp-includes/js/tinymce/themes/modern/theme.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/Œð‡ðý&H\0TýèA÷Ë'),
('rG¨)uò¶•¢~è+~UŠe', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ClanCatsFrameworkInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×ÐöçÕâVo5€ìÚ\\'),
('rG¼¤#7Ø«="‚	Ë–', 'wp-content/plugins/woocommerce/templates/cart/cart-totals.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ðmf€¶ìÌ§¼l—ÛÆ'),
('rS:…`÷ eà¿¸ùB…', 'wp-content/plugins/woocommerce/templates/single-product-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹¥Ñ4Õ¤à-_\r‹Ÿs'),
('rV8û”g'' Ô«î¬', 'wp-content/plugins/buddypress/bp-core/bp-core-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']öBùž1¦+]OÁŠNãG'),
('rbôz†-•7Àö–Rg', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥2<7qHÞ)e†Y?65Ö'),
('rfž²¿\\–\nÁÛr×‘', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-customer-list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–!à"ŽØ‚ÈUd¡6Òß'),
('ri¹vžÄ4,!$îÔÂÚ±', 'wp-content/themes/twentytwelve/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@\r®;ho1­§B'),
('rja“[ÈÁÝ”oùOkM', 'wp-content/plugins/buddypress/bp-groups/js/widget-groups.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'x$UUtƒ¤Ýê/5K(…'),
('r‰(nÕž¨ójç—ßb"', 'wp-admin/js/media.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'übCæêtòÊb¿û„ãe'),
('r©ÒL )ˆL(s»¸ŽT', 'wp-content/plugins/woocommerce/assets/js/admin/round.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Š(]†g¨ÿÄ».¸Ç×ã÷'),
('rÁpË#@»yb®(©’W«', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á{ø<p´,¼,o§Rc'),
('rÄžÈ\\€£?E„"Ï¦QCÅ', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/qtip/jquery.qtip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž´y²nïÁm\r>ÂÇŒX'),
('rÛw#©ªšà×–Cû³Ö”', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾ßï‡ˆsLpÉSŠi^L'),
('rç+°OÜ—E}‘XÔ~›·m', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜Ù\r‹\0úº¡Yq[2×°Ù'),
('ré_è/™ÍHG=Í%—<º', 'wp-includes/images/arrow-pointer-blue-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%mârÞŒ]4¸9cÏ'),
('réör‡(J¯g÷(¨y­t', 'wp-includes/js/mce-view.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	n"ò¨m½áÞÅÞAÐ!'),
('rìÙWDM\0%6òÖ)', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-recently-viewed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­X:ÃÂôoðí¿pSÀÿ)¸'),
('rùÎ\n—Ûb°•#ð©é', 'wp-admin/css/media-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëß©¥˜Ä­ÆBŒ/½«'),
('sg›ŠÝè~=Bf†”', 'wp-content/plugins/woocommerce/templates/product-searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T#\\¿N}rXÐHë+©×ä'),
('s.^Y»W\ZXþUT4,þ†ò', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/favicon.ico', 0, 'áaüŸs=!.™`\n8+\0ŸO', 'áaüŸs=!.™`\n8+\0ŸO'),
('s8P™Î\Z%?zÝœGâ©ëz', 'wp-content/themes/twentytwelve/rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#‹¡ÌG;õGµˆŸ²ñ©'),
('s_˜kÖŽ³ÈÜoH9ÕºÂ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-posts.php', 0, 'NMÖMã¿òçæõØø€~s', 'NMÖMã¿òçæõØø€~s'),
('s|”Bs©ÁöpŠ$å[y', 'wp-content/plugins/siteorigin-panels/inc/css.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_È¸Š$lÏáä »x]ì\n'),
('s¥½;\ZÀ±=0Ò—W’ß0', 'wp-content/themes/hexa/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aíËTn˜ÓÝáÈ¢R™_'),
('s¦ìÓ£Jö³Å~’çk', 'wp-content/plugins/akismet/views/stats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D‘éÑEÅaxþt/©ZT '),
('s¬›œžòF§×ê±õ~æ', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó¾-&ÍÀ26+*â-p¼G'),
('sÃ‘mbõÎ­˜&˜‘ô*', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/post-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷Î_¥ýö¨CÁÏ0çNà'),
('sÍõ[±° l}Rµ', 'wp-content/plugins/buddypress/bp-core/deprecated/1.5.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å€hk^mA>TWƒRJº˜'),
('sÐÂ¢Awÿåe²EE‡T', 'wp-content/plugins/woocommerce/includes/wc-page-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äÆ:S6ÌÙxá„7ÎM‘'),
('sÙAv1\r8?¶ÅÏÍ”àQ', 'wp-content/themes/hexa/inc/wpcom.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' È#:ËºžJÿà"çpq'),
('sÜ0ylóêƒ‹D\\£…"', 'wp-content/plugins/wordpress-seo/wp-seo-main.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–¢É&·I‘Ÿ7ÙJÜ)'),
('sÞKªý!óÈ7m¨{½¸Þ]', 'wp-content/plugins/woocommerce/includes/wc-template-hooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó©â\Zô}Véb2Nè{7'),
('sÞÅU''÷ìÀe@¡d‹', 'wp-includes/js/tinymce/plugins/fullscreen/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§¦}á 3Çv8JedÌ'),
('sã?g­Î;ÚSçÙ!½·', 'wp-content/plugins/buddypress/bp-friends/js/widget-friends.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼D”ù*iÂ*CU«hó'),
('sÿC4M¾*µ¾*B«)µ', 'wp-includes/css/wp-pointer.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒþþêW†T^w_%”H-'),
('t;‘Í¤\0Þ>sr[÷Œ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚UQò–ð™Ã&2'),
('t\Z+ûFÄ°.ö”ˆD', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òôý:Z\ZÄð-¼J¦Ç\r?'),
('t$:/H”®ÉtÀ*\\¶Àû', 'wp-content/plugins/google-analytics-for-wordpress/assets/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('t)Ÿ¨µªÿüL1{æW', 'wp-content/plugins/siteorigin-panels/inc/plugin-activation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛF–P—^T›~õ?iÊü½'),
('t6·îžO¬\raŒÈ†ëf', 'wp-admin/js/plugin-install.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.-ë$ƒZ_lRYi\rwZ#$'),
('t8ŒÀÐïp¯Ì‹Õz{jDp', 'wp-includes/css/buttons-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­óµìþNfâ ÐŽ”DD'),
('tCzÜ4<0 P*ëýùN', 'wp-content/plugins/buddypress/bp-core/bp-core-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢Ê«RµÎ lú5Ö`—c3'),
('tUÒ/Ds¤IÚ¤Üstã', 'wp-includes/js/wp-auth-check.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·©R%K[D×Úl@þîq'),
('thâÆPšÌx\Z2×Â´T', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ZikulaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K«8Iºdp˜o?E'),
('tm6Û—ÀqºÿŽ.£=j', 'wp-admin/css/colors/blue/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	ºš£u=üjªt~F-'),
('tµD#¿µæ$3Y¢ìy', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '® o:Liò¹ÍBˆÃƒ>¬Å'),
('tÙ	Õµˆ"…;‘gF²f', 'wp-content/plugins/buddypress/bp-groups/bp-groups-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd¬vP‘ÁwtF&QŠ'),
('u2½~ƒÜô|3ìÈ', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-integration.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™TÆQ\\¢¿¥vÁU&ÛrPö'),
('uapF±‹[t#Œ€(q[', 'wp-content/plugins/wordpress-seo/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('ucì²‚ŸÞ?ÃÈ\\aÛ', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’AÂ¤§ÕRá¢ßü²â¶ô'),
('ueö,"\n	îh¸g.', 'wp-admin/css/colors/_mixins.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sâ_Ëì‘å|‘''4.o''6î'),
('unY¼³ðŽ6GyIŒÌ', 'wp-content/plugins/google-analytics-for-wordpress/frontend/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('urmüÍËà²4¡~Ÿ¡‚', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/LithiumInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!{ÖhÈ¡R2Ëªí€¨6'),
('uvúÕž(S5ä‡¹í›¨', 'wp-content/themes/twentyfifteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ò—ÓugweâPýºgG'),
('u¬øUÊL3škj4sJ', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+u+-»®ôFŠ€)[%F°'),
('u³’;ÇyOSð^Ò)>%ä', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/BitrixInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>½÷¡¥þWO›”`H'),
('u¿Ü3!pA³f…)R¯MÛ', 'wp-includes/js/tinymce/plugins/wpgallery/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±­¿Aè‹#jÇd½&æSù'),
('uÃÿú“}‹¬ÝeuÄÆ½0q', 'wp-content/themes/twentythirteen/images/search-icon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7£ÏŽ=]ô\0,UØˆ4¢”Ð'),
('uá\rë<é7	C.Ë', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-it_IT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0‚fàGn1uÕM¼;§'),
('uáqg\Z\0‡8‰hÔ­û\0ð', 'wp-admin/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ<È9¿³€ƒ÷-A!Kí$s'),
('uþìQ"±å~W¨ö¬™Ã°', 'wp-content/themes/twentyfifteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²4îMiõüäHj€ý¯JBc'),
('vÚ´¡åÇÖV¹½ØKµúP', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$l¯ayêl@5·êì~Ýn'),
('v5MT‚Ë€úÕsNü', 'wp-content/plugins/buddypress/bp-members/bp-members-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@q:Œ_ú.½kÙ¦–€'),
('v@¯¦£2ß­^qÆ WW', 'wp-content/themes/twentytwelve/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ò¦k·°Ý`Ô––6ð'),
('vK;@ÑsºaU1;©	^©', 'wp-config.php', 0, '$ø®„ –=GÜàqâj>d', '$ø®„ –=GÜàqâj>d'),
('vX¼òŸ%œW·kJ?ñ-#', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚!´OáOæe´†žJÄÂ'),
('v\\R&îàýœ¯2`u ', 'wp-content/languages/admin-es_CL.mo', 0, '£2>ÂÒ9	¦£¼—vÑ', '£2>ÂÒ9	¦£¼—vÑ'),
('vlBT›èª[6ÇÕBÂJù', 'wp-content/themes/twentyfifteen/genericons/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uö9\nJ“ýLa7Q·©ç„‘'),
('vvÉOsì‘$ïR]}¾TM', 'wp-content/plugins/buddypress/bp-core/deprecated/1.7.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ô§Dž¦7?˜?Wa‰\Zéd>'),
('vwÙÑ@ˆHÊÉz–F¦', 'wp-admin/ms-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š´—@ßÍ¯E…b6ä'),
('v]¿z‹ðÔåšÃ3»tB', 'wp-admin/includes/class-wp-importer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„á(½ÑæVHÿtån0<'),
('v‚äMs·”5+Å¶Ïá', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-table-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§b_§B¸rmóù§jS'),
('vž×|ÄæZ÷Þ"›fi^Z', 'wp-content/uploads/2015/03/uaiblanco-1024x317.jpg', 0, 'ÿâNA#0;]‚\Zý~ÔõU', 'ÿâNA#0;]‚\Zý~ÔõU'),
('v¡–Þ£ãûRï', 'wp-includes/js/jquery/jquery-migrate.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'â7Õð5¹Xþ¯QNòz'),
('v¥&þcÊ*Ë°´ùïz8ô', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocompletefb.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±ÆÚovñÌ­û@Ð)Î'),
('v½''³6ÚJÁ]zG¸¼', 'wp-content/plugins/theme-check/checks/searchform.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lu>D‘>ª–ûT50©§'),
('vÁÞkÄ0[¡ˆgÇŒo2', 'wp-content/plugins/theme-check/checks/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b o@ðJ.ºü\07q'),
('vâG‚.Âg·AõÆ#õré', 'wp-admin/images/align-right-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hƒl½>rº]£lWÆÀx'),
('væüáâ4Ý|>í<´ÿÀ¨', 'wp-admin/js/xfn.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âÖîË×t¯+±¡nÁ(k'),
('vèN©¬#uÎÏM7›°þæ÷', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ûˆ¿³÷ðFöòc‰p½Á'),
('vð{#¿¹lš“b\0}ÓãB', 'wp-admin/css/colors/light/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"—WZÆ…Tùøy}1ŽÂ'),
('vúÒ¸);D°~J"àq', 'wp-includes/js/jquery/jquery.form.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å¯Øä.Â,“+ŒÙ\nq'),
('wðé“ès¤¿Ô¡‰V/', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/sep.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷‘êL@o.õã®šWbXó'),
('wuèšl|åõp˜ÊQ', 'wp-includes/js/autosave.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.ì,@ŒˆgÎh/7'),
('w%ÎÖo»ªfnÆ`>¯Í', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MODXEvoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç ¾ùÐŒ~þ…^´F'),
('wxsÿ‚Ëë±ŽWUõ„6ñ', 'wp-content/plugins/woocommerce/includes/shipping/international-delivery/class-wc-shipping-international-delivery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€ª¢v	2‹¹¢„ÇU’Ç,'),
('wågh÷ƒÚSCàU®', 'wp-content/plugins/buddypress/bp-members/admin/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'úmïMeR¹)îûvH'),
('w–a`´Éi½…¸&¯ÕÇÖ', 'wp-content/plugins/buddypress/bp-core/bp-core-component.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÊæŽ­Ûiù€½8¹ '),
('w›’àÙØ+Yâú\0–fâs”', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/ZeroClipboard.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹\\{ˆþ7ã/ÓJpýö\0&'),
('w¢ÆS`j–²öIsŽQé', 'wp-content/plugins/google-analytics-for-wordpress/frontend/abstract-class-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä?6¯0°¶Ö;Ÿ‡Âªèd¶'),
('w£¤ïLýê£0œïð]r.', 'wp-includes/images/crystal/code.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`ï1²Ïúï°õ1®9'),
('w®''ìçúùaÜ¨¥¸±×¾x', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýž9´5öØ«ü×¬A'),
('w¯`•±YëôÇ/UÄ¨Ð.', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-plugin-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's\ZÓy·çow£Ñ’¿Œ\r­'),
('wíRÿ«½=!¤Î4U˜’', 'wp-content/plugins/buddypress/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0¥ñ§·D¨SÛø_'),
('wíä\r«‹h£®BÑ#	M', 'wp-content/plugins/woocommerce/includes/shortcodes/class-wc-shortcode-order-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+­-Áð É8YÚ¯^7,*'),
('wýúÚòáÊ:}V¹¼P', 'wp-admin/js/common.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É®mŽY[o·ª*Ø`\0Ò'),
('wþf_j:èÏ£—?_}', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/password-reset.php', 0, 'm\0õÝÃWyá¸¡ÂÄµ', 'm\0õÝÃWyá¸¡ÂÄµ'),
('x	G!Nä·$¥.šdŽTbï', 'wp-includes/ID3/module.audio-video.flv.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼àÖˆ?ÎdhÍ@ÀD†²'),
('x\n×ø@¨…†þFø¢·°', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë;ÎàsÙß\\§\nV–÷Ì'),
('x$‘ZÀœ~gJ[ˆrÌ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎÁŠûäLbÌ\0R¶)'),
('x.o\Z0L³u Ï³äÚ', 'wp-content/themes/twentyfifteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýtÖæÊaÚ„Ò=ûB'),
('xG‰ÿd­C©å1xM¬pÞ', 'wp-content/themes/twentytwelve/content-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›Æ8\\ÆZª»¨07&4'),
('xIHÞ.”9”YÃàBO', 'wp-admin/css/colors/coffee/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9~8 ²z#C0É^%aÎ'),
('xy—!àøôqÁ)ö.Ë‰"', 'wp-content/plugins/wordfence/images/sort_desc_disabled.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎmŽ„†•ÍŸÊärÑÖ 9'),
('xŽs¥2éõ³‚"ZÑUãÂ®', 'wp-content/themes/twentyfifteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬óÂ š’2ÕMD€$‘²'),
('x–^mÝ]Ì²š/õÅL4vU', 'wp-admin/includes/revision.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kŒÍ1´}Œ6{Æšý8Ñ'''),
('x™áX$:ãˆ³ï‰ô¤o', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-downloads.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J‚¬¬!G|òùQ_ÆÇG'),
('x©ú‰Þ¶¦5LCÇ}½¸', 'wp-content/plugins/wordpress-seo/admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('x¹wäi\0Ë/Z.Ã{%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-header.php', 0, '×æ®?ió8Ás Þ¨ê²', '×æ®?ió8Ás Þ¨ê²'),
('x¾6x+_œ4"øÈå%', 'wp-content/plugins/theme-check/checks/badthings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë~éŸAAÆÊÑ€PÔ=3?'),
('x¿?»äI|9@‡Á.¥ˆ„D', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-cron.php', 0, '©AœS\r°óë"Ö*À•', '©AœS\r°óë"Ö*À•'),
('xØKÿ‰e¨8|ýìÃ6[ê', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7³hQ¶v<j4½@¡'),
('xÞ-úoø×^\0ÑÌ­Ñý›m', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MakoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ó³ïº6g«O5|ðï '),
('xçƒ$O%	Vúžcè1', 'wp-content/languages/es_CL.po', 0, 'ÿCº‹EOºDæÊ€˜ô¸Î°', 'ÿCº‹EOºDæÊ€˜ô¸Î°'),
('xë‚‚Ÿ@}YÇŒiË+', 'wp-includes/js/tinymce/plugins/tabfocus/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TVôç#)ã¾{ôú¿·'),
('xük!òÍ¯Y”…KzÁ	Às', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®ûÛŠœmcimhnÄ'),
('yŠ­1‰â-è†/fI× ', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Html/Array.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(©/FI2¹§LXG÷\\‘.'),
('yqÐDåG­ãuÿÓŒ', 'wp-content/plugins/theme-check/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';ÅwÃ[’=¡/ÏY—¡~I‚'),
('yãÖÆVè²Ùœ’^"/', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1Â“Yª%à½ÛÕ¹·Ö'),
('y+mý2Ó{XX–‰;', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/po.php', 0, '-ºüZ;tO¯Ë‡°„v\r', '-ºüZ;tO¯Ë‡°„v\r'),
('y6ŽQ]ipv«±˜­w§', 'wp-content/plugins/woocommerce/assets/js/admin/accounting.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜Íæ‰0!ÈA¡\n6«Ñì'),
('yoŸ_ƒøÏ¥	ý¨ô', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AsgardInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü\0 =™L¢ˆH(ÈwûMO'),
('yqÎ÷\0¥¡)ø{TP', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_Cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#IlküW”úE~’ï:ð'),
('y´íÝEaÌó:[\0', 'wp-includes/class.wp-dependencies.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·«T_[@jö»jÜ\\?ou'),
('yãv«•	R· ”‰ÙSåë', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.stack.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5:Ç¡0‡-<Bû'),
('yêŽäG•\\`˜áù¢MR”', 'wp-admin/network/site-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô•GM§wUß¾ZuY1+'),
('z0Kß¤èã¼ ÝÐ”šl<', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-pl_PL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…AáÃØÅ@ñ9MË¤Q`'),
('z0O\r„O“£¾ÑQƒr', 'wp-content/plugins/woocommerce/assets/images/chosen-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KçX$PUDí49ÃW}“q'),
('z;j2WDº6²Œ[¡V', 'wp-admin/js/accordion.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ò^Vã\nö8.7p¾Ct“7:'),
('zkÁÎ0•PyS*ËÏð', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installed.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÆIÓ³’ær`¡'),
('z‹{Á¸Ÿ"æÈGE¼ÚÆž', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô‚@†eôˆ„Þ"‚é±7T'),
('z¢5·*\ZADZCk¬áj®’', 'wp-content/plugins/wordfence/images/icons/magnifier.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨§uO®{:qcVãî'''),
('z¬öÕïJXÔw{!\rF«Àº', 'wp-admin/includes/class-wp-upgrader-skins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œ,ÊöÊñ×R¾î¯\Z'),
('zÒ½±#iB1ó½cAws*', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/jplayer.siteorigin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£¿Ñ…¶(S­…cÒ†'),
('zÞˆÅ±GH‰}g\0”Å', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/InvoiceItem.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't*]ä1ŒeºŽ?þó•K'),
('{Ãê™aétÑ\n">ªÇS', 'wp-includes/js/mediaelement/flashmediaelement.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çÊµèÜkúÙ5ˆ`*\\Š'),
('{N¤ˆÈ2íQ®uÔÞ=	œ', 'wp-admin/network/theme-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€OšF©ãdmƒùÅÓj'),
('{''˜ûóÙ]H•dú°ÁtÇ', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Åëæg__Š÷ÐÎÝ¢à'),
('{E\0É;<DÃŠ\0ˆ`¶B', 'wp-content/plugins/buddypress/bp-groups/bp-groups-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®~­~…yeïÔFµ¢`F›'),
('{g—¡?øª‘ÉiaÍ)C', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-bits.gif', 0, 'øà›Å$ý–sYE}@“', 'øà›Å$ý–sYE}@“'),
('{gÎe"¶òiÙ§Ï0›Â}', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/blogs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'QXî;Á7ƒAÔˆÀ>#^}K'),
('{tÈE~ªÌPÛA´1ø ', 'wp-admin/js/tags.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÆBfñ³Z†Æ<Á²Ä/s'),
('{‚ÍÐfÎ“à¢1ÊïoÛ', 'wp-content/plugins/woocommerce/includes/libraries/class-emogrifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢=*ÐD\0l-±Å0‘†{'),
('{Ÿ)×4e4p:±fW‡', 'wp-includes/js/jquery/jquery.query.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';ÌXzòÇ°ÆûÉÀwC'),
('{Ë×*ºCŒ÷ÔôU‘', 'wp-content/plugins/woocommerce/templates/order/order-details.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=æE7UÎ§Y?¨\Z‡M†'),
('{ïRC¼Ú\Z.*"¢Q', 'wp-includes/feed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü\\3!/¯è«Â)Tj'),
('{ôï°P8±°Á5xþ¼-€', 'wp-includes/js/tinymce/plugins/wpfullscreen/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝƒÝr\\‹+zJÞÙÚ'),
('{õ;ôÀ13è84Ëæ/', 'wp-content/plugins/wordpress-seo/admin/ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿsUÒñr¼àòØð›'),
('{õ‡?ìÑÕü\r’Ú\n''', 'wp-admin/images/imgedit-icons.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KÕ\\2ŸÙØ}©G‰i;O'),
('|jª•x7Ç(Q}Ž0À''ð', 'wp-admin/css/list-tables.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÓÒÉ/®óÇtàÓ4NgS'),
('|äýØ µîZ7''šÞ/"', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ru_RU.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘z˜GP2»¸¥¢Œ\Z\\åêÿ'),
('|/¬D­¢tÄ\nù©Zù}c§', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/CakePHPInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ø“² –œsû4£[Q'),
('|/Ú’ë\0[*4“ÿxüã', 'wp-includes/js/admin-bar.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	} °.©,‘êå˜ç'),
('|1ÕÄ·Ž+VéKÐf½', 'wp-content/themes/hexa/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹B;–ëa`GÔ¢·Þ‰'),
('|;?çìë 1×ö2', 'wp-content/themes/twentyfourteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÚÇŽ?ÂnžôOjÜãeA'),
('|Z²£õÁÒM¡d-v', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µçˆ„í!›™žÆŽÐ­ùhM'),
('|t&<±„À„Ì«ËCQÝ', 'wp-content/plugins/papercite/lib/PARSECREATORS.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Îx_lKÂ%öŒ“Kú^'),
('|„‘\Z­’\rW«tìfÝ', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-tr_TR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú¿ pºö¬ŒãÆ—šk”'),
('|t|“Ay¥ƒ\rAÎëû’', 'wp-content/themes/twentyfourteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡	ã]X&2çþ_'),
('|Ý.Mæ½hóë\0', 'wp-content/plugins/woocommerce/templates/emails/email-addresses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3Â+¿åe^Æ0È #°˜'),
('|êHfA‰û²O¢m=–Á', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-object-cache.php', 0, ':DÀ›”‡Y}™ùj ª', ':DÀ›”‡Y}™ùj ª'),
('|÷ãrIè”}½«YŒ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/GravInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>âÞ‘®»—Uì@^LŸ]'),
('|þ»YŒ>à€Ð	ùÆ†Ä', 'wp-admin/link-add.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u—GïDÅ/­Ï¥ÄWóòƒ'),
('}Ä‰=•t©­ò‘»¤¹', 'wp-includes/images/toggle-arrow-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FÊáÊ\\øƒôÉCDrï'),
('}. Æª{]âÌbW€æyž­', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/.hgtags', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥ùã\r"“-÷rî\0'),
('}`ÆÒg"PÉ2®ÂV½‡', 'wp-includes/images/spinner-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\q¼´9)hdxR©Éß]l'),
('}dvÇ@''.\n.Æã.ï', 'wp-content/plugins/woocommerce/assets/css/activation.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡éÓ…¿ÜämeaŸ‚''–$†'),
('}%éÛØ\rV(·¯ŒPcÿ', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹{åm„âÂ­{(â±nÙã”'),
('}®Âé>/\ZùÈÊ+i¸V', 'wp-admin/js/wp-fullscreen.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '54äìN÷Mjªú"\\É'),
('}Á7 Þ˜æDHDÚPl', 'wp-includes/SimplePie/Registry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¢æÀµÝ1v9d\0ðÙ¸'),
('}Ç°ƒ®¤ìr^©\\3¹ý', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-google-analytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ï} ×%£þ=ÕP©§'),
('}ÙšäÄ‹c©¯ÑÜõåÔÒŽ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/translations.php', 0, 't\r³Õ˜Q¶@ŒL«te½', 't\r³Õ˜Q¶@ŒL«te½'),
('}âÀ½æÌÝÒÄ$ñ', 'wp-content/themes/twentythirteen/images/dotted-line-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŒÄvLêÉÔ×sFw§õ'),
('}ï§­.0Ññˆí»‰Ú', 'wp-content/plugins/woocommerce/templates/myaccount/form-edit-address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ—uŠ;\0\r—3\r£|±½'),
('}ïÈæŠ\\Lü¯`Š§äi)', 'wp-includes/ID3/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6˜¡ðöÕjQàÃÒ#1”'),
('}ýÖË{RÒ¢Ôà¢"', 'wp-includes/default-constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ÁÈHÊ.è)ZüËŽtI'),
('~Y‚££†¥¯Hõ†#\0–', 'wp-content/plugins/woocommerce/includes/class-wc-query.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LQ¶''\ZÔ,Ui1sYž®ª'),
('~4Æ9è×o’?Žë€SÛ', 'wp-content/plugins/woocommerce/assets/js/admin/product-ordering.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡µpò1ê¾/Ü~”m&k.Ä'),
('~9-ð:§#­CýnãÎ', 'wp-content/plugins/woocommerce/assets/css/menu.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•î¡nÊ[³6aÃ¼Óõ'),
('~?¡J¼IÖb*×ºêeèC', 'wp-admin/images/resize.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?ºDß$ô\rÞXvÈÀ®Äa'),
('~F£Ìã«Ž>dyìÐj‹', 'wp-includes/css/jquery-ui-dialog-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7òjºë4+\Zn6åx>{'),
('~p¶jÜŸÂ€ðwu¾ÎÍ', 'wp-content/plugins/buddypress/bp-core/bp-core-update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•1)¾W˜L(‘E(1)'),
('~|‘?nJÙåßÃù×=„ê', 'wp-content/plugins/google-analytics-for-wordpress/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×fªXSe¹mÔ$×’¬'),
('~Å¥Ïs\0Ì1yì$‘L}h', 'wp-config-sample.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p\0Ýl”L³ž;arå#bf'),
('~Î©NåÛ˜î·ç=à=ˆø', 'wp-content/plugins/theme-check/checks/filenames.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðœö8¿ºOSºÉÙmü'),
('~Î”´,z¤áGïh‡Þ', 'wp-content/uploads/woocommerce_uploads/index.html', 0, 'ÔŒÙ\0²é€	˜ìøB~', 'ÔŒÙ\0²é€	˜ìøB~'),
('~Ó¤ÃwìJÌ¼„¿¡.ù', 'wp-content/plugins/wordfence/lib/schedWeekEntry.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'DÔ1¿D1ŸŸÅæ¹ä .V'),
('~Ô\ZQG0av£ß±Ö²¨', 'wp-content/plugins/woocommerce/includes/shipping/local-pickup/class-wc-shipping-local-pickup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'öf:ÐcÜ¨‰…þ"'),
('~ý-`Ý?žÛ8a‚oà—', 'wp-content/plugins/wordpress-seo/admin/pages/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ï¸Õ¦Õx­¶›Ja†°\\'),
('1Ä*ôÕçP	Xå', 'wp-content/themes/twentythirteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§Ø•Z&bCû%mÿßÌÉ'),
('hÎ;ðñáæöeÜÖq¤>', 'wp-content/plugins/wordpress-seo/vendor/composer/ClassLoader52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¹	â¦Z^ÎÄ+Á}iô˜'),
('^k¿ÖªDv6—R', 'wp-content/plugins/wordfence/lib/wfRate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó²¬Ë:¥''_þÙG'),
('j&†Â^ûÌøŒb³ôŒ˜', 'wp-includes/ms-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠsvµÉ‚hz¨*Êeø“'),
('ÇÕjš…)tPåë@)¯s', 'wp-content/themes/twentythirteen/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SÄŸR”®$Òyj×;‚ÛT'),
('Éy$yO[üNÀÓLyÿÐ', 'wp-content/plugins/woocommerce/assets/js/admin/wc-enhanced-select.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'P‹å"Ò˜%–Ó¾ïBøRü'),
('×ÛbÓh)áâ˜Du-Z¼Ü', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AsgardInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü\0 =™L¢ˆH(ÈwûMO'),
('ÛKûQð}U&;&˜ïØQ', 'wp-includes/meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ}µ{qÑ	Çg•ôþ'),
('é•ªžc–Bòw!÷ÄW', 'wp-content/themes/twentyfifteen/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'újuŽó¦¦g6È6Ÿ'),
('÷1hî²”KƒjS)J¡£', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-action.php', 0, 'Ý·(Ørèº£ê˜½Ø Ÿ¯', 'Ý·(Ørèº£ê˜½Ø Ÿ¯'),
('€)uGzâ(Â%dÖ¤œ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/change-avatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦H°“µw\nÁÕ•Xp6'),
('€RÄ*³¸ª£õ÷ˆ¤ÝÌÂ', '.htaccess', 0, '\\C»\Z¨©{&ˆPÇ#	nq', '\\C»\Z¨©{&ˆPÇ#	nq'),
('€X×vRØ2º´<¦?Fàï', 'wp-content/plugins/buddypress/bp-forums/bbpress/register.php', 0, 'GÇÜùIØ-†Á¯‚™	 û', 'GÇÜùIØ-†Á¯‚™	 û'),
('€aaßˆÛ¬J}Ï\rP³Z', 'wp-content/plugins/woocommerce/assets/js/jquery-cookie/jquery.cookie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡ãNïÛ$Þÿ²WØ$k|'),
('€zK¬.g€—v›À%e2­Ö', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëÐbê>­|''}:øÎ\\'),
('€‹69Hÿ_A*‘@''A8', 'wp-content/plugins/woocommerce/assets/js/admin/quick-edit.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ãPõEZuÔTú‘[=Ÿ!'),
('€©òSPÓ;^Æ­zßI', 'wp-content/plugins/wordfence/lib/conntest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûüi?jw×zº¸BšãVñ'),
('€«wƒƒ¤›¤uyD„)rd', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/AglInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íàCcŒ=W*Îò±‹Dg'),
('€ÆÕ ˜àd›ˆ7·ƒvv', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/loader.wp-object-cache.php', 0, '3éŠV”€MµX5X6\no', '3éŠV”€MµX5X6\no'),
('€Ï‹ÒˆãS¢G@Ò¼euÄ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TuskInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R\\ûLëºµ''ð÷ãQ'),
('€Ïä»éSH­‹l\rÛs', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Concrete5Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yÑbˆ–‘§¨™\\Ge7aö'),
('€ÓÚºèu¶¿M—É÷[\r', 'wp-admin/images/wpspin_light-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}ï3ªÙYÍ(IÝò¤m'),
('€æñ+Âã¨0¦±ÇØÆ1', 'wp-content/plugins/wordfence/lib/menu_blockedIPs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÔD\n®6y!XöT	®Ú&P'),
('€÷êÿeØæ97ãaJS', 'wp-includes/images/smilies/icon_smile.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²˜G)Ã¶ÍÀu¸‹\\\nM'),
('@hÕ¦¢°ã}ü‚µ9°\r', 'wp-content/themes/twentythirteen/images/search-icon-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uQ+—Ù00àž\\Ÿ5(Ûý'),
('O”»Rðÿ?¿”~ŒYª', 'wp-content/plugins/woocommerce/includes/api/interface-wc-api-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘‚­nH™¼RÕì„§§œÅà'),
('el÷5s˜˜EïÃºQâ', 'wp-admin/js/media-upload.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aêpš3º \nˆ^$e&z¢'),
('vZò„ëÛ5¾³9F»G', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°^,\Zu6Ìæ+S<l«s'),
('…,CUUîèœú9i-', 'wp-includes/css/wp-auth-check.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þÐœ›kâ7ÀûK¥ÀF‹·î'),
('“¨¼kSd\n¬â¤‘áâA=', 'wp-content/plugins/woocommerce/assets/js/frontend/jquery-ui-touch-punch.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#uŽwÈ<NóšIÕ§'),
('Ä~µ‹vÒN2G®Í¬Ñ', 'wp-content/plugins/buddypress/bp-core/bp-core-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù¤;EŸºAœ§€bõ.q…'),
('È‰V?	ÝÞ]Æ)A', 'wp-includes/js/media-views.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œ”Û2F÷çÞ+t_Úç“ƒ'),
('ÕXùâÏà-Ÿ4¤Jü_ƒ3', 'wp-content/plugins/wordfence/lib/wordfenceHash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ýij[­üZƒ<ŒRÏ6"¹'),
('Öð„Ë''>á[½žÎ‡÷', 'wp-admin/js/user-profile.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Â¼Ã>¥9{7üwÞ1IaŸ'),
('ða‰\r²&ˆ''6nmóäÁD', 'wp-content/plugins/theme-check/lang/theme-check-nl_NL.po', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸	¥ªJ)cÒˆß¾ó¸Ô'),
('‚\n3#¤ÆÂ•ôJ™¹ÔNµ', 'wp-content/plugins/siteorigin-panels/video/poster.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ\nSý9BnŽˆ·F\nÈÔ'),
('‚3¤–Æ‡eÇ(Ãº9ù', 'wp-includes/js/jquery/suggest.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!§žÞú^é~kÛÛ¥¿é'),
('‚ý\\Ï(åÙwBêÄIã', 'wp-admin/network/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºE ^Ì!Œ«u´Õ)ÿu÷'),
('‚(tTlDÎ¬7&‡³MP.À', 'wp-includes/js/tinymce/tiny_mce_popup.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i/Ž†¯£¿8´°×Ó'),
('‚BÒóÙ‡Èv<Svç¨³', 'wp-includes/SimplePie/Parse/Date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š\n2m0ŒH ø›ÓÎn''`'),
('‚F‰ åGJÎÖBìˆs7µ', 'wp-includes/js/media-models.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&¨Pýé	wyë''3oŒ '),
('‚W*Aµ`U®âLÇhã¬Œ', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úf÷¦lõÏÃÌG{'),
('‚]Q%úLd§€Ä‹', 'wp-content/plugins/woocommerce/includes/class-wc-product-simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŸaDø·Êúb><Ð5s-ÏL'),
('‚]ô*¨å@4%XC:wÄ«', 'wp-content/plugins/siteorigin-panels/inc/live-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=_I§,×Ÿ–òaÈ‡°º'),
('‚Ž\0¸ó¼²+OW+', 'index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶%0;àõs¦¹Dm\\¾:['),
('‚™™Ü¸{:·K™v²=}', 'wp-content/plugins/woocommerce/assets/js/admin/order-backbone-modal.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘Œ3aHj×áM%yR?Hí'),
('‚£€Ö.M2ÆÑŸ\\¦', 'wp-content/plugins/wordpress-seo/admin/class-plugin-conflict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤#ŒúxY[Gës¨Û'),
('‚§¬ãíA¼ÎòŒ1\Z…;¤', 'wp-includes/rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VYhÆ¤±3úä¸ÓÌu	”'),
('‚´¡_ÿ8yEXÆtÕ1•F', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-live-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä±!9ÍlžŒ''ËÂb–ó'),
('‚Ç«+¿1ŒÍõT;ÌNž¬', 'wp-content/plugins/google-analytics-for-wordpress/admin/views/content-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5æ¤Æì#¶šdÎ^±3I');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('‚É½é\Z7‹ånâ1ÿ', 'wp-content/plugins/woocommerce/includes/wc-product-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}#\Z+´×lÂX¾Ph'),
('‚Ê¥E&U.qñg$æµ', 'wp-content/plugins/theme-check/checks/artisteer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8<Uÿ\0Ò_9«¹fÒÃÀ¤'),
('‚àd/&yõ¨«ÿÇ´S', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/js/simplify-commerce.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûÒÛSGì©(e”É]¨ '),
('ƒ\\<Jpþ#ÐÞØ"÷ŽÚ', 'wp-content/plugins/buddypress/bp-core/bp-core-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡ !é\Z¢*g€w€¾U+Öü'),
('ƒf¥½bÂY×ÀMaôå', 'wp-content/plugins/siteorigin-panels/video/jplayer/Jplayer.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~ƒ‹´Çˆž´å§ñ.Í±'),
('ƒ1Nºh·­b×Qµú,6', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.bp-log.php', 0, '1î‚ÿ]¬«“”¬z', '1î‚ÿ]¬«“”¬z'),
('ƒwy/Y}£TnO‘%o', 'wp-content/plugins/siteorigin-panels/css/images/cell-width.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"gÅw,ÃÚ‹-ó`1^Ž'),
('ƒ‚õ~ˆ˜‰=Jß{”‘»k', 'wp-content/plugins/buddypress/bp-messages/bp-messages-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•Z=ùñ²÷pRàmœÆÑBS'),
('ƒ¨?ç¬Úz6¤—ÛaDz', 'wp-content/plugins/wordfence/images/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K:û„²·õmð™—£P½'),
('ƒÃ\raûÖõf%dD\0d¨', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ZendInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•<T‚•ñŒW<l0Óµ'),
('ƒËv¯JJE;°Ü|\nm', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/OctoberInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æßÖiÎŒ!‘]oµ_·'),
('ƒÐÏ	‘õ9åœïÈÊ©‰˜¸', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{•ƒP›®GT‚èàRFz‡'),
('ƒâèÊ†×én¥Dã®–Ë(', 'wp-admin/css/install.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ§ÜõE†ÁÖ€Î¦{DŸýˆ'),
('ƒìá#ÜÉ,,0Û–h&', 'wp-content/plugins/buddypress/bp-themes/bp-default/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷ÏòuÄ¾t@˜m4rsá•'),
('ƒ÷f NÊdš©´Lúþ', 'wp-content/plugins/wordfence/lib/cronview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á¼|¦c{U„‹>(v'),
('„-6e£„ÝúmŠ&\Zô\ræ', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-order-reviews.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°øó	1\rªg—Ê´Ä'),
('„:+[õ¹g¾¦CZÝØó’', 'wp-includes/template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's‚~Ç¹à‹Q9ÁZl¢=ô'),
('„SdPkê××™)Ø‡²Ñ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_WPCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç‰:9+x†ùqoÈfÏ'),
('„W6!àð:·Žë0ÚAó', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«Pµ î´ºÆò:Àn}±'),
('„bÖ—Úÿyq‚PÎKê»', 'wp-content/plugins/buddypress/bp-themes/bp-default/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æs€ÙÅàíe½°q©'),
('„cÕïÊð«¯ªˆw‡ÛÜ', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/closed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’¸i×6ÞÝÚœŠ¬4cÕ'),
('„p4È¶÷DU;Ñ<Z/ÕN', 'wp-content/plugins/siteorigin-panels/inc/styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã”PKPÃvwfœ·ÜVýa'),
('„~w™''†ú	¶ ªgU”', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Signer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'íxvmZõ›jîïM«1l'),
('„ÄYE	È†Î$ŠÓ', 'wp-content/themes/twentyfourteen/taxonomy-post_format.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v(Š­×x0Ò¦Ò%\\vôB>'),
('„É€ö™´”"ˆiµ$lÀ', 'wp-content/plugins/woocommerce/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎŸš}Œ|¯jâ^*“8˜ž'),
('„ÏÇ ¾Ín5u›ÚËú²', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/utils.js', 0, 'c>%…añ‹óÛ¸¹ WU4ô', 'c>%…añ‹óÛ¸¹ WU4ô'),
('„Ý7áÑ•h§q!sç%l', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o æQ¶bö~FÃbñ<22'),
('„èAÂj–ÒVÜ-¢ß“®', 'wp-content/plugins/siteorigin-panels/widgets/lib/lessc.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^ëàFrùÿ¼L¹žè­¹n'),
('„ó•‚†@þô¹Ù\\ãüƒJ', 'wp-content/plugins/buddypress/bp-core/admin/bp-core-slugs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’WãRè»öW¶ƒ‰:w'),
('…B%v6ÍI"Jb½Ç4Ó¡T', 'wp-admin/link-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÞÿKeô¸Ú,â‡'),
('…I¾A¨§”sªøhb(Ó•', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dãÆô¦;\\"2\ZÅ’9%d'),
('…lÉ°p ž_ý8ƒ«Y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-taxonomy.php', 0, ':~Ç‰×uŒ‘v˜ø™Ô»ƒñ', ':~Ç‰×uŒ‘v˜ø™Ô»ƒñ'),
('…lÐèI‡§ù†©{DÕF¥', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-zh_CN.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B1³s5dñ½ÙúöïªÍO'),
('…¹>ÁAäBÇ7åSz!ˆe', 'wp-admin/includes/export.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ•–ïBÕìr¾m³á'),
('…¼sdgåœ[ã+', 'wp-content/plugins/woocommerce/templates/single-product/up-sells.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ_Ü<6nþYl''¯\r’q'),
('†1äˆeUüMVý¸^š™', 'wp-admin/includes/misc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„ÑVªœpÖªZ›‡b'),
('†8¯Šl\0tÀ…Åð±ÿc\rõ', 'wp-content/plugins/buddypress/bp-forums/bbpress/readme.txt', 0, '›ñå£XvÎ/Qåõ/', '›ñå£XvÎ/Qåõ/'),
('†X`®ÛS“mÃ‚è=IË§!', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹bÿ9÷9åCWÀ'),
('†røÈ¬QnÂùÌ;ê³', 'wp-content/plugins/siteorigin-panels/readme.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷šÓ´Ô¿È‰‰>õQ¡f'),
('†‹"›¥ŠÑØ¿\Zle''jŒy', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æ&9·\0ÈwŒR•g“ü'),
('†ŽûÊœ¦K;C9ö4ø)', 'wp-content/plugins/wordpress-seo/css/metabox-tabs.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R}ûÜÏô°÷ç3uRô‹P'),
('†¯üùø±Àò£h@Ü', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-history.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i iJ~®×h\n\0E>Œz"û'),
('†œëše®	5¤4|`dã¥­', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-invoice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T	Mh†_<¢Î¯W¶@'),
('†Ÿ\0¦>#ŠÑ›á­z(', 'wp-includes/bookmark.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àéIÍí®åI.eø#æ'),
('†ªQÜÐø¸iÅ\nÆö', 'wp-content/themes/twentythirteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸+õ½>>Á•ŠÝªbàºÞ<'),
('†³¬ºÃê‚âë}•Í', 'wp-admin/media-upload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pË‹†YââBñZ!\rÑ\\Ò4'),
('†·"^ŠÀˆ¨ñ–æ?š+', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/users.php', 0, 'ÜrÝp]^,ò²/öÐ', 'ÜrÝp]^,ò²/öÐ'),
('‡òP“wª©0âhÿ9', 'wp-includes/js/tinymce/plugins/fullscreen/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_"+)^0Ýbßá`˜[•ô•'),
('‡J¼&_#¹ñ3SÔq ­', 'wp-admin/images/spinner-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\q¼´9)hdxR©Éß]l'),
('‡…F\nGÊÙ6 NÍ', 'wp-content/plugins/wordpress-seo/images/waiting.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NL2îÒ<ø·Ü²'),
('‡Ž\\:âÃÚˆÕê)g,\\', 'wp-includes/images/smilies/icon_twisted.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b«Õ©.²8\Z|`ãQöLF'),
('‡’ê„¦e\Zj~Syrju', 'wp-content/plugins/woocommerce/includes/gateways/cheque/class-wc-gateway-cheque.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't˜s€4Ð§¢çx‹j\0ú'),
('‡ 6mU¬Û)árIŠ¯', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.gitignore', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•ÁâTÆi`‡‰¡'),
('‡¢¨3v´U€\Z3˜PÅ^O ', 'wp-admin/css/widgets-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ItEý¬í:?t­š%.+•¶'),
('‡«L UÿÕÀ¹f¯àuâ<', 'wp-admin/images/icons32-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',ÖP*çÓñ{>v¥±Uf'),
('‡´a¶BÒ\0‹Þ\\HÒ`ÍJ@', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/KirbyInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0¿57Üš\\Ò¢Ê®«DðÿM'),
('‡µ`š¤kYL_¯¼h%''', 'wp-includes/theme-compat/comments-popup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X…U/‰´Á€aÚŒ.u<.'),
('‡»YzŠ*Õ\nÊ«Ä“ ', 'wp-content/plugins/papercite/papercite.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³Ûqmàb±»Â\rT"ù÷'),
('‡Ô8>û“``5µåƒÔ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/autoload_classmap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jÉFÁ6~Q½B×‹ñXI”'),
('‡Úy’ø/ëödzƒQg”µ', 'wp-content/plugins/wordfence/js/tourTip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z/Þ×³}ôdü´Ã1FÙ'),
('‡ÝH	—Ó_»–’E’°”Â', 'wp-content/plugins/papercite/documentation/index.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@(IÈ¿rM\Z´õA@¶'),
('ˆ¡0û¢{fæHf(ìV<', 'wp-content/plugins/woocommerce/templates/emails/plain/admin-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Pš¥56ïâ‰†¯»BÛÀJÿ'),
('ˆ$:SZÜ½©r2^ˆ', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-session.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëŠ–Á6À×ãý{¡æøÆ'),
('ˆ,ûÜ·O°¿”|üë¨Hù', 'wp-content/plugins/woocommerce/templates/single-product/product-thumbnails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?_,RŽá¨Y½m§Öw±'),
('ˆ:=%ÆÌâ¾ù MÔÛµ', 'wp-includes/template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷¸º`˜\rü€ÆÃmv¾'),
('ˆ:Þòy©†3èS¯x”C', 'wp-content/plugins/woocommerce/includes/class-wc-session-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’Dû%óõ)bØW©9“ìêD'),
('ˆIÝ{‹?»†rô]¯ 7', 'wp-admin/images/resize-rtl.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Û’cÉZYÔ6ÚÅ'),
('ˆa‰kó-öªŽŠhŒ8 a', 'wp-content/plugins/woocommerce/includes/admin/wc-admin-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FO¾(²Â)§·oö$oY'),
('ˆ´Ôª¥;×ç¾Ò¶Ê&¾&', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-product-variation-download.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3ŸQ]ÊXs_¦NÏÇ)'),
('ˆðw”Ái.¹w¾(M;0D', 'wp-content/plugins/akismet/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õà,"ËÚ¨wGçi¼Ùõ'),
('‰7*ûø"{ìóƒ\nK<', 'wp-admin/includes/ms-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê‹Q4»ab=@–ù©’aS'),
('‰? 8”÷˜ÑÉZÏÐNÁ', 'wp-includes/ID3/module.tag.lyrics3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó¡K½×¬ã‘Ž–Ú0ë'),
('‰f…£þåiÒm‹_‘¦€¨', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/functions.php', 0, '.È“†QõîÛdTÖDùrJ(', '.È“†QõîÛdTÖDùrJ('),
('‰j®ÃIîÔÓ<êŸŸ³†iU', 'wp-includes/category-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬!ÿÒ§Z¹O\0ÝU€K©'),
('‰|ËË˜FœF[šU¶Ã', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/notifications-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',½ç‘$r˜½3M2âdŠî'),
('‰…—í¦«kC7bþ‡¹Ð)', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/tirquoise.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	+Âh‘ÚòÁèxN“ÿ'),
('‰©úV"$6rÌ`Ë''i/', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's,ýS4ãtißÂÅ7ñ'),
('‰¬íÝ¨1qg@ÿÿ-ª5', 'wp-content/plugins/woocommerce/templates/emails/customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á-)¹í!Ho¡Ó ù,eq'),
('‰´¼ýb\0«‚ïˆuOL<Ç', 'wp-content/plugins/papercite/bib2tpl/lang/en.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹ÁšLWÝŒ›î¶\r}'),
('‰¹W—R\ršsbÂÖ', 'wp-content/plugins/woocommerce/templates/checkout/form-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ/9Á‡{±ñ‡¸q¤„»'),
('‰¼B]nÈ„¨8Ú7g˜ó', 'wp-includes/images/smilies/icon_rolleyes.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯È»Æ_ËÒ¸*>,\Z´\Z!j'),
('‰È\rh©8çù¬×…@XAÔ', 'wp-content/plugins/woocommerce/includes/class-wc-payment-gateways.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡ýþëêa£Ü~·0Ö3Nf'),
('Š\0˜O)@Œ­Ofúl½', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/feedback-no-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`üÊG«Fn—Ð(e:'),
('Š¬·,zŠÏ]–ÕÆŽó', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']ÜÍÝ»\ZÏ2ð*{Ñú×'),
('Š4Bi\01´šËÙøÄ>/Á', 'wp-content/themes/twentyfourteen/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«‘ª‡ªyÇ*sÓ$œuR'),
('ŠMj÷AÕM™ñOÞ"If', 'wp-includes/SimplePie/Net/IPv6.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥Fy!j½Ù€•”Ÿ¶´'),
('ŠksÔ+0ª7a7ä„ p', 'wp-content/plugins/woocommerce/i18n/states/IN.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H›²¨¦¸O`µ„×þŽ'),
('Š™ÏÛa•Aè-OàÒ8„', 'wp-content/themes/hexa/inc/style-wpcom.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä—Ì\0Ý¥Ðœ‡®²''a'),
('Š£q„7¶L¬Q>q\rg!', 'wp-content/plugins/woocommerce/includes/class-wc-form-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	¾¹Ž["7èèjmôrho'),
('Š· ¿D{§“Ó<WÐ)', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/global.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á\r[áÕ;Lµ—‡’k¨«'),
('Š¹¾ª2‚êÅ@¡ÂmyÑ4', 'wp-content/plugins/buddypress/bp-themes/bp-default/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O<”ÛoX‰þÇ#hÕ='),
('ŠÁ$¡ÖxM1>è²_8P\0', 'wp-includes/js/swfupload/swfupload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ï:éE%Ïzú¦Ês~'),
('Šî×ºÅªãxQÁ˜Å', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/responsive-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–®n_’ÂÏ‡!gÒ2¬.'),
('Šñì6’dõ¢xÇDÉÑ', 'wp-includes/js/mediaelement/background.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p<ežKõc \\c8¡r~\0l'),
('Šó-ÞÝ±$éj‡um÷Š', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';•øyðWv.\0ŽÅßÞ'),
('Š÷™Á<D+q	Í;ð{§ø', 'wp-content/languages/plugins/woocommerce-es_CL.mo', 0, 'I€ØÝÉvG)$¬2ÿìüì', 'I€ØÝÉvG)$¬2ÿìüì'),
('‹Cf0yýv1/~h¿', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-styles.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[k²¯¿/‹ê"È•Á:{gÔ'),
('‹*0T?¤¿"1i-¦:2', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/LaravelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®„£§=`ˆ‡wÕ2‰6îd'),
('‹1f*¸lw™üÀÈI', 'wp-content/plugins/wordpress-seo/images/banner-local-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}sŽ€/Z‚.]e•°(°'),
('‹73ÁÕ~ë¤;…ËyZ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©‘kTõá!ëÆ…½'),
('‹Bf	×pG\n¡#ÉæþUI', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile-base.php', 0, 'ñîuj’oßˆò•hP®#\Zœ', 'ñîuj’oßˆò•hP®#\Zœ'),
('‹`H…Ó4¹Áp;ÌM8', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/friends.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm¹ ”U³vþI‚>~Ï'),
('‹n97I.OúÒÞ¿ð°', 'wp-includes/js/heartbeat.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÓÇí†™·@ëôCm'),
('‹Æãqð·žŠøDùª`', 'wp-content/themes/twentyfifteen/js/skip-link-focus-fix.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×t¿ââ>:{»šú’ôð¶'),
('‹œ_?;gäýÂš\\‰Õ,ôG', 'wp-content/plugins/wordpress-seo/admin/class-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’é «Mdøõ‚²Jòã\nœ'),
('‹¦óŠ\rúÙjš\ZÕŠÊR5¶', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/buddypress.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'êí‹yÑ–uóM‘0'),
('‹±Èòÿ…îclpë,jÐ', 'wp-content/plugins/wordpress-seo/images/Woo_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3JUC4¨“ÈtÚPû¢§G'),
('‹º°Åh+¹«BÌÆòÐ', 'wp-includes/js/tw-sack.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡Á‚''æé7˜Ä“®ÙnæÌ„'),
('‹ºFè"÷èvhâ¡$LbŽ', 'wp-includes/js/imgareaselect/border-anim-v.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' Éz!™<ñ7êÙý¾ËÄ*¨'),
('‹óycâ0O°g)Ï­Mf¸', 'wp-admin/network/site-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†®ÜEw\Zo-yijÒ'),
('Œ?š\n5ü´Hã?âàÁÀàè', 'wp-admin/css/customize-controls.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MÌÉÄc?Û®p"D+ˆ'),
('Œ½´†juGCtOÆþØâ', 'wp-admin/css/colors/coffee/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F`a|úæ±ìhè\0ê#ŒÕ'),
('Œ­l«.H|S„³Ö{°†', 'wp-includes/js/jquery/ui/effect-transfer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p×ÿ+hª6•k¦À´A‘'),
('Œ¼u“‘d*øoZ>âé', 'wp-content/themes/twentyfourteen/inc/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lÓ	W”0Ðûîb£6Ø'),
('ŒëÊ²£{$¼ýKZÐ™"C', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/ResourceList.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T"ã#À"5rÁ±Œ©¥'),
('•ÒanµöV=Ty Xä', 'wp-includes/SimplePie/Copyright.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½¿h¹T©Õ	UÌ€·Ëj'),
('^‰ºÂ]Ø_|ä¾]ž“]', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.pie.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„žµè†z;5¹FdMßÉ¬¬'),
('qÙºóWôÞûÎoû®\0²×', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-query.php', 0, '''­¤2µT_·Ï½6Ô°^Þ', '''­¤2µT_·Ï½6Ô°^Þ'),
('} yTŽìZÝH„cDJ', 'wp-admin/js/custom-background.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚Ð#Y>Wˆ ±ŸÉú­e '),
('ƒ£<E‚Oÿ¹)º§\0¿{', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä·J°ßúaØ_Sñ¬#Þ'),
('„xÑqÁ3À±öú~bVÌ·', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/class.bb-install.php', 0, '''º\rýƒ5R£2žjÉMãÜ', '''º\rýƒ5R£2žjÉMãÜ'),
('‰Äm?Tíƒà×Ÿ4ôs#', 'wp-content/plugins/woocommerce/templates/single-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Mx1€ šîÄ)Ã6'),
('™kR:“ŸlhÓêÔ¶jq', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.stack.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9}j/L\n ''\r_E²ö©'),
('¬{ß0l(Æ²u9,wSØu', 'wp-includes/js/media-audiovideo.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zÛð?¢î–ì":tpËð'),
('¶ÿÝÆxvº€”PºázC', 'wp-content/plugins/woocommerce/templates/global/wrapper-end.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nšÙa#ôÏ«¦«¶2Pá'),
('¹8µÓ…ýEù¼2ï', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯®ýFA_§Më¡aÒÐË'),
('Ú;\0½èðŠã]ÕoKÕS', 'wp-content/plugins/woocommerce/templates/emails/email-styles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':ë¶xàþJfÓŒ®hèÖñ'),
('ñe4Þ YëÃ7ÄÛ.Y-', 'wp-content/themes/hexa/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O<ußÊ[½Lêx½Ó˜©¨N'),
('Ž éA$Û¤fCNö™37', 'wp-includes/query.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´Ä~¼†{	¢‰>¬Ï¸Ê'),
('Ž(¢û×”ïWåh@=a', 'wp-includes/images/smilies/icon_mad.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×¾¶ie\Zcþ{Ó0'),
('Ž9 •Š¬>Ý´oÔ e8xy', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-emails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zcìºd³Ç«wc|Ð0©'),
('ŽRLS’f,ý@•ˆL=ì.', 'wp-content/plugins/wordfence/lib/menu_activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'JˆÕ@kÑ‚&`Å¤«Ört'),
('Ž„ƒùvü´ŠÏŒéŒY9Ó', 'wp-includes/ID3/getid3.lib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û¼ÎôpªsQ FÝãæÈ0'),
('Ž°Ö—]NR¼ïS{qv?…', 'wp-admin/css/wp-admin-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£{}Úû-­G«hÕ–Øa}'),
('Žä*Ï f…¦Juí^„è', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-object-cache.php', 0, 'ù\0k¶<º=o^þH.', 'ù\0k¶<º=o^þH.'),
('Žå¡çÄ¬+¹¹¬Ù0', 'wp-content/themes/twentyfifteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Ö:OTPúý¬ œ0[Inú'),
('Žóø‹#©¨ú/ZÄ†¨', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*ŽÿÖ9½r<þKe¿qx—'),
('Ž÷%:IÅ*äù…ÛiÈ‡X', 'wp-content/plugins/theme-check/checks/directories.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­¥ktAÃ›V‰VkØBN'),
('$»Àªj¶Xž])D:', 'wp-load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë:j²Ô™\n[.â|p5á'),
('*z3x<Z*‚\rÊD', 'wp-content/plugins/wordpress-seo/js/wp-seo-admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£”«©×Ç†‡çºó´'),
('6”YÌÇ$f\nÔ3ä)z†', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V˜ð£‹±27òNB‰'),
('d©%ÃƒÿãyDàR>nuk', 'wp-content/plugins/woocommerce/includes/admin/wc-meta-box-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹¦G[\Zß—f±Ï®yã¿'),
('j%M»ÉòÑp)Z‰Ä', 'wp-admin/images/generic.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øŽ•ÿ''Š[#98!Ð'),
('½Á¥îü‘÷Î&)ï ', 'wp-content/plugins/buddypress/bp-themes/bp-default/links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©2¡†ÇÙ×_$ý©9.£'),
('Ì¶³üH!N)&:ßfÙÜ', 'wp-content/plugins/papercite/papercite_options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üãÒ!íîxyaÇ»Æ=ÿÔÖ'),
('Ü;(Xp`Ò™Öì‘pÝ·', 'wp-includes/js/plupload/handlers.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'áÔo«œ&˜å’0Žñ¼t'),
('ût÷0Ãgñ»a†/Åýž', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce-small.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëÏ7Åÿ ˆ¤þAèhf'),
('\n™qoãqZVyXœ¿9', 'wp-admin/includes/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FIÝÒ–T¸óÙð™÷´F'),
('Z¸{gÊ}öfÈ-•Ñ0\n', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_classmap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'wË\núþ´M¶döP.Ñ"'),
('?M>Û>Û;À”v‰>''', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_styles.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´s{;Îe~~†3Tóê'),
('@–«’›ü8OÑ+’M?ž', 'wp-content/plugins/theme-check/checks/more_deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ýö¢‡|9Æúœ}Hm'),
('[\Z’ ožo‚@ ¥ï)', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ–Û’»HÆ¹íúFZó'),
('„¯mZN^Õ¯È\nÏ´÷', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_MediaFileUpload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AÎ±è	ê¥º;”Aj|ÁW'),
('X,ô,þ‚IŠ7Š', 'wp-content/plugins/woocommerce/templates/emails/admin-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0üR€GŸRqÈä&°+,g'),
('§UÌ›	''CÔ»ñºÏÚ«\Z', 'wp-includes/images/admin-bar-sprite.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SÏ¤—:€WÊÅÓþ^'),
('Á"êZ0\0Ø¿e…Ô¦pß', 'wp-admin/css/admin-menu.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']B·7Œ''x(¯Úˆs'),
('Ýò®–x8[!>ñX', 'wp-admin/includes/class-wp-users-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?¥ŒÃË\0''1áÆdNX'),
('ô¦AÌ·§Ì©X™g‹T', 'wp-content/plugins/siteorigin-panels/tpl/admin-home-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')§\r&¸ÍðÿO‹ûÚø*6'),
('ø#íNƒóQ¬M9_ÝŸ', 'wp-content/plugins/woocommerce/assets/images/chosen-sprite@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾>Ù!÷¤ÒTlêªÂV©'),
('ù?à6IL†"¤ƒ¸rã6', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/interface.js', 0, 'ËÛü‘„ÒŠÅ_ƒÀ°ß@ýC', 'ËÛü‘„ÒŠÅ_ƒÀ°ß@ýC'),
('‘)Æ¤íÖÞ`§•?F²á—Í', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_AssertionCredentials.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4u	¼­s‰æÅø˜2@¤'),
('‘7œ×È•tR-$T?i1\Z', 'wp-content/themes/hexa/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìXô” ­8.Y¬¿8ï§'),
('‘M4¾ŽŒË4¤Õu\ZÞ©ìÙ', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úõ‰Ñ‹/)ÊÞóëK’'),
('‘S–Æ÷ŠKK2iÉˆ', 'wp-includes/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZmBå…ƒñ#&çÜM²'),
('‘\\5ºÿe«%nR1•U‰Ña', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-product-tag-cloud.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û¬ÂwèŒÆDÔÐÚ(²ÃÚ'),
('‘]¾e¶HA¢bÖÚø–', 'wp-content/plugins/buddypress/bp-activity/bp-activity-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šVzL>ÂZ¯K#„¼‚A$'),
('‘yßg‹ízaU"ƒ	XKG', 'wp-includes/js/hoverIntent.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EBŠÙã€ytÜ6á'),
('’\r¼`Á‚ó³ é7Òøxõ', 'wp-content/plugins/akismet/views/strict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J¤sÈLU1YéßVœs«ûV'),
('’o«/Êdð4x`¤œ', 'wp-content/plugins/akismet/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o¸ïEÔfýÎ¹6p'),
('’ê/Â¢;Ì“„Ì—ýá', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/style-rtl.css', 0, '‘•mó	ˆŒó.VäQâÎŒ', '‘•mó	ˆŒó.VäQâÎŒ'),
('’e–ÏÓµ€×|ðâ}æó', 'wp-content/plugins/woocommerce/assets/css/prettyPhoto.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œ-Ê‚Wù˜†’‡ý“Ä]'),
('’v{LöJlÅ€YzÕ`°(', 'wp-includes/js/thickbox/thickbox.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡½Ýá‰³*šFråÒfa'),
('’{Ã;''5ˆ4ÃÍ''vüÃ“¼', 'wp-content/plugins/siteorigin-panels/video/jplayer/jquery.jplayer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼ÿOª÷T5é$îÅ''am'),
('’Í>¶õf\0>a¿mÃI', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÌèñÊñ±I´k³^®#'),
('’å‹#"	ŸO¾×0‚¥kú$', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/notifications-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ›‡ð½ßRJÑ¤¡³¹j'),
('’ïQ%*ÅPqþ’yC', 'wp-content/plugins/woocommerce/includes/class-wc-product-variation.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ì:û\r:Ñ§@µWÝ'),
('“-4’\0AA‚ßNÏ^–''', 'wp-content/plugins/woocommerce/i18n/states/CN.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûª\r[z„¦p¹¥+¿m©'),
('“XèV×˜O|8}š€‚', 'wp-includes/theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ†Eòèþ°;+…V³ke'),
('“U1Ô˜ž‘wg½OYpž«A', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-payment-gateway.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñ‰öEg†ë´éT5©¬\Zê'),
('“V}»P”œ±m•/¯|I*Ù', 'wp-includes/js/customize-loader.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\a®Æ„ñ—7Á`õð\ZH_'),
('“Wb	„£ª¶Ëö@%A„', 'wp-content/plugins/wordpress-seo/css/adminbar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 2iÊjçüÉ:·²=>òŒ'),
('“d½™jW[¦ÒyÛÏŠ', 'wp-content/themes/twentytwelve/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '•rÀ›Í2y„ùÄ_8‘\ZY'),
('“ˆ.™v8-rJÅ•íqQ', 'wp-includes/js/wp-auth-check.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñÓéâ²ÀþÏÑbƒc\Z+'),
('“Šnàªî4±Û†Äxò€Î', 'wp-content/plugins/wordfence/lib/menu_twoFactor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠµJ‹eSâh[\Z]ÔŠÔ€'),
('“G—ª×êy?µÎ''œM', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_BatchRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³„B\nöî…µMsng‹$®\Z'),
('““5¬xQ†ÙÑC•N\\r', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-ajax.php', 0, '^(*O·*Þ)?—šÁ¸Ï', '^(*O·*Þ)?—šÁ¸Ï'),
('“«7‹ÖE#¾wÅ§j¯²²', 'wp-admin/includes/image-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hŠ‡+\nûÈ+Otü '),
('“´õj¦UWO!íUlê', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/FuelphpInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@½KÌ¢½{~tbYb'),
('“µpK6b»Å1¡½¤', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-dark.gif', 0, '¥¯1{ý‡ÈìîÞøzàÂo', '¥¯1{ý‡ÈìîÞøzàÂo'),
('“µ±ÊÌ$g]˜–\Z€$8', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-config-sample.php', 0, '¶•.Ñ …DNóûÇÆ', '¶•.Ñ …DNóûÇÆ'),
('“×F„\nK})ué>§n', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocomplete.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶â¤(r«QóBš*RŸ˜'),
('“Ø!U@æäIõ‡ƒŽ2º', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-variation-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰¢}?5…\0{+Rê_ÁZ'),
('“â1/‰m#aâ]c8ÃÒ', 'wp-content/plugins/woocommerce/assets/js/admin/wc-enhanced-select.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó4¸c”ˆQ³-H©àû¶'),
('“ð«vî­ùÃ|ß-ðÉ', 'wp-includes/js/tinymce/plugins/tabfocus/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø°–6•³‹ö‚òt¯˜'),
('“ø„\Z3ù´+÷WïtNG', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg.mo', 0, 'Ø÷†ƒùy4DÂN”â', 'Ø÷†ƒùy4DÂN”â'),
('”F [xYYt†>x2', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/diners.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆšAó÷vÜ°T†„í¥S„'),
('”!HUN&ï"‹¨ÓŒz÷ô', 'wp-admin/css/widgets.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊM—æV¦ RB>S_ô$'),
('”+Œ¹\\<Q˜ê	Z”!+', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/app-side.pot', 0, '­¥Éªh«ãr´Šk', '­¥Éªh«ãr´Šk'),
('”a±tUÚq¶^!ä0Æ£l', 'wp-includes/post-formats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡É	ñüêŠ¿ð Ø¢;'),
('”k‹¥—zß£óÔì×boÓR', 'wp-admin/post-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä»€®Täù}cïë„²‡©'),
('”˜@†»{÷J¤á«5ä·´X', 'wp-includes/js/tinymce/skins/wordpress/images/playlist-audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U,û:)¬ Ø‹"ÅQqY'),
('”šõzAÇ<.û]¼$6', 'wp-content/plugins/papercite/bib2tpl/helper.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö¸¤wÊ¯\ZÞ¡×É=	'),
('”ÇòH‚Ä\\ž{ÛÇB', 'wp-content/plugins/papercite/phpunit.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œÙMöCX>;ÄéYHÑ'),
('” ú:k÷+8éÇáZ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%ÕÔy;šÍ®a©ÕºF§©'),
('”±¦®LØâ6	ØÀè×³', 'wp-includes/ID3/module.audio.ac3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»N–­Eìp:šAƒ•ZÖ'),
('”»– •¦Adý¡_5d', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/member-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7QúK2+ ™}c»''+^'),
('”Å	 ¤ íÉLõyïwÿ', 'wp-content/plugins/papercite/bib2tpl/bibtex_converter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>KùfL{&¢¯Â˜Ü~'),
('”ÉT²¢V¨íôª“\\˜—', 'wp-admin/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ºlþìí@UR`â1*Ÿ'),
('”ØB[Ëû®C¦ Å*mb', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/assets/images/cards.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ·JTÔÖÀ³É:—'),
('”ÛžäÉ3·™2÷Ž@-§þÙ', 'wp-content/plugins/woocommerce/templates/cart/cart-empty.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ÖÛËÜ\rÍšž¢âFY8'),
('”Üµ[Ò²m%‰6òS8:D', 'wp-includes/images/toggle-arrow.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÜßÎ‡—aýæ;ëdÎÏ*ò'),
('”ô¨–!Þ¬©Äß³ÂÁ«p', 'wp-includes/images/crystal/default.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Aò>)*/¾Ü!ì®-ò›º'),
('•åè0¦BòiRRÊqÁy', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/class-api-libs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!3Gu7êŸŽq''¤…R÷a'),
('•Tâ) à$ŸK8‘Ãš–[', 'wp-content/plugins/woocommerce/templates/single-product/tabs/additional-information.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»o+\0Ðå	Ý‰ë‚v[y'),
('•[‹gé€Ù{¾©i=c', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Þ¨™Æ\n%\0åï‘'),
('•^#2þ¤Ï\rñuŠAè', 'wp-content/plugins/woocommerce/includes/wc-term-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿK„”ã§OªH7æ«'),
('•aÞ<„dƒÝQÕ8õæ™Õ', 'wp-content/plugins/wordpress-seo/admin/class-bulk-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't%)(÷á[gÄXæú'),
('•h—‰§‘FuQeñª î', 'wp-includes/images/wlw/wp-comments.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÂ6]PÞÞÃì.s¨¡Ô'),
('•¯t¿§L#àÉ¿f ¸°2', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg.po', 0, 'ÕXØÑó’€	¶ÔzN13', 'ÕXØÑó’€	¶ÔzN13'),
('•Ìf0ÙËÍ­¡Ú~·)', 'wp-includes/fonts/dashicons.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xõâýäÚa¥\rI²~t~²'),
('•ãFV—<vHtaæS¹', 'wp-content/plugins/wordpress-seo/css/yst_plugin_tools.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ïú)ˆ\nŽ(ŸÝõF7É¥#'),
('•ç2þPòkìQùOzdWÚ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×-¼tjO‹Ñ1m}pÈ'),
('–x?Ø§*ZT~Þòh¯Ó', 'wp-content/plugins/woocommerce/includes/admin/views/html-bulk-edit-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*’Ø[¥©¤š8r?Ï{'),
('–6¶|;¾;8ÅQ¹4™k…ö', 'wp-admin/install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìšü-­ê™•.>F®VÍç'),
('–9µeÝEø€bÝ¾l´3¢', 'wp-includes/js/wp-lists.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜t|rœŽ5ÒÖxÅ‡ÙÒ‘'),
('–W›Þ  ŽÅíƒˆº|¾', 'wp-content/plugins/woocommerce/templates/myaccount/my-address.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.©ÛH¶*ÈªlÇ‘\n!íÆ'),
('–Ž\Z5oÖÝ#R''/¤¬l', 'wp-includes/fonts/dashicons.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Î¢6dËôöÉHDËÆQÙƒ'),
('–¡øk{{_F,ñ¹¿ »ÊÄ', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/send-invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v,fÙ§<˜çVÎ/'),
('–¬×©)òº×µçg8ËóÕÛ', 'wp-content/themes/twentythirteen/images/dotted-line-light-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<Î½q3xŽwxr\\ 2'),
('–Á¼™E˜?ÆŒÐ®á¾ ', 'wp-includes/js/media-views.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<mõP4²¬[æÝºƒb“'),
('–Ä¥·"8VÒ¹ÏûiÓ[õ2', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-http-ixr-client.php', 0, '…&9Jfpß»ÃµÎƒ', '…&9Jfpß»ÃµÎƒ'),
('–Ë¥`8ë‚ó—õ(Üõ	', 'wp-content/plugins/woocommerce/templates/checkout/form-checkout.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sk\r’>7<×†“¼2'),
('–Ì·iÁ¢ÖY	üØ8le‚', 'wp-content/themes/twentythirteen/languages/twentythirteen.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'MBì-gÁGGæ´ùà¢m'),
('–âCg¿¸ñ‹}|ÇE÷ý', 'wp-admin/js/word-count.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇÌ®¶E´ç^–:ìÿ/_Æ'),
('–ÿÌÊÑ …/È5ðqaJqè', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/loader.wp-object-cache-memcached.php', 0, '„K/_º ÚNHz¾ˆ°Ô', '„K/_º ÚNHz¾ˆ°Ô'),
('—	é2Í´$Çàú‹æ', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*ñÚ0áz»	EFŸk^\\R'),
('—	v¾O.„|ß¤Òµ‚', 'wp-includes/js/tinymce/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']át"Ùž3§[œt›|'),
('—×šÕGVŒËºIgÇHs', 'wp-content/plugins/woocommerce/includes/class-wc-post-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãO¤Dò‡¢Xå¨£.Ð«'),
('—ÖuRøä0>W¢sÙ1i', 'wp-content/plugins/papercite/papercite_db.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûÃeÐÜ­Á	žt¡u.ª'),
('—(®ÉwÖƒ¬ýÇÉ«', 'wp-content/themes/twentythirteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c¥Ámybå/"És×Ï'),
('—AªÄ™eÔ®[)^-Ýï', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-styles.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…tƒ5	erRá ®Öñy\r'),
('—J\r,5¼å"£˜:ÛkÎô', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/groups.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=‚t¥¥É«[˜«²‰ÕîˆÕ'),
('—t½°û¾Y‚£¿äÒ?ã¦', 'wp-content/plugins/siteorigin-panels/widgets/img/textures/dark-dashed.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Åš¢ªàöw\rÌu$‘ð‡'),
('—Ž­þMâLè^¹òW', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.0.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l™.pSið=ù¯ŽP<Ó§'),
('—wÞô¦-àÊÙSÿ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum/topic.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œò¹\ZJèÙNq©<%L'),
('—¦„¡»Òõ´™½òŽµm', 'wp-content/plugins/woocommerce/templates/notices/notice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 't:MÿÿÈº¦’II†öäÄ'),
('—Ä£ªeÉOÕ¯¼t9¹x', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/FuelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß^ûq÷{û3\\Ýg€'),
('—ñb¦ü’Áÿ£º|e~ë', 'wp-admin/css/customize-widgets.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊNõ‚)·Ñ*w»`Ìn¢1Ò'),
('˜\0hî”Kf•\0ðø', 'wp-content/plugins/wordfence/images/forward_enabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U\0/3e4e™Ï×ƒÞö'),
('˜ ãŠdlÄ·ÞâÞ¾4¡', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ro_RO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g>Æýö_ã\rZž§Cå'),
('˜‹µï†8(\Z¹jèZ]}', 'wp-includes/js/jquery/ui/effect-pulsate.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r(ç;µ:°-IQF˜È­Œ'),
('˜K‡t!”  •Z¼n', 'wp-content/plugins/buddypress/bp-themes/bp-default/search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9²™%‘Î(vGJîám'),
('˜X¸ÔÍìg5ûôŸ¼(=c', 'wp-includes/js/tinymce/skins/lightgray/img/trans.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿ž7I Þ1F¦Guôj^'),
('˜në(þ}b“Ë T‚_‘', 'wp-content/plugins/buddypress/bp-groups/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oEz§œ²*È\0ñ äzËw6'),
('˜pt_ Y‡ÁŒÊ7LãKt', 'wp-admin/css/deprecated-media-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tA:$ªÝcOué=NTÃ'),
('˜£ýT¹D‰ÀFÒK1Ç', 'wp-admin/css/media.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q8jâ.’×DÍüþò'),
('˜¥Fñ%l''iÓ½8mAû', 'wp-content/themes/hexa/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÂÊ4b‰Ø-¯+l‘ö'),
('˜Ä/GÎžÓ¶[­ÇœîÙC', 'wp-admin/js/gallery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éK~´lÜä\Zèž'),
('˜ÍÉ[²/9} `:wÙP', 'license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '98üÕvˆ´×h\ZPÖ¡õ>q'),
('˜Ø+P™lÔÍÜP$TG', 'wp-content/plugins/theme-check/checks/iframes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z¸^¦\Z\n\\]ëJ^SŸ'),
('˜áYM‚Ë~ãBÿ''', 'wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›Ò(Ä¢Âù¾&Î»Iûf'),
('™\0£ùµè Ò.}¥fwA', 'wp-includes/date.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïEdáWMXÔ1ãì'),
('™È†EñzÐY©â:„ø/', 'wp-content/plugins/buddypress/bp-themes/bp-default/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!ý¯uÞ>#¯â9íç*ö'),
('™"àkÀ³IQ¬K–=', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/SilverStripeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—É(„Á*Aë„åVMH=I'),
('™3¼8…KÒÐçû‚.CÀ', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-ipn-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É¯­ŸÙÂ.:(ª|2'''),
('™8èàïƒJl;ÝØ“s”ý\r', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/LaravelInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®„£§=`ˆ‡wÕ2‰6îd'),
('™Oý“:‡Ï¦¹×éu_Op', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-plugin-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's\ZÓy·çow£Ñ’¿Œ\r­'),
('™[‚Ÿ®QH"pS1Èªëc', 'wp-admin/images/arrows-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '— Qð†}Îñydb#6„'),
('™j¹Þ6žJ‘Â4œïÛâ', 'wp-content/plugins/woocommerce/includes/wc-cart-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ð	’UGil7¤žß%L'),
('™H@¿å…T&œIîÄ¤g', 'wp-content/plugins/woocommerce/templates/cart/cart-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l/i>ÝQÂmåÂúR‡6'),
('™’ÄÌýSbågëžzJ—þ', 'wp-content/plugins/woocommerce/includes/api/v1/interface-wc-api-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Í°‹/‹P‘‹±­•½'),
('™˜[ixTºqÔÃ~Wv¡e', 'wp-admin/network/plugin-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?µÍš¹GM„XZ\ri=Ì'),
('™±ÜB1\Z*Xsêr¸À', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/messages/messages-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢8Í¬·¶.¼íDèqÉ'),
('™±÷”Èº>ùí6kØç¬¤', 'wp-content/plugins/woocommerce/templates/single-product/short-description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm¼ØµB*\rþ$tB^lÐ\\E'),
('™Ä<`¶¡Íú÷3[^ó', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö]Í{…ð÷¼¼›0ŠlMD='),
('™Ù“Ñû3îI|qg¡À,Œ', 'wp-content/plugins/wordpress-seo/css/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('™áEN0Ï¡•Ü6', 'wp-content/plugins/wordfence/js/jquery.dataTables.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aGÌîzïÀÆëØ×³ù'),
('™æ™)U®tŠª>;>¸	', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-theme-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÿÎ¨Dxê¸ ØX¥÷'),
('™ìÁ‹Ä>8¹¡ÈÎÊ\\æ', 'wp-content/themes/twentythirteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'îN=2lXÊh¥…,\r&LÀ'),
('™ó(|.ãz»]Û€“Á½)', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ElggInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Ž“PÌ†©¿¨‘x¥Ç‹'),
('š\Z-®”x7Ãù(AÄ4ù»ç', 'wp-includes/js/swfupload/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ëà[°`È^ˆ-Ào÷QWz'),
('š1W;cŸ¶š¸°NñÀ"ïu', 'wp-includes/pomo/streams.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬º¢ÜA6;¢`Môþ'),
('š4=þcÿG¢HÍºwˆ‰Ë', 'wp-content/plugins/wordpress-seo/js/jquery.tablesorter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒ‰7jBÿ=¡†¿e€b'),
('šBÄ¶b’šºN›ý¡', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ãö†_¤\ZÍXŸž—'),
('šJž‹B¾GT²;,l£ÀT', 'wp-includes/images/smilies/icon_exclaim.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\ãqEŒ\Z!HY__=¯{_È'),
('š_j¶…,éTL{¾›', 'wp-content/plugins/wordpress-seo/CONTRIBUTING.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®zP ßÿaÕk8Š™¨=V'),
('šc\nƒTùñ>wÑ¨¸ž¥', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Hä›z)ˆèÆÊº¬E¯'),
('š‚%¹‚¼hË6+›>š3-', 'wp-content/plugins/woocommerce/includes/class-wc-api.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+­Œ—¾?Ÿ/NÛ\\4ØÂ'),
('š¥7¸M3Âšã$ËôŒ', 'wp-includes/images/smilies/icon_question.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ò''u²ã&EqA÷ˆÃmN'),
('šª™‘2@ïkä¬w>K”2', 'wp-includes/feed-atom.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãq5B‹˜ó4¬ÂêD\nW'),
('šªô¢ìH\0Û™À®h™CÁú', 'wp-admin/css/colors/ectoplasm/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÆË£Ì56ø¨þ`Š=\nŸ/w'),
('š°wtòH©ëá-s“\0Ân', 'wp-includes/js/wplink.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^m¡Ù;ÁïÛqÁø)<'),
('š»èLÇŠ›3ÂÔmKM h', 'wp-content/plugins/wordpress-seo/frontend/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('šÄþÚ=Ö¬H–@-i˜ï', 'wp-includes/css/admin-bar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"ò 3XhH…éÏ×\0ðt©'),
('šßK8d‰ä;<’§½ƒvá', 'wp-content/themes/hexa/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ1k¶\ZNØØ+ˆ>„'),
('šêŠh‹L¼²JHÿX#0', 'wp-content/plugins/wordfence/lib/wfUnlockMsg.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ï¥Aº´]Q´!y>É@Y'),
('šÿ™^''½qˆÂî0…ê', 'wp-links-opml.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÄcÉÇþvžIlÚmf—'),
('›	ª#J _4j£šUæ0ñ', 'wp-content/plugins/wordpress-seo/images/News_SEO.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã|ß£›H?=Š8„y$F'),
('›vn°\\ý’?<]häÿ', 'wp-content/themes/twentythirteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '† k gd9¸õ5Gp'),
('›dv1r¨c¢òýºIKr', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PhpBBInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}×ì,¼S=–ÐÍØT³8¨'),
('›%n©ÍTß’	^ÇgXÎ°', 'wp-admin/js/inline-edit-post.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'í8ÅuP|Œá\ZýŒP'),
('›,€Àoú¾s’uWáA”', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/ShopwareInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÝÞ¹M+Ä-¼°¢6æ\\f'),
('›;›¸Œõ·†ÔÏwîD', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/defaults.bb-filters.php', 0, 'Akª+çØ‡›jôX·¸„Ð', 'Akª+çØ‡›jôX·¸„Ð'),
('›u€aruc0¸ßLò–È', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.dimensions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÏbØàÀÀ*´(”	‡ª`;'),
('›ƒÁTˆIG\0=«uÀž\0©', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»*nÈYµoù¡Æ¢\\[]¸'),
('›…Þ9›È:S[Kå®JÚ', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J€žÜ]qC/Ù\ZXÚÅ'),
('›¯|ž''üR:XLøšÃ;Ú', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑÍ3½u]]ãš>~®²'),
('›±1I/¢P…ïò°ÃPX', 'wp-content/themes/hexa/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—Þ|lû|	 R†›\rØ¥{'),
('›Å,ÐqqMý¾cÄÿþß›Ö', 'wp-content/languages/themes/twentytwelve-es_CL.mo', 0, 'Ñ\Zdµ˜Î`Zœ+x:Ï', 'Ñ\Zdµ˜Î`Zœ+x:Ï'),
('›ÒŸÃ·ýµðòÕÝ', 'wp-content/plugins/woocommerce/includes/shipping/free-shipping/class-wc-shipping-free-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0^ãH‡FG\Zv@Ý û(«Ô'),
('›ó!ñêŸ4µ¯rââ]Ù', 'wp-content/plugins/wordpress-seo/wpml-config.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“v\\þÐó*9G;‚Ù3±¯d'),
('›÷)Dù~Lö:Õ©Q Ïo', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/sample-plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö]Í{…ð÷¼¼›0ŠlMD='),
('œ\0¤!jyì×Ô›Ó¬§ÚÂ', 'wp-content/plugins/buddypress/bp-core/images/60pc_black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝËYSMiÓx Ë€ªnü'),
('œ$þž"€0œësyu', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Yý³üõ*Šüczæbo<'),
('œ5ô‡¬ƒÜ\r¿ËkÔÄ', 'wp-admin/js/color-picker.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”Š×ê2dMMÊÜTúÁã'),
('œ8ƒ©Ž…¦¬ãP5aÄ¨	', 'wp-includes/images/smilies/icon_wink.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð\ZO‡ZÀüè¦g9Ø4º'),
('œ\\Õ|\Zûqt‡nÝ¤ˆ.g', 'wp-content/themes/hexa/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬W&Ò :Ïã\05ø-('),
('œd÷—[þ¨ÿ8Æù4 ky', 'wp-content/plugins/wordfence/images/wordfenceFalconSmall.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>œÊhjµK¸wó~º…'),
('œl£d¸ÕŸˆL«1u0', 'wp-content/themes/twentyfifteen/css/ie7.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dhù‚=ƒ[KM7ÕÅ,ˆ¬'),
('œ…‰Šþy85õÜÃ¦bÖ', 'wp-admin/css/colors/sunrise/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àHpŸúêÃáýØû''†Ÿ'),
('œ†j|\nºØlªV—ä§7æ', 'wp-content/plugins/siteorigin-panels/css/images/tooltip-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ùí£ü`ržºßj· '),
('œ‹[ª	Þ5—c#ãQtF', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_CurlIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°-{˜2ê\n<iÑrÒd¶M“'),
('œªÓQ¾Vò‘¨°ÕQ€ð‚', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥BŠ“­ßA[K_x–½\Z'),
('œÌ0%XKr„ïÆ]´*ƒá', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ð=ËÏWè¥{ñ\r‘ÝA@'),
('œÔ?Y~ rÆµ|êðÙP”', 'wp-content/themes/twentythirteen/header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Óàz‚j+ß=™BÌm·Ëjæ'),
('œÕ‹€PQ‹E|E}7+', 'wp-admin/includes/class-wp-filesystem-ftpsockets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$,õ=0ÅG]¶Ð*d)rAC'),
('œÖ¢\04‡ìaÁ¥\Z7cHµ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/autoload_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uö³v0Atíf£µ'),
('œàá1{ú‚¸»Ãl§7»2¡', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Verifier.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…WÈ\0''òù5%ÛÇ'),
('œåU‰±ó$ì\\*Ý1^œSý', 'wp-includes/js/jquery/ui/effect-clip.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…s–òØ :º(ýà\0œ’Ø'),
('œþP\ZÅ/é¢¯l%¡', 'wp-includes/js/jquery/jquery.hotkeys.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'â”ƒ¨Ê& Ý‹\rFÆ°¦é'),
('l&I¾Z=Î\\[¶Y®ê', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-da_DK.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' •"lu–ƒ4à(u÷ó'),
('Îé@HvSƒaÆZÞà', 'wp-content/plugins/wordpress-seo/admin/class-metabox.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',l»ñ¡f_¼§¸§·	'),
('\n%f[!aE«rÒtg€i', 'wp-includes/images/media/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àéñuêh›ÝÛq ÷'),
('#õô>ä«í‘Ò†ÃKl', 'wp-content/plugins/wordfence/lib/pageTitle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åHh’I¯æ!SÙ??k'),
('&‡Sì§¿o¸$æ÷0øn', 'wp-includes/author-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NÿÁGH:æOÍ=àD6ä'),
('&`ì‚o—J{6Ôn[…', 'wp-content/plugins/siteorigin-panels/css/images/cell-selected.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥Ã¸ž6VñZ&S¨´Þ0x'),
('''Póä™T]Ù	ÿ6ÿ~‚', 'wp-content/plugins/akismet/_inc/img/logo-full-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!MÞpP”ø`-6˜À÷'),
(':êü¦Qþ™5_Q!b', 'wp-content/plugins/woocommerce/templates/single-product/rating.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦Cp>‘^¦ÝÒ²B®¥A'),
('=Ae‘8V-öIà\\œmÌ', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.resize.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛÐfæ¯DUŸªÛ$Ôå'),
('Q ²ÁÌÔï2Š7uí L', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óÓ£ÏƒÁ$57×|™}'),
('p–V§lÎi"ý"Iöp•', 'wp-content/plugins/woocommerce/templates/single-product/sale-flash.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ãb2N»ºmN›ûTsÅQd'),
('ˆÂšg%©vðµC;eÚ%', 'wp-content/plugins/siteorigin-panels/lang/siteorigin-panels.po', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛÀ†W-!m®ú¬ '),
('’ÑºŸ"ÌP5ìÓ^U\Zi', 'wp-admin/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''‡››×\ZýYÅÙwÅ/'),
('§mÌœýz4èLä¯úK', 'wp-admin/images/xit.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å)£Xû¹`1¬ÜðH×Ê'),
('´ÇAóG,‡Ã<Œ¸¸', 'wp-includes/js/jquery/ui/effect-fade.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤G†q½oE¬=\0Ù)'),
('¼uU©¥ö‡´`çdÃDðV', 'wp-content/plugins/buddypress/bp-core/deprecated/2.1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âÔÊŸ?Ù`qb¿„«d½S'),
('åpX”I}·ÝÝ¾y«', 'wp-content/themes/twentyfourteen/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›­%øïÉo•‘€''µ'),
('ú‹5”Kôkö’ ¥ÚB', 'wp-content/themes/twentythirteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z˜¨k\\´Œó8F2YÎA'),
('žp™…fkN©~ÓË', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/discover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú!çù_Ö)t®Š0B');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('ž Án€$›‡qˆï^qf´§', 'wp-includes/images/smilies/icon_lol.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÔðMÆZ8|©¸Àò,¨ÀìŒ'),
('ž*Tñu\r¢íÓÖ ~ªm', 'wp-admin/css/colors/ocean/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nœ¡‰µl6¯>($nêÇ'),
('žE-jàÊ1jì£Ê\rÏE“', 'wp-includes/registration-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_?<·ÆÑ&TxHÝX“CL'),
('žÓg"WjáÅ£8UP˜', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_WPIO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tbA<à]VÚR‘´–Ï˜'),
('žîp?E^¢@·''ŒãPEÅ', 'wp-admin/edit-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø–±€>ß¸»<rÌœ£C'),
('žú³Å^¯Á?ÔÅÃ‡h´‚', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z)Þ&E«­•Œ`ë>ê'),
('Ÿo°¤èÔ~ž4\\:Ñ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-auth.php', 0, 'Ÿƒ\ZcæÔ,Ü8P­¥ü', 'Ÿƒ\ZcæÔ,Ü8P­¥ü'),
('Ÿãr\0¢¨¸¯*ê‘ÌRÇ', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-ar.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0dk%©¯fÍ¢yyóÖ'),
('Ÿ''ù2¼)÷Ñxù€Ç¼¾', 'wp-content/plugins/woocommerce/i18n/languages/woocommerce.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' è­#ŽØ+–•ŽÏ’h´'),
('Ÿ<„ (ÈêÀ‰*A]ŽOí ', 'wp-admin/css/colors/ocean/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óñŸÿeµ›nç<ƒ$ mk'),
('ŸQ\rWlúË‚ìa6‡Iêœs', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/.editorconfig', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'EÓh&/üÓ‡ ÅøéÌ~'),
('Ÿbv¾ÉE’ì´HÕÇãÎ„', 'wp-includes/js/wp-lists.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÅLí.‚+#/*Ø¥óI08o'),
('Ÿ‚œµ–F7‚m‹NŽZ«', 'wp-content/plugins/woocommerce/templates/myaccount/my-downloads.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8¾ØÞáOÝ’ãyÓkßÊã€'),
('Ÿ‡x÷é¿LùöY›”²à›', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-logs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qÉôa8SäJæIŽ„y	'),
('ŸŠú¯ª¶„ÕKêŠÔ', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gË ‰šPömwfŽ«ÊÆ'),
('ŸŠä&UÌDÎÉ±™–ñµ^', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/Installer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o æQ¶bö~FÃbñ<22'),
('ŸÎ–&¿¢NÂ,õ¥ïŒ6P', 'wp-admin/images/icons32-vs-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡*04ÿG4F—	&Zƒi}"'),
('Ÿôi¼úxï„9pëwç–§', 'wp-content/plugins/woocommerce/templates/loop/pagination.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç³šRàüÏž3—‰‰lI¼ã'),
(' \Z]á}7‘?$j\\ù%„', 'wp-content/plugins/papercite/documentation/bibfilter.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_Dz÷¬ù}ZƒKÛÑ…ø]'''),
(' ?Ø?º4¥x´\Z.*Ddú¤', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨¶¡(ÚÏf˜ÜT#õkB'),
(' qò¬h¢ö¾Bcø92’î', 'wp-admin/network/site-themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z¯dÜÁEj<ÖµdrÊ'),
(' ¥d]\0FÖmÅ²p²D', 'wp-includes/js/tinymce/plugins/media/moxieplayer.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NYÓNû- ¹ 3Yj…ä±ï'),
(' ¸‹‡`%ú’{ÍüÒ+›ó', 'wp-content/plugins/wordfence/images/icons/error128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É:Þ%7÷!Á´.Ñ'),
(' ¾Žv†’\\Qœ¥À-¼Ê', 'wp-includes/js/tinymce/plugins/hr/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\#%ZÒÑ³÷,3¶Iñ8š'),
(' àÑ–ÝqÝäSGKy(þ', 'wp-includes/kses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'HŠQgôÙ™v®r´Â'),
('¡ÕOwææ…ÿ½>QÏ', 'wp-content/plugins/theme-check/checks/include.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':‰zsÉ]V¬¹¦\\Ï…'),
('¡[öHn[PÖ.~½ðßFU|', 'wp-includes/nav-menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Â9Þee‘{ÆÙœœìþ'),
('¡tAH(JAµÍ;t§\\—', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/activity-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€9”pÅþ{EÙ=_KI\r¸'),
('¡»«Z€\Zxcy•dó''', 'wp-admin/js/language-chooser.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h"8Jq	t­ÑäF…'),
('¡˜ß+>ìëoÂÒ‘¯°', 'wp-content/plugins/wordpress-seo/js/wp-seo-bulk-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'XrSChÉRƒ§Ê\\i/Ög+'),
('¡²$(i*qÕ&#ªz¥t', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/PuppetInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²b‹UþyêÍ…«ßæ\08'),
('¡²¨æ€Ë:xÙý=á}ˆ', 'wp-includes/js/jquery/ui/mouse.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';<•õûÏ£	''™-Ã“'),
('¡Þ;ã;/JÃKmRÿ—0', 'wp-content/plugins/akismet/views/start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WéÖ0Y›•HvÖ·®#'),
('¡çCôÍByIwÝX»É¾B^', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-report.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$5l’¥l‚aBÜR¡ÉÞ'),
('¡êyî&a’A 7Â]Dm', 'wp-content/plugins/wordfence/images/icons/ajaxRed16.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´Ïà%º»©B\ng 2…‰;'),
('¢åî­ï4îõg™`Âák', 'wp-content/plugins/wordpress-seo/admin/pages/bulk-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'cÇÑÅâT7kws4PcF™'),
('¢ a"KwTÕbc1S', 'wp-admin/css/revisions.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âÍf³â†~~\0ÖCkm6'),
('¢4\Zºr\0}lqÔîÁØ''…,', 'wp-content/plugins/woocommerce/i18n/states/AU.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'º®7ËÅòOÎgEVÛmœ'),
('¢4gŒeÊØé>©óÓß', 'wp-admin/images/list-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hÕ»ISÂ2ýÓi‚gš'),
('¢C-8_š<8ðšj', 'wp-content/plugins/woocommerce/templates/emails/customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'z˜ªw=èÿ‰MŒ}S:Ÿ0Ž'),
('¢fkj’ÂN‰Uei4=%Ã', 'wp-admin/js/tags.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/I@Ô!{¿hLÕR\ZË'),
('¢y%…ËÆÇº~¹ne"V', 'wp-admin/css/list-tables-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aÉÞžj!¢¥âãf,1'),
('¢À4ÝÓ7¨¶2à³•', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-Í2Ôttª\0ürâÄ'),
('¢Ìh/·8Ï•/¥7N³IF', 'wp-content/plugins/woocommerce/templates/content-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ê¼VoÔTÆ¦Ã¸§@ä'),
('£kÁŠPI,\rc?Û“ý', 'wp-content/plugins/buddypress/bp-core/images/Jcrop.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™¦!õr,B3ƒ7Ö[«³'),
('£-ž×®X*…wÓ!ØF¥', 'wp-content/plugins/woocommerce/includes/class-wc-coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':y>''-2´ukƒ,·û¤&'),
('£1ào%¨ÀqÅAµ€', 'wp-admin/js/inline-edit-post.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0kIÄrf²s†\nF§¦š–'),
('£CxÁ²o;¡Á©', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels-history.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»ýöx®ófFÑ­01Û[7z'),
('£_´9ä(©•üÒöÞYØ', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-en_GB.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u÷Ês•²ÔË­?Ñåø'),
('£`¾t\n`¢‹‘Ùs“à', 'wp-content/plugins/buddypress/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜âý\n¢mx;Úìk\r;Ö'),
('£zR²u½˜÷ŸïÁ	;', 'wp-content/plugins/wordfence/images/wordfenceFalcon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd''m_0òxZb-ÕîÄ%'),
('£¯[æÞÜ€—xMšG¼LèÄ', 'wp-content/plugins/wordpress-seo/vendor/autoload_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛsyúÍq¬}•§$ù~Š‘’'),
('£ÀIasÌ¨ˆ}µÀžqóŽÖ', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-welcome.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãèîÝ‹lÍRA\np1['),
('£ÜF¦²™˜{ì´ýA', 'wp-content/plugins/wordfence/lib/sysinfo.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö¤¼C¼¿C¨WùÁÙM\Z'),
('£áñå€½·¶ŠÚŠtÕ%œ', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ûz³gäÃ…‘¾m~—˜v'),
('£í‘Eââí•ÀQ?èÞ	(Ä', 'wp-includes/class-oembed.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9fQ¼Ô<Ä”Âò#žæ‚à'),
('¤.ÝB¾ÀxK‘YŒ', 'wp-includes/ms-default-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l¬À=5-K>×\rÖ©tüíõ'),
('¤*O-¡LÏ„ªÂâ\r[Ûu', 'wp-admin/css/about-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âK%…Û“°.H­ùEVö'),
('¤*y\rÏ}é·ZE™²È', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/Google_Client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Žú0ƒç›Ñå¹æó“ø#´q'),
('¤*Û×þ…ð\\Âf0HTŸú', 'wp-content/plugins/theme-check/checks/nonprintable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'CŠî''ë‘ª9+¡y˜ž…?'),
('¤??n¿ëæåýå_2g·j', 'wp-includes/js/wp-util.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±õÓë¨\n“à%;ÇI‘û±'),
('¤•±ráì˜SXiÓñ', 'wp-content/themes/twentyfourteen/inc/customizer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZÔQšÝµ¨¼º›²Y-'),
('¤©zoX–ž©€Ÿ0KžNôÝ', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Payment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»TÀþ7\ZºÀ÷e?iq['),
('¤¿î"\\ÄéD¦-\\gc£', 'wp-content/themes/twentyfifteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ì¦À*³pz.9ô{ˆ¥áS'),
('¤Ê!úa…§ùÀ½†ü!K', 'wp-content/plugins/buddypress/bp-themes/bp-default/blogs/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ugG’RãŠ­lZ^F¾Œ)/'),
('¤ØC£<ÅpñŒNkAU1', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/register-success.php', 0, 'Ýµš:äãR…ý©BŒÁ', 'Ýµš:äãR…ý©BŒÁ'),
('¥þ6ÑÚ¢hs~øNáˆA', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£''\rsTÓjÚ½š·SJˆ'),
('¥ß¥¥„ªS«ºýa·Á', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-response.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&.àÈÜA0ñ»áÜ/Š'),
('¥R;lzOé8m<3”Nie', 'wp-admin/user/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦Ë¹â©ÓÞ³H™t’íi.'),
('¥afh=F¯ÕÞTÒ:þ“6¶', 'wp-admin/includes/class-ftp-sockets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TÙè[”Äæ6ˆ…+š''<'),
('¥tB˜uˆtÖ-§zzð5', 'wp-content/plugins/papercite/format/britishmedicaljournal.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Š¾''W8’a¢VÝAÏ'),
('¥Ùëñ§;~Ó·R·>ž£', 'wp-includes/class.wp-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®H--u™Ñ9È|\0û›‡ëÝ'),
('¥ünvp¬e„íÆÐîÊ}è', 'wp-admin/js/customize-controls.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«T°éX;68_\r:S'),
('¦ž-*…óWy³Ø1g¼p', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/images/page_header_tile.png', 0, '}g&ýJa2gÐ†ý½?ÅúW', '}g&ýJa2gÐ†ý½?ÅúW'),
('¦?Û&€[·Û†u¤,èe', 'wp-content/plugins/woocommerce/templates/order/form-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' €0ë’yFG…`V27ô'),
('¦(¼|nä•Á´sARFä+', 'wp-includes/js/crop/marqueeHoriz.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŒÌ®œºý¸;æäÔLo\n'),
('¦NF¨mÉØtâ`$à…', 'wp-content/plugins/woocommerce/assets/js/frontend/checkout.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B˜7ŠmÞ§~r™1\nP''Žb'),
('¦†ï-:)íàN6øª', 'wp-content/plugins/woocommerce/includes/admin/importers/class-wc-tax-rate-importer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘\0\ri‡}³OØø\nrúUKÄ'),
('¦’¯üž:[&bú[®hY©¸', 'wp-includes/images/smilies/icon_razz.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ËåË­â´ì=…¾JÉ@šÝ'),
('¦Á\0a”õ>d$p°æÏÞÔ', 'wp-content/plugins/woocommerce/includes/class-wc-download-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>£½$éi;ÊG\0ÈÈ¢T'),
('¦ÆÑŽ—âŽbÊìÉ…²+', 'wp-content/themes/hexa/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡OxŒ $&õÂ‚Ðç‚¼±$'),
('¦Ü½<x)Ô¶Ý¥\Z¶8ƒ¡', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/OxidInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$èè]}ŸÌÚX€“Çï'),
('¦åÀõ‡	ý<†2qÌCƒ', 'wp-content/plugins/wordpress-seo/images/banner-website-review.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Oòñ¿''íë²n\\±(~'),
('¦üvaúÆŽìY”©…k\nj', 'wp-content/plugins/papercite/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'quuMÊ©8Cål7O‹ùÌ'),
('¦ü­ó8`9ù×?Bb“Ð‘', 'wp-includes/js/jquery/ui/effect-puff.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c:>ˆ8	ÛiE—~Î'),
('§‹ÕQöˆÕ×B¨…', 'wp-content/themes/twentytwelve/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NÏÿýc7 h8·:;j\n'),
('§\Z1P=ÒÀ,æPjæ–f', 'wp-content/uploads/2015/03/uaiblanco-300x93.jpg', 0, '’ÁãÝ éÀ§­\nD', '’ÁãÝ éÀ§­\nD'),
('§\ZÓçŠõ)–Å-{{Çú', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-wordpress.php', 0, 'ÛëQ\Z-B§\rq*ûì¾´', 'ÛëQ\Z-B§\rq*ûì¾´'),
('§2KkÂƒ€­\\/â†Q¸Ä', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-translation-upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',œ¾8ï_™9‡žý\ZÃ•'),
('§7£¥i\n„æîË’ñóŠ¼', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-capabilities.php', 0, 'ÝEšæqÖTâRa&è`\r', 'ÝEšæqÖTâRa&è`\r'),
('§Iã52Óâ‰©?Loa†', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/notifications/read.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uôì«ïd“»''äµ"ÁS'),
('§cã†ÌŽ´ˆ$\n''@›\ròè', 'wp-admin/setup-config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[vï3¦ßµÖ×|åÑ1d'),
('§gî26\\P";"5NX_Ë', 'wp-content/plugins/buddypress/bp-core/js/widget-members.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?À-«ðƒè^§#™d'),
('§p€¬2Y}}W:‡Kâ‚', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/OctoberInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æßÖiÎŒ!‘]oµ_·'),
('§×@f	¸¸iz3}Ã-Èy', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/maestro.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')Ð8)huÛ/hè'),
('§”}X*gçná’s\r\\', 'wp-content/plugins/buddypress/bp-themes/bp-default/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úè#J|±Ï‚A¡´áÐdjó'),
('§•¬Œ¹è‹OiuD}j^', 'wp-content/plugins/woocommerce/assets/images/select2x2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Iãð†bö²®À²Ì©'),
('§—ÔÝÕÍU7Ì{p—Hüê', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&[`Ö\nËûI\\À=ü§<@'),
('§ ?ZÓGW©Y¶@ù¤s', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñîa½Ai+D„õÌ'),
('§¢Î£BgÄ‚ÌŽt•h%åè', 'wp-content/themes/twentythirteen/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'w,2H‚V>‘òyúíÚ'),
('§©×d/Â†û2oÌ8P	:', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WordPressInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è\nxÏÜ_‹òsqímÑ0'),
('§²Z?%_\Z¬‡#/Ñ-Õì', 'wp-content/plugins/papercite/screenshot-2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðjú%\n–2œûz'),
('§Æ»e6µ ¥\nV‹Óƒî¶"', 'wp-content/languages/plugins/woocommerce-admin-es_CL.po', 0, 'cÿéô[ÚvÖ&÷)¤¾', 'cÿéô[ÚvÖ&÷)¤¾'),
('§ÇÜ`Üäƒ½¿eWîY¼¿', 'wp-content/themes/twentyfifteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€éî›–Vä½X+Õ1™'),
('§Ó’?ÚŸ£E¿Î¶$PF', 'wp-includes/pomo/translations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒfWÛ¥Ë"\0Dwfß'),
('§Ö\\¹cÊâ\nUëC(ï»ê ', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.0.9.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ^HžÜ*o²…ˆWw­ë'),
('§èáú°6‘bg·>_ª', 'wp-includes/images/wlw/wp-watermark.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';š‡uMmÜ­D|‰wŽ“ÅD'),
('§ð›Xá!œÍf4¥ýåF2æ', 'wp-content/plugins/buddypress/bp-forums/bp-forums-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Jì]ZvOþÃn{-ùº'),
('¨ß:G%U\\¨š7“jT½', 'wp-content/plugins/siteorigin-panels/widgets/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']Ï8ühB¹GQvl<?b˜'),
('¨#8ñ`übSm˜:4\r…Íà', 'wp-content/plugins/woocommerce/includes/admin/settings/views/settings-tax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„i^ z¦ïØø¾voµC'),
('¨#×?€™ïGc	Â¯l1e', 'wp-includes/class-wp-theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'èC#dÅ\\ï:L#ãÃtx½'),
('¨2[„ªsÃ$ªÎtÕX[', 'wp-content/themes/twentyfifteen/content-link.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³™àF''iÕVú1¼ó'),
('¨7¾ò_üOI;±M–gÍ', 'wp-content/plugins/woocommerce/templates/checkout/form-shipping.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÏÎ\r•!uë=²„õ\\ö{ '),
('¨HŠ£õÁœPwàð%8–À', 'wp-includes/images/smilies/icon_sad.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z''=³ÃOjû?íuA|¥ç¶'),
('¨Q49ãóLzÓJµ', 'wp-content/plugins/wordfence/lib/wfUtils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-MLlI“6–ífEt¿¬'),
('¨[ÂnÅG{Ãù''¾¢q:›', 'wp-includes/ms-deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ„žknùâÐXÿÂÄÛcÔ'),
('¨mxSÑ!˜~_l¯ö’:š', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/delete-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R“çž°PŽë(0Y³è'),
('¨…éšßsâ9(©4', 'wp-content/plugins/woocommerce/i18n/states/BD.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŒçùÆ·°9’é(@0é”Þ'),
('¨¬ÌÈ€ç~_qÚI¶ÄS¡', 'wp-admin/js/password-strength-meter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1…ò|¤=·šmàUÉ×'),
('¨¯ß\\àD ü>üF,µ‡ç', 'wp-admin/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÉÞŒpÁPnœì£¦ì‡S'),
('¨°£¬;J3"¡\nòÂ¦áí', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/notifications/unread.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uôì«ïd“»''äµ"ÁS'),
('¨ÎUQ8 ©‘-ïÇê¹', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚’[\\+JŸhcmï6ýu'),
('¨Õý¼nöÛ.-‹bèâ›;', 'wp-content/plugins/theme-check/checks/suggested.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åQª¼Eí¤«\nˆ*ì\ZNè'),
('¨äpC@Sdº\n£Í`²¿Õ', 'wp-content/plugins/woocommerce/assets/css/select2.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ùE\\²™ÕïÙÌ­·“Pjt'),
('¨ì¤ã\Z‹ NwVlŸð/Ì¸', 'wp-content/themes/twentyfourteen/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q3øôé>z4 Ç¸Úb'),
('¨ð«æR¡ŽƒØÛ~€y\ZÅà', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úf÷¦lõÏÃÌG{'),
('¨úU¡¡²c˜ºe€SÊ', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-sales-by-category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.¾&]º¸ÜÍÍ£â}ò'),
('©6žâÍåŸæ¥	4	TÌ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MakoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ó³ïº6g«O5|ðï '),
('©»ùW{&ƒV8i\\V‘', 'wp-content/themes/twentythirteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5›	ÃêM:úò^,ÌM'),
('©Bw¶Ù:Õ—kã.I', 'wp-content/plugins/wordpress-seo/frontend/class-breadcrumbs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÃvG™r/:·´„SƒÀõ'),
('©S¯Ð	mm®Ø.‰gPîW', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pt_PT.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°Okòü\Zð#ˆ—À›/'),
('©kj°\\²½™òt¶\ZêÍ@/', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/views/table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.W7ÀÄÄ’I·.žOt'),
('©†/6Øˆ³m;\\R:ªpù', 'wp-content/plugins/theme-check/checks/editorstyle.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒÂžn—©ä&À,D"¡Ò'),
('©¢=CÑ Ôæ*TXô¹´4', 'wp-admin/css/colors/_variables.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vŸw\Z??Ûhåœœq°§º«'),
('©½á—*ñò\\¨<A\0PnÁ', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶f2ü\nP¨˜qR¡ëÒçŸ'),
('©¾>vBh,O+p9Ñ¹Ú', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Exceptions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€74ÁMmWÀŒ`q\n4»Po'),
('©Ü ÍçIt13&', 'wp-admin/js/nav-menu.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ZÄ5ñgìœSœôá9üšE'),
('©ÿ>Ní™Ô5aˆr¥,ä', 'wp-content/plugins/woocommerce/assets/js/admin/term-ordering.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó:£¿2WÿÈAT¼'),
('ª!_H9ž]IP$äª×E©', 'wp-content/plugins/buddypress/bp-forums/bbpress/rss.php', 0, 'ne9UÛ–Ú€¦Ÿj/ðF\\*', 'ne9UÛ–Ú€¦Ÿj/ðF\\*'),
('ª;?2èáˆSýã§\0ûšp', 'wp-admin/customize.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰tøL}iÛòd''gÃ7¸\Z'),
('ªXàá@ÁÔ%½1C„Ái', 'wp-content/plugins/wordfence/images/lightbox-controls.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm]¼a’¬•\\$É'),
('ª]Ú.Ç1\rPXL©', 'wp-admin/includes/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆE:Ó­Het8ÕIå\Zsx§'),
('ªd“Í’Ô×Þw–IéÀøoe', 'wp-content/plugins/woocommerce/assets/js/frontend/cart-fragments.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú}KG¶’A\r¥•õðt'),
('ª“èQè©—\nX<5Kh', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/topic-toggle.php', 0, 'F­-Âb#îu§?.ÎÀä«m', 'F­-Âb#îu§?.ÎÀä«m'),
('ª©³ß(Á%Nd¹|óÒÐ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f †ž}bèghÉYäXl0'),
('ªªõÙ†˜|† ²½', 'wp-includes/js/masonry.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l¸»}MªÑ˜7ãjðŽ'),
('ªËÙv{C«ÀºÎÒ§€Ž4I', 'wp-content/plugins/wordfence/lib/wfViewResult.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	qNÁìºK80ÁO«·'),
('ªÚpº$^†ôµdZ', 'wp-admin/network/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k½€Oy_¥©4õ)¥\Z˜†¿'),
('ªæ[KºîæbŽÄÚ28·', 'wp-includes/pomo/po.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6+\0¦nä_HSlµÄ'),
('ªìho´FóÃàH*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-plugin.php', 0, '|Ü`kJ$BÌÖ[±ã', '|Ü`kJ$BÌÖ[±ã'),
('«7Ä''×é†Â-CnTPS', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-mijireh.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£·õ[X7É¢íç± 5‰üa'),
('«ÐèX’°ØJ üp', 'wp-content/plugins/wordfence/lib/wfBrowscapCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö><±‡Å|ËrGÿ<gý'),
('«"Í‡˜ùhy%«Àº; ^', 'wp-content/plugins/buddypress/bp-core/admin/css/common-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÔAÃŒ‡Þ.ÿš¹þAØO'),
('«:"+—£Ä\\ïÔÓä™', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/search.php', 0, 'Æ1¢Êòp''c\r¯\Z¼CÁ6', 'Æ1¢Êòp''c\r¯\Z¼CÁ6'),
('«o¢ù ´l>¼âx~I° Â', 'wp-admin/network/about.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éã=ùÚ©SVæÚVˆŸì'),
('«}Ñe‹‚ðý¿Á›$¢³F', 'wp-content/plugins/woocommerce/assets/js/admin/product-ordering.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬ù‚\\~?\rùêcÃ‘“xiu'),
('«ˆ°0jˆlµSÓýKò', 'wp-includes/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æ4!–A4Üõ üÙB'),
('«²ï¯¨>''TïÿG£ÒÁ„', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_OAuth2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	nÝñ;íÀ<b¸]ƒV‘'),
('«Â«¬ä—-j=´u¶N\\q''', 'wp-admin/css/farbtastic.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ùã8)¸úí}{¾øCûh2U'),
('«ÖØy•/pV‡A%ÌÚ', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PöžÎ¥#ædàú¤\0…™'),
('«ØÁœò¸/Z”&ÐÈ`', 'wp-content/themes/hexa/languages/hexa.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's1ø+w’„Õ¼ëõÌ_†'),
('«ô÷á—Ø3…-ƒ«4°', 'wp-admin/css/colors/midnight/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼¼"ÄnvÙ£•7kÅ'),
('«ÿAÏífÖsYƒÒâZÆ', 'wp-content/plugins/siteorigin-panels/css/front.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÃÄ”¶	Ò²™—è­_Ç('),
('¬"Ú•K[@‰GÇûáá9‘', 'wp-admin/includes/class-wp-theme-install-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I^“BîI,€~a5RG'),
('¬3!9ä=è6Ý¡', 'wp-admin/images/resize-rtl-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷Éžç@þ’T0:ªÜ}'),
('¬m7vŠ†,1R.ùvk„¹', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/JoomlaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ²ŸŒ\0fHpg!N¡OÝ'''),
('¬—1ZbµU ÁÈC$', 'wp-content/plugins/woocommerce/i18n/states/HU.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>ÄÞ82QzÆÅ”)²'),
('¬»)¿Àvù{¸Íc€/', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™õ³†#Ë‡f£ ¨™'),
('¬ï¦wÄ“vè1žùîÙ¬ù', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings/delete-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æC TýëKnÍ”¯CM'),
('­)["J¹H”î|çjkŠû$', 'wp-admin/js/customize-widgets.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xPØ}èüâïrªÙTÜc'),
('­Hîå)¶Ä-TÌuZr |', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status-tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ai''gr%Ä³þ{Ú)µ5R'),
('­JTV0D·îoTAï¼»@¡', 'wp-admin/options-discussion.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë\r"{V›ëµ–î‡ååÍ'),
('­‘åäñ,\\Ã§…ÿd¾', 'wp-content/plugins/buddypress/bp-core/deprecated/2.0.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ï­\r&`éŒòg©úCá¶Q'),
('­œ„GbO—n4Ä7ÚÄ~3', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/button-grad.png', 0, 'D[j—¼\r¤Ä„¹©îµW–', 'D[j—¼\r¤Ä„¹©îµW–'),
('­š•SÇhÞëáSÐ%Tzø', 'wp-includes/js/mediaelement/wp-mediaelement.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äUw‰\\%­º‚`­Ì«'),
('­±ªU4èEp•B	@wÃ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-pluggable.php', 0, 'd9WC™Ù;­¨¤¢"D', 'd9WC™Ù;­¨¤¢"D'),
('­ÌÝ"Ü’³÷ÓÃnzD', 'wp-includes/SimplePie/Caption.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½º¼ÜÊBjM­ög[ÄÄëé'),
('­ÑÑWdú;C\r¾ÄÜO®', 'wp-content/plugins/akismet/views/notice.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'èýääÀ\nÎì;÷8—Ë&ê'),
('­âZ\nuÕoK° ¯¶T;e', 'wp-admin/images/list.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>–½*âÀÓ³ÑSñÃ'),
('­æh‡ßó-²øúf:¤þ-', 'wp-content/themes/twentythirteen/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»z~Å‰ˆ_Ä-÷¼ƒž\r'),
('®\0šÎ?ð¶Ó\ZNŒ;°¶', 'wp-content/plugins/theme-check/checks/gravatar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïínQûÿ3Y‡‡(,88'),
('®ÌäUy/ÿ*%þåý;', 'wp-admin/includes/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øH¬ñ^1Ëº4†R¶Æb'),
('®\rEöÈUÏœøÍ„ÞÙ', 'wp-includes/images/wpspin-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}ï3ªÙYÍ(IÝò¤m'),
('®l)r¹ÜööM««È¿¡', 'wp-content/plugins/theme-check/checks/malware.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ra×û[õ\n?p(H«'),
('®‰Ó®„IÎöÒŽ"‚', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/request-membership.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8JæJ†W''4Hˆ_Ùë'),
('®‘‹=’LâJ8*§Ë^úVô', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çh™À†,o]+‹W{\rš'),
('®ÕRÇ8^ž¤œ‰û\nÉ½él', 'wp-content/plugins/woocommerce/assets/fonts/star.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Zºogõ¨çºù¼ZV˜$âº'),
('®Þ«Hð™¢_NüwW:;', 'wp-content/languages/plugins/woocommerce-admin-es_CL.mo', 0, 'eí\0FO*T2â•lZ¨¡', 'eí\0FO*T2â•lZ¨¡'),
('®èÿ»îåzŽãÿŠÃ', 'wp-content/plugins/siteorigin-panels/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó"9¼¶sF:¸tè\rGúå'),
('®ëþ§ªêâsp›Ðäeü', 'wp-admin/includes/class-wp-ms-sites-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦8~£!$L®€§ÿ‡'),
('®ùL‚¤ò½9Žäk±Âo®', 'wp-content/plugins/siteorigin-panels/css/icons/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸¶æz¾¥ZJÊB•\n+á'),
('¯-1ð8ü;§Tö/Xâ©]', 'wp-admin/ms-sites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']b$ëôÝÐñqœžô¸h'),
('¯-×VWùigM4|\rßCÒB', 'wp-content/themes/twentythirteen/images/headers/diamond-thumbnail.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#Ûgöa«žþ2¨Ä*Ñ{'),
('¯4 :é óá\náWvú±', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/phpunit.xml.dist', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŒÌf‘Tˆ¼4Ôv†+q ~¡'),
('¯Dìöä·††«^rÇ×.vM', 'wp-content/themes/twentytwelve/languages/twentytwelve.pot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%»^\r`áð(GâØ'),
('¯I°Y	vü1BIã¥ê''É', 'wp-content/plugins/wordpress-seo/admin/class-yoast-plugin-conflict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',ÄcâEÙ1\0ãö9'),
('¯|µö¬‡©DßÚzùG-ál', 'wp-content/themes/hexa/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Zi,˜$šâˆrÛ˜uÈ…\n'),
('¯ƒO‹Ã|<CúÙwÍy¨¢', 'wp-content/themes/twentythirteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q4«®:Dwxjõˆh*Þ–'),
('¯‡^Õã!Buëùãñ·Á', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/delete-post.php', 0, 'óÒ§Z\\ÝP)vÐ–uÄ5Ì', 'óÒ§Z\\ÝP)vÐ–uÄ5Ì'),
('¯”‹GMêØfìËJªo£%', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-adminbar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n4¨ÉC[Å×w›ö$Ÿ'),
('¯Ë½lNVb4X—eÅÒ÷"', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sû2\nËñø#{Ó³‘t'),
('¯Î¡~×ß“þ:ýèàÂøeo', 'wp-content/plugins/wordfence/images/icons/tick128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åÄŸ‹øc·h4"èÝ«'),
('¯ð‹(5ìaH­yo,Xþ', 'wp-includes/js/jquery/ui/tabs.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šQ^ÿ7u\Zù]À€-'),
('°Vq=ùT£¡Úî©Ý°ç', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen-rtl.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\ZÖ†ªvÀg©”“ ßg÷t'),
('°$åÍ“™bHn®€,\0-', 'wp-includes/images/smilies/icon_confused.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ï¤sYFPZ6¹ã,š‘'),
('°.íy#î±ëj¤Ôi]P3', 'wp-content/plugins/woocommerce/templates/single-product/tabs/description.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D¦8¸Ó„šïË?ŸµŸ*\n'),
('°’´agî÷@E‘’:ˆq„', 'wp-content/plugins/woocommerce/includes/class-wc-integrations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-	G-ë:¯yUÇÈ¼H'),
('°•+Ö÷ÐË\rx?vÊc‰’k', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/requests-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gBÊY5/Ü–"ÕúÅ'),
('°˜å:Ä±‡À	KºH*ºV', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/groups-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zà‡bÇ@›Êç®¢'),
('°žêÓðåk8KÝ¯ê', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!\n(£''­n—¤´ÉÕ'),
('°¬õÛ`7hRqžbEŸq­', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…Ýú‰Hm™[;Ì‡8 Ê'),
('°±Ø±Ê0ÛReUëíÜbç&', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-theme-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E'')j2<n»—¹zÃ8”ö'),
('°¶Ób™ç„ªŠs²}Ca', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-accounts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛBì$‹ÈEFŽaø‚cÇ'),
('°ëm“B³’<fhÌBÅ.\0', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Event.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iGF±!ýnªëoù!'),
('±\0» MÄ\\Û5Ì¿…éc\0', 'wp-content/themes/twentyfourteen/js/featured-content-admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê\0êìÿPÙwp"£LK6ÛØ'),
('±	à6¤#A³³OäCÐR', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/RoundcubeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Øãl¶±õcc*~j=p*u'),
('±!àJÞ,Ã»Æàâ¼±', 'wp-content/plugins/woocommerce/includes/wc-core-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆ÷)tö\nP…n—]\r¶W'),
('±Lƒ’…yEõ{¦øf“', 'wp-includes/css/dashicons.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Qœ\\­súàñ~xGžu™'),
('±P3\\×\rèÉþ2òÕ§eÉ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/compose.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷šÁ×‘ä:¯>Ê¸=Zca'),
('±kÊULŸíÇ¡¹$Á˜ú', 'wp-admin/ms-users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H#Èf{#Êƒ³ù	6Gå¢'),
('±‰:Q²m¦lžmcˆW', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-taxonomy.php', 0, '“Rë‰ó>-5Ïý}ì7', '“Rë‰ó>-5Ïý}ì7'),
('±§©Ù{^Ž†WÈíèóC±', 'wp-admin/css/colors/ocean/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®À“ô˜’òjá*!aÙõ'),
('±À¨-’]ü\rù~(#÷', 'wp-content/plugins/wordpress-seo/admin/class-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Äxm¸]?MCü³øu1'),
('±ú³•Ë„˜vïØ+¹nGÓ', 'wp-content/plugins/wordfence/js/jquery.tools.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ:-·áEÕ x¡$à¸B'),
('²Ý¶Æï¯ÿ]4…\\ v', 'wp-content/languages/themes/twentyfourteen-es_CL.mo', 0, 'Š4\Z‘ITç~©ØQÆB&®', 'Š4\Z‘ITç~©ØQÆB&®'),
('²3@bIáð¹Z²KÆÒ‘œ', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-reset-password.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§WÄq\0ÌOâ‹ÐÖ€'),
('²_fôç²;wÐaËÙÚ±', 'wp-includes/js/tinymce/skins/wordpress/images/gallery.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡_±ŸŒPwù´PUÛ4'),
('²eÔ‚¸-Zê+¡ÈÅ‹—', 'wp-content/plugins/buddypress/bp-messages/bp-messages-notifications.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X#åqËtÌ?hà>‰‡´‰Ž'),
('²uæØ<eçx›®@ÖˆÂˆ>', 'wp-includes/js/underscore.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%!7Ó{ºYŒ¯ŒùM*ì'),
('²‹q?%Íõrpþø0÷7ïq', 'wp-admin/css/colors/coffee/colors-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ëLÒÈAû".k^{‰\Zê'),
('²—<ÁT\rž /ö®ÝH', 'wp-content/plugins/woocommerce/assets/css/chosen.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'á5N¼„ÆÕèÊ\0"GÁ‘'),
('²’ñ;õ*õDû„¨ÎÕ“‹‰', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/topic.js', 0, '.å†ÿ<óÙ„\rÚüÂ', '.å†ÿ<óÙ„\rÚüÂ'),
('²¿$c&€s·tÂá›^™?\r', 'wp-content/plugins/siteorigin-panels/css/icons/siteorigin-panels.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z?`’ŠUïa)AT¨»[|'),
('²É''Ü¶?`âØ¤ %)ò', 'wp-content/plugins/woocommerce/includes/class-wc-webhook.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûâ_ò!Ð®­ˆ&Ù´{§'),
('²Ñš[ŒîeýXH°²\\*Þ', 'wp-content/plugins/woocommerce/templates/content-product_cat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Pð¹,\ZÜÎ}ÄÒ¢zFûñ'),
('²ýB¹6[s–M÷', 'wp-content/plugins/wordfence/lib/wfCountryMap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']hF“3ÇÐ¬kÝ;´u'),
('²ÿþ­xÄÐ™Ò)DC‡Ì<', 'wp-includes/js/customize-models.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ô ÒºúzCp§OE­aÙVì'),
('³~£š¹­U÷"Ð&Ð', 'wp-includes/images/wpicons-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ãçn×VÄo©$š”Of~7'),
('³[UÂ­x+Ò´!²', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/animated-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜P‡”?''â88]Çß'),
('³ÌW2ÝØDñG‡7‡V', 'wp-admin/css/common-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ô%~ŽkÈ›Óuø*‹Â'),
('³4cµ“ÄUÂ•ŒÑ¤', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/profile/profile-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3‚?¾qS„ñ>±Ð–Nb='),
('³6cIû	@ÛžoŽîóä', 'wp-content/plugins/wordfence/lib/menu_scan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ã÷?’Ÿ+­WÜGóR|'),
('³?IhZq_ÀÒcÑd€g¾', 'wp-content/themes/twentythirteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤ó¢[ü\r#©%¥UM‹'),
('³Vb(ktˆW"í6(;Æ´ ', 'wp-admin/includes/class-wp-media-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÆG¡åDûÜ×v–ýõ&?Â'),
('³b|LvãÙ_«7ŽðE‡', 'wp-content/themes/twentyfourteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûšïCª–ÅKZ¡—Ë³?À'),
('³c#yÉ±¡ýr)ž`W', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-ga-js.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’/ÀìƒküË»Vf¨<='),
('³tfF	Ör{™Ü‡ _I²x', 'wp-includes/SimplePie/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R».äbçä§~ýÇëõ+Ì'),
('³±ì€3}Â×EM\r:OäÕ?', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/entry.php', 0, 'š("þÜDÇÝâ6è(', 'š("þÜDÇÝâ6è('),
('³Å~8”,_rAfÿÃ°', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð­ß§)ÞS{¾E1F\ZŒ='),
('´\0:¢zler~—+\nNywú', 'wp-content/plugins/woocommerce/assets/fonts/star.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kx£Lê2åîŠD´\Z^'),
('´µß²;ø›0ÿ‚ÙË', 'wp-includes/feed-rss2-comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›<²¦¯„7Uv9Qâ7'),
('´.¸î<b°\0¿·Ô Y°', 'wp-content/plugins/papercite/format/mla.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜¨Ø·¤Xmï-@èÙý'),
('´/0êôdÄÔrBª×Ê', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',Ä)•ñŠ,Á<q¸á'),
('´@E¯[ ó''$Y9`‘eá', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àÛŽó&üêÊ&* øeI„'),
('´eZx•ã"&!Àtr‰”ï', 'wp-content/plugins/woocommerce/assets/js/frontend/single-product.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oÔho#=ÌxÉË0¦BZ@˜'),
('´z¨¸zÊam±\Z¤', 'wp-content/plugins/buddypress/bp-members/bp-members-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''Ì ÓësO3©¼ögkI¼'),
('´ƒ3 T.^Æ™<Þ÷ø', 'wp-mail.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰ÿR:ïß±5Ò$6‰œ'),
('´·*ê´¶†Z†3°\\þfÂ', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø?''ûý ÖK¢®>ªô±Ê'),
('´ÒK´ççOÈ–9×3|<', 'wp-admin/maint/repair.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';¢#\0æ24P2›peÚ4'),
('´Ô¦èÈ\ZœŒNe©mæ', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/i18n-module.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚Á÷ETbyò\\ŸX§'),
('´ðIÇåØû.$U0]''ˆS_', 'wp-admin/includes/widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á´efn_çJxÕšAuÛåÙ'),
('´üÈQÿ(\ršWbÃ†', 'wp-content/themes/hexa/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ã•ÃGVÈÝ°_£Óœ'),
('µ66#1QëE\r‹íÿxG', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î…[W›ÍÓFgÔ´Ã	Æ2'),
('µåµ+DžFÜ¿TZ[H7', 'wp-admin/images/post-formats-vs.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦S¦l“ôH\\©¬¯¯üæ'),
('µ§@"´dê6Ðyìãh`', 'wp-content/uploads/woocommerce_uploads/.htaccess', 0, '\\È +éˆa[ŸZ¾Ë¢ó ', '\\È +éˆa[ŸZ¾Ë¢ó '),
('µ&~}AyÎ‰¢4Å''Œ‰', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/price-box.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '))élHÀ-¤üCK‡`9'),
('µGV\\z²…#°ÿƒ!;¢Ä', 'wp-includes/js/media-audiovideo.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê‰\r¯iÊ¤.Ù£¥¯Ë'),
('µO—r#½ÔýTºG‡¿!', 'wp-includes/js/swfobject.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿýº,ÿI}p„e~2˜qõ'),
('µfq“0¶$¼Ðâ¯ oW', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/jquery/hoverIntent.js', 0, 'ÐÕþÔg²¬lyèŽÇ¨µ', 'ÐÕþÔg²¬lyèŽÇ¨µ'),
('µl&ö*‡©õñßõÈ&', 'wp-includes/SimplePie/Content/Type/Sniffer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|rÃói…UbÙlwìáÇÛ3'),
('µ†»$(­g‹(Á®ÔPÚç/', 'wp-admin/css/wp-admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1Î´g8ç­ï‚˜Îƒ'),
('µø§„¡ÉkMÔÕ?ÊuX', 'wp-admin/css/ie-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý}\r÷±n\0ýRŒÏanA$Ó'),
('µ±ã·q†KÑUÔjí¤', 'wp-includes/SimplePie/Category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'º~ÈÌ?Ôò.\nÜ¯d»*'),
('µÒô†t¯‰x×¢Š¥¯á', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-cancelled-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ôqÞËg\r†l“OèÑ'),
('µÝ¶yZMK8fÜU?Ü•Ä', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/js/onscreen.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è/Ó^J‡º	ç&ÒœÀ°'),
('µã-Z¼³€:E¾:', 'wp-admin/js/image-edit.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß’TÇ( u³4U(ªh5['),
('¶º¤|jX–ù©ß|êfb', 'wp-admin/css/login.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G‘"°ˆãSÇdyÒKñ'''),
('¶,Láµ™\\—-ÑáX-“­', 'wp-content/plugins/siteorigin-panels/css/mixins.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2µüèyW‰FN"õðÍ'),
('¶@\rÚ.ö±E÷Ã®', 'wp-content/plugins/google-analytics-for-wordpress/includes/class-utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê4håº$µo^*•¹üæ‡w'),
('¶MR²ælÄBœF¥u', 'wp-includes/option.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ°‡zëtµ¯7¼»\r×¼û'),
('¶aBö~9!²‚øšuHZ', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã¤Àûþë''éßï\r(cÙè'),
('¶r\\Ùj”´¨òáA$', 'wp-includes/js/customize-base.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™@Œþf"]e}kþYaB7'),
('¶t Áµ—k·b…rÈ}××', 'wp-content/plugins/woocommerce/assets/js/frontend/cart.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'RëÄ„c”j3O¼ZÃÌÈG'),
('¶‘_Q([åTJXÙÑPa', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'NUçjÙoõéî¹\r÷î\ZbD'),
('¶˜ÀãŽÆ"SÎ­`t@', 'wp-admin/network/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A“ˆ|¹ËMM0\0½ó¿'),
('¶¦â\\äÆ.1°Û-œ¾:', 'wp-admin/options-media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ú$''MàË—Q1Y´œO%û'),
('¶°ÎHº*¶á*.ÚS', 'wp-admin/includes/bookmark.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V‚Ù._%B)Šj³A†‰\Za'),
('¶Ó@‡[XÙÓÒá’ín5', 'wp-content/plugins/buddypress/bp-activity/bp-activity-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹~tm¬&Èl…ÓJlW'),
('¶ÖE\rUÔñcñ^ppo+', 'wp-content/plugins/buddypress/bp-xprofile/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-”…Z;Û6fÅHÖZq'),
('¶é	pºÈÒá¥qðI!dò', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/eComm_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Þ¯õòŸ¡ÀTdžO©#Æ'),
('¶î¤Ul1ÀÈ•Dübmgñ¯', 'wp-includes/css/buttons-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ã“µøBKÈ+NG~	à'),
('·\nfv 8¦÷á1·“™-I', 'wp-includes/SimplePie/Exception.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	Kýv&œŸÌ<\\ÚÐS5'),
('·­îD¨¢*,ÌtÌu^', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4±$w]"ÜìÕ‰ì³'),
('·f$†Y1Ä{2õr(i', 'wp-content/plugins/google-analytics-for-wordpress/CONTRIBUTING.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'oD¡‡Ë¯J"€C*ð\ZSS'),
('·›œZQ4ÇØ\\(‚Ü‡', 'wp-admin/network/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N…Ô5CsÌ¹	›'),
('·¸(GÑ¶ïcYuÏÜ5€s', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/testimonial.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5J†tHØ™÷£´è"ƒpÄ'),
('·É*7bÊáÌ1qîÖ’‘’)', 'wp-content/plugins/woocommerce/assets/js/admin/users.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­^W»ŒøÔÇIn¶Ú'),
('·Êÿµ±	 nÕžu''s', 'wp-content/plugins/buddypress/bp-core/deprecated/js/autocomplete/jquery.autocompletefb.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œÇ€å\nîõë\Zb\\gÕ'),
('·Õª§¬Èg¨ëÁo[ B', 'wp-content/plugins/papercite/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'PÒ¹DÁ¯L±®	,,fA'),
('·ë5vüÞïduù×µJ÷®', 'wp-content/plugins/buddypress/bp-activity/bp-activity-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B«Øz7í²óx1wD×‹å'),
('¸\Zä¡¯lîÎÞù3ÈŠÂ', 'wp-includes/js/tinymce/skins/lightgray/fonts/tinymce.woff', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'çaÕæH6¯«]%P£¸ß'),
('¸!@+ÿÜ`(ÊVÍn+', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PimcoreInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';÷JÉ;á`Æ’ nH¿'),
('¸;¶‘Ñ;ýt†´D|­', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.wp-cron.php', 0, 'r®·|;zÑ)É”&üà¦', 'r®·|;zÑ)É”&üà¦'),
('¸J|6}ËPß,\rÙ›', 'wp-admin/css/colors/_admin.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹â¹Ñîªë26ÞIÀ³ïÍ'),
('¸R~4î÷åÜ$ó]òi', 'wp-content/uploads/2015/03/uaiblanco.jpg', 0, '’Ôça@M·ÜIT‘', '’Ôça@M·ÜIT‘'),
('¸X¼QR\\áË×Ë (†XJ', 'wp-content/plugins/buddypress/bp-members/bp-members-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ—ÎÛâÝÚ§7¿¹ò²¡­'),
('¸yµ,LI33@ÝÐŒ', 'wp-content/plugins/theme-check/checks/phpshort.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß	;­ÏR?òùü‡€'),
('¸zÕÔûúÞQ"Ùa²ýÄ„', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/TYPO3CmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø©µÊ²¯È¯Þ@Á:-&'),
('¸‚Xô(!“ábÞþˆq', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-pt_BR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…ßÃJåÄâ‰§\r>EÑ?'),
('¸Ž”§œ[®:°—„…q', 'wp-admin/includes/class-wp-plugins-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒÉÈg3At4s\ZòRÂŽ'),
('¸š…P¿Of;ö™Í/ó×', 'wp-includes/SimplePie/Decode/HTML/Entities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E—^/Ï\rB†‘¥Z#”%/a'),
('¸½JÞjæO½3to?™¬', 'wp-content/plugins/buddypress/bp-core/bp-core-buddybar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uYÝA^á:Ù€Õ´®'),
('¸ÀÆsØ…öûÀz8¯s;y', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/send-invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦æ½;KW2dlâòAžR'),
('¸è«\\ ¯”IÑ»Á»è,', 'wp-includes/class-simplepie.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ysàr‰	‚m—¾õD;Ž÷.'),
('¹LnæóU3\n‡¢“åÑ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/WordPressInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è\nxÏÜ_‹òsqímÑ0'),
('¹#@*vÖ_—í>žù	V¾', 'wp-content/plugins/buddypress/bp-members/bp-members-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Êw.†Ht;\r³v1Hôÿ%'),
('¹/&¼ŽÖûá2®Ñ¡\rgDs', 'wp-includes/http.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ w‰¤$~ŠrÉ4T$'),
('¹FÿãÔRmÃØVå@wVÛ', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A³j0çé~ý´\rsŽ$'),
('¹M‡ÿ´Þ¯ärž%\n@ê', 'wp-content/plugins/woocommerce/templates/myaccount/my-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$fÇsl|ªQr%ÿ\nÊÁ'),
('¹bœE‡‘3Óg''cZ (š÷', 'wp-content/plugins/akismet/views/get.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-ÆÔ“$ÓT$x“#Zû<îc'),
('¹x:\n%6å1?ØÑÁµyt', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/install.css', 0, ',#Q~‘ƒfB\r«Ü`–', ',#Q~‘ƒfB\r«Ü`–'),
('¹Œ?ƒ0|Ãöà5uÆ¡ƒ¾', 'wp-admin/custom-background.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ò“˜J‡Syµ¿mÁ»„¤'),
('¹šÙ1áéØè$•ffQV', 'wp-content/plugins/theme-check/checks/style_tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö¼ÓÖÑLÛÚ‚€/tµ'),
('¹®ƒqhÌn›Jýj¯', 'wp-admin/css/nav-menus.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó¾õ-BqŠ¿r:„ÀÛ—'),
('¹µÆùðûçê•0†¼¿Ù', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/plugins.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–Ž''Ck>¼ÏâÏò”'),
('¹ÃuLç,îŸ&Ç‘‹\r1', 'wp-admin/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'rIR†	vê+/Å¼\r'),
('¹ÞÖì#¥>Ì­Ö³{ý*¾', 'wp-content/plugins/woocommerce/includes/admin/views/html-email-template-preview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ç6â[ZŠ-wºòMÚ\0'),
('¹ù$Ë<@ã™Å˜aô«Õc"', 'wp-includes/js/swfupload/plugins/swfupload.swfobject.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ìµq§V7ÛT\\ªòížs'),
('º”âyzCX9ø˜Ðj', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ƒÞlÏäF.yIÖN0û'),
('ºWMíŠË{h©øÚÀ(ž', 'wp-content/plugins/wordfence/lib/menu_options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'O*ËFTvÅø}‘|tÇ'),
('ºWgg9¥!`Œ´Ò5KÉk', 'wp-content/plugins/papercite/tests/basic-tests.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yP´Ã½*Hg©íò†Ë©>'),
('ºZäjƒðz”ç%“Iú»', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/post-form.php', 0, '¬ÄMÆÞ6a‡yÁkãð', '¬ÄMÆÞ6a‡yÁkãð'),
('º^®Éq³ò<EP†Úê6', 'wp-content/plugins/woocommerce/includes/admin/settings/class-wc-settings-integrations.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dÉA9„Qk´a{Gdÿë'),
('ºaÉ@o›ÿ''¿Ékbíþù', 'wp-includes/js/jquery/jquery-migrate.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q+‡\Z(0äBY¼<ã4:üÐ'),
('ºkíÙÞ¥[qd¿wÁ~o´Œ', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-orders.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈMîÞØv\\ƒ5žL«·'),
('º©Âã^[X’æŽi³	í', 'wp-admin/themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§Ûq\rÚ"¼øÅ‚ºt&'),
('º­ò¿—Ÿ‘ºÜñ)†Ì', 'wp-content/plugins/buddypress/bp-members/bp-members-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V½ä«¬ÅE^­„gÅð'),
('º¼4T¸(â\\9''Œä3±)', 'wp-admin/css/customize-widgets-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Uî9\0ï±zF§YÈW-Åg'),
('ºÁ8à™Î\\qåU¿Ë.w', 'wp-content/plugins/woocommerce/templates/single-product/review.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–f²þa²³,èy@œ‹0ª\Z'),
('ºÍk{šä&òó»x\n¶ø', 'wp-includes/class-wp-error.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZÎ¥æñ•f˜ÚÞUú‘ú'),
('ºÚÒ_E&ît©[ã+R—', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/green.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"]ýÆ÷Gç´Œ­qÝl\ne'),
('ºüæ†sáYXÍš¬ãž—', 'wp-content/plugins/wordfence/css/phpinfo.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£<`Ì,7‘ÜJu\0Ÿ'),
('»\0²×%3[$x\0èâ.°Ž(', 'wp-admin/images/marker.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3Ü*O2/Ô3I2œýè'),
('»6™Íqh’a¹nF¦\nU', 'wp-content/plugins/buddypress/bp-activity/bp-activity-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÅÓ§ùM¬ûQlÒxŒµé'),
('»ÒÉ4þ™õ‰ù=Ž¸', 'wp-content/plugins/wordfence/images/icons/ajaxScan.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘Ê–´Ñ´­÷~fúúžiÁ'),
('»	æããEm[¥¬³ÇØlÅ<', 'wp-includes/js/tinymce/plugins/image/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LKgQ¼3·(ô?|md/k'),
('»°è@ªÙ:ßÄz3^u', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸CcþÝ Ø¯¯Gw|½AÛ„'),
('»Ôó‹1*Â˜\\€D³!tg', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.compat.php', 0, 'úŽ8W9‚(õ1ìú@Ep', 'úŽ8W9‚(õ1ìú@Ep'),
('»-(&Õ$åÝÄéá"˜ú', 'wp-content/plugins/woocommerce/templates/cart/shipping-calculator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'l.\0¨§‘0¡"ëWîZxí‰'),
('»B&è¶­\ZvËõÜ‡GÛ', 'wp-content/plugins/theme-check/checks/customs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž’VVNð1¶132X¾,a'),
('»L?×Y{Ø«7©±F|!}L', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-authentication.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'D,Ñ®	¨rr	`Wzz_m;'),
('»xÊ-M–:¿ÁØ÷óõ', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/chosen/chosen-sprite@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aO­amM¯SgàhP\\­5'),
('»€å>&U©¡_Øß', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^ñdªÙD—\\ÇT·0ÏR');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('»<:gZ''§–iBœà§Î©', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/create.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÁoÉMÎÚHnÚ´þÚ™'),
('»œ5Z´‘ÿüÌo—ŽÒ®<', 'wp-content/plugins/wordfence/css/fullLog.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+·ÝòòW‰jwË„}šä'),
('»É<_yRÿiöPBãu¨', 'wp-content/plugins/buddypress/bp-activity/bp-activity-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÀ3ŽC>51ÂHˆÌÑ‘'),
('»Í}»üÜƒ¡C”!', 'wp-content/plugins/woocommerce/includes/class-wc-breadcrumb.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WYó. Æy~—\0]ØÎ'),
('»áï\ZgB‹}vvÈKÒèÁ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ÔÜ¼''Z”y£{ïÏ'),
('»ç#/Så,†ñ¾zŸÁ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/action.subscribe.php', 0, 'únn-ì8 IšKæ*{/', 'únn-ì8 IšKæ*{/'),
('»ì\nøfQ8Wm æ¡=ÿR', 'wp-content/plugins/wordpress-seo/admin/class-bulk-title-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ò%Ú\0–Œ\\{ÙÞN½-'),
('¼¬ðàÄÍï"¦RÑÅœ', 'wp-includes/images/crystal/text.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ì Ñ²ªü#¾dÿ%ã[µ'),
('¼70Í{«4J"âËïâ6Ú', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/PuppetInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²b‹UþyêÍ…«ßæ\08'),
('¼v%Ÿ”ŒS´[¿Ìª£Ñ¾', 'wp-includes/ms-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'UµZ¸bUT9(:-D'),
('¼w¢ÑOûAÄ5k_u©Ã', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product-variation.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'elÚ×>pº\\Õ«ùGã'),
('¼}OÍ À}´×lG:Yf', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_real_52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î\\»žØÑ…kóÁ²W±ekÆ'),
('¼”Æ^4K5×}>''¨Z…é', 'wp-content/plugins/woocommerce/includes/class-wc-template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'JÂNU= VÃ]#®îeê'),
('¼›²Ç7[¬«AÆüÁYa', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-general.php', 0, '°^ÂáÆuûœˆ_t''—å ', '°^ÂáÆuûœˆ_t''—å '),
('¼§Sm¡a1ýÿ»Õ¦ZC', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/cache/Google_MemcacheCache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ÅÅ±§O-ìIup¼äš'),
('¼ð›ÂX"¯-{ãÊ$48sx', 'wp-admin/css/deprecated-media.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯¸âø4×nG5ñéjÛï_'),
('½3µ©Î$]ÑD[Lâ', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-coupons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{¹C@îÿ6ßi³da'),
('½X8uÝcô›yÄ²¨ŠˆE', 'wp-content/plugins/papercite/lib/PEAR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@ Pˆ+ûªq­Ù@‡â-±'),
('½gÙ™Êž0›ŸRÕhyV1', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/back_enabled_hover.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')MÕáÂ)ï‘Ý‡~'),
('½}€%Jþ¼ãýgŠåzª', 'wp-content/themes/twentyfifteen/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[kù"x‡E7@s}l¥'),
('½¬ÈWWÕƒoømÚËÐée', 'wp-content/themes/twentyfifteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'é\\¡"‡È¶ˆ›jÈ“·P'),
('½²¼\\†“9ºÑ•F wí', 'wp-admin/js/revisions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A÷F¤{ì~›\r´''YÑi'),
('½³cëxÀˆä‹]ÍRs²R', 'wp-content/plugins/woocommerce/templates/loop/loop-end.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iN<æÅ\r­Þ{[K˜'),
('½¸¹Ë-æûwç,‚ÃDåÏˆ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍD "ö:..Ÿ©'),
('½àwTw»­GaêÄè/ÆHÀ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/drag.gif', 0, 'r{Aß€þ×ã5Bív›', 'r{Aß€þ×ã5Bív›'),
('½ï\\ö´äÓ\0jg±g×5w', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/css/buddypress-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Av''W¦zÙ=¸ñ÷¯ÿj\nµ'),
('¾7ÿŸÝ*I,Þ\\(‰{¿G', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/RoundcubeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '„Øãl¶±õcc*~j=p*u'),
('¾ƒ—ñNéÄõþ@½(º3—', 'wp-includes/ID3/module.audio.mp3.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#á\Zÿ~eö™ˆ‚ÝJ¬8þ'),
('¾‰&ÊôKGû‰)–', 'wp-content/themes/twentyfifteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|\0ß®`,ÃuÔp`¼s/'),
('¾Šh¢Ýß)UG@Èx–Ìv	', 'wp-admin/edit-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W…‹Ê9mz sŒºap‡Áâ'),
('¾’(Ž[3?ÓH/‡[°e]', 'wp-includes/js/tinymce/skins/lightgray/fonts/readme.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zd€ó‹+èÓÜE@ì1Ý'),
('¾ª±Oó­Ú…yÛÓé}', 'wp-content/plugins/buddypress/bp-themes/bp-default/groups/single/group-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛËBY”pC|KÈ‡ÌÁ'),
('¾µlgŽE¦†¤$—ºshø', 'wp-content/themes/twentyfifteen/genericons/example.html', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»;QCž¬JDuc|i'),
('¾á2]hqu:ÞT6EÑU¶', 'wp-content/plugins/wordfence/lib/wfAPI.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡aCíÑ K¬Q–¯»'),
('¿¯¯"_eœZC„ÿ‘', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-nb_NO.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍË@<µ•ç…3ÛºËW'),
('¿[MàñÞÆ®ºâ]œ7', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰u£Rp]´˜?@mÈ„B»'),
('¿ÒY²û©Ž1—ØŽ$É§', 'wp-content/themes/twentyfourteen/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''yµ£F¤@¹ÀÇd"'),
('¿{g£%¡Zúð\r`þ]û', 'wp-content/plugins/buddypress/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q§•_PÀÕE%™~‚°'),
('¿#²AuI.Fªù/ö Ç', 'wp-includes/js/wp-pointer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Ë‹8½.ªr:Ä›¥óð'),
('¿<{‘Á»‡,-Ì![M€ú', 'wp-includes/js/tinymce/skins/lightgray/skin.ie7.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶”Êm_ÒsÔ¥G'),
('¿\\Ÿ*QÜ¡ò{+H‹', 'wp-content/plugins/papercite/papercite.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pq®£Ûˆ±\nÏ3¥¬ ŒAW'),
('¿píNÿÊU7–p7Ø¨Õë', 'wp-content/plugins/buddypress/bp-members/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÆL9¨Ï·x@F^µö'),
('¿vé—FI—Ë2h´Ïø¤nÁ', 'wp-content/plugins/wordfence/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'N\Z“8Â©·$è±tVýg'),
('¿™¸=V;¢‹ííÂN.K', 'wp-includes/js/wp-list-revisions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'GQ\ru`Ò*—LŒìn$¼½'),
('¿ž¾ÖRÚ¸AOOÍóÉöo¸', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CroogoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AÃvE…‰"¹Â™M\\ÙñMÃ'),
('¿·?½Ë0\ns?€iUäS', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/InstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u^P÷A±P2—¦‚c5'),
('¿¼­Ç·®•¬µúµ\n‚H¹', 'wp-content/plugins/wordfence/lib/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"6å6—xq}r£Ÿ\\y3p'),
('¿àÎš,ÌQ˜a»gl·Ä\Z¯', 'wp-includes/class-smtp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŽÕP½ú­ò°Ê„b».'),
('¿ãŠáøJÐcÅPÚy­îô', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/activity/activity-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üGçÎLv“õ\ræ@#ƒN'),
('¿ÿdA#…öÍ*ç‚Å¹o7', 'wp-admin/js/customize-controls.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[¶æù€‘[`Â6N×(‘'),
('À\0îáíøäÖ;ÔÐ[žñW', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-exception.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tßòÇæ³ž`\r!M½g'),
('À\rq˜¡Ñ3I=ùž«g ', 'wp-content/plugins/wordpress-seo/images/Local_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü±í²×ØYæWª~öiJÄ'),
('À6Â4ÙjtÃ#*á', 'wp-content/plugins/buddypress/bp-forums/bbpress/profile.php', 0, 'ˆ:e„ÃÙì¼B=ù~', 'ˆ:e„ÃÙì¼B=ù~'),
('À<ºw¤–¡Àà²‹ú%“\n', 'wp-content/plugins/siteorigin-panels/video/panels.video.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ººeý`T€\0ÊrÀX]ˆ­'),
('ÀTâä%Á|Ow#e?', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-coupon.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨iVqýºáacä))RØ'),
('Ànqm?˜öYå¶{§~', 'wp-content/plugins/buddypress/bp-activity/bp-activity-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦Z_al³e“¹á:ëŒRÆ#'),
('À±3"ü(zÙa€4î8Œ', 'wp-includes/images/media/code.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-o–­UÊ“îÕU©U_'),
('ÀÂ±‚`üáK/OÄNe ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/button/styles/simple.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4,¨ —W…2ŽH\ZÉJ3'),
('Á²ê|™«UÖCD…¹h', 'wp-content/themes/twentyfourteen/genericons/font/genericons-regular-webfont.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úf÷¦lõÏÃÌG{'),
('Á9iÃäœŠ ¼ßC÷‘ê', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/white-grad.png', 0, '0ø”~¬dƒ	\0«ôV,¨á', '0ø”~¬dƒ	\0«ôV,¨á'),
('ÁGÕ…YyøÈ]—Õê^;', 'wp-content/plugins/woocommerce/assets/js/frontend/credit-card-form.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'àw59t÷nÂ®ç|¼0VÖ'),
('ÁPÃßòúŸB¿D²F2UE', 'wp-content/plugins/buddypress/bp-core/bp-core-theme-compatibility.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠƒàwÙŸGJÖ Æ‡"÷:¹'),
('ÁRX@ÏèWk÷zd{Ê+,', 'wp-content/plugins/woocommerce/assets/js/jquery-payment/jquery.payment.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üK-C$õì‰‡U¥w'),
('ÁirçÓ	$MÔÓžëÚ,', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8Ä—ï(æÝ2Ð©²ƒÍ {?'),
('ÁkHmå1Óó`0Ñ¹¯–_', 'wp-content/plugins/wordfence/lib/wordfenceConstants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—[–ÿü¤•@¶‚,lêÇ‰½'),
('Áëmæ]ª‹!ˆ¥úsŸ', 'wp-content/plugins/google-analytics-for-wordpress/admin/pages/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼Ÿ£»Jd¼\\,Ó×ø^¨Ü'),
('Á²cE*Dû5 dÓÑ\nc¨', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/views/html-order-fee.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É\rT§Šî…„•‡\ru	'),
('ÁÍvý{\Z†ŒSÇzÿG6B', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-stock.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶ñ!Xö~C»âÕWÈ˜\nñŠ'),
('ÁÙµ\nh¶ÍJxµdvÏÔƒ]', 'wp-content/plugins/wordfence/lib/wf503.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±DøG±Û\\4Ê*Æ”'),
('Áê5•ì[,	jÄ(êÆª¶', 'wp-includes/js/mediaelement/controls.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$ "½Ó¬ý†ÿü?ÆÈ¤'),
('ÁëöºágóVœ7Q®t¸ry', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-coupon.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°Ü¯VÿoòÞx›>ýŒ7Á'),
('ÁõùëÎ—ÿ@þÖÈ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/style.css', 0, 'Þ%ZûÌFà’."k—“°', 'Þ%ZûÌFà’."k—“°'),
('ÁùÁ2zsñŽú4xÎEB', 'wp-includes/ID3/module.tag.id3v1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½åhØœÚÙ±al¡ïwñ4Ü'),
('ÂObc®³" ÎÇÛ|J(', 'wp-includes/images/smilies/icon_evil.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c¿ÓÔ÷VM<ó"!.'),
('Â1¨ŒWV(2Ÿ˜6²„³”', 'wp-admin/images/icons32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑÛ¬[çm9…çJ¡4Ì\Zê'),
('ÂF‘ŽwjâÇ"*pò¨\\˜', 'wp-content/plugins/theme-check/checks/commpage.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’N6qªê;jŽt¹DB'),
('Âii­–BÜe8.¼­8', 'wp-content/themes/twentyfourteen/author.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æÄòØ2Rïíì¥P'),
('Â¨2Ëv‰¸”ä}2ëÜM', 'wp-content/plugins/siteorigin-panels/css/images/dialog-separator@2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î­„Íu¡üãHúÛ>¾Ñ‘ù'),
('ÂÀ1Œ’Á|¸}š”âdQ', 'wp-admin/export.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B!îx’‚—+Í{ÂÓÛº'),
('Âý	1ªõÐã€…S:(', 'wp-includes/js/thickbox/loadingAnimation.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Î"h\rÒcÍôÿÂö&º'),
('Ã^ÀêCÁOïÏP>ô', 'wp-content/themes/twentyfifteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø{ùI»÷<ÿ<$§°~'),
('Ã:4YÓmcHŽ=^+G', 'wp-content/plugins/buddypress/bp-notifications/bp-notifications-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ÿAËLw…ñÕÉ°®Ü3'),
('ÃC¶3!0Qòo•J¿e `', 'wp-includes/js/plupload/plupload.flash.swf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p)ë‰¯Ø-˜E÷É<¡ËG'),
('Ã_´—§jSXà2ÎQQ=', 'wp-includes/ms-load.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÙGÒ‘(Çëåòï`›ID'),
('Ã_•þù¶O‘h#Â—ºÇ«', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§ç\n·”uººHÅE'),
('Ãb§ó_‡Päâ»Ø[BJ', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/class-wc-gateway-paypal-refund.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L\Z2’Ý¡Fµ³çÍùýAóÎ'),
('ÃÿõfåÝÕ+Zàâ©', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-layered-nav.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷''¯©öò8''ÈºÏ²\r{'),
('ÃÍtnRŸØ”Àá¯ÎÆ%^', 'wp-admin/images/align-right.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BØóâ‡Oe#Ól@:P+"v'),
('ÃÕÅ5ÛV"ó°$$î_ý', 'wp-admin/includes/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«$YzirG­”ÀZKb„Õ'),
('ÃáiY–†…\0\nR)–„', 'wp-includes/post-thumbnail-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(Yð«¹©áDÊ­CdL»Â'),
('ÃåuÿXÛÝ¼#‚-ÆÂøª', 'wp-includes/class-wp-http-ixr-client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tJrëPç?ñÆbUˆæa'),
('Äœ/JÿµìOŽyˆdóT[', 'wp-content/languages/plugins/woocommerce-es_CL.po', 0, 'Ô¿Âxú±Î“e.^“/ËP', 'Ô¿Âxú±Î“e.^“/ËP'),
('Ä—UåF Öýö•Ôž', 'wp-content/themes/twentyfourteen/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ1k¶\ZNØØ+ˆ>„'),
('Ä6ðékciÄOM', 'wp-content/plugins/woocommerce/assets/js/frontend/add-payment-method.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É“F?¡Ý}ªDª»…áƒƒ'),
('ÄTÁø÷a	å,ˆf~}|Èh', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬Že¦IMq„	NÙû„ˆ'),
('Ä{4DnzsýŽ‘IŸ€', 'wp-content/plugins/buddypress/bp-members/bp-members-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œÉ’@Ùfœt5Š’Cœ<'),
('Ä|¬·\Z›òîÄ:sÇ~š', 'wp-content/themes/twentyfifteen/author-bio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4ÜÔ¡R$)úÇëûwZOõ'),
('Äää}:gªö>Ø3™Ì', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3å\rÅ¾©ÿN\\ËOË&*'),
('Äˆ^Aõš+l†®¬oød‰Ò', 'wp-includes/js/tinymce/skins/wordpress/images/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7~!æßà\0Ž÷ÆÔý"w'),
('Ä‘ÈÔªV‹CTœ‘þàG', 'wp-content/plugins/wordpress-seo/admin/pages/licenses.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§Ò‘Ï*D»\rüÅ>d‘O\\'),
('Ä”Ô¼üÝÕpPˆZ	H´', 'wp-includes/images/smilies/icon_cry.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E>z?‹»ApðmWlAÐ`'),
('ÄÔðÂï{Å5ðx¡±Ÿ‘', 'wp-content/plugins/buddypress/bp-core/images/admin-menu-arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-ƒàÒ?âiGÓÈ:!:'),
('ÄÛ˜u*MÍ=v¨Iò\0­', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/messages-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ßø\0Ïð¡½Ìà3PÒ¼íh'),
('ÄÞNßÜÿ1­J¯À½r', 'wp-content/plugins/woocommerce/assets/css/chosen.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Pìˆ{À}ÆúÏ''>‰ºÜÈ'),
('ÄàÊ™\0}ôßç” K›ö.ÿ', 'wp-includes/js/jquery/jquery.color.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿ-¸ÛñEÎGóîó>vJ'),
('ÄòòTGÛƒýÉg]`–’}¸', 'wp-content/themes/twentytwelve/editor-style-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aØïÍa.ßÛ=Ì±ôÔ%-'),
('ÄùYàtýudoåö˜ã\ré', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-rename.php', 0, 'ÑšHœþ@€Hc)â¡o‡', 'ÑšHœþ@€Hc)â¡o‡'),
('Åª{A¸êmmùß*K', 'wp-includes/nav-menu-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jgÓ$¨ý\\$À)Õ‡°HÑM'),
('Å~@Ž¾ÖÙ¿ûÌ;S—', 'wp-content/plugins/buddypress/bp-themes/bp-default/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k®˜›Y8ËžL´\Zh'),
('Å5ƒaÎ&Ñòº4¸"Ö', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/posts.php', 0, 'ò\n~”M³=“;”Í', 'ò\n~”M³=“;”Í'),
('Å`#ãØG–b¯CÐåÖŠÎ', 'wp-includes/js/swfupload/handlers.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–Y,k?­XàN¼0Gï;'),
('Åd†¥CM$q`æ£“ý¶<', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/js/password-verify.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆÒ„\rÒJ¾eêÚCÇ:ä'),
('ÅiÎ÷wŸŠúeý3CJ\né', 'wp-content/themes/twentytwelve/404.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_;·Ä¸Üšêä‘éÖ'),
('Å”ØèÕªF.¬´::÷ÌÎ', 'wp-content/plugins/buddypress/bp-members/admin/css/admin.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š%ÆPùŸ²1g‡ßZ'),
('ÅÍ-†p“lEÆóØk†/ö', 'wp-includes/js/jquery/jquery.hotkeys.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãS!}EU«\\b³g¾h‰='),
('Åñ%y\\ ¤™2lÎ¥', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/BitrixInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>½÷¡¥þWO›”`H'),
('Æ)˜¤}Xq¶œF =õ\\\n…', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/AsgardInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ¼~–ÿ´åØÝU÷vïàé'),
('Æ+’ ÍgÔ¾Âq6¥^\0è', 'wp-admin/images/wheel.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E0½ q0m»Æ\ZY%V¹X '),
('Æ+É7‚7Ã*u5âú›7¸', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/black.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶ßV°õu¿¤ÛH#â¬Œ'),
('Æ1«’›.ko$''Ô¦ÂâR«', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-customer-note.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H4-¼)™SÌ''E¾·&0\r\\'),
('Æx¤å¡©ÎŠ7ûÊ+Vó', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei-blue/style-rtl.css', 0, 'VÄXJzN\Z†)ýíË_Þ', 'VÄXJzN\Z†)ýíË_Þ'),
('ÆƒJ{N\nÆááåf½é”', 'wp-content/plugins/google-analytics-for-wordpress/languages/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('Æ…Ž‹‡|_Ëi/y¡Ò	', 'wp-includes/js/tinymce/plugins/media/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T±''”ÚŸrë§¡·ÇBîð'),
('Æ“OèÀÕEº¼d×Pëð', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/light.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9W§¬Må÷K»¿ðþÎ'),
('Æ¬+\Z–¼ÊIód^i <\0', 'wp-includes/js/jquery/suggest.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿Uó´kª7*í—¸HÞž'),
('Æ¯HCj,‘–¤;K‘Íâø\Z', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/login-form.php', 0, 'J¤·ŸÓÑ+ïÍ@ùÏ×;', 'J¤·ŸÓÑ+ïÍ@ùÏ×;'),
('Æ¼…¹íÒ~9Œç~ç±Œ÷', 'wp-content/plugins/wordpress-seo/inc/wpseo-non-ajax-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ''‡”V7SûLÅv¾'),
('ÆÒE²™½Òý°\0ßá®Íÿ˜', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ó¾-&ÍÀ26+*â-p¼G'),
('Æí‚ŠºŸ5vå«É½''‚Ù', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/AsgardInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þ¼~–ÿ´åØÝU÷vïàé'),
('Æÿù™ ûo§à¥Î3Ç', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/edit-form.php', 0, '|ñÄsL©%Mºh•#u·', '|ñÄsL©%Mºh•#u·'),
('Ç%åw¤ 	7«êÐÜ³ÏL', 'wp-content/plugins/papercite/tests/common.inc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±{‹àu,UfãLy'),
('Ç,êÝ˜ë$ä\Z=D®{g', 'wp-content/plugins/woocommerce/templates/taxonomy-product_tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`ÙúÝÓò{Äx3;ô±'),
('Ç=ì§¹ÒAnÂ¨{è°¤Y', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/.hgtags', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥ùã\r"“-÷rî\0'),
('Çu‡+5køéÚ”a££Kâˆ', 'wp-content/plugins/buddypress/bp-themes/bp-default/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&.uÁ ¹…´§ŽH¸'),
('Ç‚-i)ö.ø\\Îèæz„^a', 'wp-includes/Text/Diff/Engine/shell.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u«AÜ‘Í~Jª^t¥ùæîº'),
('Çƒ·Ü±	íoëúxE', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/options-discussion.php', 0, '¨ÐÛˆÐ:ÿÊÎxyôU', '¨ÐÛˆÐ:ÿÊÎxyôU'),
('Ç…ú9 Ù9: ÷¤\Zþ', 'wp-includes/cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'd[Ò„Ü¢\Ziìæ÷Bý¾'),
('Ç¤>z±Ô„Ÿ!J]>', 'wp-includes/css/wp-auth-check-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü÷ú´"½Œü¹_qm~‚'),
('Ç«É=Åèm‘/àÁœ^', 'wp-admin/includes/schema.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸>\nV<Ÿ*Æ­nø&b\0¶'''),
('Ç³\\ªÝ_L-Y€ÅŒ%$', 'wp-includes/ID3/module.audio.dts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òlA¸öEèŒÊO87¦$('),
('ÇÊzoî¾n¥iž×$', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-server.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œ^õ5-/¯\\õ«9Žé–IÌ'),
('Çø‹ŸÚƒë··ânÒqF', 'wp-content/plugins/woocommerce/assets/js/frontend/price-slider.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å˜mðl…ÿî¤ŸˆÃN'),
('ÇùWJ”­/!''<d1–l', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/i18n-module/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xM}Ç5{Ù$èÕd(’¿k'),
('Èøãã«Ï¾BâŒŠ†ï8ˆ', 'wp-content/plugins/papercite/img/external.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž§V>¬w;æ¤fýŠ˜f¤'),
('ÈyN¨Og¦F-Ø\Zg\nC', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-order.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'úñZ™<“õ—¿úåj Ÿ*€'),
('È\Z{gÝü?Ñ3gÚ¢\Z½', 'wp-admin/images/icons32-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µ%¤*ùúüøÌgš´ú»'),
('È"u@ž³T¬…S›ñ5ò', 'wp-includes/images/smilies/icon_idea.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½³"m%h¸ÁíøôS±èræ'),
('È?¹vçÊnùw6x7', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/InstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u^P÷A±P2—¦‚c5'),
('ÈE!¨ì†‰xš4¸Ž', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4±$w]"ÜìÕ‰ì³'),
('ÈO&£óóz³¯mîŽHo', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/members-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ócä,eÀ6ah=Glß­¨z'),
('ÈY$''«»¾šo‘ãì', 'wp-includes/css/wp-auth-check-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ml¤¬ïÖî?LI›ÜïH'),
('Èfy''~Ÿ¬4ÿ?9ÏfüŒ', 'wp-content/plugins/woocommerce/i18n/states/NZ.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬³v4''Ð¿\n»:	U\\2'),
('È†àÑûw}ŒC qÜá', 'wp-content/plugins/woocommerce/i18n/states/GR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°Í‰RZ#¸Š[ÜµÂbÌ'),
('È‰4vÓGðú@è¾(/¸È', 'wp-content/plugins/woocommerce/includes/class-wc-order-item-meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'jÃ-¡­Ý`]1hºµ½ë'),
('ÈPžÃ é3ÄïÑ€\n”Í', 'wp-includes/class-wp-customize-control.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\Ãþ‘\rœšÍ1k[å›Ï'),
('È¢Sœ9Ø.v›{ÙQy£ø', 'wp-content/plugins/woocommerce/includes/emails/class-wc-email-new-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' •ÐG"$Ìïq\\6™,%'),
('È®(I´øíuãg1¸ò.%', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/themes.php', 0, 'Ê³ ‹0ˆ§á…þ-‡é¶½', 'Ê³ ‹0ˆ§á…þ-‡é¶½'),
('È±:ÑDl1ÅD$B¾ŠPO', 'wp-content/plugins/theme-check/checks/lineendings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£”1;ÐkyÄ_î&2d²['),
('ÈàQ‰qá}Þ…›[\r‚å<', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-utils.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H-Ãf…+ðšq¡ÑîEÂ±'),
('Éƒoé:¹±çSÿày£', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/white-grad-active.png', 0, 'km.«W#*ýKm“€ý', 'km.«W#*ýKm“€ý'),
('É¥ƒÛÐ~\r\ZK4(#ãÅ', 'wp-admin/user/credits.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù ´ûâÂÇ€[K}åZ'),
('Éujº¬eË—îRŒ²A', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-nl_NL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øµµ=œ\r·;=à:˜ê'),
('ÉA7¨''áC#žwŠSûsŽ', 'wp-admin/css/about.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹ûŸÓ bd®-üuƒ äþ*'),
('ÉlX”wÁóBõ*X§Wñ', 'wp-content/plugins/wordfence/images/sort_asc_disabled.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'OÉ§ÅþÍ*ÒXÿ²Û9e'),
('É WŸ¿H-ÀþyR9:(', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_LoginTicket.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@¶nˆ=üŸ¸áŽâ}'),
('ÉƒãBü^äÕ;Ö¡LÍ+‹', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''dö€óÊGÂY¦õÜá'),
('ÉÒ°†“2D´iÜe½', 'wp-admin/css/l10n.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'S‚^ì”—ê	{mž¿w'),
('Ê''Töò¤Qi@DèÌ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/tests/googleanalytics/test-class-api-googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üVÐ¸q¾Bš6QE³O¶'),
('Ê!&øiÆ)^þW­²ôRœ', 'wp-includes/js/jquery/ui/widget.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³iÆÔßE¦")Htùjtoµ'),
('Ê(†q‚4Pè}ý5Ozük', 'wp-admin/js/inline-edit-tax.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ€ZI=‹Sƒg\nØœ'),
('Ê;{ßF¬/wÀgCÇ', 'wp-content/themes/hexa/js/customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Apm_,`Ã‚H\\çÖ;5'),
('ÊP9)6¥Öx¸hf¨[1HU', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('ÊR±­ÙÑˆé°Þ¿¾0', 'wp-admin/css/themes.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿\n¹Ö1£²S”Û]†oÁª'),
('ÊhFM<@`%q-ãæ', 'wp-admin/includes/class-wp-filesystem-direct.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a¶·¶môè%ês)³¶—W,'),
('ÊxjPÕö¼¨Ù!cÈx', 'wp-admin/plugin-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Cv0–fáª§iRüK'),
('Êxí£CôìuÖËì+íÖZ\0', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Rest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'UhðÀ{˜gÀ	qKO]ãÀ'),
('ÊŠbm:°Iy3’ªè’', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-most-stocked.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' <Ø8å''€k°û\rŒ—'),
('Ê•5Öý·\rYÚ9KÖPV', 'wp-content/plugins/wordpress-seo/admin/pages/rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9€¿;«· `õ`hy4'),
('ÊœA0¸r0)…{²©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/js/common.js', 0, '|h³‡XGR/¯Ú(öÐ­', '|h³‡XGR/¯Ú(öÐ­'),
('ÊÊ\nóðJ.Šå©– N¿', 'wp-content/plugins/theme-check/checks/links.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ö‹Î	&Á•Pue'),
('ÊèMËaNîšù`´:¸,Ö', 'wp-content/themes/twentyfifteen/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘V|}ˆYÒ½Ñô2Û½'),
('Ë}*‰|Ä’n ËŠ?dˆÆ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/RedaxoInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘F[|.Ó1×Ðxë	&XfN'),
('ËÚe¸ëä« «žüÄö', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/readme.txt', 0, 'äP	¢§HÌçºWÇ', 'äP	¢§HÌçºWÇ'),
('Ë!¢#ò°ÕI|‚ÛFé', 'wp-includes/js/tinymce/plugins/directionality/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*ÇV …šÊ¬ Hyõ'),
('Ë/#l$O7I1cE‡%0', 'wp-content/themes/hexa/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›sB®§ñÖ‹ÇÁú¯½‡›'),
('Ë1Xµ7ÒX‡0ïK^‰²Å', 'wp-content/plugins/woocommerce/i18n/states/HK.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~®~²=æçà¬Ú­Nš'),
('Ë6 <¥ÊCêï®¿¹V:(r', 'wp-includes/js/tinymce/plugins/wpeditimage/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[%PîÀÂ.…:«DÈ'),
('ËU<Ý?Y,õÏ§Ø»(', 'wp-admin/js/svg-painter.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·ò¬²Â·fuÌÎŠ'),
('Ëƒ“¶Æ*ŸßÂË£+<hð', 'wp-content/plugins/woocommerce/i18n/states/TR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kûí<ƒX6SZUDP> ¼1'),
('Ë†ªJ—XœýXÙ£—÷·', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-post.php', 0, 'Ó\\þ¤ãÖëðsh0=?', 'Ó\\þ¤ãÖëðsh0=?'),
('ËåGä¯€oe·ÿïoœ', 'wp-includes/js/shortcode.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë zÐ>1–ÙÑJÑ92µ'),
('Ë«Ñ^£õ#ÃFR­ñ~¬r', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªu\n{2/±rAú]yÃÎû'),
('Ëß”¶tþ¯ÑKõ†¨êE•', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/admin-menu-arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷ðNß{#¾Ã*µßy\0À\r'),
('Ëè6&f¤ûØÌé·ÆÛÏæ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-cache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''ŸT.³Ú6šgA›¦¶P‚¨'),
('ËëdÖI–KÆ¹ìv\Z÷0Ç', 'wp-content/plugins/wordpress-seo/admin/views/user-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©Õ€j¿„˜-/ßC±Û'),
('ËìMÝ¢ý‰³˜[‰’9GS†', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.formatting.php', 0, '\nó’IÛHæÅÂtË\n[S\r', '\nó’IÛHæÅÂtË\n[S\r'),
('ËïvíE,¿-Oä{Ïº–', 'wp-includes/link-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^’¢ÌfàÝzOlèvLì'),
('Ëñd<óD®œMapaúŠ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý³nèéx´Ùçõ1‡Ãì­'),
('Ìâ|Õ£0AŽHº°÷hìN', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-users.php', 0, 'íž{ZV‚öqãX_)ÿ¥†', 'íž{ZV‚öqãX_)ÿ¥†'),
('Ì!éLTá3•ŸiÙêxÅ', 'wp-admin/update-core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊdRóõƒpz	CÒ´n¡'),
('Ì+E½ÔÖß¼ÆÜ¸j{‹´', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-pl_PL.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J\\b•/¥JèVÎH‚ž8}'),
('Ì/ƒã!Ú÷òžîBý"E', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°ÝøÅjAßÑ7Hû’†'),
('ÌIfë­9íÍß³È;[Þ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë`iMò±1Su›AÁ'),
('ÌMÏTq&[?ýù>ì¹Šå\n', 'wp-admin/css/colors/ectoplasm/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”qÑ9+Ø"©Ñ+‘•'),
('ÌVÚ®™œÆêM¯éjÓ', 'wp-includes/js/plupload/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u&\n©TIŸzº«ªˆ+¾'),
('ÌZs™ë;ëÁ4;ªiHÕ', 'wp-content/themes/hexa/js/menus.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/2xéwB„¤[þÙvúñ'),
('Ìd\\1âEf´aéÎ¡\Zöa', 'wp-content/plugins/woocommerce/templates/single-product/share.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	8±øiÀÚÖ¹[%'),
('Ì„ûukûÙ³»AeÊÈ', 'wp-content/plugins/buddypress/bp-friends/bp-friends-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B-´eX‡žÉQ¼pa†9'),
('Ì•GL_•	LÔè]®å¿°', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nt?HˆkTIU*KÙ„‚Ì'),
('Ì½ó þ˜ŸX™$oB¹', 'wp-content/plugins/akismet/_inc/akismet.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';Q=1}¾PÈ\0É'),
('ÌÃŠ5ffÍ;,G!''öó''-', 'wp-admin/css/colors/ocean/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h‚À›õwÎ\r¿v4Ð¶'),
('ÌÇŠ·EÁv–c,îØµyS^', 'wp-includes/images/crystal/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ð]µLcãiG›fQ“\rÏç'),
('ÍgslCò 9m9FhÆ—', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-driver-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Û˜¬nO¾#€¹T:Ó1¡'),
('Í©ÿá‡p÷jÖ›`’Èw', 'wp-admin/css/customize-controls-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c:`H0šn#ÔÞÝžbæRx'),
('ÍdÝêãlP‘Oê’ùI„', 'wp-admin/network.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E‡½WjÏy)å6Uk'),
('ÍÀ¬c¨å†''6z³ÉI', 'wp-content/themes/twentyfourteen/page-templates/full-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ce"õÆmºü¶\0o‚sã'),
('Í)ÄÅäò\0Ÿe‡_Ô5=«', 'wp-content/plugins/wordfence/lib/diffResult.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'IYÁ…Y8†\\@·6d''r#'),
('Í?©uÆ¤8SV¾þ¿Q', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/forum.php', 0, 'ÄrtÔ	8¿¨ÕÈ»”–', 'ÄrtÔ	8¿¨ÕÈ»”–'),
('ÍN¡{¥ã^wD$@?\n', 'wp-content/plugins/woocommerce/assets/fonts/star.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ôv û›€ÓÀ±\0ó9…(<8'),
('Í]”pz\r{ãHÕXsƒ…0', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/style-rtl.css', 0, 'cOBÈþ½ñ¤µDÚM“Vÿ', 'cOBÈþ½ñ¤µDÚM“Vÿ'),
('Ía¢‚qbþOaIÂ-ó\r*', 'wp-content/themes/twentyfifteen/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÈj?‚\\c½K[éo'),
('ÍbÌ/¬ÆÆqÇÆ+', 'wp-content/themes/hexa/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ž0®æt‘ðoŸÞqh/ðä'),
('Íwÿ9=Ÿ_"h%’×v', 'wp-admin/css/install-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '“4\nÂÐ œ\Zè|\n”'),
('Í“ßYá36¾élç€Y«°', 'wp-includes/js/tinymce/plugins/textcolor/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡S+*P•®áÏ#Ó'),
('Í°×­G›Í£èï!™', 'wp-content/plugins/buddypress/bp-core/deprecated/css/autocomplete/jquery.autocompletefb.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}RÂõŒÇh5¿Am°'),
('Í½3Âè=£¡OÁGÄ|~§', 'wp-includes/SimplePie/Credit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…ä¡MçŒ‹*>\nê|'),
('ÍÆ­2È-mCj}±P«žž', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/.travis.yml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '=èb¬5°]ú¹Dv''\rÛ'),
('ÍÏ£öÓ.Â˜QD€39þ"', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/charcoal.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´"óíè²YýíŠßÂc'),
('Íø‰»j(gù€~jU#·Ö', 'wp-admin/includes/class-wp-filesystem-ssh2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'F y!E$J‡Û}œ\0'),
('Î<žéùZ&ßu\0,EôŸ', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-settings-api.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ê€Ñ% íOE” ÛÿÚ'),
('Î_)-ª]íËŒkO	Ã÷Ã', 'wp-includes/ID3/module.tag.apetag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý7ù¬l,äiwFŠQÔql'),
('Îe°''ÓÝ±(nöÞ0b_¬', 'wp-content/themes/hexa/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''yµ£F¤@¹ÀÇd"'),
('Îi¦N¨Í9Áïüüþ', 'wp-content/plugins/woocommerce/i18n/languages/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'yý}óÃ}¥ø¨€Fí'),
('Î´€Z‚n*ØÚ_% :&', 'wp-content/plugins/woocommerce/includes/admin/reports/class-wc-report-customers.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+µ×{q^dF“^wE·{ÅÈ'),
('ÎÅ“þúúÏ”ò=Ÿº#6', 'wp-admin/images/post-formats32.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WY~O’ø{ð+_L‰kE;'),
('ÎÏ,ÀŸ G¶ ±:Å0 /', 'wp-content/themes/twentyfifteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7°“®ÒŠÁFðæŒå½üvâ'),
('ÎÏß\0¦ )(‡Š…ÎŸiÁp', 'wp-content/plugins/wordpress-seo/css/metabox-fresh.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6âƒßPOe_Çò:sF‰pî'),
('ÎÔqŠsWº—ÅûåÐÑ', 'wp-content/plugins/buddypress/bp-themes/bp-default/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '…a¡Œ¸«ýß,Ï(<ñŠ©'),
('Ï;‡ê~j8ÄÎéì×’xR', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/AnnotateCmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ßcsD‰h%éŒ[p!˜4"'),
('Ï-Ó+ŽeÆáÔmñu"¶Ãx', 'wp-admin/css/colors/sunrise/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Áz‡ÌƒÿôåˆUN4š'),
('Ïc0ÑšŠ¶åL,/Ü', 'wp-content/plugins/woocommerce/assets/css/dashboard.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7FÇN]Ü6¤/†Ögl]Š'),
('Ïp·k‘™<òÄ™Ü»=', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/gray-grad.png', 0, 'Åý•¸ÞÄÛ‚/©£÷¹-', 'Åý•¸ÞÄÛ‚/©£÷¹-'),
('ÏuFóâ‘^Gú¥E+ˆ¶c', 'wp-admin/network/freedoms.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žú“Àp‰O~+¢~œ1'),
('Ï€tGÈ©ÈÀ‹¤D', 'wp-includes/js/tinymce/plugins/image/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó	1lgÊ’<"×4Œ!”'),
('ÏŠ=÷ÆX®¬÷bBz'' Œ', 'wp-includes/js/jquery/ui/effect-explode.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€£ÇssMŽdV‹ ‹\\ý'),
('ÏŠ&½>ú2(MØvÌÂâl', 'wp-content/plugins/buddypress/bp-themes/bp-default/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'WÁüˆä[viža¸¥'),
('ÏŠ;ççòð!üb945±ÚQ', 'wp-content/plugins/woocommerce/i18n/states/MY.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²óRÇ²Ô‚¢ýäîŸÊëâ'),
('Ï—‘ì·j–Sšãcr;¤¦', 'wp-content/plugins/woocommerce/templates/global/wrapper-start.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óWeÉ—å#úI*“'),
('ÏÂÈ­ÁHÔ¹òÜfëká', 'wp-includes/js/tinymce/wp-tinymce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7h>=ÚbHn<÷ÒªÎZ'),
('ÏÝ™ªP(™ƒÉO''E‘ùe', 'wp-includes/js/jquery/ui/effect.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·d/ ³ÝòA·´îbv'),
('ÏÝš»y.\0åöØœ¨iþ', 'wp-content/plugins/wordpress-seo/admin/class-admin-user-profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'èH+ù†Ö´ölqQ×‰l'),
('ÏãŒ\ZÃAoÓ„"Ù(-&', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'J>ê¢éšËÍÙ@''lr/ò'),
('Ð/™%*Ã*iÅîì', 'wp-content/themes/twentytwelve/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z˜¨k\\´Œó8F2YÎA'),
('Ð>›sËl›WD7õM°', 'wp-includes/bookmark-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ÄÔ!m<\rÿíÖÏéØO4'),
('Ð‡“7uõ£Oð	ç©	‹', 'wp-content/plugins/siteorigin-panels/js/siteorigin-panels.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zN „+\05â·í©¸€'),
('ÐŠË\\¶§|_ß¼ýØ‰0', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':ø>®‡=˜’æŽe`øÿ(Ÿ'),
('Ð¢’íŽ¹‚|áŽÑäØ@', 'wp-includes/images/smilies/icon_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¿Êµ	€»ä•ÛêÔÒ('),
('Ðµ7•¿É	ïœñ w', 'wp-content/plugins/wordpress-seo/admin/pages/xml-sitemaps.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ç,¸€YbÖÇ}4óHØ{©'),
('ÐºñlºÒÿqÑmÂ–ý', 'wp-content/plugins/buddypress/bp-activity/bp-activity-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ukî«ý¡’Ñ¤îÍT'),
('ÐØ^º\\¶XèPvS¬\\÷{', 'wp-admin/js/media-upload.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_f¨Œ‹äb¥fµ\n£¢'),
('ÐÜÛ¡Ï`ÌAí;Ê¾©¯Š', 'wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø™ÊPß©KÇŒÜˆ`'),
('Ñ¡u®ó$Ðw±êLÃ2', 'wp-content/plugins/papercite/img/warning.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nZ¾ÚÁk’âð,s–üÅ'),
('ÑvIu‡.>ýÅ²vª¦,', 'wp-content/plugins/google-analytics-for-wordpress/assets/js/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[Ý×p¦^ îå ªóÅ'),
('Ñ\Zúìíj>O9oà‘’!\\)', 'wp-content/themes/twentythirteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹B;–ëa`GÔ¢·Þ‰'),
('ÑMÜP†8äUkåÄT†ÿË', 'wp-content/plugins/google-analytics-for-wordpress/googleanalytics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q>É¯ë]êåÞúÙëbÉ\rù'),
('ÑR~mâL~:¹v½w', 'wp-content/plugins/theme-check/checks/required.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6‡ÊŠÍ¢PÝ§,Ò»µ}'),
('ÑX+™ùB{ü8}J°•@|', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.plugin-api.php', 0, 'ÈEœÄK’ÖˆÔ9Ù½XVûû', 'ÈEœÄK’ÖˆÔ9Ù½XVûû'),
('ÑX0ÚÖdn ~«8)rG	Å', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_admin_dashboard.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?ÃÍ9†ï''¸#ùÐv’M„'),
('Ñ_\\c9mLŠvéè£1‰Ñü', 'wp-includes/compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚)g’Ë	‰]5™Å\nb¶'),
('Ñ‡î¥j=édå£±', 'wp-content/themes/twentytwelve/js/navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n&Ü®_7Í}¼™D3ÐÔ¶'),
('Ñ«_w„„_ˆ™),½ÇUÜq', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu.png', 0, 'AVçª0et3œsÁ±è„', 'AVçª0et3œsÁ±è„'),
('Ñ±Ö€„¨ê0\ZÅÞ½–', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/Sorting icons.psd', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œ(}Õrßr<5oÜ´‰='),
('Ñº ê%|O­ö¢¼³-''é', 'wp-content/themes/twentytwelve/content-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ìžu8^PCÜ„>€¾‰Ö'),
('Ñ¾#³•cZ¬©éÍK´^}', 'wp-content/themes/hexa/genericons/font/genericons-regular-webfont.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ð“±ìr9À8e¨zæÖ`'),
('ÑÀ1±Fz,+iÒZÒF©¹', 'wp-content/plugins/buddypress/bp-core/bp-core-template-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à mp¶pÙéòµÃî™Á'),
('ÑÄ‘ÒEXXDÅñnm#aº', 'wp-content/plugins/buddypress/bp-settings/bp-settings-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' ñ½x^êõŒ²á`.ƒ™'),
('ÑÄ™aÓ¶Ž„è´_cGjÞ', 'wp-content/plugins/woocommerce/includes/class-wc-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·¡¢G¶ÅÈÆ0–k“8'),
('ÑÕvþA«]ÕˆL?°˜ˆp×', 'wp-content/plugins/woocommerce/assets/js/frontend/country-select.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºÝ¢­O&­Ñ1§ÒŽåMõ'),
('ÑÖç€øYAéVH»¼', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_desc.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆÙIuy–ÎvHÚÍ/'),
('Ñë’¥\ZËñKa©’_=', 'wp-content/plugins/buddypress/bp-members/bp-members-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Nœ¹°¦PÒ4t£¢iÖðË'),
('Ñôü¨©ß€[½Îån;Z£', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/drivers/class-admin-dashboards-graph-generate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ';A¼p:ü’iÑ9…ß<¶Í'),
('ÒJh|±”0çƒ`Zp˜E', 'wp-admin/user-edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ån65‘øìÄÊš×ìLÞ—P'),
('Ò+qK(¿e–$kœ\\²£´', 'wp-content/themes/twentyfourteen/content-gallery.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óä&ÎœQWÆ—`¤žw'),
('Ò`‰”ôü8œ"NçT¸', 'wp-content/themes/twentythirteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ª‘ø´oïGi®°sn)m'),
('ÒsðÏ]z,V§Ø8Š0', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/group-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ó­€/"’|Jorä¡Ä.'),
('Òž³åúìÇŸö	KsÍ×Ð', 'wp-includes/images/icon-pointer-flag-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '©åá¦2ñ³¹bäÄ&ÕZÌr'),
('Òª*ãÔHšª¨\n;t²û', 'wp-admin/includes/ajax-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”eèÊC`…6ülFù­ž'),
('Ò²E5|ÒÑµ‰C‚dé—¼', 'wp-admin/options-reading.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.Kþ++ÄîÏ6"8±‹u+'),
('Ò²v=–ð‹ynâòæ©', 'wp-content/plugins/papercite/screenshot-3.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™ˆTó2ö±S~þóØh7'),
('ÒÌ¾€–ä\ra›¾åg)"', 'wp-content/plugins/wordpress-seo/css/metabox-classic.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-1‰wâ-„²›ª®8}'),
('ÒÕLt593–u^˜ëä)ÙÔ', 'wp-admin/images/comment-grey-bubble-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TYÓÅ2¶s,\rõmƒ¿'),
('ÒïUñÍñÔÙòZßÁkX', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/class-admin-dashboards-collector.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p¤·Z‘vGÓš"ÝÓR'),
('Òû‘¤¦@#bbELÞ;—©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/stats.php', 0, '›-ts(¶2äKËXÏÁÌ', '›-ts(¶2äKËXÏÁÌ'),
('Ó&)-Ã¢«\ZÎ™•p', 'wp-content/plugins/wordfence/lib/GeoIP.dat', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vGi5ñÏê\\õ-7˜ø'),
('ÓE#lðÂLþæ_&Üª³Âï', 'wp-admin/images/arrows.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úv’$ð>ˆÑßÙ>¿Y'),
('ÓF.å,%}\nKÐ”£Pá', 'wp-content/plugins/siteorigin-panels/tpl/js-templates.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ãæ|S‚§Ø5ƒDñ;&'),
('Ójs¤žw2ùìp®ýqS', 'wp-content/plugins/wordfence/lib/wfIssues.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9ž”™e²Ò¡à®k7d'),
('Ó{Ú­d3TúXy½‘ñÐ7;', 'wp-includes/css/admin-bar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+N#ÒúÃ„(‚^RMj'),
('ÓŽ=GKµ‹¤ò@Vá¸S', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-duplicate-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨~Ý¿¬íkú$w²0ô\Z]'),
('Ó–r\nx™öÇ+í)ägE', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/ClassLoader52.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È¹	â¦Z^ÎÄ+Á}iô˜'),
('Ó©aŠFGõãµ5ßùÜû‘”', 'wp-content/themes/twentythirteen/genericons/font/genericons-regular-webfont.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ø?''ûý ÖK¢®>ªô±Ê'),
('Ó¹ò°''?meU!É-2Åv', 'wp-content/plugins/woocommerce/includes/gateways/paypal/class-wc-gateway-paypal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ª³¸äéú\\àíÑ£’'),
('ÓÒcÝÅ˜³BŸ™üíp¯"', 'wp-content/plugins/woocommerce/assets/js/frontend/jquery-ui-touch-punch.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YL£xŒýk¬bÒ‚K¬'),
('ÓØ¯xÖÓ^ÀÈ¬0MË¡ÿ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/MicroweberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hf6}2w‡ùdÿúÕqà'),
('Óâ³>Zbµo&ÂÔ', 'wp-content/plugins/akismet/views/config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'kjÞº\ZD•_7èøÓ'),
('Óî”x\Zä¬ºí¤·—Ë×', 'wp-content/plugins/woocommerce/includes/class-wc-cache-helper.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']oËÄQlm;«ƒÃ¬ì6îp'),
('Óö)*Õ"œªDh', 'wp-content/plugins/papercite/format/harvard.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Úô@·°¾<¸œq½×78L*'),
('ÓýN\Z?¹>Åo ÿÜS', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zå™æÉ-ófm¦Ö™'),
('ÔèòÿåÍ0*îWÇÔ', 'wp-content/plugins/index.php', 0, 'gD,Vë§=\\ÆbP', 'gD,Vë§=\\ÆbP'),
('Ô€†ªÀ}×vÏ£þGÀ', 'wp-content/themes/twentyfifteen/genericons/Genericons.eot', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'â†’–ç(íÈ7k¤j'),
('ÔæuÜ&?þîy', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/views/script.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‚DœVOG—ÇÒp<¶3k'),
('ÔHdKÖ%9ò§`UÓR', 'wp-content/plugins/buddypress/bp-core/js/jquery-cookie.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûH7ŠRš\Zª9{Õ£*'),
('ÔH}ôFIåÒë¸IšÈ•', 'wp-content/plugins/buddypress/bp-core/deprecated/1.2.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'clñ*,mqï)@Ñ´'),
('ÔJõ°†3éKáag¯˜«s', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-fa_IR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')Þ5d÷Æ¾^"þäû&Ò'),
('ÔW\ZeCô¯è¨DuÞÀ', 'wp-content/plugins/wordpress-seo/frontend/class-twitter.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ólq0S»8²YL^†`P'),
('Ô].õooðÈ¦M-n	‡', 'wp-admin/images/align-none-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øXC™)[×°›-º4½'),
('ÔšrÐïy2ÈkŸAì', 'wp-content/plugins/woocommerce/includes/gateways/paypal/includes/settings-paypal.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õréºdó¶öû‹•twU`4'),
('Ô¯ÞÔöƒØ‹°ÕíbÖ³ý', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MicroweberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hf6}2w‡ùdÿúÕqà'),
('ÔÄ<¢WÄ	\ZM^÷D¤q', 'wp-content/plugins/woocommerce/includes/wc-conditional-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªò*B=xKŽû»2.ä«É'),
('ÔÈ†pŸþÑ]4ÌÐLñÄq¦', 'wp-includes/css/admin-bar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†Ú©±1°Já-8Å’í7'),
('ÔÊpÿýS•š`ß]T]DÈ', 'wp-includes/css/dashicons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³ÏŽS\Zœ»yR‡zC¥Íd'),
('ÔÛàÎèÁ·b¯B³¶½', 'wp-content/plugins/woocommerce/assets/css/_mixins.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'áîožoþbq˜W`ú·'),
('ÔòÌÓ—JÕ%¥%hÄcá%', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/forward_enabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨Æd¸!ŸýéxÛ=ƒq9u'),
('ÔøP¶ýL.6ö6y<ÇÖ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/HuradInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‘U-07ÜÀì\n}m•\\^'),
('ÕXéð¯—$„a²ÔBÈÒ^', 'wp-admin/js/user-suggest.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à‰T\\×üÞ\\|×\rã§9á'),
('Õ&d\0¹Þn%…ú>öÔÔ', 'wp-content/plugins/woocommerce/includes/class-wc-geo-ip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'bA„§s*¡Lêð¾Í Ú96'),
('ÕMûÇ]>N¼\Z4¥?¾’I', 'wp-content/plugins/google-analytics-for-wordpress/frontend/views/tracking-usergroup.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nª©#<3}†KºX°Ïx‚o'),
('ÕŸþS<t¤/fÞ+"‘Í[', 'wp-content/plugins/woocommerce/includes/libraries/class-lessc.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ódç¤*eè†¨›’;Ú„'),
('Õ·ë5ÚCÍÖE/.ŸQ', 'wp-content/plugins/woocommerce/assets/images/icons/credit-cards/visa.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'L¼¶evqKL}ÎéJ'),
('ÕÛÃãœ Z¸/:^ $Ã	', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Éì¶dIºÕæ^sèÍllû;'),
('Õç¬ŽÄÔ¸Üs˜Ô*	²', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/login.php', 0, '^\0ë\\ÑdhØðØ¨N“Õ', '^\0ë\\ÑdhØðØ¨N“Õ'),
('Õð¹gÞIqQsu±Ÿ\ZðeÄ', 'wp-content/plugins/papercite/lib/BibTex_osbib.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?Þo-ià“…8üêÇ‘¨â'),
('Õö¼úÍ¤6é\0/ý“kúÀô', 'wp-includes/js/imgareaselect/jquery.imgareaselect.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\00ÔºLBwm#Âãwu‡:'),
('Ö -"œ?TD¿_²m°±Œ', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-reports.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ùÝýâ$f÷Xþn¬sîQ'),
('ÖnIm[£_ózl¯ç¿‚', 'wp-content/plugins/woocommerce/assets/js/frontend/chosen-frontend.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&Sµ>Û¦EÝX¯Gß¾''¯l'),
('ÖZ×ö	r!ÞfÕÑ¾	Þ', 'wp-includes/images/icon-pointer-flag.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°Ó,‡ò­‹ÂE^¿j`'''),
('ÖoÒ¨*Kîêo˜7{ƒ <', 'wp-includes/ID3/module.audio-video.matroska.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÂY‘!•Z0zDj&Cpìž'),
('ÖrYŸS¯xwDYËšJ™[', 'wp-includes/images/media/interactive.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R×¬Ë‚®ñÂÃ´Å‰hÜH'),
('Ö…|6pG6ŒH†)/m;', 'wp-content/plugins/buddypress/bp-core/deprecated/js/jquery-scroll-to.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`k·Ï/a<¤ô1iíªìRÕ'),
('Ö q	áèBqÊŽÆ¼«', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_both.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”³Oõ"K£‚Öv#»\Z'),
('Ö³)öØ÷œvk›''ˆ\ry5', 'wp-content/themes/twentythirteen/genericons/genericons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÂÊ4b‰Ø-¯+l‘ö'),
('Ö¶Ëå9Øžføpo3t', 'wp-includes/class-wp-admin-bar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñÝã?í“ÙÓÐ\Z^WŠÎ¨'),
('Ö½¬BŸåm²OÐ*ƒ:qÉz', 'wp-content/plugins/wordpress-seo/vendor/composer/ClassLoader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œá©ë“à~äB¥6'),
('ÖÏJØûï!¬[W6Ý§éý', 'wp-content/plugins/wordfence/lib/IPTraf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŽÐtƒØQ.qÏ=è†«'),
('ÖÞë07¸eï	õÓŸ\n£', 'wp-content/themes/twentythirteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŸÂßÉºæóååº–ƒ4'),
('Öçãv#ï9÷Ðò)?Ip×', 'wp-content/themes/twentyfifteen/content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?<hžšÖ>C½¥BqÐÎp'),
('×\rn8#Ã”úØ9’ú¿ö|', 'wp-content/themes/twentyfourteen/images/pattern-light.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿi¦ý¿Gp³jˆ€¿SÝ¨'),
('×Qî«–ä,Äv¹7', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Coupon.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5o¨½Ø™Ä™:,fÏÓI™'),
('×"ÉÌƒtq)Õül@;Ì˜', 'wp-content/plugins/woocommerce/assets/js/frontend/lost-password.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$ý¼¯¾˜d‡}²ÏˆAÔ5'),
('×GÈ©õï¿6”¤³È\0Y', 'wp-admin/includes/class-wp-posts-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿiÞ*\nÞã]ZüÈÓÚh');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('×|Âô½SöRu®[\nÎ', 'wp-content/plugins/woocommerce/assets/images/placeholder.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ê/˜Ð1IÔcžªfü'),
('×‰›Ã\ræ“¬xCyÎqâns', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/DrupalInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ³w#ÞÖRímR)Æâ§Îâ'),
('×ž”y„7mE5ƒ…O_Á', 'wp-admin/js/media.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ‹\ZPË¥ðd''ÿà1(É'),
('×²2€D¡É»&-uóõ	', 'wp-content/themes/twentyfifteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'B–5ÕäŒ^›\0™`Cþ'),
('×Çj0–©ÞwþE}Â®RŸ', 'wp-admin/css/wp-admin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ')„9¿ˆ„2çEp¿\0'),
('×ä^Ëu©­âË}G»Ô', 'wp-content/plugins/wordfence/lib/email_unlockRequest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶ ÚEÛ28.63Rºí¸'),
('×ñÚM§…žéR¡Nßa ó', 'wp-content/plugins/wordpress-seo/admin/class-bulk-description-editor-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%ÆúóiÿªËÅe·\\ÚÇÖ'),
('ØÀ\ZvŒI:wmä²''~K-', 'wp-includes/ID3/module.audio-video.riff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î‚TfbpGOÙ-â'),
('Øå_ÜÀ#<BÜ½I', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/admin-base.php', 0, '''V»öŠó/^}&ÛÿÍ¼x', '''V»öŠó/^}&ÛÿÍ¼x'),
('Ø&ãZhÍ$›Ã‰o‚', 'wp-includes/class-json.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LòSA‘ŸÚÍ„¬áÜ%\Z'),
('Ø8/B±$8ˆÏ`mœ', 'wp-includes/js/imgareaselect/jquery.imgareaselect.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U¦·ûK(t—Óü0‘—Î'),
('ØA¯h)Iˆ\Z]GrÞöƒE', 'wp-admin/includes/import.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9[o.•IÃRÑýÚ\rkH,'),
('ØE®Yòá: Œèß»°ýM', 'wp-content/plugins/theme-check/checks/content-width.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '%3®ÊÚ©£!å`P1¦'),
('ØM&3\rÜÁ3CMaQ{', 'wp-admin/images/yes.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä+ø¢7Ü‰—\rqZèQk'),
('Ø_Í`O¿/é‹G\\0½Aþ', 'wp-content/plugins/buddypress/bp-xprofile/bp-xprofile-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ôù^$š1eÃhãEµúcz'),
('ØeO+ ]jqòÕtð"]', 'wp-content/themes/twentythirteen/genericons/Genericons-Regular.otf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ñ1k¶\ZNØØ+ˆ>„'),
('ØoÅÇ£ž	×£áŸf0¿Y', 'wp-includes/SimplePie/Core.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤®©#¸òÜ÷âÔý\ZÒ'),
('ØvõýãÆ\rêû´&X‰', 'wp-includes/js/jquery/ui/selectable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦GýPè’ÑH¿wú¸†¯Ò'),
('ØV\\=lS©‹l¿Jš&', 'wp-content/plugins/wordfence/lib/menuHeader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'vB©¾p_0*«k8¿oG'),
('Ø•‚öìJ‹¢7aüù?Æ', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'u"y«Ä!¾ë.q-Ÿƒ÷Õ'),
('ØšZ…³úûÆ˜‹ûcôŠ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg-side.mo', 0, 'õ*/ ŠtÃ±½LEœèF$', 'õ*/ ŠtÃ±½LEœèF$'),
('ØÇêµÌ_nZW3Ñ%HO', 'wp-content/plugins/woocommerce/assets/images/storefront-bg.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¾˜»=Ö²˜(kZü7ò'),
('Øç˜=¸¦±Òõ¹eù,ÁðÌ', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[7<ºý ;.Åÿ°+7É'),
('ÙêiÑ§9$Ä¢ÙzÆ', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-menus.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '<ÿüXëa\0ælÄW:Y'),
('Ù,(¡i7:^Ì^ç‰#', 'wp-includes/js/tinymce/plugins/paste/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r|í}N3ûdº=9'),
('Ù;å:Ç\\¢4tãYB·', 'wp-content/themes/twentythirteen/css/ie.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†¬µ<	¡v…qÂ2	«µ'),
('ÙJàïš^\Z7ü•uG–k+', 'wp-content/plugins/wordfence/lib/wfDB.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óþŒÔ$y¿¤''¿ZêÂN#'),
('ÙdTÒ…:C9$öð ¼Î„9', 'wp-content/plugins/woocommerce/includes/class-wc-customer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LGÿã{ÿûMk ¨l>|7‡'),
('ÙkïÛ/yž³©ý›&‰ŸG', 'wp-includes/images/rss-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇYa[ QÁæõ—ýrj'),
('Ùs[ÛcþˆŠÞùë', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/topic.php', 0, 'hdã\ndÄ(+æùœ%eü', 'hdã\ndÄ(+æùœ%eü'),
('Ùw¶›v?,¡µÑ†›‡', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/pomo/sample/languages/bg-side.po', 0, '_“qÛ…¤°M¦GÇ˜Ï…', '_“qÛ…¤°M¦GÇ˜Ï…'),
('Ù˜Ý"P´Üž÷Æ,ƒ©Ø', 'wp-content/plugins/wordfence/images/icons/ajax24.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'K:û„²·õmð™—£P½'),
('ÙÛÊ­cžšcÿLù“en', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/cacerts.pem', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\r€oÜ«ŽÃ\\·Ü†Ò'),
('Ùë¼!}ñ=ö`*„gZ=', 'wp-admin/network/themes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&°”nmZo=Oß{Ão'),
('Ùþ>Ï~ä!ðªgÅq‹˜', 'wp-includes/js/tinymce/skins/lightgray/skin.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á-ªuw*S€À¿ÿ®-°]'),
('ÚNú2ŸˆÚ_]‚]ôßb>', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-webhooks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9‹J°h¸#‘YÁi§dÎ8„'),
('Ú¬úÿ;Æ-qu%ùS\Z	n', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-api-request.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2~õ0é+u“oÐcïI('''),
('Ú†wú=Å¢ÄOú&¹FÊ', 'wp-admin/css/colors/midnight/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '&ÜªðÄ|DW¸¼!Eô†4'),
('Ú''µÉÍ¾¦<š–6™ÉBt', 'wp-content/plugins/woocommerce/templates/archive-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"HÆ¿¥HµÈ5¤D\nèˆ™'),
('Ú\\\r~Lº5k¦ƒp\r`ð)', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'TÔJsøwôlAÐ¡X·†'),
('ÚaI¿ã_;$ýÉŠÈD÷', 'wp-content/plugins/siteorigin-panels/widgets/less/functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M9•”Uþ¶WÝºäLg¨'),
('Ú|À#éÔ°#{•ÄþŸá', 'wp-admin/js/link.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ùÿF”“0“;ÞÂÁ3²%-'),
('Ú…ÆÎ·¹+	v\rI¹Ó', 'wp-content/themes/twentytwelve/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈAšé–pk|q‡ˆA¼ß'),
('ÚÇ–ŸKdš 3×LiCá', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/forums.php', 0, 'å-óñt=D¹ùÔ¥p]Á§\\', 'å-óñt=D¹ùÔ¥p]Á§\\'),
('Úý!§(t”ò‰<Ô¹', 'wp-includes/js/heartbeat.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ì â	™1Í]°d*DËG'),
('ÛãŽ_\r¬JLè#®@BÌÖ', 'wp-admin/css/colors/midnight/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"œÓþâ+ŠÂ¾0ûÝ'),
('Û æIÙ_X²Óš¼¨?', 'wp-admin/js/gallery.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜oãºÏmâðÜdOo'),
('Û$¯…w¿™^š(×;p#‚p', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/styles/simple.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¢ún8	ArÌ8EcÈgÏ=+'),
('Û4ú5NØÍ~‚å<Ú(lÌ', 'wp-content/plugins/wordpress-seo/css/adminbar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­ÒõüWû ‡¦Áõ%£6*'),
('Û>TÁXôËWYZê“l›¡', 'wp-content/themes/hexa/content-single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'fªÞKºœƒÀt:`'),
('ÛL&-Û^ì€=@È·4õ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/price-box/presets/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',SæRì¿JÈ<Ç.Ÿ'),
('ÛgáË‘\0|—Õ7D½®ºìd', 'wp-content/plugins/woocommerce/assets/images/select2.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',¦vâ SWØaZ¬I\0'),
('ÛvyÜ¼SËx„t7Ô^¾æ', 'wp-content/plugins/siteorigin-panels/widgets/img/checks/pink.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '!Ñ­±ü ¶¹r€0'),
('Û•ÄúÖˆQc@xÅž', 'wp-content/plugins/woocommerce/i18n/states/NP.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@ *MÁÍ}´½‡1427Æ1'),
('Û•°’|"D­,+]l=', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/KirbyInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0¿57Üš\\Ò¢Ê®«DðÿM'),
('Û–JBw…C˜¡|Môv', 'wp-content/plugins/wordfence/lib/Diff.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R|Ð$¹Èìç©V;Pà“âÙ'),
('Û 5®ƒDê˜ŽÎËµ>mD¦', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-images.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}uµR"@Å½wŠ+ëÀÜ'),
('Ûªòê÷	.æÕ¸ß\\¾ò¯', 'wp-includes/js/tinymce/skins/wordpress/wp-content.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'öÂÐChC¥ª\Z³žëea±'),
('Û¿ö³Šn\06V\r+4%ÑÌ€', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/groups/invites.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—?Ät—…é³ÔÓf‡'),
('ÛÈrš¼ÁµØ=ÔÔ’é', 'wp-includes/images/rss.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥°[¿(ò”°.ý”*NZ¸'),
('Û×mÛâfîH¶æ5ŠUQ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/MediaWikiInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡#Sé]³r·ýò\ZÅHÔ'),
('Ûß\np¡ñÓGnu:¢¸Ó', 'wp-includes/js/colorpicker.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðÊV gô„²¶ùŸ-¯'),
('Ûâ©„96(n´¦íL£˜;', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/jquery.zeroclipboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/¡¾,Zª'')˜h#»É&Ä'),
('ÛävPiZÞ´8Wù°ü°', 'wp-content/themes/twentyfourteen/js/html5.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z˜¨k\\´Œó8F2YÎA'),
('ÛîÂrŒxÜáïÑÌ7Œ', 'wp-content/plugins/woocommerce/includes/class-wc-emails.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡â¹.×Ùõ:š)ÄVwù'),
('Û÷L=f3,$ÿ_èÏf‚ûÃ', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-scripts.php', 0, 'L·Úì2„ÛYžùùü', 'L·Úì2„ÛYžùùü'),
('Ûù«³oÌ]xÊÙ˜¥™ÀF', 'wp-content/plugins/woocommerce/templates/single-product/product-image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ko¥©— ½Z”õ-0'),
('Ûú¶\0WÆ©JÞ6i¶òw', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/large-play.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£QÔŒEå.Ûç€¥Øø×'),
('ÜÈ¼‘ØŸÜ''\r`ùôÊÎ', 'wp-includes/feed-rdf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú<CÿöòH¼,D''¤Ï7i'),
('Üp÷D–t(!-G¹Ú>ˆ%', 'wp-content/plugins/wordpress-seo/images/Video_130x100.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—œþê¿ùŽB¬>}ˆmR'),
('ÜÖ—äÃ0cý­¿j6‡¼', 'wp-content/plugins/woocommerce/templates/checkout/review-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']¬ŠLÅô”N¾•ÓÜŠ²Àé'),
('Ü2Gý?¦_æü\\èÆú-B', 'wp-includes/canonical.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ç×ø©‡ïÇ¼|Êö€N€e'),
('Ü;¾A¿ÍPÓZžày¯­À', 'wp-content/plugins/woocommerce/assets/js/frontend/address-i18n.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'þåêûïJdÕ‚À+'),
('Ü>Ú¨\rò;ó,žlY5¨o', 'wp-content/plugins/woocommerce/includes/class-wc-install.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’=‰<}qz‰êûRXr'),
('ÜF|\nµMN,8‡Ýªª''é', 'wp-admin/css/press-this.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýB]£ìB•‘RT÷4÷'),
('ÜP#Õ\\õ6â\\D‚ÏÔŽ', 'wp-content/plugins/buddypress/bp-core/js/jquery.atwho.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '?â­Ü‰k‘JQZ¾¥÷ys!'),
('Ü\\ÿ Þ~›ÇG½ÿJ<ZåÉ', 'wp-content/plugins/siteorigin-panels/inc/options.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X-Š h»yAÈÅd¾<\nÈ'),
('Ü©þ]c\Z‰êOª*ä§`ð', 'wp-content/themes/hexa/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'éÉðGv9;ÒhT<R€ì*'),
('Ü¶Oä;hTI¥œ™ÒØ', 'wp-content/plugins/woocommerce/assets/images/icons/edit.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nÈÌÆ»3„²aòó–+–¬'),
('Ýº\r\0FJÈä–BáÞeç', 'wp-login.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'IrjÙÍ|C·Dí—Bµª'),
('Ý4_;†ßð¸g°Ñ™ëÚÈ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/autoload.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Óú‘úÙ§¼-í®Ìk,'),
('ÝJ0Ïõ§Éj YgÚh£', 'wp-includes/js/tinymce/plugins/lists/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''š[ù?(ûÑ¶Ç|'),
('Ý[6»5€„+È	án9ä', 'wp-admin/images/sort.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '.ŠËî™¿¼¶ÔlHj™]'),
('Ýf…ãyŽü¬Ä§—*!', 'wp-admin/js/nav-menu.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Å0wXçÍ¥k·!ê­E¶'),
('Ý{fZ¿µüß¥›—¿	äKQ', 'wp-content/themes/twentyfourteen/images/pattern-dark.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºE½¾[ý.Æt5Õá­\0k'),
('Ý–yá½ïÓìU…xM¼	¤•', 'wp-content/plugins/woocommerce/templates/global/quantity-input.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'èÈ:HµZßírY§»GXæ¯'),
('Ý¦:î{˜Js×E,Qìa&', 'wp-content/plugins/woocommerce/dummy-data/dummy-variations.csv', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Z1ÒèªM¬_À°2rãï'),
('ÝìÃ3öšEÚØkWú-@	', 'wp-content/plugins/wordpress-seo/admin/pages/permalinks.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž_{ŸâšãK!w&„¤›'),
('Þ3^ëËPMŸY˜æíHˆDØ', 'wp-includes/js/tinymce/skins/wordpress/images/video.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÐÂ¶÷ B©=\rz»ƒ3jÁ'),
('ÞDwµy·Žÿ3eÿz˜Èø8', 'wp-content/plugins/woocommerce/woocommerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'o8zØ—è—ETÏ4àäHÆ'),
('ÞNÄ\\ü|ó`*·,)@4', 'wp-includes/images/xit-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°rœT½Ä`Ÿ¯?JÐ/Ç'),
('Þ^ÏK^»8vÙ8ã§ëÐ', 'wp-content/themes/twentyfifteen/content-search.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ì¥<CUyûQ’OßÄÌbÏ'),
('Þj¥K¬­«âKÕT\r<êóè', 'wp-content/plugins/woocommerce/assets/fonts/WooCommerce.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6¶PIû?ÏÌÆVÈF»cF'),
('Þ„ápþö´¢AuN©Š', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.passwordhash.php', 0, 'áx9ùpØxµ\\º…Ðò‚', 'áx9ùpØxµ\\º…Ðò‚'),
('Þ Š®÷±—@wÂˆçc!‘', 'wp-content/themes/twentyfourteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/¹Pª—¦d+Üˆ»Þ|ù…'),
('ÞÞ‹³­”1FóøëÛa“', 'wp-content/plugins/wordfence/lib/wfArray.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'úÚe¦my¸†VôM¼\Z¬º'),
('Þé''g!Ž:–H™î),¾', 'wp-includes/SimplePie/XML/Declaration/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±Úp(Ã…»BÉös#b'),
('ÞëmñæÏÛÃFÀ’áµ', 'wp-content/plugins/woocommerce/assets/js/admin/woocommerce_notices.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'RöðéÁà=£ƒsðTáÑ†­'),
('Þòæ`Ÿ‘BE¿\rDwì­¸', 'wp-content/plugins/buddypress/bp-core/css/admin-bar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×)ÊTðæ-	Tâ²‹¼æ'),
('ßàÒÁ"‰»–¾Íc)jÛ"', 'wp-includes/js/wplink.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤Õ‰0ÑË Š3å9í#'),
('ß2+gO0²î„8,h‹â', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.core.php', 0, '×PÄÏPß=PË	ÉîüÊŽ', '×PÄÏPß=PË	ÉîüÊŽ'),
('ß=Fh3{DW}çû!b“Þ', 'wp-content/themes/twentyfourteen/content-quote.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ždÔëÛkñûI9<ª'),
('ßFI@OR}’täÆaédW', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-webhooks-table-list.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä—Á¸Fì§u¦À`ÿÇ'),
('ßLßÄ1.Àðd&ýEÖ]3W', 'wp-content/themes/hexa/js/skip-link-focus-fix.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍÐì¤!EãfCç5'),
('ß`Á9Œ‡Àv"Vs/ý­¢', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/SMFInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ôIÿ0¸mj@0Ý%øUø'),
('ßgŸ›]ÂÒ¨[ÚÄâæ°', 'wp-content/plugins/woocommerce/i18n/states/IT.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '-íæùwÐ£Ô¸ƒæq'),
('ßq‚ùœŠ%Å±“ m+', 'wp-admin/css/colors/light/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãÎë”f½‰º^ç‘œ¨_'),
('ßŒò‘(ƒ©©‰ÕÛ2áè', 'wp-includes/js/quicktags.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rz\0ºj¢7%Ý\Z 4'),
('ß–/ý2¥Z¢{¬6»à', 'wp-content/themes/twentyfourteen/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Gm•ýY­Ó8œ8'),
('ß—ÏQµ¦uâ!Ù¶x•[', 'wp-includes/js/wpdialog.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ò-Ÿ¥»\0ºg\r¨FÄ¡¾'),
('ß½u”î2m³Ëå¡w‘³F', 'wp-content/plugins/woocommerce/includes/api/class-wc-api-json-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µþBô³ªAJˆ0y¿É‚'),
('ßôóE"œ,V1‰=Yè§É', 'wp-content/plugins/woocommerce/templates/emails/customer-completed-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÌ;P@vgÓÊÇžÊœË'),
('àÔÈ6®´9&“µÍøÅRï', 'wp-content/themes/twentyfourteen/css/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'b$•™FS4–M‘Rá;'''),
('àW".:ÝfOˆïøõ', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/composer.json', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '+~9»;ÚÒÀ#Ï\Z4þ&D'),
('à&pïÀ[£Ú½?Î¦Ñ', 'wp-content/plugins/buddypress/bp-core/admin/css/common.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'í¼2d­“Ï\Z±»Žƒ:'),
('à%çf\\+,…æÍ\0\\Y', 'wp-admin/includes/class-wp-filesystem-base.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	¨½ÿ%?ÏØ¥b×[Ò'),
('à\\F±Ñ2f¤m\\Õ«•+Ü', 'wp-content/plugins/buddypress/bp-core/bp-core-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±ç<NÙ''¼qt‡¦)J2R'),
('à|¤óB¿ýÇéã5Y“è', 'wp-content/plugins/wordfence/lib/menu_sitePerf.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Í¿"Žãx<ó%ùâ“+õ4'),
('à‚Âö·ð’¿Ÿùˆ·¢’', 'wp-content/plugins/papercite/screenshot-1.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—ògà0RzN,d¥IÉ'),
('à¯®NN’Ã%dB8¾ê»', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/view.php', 0, 'Sšeä³‹Â\\TTªõJ%;', 'Sšeä³‹Â\\TTªõJ%;'),
('à¹î¯™3A°ƒ8#', 'wp-content/plugins/siteorigin-panels/widgets/widgets/testimonial/tpl/simple.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ß«‹ŒÒÌh$ÉoG[ö¬'),
('àê\r\0SêQÿúc\r¤', 'wp-content/plugins/buddypress/bp-activity/admin/css/admin-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Äçü4x²Í¶ÎÕèáù9='),
('á©^ºûbR–åSIá!Ó?', 'wp-includes/class-wp-image-editor-imagick.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹è•‡®òž	$,öGò'),
('áA	!fYëj=	qQ|H', 'wp-content/plugins/wordfence/lib/menu_sitePerfStats.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0''º+êHÖÁ	ˆ¡™£i"'),
('áH†£©†7åæ±™âK', 'wp-content/plugins/buddypress/bp-forums/bbpress/favorites.php', 0, 'Ácç\\FYw¡7s/Z', 'Ácç\\FYw¡7s/Z'),
('áKf5íÖ**Ÿ÷Û¿î', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/.hg_archival.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iì8È[æ0®éåãõ?[L'),
('áYÇ	ó²×[RŸ	d•!)', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Model.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'žüOÊœIÿ,‡ê/À–'),
('áZ±Ž®(>(ª1bÞ«”Zê', 'wp-includes/js/tinymce/skins/lightgray/content.inline.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VBup=‚ú;©±™t70Àk'),
('á]CßSODpÔbsds', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/ShopwareInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÝÞ¹M+Ä-¼°¢6æ\\f'),
('áq@/»¹ê¦‘Ùž-MË', 'wp-admin/network/site-users.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õÞ´"Ç”Jƒm$œ§Ñ/'),
('á€HÐ¸þÅo%p“k}äá', 'wp-content/plugins/woocommerce/includes/wc-template-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µ#È2‘–OÏ¯‘òÙ‹"'),
('á…Éo2n2Œ}Þ:õ—ª…', 'wp-content/plugins/woocommerce/includes/class-wc-language-pack-upgrader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1™z„WÜ¾„ˆ¥Ù¿WA'),
('áÊJ öA½îv1heÈ', 'wp-content/plugins/wordpress-seo/css/yst_plugin_tools.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Kº¼P_MMÑ\0›VSÀW'),
('áñ\\9Ã£>œŸ„Iz4“c', 'wp-includes/js/tinymce/plugins/hr/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '´…<Ú<{LU798ìÛ†'),
('âDëÁ«ä', 'wp-content/plugins/woocommerce/templates/checkout/cart-errors.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üm#û\rU§Œª¢"m€Ç'),
('â *ñs\\áO“éilê', 'wp-content/plugins/wordfence/lib/menu_scanSchedule.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qyªb™é¥åáŒ1ôˆ¼s'),
('âEÚ‘u«µh¿»†áýë½q', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/WolfCMSInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'LÄœÂÒL¦Èr4òr'),
('âL¶>ÙŸ‰#{6p}YãÎ', 'wp-admin/options-writing.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¯eŒŒcþ\Z\n•6úPK–.’'),
('â¼÷|`Ó‡»‘,€²&', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-addons.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9p>¡£÷\r;¨cTúJ”'),
('âäÄ¸:ß,p´1¿ÛHr', 'wp-admin/js/dashboard.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ü¯Oh|lR<ðâÕQR4ú¥'),
('ã\0¼•×•oxi3%\r+]kg', 'wp-admin/images/post-formats.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÜKÿáÑ\0“äÙ%3¨Öº'),
('ãð§|èT{‚ŠâœžÊ&', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/ajax.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†ÄMaÕ2üWÐ¿µZ“¶<'),
('ã/}É™´¼™$nù¾r¥', 'wp-content/plugins/wordpress-seo/images/banner-woocommerce-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š°4•E,ÂaíìòþÑU@'),
('ã0—;ê-,ÓAÞEyæ', 'wp-includes/theme-compat/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>\Z¿¥ü"}Wuoª†„.H'),
('ãL$@ª³]½½š%+X', 'wp-content/themes/twentyfifteen/inc/back-compat.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a¿ÈÈÀÄ× š[Ü`z'),
('ãaÝOj''÷Å»D*ÖV4', 'wp-cron.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ï*ædb¿iDÃxìZù'),
('ãeË¿ìfièŒ˜`²Ó\\', 'wp-content/plugins/siteorigin-panels/widgets/less/mixins.less', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':\0Øvøjã+½ü‹'),
('ãiüŸHêúë‚i$–î)Ÿ', 'wp-content/plugins/buddypress/bp-core/css/admin-bar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'nœ9±ÿ^µ—x‚•ôVà'),
('ãáqÕ82½úvÂ&#M', 'wp-includes/js/tinymce/plugins/wpview/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '–”ž×ä5ãNv§ll:€×'),
('ãä±ˆ˜\r©¢œw3Î¹9Œ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/JoomlaInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ²ŸŒ\0fHpg!N¡OÝ'''),
('ãìó<kUJv%ò1‚‡', 'wp-includes/fonts/dashicons.ttf', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŠEz{C7|é2í•'),
('äw¢ÍÓÖV¥Ðë¼!Ü', 'wp-admin/includes/class-wp-ms-themes-list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(í''½©O»Sdþ¼àºÁÁ'),
('äm—]œc‹8”µ+œˆ\ZR', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.wp-http.php', 0, 'ÎèYŸú*5äÆˆjUÔE', 'ÎèYŸú*5äÆˆjUÔE'),
('äry @rÁ†tžcåIF', 'wp-content/plugins/woocommerce/templates/single-product/add-to-cart/variable.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'SÛÛG@&Ú\ZLmöKF*ñ'),
('äx†…ñS—L÷WÓ0°\Z‰²', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/friends.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'koÚá0i=ì	E-ùxÖå'),
('ä“¼rK\0½¦ÒåvOMµ÷', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/forums/topics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Û”ˆ÷“ì2^‚ˆÚÃÜ{´'),
('ä¬I*yué•)Bàæòw', 'wp-content/plugins/woocommerce/templates/checkout/form-billing.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œž¿»iÜ÷1ã]ƒ¶çvø'),
('äÍÀº‘.‰­1÷eˆ£%5', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûÌ";™E×Ø’¤Î™ b'),
('äßæ¨ÞzpKC²{\\>‚ó', 'wp-admin/js/dashboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9ösE¡/¯\Z<SÉ(ŸÅŸ†'),
('äà©š‰|n¦ý¿§|Ñ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/tests/Composer/Installers/Test/PimcoreInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§;¶„1‚¢cHç$Gš$½â'),
('äê¿1þ]ÃM|®KÔFZ', 'wp-content/plugins/wordfence/lib/wfBulkCountries.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}ÚÃìMìŠ±¢³ò_#9'),
('äö\00‡ùqŸÄŠNy)”Ô', 'wp-includes/plugin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':±&å­Âþ{Ë*€‘ƒrH‘'),
('å\rë`}xJKsÊ©øªû', 'wp-content/plugins/woocommerce/includes/updates/woocommerce-update-2.1.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šÛjŒÛÁbÑJ"+Ø`š$'),
('åÍ„q|ý£~¥P¯w­G', 'wp-content/themes/hexa/readme.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿr3þ¢h¨Å>ûJ'),
('å3…™ÜK­Ù€<¦Óò', 'wp-content/plugins/woocommerce/includes/admin/views/html-notice-tracking.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0!Õjz…Q8ó¨*(š 7'),
('åRËä5?’- S£^H—ý', 'wp-admin/js/editor-expand.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/7ò!¸÷zàæ»Þ{þC'),
('åfÜM%"$Í	ªÌÎósá«', 'wp-content/themes/twentythirteen/category.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ZáŒ˜Hë”Ê@µñÙw'),
('åŽâúŽï¼bWßAš#', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/bootstrap.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '×-¼tjO‹Ñ1m}pÈ'),
('å™-Ò›zç©H†‘m’‰', 'wp-content/plugins/siteorigin-panels/tpl/help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4ß"¨¥‹«°E1‡8'),
('åœÐöû8¸|LŸPï‹	', 'wp-content/plugins/wordpress-seo/vendor/composer/autoload_psr4.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý:\0ðÑ>²—íØÇ}LQ\0'),
('å½d4\0nÃrz¿ô€ùa', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/home.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '>üREÚfÎKºpPÉ‚Æ'),
('åÒr›Áy70®Ñì¨’Ó¦‘', 'wp-content/plugins/buddypress/bp-messages/bp-messages-cssjs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€YÛÍoÓ±ï\nKQ¡j“'),
('æ*»¯W#²Í\nEó¾\ZÑ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1ÔÜ¼''Z”y£{ïÏ'),
('æ\ròb\\ñ™‰ÄÉ²\ZÄë', 'wp-admin/edit-form-advanced.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e˜?àµ¹0ïVf˜ µ'),
('æeðÆÛ—Ä£Åâ±Ú;:3', 'wp-content/plugins/buddypress/bp-core/css/buddybar-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼[à—XÏíØ–=9ÝE5h'),
('æ3WÆ	˜ú #lå2´)[', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/blogs/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÐùcoòG„œe(mr'''),
('æGÄÅ5Ø@æèÙÚ07•Ç', 'wp-includes/images/blank.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H»+ªô51	÷Âf]–ª9'),
('æhß¶¼2M 	˜25pŠ', 'wp-content/themes/twentythirteen/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø±.¹™ŒÞy¬¹ÌjãæGµ'),
('æjIù!WØÏùŠŒì*:G„', 'wp-content/themes/twentyfourteen/comments.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ò%ì¯·€)…MÃr;6ô'),
('æxÔ›:×™#-ðV¦`œ8', 'wp-content/plugins/woocommerce/i18n/states/MX.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '½ËM´Coš^øO`jþ²À`'),
('æ§˜ºî7Ý^ô»b³"³', 'wp-content/plugins/wordfence/images/back_disabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'hÙÂÔgØúïiîã†>'),
('æ¹ø«ÐÍuQnšÑã¨+', 'wp-content/plugins/woocommerce/assets/css/activation.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ':f!¿ðŒ¤Š×5k,ivu'),
('æ¿OyúuÔ–''u¾â©Žaf', 'wp-content/uploads/2015/03/uaiblanco-150x150.jpg', 0, '°%ïõ"øÜiM{\0rÅ¯Â', '°%ïõ"øÜiM{\0rÅ¯Â'),
('æÎWûêÃ"úÚêSk:Í', 'wp-admin/images/align-center-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž¾²-ór‡5*J7¡If'),
('æÝàÅ¥æXÙ¯çÔQÚÇ', 'wp-content/themes/twentyfourteen/js/functions.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0$j7µ`ÄñúŠ!™h­ÄÜ'),
('æâ££ôMåO×ºîïƒU®', 'wp-admin/js/editor.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zù+Žyë‡"h‰…å’›'),
('æïc^Z6´Ç#¤uˆ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/call-to-action/call-to-action.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ë?ŽjK«.³¹®K`'),
('æÿWN,\rð0r†hÖ@í', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-processing-order.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lßÁ"WmãÄtù÷`aê['),
('ç(s$Þu<Ò4¦û*', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/functions.shortcodes.php', 0, '¤”˜à#2#å¥X0ˆhŽU', '¤”˜à#2#å¥X0ˆhŽU'),
('çíïÐ\n´	Ïóa¯¼', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/settings/general.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼¸«æ;Þôï/ßß:'),
('ç"ÕÆ¡üŸ7vs+ö', 'wp-admin/includes/class-pclzip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '67(ÈCÿ“ékiƒÎ8ë¦'),
('çBŸ¹øü3y°Ï«0ï', 'wp-content/plugins/buddypress/bp-themes/bp-default/license.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0¥ñ§·D¨SÛø_'),
('çb`K¬''×Šì»œçâK', 'wp-includes/functions.wp-scripts.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gxFtyXNg,4™~‡J'),
('ç’ÅÿxšÞAgm%¶æž»', 'wp-content/themes/twentyfifteen/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈlC•n¼×ï±/ôÚï'),
('ç”Jú¡Ñ‘e÷\rXd”Ô$Ý', 'wp-includes/class-wp-customize-widgets.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k“¾¤@Mt¼ zØn|…³'),
('ç xuÕ½T?>I¬F^$Ë', 'wp-content/themes/twentytwelve/sidebar-front.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'k¿»,øžá³º’ßµ'),
('ç©lÚXNEMÊCgVsA:', 'wp-includes/js/swfupload/plugins/swfupload.queue.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™SR/½J»ö5©-vÍ'),
('çÃÕKÿg›Ðå‡o#ç0', 'wp-activate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pUÈª¯Nöà©Œæ³{eG™'),
('çÅ‰û	iàö¿/Ð­', 'wp-includes/formatting.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n‘œSÐG=áµ0n#Vz†'),
('çÇäèéÂYÌæp»ÚÑ1', 'wp-content/plugins/google-analytics-for-wordpress/frontend/class-frontend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïÑfÑ¯C!çó¡–å½'),
('çÏHâ¶ÇÍlö±{!D#¯!', 'wp-admin/js/color-picker.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Z¥}"[}›¸¿¨P-à)'),
('çàFüZY¿ÑC8À3E', 'wp-admin/css/colors/blue/colors.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}âR‡ìøN\rSO©\0Ð'),
('çêcQH&6’J>\Z¾ªŸ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/config.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'sî‚.¸>¾Ñÿ\Zcš¤¥'),
('è%y>}HÃoÚæú(6', 'wp-includes/js/jquery/ui/core.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g1D™Åù¹*xâ¬“¿‰'),
('è?Iƒþ\rrû² Á6ÎÞ4a', 'wp-content/plugins/buddypress/bp-friends/bp-friends-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªq%‚\\cõù¸Ø''ó'),
('èaq´Â/ëñÓÈÊ§‘à', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-forums.php', 0, '''ChÂiw\n‡änA}B²', '''ChÂiw\n‡änA}B²'),
('èežu 8²ñ=›E†¶', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/OctoberInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ž‚Œ%íU3GJ$†·#'),
('èfõi¿`¸=@TµçoÙ', 'wp-admin/images/spinner.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°£Ýã1c~''ªdvÔvHq'),
('èwùìz…Owùè(q+ëËë', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-product-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'C¹šu&Ï›w>^Óâ'),
('è{h·ö=2=a–Ï·È', 'wp-content/plugins/google-analytics-for-wordpress/languages/google-analytics-for-wordpress-fr_FR.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ã§úM#”L¤ŸÐãÝ'),
('èJ‰Ùåy”ž0mì`ä¨/', 'wp-includes/class-IXR.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ìù°ÄO÷èi”*¯/'),
('èÄ$-˜ÿhêªr¢3KÜ', 'wp-content/plugins/woocommerce/assets/js/admin/settings.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äavt\\!!Wî"¥è‘'),
('èä»ÊE2¤“ùº:›1', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/Item.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',‡Ó¤_•œ‰¶šB´J¨|'),
('èò‡òQËoµH*¹‚À(ï', 'wp-content/plugins/wordfence/images/sort_asc.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ',¸»I§Å+Æ¾ êú=€ü'),
('èÿ¨ÏªZ³¯-7Š„5%ã', 'wp-content/plugins/buddypress/bp-forums/bp-forums-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ü¥ž®6°‘Õ˜ô¡''~àO'),
('é§„…“jÀPêWÛ~\0y', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/admin-header-logo.gif', 0, '3“¾6üø±]æß(×@`ñý', '3“¾6üø±]æß(×@`ñý'),
('é"ð¢Ó[Q	ØÃÂð', 'wp-content/plugins/wordfence/js/admin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\Žô·ò*Af5«¬b>¥'),
('éFÎj!Yé{.J=,µ®', 'wp-admin/images/stars.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '[¬à™><õk²{Òì(‘'),
('éIoß''ð‘@¢FçPEÃ', 'wp-content/plugins/woocommerce/includes/class-wc-shipping-rate.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '®L¦h¶^Å)rB3I'),
('é]÷W/>ï}<8è VFã', 'wp-admin/includes/theme.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\nL³oÆÔÞ¨ÍC[4|ù''¶'),
('é^.—jT}ù<ÞŒI¾™', 'wp-admin/js/accordion.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ï ÙM\0÷¨¡GÃ]Èá'),
('é“¼WÛ[u®H3\ZX·', 'wp-content/themes/twentytwelve/content-page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'î2d¬¨Õg°tºCc'),
('éœ'' ­Æ#sˆþß¾U|', 'wp-includes/js/mediaelement/loading.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v³&ôÔB"oî!e•¾õ'),
('é »ÀyN<Ž €9€o\Z<', 'wp-admin/js/xfn.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'f²''Ê(ô.°J9\r^'),
('éªÊm¬Mt¨†ÛW³B', 'wp-admin/images/align-left.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\\ýy0Ïúd÷Zòo.hžÔ'),
('é·U¸=Áð(¥\nˆU5˜', 'wp-content/plugins/buddypress/bp-messages/bp-messages-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'v—áb|Ô¢V‚ýÀnXW×>'),
('é¸ÄÝÈìdy–Ív—ƒ4ô', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/class-update-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '® o:Liò¹ÍBˆÃƒ>¬Å'),
('é¾„72Äný®,ÆóH', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tag-destroy.php', 0, 'Põ¾Í³à\rÜMVq', 'Põ¾Í³à\rÜMVq'),
('éÄˆ~§åk^8–Aä“sÏ', 'wp-content/plugins/buddypress/bp-groups/bp-groups-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U]²Y4€ç|/\n¼Œa¥'),
('éÔÞât“þ˜ZÑO''ƒ \n', 'wp-includes/js/thickbox/macFFBgHack.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’È°gï†­×W’,/u´'),
('éÖçÙöV,E@†X‚šy', 'wp-includes/SimplePie/Cache/File.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '£=»@ìÂœÆB[	SÑ'),
('éð\n/§|ý¿ËJ³Lê', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/defaults.bb-htaccess.php', 0, 'õm-Ø~Ýù­éåf¤¢', 'õm-Ø~Ýù­éåf¤¢'),
('ê—>­ -/]¨Tr&s', 'wp-content/plugins/buddypress/bp-messages/bp-messages-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ–à*ö«ÿ‰ü2Ûª¿ž'),
('ê¨ÿ!-ò„ñ$L…QÊ', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/js/jquery.dataTables.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n¶I?¤¿Ÿ†>y­íˆ'),
('ê¯:­ë\\èB—e@ö³	ƒ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/OxidInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$èè]}ŸÌÚX€“Çï'),
('ê&þ(¬yf“\rÜÐ*KcA', 'wp-content/themes/twentyfourteen/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'M©;DjRï?©ú'),
('ê0Ð%Iâu! –NB>^', 'wp-content/plugins/wordpress-seo/images/banner-video-seo.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '	¡ûmîóÌ½¾ÉèÝ<=X2'),
('ê4Ê×çº2‘)A.;4Ñ', 'wp-includes/js/customize-preview.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¼6Î³å ðS‘ëwôŽ1U'),
('êY%vþˆO¥Ÿåd´eâÉP', 'wp-content/plugins/buddypress/bp-messages/bp-messages-loader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E>G¸_1ÆƒåáÀÆw'),
('êv³ž«`öOã\nÈ™¥®0', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/PiwikInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8à´)ÁêäÜšb—«ß'),
('ê¥²«2jEbgØˆW²xÛ', 'wp-includes/css/editor-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É_»Ø]·ñÉ69ƒºxÿ'),
('ê¯Ç‡¾ÆÛ4Ë“T`¡k', 'wp-includes/js/wp-pointer.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6˜|dMpX\0—ä€fÉ‚'),
('êùåÕº„'',ôáLlQg."', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-users.php', 0, 'gù(/=nô=Koðc;', 'gù(/=nô=Koðc;'),
('ë\0qUÄÛÜb2`Ä89²', 'wp-content/plugins/siteorigin-panels/widgets/lib/color.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'e½ÇÕ²·4ùS¸+šŸe†'),
('ë-nê$.ÿ#g%Ä}Ý÷', 'wp-content/plugins/wordfence/lib/Diff/Renderer/Html/SideBySide.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p´þ€uQø„¬: Ì*'),
('ë0žŠRðJ³{yíË£÷ï', 'wp-includes/general-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8¨íe8¹ïÉé0õÀ°˜l'),
('ëBÈ§÷]±vÚ*dŠÎ£º', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/export.php', 0, 'Òsj»à<zÑèËºãü ', 'Òsj»à<zÑèËºãü '),
('ëF ó8Ç+²)ÐØrÝPè', 'wp-admin/images/no.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Èk¿dÉ$ùŸÜŸV7ðÀ‹'),
('ëOÓ¿ú;¤=\\J¼zy', 'wp-includes/js/tinymce/plugins/wpgallery/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²)F.jT&–ûö½IÉO'),
('ëX©ï¾fi(‡ïép’fý', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/tools-recount.php', 0, '\nõ|9DÚm9ì†”þqßÃ', '\nõ|9DÚm9ì†”þqßÃ'),
('ëhåýu¬÷_±Èú@', 'wp-content/plugins/woocommerce/includes/admin/meta-boxes/class-wc-meta-box-coupon-data.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^É•zwþLIÃ-ˆËJÕ'),
('ë­·\rç!z}MLKE', 'wp-includes/ms-files.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']¼yÃ¯þ<Ñr ÔLëF|'),
('ë²ÔSÚ°p—GMÇ¯¨lí', 'wp-includes/css/media-views.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '4’ë„´Äï}¨û'),
('ëÈÄ×®FîêpÞs¥Ø4£', 'wp-content/plugins/wordfence/images/back_enabled.jpg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡¡ñø]È÷£”ÒHŽÃ'),
('ëÙ¸Ò@¢ï7·ò\ZÄ•,', 'wp-content/themes/hexa/inc/jetpack.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8&ó7X—xKcÀt$<¼á'),
('ëÝvAÀds½ƒ—µ®Kµ]', 'wp-admin/post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ñ~P›	Òã–ö©¶ìÉÕB'),
('ëãYCàÞoƒoRÔäºž”', 'wp-includes/capabilities.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'XW(—,\Z™+]×<ÙóU±Ó'),
('ì™!xââU·ûx¤Á\Z', 'wp-content/plugins/buddypress/bp-themes/bp-default/.jshintrc', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '|ušçIîT VèMm{ÀM'),
('ì-ž FKWÙèD€új,O', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-xml-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨ÐmÒHÙlÐ‡ë®áÖBÄ'),
('ì8·Ú§™ºs}ï÷Õ¶àNi', 'wp-includes/class-phpmailer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BqO7W—ØvaîŸ˜i4c'),
('ì;ŠRz«\rÄÊ2\ræ¾', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/css/jquery.dataTables.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨Ç‚QÐóž¨÷Hž'),
('ì>sœ§sïZ\Z)8V¿Ü', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-id_ID.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ãÿfþS–¨×H_\\ÄšŒ'),
('ì?ØÔÞý·h›±ÒÎ;', 'wp-includes/js/quicktags.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ö#ÊÒ:<àüÐTÙå­Ê­'),
('ìA®Ô×{éÌŽ¥~ÆŸØ', 'wp-content/plugins/buddypress/bp-groups/bp-groups-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹Mf÷ïÒŽŠupÖJ—¶D'),
('ìD\rh}¼è¯¶‚!\n', 'wp-includes/js/jquery/ui/effect-drop.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Q†ËQkñAá+‹Œ\\'),
('ìPØ·úŒæ‚‡ÌºÆ´$@Ø', 'wp-includes/SimplePie/HTTP/Parser.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'W%ÇÐû4ß6¥6	'),
('ìn)¥`Ë$Ä…P_¢™\rü', 'wp-content/plugins/buddypress/bp-forums/bp-forums-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ûª|’>9áºŽ''fe'),
('ìp¡2,!KeñÀæ?Hø', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/class-wc-addons-gateway-simplify-commerce.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*×žW„˜—‡<“W<'),
('ìƒ¦˜öè²ØÚïª/7\\', 'wp-content/plugins/woocommerce/templates/content-widget-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷q™ë1ÿ\\‡J9‹\nÂ—Õª'),
('ìäPHÞAË°M8—fh', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/icons32.png', 0, 'Ê¤ÇTw·›c<}sX~', 'Ê¤ÇTw·›c<}sX~'),
('ì¡çcÚÆ.DÂr¿ |öî', 'wp-includes/js/tinymce/skins/wordpress/images/dashicon-no.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'RÐÀäZÊ?f.Ç8õâ	'),
('ì¸ƒúvÈÛ6àš;˜~', 'wp-includes/js/tinymce/utils/mctabs.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿx$Žž\ndªó,âP™Ë'),
('ìÀ-xÇ(ÅE¶oI„=Ý', 'wp-includes/class-wp-customize-section.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”âÛÓãúYØ×õkóè'),
('ìÈÚü›Ì„ˆ¢mY”Æ', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/members-loop.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'crÀ.™\nõtãø+U'),
('ìá÷h›×„ÕVÙ_ö?^›˜', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/front-page.php', 0, ';÷³2w²åÍ® \ry•†', ';÷³2w²åÍ® \ry•†'),
('ìèhu!’°ªÎùIU³ó', 'wp-content/plugins/woocommerce/assets/js/frontend/lost-password.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '›Šª¸ð\\Ùúìš>ë˜ê'),
('í\nì­ Ø2HÛ"F±nÉ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TYPO3FlowInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’Íö,œoFÝD:Nˆ¾4'),
('íY^üó°X÷ë³z¯S', 'wp-content/plugins/woocommerce/assets/js/select2/select2.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õó7Û@“•ÿËû¼'),
('í\Zpr5> ö#Eö´Ä•', 'wp-content/themes/twentyfourteen/inc/template-tags.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ùr¯ÎxÝ˜Ü\rß"ZƒÃ'),
('í1‰k¯ËB­ÞzZÐ', 'wp-content/plugins/woocommerce/includes/class-wc-product-grouped.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'eü`}¿¤Ñß4z*ß§ô'),
('íE”aÇß€@®Y8†''', 'wp-content/plugins/buddypress/bp-forums/bbpress/tags.php', 0, '©)ÐœõÏ%.BðÎÔù¿', '©)ÐœõÏ%.BðÎÔù¿'),
('íRT\r`®/z\n€^MMÚ+', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/css/default.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '_4E¶‘ñd¸d[æô´s'),
('í]š§@ƒ\n—«>ÄºîYn', 'wp-admin/admin-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”à"ÓlßEð)ÙEÎA'),
('íg™PlYã\Zð†ûi–-—', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/service/Google_Service.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ìŠ\r9grêËÿ§0»!3C'),
('íkÒÝ!k¥|4¯¬×B', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/SMFInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ôIÿ0¸mj@0Ý%øUø'),
('í°QR"æÃ@3ªövàS', 'wp-admin/js/link.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '†uÜÐ5Ï³tö{ü¿zŒ'),
('íé\Za˜]]ãA‰ê''hŽ¤€', 'wp-admin/network/settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÓÜ€Âè4káf\\ÜëÞÒ'),
('íñ²ƒ=ÃúcäÙ‡œæý', 'wp-admin/includes/upgrade.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø:ú¶Ä“–í§0)´U'),
('íøFÞ—dÌÛÿÂêPè¯', 'wp-content/plugins/buddypress/bp-members/bp-members-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ù/òöïåùxæ„J˜Ý'),
('íùëeC˜¾„ðDi!×ç', 'wp-admin/css/colors/coffee/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'âñ¶ny‹s•iÇòØõ(“'),
('î‰•fÙ%ußPûÊñ„', 'wp-includes/js/mce-view.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ë=ì Óž¨Zš;eÓ/'),
('îû!Ý\0n€pà“²ã', 'wp-content/plugins/woocommerce/assets/css/_animation.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÏkŽo ç«·§[Z0øÙ|'),
('î1pi»‰É²‰¶ùIÐ', 'wp-content/plugins/google-analytics-for-wordpress/assets/css/yoast_ga_styles.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤P2;$o‘E¸°²å_©Ð'),
('îIg³&9åáÑ}\rñÈP', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/profile/profile-wp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U9kÏ¢ž\\ÿ~ä%ŸÂn'),
('îg:ç(Ü±~YáËPå>Å', 'wp-content/plugins/buddypress/bp-core/css/admin-bar-rtl.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”¢¢†#_,/_òIÏi'),
('î|¶´RŒ¶µÝ[ªÕ?—Â', 'wp-content/plugins/theme-check/assets/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÊÃ˜Š±œx‹ahÉKüµï'),
('î•ÚÅäHbè\08ó%(ù=', 'wp-content/plugins/buddypress/bp-activity/bp-activity-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¶\n¥ÔgÐ-:ï!çRcƒ'),
('î³ºW%,ZÛ—£uÁ!µb', 'wp-content/plugins/buddypress/bp-core/bp-core-catchuri.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹w§›VxÄÔ(Q|~G‚™‡'),
('î´âgzý”dÃŒëXù', 'wp-content/plugins/woocommerce/includes/libraries/geoip.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€ÜÔo„KpäÍæ+}õý'),
('îÐqáß5HÈïä¯•\nŠp', 'wp-content/themes/twentytwelve/archive.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gÇyØ“Âqrÿqšê'),
('îá»)dä<˜Ïe2{L', 'wp-content/plugins/buddypress/bp-themes/bp-default/members/single/forums/topics.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Û”ˆ÷“ì2^‚ˆÚÃÜ{´'),
('îôÅ/•h¾‘›ˆk¼vA©', 'wp-content/plugins/wordpress-seo/languages/wordpress-seo-en_GB.mo', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3,A\nø‹ˆ³@°	\ro'),
('ï"ò/Æ¬ÎºÄtÆzõšŠ;', 'wp-content/themes/twentythirteen/style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9.Dà¤C‹|SŒÐ''Ã‘’'),
('ï;Lát‰×¬C°ƒ”É£', 'wp-content/plugins/wordfence/tmp/.htaccess', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '·I z~Òi¶,Lžÿè'),
('ïD=JÇ…/	6Þƒa…', 'wp-includes/js/swfupload/plugins/swfupload.cookies.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥~À\rÚˆÝk\\ 7Ì´ÕÏ'),
('ïJÐ_º˜¥5HUüœ=#¤', 'wp-content/plugins/theme-check/checks/admin_menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'R êÁ¾''q1$ç\Z7ÁÁ'),
('ïY^~5~‘¨pŸG-ŠŒŠ', 'wp-includes/js/customize-views.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸ê_±\ZÛ%cÝ¹‰à‘Ñ'),
('ïzúÀœØö×ò|”zûxv', 'wp-includes/js/jquery/ui/droppable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qªÜ	’§Ç[5XD8û'),
('ï¦¦é&¿ïlYŽ4š@\Zšw', 'wp-content/plugins/woocommerce/templates/cart/mini-cart.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ôÎjH<	à,Îdú]úÏÙ'),
('ïÀûP†‰a`Xuî¥¡', 'wp-admin/css/color-picker-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÿÓJûD	‰6ü+ç6&€àÌ'),
('ïÃ¶lyk!ÆÌ²ÎzhÄ', 'wp-content/plugins/woocommerce/assets/js/stupidtable/stupidtable.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'šO†¦ß%AŠL’,\n£'),
('ïÈwT+šU¶D£°ì£', 'wp-content/plugins/woocommerce/templates/single-product/meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É…ËnÉè´ˆ“]‰\0'),
('ïÑX=U¡pfp¾€ÁZ', 'wp-includes/taxonomy.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òièíÈÕõXG\rŽŽ°Ï'),
('ïÞŒt+é\\õ+ÆXa†ZU', 'wp-content/plugins/wordfence/lib/wfScan.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÙgãÄ.­¦Æ\rS"ü;¦'),
('ïâV§ª0­…Þ8ñ„Î¿½Í', 'wp-content/plugins/wordpress-seo/vendor/xrstf/composer-php52/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\Zå™æÉ-ófm¦Ö™'),
('ïã¯©è	''¯æ¶Þ¨‹÷V', 'wp-includes/images/smilies/icon_biggrin.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇYpRþ+Û0}kÑN{Œk'),
('ïï6X‡Ôª4ñã[_‡=t', 'wp-content/plugins/wordfence/lib/wfScanEngine.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Í‰(ß}Œrt”c’†3iD'),
('ïÿ€É9‡ÊrÀMÔ§Äè', 'wp-includes/js/customize-preview-widgets.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÇQ~»µê£6Âa¹›'),
('ðª<´gÈE£è“t¢/†', 'wp-content/plugins/buddypress/bp-groups/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V²|Ü[Ìº)ªëaibyš¥'),
('ð$ŸÄ«¥Iˆ^ý“3·”Ñ', 'wp-admin/menu-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ò€%^wŒ,\rwÁýŒÎ'),
('ð-èîkmÏ»¾‹ªºAó®¡', 'wp-content/plugins/buddypress/bp-forums/bbpress/search.php', 0, 'þ ô-æÐ&	Øàlèª²ñe', 'þ ô-æÐ&	Øàlèª²ñe'),
('ðT%1´‚„çKGÂÇÀõ', 'wp-content/plugins/woocommerce/templates/myaccount/my-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AYŸøŸ]¿6ï®U›¨y'),
('ðtŒÂ/ÔF™st>tÖŒv', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/profile.php', 0, '@Þ(—f\0(;b@½êC¸8', '@Þ(—f\0(;b@½êC¸8'),
('ð¶!A´ªþ\rÚ–\r>Î', 'wp-content/themes/twentyfourteen/content-featured-post.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`ÃÌX°'' gT\\d)Ø'),
('ðÐ·&§LÛ½Â¨ãVNŠ', 'wp-includes/css/buttons.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'RÜƒ€2é„ <z¦`È`Ç'),
('ðÕ£mÒìpÂüé©÷9\n', 'wp-content/themes/twentyfourteen/inc/featured-content.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µäšç¬$ÒîŸ„™-x£'),
('ðö´øü•ø6$[£ª®OÀ', 'wp-admin/css/customize-widgets.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤²‹Ñ\\càéªÎ§''òéT'),
('ðøì†Lcˆê2I€~H', 'wp-content/plugins/buddypress/bp-groups/bp-groups-forums.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðxFIûvbh+»*>“'),
('ñøå“rp.u…3zx€', 'wp-admin/includes/class-ftp.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '­„–2Vûu‡\\IöL„ü'),
('ñ)jE4Ú£dêÊÙ¤ó', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/samples/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('ñ7sþ\\]Ô}ˆAAùwe1·', 'wp-admin/tools.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pÑÆ3ê)q»†\0Ñ·ˆI='),
('ñZ/¥¼û{LtåÕ®F$€', 'wp-admin/js/svg-painter.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‡Üûé/§|Ä©ˆœ‚zü'),
('ñh@ÜßB8†¨jX…', 'wp-content/plugins/google-analytics-for-wordpress/admin/dashboards/views/graph.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'G„Ù]r''j—baÃŸsiê'),
('ñk—išp&h¥œ³3Têô', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/forum/edit.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÍúÈè\n	Ìà"£‚e''aªš'),
('ñˆä>›Ö”)ßË=Uù', 'wp-content/themes/twentythirteen/inc/custom-header.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïæí¶fYK¬£à\0àc'),
('ñ‰µäÒ½.(°!7X0f', 'wp-content/plugins/buddypress/bp-members/admin/bp-members-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*÷2d£XÊ}’Un©#5S'),
('ñ¶4g]þ/F…zë¬‰œ', 'wp-content/themes/hexa/screenshot.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'T9úÈeCFH¹—×íBÓ'),
('ñÂJ]ú‚±°;o*©±P', 'wp-content/themes/twentyfifteen/genericons/Genericons.svg', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '/¿=Â³zeX*¹|Óê¤b'),
('ñÔ›KÝ~D*Ï,57óŠ¶', 'wp-content/plugins/wordpress-seo/js/wp-seo-metabox.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'qS[‚#U$®RØl\rYb'),
('ñã¬NÕÅñKlQÊ', 'wp-content/plugins/wordpress-seo/vendor/yoast/license-manager/views/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6Lì2Ó²‰kµ1:„õB€È'),
('òøžêú!¶''í>¦Ãz¾', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/members/single/messages/single.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýx!_¸„¡gïÆê7óü'),
('ò$Ñgw8åÑsÙôˆ9à\n', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bp-options.php', 0, '^Á,UX‰Ë/`ôÏ¹x', '^Á,UX‰Ë/`ôÏ¹x'),
('ò/—Gy9ÇšéxìX›', 'wp-content/plugins/woocommerce/assets/js/select2/select2.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'CêÙ&Ò±2TˆEÍ1?'),
('ò?u[²öcîv\0±ÐüE', 'wp-content/plugins/google-analytics-for-wordpress/vendor/composer/installers/src/Composer/Installers/CakePHPInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a,÷ÀX~¬¡™Qd?l»T'),
('ò?²âE_Ï)ŠxÚ…$ž', 'wp-admin/includes/deprecated.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŸÛ—4>½æk"h»²R'),
('òI¶''ïGK 4_ªb¤', 'wp-content/plugins/siteorigin-panels/widgets/js/embedded-video.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'äM*z¤_b»Ü‹‘ë'),
('òR›¢	­©z1/7m»¥£', 'wp-content/plugins/woocommerce/includes/api/v1/class-wc-api-json-handler.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'p§\\Á]«!8¶TÜp¬3'),
('ò_ðNPÁšÝáÎÏ›Ãw', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/includes/functions.bb-upgrade.php', 0, 'zNH÷h™mü\\%Ã-%þ1', 'zNH÷h™mü\\%Ã-%þ1'),
('òpo‚´X0%÷¢ÇíÏë', 'wp-includes/css/editor-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''o"%òvÒ''@è"IHV'),
('ò–ÝÕjKé&·…íÖY', 'wp-content/plugins/akismet/class.akismet-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Á‘Î–7ãÖÝÔ8xæØà'),
('ò ÑÎNëÎ®}C]•h"Q', 'wp-content/plugins/buddypress/bp-core/bp-core-admin.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '9?LÕP''³¸=Bk"" '),
('ò°hêlô=ªiøH\0í{', 'wp-content/plugins/siteorigin-panels/inc/debug.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æú¿o…¼$}Í''Ò¤H'),
('ò°–üMÂÙ¦MÆ/`¼', 'wp-includes/js/swfupload/handlers.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²ÐOÛ…¼óß²˜}Ê'),
('ò± ­ü²BÉRÔz‡‡Y', 'wp-includes/js/jquery/jquery.table-hotkeys.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åogo·¿“~i¦I	ú'),
('ò¶?{o_±°µ''»nÖ', 'wp-admin/images/resize-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'õáe?‰&h.éÅ\nº™'),
('òÂÌ_fÂ $ÁO<o', 'wp-admin/js/common.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÑmÖÃ÷j×wŒÅpŠÝ Ã'),
('òÚwÎ+"+ú$ã¬^¸', 'wp-content/plugins/wordfence/lib/wfLog.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'É“•ÜLa’ŒÝÐå:Ó¡');
INSERT INTO `wp_wffilemods` (`filenameMD5`, `filename`, `knownFile`, `oldMD5`, `newMD5`) VALUES
('òÝVÆš}Ücâ>cfq6ÇP', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-email.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‹í‘ÐÕaÉ+"®†_x6'),
('ó"-‡q²5.v‚%mOm7V', 'wp-content/plugins/woocommerce/templates/emails/customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ýàï¿!ùkð¨{ÍB6'),
('ó#\\ú·â¨/‡vXR', 'wp-admin/js/theme.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 's¡\rn‘˜þïñ¥ï7'),
('óJ¨tÍ“ª‘™ÉÕ@', 'wp-content/plugins/woocommerce/assets/js/chosen/chosen.jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '8ß¬êag¹QúÓbv~'),
('óYhF‘Ú†TÃ˜{’', 'wp-content/plugins/woocommerce/includes/admin/views/html-admin-page-status.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÎÙ—k¡+·»¶\\K¯Íú'),
('ó\\QeÂÐ•úa.–m%>ª¡', 'wp-content/plugins/papercite/tpl/default-bibtex.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Sß@ÉŸí°	~ýóðû'),
('ólF‘®¾Ücë’•ÒLÁ€ø', 'wp-admin/js/iris.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uÆ5`Æ@Ä¦ÃUeß°è©'),
('ó~,yW0ëûZ“.Ó[', 'wp-content/plugins/woocommerce/includes/class-wc-shortcodes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¨‘eiƒ-¥7€†:ah'),
('óŠØ ]Ôf•ˆðPô¢†ƒ', 'wp-content/plugins/wordfence/lib/wfLockedOut.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÝÛWÑ±ÔXñ²e D£Àš'),
('ó–~®áÙ¾yâü7ù„', 'wp-content/plugins/papercite/js/jquery.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Õ/Fá‘ÇÔ#NH÷Y¦Gw'),
('ó«]z­ÁÀß­²sÑÂó', 'wp-content/plugins/google-analytics-for-wordpress/vendor/xrstf/composer-php52/lib/xrstf/Composer52/Generator.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'A}øÀñµ\0À”ïvóp<ª'),
('ó®—l$5vª#óðÀDÒ¸', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/time-pointer.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'zv¥§p—ï3ƒ]\r¿TY&'),
('óúÙîˆÚ‰š-Æq/\rR|', 'wp-content/plugins/woocommerce/assets/js/admin/accounting.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^z²kZÂlâ´Zx :'),
('óÿV¬“k9Û´îs¿»€Ö¿', 'wp-admin/css/customize-controls-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ú3''øÜØRŒ+ý>ðÙb'),
('ô‚Ž;ê¢^ð©¸´8c„', 'wp-includes/css/buttons.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÃiÚ¦‡{”><ýXõr)½a'),
('ôJ''#‰‚rN„0a\rÈ', 'wp-includes/images/crystal/audio.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '™nVñ:ÉÏ‰óGØÔ-#k'),
('ôY´ªR‰Yi/µ·l@HXÓ', 'wp-includes/js/media-grid.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Šl]À®W¶"Î\n ¶Þ2…'),
('ôe¹É<g*-}·µ9X', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CraftInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ö@|ýõÝ*ðþáY°'),
('ôxQô ]ÆB‰¼ÏH ¶)ø', 'wp-content/themes/hexa/editor-style.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±jôd¸áöp\\/I¥u'),
('ôxŒÅmŽSZÉ2üùš9f‡', 'wp-content/plugins/woocommerce/includes/gateways/mijireh/includes/RestJSON.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''74­þ­·Ü>yË˜> ‚'),
('ô ÆÄ£»ñ0¿4‡\\Þ', 'wp-content/themes/twentythirteen/js/theme-customizer.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7¸‚¹å5ESS$U9\Z»í™'),
('ô¡ì?\\Ä¿Ï/ªpd''ú', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/TYPO3CmsInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ø©µÊ²¯È¯Þ@Á:-&'),
('ô­jå8úœÈÄÃ\Z¬±ó', 'wp-includes/js/wp-backbone.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ý«¦SºòYÛ|³×¤×j)p'),
('ôéÇÏ½7T?…á˜›', 'wp-content/themes/twentytwelve/tag.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²˜mîFéç¸d,SÀÁG'),
('ôêîXzk*é„«MÌÔã', 'wp-content/plugins/buddypress/bp-core/bp-core-template.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ„Þ{Ö*ý¿,=<ªãE?'),
('õ-"DíÊÊ¹D²5aÐ/', 'wp-includes/cron.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä,öà<âfyÆìJÖ0ï±'),
('õA4eøêÇ{¹^š†ÒZ', 'wp-includes/js/wpdialog.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'rè9_ÔM@9\0œS–ˆ¦º'),
('õF¤ë\ZÁ“ç®Cüì1®P', 'wp-content/plugins/wordfence/lib/wfDict.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '*î6Attëæ#Ã'),
('õTÒ¨“x¶o\r•@%s', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/MediaWikiInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Øs|VõTuâ›™ê·¢À'),
('õrïéÈsùçÉKÏÒû)', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/tests/Composer/Installers/Test/GravInstallerTest.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '@°•|\\ÆÆB\03CEÈ›ŒH'),
('õuôNâƒ.A_Ù_Ï', 'wp-includes/js/media-editor.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\0\0YE\rŽ©þ¨øY'),
('õ¸e~QŒ8ƒîŒÌF', 'wp-content/themes/twentythirteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'n¶ÎKƒ+MæH%^g²'),
('õ¥†ÂØÞ>+ÜžL[îm', 'wp-includes/js/tinymce/skins/lightgray/img/anchor.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«Óa5q€ÜÈ‘_4ø@'),
('õ¥Ûý(ëÅø%ž#€9yn', 'wp-admin/css/forms.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'è­’~ÙŸµ˜º¿<—À³'),
('õ©üº×ßÝ¶†ë½¹ß„íó', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-l10n.php', 0, 'lQê\r8æñ‚q}HÝf ã', 'lQê\r8æñ‚q}HÝf ã'),
('õ´ÙjÝI>Çè©az2Õð', 'wp-content/plugins/wordpress-seo/admin/pages/files.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÂNV\Z§a3žÆCïP½ãy'),
('õÂÎ“æk“ÞéŸí+3§O', 'wp-content/plugins/buddypress/bp-core/deprecated/js/jquery-scroll-to.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '~wü%c›•V"œ×WÃé'),
('õæØõ£y ø\0º"¬îQ', 'wp-admin/user/menu.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥)ãÓÂ»†g¹ÌEÏpî'),
('ö¼;&	¬jôtV])÷f\\', 'wp-content/plugins/buddypress/bp-themes/bp-default/_inc/images/activity_arrow.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'r\Z€Yrôäl—_ë" F£Õ'),
('ö€~¡‘äâ»âr„C›ž', 'wp-admin/link-parse-opml.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 9)!¬_n—4k!š{ñÖ'),
('ö%jº¬¾‘±1`!‡¹', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'BåÈñF6úÑ²Ø×Ù.%'),
('ö;Ú½©ï<ßs¢nLq', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/functions.bb-template.php', 0, '9Ž¡ò.­:¥ÉWE/}K', '9Ž¡ò.­:¥ÉWE/}K'),
('öV9´ÔK±áÄgoX±¹7Ó', 'wp-admin/images/align-left-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'i…8±O¹ƒšìÐ^—Æc'),
('öYZÒ¿¹ì½W!"]³nç', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-admin/images/menu-dark-rtl.gif', 0, '¶õ%ÇnÎßØ7ÚñŒ<J', '¶õ%ÇnÎßØ7ÚñŒ<J'),
('ö^ž>/¯ã±ŽJjBïì', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-help.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lÃaˆ¤¤NÖ?î8ýãðÐÓ'),
('öa4…€±é„=8ƒˆY', 'wp-content/plugins/buddypress/bp-friends/bp-friends-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VjHÀM''´R•¤ª›ÔV:a'),
('öfgû[üCRÀŸ{c', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/tag-single.php', 0, '£3\\‹®Ö??8­Ñ3\rúî', '£3\\‹®Ö??8­Ñ3\rúî'),
('ö–ZaOÒ]á7_ÚÊn.F', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/tpl/default.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŽHºö‚l©Œÿ•¯°«ŽÃt'),
('ö¨£’ÂþH©S!;ø ó–', 'wp-admin/js/user-profile.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'aá¥Æ2b-ñ¯6§¥\ZÄõ?'),
('ö¯·Ïf—j|Ñ¿ÖHu', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/README.md', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^	”û½ex¯ï€2+$F'),
('ö³»õõ¤ÀÿIé', 'wp-content/plugins/buddypress/bp-themes/bp-default/activity/comment.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ˆÜC(žçz„ÏÛ/x›>×>'),
('öÊí†+¢šÇqÉpW£Ã', 'wp-includes/update.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û2á2†¦Çq–p©’¥'),
('öÍýŸo~. F¡>¶!ßµ', 'wp-content/plugins/woocommerce/includes/widgets/class-wc-widget-top-rated-products.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'FÙ/óéÌFý.:O<Ù\r'),
('öÒ–}hÒ‹Éa°¢(´ˆ…', 'wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart-variation.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '"ãGúºkè\0V—bä'),
('öÓã­`×&X<ÄaQŸVh\\', 'wp-admin/user/profile.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹ú©•€\0yÝ¤±&-'),
('öëuæ“-JŒÈ&ñ8Kî', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à5ýw]ÑZªùÀQ´e|Û'),
('öíœ¨vóeœõOÐô†6', 'wp-content/themes/twentytwelve/content-aside.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'œl’lHÆµO¯ô`ðûÆÙ'),
('öýåÀPq-³tó¹@lÊ', 'wp-includes/images/wlw/wp-icon.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '1	ŽÊš‰7w3K™*'),
('÷/ü(_!*ÌdKç¹n', 'wp-content/plugins/buddypress/bp-core/css/buddybar.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{ÓÖÚwï (ç‡Êo•D'),
('÷ @ï;€ú*ÏÁ|¨°', 'wp-includes/Text/Diff/Engine/string.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '^î–x@¹RµÆ™=»úÓ'),
('÷=ôOääÉý„CÓ¬!', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/io/Google_IO.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '(¥íítÊ3î‚û²†{÷“¨'),
('÷e”-âð| Ý$‰\n“æ', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¥4ävÃO¦,q¶;˜úR'),
('÷”xM³5âÓ¹L¹\Z\Z', 'wp-content/plugins/wordpress-seo/frontend/class-frontend.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'óm	uJ<í\\Ì¦3pA'),
('÷§K6ÈV<¸EûmÛ¨î', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/banner-premium-ga.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uNLhËAE­VÁúGÎo'),
('÷ÉBñH…Œ¥w¥…í', 'wp-content/plugins/wordpress-seo/inc/class-wpseo-meta.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'm£¹6SW×\0''díç2]'),
('÷×ý@{÷÷ánÂ\ZOˆ', 'wp-content/plugins/siteorigin-panels/tpl/metabox-panels.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'q«~;xM„›#Št<s.y'),
('÷Ø^´Žø5rñ³²·''È', 'wp-content/plugins/buddypress/bp-themes/bp-default/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ý½^çäI·žEönëS'),
('÷è%.7;$ä¥ÞÂI¼', 'wp-content/plugins/woocommerce/templates/emails/email-footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '³µ aê¶˜äØå‹\ZŒ¹ƒ'),
('øÜ½Ìkã½''dþ¥brp', 'wp-content/plugins/woocommerce/i18n/states/PE.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'à°É”Wó®“\r[;KÉY'),
('ø,³Ù.ËÍ·¶\n™Hv', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/samples/sample-theme-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'mÿÎ¨Dxê¸ ØX¥÷'),
('ø2º®X™§k›!“pd/', 'wp-content/themes/twentythirteen/genericons/README.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'I#''yµ£F¤@¹ÀÇd"'),
('ø@¨ÒêsB0<€{l¶3ŸÑ', 'wp-includes/wlwmanifest.xml', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ßÔ¶óƒê¢ið^ˆ–'),
('øD@£Ñ&4bêMvšîÝ±', 'wp-content/themes/twentytwelve/content-none.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ' 3©ð{ÓÂcØ°ÄÐšá®'),
('øXBõœ”1MWÕw+', 'wp-content/plugins/woocommerce/includes/admin/class-wc-admin-settings.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'êFÅuÔAæñCÅ½û–<Aå'),
('ø^†£GÇ&-:Îiì«B±Ï', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/datatables/images/sort_asc_disabled.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5àÞÀ«Îç×uz}ºBî'),
('øe?Ò\Zv[*JZ\\UÿrÒW', 'wp-content/plugins/google-analytics-for-wordpress/assets/img/ga-premium-banner.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '€†_F/ÙBÎ]NCÏÄ¼N'),
('økoZýö¨z!/½Ìf', 'wp-content/themes/twentyfifteen/js/keyboard-image-navigation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¸/â80r‹\roº®©'),
('økæÞº”e<FêÚ4', 'wp-admin/js/revisions.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2SlÿäR;À]2¯Ljø'),
('ø~,eu¨­yFœMáè', 'wp-content/plugins/woocommerce/includes/class-wc-autoloader.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Iðø@’9F\0(˜=½ö…'),
('ø’ÉøØ''+„‘}ñRû~0', 'wp-content/plugins/woocommerce/assets/js/admin/jquery.flot.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5ÚQÛþÕ./º:\nƒ,ÑÜ'),
('ø¤ÁÑSW<êÑ%žøo', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/PaymentsApi.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ðö¤† T“„`V‡Zýs'),
('øÂ6K1ýþ›(îöÝ}/AX', 'wp-admin/network/user-new.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '}„~*ÐaåÓ±úŽ¨•'),
('øÃ¥''¼èÐãÖMoÉcFÀ', 'wp-content/plugins/buddypress/bp-core/js/jquery.caret.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'c	7e6bø˜BœÅN=¦W'),
('øØ"ó+JÎËÁÿ9‘u¼ô', 'wp-content/plugins/woocommerce/assets/js/admin/users.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ù6&EÛZ[Jµn ZÍQÚ4'),
('øæƒ™ùÒw…¿Ñ¦ÔšOÕ', 'wp-content/plugins/siteorigin-panels/widgets/widgets/animated-image/js/main.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'iˆ)ŸÔdÖ¥L[$Ê¦Qd'),
('ùl\0Da"Æ…4¸', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/focusable/focus-element-overlay.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'YrßD«ïO[”FÝ'),
('ù!Š—¼à8:Éq|çF6í', 'wp-content/plugins/buddypress/bp-groups/bp-groups-activity.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ä\r+¤ß¨êîS›…Tt'),
('ùHûMz»@õAé†é', 'wp-admin/css/press-this-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'U\Z>Ï˜T¥Åüªþqlb'),
('ù„É±%›¹a{Z¼j	%¿', 'wp-includes/class-wp-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Èv†•`€14eÍ½—·%'),
('ù‡†óI™:4PúUÒÙÀ', 'wp-includes/SimplePie/Cache/Memcache.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'öJU²¡…1SQ«„?¶'),
('ù:RôùGá¿Ÿ¶¡', 'wp-content/plugins/buddypress/bp-members/bp-members-screens.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'åE2–^®52†M'),
('ù–ê¡¬Ý!VL;A§u', 'wp-content/plugins/woocommerce/assets/js/zeroclipboard/jquery.zeroclipboard.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', ']×_m}Ú-sI§"~H`Î'),
('ù™Ö«™¬“žŠ"šSŒ1', 'wp-content/plugins/theme-check/checks/constants.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '’JA¶ç*¬x9òbú%&'),
('ùšJsŠÙ[\\fqrAÑ¤_', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/siteorigin/sprites/expand.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²šfu¹pý¬3Uà¢Bf„1'),
('ù¢¸pöl4[²þ°e›Ûû', 'wp-admin/js/inline-edit-tax.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'û îd†™2Q²4]g‘p'),
('ù¢›ˆí¥eòÕû—í	€ì', 'wp-content/plugins/buddypress/humans.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Œ¤£õTç3À.löÓLÎ¨'),
('ù©€XiU1`Ž²]‚“ë“', 'wp-content/plugins/wordfence/js/perf.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'uQ÷"ÊwF÷ÜáR@p'),
('úRœÞ=úÝ*ÉdòÕn', 'wp-admin/includes/media.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '6ï°·U°ˆ5ãOÉ''Gú'),
('ú-^gÿˆÌº@\0/÷“†', 'wp-content/index.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gD,Vë§=\\ÆbP'),
('ú.sêwÅ×°XB''æÓõÚ', 'wp-content/plugins/buddypress/bp-core/admin/images/icons64.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5óU!¦VY/,’øáÎÿ'),
('ú.Õ¶»ÕñZg{Ú=ñšÌ', 'wp-admin/css/customize-controls.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'X	\ZÇcžXgt³(•§.‚'),
('ú4áÛ:hé“þ=-EÏ', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/google/auth/Google_Auth.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Š	‰AÎp„æ\nÿ1˜'),
('úJâ¤åˆ2÷ñb™‰øÎ›Õ', 'wp-content/plugins/buddypress/bp-templates/bp-legacy/buddypress/groups/single/request-membership.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'æø… §/ÊÀ°½ÊÆ¿Nƒ'),
('úY@#ñþšK=›\\5\0Syå', 'wp-content/languages/themes/twentythirteen-es_CL.po', 0, 'fÜÖÕíMç§)ËÃ~ƒúNù', 'fÜÖÕíMç§)ËÃ~ƒúNù'),
('úa<*ít—¼ûÒfEó4ù', 'wp-content/plugins/woocommerce/assets/js/admin/reports.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '±÷^ŠH° ¾=G\Z,\n@'),
('úw˜ÖY¥»B«ŒqMã', 'wp-content/plugins/woocommerce/assets/js/admin/meta-boxes-product-variation.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'È™‘n¯+ïG:ï?²(æ·'),
('úŠ''_G·˜þ>âr-gÊ¯', 'wp-content/themes/twentyfifteen/genericons/COPYING.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¹B;–ëa`GÔ¢·Þ‰'),
('úŠ­~…‹a%¡ë!»P', 'wp-includes/js/tinymce/skins/wordpress/images/pagebreak-2x.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '{Î6¿#UQ:÷‘|>#ëÖ'),
('ú˜”çÙL?@§š.~O¯', 'wp-admin/css/colors/midnight/colors-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '''ÅA`‰‹ˆ´Ý†º Àa\Z'),
('ú³¬»T\nšˆô­e.(¼±', 'wp-includes/class-wp-image-editor.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¤ÖÀ¾Àg]‹ÃxCQƒ'),
('úÍÄÎ-ØÉTÀ—ÍÝÙ', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/CakePHPInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'a,÷ÀX~¬¡™Qd?l»T'),
('úÖðúlÔ‹Ý±ÑƒõÆÏ', 'wp-content/plugins/buddypress/bp-members/admin/js/admin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ªf*à†ÞÐœ¤·w(R'),
('úâ}‡Ûá³PÃ›™P\\©\Z', 'wp-includes/js/tinymce/plugins/wpautoresize/plugin.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'gÙ§ÎQàM£VN«Nî'),
('úèRŠ,žA§Àý\ZñGJ''-', 'wp-includes/default-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3šžDÈÂMß[`Ý¨Ó'),
('úýÊ\n\\ÔûÉ¶.5úŽš', 'wp-includes/images/xit.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'å)£Xû¹`1¬ÜðH×Ê'),
('ûC}0%iù‰p7•\Zå/?', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.init.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '»Ð*¤;ôK‹BæÈß'),
('ûDÏáê]æŸ|ß¼ª$™', 'wp-includes/js/mediaelement/wp-mediaelement.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ÿ8ØŸ"{ëÕº„¬uáZ'),
('ûPhÜÈ³·¤rVâ', 'wp-admin/css/revisions-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7l(2·˜w¤¯ë®'),
('û[§&™ÚÀŒ,³æ×¨+Ú', 'wp-content/plugins/theme-check/checks/comment_reply.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '˜`%]à"¬NÈx+–'),
('ûf‰‰§ ¹ÿ‰Æüj¸Æì', 'wp-content/plugins/woocommerce/i18n/states/ES.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ïq¨,”1Á5»(§'),
('û¼V¿æÐxOÄÖ$q€Ï`', 'wp-content/plugins/buddypress/bp-blogs/bp-blogs-classes.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2í³^Xýµ\rJgC8µÇ'),
('ûÅ¸W_JcîZäêBœÁÂ', 'wp-content/plugins/woocommerce/includes/wc-attribute-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '÷3ËÙ<”têËGøIsµ…'),
('ûÌÃö6Ri*5ŽðÁÄÃ¦', 'wp-content/plugins/wordfence/lib/dbview.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦À®(D˜eƒŽd«:¡]'),
('ûß¯¬@gþlÆÙÊÕ&!—', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-templates/kakumei/functions.php', 0, '+ž¥%E´"Ü\Zo^†Í', '+ž¥%E´"Ü\Zo^†Í'),
('ü''ñú™ƒæ³×}µ0', 'wp-includes/js/tinymce/wp-tinymce.js.gz', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dýjÕ6h0CbÐ} P'),
('üD`:ˆ¶ìAwh–þ', 'wp-content/plugins/siteorigin-panels/siteorigin-panels.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'øõŒ»íÈæ™ý¼}:É&'),
('üsê‹E7•!Ûèüj‹c­', 'wp-content/plugins/google-analytics-for-wordpress/assets/dependencies/rickshaw/rickshaw.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'H¡).>óÏµ<2(;=,'),
('ü])éé	¹ƒó{—?R}', 'wp-includes/feed-rss.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'µkYÅôí>°]DtH/'),
('ü!3(^›Ü£¢*›LmA C', 'wp-content/themes/twentythirteen/image.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'lsü1‚:	âçnô¹wž'),
('ü0<PsÉñ×žH—ÑÁ22', 'wp-includes/js/jquery/jquery.table-hotkeys.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '§êÖ”#týgP±g€¥'),
('ü9(FŒRj2¹n6]Š', 'wp-admin/css/colors/light/colors.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'üµÒãýãùé#™,…'),
('üg"š}_¿7¸½¦ÜJ5', 'wp-includes/js/jcrop/jquery.Jcrop.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'VÌž¢Ü/K‘x¿¬¬’'),
('ü‰p·Š9½6Ã¨åRæ', 'wp-admin/css/common.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'dÐ³^Õ.›,#åã’§¤0²'),
('ü˜•ŒµÆªq¥æ‚³‹Ð', 'wp-includes/js/tinymce/plugins/paste/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Ì.`ú4)¶Ud0'),
('üš9‰”yT€À>3•T', 'wp-content/plugins/siteorigin-panels/video/jplayer/skins/premium/sprites/pause.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¦ziD''¥í@)SºÆ«'),
('ü¥ôiH£û4µ÷½àé´\Z', 'wp-content/plugins/wordpress-seo/vendor/yoast/i18n-module/LICENSE', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'xM}Ç5{Ù$èÕd(’¿k'),
('ü»<læa¬€,›bX,³²', 'wp-admin/images/xit-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '°rœT½Ä`Ÿ¯?JÐ/Ç'),
('ü¿šY.zÈ¶ùV', 'wp-content/plugins/woocommerce/templates/emails/plain/customer-new-account.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈþtÅ~Ù["’&Ý''í}˜f'),
('üÈÊÛ¿GD‹¨ç†FŽ¡', 'wp-content/plugins/wordpress-seo/vendor/composer/installers/src/Composer/Installers/SilverStripeInstaller.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—É(„Á*Aë„åVMH=I'),
('üÕÅ·N	\0ùÛf\ZT²Š', 'wp-content/plugins/wordfence/css/diff.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ä"¨‰“ôÕy1…÷4ZÆ'),
('üäñfbúÇ×býKJ¢ü¨', 'wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ºd)·|¯q3gÐô›4—˜'),
('ýWkò)Íïlz-•nq«', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/api-libs/googleanalytics/class-google-analytics-client.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ôÜ›ÓøL¢¢i±d©j“'),
('ý\rFw+³^Ì\neÎB(¦ü', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/class.bb-pingbacks.php', 0, '3…¦µûÁ}(¨Ðc&­', '3…¦µûÁ}(¨Ðc&­'),
('ý“1zrnˆÖhJ v³', 'wp-content/plugins/buddypress/bp-core/bp-core-filters.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ì»õ?TlO×á˜ŸsüÊ”á'),
('ý!@A‚;1)SJ—Èb·Ì', 'wp-content/plugins/wordfence/css/colorbox.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'òØ\0g/¯4BE-¸çÿÑ'),
('ý$is\ZíÝšÔ gÜ]5', 'wp-content/plugins/woocommerce/includes/abstracts/abstract-wc-widget.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '”ËŠ®$©l–7Å$Å¤®¸e'),
('ý2¤¸Ú(‚;fÎÊ:Q¿²', 'wp-content/plugins/woocommerce/includes/admin/views/html-quick-edit-product.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '\rÆ×wÉm»îƒ—]'),
('ý=¨äøc;krAy;', 'wp-content/plugins/google-analytics-for-wordpress/vendor/yoast/license-manager/class-theme-license-manager.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'E'')j2<n»—¹zÃ8”ö'),
('ýBšÏYÁ½œd–±>Þ©ôg', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/js/profile-edit.js', 0, '³ú¸Ãzg.·³yûh%&t', '³ú¸Ãzg.·³yûh%&t'),
('ýGþ²!#hÔ9	„ò&', 'wp-includes/js/tinymce/plugins/wordpress/plugin.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÌË\nÌƒî>Z&&ÜDö²ã'),
('ýKjòâªhº‘èù', 'wp-content/plugins/wordfence/images/loading_background.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¬ô''é2û”p\nK‹X´ì'),
('ýfW©kâ¶‹/·ž·jë©', 'wp-content/plugins/buddypress/bp-forums/bbpress/bb-includes/backpress/class.ixr.php', 0, ';ú''\\*ž^›4¨îh%', ';ú''\\*ž^›4¨îh%'),
('ýŸÒ¦À¿¤$2¡bL¥$', 'wp-content/themes/twentyfourteen/sidebar.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ORná]&d—ûçþŽœn'),
('ý©Õ''æ€BâŠ­7SÂ', 'wp-includes/js/zxcvbn-async.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—§ž–¨²\0“V]u#3'),
('ý´ö×øõ)Ý(¤Ð<ÙÝ', 'wp-includes/js/json2.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ïAˆË`§ ôÈ¡è@«'),
('ýÍa„í''@Tç‘“‰õÖÊ', 'wp-admin/images/date-button.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '—Ž.ªÚI•V•Äö'),
('ýÎ?>À¸yz~K‘‹áQg', 'wp-content/plugins/buddypress/bp-settings/bp-settings-actions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '#12›Å÷Ä)‘\ZfK?&´'),
('þýþœ)z]!?»±aÀ', 'wp-admin/images/media-button-video.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '«ªÃßØ¿råxñ4QêçÐ'),
('þ2“}ý+x4fÚÍ	m…X', 'wp-content/plugins/wordpress-seo/admin/pages/dashboard.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÌÉŠ2i!i–À"5Ö9€2'),
('þG ÁÙ@DX”åMùH^ú', 'wp-content/plugins/wordpress-seo/js/jquery.qtip.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'tÓ`\Z(ÙÆ‰þ@7¼''/Ãå'),
('þI"íp¢ÐtÊQ¹É[Z6x', 'wp-includes/css/admin-bar.min.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Š<B\\Ü‡po/0d>''ƒH'),
('þcµÔwk(”‘ø43Ã', 'wp-admin/includes/list-table.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'š‚º£T8¬â>û¡_ß‚'),
('þQÖ¿6“Èyqä¢88', 'wp-includes/theme-compat/footer.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Æ ~C~ŽMÝéøµÉ='),
('þ²—œ×oa''°:\\.-ÛÉ', 'wp-content/plugins/google-analytics-for-wordpress/admin/class-admin-form.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÈZ@R ã­Œ{Þst'),
('þÝ·ÁUAŠÆÚ°En»àh‡', 'wp-content/plugins/siteorigin-panels/css/images/wpspin_light-2x.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ER½†fz£À‚µŠ'),
('þà¢¿w›ñ''¢6)', 'wp-includes/rss-functions.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'g³¸»²Ôl]¥4j0l='),
('ÿ|a»8Q6aù:Í', 'wp-content/plugins/papercite/img/pdf.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '‰iXWçwvHCRçJfön6'),
('ÿ;`º$rçŸËÑ$³ž¦=', 'wp-content/plugins/wordfence/images/icons/warning128.png', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'pÏGÀI×t*ö“ÆÊNp='),
('ÿ?¶”#¾êþM9\r¨', 'wp-content/themes/twentytwelve/page.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '7ø~ÝU¤ášóø¯¥ð&Ž}'),
('ÿLÙóêóe5x?e=æˆ&', 'wp-includes/js/plupload/wp-plupload.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ŽµSôyÈ,lf@­@'),
('ÿM\ZJœ°‘YÙºØ¾iÙ', 'wp-content/plugins/woocommerce/assets/js/frontend/price-slider.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'ÛmCóÐ|‡¯ç@b­TÚ '),
('ÿc¦IËÎã'' Ì\rÅ=Í°q', 'wp-content/plugins/papercite/format/plain.tpl', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '5Qi`ç4}´Ÿ™n—¹Á'),
('ÿr´»Iÿ!–›Æ', 'wp-content/themes/twentythirteen/content-audio.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '¡EçßÌ<cGœ½¿\r'),
('ÿ}_0E™–s—RuÖ¯¦³', 'wp-content/themes/twentythirteen/genericons/LICENSE.txt', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '²4îMiõüäHj€ý¯JBc'),
('ÿ‡·ÖM~ë^xù¼;‡ð', 'wp-content/plugins/wordfence/lib/unknownFiles.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'AÑ{ÑÉîUÀêÐz¤[ŠØ'),
('ÿ''ûØÐ¸*îõ™ýôA', 'wp-content/plugins/woocommerce/includes/shipping/flat-rate/includes/html-extra-costs.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'KÄÿçHB‘Aˆ—“Á\n'),
('ÿ¨a5[4ü5¼MepC', 'wp-includes/js/jquery/ui/effect-bounce.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '`×ù4z·“ŠõËï`dSñ'),
('ÿ¯|ÙÛÚ“Mó–­¡9“', 'wp-content/plugins/woocommerce/assets/js/prettyPhoto/jquery.prettyPhoto.min.js', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '3sZ«ê¸*Ž¶p„Í¤'),
('ÿ°ÕË–âfÄ\rõy‘ü(', 'wp-content/plugins/woocommerce/includes/gateways/simplify-commerce/includes/Simplify/Subscription.php', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'h¢y\nY)„Jž\rh$ÁÖÓ'),
('ÿµS©CRCþül¸Å', 'wp-admin/css/colors/sunrise/colors.scss', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'V’‡\ZŠzî	hÝù’=ì'),
('ÿ¾¥Â±ñþöhþ˜µº', 'wp-content/plugins/wordpress-seo/css/wpseo-rtl.css', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '$Pr Tƒ;­''GqÉx†'),
('ÿÄêkµËiîÐ.¼¥¸\\¥“', 'wp-includes/images/smilies/icon_neutral.gif', 1, '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Š•Ûú©˜	°‡®´Zí');

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
