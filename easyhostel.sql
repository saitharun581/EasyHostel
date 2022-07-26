-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2022 at 11:48 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `easyhostel`
--
CREATE DATABASE IF NOT EXISTS `easyhostel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `easyhostel`;

-- --------------------------------------------------------

--
-- Table structure for table `add_hostel_details`
--

CREATE TABLE IF NOT EXISTS `add_hostel_details` (
  `hostel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostelname` varchar(100) NOT NULL,
  `hostelownername` varchar(100) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `hostel_location` longtext NOT NULL,
  `wifi` varchar(100) NOT NULL,
  `water` varchar(100) NOT NULL,
  `beds` varchar(100) NOT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `image4` varchar(100) DEFAULT NULL,
  `price` varchar(100) NOT NULL,
  `rooms` varchar(100) NOT NULL,
  `staff` varchar(100) NOT NULL,
  `users` varchar(100) NOT NULL,
  `hostel_description` longtext,
  `status` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hostel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `add_hostel_details`
--

INSERT INTO `add_hostel_details` (`hostel_id`, `hostelname`, `hostelownername`, `contact`, `hostel_location`, `wifi`, `water`, `beds`, `image1`, `image2`, `image3`, `image4`, `price`, `rooms`, `staff`, `users`, `hostel_description`, `status`, `email`) VALUES
(3, 'tharun hostel''s', 'tharun', 9618716270, 'hyderabad meerpet 500097', 'Wifi', 'Cold-Water', '3-beds', 'images/ah1.jpg', 'images/ah2.jpg', 'images/ah3.jpg', 'images/ah4.jpg', '4000', '17', '7', '23', 'very good to stay luxury rooms full safe. ', NULL, 'tharun@gmail.com'),
(4, 'sai tharun', 'tharun', 9618716270, 'hyderabad ,. meerpet ,500097', 'Wifi', 'Hot-Water', '4-beds', 'images/bh1.jpg', 'images/bh2.jpg', 'images/bh3.jpeg', 'images/bh4.jpg', '4000', '17', '9', '45', 'very good to stay for students luxury rooms ', NULL, 'tharun581@gmail.com'),
(5, 'abhi jakka', 'abhi''s hostels', 6698741237, 'near gajularamaram hyderabad', 'No-Wifi', 'Cold-Water', '2-beds', 'images/ch1.jpg', 'images/ch2.jpg', 'images/ch3.jpg', 'images/ch4.jpg', '2500', '12', '3', '23', 'nice hostel for students good for stay', NULL, 'abhi@gmail.com'),
(6, 'abhi''s Hostels', 'abhi jakka', 96365479896, 'maisammaguda, hyderabad', 'Wifi', 'Hot-Water', '3-beds', 'images/dh1.jpg', 'images/dh2.jpg', 'images/dh3.jpg', 'images/dh4.jpg', '4000', '13', '6', '32', 'good for students nice rooms with wifi', NULL, 'abhi@gmail.com'),
(7, 'cloud Hostel''s', 'saddam', 56987412365, 'hyderabad,meerpet', 'No-Wifi', 'Cold-Water', '4-beds', 'images/eh1.jpg', 'images/eh2.jpg', 'images/eh3.jpg', 'images/eh4.jpg', '7000', '17', '5', '32', 'good for stay 24*7 security', NULL, 'saddam571@gmail.com'),
(8, 'cloud hostel''s', 'saddam', 56987412365, 'hyderabad meerpet', 'Wifi', 'Cold-Water', '3-beds', 'images/fh1.jpg', 'images/fh2.jpg', 'images/fh3.jpg', 'images/fh4.jpg', '4000', '17', '5', '32', 'luxury stay good for students', NULL, 'saddam@gmail.com'),
(9, 'bhagya hostels', 'bhagya', 96365479968, 'lb nagar, hyderabad', 'Wifi', 'Hot-Water', '3-beds', 'images/gh1.jpg', 'images/gh2.jpg', 'images/gh3.jpg', 'images/gh4.jpg', '7000', '13', '9', '43', 'good for stay luxury rooms ', NULL, 'bhagya@gmail.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

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
(25, 'Can add user register model', 7, 'add_userregistermodel'),
(26, 'Can change user register model', 7, 'change_userregistermodel'),
(27, 'Can delete user register model', 7, 'delete_userregistermodel'),
(28, 'Can view user register model', 7, 'view_userregistermodel'),
(29, 'Can add user profile model', 8, 'add_userprofilemodel'),
(30, 'Can change user profile model', 8, 'change_userprofilemodel'),
(31, 'Can delete user profile model', 8, 'delete_userprofilemodel'),
(32, 'Can view user profile model', 8, 'view_userprofilemodel'),
(33, 'Can add hostel owner register model', 9, 'add_hostelownerregistermodel'),
(34, 'Can change hostel owner register model', 9, 'change_hostelownerregistermodel'),
(35, 'Can delete hostel owner register model', 9, 'delete_hostelownerregistermodel'),
(36, 'Can view hostel owner register model', 9, 'view_hostelownerregistermodel'),
(37, 'Can add hostel owner profile model', 10, 'add_hostelownerprofilemodel'),
(38, 'Can change hostel owner profile model', 10, 'change_hostelownerprofilemodel'),
(39, 'Can delete hostel owner profile model', 10, 'delete_hostelownerprofilemodel'),
(40, 'Can view hostel owner profile model', 10, 'view_hostelownerprofilemodel'),
(41, 'Can add add hosteldetailos model', 11, 'add_addhosteldetailosmodel'),
(42, 'Can change add hosteldetailos model', 11, 'change_addhosteldetailosmodel'),
(43, 'Can delete add hosteldetailos model', 11, 'delete_addhosteldetailosmodel'),
(44, 'Can view add hosteldetailos model', 11, 'view_addhosteldetailosmodel'),
(45, 'Can add user hostel booking model', 12, 'add_userhostelbookingmodel'),
(46, 'Can change user hostel booking model', 12, 'change_userhostelbookingmodel'),
(47, 'Can delete user hostel booking model', 12, 'delete_userhostelbookingmodel'),
(48, 'Can view user hostel booking model', 12, 'view_userhostelbookingmodel'),
(49, 'Can add user send feedback model', 13, 'add_usersendfeedbackmodel'),
(50, 'Can change user send feedback model', 13, 'change_usersendfeedbackmodel'),
(51, 'Can delete user send feedback model', 13, 'delete_usersendfeedbackmodel'),
(52, 'Can view user send feedback model', 13, 'view_usersendfeedbackmodel');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'hostelapp', 'addhosteldetailosmodel'),
(10, 'hostelapp', 'hostelownerprofilemodel'),
(9, 'hostelapp', 'hostelownerregistermodel'),
(6, 'sessions', 'session'),
(12, 'userapp', 'userhostelbookingmodel'),
(8, 'userapp', 'userprofilemodel'),
(7, 'userapp', 'userregistermodel'),
(13, 'userapp', 'usersendfeedbackmodel');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-24 12:37:22.502641'),
(2, 'auth', '0001_initial', '2022-05-24 12:37:33.919765'),
(3, 'admin', '0001_initial', '2022-05-24 12:37:36.679077'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-24 12:37:36.720054'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-24 12:37:36.759032'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-24 12:37:38.079290'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-24 12:37:39.445398'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-24 12:37:41.186939'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-24 12:37:41.258911'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-24 12:37:41.999390'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-24 12:37:42.041102'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-24 12:37:42.105893'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-24 12:37:42.958423'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-24 12:37:43.983207'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-24 12:37:44.904179'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-24 12:37:44.966355'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-24 12:37:45.777751'),
(18, 'sessions', '0001_initial', '2022-05-24 12:37:46.741008'),
(19, 'userapp', '0001_initial', '2022-05-24 12:38:20.427915'),
(20, 'hostelapp', '0001_initial', '2022-05-24 12:38:47.437348'),
(21, 'hostelapp', '0002_addhosteldetailosmodel', '2022-05-26 07:27:44.605603'),
(22, 'hostelapp', '0003_addhosteldetailosmodel_hostel_description', '2022-05-26 10:43:45.654071'),
(23, 'userapp', '0002_auto_20220527_1548', '2022-05-27 10:19:10.857216'),
(24, 'hostelapp', '0004_hostelownerprofilemodel_user_id', '2022-05-27 10:38:08.224040'),
(25, 'hostelapp', '0005_remove_hostelownerprofilemodel_image', '2022-05-27 11:45:48.871116'),
(26, 'hostelapp', '0006_addhosteldetailosmodel_status', '2022-05-28 09:57:42.522599'),
(27, 'userapp', '0003_userhostelbookingmodel', '2022-05-30 08:38:53.860391'),
(28, 'userapp', '0004_usersendfeedbackmodel', '2022-05-31 09:57:02.476808'),
(29, 'userapp', '0005_usersendfeedbackmodel_hostel_id', '2022-05-31 11:47:26.073954'),
(30, 'userapp', '0006_auto_20220531_1724', '2022-05-31 11:54:33.176879'),
(31, 'userapp', '0007_userhostelbookingmodel_status', '2022-06-01 09:16:30.434624'),
(32, 'userapp', '0008_userhostelbookingmodel_email', '2022-06-03 09:18:42.193333'),
(33, 'hostelapp', '0007_addhosteldetailosmodel_email', '2022-06-03 10:32:03.643322');

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
('ppkin161d9g78n59e8gm73te2o8pch8u', 'eyJ1c2VyX2lkIjo3fQ:1nytxp:0um2mUckm5KSfFZR2ShgdGxdqyOCEmtNgSoBd1MuSbs', '2022-06-22 11:35:05.527225');

-- --------------------------------------------------------

--
-- Table structure for table `hostel_owner_details`
--

CREATE TABLE IF NOT EXISTS `hostel_owner_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hostel_owner_details`
--

INSERT INTO `hostel_owner_details` (`user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'sai', 'tharun', 'tharun@gmail.com', 'tharun123'),
(2, 'sai', 'kiran', 'kiran@gmail.com', 'kiran123'),
(7, 'jakkaa', 'abhinav', 'abhi@gmail.com', 'abHI123'),
(8, 'saddam', 'uddinn', 'saddam@gmail.com', 'sadDAM123'),
(9, 'fazall', 'khannn', 'fazal@gmail.com', 'faZAL123'),
(10, 'bhagya', 'sreeee', 'bhagya@gmail.com', 'bhaGYA123'),
(11, 'nannaa', 'pravalika', 'pravalika@gmail.com', 'praVALIKA123'),
(12, 'vinayy', 'reddyy', 'vinay@gmail.com', 'viNAY123');

