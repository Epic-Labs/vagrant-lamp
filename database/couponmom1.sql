-- --------------------------------------------------------
-- Host:                         192.168.100.249
-- Server version:               5.1.56-rs - Distributed by Rackspace
-- Server OS:                    redhat-linux-gnu
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-06-21 13:29:31
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for dev_jtap_cms
CREATE DATABASE IF NOT EXISTS `dev_jtap_cms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dev_jtap_cms`;


-- Dumping structure for table dev_jtap_cms.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `uniquecheck` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.bad_logins
CREATE TABLE IF NOT EXISTS `bad_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.contactus
CREATE TABLE IF NOT EXISTS `contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `date_reg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_new` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.CouponCodeDeals
CREATE TABLE IF NOT EXISTS `CouponCodeDeals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `alt_title` varchar(250) DEFAULT NULL,
  `description` varchar(3000) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `merchant_id` int(10) unsigned DEFAULT NULL,
  `merchant_slug` varchar(250) DEFAULT NULL,
  `merchant_name` varchar(250) DEFAULT NULL,
  `merchant_display_url` varchar(250) DEFAULT NULL,
  `merchant_url` varchar(250) DEFAULT NULL,
  `merchant_image_url` varchar(250) DEFAULT NULL,
  `deal_url` varchar(250) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `deal_image_url` varchar(250) DEFAULT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `free_shipping` tinyint(3) unsigned DEFAULT '0',
  `site_wide` varchar(250) DEFAULT NULL,
  `image_tag_line` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `staff_pick` tinyint(3) unsigned DEFAULT '0',
  `deal_of_day` tinyint(3) unsigned DEFAULT '0',
  `printable` tinyint(3) unsigned DEFAULT '0',
  `seven_day_rating` smallint(5) unsigned DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`),
  KEY `expire_date` (`expire_date`),
  KEY `merchant_id` (`merchant_id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.daily_deals
CREATE TABLE IF NOT EXISTS `daily_deals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(30) NOT NULL,
  `feed_deal_id` varchar(50) NOT NULL,
  `is_active` tinyint(3) unsigned DEFAULT '0',
  `country` varchar(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `category_slug` varchar(50) DEFAULT NULL,
  `merchant_name` varchar(250) NOT NULL,
  `state_id` varchar(4) NOT NULL,
  `market_name` varchar(250) NOT NULL,
  `market_slug` varchar(250) NOT NULL,
  `parse_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `link` varchar(500) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `is_national` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `savings` varchar(20) DEFAULT NULL,
  `price` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`,`feed_deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.draft_deal_list_alert
CREATE TABLE IF NOT EXISTS `draft_deal_list_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(5) NOT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `is_preview` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(250) DEFAULT '',
  `body` text,
  `created` datetime NOT NULL,
  `date_to_send` datetime NOT NULL,
  `send_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='draft to be sent to q_deal_list_alert.';

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.dynect_reports
CREATE TABLE IF NOT EXISTS `dynect_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sent_status_code` smallint(3) unsigned DEFAULT NULL,
  `sent_status_message` varchar(255) DEFAULT NULL,
  `sent_count` int(11) unsigned NOT NULL DEFAULT '0',
  `delivered_status_code` smallint(3) unsigned DEFAULT NULL,
  `delivered_status_message` varchar(255) DEFAULT NULL,
  `delivered_count` int(11) unsigned NOT NULL DEFAULT '0',
  `bounces_status_code` tinyint(3) unsigned DEFAULT NULL,
  `bounces_status_message` varchar(255) DEFAULT NULL,
  `bounces_count` varchar(255) DEFAULT NULL,
  `bounces_total_count` int(11) unsigned NOT NULL DEFAULT '0',
  `bounces_hard_bounce_count` int(11) unsigned NOT NULL DEFAULT '0',
  `bounces_soft_bounce_count` int(11) unsigned NOT NULL DEFAULT '0',
  `bounces_prev_hard_bounce_count` int(11) unsigned NOT NULL DEFAULT '0',
  `complaints_status_code` smallint(3) unsigned DEFAULT NULL,
  `complaints_status_message` varchar(255) DEFAULT NULL,
  `complaints_count` int(11) unsigned NOT NULL DEFAULT '0',
  `complaints_total_count` int(11) unsigned NOT NULL DEFAULT '0',
  `complaints_complaint_count` int(11) unsigned NOT NULL DEFAULT '0',
  `complaints_prev_complaint_count` int(11) unsigned NOT NULL DEFAULT '0',
  `issues_status_code` smallint(3) unsigned DEFAULT NULL,
  `issues_status_message` varchar(255) DEFAULT NULL,
  `issues_count` int(11) unsigned NOT NULL DEFAULT '0',
  `opens_status_code` smallint(3) unsigned DEFAULT NULL,
  `opens_status_message` varchar(255) DEFAULT NULL,
  `opens_count` int(11) unsigned NOT NULL DEFAULT '0',
  `clicks_status_code` smallint(3) unsigned DEFAULT NULL,
  `clicks_status_message` varchar(255) DEFAULT NULL,
  `clicks_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.file_downloads
CREATE TABLE IF NOT EXISTS `file_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` smallint(5) unsigned NOT NULL,
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.file_downloads_type
CREATE TABLE IF NOT EXISTS `file_downloads_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.log_deal_list_alert_queued
CREATE TABLE IF NOT EXISTS `log_deal_list_alert_queued` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(34) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `market_id` int(10) unsigned DEFAULT NULL,
  `store_id` int(10) unsigned DEFAULT NULL,
  `is_preview` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(250) DEFAULT '',
  `body` text,
  `queued` datetime NOT NULL,
  `total_queued` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.log_printable_coupon_alerts_sent
CREATE TABLE IF NOT EXISTS `log_printable_coupon_alerts_sent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_sent` datetime NOT NULL,
  `number_sent` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `heading` varchar(255) NOT NULL DEFAULT '',
  `heading_top` varchar(255) NOT NULL DEFAULT '',
  `heading_bottom` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `image_abs` varchar(255) NOT NULL DEFAULT '',
  `image_abs_align` tinyint(4) NOT NULL DEFAULT '0',
  `image_desc` varchar(255) NOT NULL DEFAULT '',
  `image_desc_align` tinyint(4) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `in_top` tinyint(4) NOT NULL DEFAULT '0',
  `in_bottom` tinyint(4) NOT NULL DEFAULT '0',
  `text_small` text NOT NULL,
  `text_full` longtext NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `in_dropdown` tinyint(4) NOT NULL DEFAULT '0',
  `no_readmore` tinyint(4) NOT NULL DEFAULT '0',
  `url_external` varchar(255) NOT NULL DEFAULT '',
  `in_popup` tinyint(4) NOT NULL DEFAULT '0',
  `in_left_nav` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `use_custom_nav` tinyint(3) unsigned DEFAULT '0',
  `custom_nav_items` varchar(1000) DEFAULT '',
  `show_navigation` tinyint(3) unsigned DEFAULT '1',
  `show_left_sidebar` tinyint(3) unsigned DEFAULT '1',
  `last_updated` datetime NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_parent_soft` (`parent_id`,`sorting`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.pages_hit_counter
CREATE TABLE IF NOT EXISTS `pages_hit_counter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`time_add`),
  KEY `time_add` (`time_add`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.pages_hit_counter_archive
CREATE TABLE IF NOT EXISTS `pages_hit_counter_archive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`time_add`),
  KEY `time_add` (`time_add`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.polls
CREATE TABLE IF NOT EXISTS `polls` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ad_code_bottom` text,
  `ad_code_top` text,
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.poll_questions
CREATE TABLE IF NOT EXISTS `poll_questions` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` smallint(5) unsigned NOT NULL,
  `question` varchar(255) NOT NULL,
  `allow_multiple_answers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.poll_question_answers
CREATE TABLE IF NOT EXISTS `poll_question_answers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` smallint(5) unsigned NOT NULL,
  `question_id` smallint(5) unsigned NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.poll_responses
CREATE TABLE IF NOT EXISTS `poll_responses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` smallint(5) unsigned NOT NULL,
  `question_id` smallint(5) unsigned NOT NULL,
  `answer_id` smallint(5) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL,
  `time_add` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.q_deal_list_alert
CREATE TABLE IF NOT EXISTS `q_deal_list_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `is_preview` tinyint(3) unsigned DEFAULT '0',
  `subject` varchar(250) DEFAULT '',
  `body` text,
  `created` datetime NOT NULL,
  `date_to_send` datetime NOT NULL,
  `send_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `process_id` varchar(50) DEFAULT NULL,
  `date_locked` datetime DEFAULT NULL,
  `batch_id` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`),
  KEY `batch_id` (`batch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.q_printable_coupon_alert
CREATE TABLE IF NOT EXISTS `q_printable_coupon_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `subject` varchar(250) DEFAULT '',
  `body` text,
  `created` datetime NOT NULL,
  `process_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `process_id` (`process_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.referral_users
CREATE TABLE IF NOT EXISTS `referral_users` (
  `refuserid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `reguserid` int(11) NOT NULL DEFAULT '0',
  `referraldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`refuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_users
CREATE TABLE IF NOT EXISTS `registered_users` (
  `register_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(5) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `age_range` varchar(100) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `is_newsletter` char(1) DEFAULT NULL,
  `is_offers` char(1) DEFAULT NULL,
  `is_retailmenot` tinyint(3) unsigned DEFAULT NULL,
  `hear_about_us` varchar(255) NOT NULL,
  `registered_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strRedirectURL` varchar(200) DEFAULT NULL,
  `referalid` int(11) DEFAULT NULL,
  `newsletter_setup` enum('y','n') NOT NULL DEFAULT 'n',
  `coupons_com_setup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_id`),
  KEY `email` (`email`),
  KEY `referalid` (`referalid`),
  KEY `newsletter_setup` (`newsletter_setup`),
  KEY `registered_date` (`registered_date`),
  KEY `coupons_com_setup` (`coupons_com_setup`),
  KEY `coupons_com_setup_2` (`coupons_com_setup`,`is_offers`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_users_history
CREATE TABLE IF NOT EXISTS `registered_users_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `total_users` int(10) unsigned NOT NULL,
  `last_register_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_users_login
CREATE TABLE IF NOT EXISTS `registered_users_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_users_match
CREATE TABLE IF NOT EXISTS `registered_users_match` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` tinyint(3) unsigned DEFAULT NULL,
  `password` tinyint(3) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_users_match_bk
CREATE TABLE IF NOT EXISTS `registered_users_match_bk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` tinyint(3) unsigned DEFAULT NULL,
  `password` tinyint(3) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_amazon_item
CREATE TABLE IF NOT EXISTS `registered_user_amazon_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `asin` varchar(20) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `item_url` varchar(500) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `last_price` decimal(7,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `last_checked` datetime DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `register_id` (`register_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_deal_list_alert
CREATE TABLE IF NOT EXISTS `registered_user_deal_list_alert` (
  `register_id` int(10) unsigned NOT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  UNIQUE KEY `register_id` (`register_id`,`market_id`,`store_id`),
  KEY `market_id` (`market_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_deal_list_alert_unsubscribe
CREATE TABLE IF NOT EXISTS `registered_user_deal_list_alert_unsubscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_password_reset
CREATE TABLE IF NOT EXISTS `registered_user_password_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_printable_coupon_alert
CREATE TABLE IF NOT EXISTS `registered_user_printable_coupon_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `is_hourly` tinyint(3) unsigned DEFAULT '0',
  `is_daily` tinyint(3) unsigned DEFAULT '0',
  `is_weekly` tinyint(3) unsigned DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `register_id` (`email`),
  KEY `is_hourly` (`is_hourly`),
  KEY `is_daily` (`is_daily`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.registered_user_printable_coupon_alert_unsubscribe
CREATE TABLE IF NOT EXISTS `registered_user_printable_coupon_alert_unsubscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `is_hourly` tinyint(3) unsigned DEFAULT '0',
  `is_daily` tinyint(3) unsigned DEFAULT '0',
  `is_weekly` tinyint(3) unsigned DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.related
CREATE TABLE IF NOT EXISTS `related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_align` tinyint(4) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `show_in` tinyint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `last_updated` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.related_pages
CREATE TABLE IF NOT EXISTS `related_pages` (
  `related_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `uniquecheck` (`related_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.SavingsComCategories
CREATE TABLE IF NOT EXISTS `SavingsComCategories` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_slug` varchar(250) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.SavingsComCustomData
CREATE TABLE IF NOT EXISTS `SavingsComCustomData` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) unsigned NOT NULL,
  `details` text,
  `mailing_address` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `map_code_slug` varchar(12) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `title_element` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchant_id` (`merchant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.SavingsComDealCategories
CREATE TABLE IF NOT EXISTS `SavingsComDealCategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.SavingsComDeals
CREATE TABLE IF NOT EXISTS `SavingsComDeals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `alt_title` varchar(250) DEFAULT NULL,
  `description` varchar(3000) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `merchant_id` int(10) unsigned DEFAULT NULL,
  `merchant_slug` varchar(250) DEFAULT NULL,
  `merchant_name` varchar(250) DEFAULT NULL,
  `merchant_display_url` varchar(250) DEFAULT NULL,
  `merchant_url` varchar(250) DEFAULT NULL,
  `merchant_image_url` varchar(250) DEFAULT NULL,
  `deal_url` varchar(250) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `deal_image_url` varchar(250) DEFAULT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `free_shipping` tinyint(3) unsigned DEFAULT '0',
  `site_wide` varchar(250) DEFAULT NULL,
  `image_tag_line` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `staff_pick` tinyint(3) unsigned DEFAULT '0',
  `deal_of_day` tinyint(3) unsigned DEFAULT '0',
  `printable` tinyint(3) unsigned DEFAULT '0',
  `seven_day_rating` smallint(5) unsigned DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`),
  KEY `expire_date` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.SavingsComMerchants
CREATE TABLE IF NOT EXISTS `SavingsComMerchants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `display_url` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.schema_version
CREATE TABLE IF NOT EXISTS `schema_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delta_id` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `ran_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.session
CREATE TABLE IF NOT EXISTS `session` (
  `sid` char(32) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `login_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.special_offers
CREATE TABLE IF NOT EXISTS `special_offers` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_after_form` text NOT NULL,
  `completed_text` text NOT NULL,
  `offer_full_text` text NOT NULL,
  `max_total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `max_address_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `signup_type` enum('all','email') NOT NULL DEFAULT 'all',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `offer_open_poll_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `offer_full_poll_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `checkbox_1` varchar(2000) NOT NULL,
  `checkbox_2` varchar(2000) NOT NULL,
  `checkbox_3` varchar(2000) NOT NULL,
  `show_birthdate_parent` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `show_birthdate_child` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `lead_conduit_submission` enum('yes','no') NOT NULL DEFAULT 'no',
  `lead_conduit_url` varchar(255) NOT NULL,
  `access_key` varchar(255) NOT NULL,
  `dsn` varchar(255) NOT NULL,
  `time_add` int(10) unsigned NOT NULL,
  `time_edit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.special_offer_applicants
CREATE TABLE IF NOT EXISTS `special_offer_applicants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('','male','female') DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `street_2` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `age_range` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_birth_child` date DEFAULT NULL,
  `email_address` varchar(100) NOT NULL,
  `checkbox_1` enum('no','yes') DEFAULT NULL,
  `checkbox_2` enum('no','yes') DEFAULT NULL,
  `checkbox_3` enum('no','yes') DEFAULT NULL,
  `time_add` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offer_id` (`offer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` char(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_cms.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `uniquecheck` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
