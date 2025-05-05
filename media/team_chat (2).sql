-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 11:44 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `team_chat`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

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
(25, 'Can add chats', 7, 'add_chats'),
(26, 'Can change chats', 7, 'change_chats'),
(27, 'Can delete chats', 7, 'delete_chats'),
(28, 'Can view chats', 7, 'view_chats'),
(29, 'Can add discussion_tbl', 8, 'add_discussion_tbl'),
(30, 'Can change discussion_tbl', 8, 'change_discussion_tbl'),
(31, 'Can delete discussion_tbl', 8, 'delete_discussion_tbl'),
(32, 'Can view discussion_tbl', 8, 'view_discussion_tbl'),
(33, 'Can add files_tbl', 9, 'add_files_tbl'),
(34, 'Can change files_tbl', 9, 'change_files_tbl'),
(35, 'Can delete files_tbl', 9, 'delete_files_tbl'),
(36, 'Can view files_tbl', 9, 'view_files_tbl'),
(37, 'Can add member_reg', 10, 'add_member_reg'),
(38, 'Can change member_reg', 10, 'change_member_reg'),
(39, 'Can delete member_reg', 10, 'delete_member_reg'),
(40, 'Can view member_reg', 10, 'view_member_reg'),
(41, 'Can add tasks', 11, 'add_tasks'),
(42, 'Can change tasks', 11, 'change_tasks'),
(43, 'Can delete tasks', 11, 'delete_tasks'),
(44, 'Can view tasks', 11, 'view_tasks'),
(45, 'Can add team_reg', 12, 'add_team_reg'),
(46, 'Can change team_reg', 12, 'change_team_reg'),
(47, 'Can delete team_reg', 12, 'delete_team_reg'),
(48, 'Can view team_reg', 12, 'view_team_reg'),
(49, 'Can add video_conference', 13, 'add_video_conference'),
(50, 'Can change video_conference', 13, 'change_video_conference'),
(51, 'Can delete video_conference', 13, 'delete_video_conference'),
(52, 'Can view video_conference', 13, 'view_video_conference'),
(53, 'Can add public_key_table', 14, 'add_public_key_table'),
(54, 'Can change public_key_table', 14, 'change_public_key_table'),
(55, 'Can delete public_key_table', 14, 'delete_public_key_table'),
(56, 'Can view public_key_table', 14, 'view_public_key_table');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'teams', 'chats'),
(8, 'teams', 'discussion_tbl'),
(9, 'teams', 'files_tbl'),
(10, 'teams', 'member_reg'),
(14, 'teams', 'public_key_table'),
(11, 'teams', 'tasks'),
(12, 'teams', 'team_reg'),
(13, 'teams', 'video_conference');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-04 09:29:04.591475'),
(2, 'auth', '0001_initial', '2023-11-04 09:29:05.053014'),
(3, 'admin', '0001_initial', '2023-11-04 09:29:05.180057'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-04 09:29:05.189227'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-04 09:29:05.192628'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-04 09:29:05.265885'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-04 09:29:05.321295'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-04 09:29:05.353879'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-04 09:29:05.373727'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-04 09:29:05.407096'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-04 09:29:05.418481'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-04 09:29:05.420782'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-04 09:29:05.470458'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-04 09:29:05.514274'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-04 09:29:05.573678'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-04 09:29:05.584941'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-04 09:29:05.618242'),
(18, 'sessions', '0001_initial', '2023-11-04 09:29:05.671382'),
(19, 'teams', '0001_initial', '2023-11-04 09:29:06.064351'),
(20, 'teams', '0002_public_key_table', '2023-11-04 17:12:19.291042'),
(21, 'teams', '0003_auto_20231105_0023', '2023-11-04 18:54:06.276613'),
(22, 'teams', '0004_rename_team_public_key_public_key_table_mem_team_public_key', '2023-11-04 19:11:29.962164'),
(23, 'teams', '0005_chats_iv', '2023-11-04 20:21:57.096050'),
(24, 'teams', '0006_auto_20231105_0153', '2023-11-04 20:23:40.181083'),
(25, 'teams', '0007_auto_20231106_1402', '2023-11-06 08:32:58.733543');

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
('nw61wbffc1epq264y1vjslxea7uw8swt', 'e30:1qzwiP:UGqxupx8vVXPJqMX20aK5mtYWmqQko6UWnGIhGoWZIs', '2023-11-20 10:20:17.301021'),
('opipm091mf3vt1wyalbk7k86peq698su', 'e30:1qzfSX:e-zhKGuqo8Nu1jDcsOX7xU63CljoeGGyVHKglln7xZw', '2023-11-19 15:54:45.408930');