-- --------------------------------------------------------

--
-- Table structure for table `hostel_owner_profile`
--

CREATE TABLE IF NOT EXISTS `hostel_owner_profile` (
  `prof_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prof_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hostel_owner_profile`
--

INSERT INTO `hostel_owner_profile` (`prof_id`, `full_name`, `mobile`, `address`, `user_id`) VALUES
(3, 'k.sai tharun', 9618716270, 'meerpet,Hyderabad', 1),
(4, 'abhi jakka', 9618698547, 'gajularamaram hyderabad', 7),
(5, 'saddam', 9848096587, 'NEW BALAJI NAGAR,meerpet', 8),
(6, 'bhagya', 9848096587, 'lbnagar hyderabad', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'sai', 'teja', 'teja@gmail.com', 'teja123'),
(2, 'sai ', 'kiran', 'kiran@gmail.com', 'kiran123'),
(6, 'sharath ', 'chandra', 'sharath@gmail.com', 'shaRATH123'),
(7, 'saisai', 'kishore', 'kishore@gmail.com', 'kisHORE123'),
(8, 'saisai', 'satish', 'satish@gmail.com', 'satISH123'),
(9, 'sandeep', 'sandyy', 'sandy@gmail.com', 'saNDY123'),
(10, 'peddaa', 'tilluu', 'tillu@gmail.com', 'tiLLU123'),
(11, 'pranay', 'babloo', 'babloo@gmail.com', 'baBLOO123');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

CREATE TABLE IF NOT EXISTS `user_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Booking_id` int(11) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Feedback` longtext NOT NULL,
  `Hostel_id` int(11) DEFAULT NULL,
  `Hostel_location` varchar(100) DEFAULT NULL,
  `Hostel_name` varchar(100) DEFAULT NULL,
  `Hostel_owner_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user_feedback`
--

INSERT INTO `user_feedback` (`id`, `Booking_id`, `Name`, `Feedback`, `Hostel_id`, `Hostel_location`, `Hostel_name`, `Hostel_owner_name`) VALUES
(5, 4, 'teja', 'very good hostel easy to stay  luxury rooms very quick response ', 3, 'hyderabad meerpet 500097', 'tharun hostel''s', 'tharun'),
(6, 5, 'imroze', 'easy stay very responsive  good wifi', 5, 'near gajularamaram hyderabad', 'abhi jakka', 'abhi''s hostels'),
(7, 8, 'sharath', 'very good to stay good for students quick response', 7, 'hyderabad,meerpet', 'cloud Hostel''s', 'saddam'),
(8, 9, 'sandeep', 'average hostels average staff not so responsive\r\n', 8, 'hyderabad meerpet', 'cloud hostel''s', 'saddam');

-- --------------------------------------------------------

--
-- Table structure for table `user_hostel_booking`
--

CREATE TABLE IF NOT EXISTS `user_hostel_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `profilepic` varchar(100) DEFAULT NULL,
  `fathername` varchar(100) NOT NULL,
  `phone_no` varchar(100) NOT NULL,
  `aadhar_no` varchar(100) NOT NULL,
  `aadharpic` varchar(100) DEFAULT NULL,
  `address` longtext NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_hostel_booking`
--

INSERT INTO `user_hostel_booking` (`booking_id`, `hostel_id`, `user_id`, `fullname`, `profilepic`, `fathername`, `phone_no`, `aadhar_no`, `aadharpic`, `address`, `status`, `email`) VALUES
(4, 3, 1, 'teja', 'images/pexels-photo-2379005_yK6dXoE.jpeg', 'ramesh', '9618716270', '598745632145', 'images/936734-aadhaar-card.jpg', 'meerpet', NULL, 'teja961871@gmail.com'),
(5, 5, 1, 'imroze', 'images/istockphoto-1200677760-612x612.jpg', 'ramesh', '321321654654', '598745638965', 'images/images.jpg', 'NEW BALAJI NAGAR,meerpet', NULL, 'imr1871@gmail.com'),
(6, 5, 2, 'kiran', 'images/istockphoto-1200677760-612x612_12IrfhH.jpg', 'ramulu', '6985471236', '598745632145', 'images/936734-aadhaar-card_Y4dZFaU.jpg', 'hyderabad lb nagar ', NULL, 'kiran@gmail.com'),
(7, 6, 2, 'ramesh', 'images/photo-1506794778202-cad84cf45f1d.jpg', 'ellaiah', '9618789695', '598745632145', 'images/936734-aadhaar-card_AdUc80g.jpg', 'meerpet', NULL, 'rams@gmail.com'),
(8, 7, 6, 'sharath', 'images/photo-1506794778202-cad84cf45f1d_otrWBB4.jpg', 'k.sai', '96528716270', '598745638965', 'images/936734-aadhaar-card_V04bfWz.jpg', 'meerpet', NULL, 'sharath@gmail.com'),
(9, 8, 6, 'sandeep', 'images/photo-1506794778202-cad84cf45f1d_VLizbEb.jpg', 'k.sai', '9618719658', '598745632145', 'images/936734-aadhaar-card_C6UOmrT.jpg', 'meerpet', NULL, 'sandy@gmail.cojm'),
(10, 3, 1, 'tharun', 'images/photo-1506794778202-cad84cf45f1d_U2UtBK6.jpg', 'k.sai', '9618716270', '598745632145', 'images/936734-aadhaar-card_nuhYSbj.jpg', 'meerpet', NULL, 'tharun961871@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `Full_name` varchar(100) NOT NULL,
  `aadhar` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `Full_name`, `aadhar`, `email`, `phone_no`, `location`, `image`) VALUES
(2, 1, 'k.sai teja', '696554798658', 'tej@gmail.com', '96478563214', 'hyderabad', 'images/pexels-photo-2379005.jpeg'),
(3, 2, 'k.sai kiran', '696554798658', 'kiran@gmail.com', '9658741236', 'hydervabad', 'images/pexels-photo-2379005_uuPNmDG.jpeg'),
(4, 6, 'sharath chandra', '696554798658', 'sharath@gmail.com', '9658741236', 'hyderabad', 'images/photo-1506794778202-cad84cf45f1d_yxj8Cwp.jpg');

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
