-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 07:37 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `autentication`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add images', 7, 'add_images'),
(26, 'Can change images', 7, 'change_images'),
(27, 'Can delete images', 7, 'delete_images'),
(28, 'Can view images', 7, 'view_images'),
(29, 'Can add password_images', 8, 'add_password_images'),
(30, 'Can change password_images', 8, 'change_password_images'),
(31, 'Can delete password_images', 8, 'delete_password_images'),
(32, 'Can view password_images', 8, 'view_password_images'),
(33, 'Can add register', 9, 'add_register'),
(34, 'Can change register', 9, 'change_register'),
(35, 'Can delete register', 9, 'delete_register'),
(36, 'Can view register', 9, 'view_register');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'files', 'images'),
(8, 'files', 'password_images'),
(9, 'files', 'register'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-06 04:05:39.215708'),
(2, 'auth', '0001_initial', '2023-10-06 04:05:41.292927'),
(3, 'admin', '0001_initial', '2023-10-06 04:05:41.670631'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-06 04:05:41.686572'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-06 04:05:41.699604'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-06 04:05:41.780037'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-06 04:05:41.811282'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-06 04:05:41.846834'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-06 04:05:41.860354'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-06 04:05:41.899820'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-06 04:05:41.899820'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-06 04:05:41.914014'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-06 04:05:41.949625'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-06 04:05:41.985006'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-06 04:05:42.027802'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-06 04:05:42.029934'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-06 04:05:42.066610'),
(18, 'files', '0001_initial', '2023-10-06 04:05:42.229268'),
(19, 'sessions', '0001_initial', '2023-10-06 04:05:42.552884');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ms3utb4u9yequ8rtpq9swepq9uf15iv2', 'eyJvdHAiOjcyMjksImltYWdlX2lkcyI6IlsnNCcsICc1J10iLCJ1c3JfZW1haWwiOiJqZXJpbmphbWVzNzA3QGdtYWlsLmNvbSIsInVpZCI6Mn0:1qy4bW:zE5rI-wsIY8F3DLbL4VlaTHoIes8HaIKfE8SWVbgE8k', '2023-11-15 06:21:26.255444'),
('ni9crdgpqa410m3ztrvc158rpu6sviyk', 'eyJvdHAiOjIwODAsImltYWdlX2lkcyI6IlsnNCcsICc1J10iLCJ1c3JfZW1haWwiOiJqZXJpbmphbWVzNzA3QGdtYWlsLmNvbSJ9:1qodFq:XZR0jLNJQ1A6xOhcffp1ZI8HukmyRtxo4EcICW65R2c', '2023-10-20 05:20:02.225039'),
('slz6o4nhqtdw6lbe0zab8o8775f0curn', 'e30:1r1L9D:ZGXwOPfy0eaBSW2osUBz0wBPMcWfzqGtmANuYK-evFI', '2023-11-24 06:37:43.831282'),
('vn15ugqcmg741b55pxiasmdvlzjf08uo', '.eJyrVsovKVCyMjM2NddRysxNTE-Nz0wpVrJSilY3V9dRULdUj1XSUSotLopPzU3MzAFKZKUWZeZlJeamFpsbmDukg0T1kvNzgaoSU3Iz81JSS4AiIBPAXEwFMBmlWgBriigI:1r1J98:VSgqak2ycE9Nvn99ExT0oQrqxx4I11XkBWVkh8-Uvwo', '2023-11-24 04:29:30.155907');

-- --------------------------------------------------------

--
-- Table structure for table `files_images`
--

CREATE TABLE IF NOT EXISTS `files_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `files_password_images`
--

CREATE TABLE IF NOT EXISTS `files_password_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `files_password_images`
--

INSERT INTO `files_password_images` (`id`, `category`, `image`) VALUES
(1, 'car', '0.jpeg'),
(2, 'car', '23_nPKjJk5.jpg'),
(3, 'car', 'modified-swift-3-c1e1.jpg'),
(4, 'fruits', 'stock-photo-strawberries-isolated-on-white-background-ripe-fresh-strawberry-clipping-path-professional-studio-1349100626.jpg'),
(5, 'fruits', 'photo-1550258987-190a2d41a8ba.jpeg'),
(6, 'fruits', 'red_apple.jpg'),
(7, 'Animals', 'photo-1592670130429-fa412d400f50.jpeg'),
(8, 'Animals', 'hero_zebra_animals.jpg'),
(9, 'Animals', 'tiger_laying_hero_background.jpg'),
(10, 'Birds', 'Lovebirds-on-fence.jpg'),
(11, 'Birds', 'Two-Macaws-on-a-perch-1-768x514.jpeg'),
(12, 'Birds', 'kingfisher-2046453_640.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `files_register`
--

CREATE TABLE IF NOT EXISTS `files_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `image_category` varchar(150) NOT NULL,
  `image_ids` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