-- --------------------------------------------------------

--
-- Table structure for table `teams_chats`
--

CREATE TABLE IF NOT EXISTS `teams_chats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(150) NOT NULL,
  `team_id` varchar(150) NOT NULL,
  `mem_msg` longblob NOT NULL,
  `team_msg` longblob NOT NULL,
  `iv` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `teams_chats`
--

INSERT INTO `teams_chats` (`id`, `mem_id`, `team_id`, `mem_msg`, `team_msg`, `iv`) VALUES
(1, '1', '1', 0x84787f522a, '', 0x310f7ecaeedc27e6641a0ab50ff3f899),
(2, '1', '1', '', 0x1500b3704f, 0x7a8891bdba7f6064fc48e6c3adac8912),
(3, '2', '2', '', 0x17b2466101338d, 0x054f65f31e0cefbb72292f26ef1c5d0c),
(4, '2', '2', 0xf29907d3bb, '', 0xc21f260ffb5696e7848921f53d064942),
(5, '3', '1', 0x75869998, '', 0xa109ccbbe113af00c865611d44714429),
(6, '3', '1', '', 0xa0c64310fb, 0x201df65a361ddf7dae7c6e7426061615);

-- --------------------------------------------------------

--
-- Table structure for table `teams_files_tbl`
--

CREATE TABLE IF NOT EXISTS `teams_files_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(150) NOT NULL,
  `member_name` varchar(150) NOT NULL,
  `member_id` varchar(150) NOT NULL,
  `team_id` varchar(150) NOT NULL,
  `file` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teams_member_reg`
--

CREATE TABLE IF NOT EXISTS `teams_member_reg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `dept_id` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `teams_member_reg`
--

INSERT INTO `teams_member_reg` (`id`, `name`, `dept_id`, `email`, `phone`, `password`, `address`) VALUES
(1, 'jerin', '1', 'j@gmail.com', '9645345637', '1234', 'Pathanamthitta'),
(2, 'davood', '2', 'da@gmail.com', '9809898987', '1234', 'Kollam'),
(3, 'bob', '1', 'bob@gmail.com', '9645345637', '1234', 'dshj');

-- --------------------------------------------------------

--
-- Table structure for table `teams_public_key_table`
--

CREATE TABLE IF NOT EXISTS `teams_public_key_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(150) NOT NULL,
  `team_id` varchar(150) NOT NULL,
  `member_public_key` varchar(150) NOT NULL,
  `mem_team_public_key` varchar(150) NOT NULL,
  `base` varchar(150) NOT NULL,
  `prime` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `teams_public_key_table`
--

INSERT INTO `teams_public_key_table` (`id`, `member_id`, `team_id`, `member_public_key`, `mem_team_public_key`, `base`, `prime`) VALUES
(1, '1', '1', '6', '8', '5', '23'),
(2, '2', '2', '5', '11', '5', '23'),
(3, '3', '1', '21', '21', '5', '23');

-- --------------------------------------------------------

--
-- Table structure for table `teams_team_reg`
--

CREATE TABLE IF NOT EXISTS `teams_team_reg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(150) NOT NULL,
  `no_membrs` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `teams_team_reg`
--

INSERT INTO `teams_team_reg` (`id`, `deptname`, `no_membrs`, `email`, `phone`, `password`) VALUES
(1, 'Design', '3', 'd@gmail.com', '9645345637', '1234'),
(2, 'Backend team', '2', 'b@gmail.com', '9645345637', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `teams_video_conference`
--

CREATE TABLE IF NOT EXISTS `teams_video_conference` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `team_id` varchar(150) NOT NULL,
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
