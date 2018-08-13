-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 13, 2018 at 06:46 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olamua`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '2018-07-28 19:46:46', '2018-07-28 19:46:46'),
(2, 1, '::1', '2018-08-11 17:19:53', '2018-08-11 17:19:53'),
(3, 1, '::1', '2018-08-13 01:28:08', '2018-08-13 01:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
(1, 'Dung', 'Le', 'dunglh', 'dunglh@olamua.localhost', '$2y$10$6YLEl/kPIEXloM88wSD47OyEJiwDx2m3FzRbLtzzIEiPau5vDpnZO', NULL, '$2y$10$56ZMZbuSMBzWgfwoQd/mmOuEJlHaFDoVJdUT5PfjouyCp0iwRyuvm', NULL, '', 1, 2, NULL, '2018-08-13 01:28:07', '2018-07-28 19:46:34', '2018-08-13 01:28:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2018-07-28 19:46:34', '2018-07-28 19:46:34', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2018-07-28 19:46:34', '2018-07-28 19:46:34'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2018-07-28 19:46:34', '2018-07-28 19:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '::1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dunglh_shop_categories`
--

CREATE TABLE `dunglh_shop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dunglh_shop_categories`
--

INSERT INTO `dunglh_shop_categories` (`id`, `name`, `slug`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Hoa', 'hoa', '', NULL, 1, 2, 0, '2018-08-13 02:48:59', '2018-08-13 02:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `dunglh_shop_products`
--

CREATE TABLE `dunglh_shop_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `is_customizable` tinyint(1) NOT NULL DEFAULT '0',
  `is_wrappable` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dunglh_shop_products`
--

INSERT INTO `dunglh_shop_products` (`id`, `name`, `slug`, `description`, `price`, `sale_price`, `is_customizable`, `is_wrappable`, `is_featured`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Hoa hộp gỗ: Động lực mới', 'hoa-hop-go-dong-luc-moi', '<p>Hoa hộp gỗ: Động lực mới bao gồm các loại hoa:</p>\r\n\r\n<p>- Hoa hồng dâu</p>\r\n\r\n<p>- Hoa hướng dương</p>\r\n\r\n<p>- Hoa hồ điệp</p>\r\n\r\n<p>- Hoa hồng môn xanh</p>\r\n\r\n<p>- Lá và các phụ liệu khác</p>', 740000, 600000, 0, 0, 1, 1, '2018-08-13 02:52:15', '2018-08-13 02:57:40'),
(2, 'Hoa chúc mừng : Điều bất ngờ', 'hoa-chuc-mung-dieu-bat-ngo', '<p><strong>Mẫu Hoa chúc mừng : Điều bất ngờ&nbsp;</strong>bao gồm các loại hoa:</p>\r\n\r\n<p>- Hoa sen trắng</p>\r\n\r\n<p>- Hoa hồ điệp trắng</p>\r\n\r\n<p>- Hoa green whicky</p>\r\n\r\n<p>- Hoa hồng đỏ</p>\r\n\r\n<p>-Hoa chuỗi ngọc đỏ</p>\r\n\r\n<p>-Lá và phụ liệu khác</p>', 1000000, 0, 0, 0, 1, 1, '2018-08-13 02:55:55', '2018-08-13 02:57:49'),
(3, 'Hoa chúc mừng : Niềm vui bất ngờ', 'hoa-chuc-mung-niem-vui-bat-ngo', '<p>Hoa chúc mừng : Niềm vui bất ngờ bao gồm các loại hoa:</p>\r\n\r\n<p>- Hoa hồng da</p>\r\n\r\n<p>- Hoa green whicky</p>\r\n\r\n<p>- Hoa loa kèn</p>\r\n\r\n<p>- Hoa chuỗi ngọc</p>\r\n\r\n<p>- Hoa mõm sói</p>', 800000, 750000, 0, 0, 1, 1, '2018-08-13 02:57:34', '2018-08-13 02:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `dunglh_shop_products_categories`
--

CREATE TABLE `dunglh_shop_products_categories` (
  `product_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dunglh_shop_products_categories`
--

INSERT INTO `dunglh_shop_products_categories` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2013_10_01_000001_Db_Backend_Users', 2),
(26, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(27, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(28, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(29, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(30, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(31, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(32, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(33, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(34, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(35, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(36, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(37, '2017_10_01_000003_Db_Cms_Theme_Logs', 3);

-- --------------------------------------------------------

--
-- Table structure for table `peterhegman_slickslider_slide_shows`
--

CREATE TABLE `peterhegman_slickslider_slide_shows` (
  `id` int(10) UNSIGNED NOT NULL,
  `slide_show_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide_show_content` text COLLATE utf8mb4_unicode_ci,
  `autoplay` tinyint(1) DEFAULT NULL,
  `accessibility` tinyint(1) DEFAULT NULL,
  `adaptive_height` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `prev_arrow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_arrow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_mode` tinyint(1) DEFAULT NULL,
  `center_padding` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_ease` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dots` tinyint(1) DEFAULT NULL,
  `dots_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draggable` tinyint(1) DEFAULT NULL,
  `fade` tinyint(1) DEFAULT NULL,
  `focus_on_select` tinyint(1) DEFAULT NULL,
  `easing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edge_friction` double DEFAULT NULL,
  `infinite` tinyint(1) DEFAULT NULL,
  `initial_slide` int(11) DEFAULT NULL,
  `lazy_load` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pause_on_focus` tinyint(1) DEFAULT NULL,
  `pause_on_hover` tinyint(1) DEFAULT NULL,
  `pause_on_dots_hover` tinyint(1) DEFAULT NULL,
  `responsive` text COLLATE utf8mb4_unicode_ci,
  `rows` int(11) DEFAULT NULL,
  `slides_per_row` int(11) DEFAULT NULL,
  `slides_to_show` int(11) DEFAULT NULL,
  `slides_to_scroll` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `swipe` tinyint(1) DEFAULT NULL,
  `touch_move` tinyint(1) DEFAULT NULL,
  `touch_threshold` int(11) DEFAULT NULL,
  `use_css` tinyint(1) DEFAULT NULL,
  `use_transform` tinyint(1) DEFAULT NULL,
  `vertical` tinyint(1) DEFAULT NULL,
  `vertical_swiping` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `wait_for_animate` tinyint(1) DEFAULT NULL,
  `z_index` int(11) DEFAULT NULL,
  `slide_show_height` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_jquery` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peterhegman_slickslider_slide_shows`
--

INSERT INTO `peterhegman_slickslider_slide_shows` (`id`, `slide_show_title`, `slide_show_content`, `autoplay`, `accessibility`, `adaptive_height`, `autoplay_speed`, `arrows`, `prev_arrow`, `next_arrow`, `center_mode`, `center_padding`, `css_ease`, `dots`, `dots_class`, `draggable`, `fade`, `focus_on_select`, `easing`, `edge_friction`, `infinite`, `initial_slide`, `lazy_load`, `pause_on_focus`, `pause_on_hover`, `pause_on_dots_hover`, `responsive`, `rows`, `slides_per_row`, `slides_to_show`, `slides_to_scroll`, `speed`, `swipe`, `touch_move`, `touch_threshold`, `use_css`, `use_transform`, `vertical`, `vertical_swiping`, `rtl`, `wait_for_animate`, `z_index`, `slide_show_height`, `include_jquery`) VALUES
(1, 'Homepage slideshow', '[{"slide_image":"\\/dat-hoa-online994.jpg","slide_title":"","slide_link":"","slide_description":""},{"slide_image":"\\/giam-20k458.jpg","slide_title":"","slide_link":"","slide_description":""},{"slide_image":"\\/hoatuoi360895.jpg","slide_title":"","slide_link":"","slide_description":""}]', 0, 1, 0, 3000, 1, '<button type="button" class="slick-prev">Previous</button>', '<button type="button" class="slick-next">Next</button>', 0, '50px', 'ease', 0, NULL, 1, 0, 0, 'linear', 0.15, 1, 0, 'ondemand', 1, 1, 1, '[]', 1, 1, 1, 1, 300, 1, 1, 5, 1, 1, 0, 0, 0, 1, 1000, '500px', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2018-08-11 18:50:12', '2018-08-11 18:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_index` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_follow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`, `seo_title`, `seo_description`, `seo_keywords`, `canonical_url`, `redirect_url`, `robot_index`, `robot_follow`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2018-08-11 18:50:12', 1, '2018-08-11 18:50:12', '2018-08-11 18:50:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_user_mail_blockers`
--

CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Console\\Exception\\CommandNotFoundException: Command "october:refresh" is not defined.\n\nDid you mean one of these?\n    migrate:fresh\n    migrate:refresh\n    october:down\n    october:env\n    october:fresh\n    october:install\n    october:mirror\n    october:up\n    october:update\n    october:util\n    plugin:refresh in C:\\wamp64\\www\\olamua\\vendor\\symfony\\console\\Application.php:618\nStack trace:\n#0 C:\\wamp64\\www\\olamua\\vendor\\symfony\\console\\Application.php(229): Symfony\\Component\\Console\\Application->find(\'october:refresh\')\n#1 C:\\wamp64\\www\\olamua\\vendor\\symfony\\console\\Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#2 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#3 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#4 C:\\wamp64\\www\\olamua\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#5 {main}', NULL, '2018-08-11 18:47:11', '2018-08-11 18:47:11'),
(2, 'error', 'October\\Rain\\Exception\\ApplicationException: The model must implement the NestedTree or Sortable traits. in C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\ReorderController.php:220\nStack trace:\n#0 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\ReorderController.php(102): Backend\\Behaviors\\ReorderController->validateModel()\n#1 [internal function]: Backend\\Behaviors\\ReorderController->reorder()\n#2 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#3 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'reorder\', Array)\n#4 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'reorder\', Array)\n#5 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(351): call_user_func_array(Array, Array)\n#6 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(247): Backend\\Classes\\Controller->execPageAction(\'reorder\', Array)\n#7 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'reorder\', Array)\n#8 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#9 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#10 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#12 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#13 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#14 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#43 C:\\wamp64\\www\\olamua\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#44 {main}', NULL, '2018-08-12 09:11:17', '2018-08-12 09:11:17'),
(3, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Dunglh\\shop\\Models\\ProductCategory\' not found in C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Concerns\\HasRelationships.php:653\nStack trace:\n#0 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(542): Illuminate\\Database\\Eloquent\\Model->newRelatedInstance(\'Dunglh\\\\shop\\\\Mod...\')\n#1 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(269): October\\Rain\\Database\\Model->belongsToMany(\'Dunglh\\\\shop\\\\Mod...\', \'dunglh_shop_pro...\', NULL, NULL, NULL, NULL, \'categories\')\n#2 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Model.php(425): October\\Rain\\Database\\Model->handleRelation(\'categories\')\n#3 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(684): October\\Rain\\Database\\Model->__call(\'categories\', Array)\n#4 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(692): October\\Rain\\Database\\Model->getRelationValue(\'categories\')\n#5 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(621): Backend\\Classes\\FormField->getFieldNameFromData(\'categories\', Object(Dunglh\\Shop\\Models\\Product), NULL)\n#6 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(917): Backend\\Classes\\FormField->getValueFromData(Object(Dunglh\\Shop\\Models\\Product), NULL)\n#7 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(697): Backend\\Widgets\\Form->getFieldValue(Object(Backend\\Classes\\FormField))\n#8 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(546): Backend\\Widgets\\Form->makeFormField(\'categories\', Array)\n#9 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(445): Backend\\Widgets\\Form->addFields(Array, \'primary\')\n#10 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(153): Backend\\Widgets\\Form->defineFormFields()\n#11 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(163): Backend\\Widgets\\Form->bindToController()\n#12 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(209): Backend\\Behaviors\\FormController->initForm(Object(Dunglh\\Shop\\Models\\Product))\n#13 [internal function]: Backend\\Behaviors\\FormController->create()\n#14 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#15 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create\', Array)\n#16 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create\', Array)\n#17 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(351): call_user_func_array(Array, Array)\n#18 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(247): Backend\\Classes\\Controller->execPageAction(\'create\', Array)\n#19 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#20 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#21 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#22 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#23 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#24 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#25 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#26 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#45 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#46 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#47 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#48 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 C:\\wamp64\\www\\olamua\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2018-08-12 09:16:32', '2018-08-12 09:16:32'),
(4, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Dunglh\\shop\\Models\\Category\' not found in C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Concerns\\HasRelationships.php:653\nStack trace:\n#0 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(542): Illuminate\\Database\\Eloquent\\Model->newRelatedInstance(\'Dunglh\\\\shop\\\\Mod...\')\n#1 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(269): October\\Rain\\Database\\Model->belongsToMany(\'Dunglh\\\\shop\\\\Mod...\', \'dunglh_shop_pro...\', NULL, NULL, NULL, NULL, \'categories\')\n#2 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Model.php(425): October\\Rain\\Database\\Model->handleRelation(\'categories\')\n#3 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(684): October\\Rain\\Database\\Model->__call(\'categories\', Array)\n#4 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(692): October\\Rain\\Database\\Model->getRelationValue(\'categories\')\n#5 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(621): Backend\\Classes\\FormField->getFieldNameFromData(\'categories\', Object(Dunglh\\Shop\\Models\\Product), NULL)\n#6 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(917): Backend\\Classes\\FormField->getValueFromData(Object(Dunglh\\Shop\\Models\\Product), NULL)\n#7 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(697): Backend\\Widgets\\Form->getFieldValue(Object(Backend\\Classes\\FormField))\n#8 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(546): Backend\\Widgets\\Form->makeFormField(\'categories\', Array)\n#9 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(445): Backend\\Widgets\\Form->addFields(Array, \'primary\')\n#10 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(153): Backend\\Widgets\\Form->defineFormFields()\n#11 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(163): Backend\\Widgets\\Form->bindToController()\n#12 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(209): Backend\\Behaviors\\FormController->initForm(Object(Dunglh\\Shop\\Models\\Product))\n#13 [internal function]: Backend\\Behaviors\\FormController->create()\n#14 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#15 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create\', Array)\n#16 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create\', Array)\n#17 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(351): call_user_func_array(Array, Array)\n#18 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(247): Backend\\Classes\\Controller->execPageAction(\'create\', Array)\n#19 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#20 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#21 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#22 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#23 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#24 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#25 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#26 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#45 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#46 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#47 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#48 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 C:\\wamp64\\www\\olamua\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2018-08-12 09:16:54', '2018-08-12 09:16:54'),
(5, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'Dunglh\\shop\\Models\\Category\' not found in C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Concerns\\HasRelationships.php:653\nStack trace:\n#0 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(542): Illuminate\\Database\\Eloquent\\Model->newRelatedInstance(\'Dunglh\\\\shop\\\\Mod...\')\n#1 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(269): October\\Rain\\Database\\Model->belongsToMany(\'Dunglh\\\\shop\\\\Mod...\', \'dunglh_shop_pro...\', NULL, NULL, NULL, NULL, \'categories\')\n#2 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Model.php(425): October\\Rain\\Database\\Model->handleRelation(\'categories\')\n#3 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Database\\Concerns\\HasRelationships.php(684): October\\Rain\\Database\\Model->__call(\'categories\', Array)\n#4 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(692): October\\Rain\\Database\\Model->getRelationValue(\'categories\')\n#5 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\FormField.php(621): Backend\\Classes\\FormField->getFieldNameFromData(\'categories\', Object(Dunglh\\Shop\\Models\\Product), NULL)\n#6 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(917): Backend\\Classes\\FormField->getValueFromData(Object(Dunglh\\Shop\\Models\\Product), NULL)\n#7 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(697): Backend\\Widgets\\Form->getFieldValue(Object(Backend\\Classes\\FormField))\n#8 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(546): Backend\\Widgets\\Form->makeFormField(\'categories\', Array)\n#9 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(445): Backend\\Widgets\\Form->addFields(Array, \'primary\')\n#10 C:\\wamp64\\www\\olamua\\modules\\backend\\widgets\\Form.php(153): Backend\\Widgets\\Form->defineFormFields()\n#11 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(163): Backend\\Widgets\\Form->bindToController()\n#12 C:\\wamp64\\www\\olamua\\modules\\backend\\behaviors\\FormController.php(209): Backend\\Behaviors\\FormController->initForm(Object(Dunglh\\Shop\\Models\\Product))\n#13 [internal function]: Backend\\Behaviors\\FormController->create()\n#14 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#15 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Extension\\Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create\', Array)\n#16 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create\', Array)\n#17 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(351): call_user_func_array(Array, Array)\n#18 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\Controller.php(247): Backend\\Classes\\Controller->execPageAction(\'create\', Array)\n#19 C:\\wamp64\\www\\olamua\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#20 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#21 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#22 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#23 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#24 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#25 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#26 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#45 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#46 C:\\wamp64\\www\\olamua\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#47 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#48 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 C:\\wamp64\\www\\olamua\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 C:\\wamp64\\www\\olamua\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2018-08-12 09:16:56', '2018-08-12 09:16:56');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(6, 'error', 'PDOException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'sale_price\' cannot be null in /var/www/html/olamua/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOStatement.php:105\nStack trace:\n#0 /var/www/html/olamua/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOStatement.php(105): PDOStatement->execute(NULL)\n#1 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(458): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#2 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `du...\', Array)\n#3 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `du...\', Array, Object(Closure))\n#4 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(459): Illuminate\\Database\\Connection->run(\'insert into `du...\', Array, Object(Closure))\n#5 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(411): Illuminate\\Database\\Connection->statement(\'insert into `du...\', Array)\n#6 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Processors/Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `du...\', Array)\n#7 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2159): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(October\\Rain\\Database\\QueryBuilder), \'insert into `du...\', Array, \'id\')\n#8 /var/www/html/olamua/vendor/october/rain/src/Database/QueryBuilder.php(276): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#9 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1285): October\\Rain\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#10 /var/www/html/olamua/vendor/october/rain/src/Database/Builder.php(178): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(722): October\\Rain\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(687): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(October\\Rain\\Database\\Builder), Array)\n#13 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(550): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(October\\Rain\\Database\\Builder))\n#14 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(529): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#15 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(562): October\\Rain\\Database\\Model->saveInternal(Array)\n#16 /var/www/html/olamua/modules/backend/behaviors/FormController.php(241): October\\Rain\\Database\\Model->save(NULL, \'qClLP3RTFcoLw7l...\')\n#17 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Concerns/ManagesTransactions.php(29): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection))\n#18 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/DatabaseManager.php(327): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 /var/www/html/olamua/modules/backend/behaviors/FormController.php(243): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#22 /var/www/html/olamua/vendor/october/rain/src/Extension/ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#23 /var/www/html/olamua/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create_onSave\', Array)\n#24 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create_onSave\', Array)\n#25 /var/www/html/olamua/modules/backend/classes/Controller.php(533): call_user_func_array(Array, Array)\n#26 /var/www/html/olamua/modules/backend/classes/Controller.php(424): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#27 /var/www/html/olamua/modules/backend/classes/Controller.php(229): Backend\\Classes\\Controller->execAjaxHandlers()\n#28 /var/www/html/olamua/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#29 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#30 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#31 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#34 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#35 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#54 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#55 /var/www/html/olamua/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#56 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#57 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#59 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#62 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#63 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#64 /var/www/html/olamua/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#65 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDOException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'sale_price\' cannot be null in /var/www/html/olamua/vendor/doctrine/dbal/lib/Doctrine/DBAL/Driver/PDOStatement.php:107\nStack trace:\n#0 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(458): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#1 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `du...\', Array)\n#2 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `du...\', Array, Object(Closure))\n#3 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(459): Illuminate\\Database\\Connection->run(\'insert into `du...\', Array, Object(Closure))\n#4 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(411): Illuminate\\Database\\Connection->statement(\'insert into `du...\', Array)\n#5 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Processors/Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `du...\', Array)\n#6 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2159): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(October\\Rain\\Database\\QueryBuilder), \'insert into `du...\', Array, \'id\')\n#7 /var/www/html/olamua/vendor/october/rain/src/Database/QueryBuilder.php(276): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#8 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1285): October\\Rain\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#9 /var/www/html/olamua/vendor/october/rain/src/Database/Builder.php(178): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#10 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(722): October\\Rain\\Database\\Builder->__call(\'insertGetId\', Array)\n#11 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(687): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(October\\Rain\\Database\\Builder), Array)\n#12 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(550): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(October\\Rain\\Database\\Builder))\n#13 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(529): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#14 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(562): October\\Rain\\Database\\Model->saveInternal(Array)\n#15 /var/www/html/olamua/modules/backend/behaviors/FormController.php(241): October\\Rain\\Database\\Model->save(NULL, \'qClLP3RTFcoLw7l...\')\n#16 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Concerns/ManagesTransactions.php(29): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection))\n#17 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/DatabaseManager.php(327): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#18 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#19 /var/www/html/olamua/modules/backend/behaviors/FormController.php(243): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#20 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#21 /var/www/html/olamua/vendor/october/rain/src/Extension/ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#22 /var/www/html/olamua/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create_onSave\', Array)\n#23 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create_onSave\', Array)\n#24 /var/www/html/olamua/modules/backend/classes/Controller.php(533): call_user_func_array(Array, Array)\n#25 /var/www/html/olamua/modules/backend/classes/Controller.php(424): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#26 /var/www/html/olamua/modules/backend/classes/Controller.php(229): Backend\\Classes\\Controller->execAjaxHandlers()\n#27 /var/www/html/olamua/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#28 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#29 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#30 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#32 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#33 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#34 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#53 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#54 /var/www/html/olamua/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#55 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#56 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#57 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 /var/www/html/olamua/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'sale_price\' cannot be null (SQL: insert into `dunglh_shop_products` (`name`, `slug`, `description`, `price`, `sale_price`, `is_customizable`, `is_wrappable`, `is_featured`, `is_active`, `updated_at`, `created_at`) values (Hoa chúc mừng : Điều bất ngờ, hoa-chuc-mung-dieu-bat-ngo, <p><strong>Mẫu Hoa chúc mừng : Điều bất ngờ&nbsp;</strong>bao gồm các loại hoa:</p>\r\n\r\n<p>- Hoa sen trắng</p>\r\n\r\n<p>- Hoa hồ điệp trắng</p>\r\n\r\n<p>- Hoa green whicky</p>\r\n\r\n<p>- Hoa hồng đỏ</p>\r\n\r\n<p>-Hoa chuỗi ngọc đỏ</p>\r\n\r\n<p>-Lá và phụ liệu khác</p>, 1000000, , 0, 0, 0, 1, 2018-08-13 09:42:17, 2018-08-13 09:42:17)) in /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php:664\nStack trace:\n#0 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `du...\', Array, Object(Closure))\n#1 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(459): Illuminate\\Database\\Connection->run(\'insert into `du...\', Array, Object(Closure))\n#2 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Connection.php(411): Illuminate\\Database\\Connection->statement(\'insert into `du...\', Array)\n#3 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Processors/Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `du...\', Array)\n#4 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2159): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(October\\Rain\\Database\\QueryBuilder), \'insert into `du...\', Array, \'id\')\n#5 /var/www/html/olamua/vendor/october/rain/src/Database/QueryBuilder.php(276): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#6 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1285): October\\Rain\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#7 /var/www/html/olamua/vendor/october/rain/src/Database/Builder.php(178): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(722): October\\Rain\\Database\\Builder->__call(\'insertGetId\', Array)\n#9 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(687): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(October\\Rain\\Database\\Builder), Array)\n#10 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(550): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(October\\Rain\\Database\\Builder))\n#11 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(529): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#12 /var/www/html/olamua/vendor/october/rain/src/Database/Model.php(562): October\\Rain\\Database\\Model->saveInternal(Array)\n#13 /var/www/html/olamua/modules/backend/behaviors/FormController.php(241): October\\Rain\\Database\\Model->save(NULL, \'qClLP3RTFcoLw7l...\')\n#14 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/Concerns/ManagesTransactions.php(29): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(October\\Rain\\Database\\Connections\\MySqlConnection))\n#15 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Database/DatabaseManager.php(327): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#16 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#17 /var/www/html/olamua/modules/backend/behaviors/FormController.php(243): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#18 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#19 /var/www/html/olamua/vendor/october/rain/src/Extension/ExtendableTrait.php(381): call_user_func_array(Array, Array)\n#20 /var/www/html/olamua/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(\'create_onSave\', Array)\n#21 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'create_onSave\', Array)\n#22 /var/www/html/olamua/modules/backend/classes/Controller.php(533): call_user_func_array(Array, Array)\n#23 /var/www/html/olamua/modules/backend/classes/Controller.php(424): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#24 /var/www/html/olamua/modules/backend/classes/Controller.php(229): Backend\\Classes\\Controller->execAjaxHandlers()\n#25 /var/www/html/olamua/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#26 [internal function]: Backend\\Classes\\BackendController->run(\'dunglh/shop/pro...\')\n#27 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#28 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#29 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#30 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#31 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#32 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#51 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#52 /var/www/html/olamua/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#53 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#54 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#56 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#59 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#60 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#61 /var/www/html/olamua/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#62 {main}', NULL, '2018-08-13 02:42:17', '2018-08-13 02:42:17'),
(7, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function property() on null in /var/www/html/olamua/plugins/rainlab/pages/controllers/Index.php:420\nStack trace:\n#0 /var/www/html/olamua/plugins/rainlab/pages/controllers/Index.php(404): RainLab\\Pages\\Controllers\\Index->checkContentField(Object(Backend\\Widgets\\Form), Object(RainLab\\Pages\\Classes\\Page))\n#1 [internal function]: RainLab\\Pages\\Controllers\\Index->RainLab\\Pages\\Controllers\\{closure}()\n#2 /var/www/html/olamua/vendor/october/rain/src/Support/Traits/Emitter.php(135): call_user_func_array(Object(Closure), Array)\n#3 /var/www/html/olamua/modules/system/traits/EventEmitter.php(47): Backend\\Classes\\WidgetBase->fireEvent(\'form.extendFiel...\', Array, true)\n#4 /var/www/html/olamua/modules/backend/widgets/Form.php(425): Backend\\Classes\\WidgetBase->fireSystemEvent(\'backend.form.ex...\')\n#5 /var/www/html/olamua/modules/backend/widgets/Form.php(306): Backend\\Widgets\\Form->defineFormFields()\n#6 /var/www/html/olamua/modules/backend/widgets/Form.php(216): Backend\\Widgets\\Form->prepareVars()\n#7 /var/www/html/olamua/plugins/rainlab/pages/controllers/index/_form_page.htm(7): Backend\\Widgets\\Form->render()\n#8 /var/www/html/olamua/modules/system/traits/ViewMaker.php(244): include(\'/var/www/html/o...\')\n#9 /var/www/html/olamua/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\Controller->makeFileContents(\'/var/www/html/o...\', Array)\n#10 /var/www/html/olamua/plugins/rainlab/pages/controllers/Index.php(629): Backend\\Classes\\Controller->makePartial(\'_form_page.htm\', Array)\n#11 /var/www/html/olamua/plugins/rainlab/pages/controllers/Index.php(101): RainLab\\Pages\\Controllers\\Index->pushObjectForm(\'page\', Object(RainLab\\Pages\\Classes\\Page))\n#12 [internal function]: RainLab\\Pages\\Controllers\\Index->index_onOpen()\n#13 /var/www/html/olamua/modules/backend/classes/Controller.php(533): call_user_func_array(Array, Array)\n#14 /var/www/html/olamua/modules/backend/classes/Controller.php(424): Backend\\Classes\\Controller->runAjaxHandler(\'onOpen\')\n#15 /var/www/html/olamua/modules/backend/classes/Controller.php(229): Backend\\Classes\\Controller->execAjaxHandlers()\n#16 /var/www/html/olamua/modules/backend/classes/BackendController.php(112): Backend\\Classes\\Controller->run(\'index\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'rainlab/pages\')\n#18 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#19 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#21 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#22 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#23 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#42 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#43 /var/www/html/olamua/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#44 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#45 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /var/www/html/olamua/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 /var/www/html/olamua/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2018-08-13 03:23:16', '2018-08-13 03:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '5b714bed74708319731360.jpg', 'hoa-hop-go-dong-luc-moi606.jpg', 43765, 'image/jpeg', NULL, NULL, 'images', '1', 'Dunglh\\Shop\\Models\\Product', 1, 1, '2018-08-13 02:14:21', '2018-08-13 02:14:26'),
(2, '5b7155a7065cd983732208.jpg', 'hoa-chuc-mung-dieu-bat-ngo926.jpg', 41545, 'image/jpeg', NULL, NULL, 'images', '2', 'Dunglh\\Shop\\Models\\Product', 1, 2, '2018-08-13 02:55:51', '2018-08-13 02:55:55'),
(3, '5b71560c05044415476124.jpg', 'hoa-chuc-mung-niem-vui-bat-ngo186.jpg', 49288, 'image/jpeg', NULL, NULL, 'images', '3', 'Dunglh\\Shop\\Models\\Product', 1, 3, '2018-08-13 02:57:32', '2018-08-13 02:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\r\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n</head>\r\n<body>\r\n    <style type="text/css" media="screen">\r\n        {{ brandCss|raw }}\r\n        {{ css|raw }}\r\n    </style>\r\n\r\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\r\n\r\n        <!-- Header -->\r\n        {% partial \'header\' body %}\r\n            {{ subject|raw }}\r\n        {% endpartial %}\r\n\r\n        <tr>\r\n            <td align="center">\r\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\r\n                    <!-- Email Body -->\r\n                    <tr>\r\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\r\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\r\n                                <!-- Body content -->\r\n                                <tr>\r\n                                    <td class="content-cell">\r\n                                        {{ content|raw }}\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n\r\n        <!-- Footer -->\r\n        {% partial \'footer\' body %}\r\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\r\n        {% endpartial %}\r\n\r\n    </table>\r\n\r\n</body>\r\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\r\n    .inner-body {\r\n        width: 100% !important;\r\n    }\r\n\r\n    .footer {\r\n        width: 100% !important;\r\n    }\r\n}\r\n\r\n@media only screen and (max-width: 500px) {\r\n    .button {\r\n        width: 100% !important;\r\n    }\r\n}', 1, '2018-07-28 19:46:34', '2018-07-28 19:46:34'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\r\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n</head>\r\n<body>\r\n    <style type="text/css" media="screen">\r\n        {{ brandCss|raw }}\r\n        {{ css|raw }}\r\n    </style>\r\n\r\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\r\n        <tr>\r\n            <td align="center">\r\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\r\n                    <!-- Email Body -->\r\n                    <tr>\r\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\r\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\r\n                                <!-- Body content -->\r\n                                <tr>\r\n                                    <td class="content-cell">\r\n                                        {{ content|raw }}\r\n\r\n                                        <!-- Subcopy -->\r\n                                        {% partial \'subcopy\' body %}\r\n                                            **This is an automatic message. Please do not reply to it.**\r\n                                        {% endpartial %}\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n\r\n</body>\r\n</html>', '{{ content|raw }}\r\n\r\n\r\n---\r\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\r\n    .inner-body {\r\n        width: 100% !important;\r\n    }\r\n\r\n    .footer {\r\n        width: 100% !important;\r\n    }\r\n}\r\n\r\n@media only screen and (max-width: 500px) {\r\n    .button {\r\n        width: 100% !important;\r\n    }\r\n}', 1, '2018-07-28 19:46:34', '2018-07-28 19:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1534235291'),
(3, 'cms', 'theme', 'active', '"olamua"'),
(4, 'system', 'core', 'build', '"437"'),
(5, 'system', 'core', 'hash', '"d4a4e1f641e333ff5c26037f86cfe619"');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2018-07-28 19:46:33'),
(2, 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2018-07-28 19:53:49'),
(3, 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2018-07-28 19:53:49'),
(4, 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin.', '2018-07-28 19:53:49'),
(5, 'RainLab.User', 'comment', '1.0.2', 'Seed tables.', '2018-07-28 19:53:49'),
(6, 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2018-07-28 19:53:49'),
(7, 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2018-07-28 19:53:49'),
(8, 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users.', '2018-07-28 19:53:49'),
(9, 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2018-07-28 19:53:49'),
(10, 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2018-07-28 19:53:49'),
(11, 'RainLab.User', 'comment', '1.0.7', 'Add back-end Settings page.', '2018-07-28 19:53:49'),
(12, 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page.', '2018-07-28 19:53:49'),
(13, 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2018-07-28 19:53:49'),
(14, 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2018-07-28 19:53:49'),
(15, 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2018-07-28 19:53:50'),
(16, 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2018-07-28 19:53:50'),
(17, 'RainLab.User', 'script', '1.0.12', 'users_rename_login_to_username.php', '2018-07-28 19:53:50'),
(18, 'RainLab.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2018-07-28 19:53:50'),
(19, 'RainLab.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2018-07-28 19:53:50'),
(20, 'RainLab.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2018-07-28 19:53:50'),
(21, 'RainLab.User', 'script', '1.0.15', 'users_add_surname.php', '2018-07-28 19:53:50'),
(22, 'RainLab.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2018-07-28 19:53:50'),
(23, 'RainLab.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2018-07-28 19:53:50'),
(24, 'RainLab.User', 'comment', '1.1.0', '!!! Profile fields and Locations have been removed.', '2018-07-28 19:53:50'),
(25, 'RainLab.User', 'script', '1.1.1', 'create_user_groups_table.php', '2018-07-28 19:53:50'),
(26, 'RainLab.User', 'script', '1.1.1', 'seed_user_groups_table.php', '2018-07-28 19:53:50'),
(27, 'RainLab.User', 'comment', '1.1.1', 'Users can now be added to groups.', '2018-07-28 19:53:50'),
(28, 'RainLab.User', 'comment', '1.1.2', 'A raw URL can now be passed as the redirect property in the Account component.', '2018-07-28 19:53:50'),
(29, 'RainLab.User', 'comment', '1.1.3', 'Adds a super user flag to the users table, reserved for future use.', '2018-07-28 19:53:50'),
(30, 'RainLab.User', 'comment', '1.1.4', 'User list can be filtered by the group they belong to.', '2018-07-28 19:53:50'),
(31, 'RainLab.User', 'comment', '1.1.5', 'Adds a new permission to hide the User settings menu item.', '2018-07-28 19:53:50'),
(32, 'RainLab.User', 'script', '1.2.0', 'users_add_deleted_at.php', '2018-07-28 19:53:50'),
(33, 'RainLab.User', 'comment', '1.2.0', 'Users can now deactivate their own accounts.', '2018-07-28 19:53:50'),
(34, 'RainLab.User', 'comment', '1.2.1', 'New feature for checking if a user is recently active/online.', '2018-07-28 19:53:50'),
(35, 'RainLab.User', 'comment', '1.2.2', 'Add bulk action button to user list.', '2018-07-28 19:53:50'),
(36, 'RainLab.User', 'comment', '1.2.3', 'Included some descriptive paragraphs in the Reset Password component markup.', '2018-07-28 19:53:50'),
(37, 'RainLab.User', 'comment', '1.2.4', 'Added a checkbox for blocking all mail sent to the user.', '2018-07-28 19:53:51'),
(38, 'RainLab.User', 'script', '1.2.5', 'update_timestamp_nullable.php', '2018-07-28 19:53:51'),
(39, 'RainLab.User', 'comment', '1.2.5', 'Database maintenance. Updated all timestamp columns to be nullable.', '2018-07-28 19:53:51'),
(40, 'RainLab.User', 'script', '1.2.6', 'users_add_last_seen.php', '2018-07-28 19:53:51'),
(41, 'RainLab.User', 'comment', '1.2.6', 'Add a dedicated last seen column for users.', '2018-07-28 19:53:51'),
(42, 'RainLab.User', 'comment', '1.2.7', 'Minor fix to user timestamp attributes.', '2018-07-28 19:53:51'),
(43, 'RainLab.User', 'comment', '1.2.8', 'Add date range filter to users list. Introduced a logout event.', '2018-07-28 19:53:51'),
(44, 'RainLab.User', 'comment', '1.2.9', 'Add invitation mail for new accounts created in the back-end.', '2018-07-28 19:53:51'),
(45, 'RainLab.User', 'script', '1.3.0', 'users_add_guest_flag.php', '2018-07-28 19:53:51'),
(46, 'RainLab.User', 'script', '1.3.0', 'users_add_superuser_flag.php', '2018-07-28 19:53:51'),
(47, 'RainLab.User', 'comment', '1.3.0', 'Introduced guest user accounts.', '2018-07-28 19:53:51'),
(48, 'RainLab.User', 'comment', '1.3.1', 'User notification variables can now be extended.', '2018-07-28 19:53:51'),
(49, 'RainLab.User', 'comment', '1.3.2', 'Minor fix to the Auth::register method.', '2018-07-28 19:53:51'),
(50, 'RainLab.User', 'comment', '1.3.3', 'Allow prevention of concurrent user sessions via the user settings.', '2018-07-28 19:53:51'),
(51, 'RainLab.User', 'comment', '1.3.4', 'Added force secure protocol property to the account component.', '2018-07-28 19:53:51'),
(52, 'RainLab.User', 'comment', '1.4.0', '!!! The Notifications tab in User settings has been removed.', '2018-07-28 19:53:51'),
(53, 'RainLab.User', 'comment', '1.4.1', 'Added support for user impersonation.', '2018-07-28 19:53:51'),
(54, 'RainLab.User', 'comment', '1.4.2', 'Fixes security bug in Password Reset component.', '2018-07-28 19:53:51'),
(55, 'RainLab.User', 'comment', '1.4.3', 'Fixes session handling for AJAX requests.', '2018-07-28 19:53:51'),
(56, 'RainLab.User', 'comment', '1.4.4', 'Fixes bug where impersonation touches the last seen timestamp.', '2018-07-28 19:53:51'),
(57, 'RainLab.User', 'comment', '1.4.5', 'Added token fallback process to Account / Reset Password components when parameter is missing.', '2018-07-28 19:53:51'),
(58, 'RainLab.User', 'comment', '1.4.6', 'Fixes Auth::register method signature mismatch with core OctoberCMS Auth library', '2018-07-28 19:53:51'),
(59, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2018-08-07 07:27:14'),
(60, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2018-08-07 07:27:14'),
(61, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2018-08-07 07:27:14'),
(62, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2018-08-07 07:27:14'),
(63, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2018-08-07 07:27:14'),
(64, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2018-08-07 07:27:14'),
(65, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2018-08-07 07:27:14'),
(66, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2018-08-07 07:27:14'),
(67, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2018-08-07 07:27:14'),
(68, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2018-08-07 07:27:14'),
(69, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2018-08-07 07:27:14'),
(70, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2018-08-07 07:27:14'),
(71, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2018-08-07 07:27:14'),
(72, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2018-08-07 07:27:14'),
(73, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2018-08-07 07:27:14'),
(74, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2018-08-07 07:27:14'),
(75, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2018-08-07 07:27:14'),
(76, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2018-08-07 07:27:14'),
(77, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2018-08-07 07:27:14'),
(78, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the "current.hasAttribute is not a function" error.', '2018-08-07 07:27:14'),
(79, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2018-08-07 07:27:14'),
(80, 'RainLab.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2018-08-07 07:27:14'),
(82, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2018-08-11 18:49:59'),
(83, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2018-08-11 18:49:59'),
(84, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2018-08-11 18:49:59'),
(85, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2018-08-11 18:49:59'),
(86, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2018-08-11 18:49:59'),
(87, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2018-08-11 18:49:59'),
(88, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2018-08-11 18:49:59'),
(89, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2018-08-11 18:49:59'),
(90, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2018-08-11 18:49:59'),
(91, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2018-08-11 18:49:59'),
(92, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2018-08-11 18:49:59'),
(93, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2018-08-11 18:49:59'),
(94, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2018-08-11 18:49:59'),
(95, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2018-08-11 18:49:59'),
(96, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2018-08-11 18:49:59'),
(97, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2018-08-11 18:49:59'),
(98, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2018-08-11 18:49:59'),
(99, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2018-08-11 18:49:59'),
(100, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2018-08-11 18:49:59'),
(101, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2018-08-11 18:49:59'),
(102, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2018-08-11 18:49:59'),
(103, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2018-08-11 18:49:59'),
(104, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2018-08-11 18:49:59'),
(105, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2018-08-11 18:49:59'),
(106, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2018-08-11 18:49:59'),
(107, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2018-08-11 18:49:59'),
(108, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2018-08-11 18:49:59'),
(109, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2018-08-11 18:49:59'),
(110, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2018-08-11 18:49:59'),
(111, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2018-08-11 18:49:59'),
(112, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2018-08-11 18:49:59'),
(113, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2018-08-11 18:49:59'),
(114, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2018-08-11 18:49:59'),
(115, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2018-08-11 18:49:59'),
(116, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2018-08-11 18:49:59'),
(117, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2018-08-11 18:49:59'),
(118, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2018-08-11 18:49:59'),
(119, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2018-08-11 18:49:59'),
(120, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2018-08-11 18:49:59'),
(121, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2018-08-11 18:49:59'),
(122, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2018-08-11 18:49:59'),
(123, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2018-08-11 18:49:59'),
(124, 'RainLab.Pages', 'comment', '1.2.17', 'Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items', '2018-08-11 18:49:59'),
(125, 'RainLab.Pages', 'comment', '1.2.18', 'Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.', '2018-08-11 18:49:59'),
(126, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2018-08-11 18:50:12'),
(127, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2018-08-11 18:50:12'),
(128, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2018-08-11 18:50:13'),
(129, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2018-08-11 18:50:13'),
(130, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2018-08-11 18:50:13'),
(131, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2018-08-11 18:50:13'),
(132, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2018-08-11 18:50:13'),
(133, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2018-08-11 18:50:13'),
(134, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2018-08-11 18:50:13'),
(135, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2018-08-11 18:50:13'),
(136, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2018-08-11 18:50:13'),
(137, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2018-08-11 18:50:13'),
(138, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2018-08-11 18:50:13'),
(139, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate "idParam" component property in favour of "slug" property.', '2018-08-11 18:50:13'),
(140, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2018-08-11 18:50:13'),
(141, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2018-08-11 18:50:13'),
(142, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2018-08-11 18:50:13'),
(143, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2018-08-11 18:50:13'),
(144, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2018-08-11 18:50:13'),
(145, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2018-08-11 18:50:13'),
(146, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2018-08-11 18:50:13'),
(147, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2018-08-11 18:50:13'),
(148, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2018-08-11 18:50:13'),
(149, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2018-08-11 18:50:13'),
(150, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2018-08-11 18:50:13'),
(151, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2018-08-11 18:50:13'),
(152, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2018-08-11 18:50:13'),
(153, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2018-08-11 18:50:13'),
(154, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2018-08-11 18:50:13'),
(155, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2018-08-11 18:50:13'),
(156, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2018-08-11 18:50:13'),
(157, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2018-08-11 18:50:13'),
(158, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2018-08-11 18:50:13'),
(159, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2018-08-11 18:50:13'),
(160, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2018-08-11 18:50:13'),
(161, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2018-08-11 18:50:13'),
(162, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2018-08-11 18:50:13'),
(163, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2018-08-11 18:50:13'),
(164, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2018-08-11 18:50:13'),
(165, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2018-08-11 18:50:13'),
(166, 'RainLab.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2018-08-11 18:50:13'),
(167, 'RainLab.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2018-08-11 18:50:13'),
(168, 'RainLab.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2018-08-11 18:50:13'),
(169, 'AnandPatel.SeoExtension', 'script', '1.0.1', 'create_blog_posts_table.php', '2018-08-11 18:51:04'),
(170, 'AnandPatel.SeoExtension', 'comment', '1.0.1', 'First version of Seo Extension', '2018-08-11 18:51:04'),
(171, 'AnandPatel.SeoExtension', 'comment', '1.0.2', 'Bug fixes', '2018-08-11 18:51:04'),
(172, 'AnandPatel.SeoExtension', 'comment', '1.0.3', 'Backend Settings added to configure meta tags & Open Graph tags added', '2018-08-11 18:51:04'),
(173, 'AnandPatel.SeoExtension', 'comment', '1.0.4', 'Code clean up and change path naming in settings model', '2018-08-11 18:51:04'),
(174, 'AnandPatel.SeoExtension', 'comment', '1.0.5', 'Add Turkish, Russian, cs_CZ locale', '2018-08-11 18:51:04'),
(175, 'AnandPatel.SeoExtension', 'comment', '1.0.6', 'Fix issue of SEO Settings Errors', '2018-08-11 18:51:04'),
(218, 'Dunglh.Shop', 'comment', '1.0.1', 'Initialize plugin.', '2018-08-13 02:48:31'),
(219, 'Dunglh.Shop', 'script', '1.0.2', 'builder_table_create_dunglh_shop_products.php', '2018-08-13 02:48:31'),
(220, 'Dunglh.Shop', 'comment', '1.0.2', 'Created table dunglh_shop_products', '2018-08-13 02:48:31'),
(221, 'Dunglh.Shop', 'script', '1.0.3', 'builder_table_create_dunglh_shop_categories.php', '2018-08-13 02:48:32'),
(222, 'Dunglh.Shop', 'comment', '1.0.3', 'Created table dunglh_shop_categories', '2018-08-13 02:48:32'),
(223, 'Dunglh.Shop', 'script', '1.0.4', 'builder_table_create_dunglh_shop_products_categories.php', '2018-08-13 02:48:33'),
(224, 'Dunglh.Shop', 'comment', '1.0.4', 'Created table dunglh_shop_products_categories', '2018-08-13 02:48:33'),
(225, 'PeterHegman.SlickSlider', 'comment', '1.0.1', 'Initialize plugin.', '2018-08-13 03:01:05'),
(226, 'PeterHegman.SlickSlider', 'script', '1.0.2', 'builder_table_create_peterhegman_slickslider_slide_shows.php', '2018-08-13 03:01:05'),
(227, 'PeterHegman.SlickSlider', 'comment', '1.0.2', 'Created table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:05'),
(228, 'PeterHegman.SlickSlider', 'script', '1.0.3', 'builder_table_update_peterhegman_slickslider_slide_shows.php', '2018-08-13 03:01:06'),
(229, 'PeterHegman.SlickSlider', 'comment', '1.0.3', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:06'),
(230, 'PeterHegman.SlickSlider', 'script', '1.0.4', 'builder_table_update_peterhegman_slickslider_slide_shows_2.php', '2018-08-13 03:01:06'),
(231, 'PeterHegman.SlickSlider', 'comment', '1.0.4', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:06'),
(232, 'PeterHegman.SlickSlider', 'script', '1.0.5', 'builder_table_update_peterhegman_slickslider_slide_shows_3.php', '2018-08-13 03:01:07'),
(233, 'PeterHegman.SlickSlider', 'comment', '1.0.5', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:07'),
(234, 'PeterHegman.SlickSlider', 'script', '1.0.6', 'builder_table_update_peterhegman_slickslider_slide_shows_4.php', '2018-08-13 03:01:07'),
(235, 'PeterHegman.SlickSlider', 'comment', '1.0.6', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:07'),
(236, 'PeterHegman.SlickSlider', 'script', '1.0.7', 'builder_table_update_peterhegman_slickslider_slide_shows_5.php', '2018-08-13 03:01:08'),
(237, 'PeterHegman.SlickSlider', 'comment', '1.0.7', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:08'),
(238, 'PeterHegman.SlickSlider', 'script', '1.0.8', 'builder_table_update_peterhegman_slickslider_slide_shows_6.php', '2018-08-13 03:01:09'),
(239, 'PeterHegman.SlickSlider', 'comment', '1.0.8', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:09'),
(240, 'PeterHegman.SlickSlider', 'script', '1.0.9', 'builder_table_update_peterhegman_slickslider_slide_shows_7.php', '2018-08-13 03:01:09'),
(241, 'PeterHegman.SlickSlider', 'comment', '1.0.9', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:09'),
(242, 'PeterHegman.SlickSlider', 'script', '1.0.10', 'builder_table_update_peterhegman_slickslider_slide_shows_8.php', '2018-08-13 03:01:10'),
(243, 'PeterHegman.SlickSlider', 'comment', '1.0.10', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:10'),
(244, 'PeterHegman.SlickSlider', 'script', '1.0.11', 'builder_table_update_peterhegman_slickslider_slide_shows_9.php', '2018-08-13 03:01:11'),
(245, 'PeterHegman.SlickSlider', 'comment', '1.0.11', 'Updated table peterhegman_slickslider_slide_shows', '2018-08-13 03:01:11'),
(246, 'PeterHegman.SlickSlider', 'script', '1.0.12', 'builder_table_update_peterhegman_slickslider_slide_shows_10.php', '2018-08-13 03:01:12'),
(247, 'PeterHegman.SlickSlider', 'comment', '1.0.12', 'Updated table peterhegman_slickslider_slide_shows. Added slide link feature. Added option to include or not include jQuery. Added horizontal image position option', '2018-08-13 03:01:12'),
(248, 'PeterHegman.SlickSlider', 'comment', '1.0.13', 'New permissions added allowing administrators to prevent users from editing settings of slide shows or adding and deleting slide shows. Global settings added.', '2018-08-13 03:01:12'),
(249, 'PeterHegman.SlickSlider', 'comment', '1.0.14', 'Update makes it possible to include the slider component within the static-pages plugin by Rainlab', '2018-08-13 03:01:12'),
(250, 'PeterHegman.SlickSlider', 'comment', '1.1.1', 'Updating `json` columns to `text` to fix error for users using MySQL below 5.7', '2018-08-13 03:01:12'),
(251, 'PeterHegman.SlickSlider', 'comment', '1.1.2', 'Adding support for rainlab.translate. Thanks to Tony Raoul. Fixed error when updating to PHP 7.2', '2018-08-13 03:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2018-07-28 19:46:33', 0, 0),
(2, 'RainLab.User', '1.4.6', '2018-07-28 19:53:51', 1, 1),
(3, 'RainLab.Builder', '1.0.22', '2018-08-07 07:27:14', 1, 1),
(5, 'RainLab.Pages', '1.2.18', '2018-08-11 18:49:59', 0, 0),
(6, 'RainLab.Blog', '1.2.19', '2018-08-11 18:50:13', 0, 0),
(7, 'AnandPatel.SeoExtension', '1.0.6', '2018-08-11 18:51:04', 0, 0),
(14, 'Dunglh.Shop', '1.0.4', '2018-08-13 02:48:33', 0, 0),
(15, 'PeterHegman.SlickSlider', '1.1.2', '2018-08-13 03:01:12', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'rainlab_builder_settings', '{"author_name":"dunglh","author_namespace":"Dunglh"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Guest', 'guest', 'Default group for guest users.', '2018-07-28 19:53:50', '2018-07-28 19:53:50'),
(2, 'Registered', 'registered', 'Default group for registered users.', '2018-07-28 19:53:50', '2018-07-28 19:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_throttle`
--

CREATE TABLE `user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Indexes for table `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indexes for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indexes for table `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Indexes for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indexes for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Indexes for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Indexes for table `dunglh_shop_categories`
--
ALTER TABLE `dunglh_shop_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dunglh_shop_categories_slug_index` (`slug`),
  ADD KEY `dunglh_shop_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `dunglh_shop_products`
--
ALTER TABLE `dunglh_shop_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dunglh_shop_products_slug_index` (`slug`);

--
-- Indexes for table `dunglh_shop_products_categories`
--
ALTER TABLE `dunglh_shop_products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peterhegman_slickslider_slide_shows`
--
ALTER TABLE `peterhegman_slickslider_slide_shows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Indexes for table `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Indexes for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_user_mail_blockers_email_index` (`email`),
  ADD KEY `rainlab_user_mail_blockers_template_index` (`template`),
  ADD KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indexes for table `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indexes for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indexes for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indexes for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indexes for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_unique` (`username`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`),
  ADD KEY `users_login_index` (`username`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_groups_code_index` (`code`);

--
-- Indexes for table `user_throttle`
--
ALTER TABLE `user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_throttle_user_id_index` (`user_id`),
  ADD KEY `user_throttle_ip_address_index` (`ip_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dunglh_shop_categories`
--
ALTER TABLE `dunglh_shop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dunglh_shop_products`
--
ALTER TABLE `dunglh_shop_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `peterhegman_slickslider_slide_shows`
--
ALTER TABLE `peterhegman_slickslider_slide_shows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_throttle`
--
ALTER TABLE `user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
