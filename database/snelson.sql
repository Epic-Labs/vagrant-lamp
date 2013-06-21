-- --------------------------------------------------------
-- Host:                         192.168.100.249
-- Server version:               5.1.56-rs - Distributed by Rackspace
-- Server OS:                    redhat-linux-gnu
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-06-21 13:29:55
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for dev_jtap_coupons
CREATE DATABASE IF NOT EXISTS `dev_jtap_coupons` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dev_jtap_coupons`;


-- Dumping structure for table dev_jtap_coupons.amazon_asin_browse_node
CREATE TABLE IF NOT EXISTS `amazon_asin_browse_node` (
  `asin` varchar(20) NOT NULL,
  `browse_node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`asin`),
  KEY `browse_node_id` (`browse_node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.amazon_browse_nodes
CREATE TABLE IF NOT EXISTS `amazon_browse_nodes` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(75) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.bestdealconf
CREATE TABLE IF NOT EXISTS `bestdealconf` (
  `months` int(11) unsigned NOT NULL,
  `percentage` decimal(4,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.bestdealrel
CREATE TABLE IF NOT EXISTS `bestdealrel` (
  `dealid` int(10) unsigned NOT NULL,
  `posibledealid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dealid`,`posibledealid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.CouponRules
CREATE TABLE IF NOT EXISTS `CouponRules` (
  `CouponRuleID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `StartValue` decimal(5,2) NOT NULL,
  `EndValue` decimal(5,2) NOT NULL,
  `Action` varchar(20) NOT NULL,
  PRIMARY KEY (`CouponRuleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Coupons
CREATE TABLE IF NOT EXISTS `Coupons` (
  `CUPC` varchar(80) NOT NULL,
  `FamilyCode` char(3) NOT NULL DEFAULT '',
  `ValueCode` char(2) NOT NULL DEFAULT '',
  `Descrip` varchar(255) NOT NULL DEFAULT '',
  `ExpDate` date NOT NULL DEFAULT '0000-00-00',
  `IssueDate` date NOT NULL DEFAULT '0000-00-00',
  `Source` varchar(3) NOT NULL,
  `MarketID` int(3) NOT NULL DEFAULT '1',
  `ValOverride` double NOT NULL DEFAULT '0',
  `QtyOverride` smallint(6) NOT NULL DEFAULT '0',
  `CouponID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `last_updated_user_id` int(10) unsigned DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `linkurl` varchar(250) DEFAULT NULL,
  `isrss` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUPC`,`MarketID`,`CouponID`),
  UNIQUE KEY `CouponID_2` (`CouponID`),
  KEY `MarketID` (`MarketID`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `Source` (`Source`),
  KEY `ExpDate` (`ExpDate`),
  KEY `Source_2` (`Source`,`Descrip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Coupons_archive
CREATE TABLE IF NOT EXISTS `Coupons_archive` (
  `CUPC` varchar(80) NOT NULL,
  `FamilyCode` char(3) NOT NULL DEFAULT '',
  `ValueCode` char(2) NOT NULL DEFAULT '',
  `Descrip` varchar(255) NOT NULL DEFAULT '',
  `ExpDate` date NOT NULL DEFAULT '0000-00-00',
  `IssueDate` date NOT NULL DEFAULT '0000-00-00',
  `Source` varchar(3) NOT NULL,
  `MarketID` int(3) NOT NULL DEFAULT '1',
  `ValOverride` double NOT NULL DEFAULT '0',
  `QtyOverride` smallint(6) NOT NULL DEFAULT '0',
  `CouponID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `last_updated_user_id` int(10) unsigned DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `linkurl` varchar(250) DEFAULT NULL,
  `isrss` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUPC`,`MarketID`,`CouponID`),
  UNIQUE KEY `CouponID_2` (`CouponID`),
  KEY `MarketID` (`MarketID`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `Source` (`Source`),
  KEY `ExpDate` (`ExpDate`),
  KEY `Source_2` (`Source`,`Descrip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.coupons_com_link
CREATE TABLE IF NOT EXISTS `coupons_com_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.coupons_com_link_user_uses
CREATE TABLE IF NOT EXISTS `coupons_com_link_user_uses` (
  `register_id` int(10) unsigned NOT NULL,
  `coupons_com_link_id` int(10) unsigned NOT NULL,
  `used` datetime NOT NULL,
  KEY `register_id` (`register_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.coupons_convert
CREATE TABLE IF NOT EXISTS `coupons_convert` (
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Coupons_ExtraContent
CREATE TABLE IF NOT EXISTS `Coupons_ExtraContent` (
  `contentid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `content` longtext,
  `dateentered` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.coupons_temp
CREATE TABLE IF NOT EXISTS `coupons_temp` (
  `CUPC` varchar(50) NOT NULL DEFAULT '',
  `FamilyCode` char(3) NOT NULL DEFAULT '',
  `ValueCode` char(2) NOT NULL DEFAULT '',
  `Descrip` varchar(255) NOT NULL DEFAULT '',
  `ExpDate` date NOT NULL DEFAULT '0000-00-00',
  `IssueDate` date NOT NULL DEFAULT '0000-00-00',
  `Source` char(3) NOT NULL DEFAULT '',
  `MarketID` int(3) NOT NULL DEFAULT '0',
  `ValOverride` double NOT NULL DEFAULT '0',
  `QtyOverride` smallint(6) NOT NULL DEFAULT '0',
  `CouponID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(250) DEFAULT NULL,
  `linkurl` varchar(250) DEFAULT NULL,
  `isrss` char(1) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `imported` datetime DEFAULT NULL,
  PRIMARY KEY (`CUPC`,`MarketID`,`CouponID`),
  KEY `MarketID` (`MarketID`),
  KEY `CouponID` (`CouponID`),
  KEY `CouponID_2` (`CouponID`),
  KEY `MarketID_2` (`MarketID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.CouponTags
CREATE TABLE IF NOT EXISTS `CouponTags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CouponID` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CouponID` (`CouponID`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealCouponLinks
CREATE TABLE IF NOT EXISTS `DealCouponLinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned NOT NULL,
  `link` varchar(500) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealDescriptions
CREATE TABLE IF NOT EXISTS `DealDescriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned NOT NULL,
  `description` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealInfo
CREATE TABLE IF NOT EXISTS `DealInfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `info` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealOtherNewspaperCoupons
CREATE TABLE IF NOT EXISTS `DealOtherNewspaperCoupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned NOT NULL,
  `coupon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealProducts
CREATE TABLE IF NOT EXISTS `DealProducts` (
  `DealID` int(10) unsigned NOT NULL DEFAULT '0',
  `UPC` varchar(12) NOT NULL DEFAULT '',
  `RegPrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `SalePrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `StoreAdjust` decimal(6,2) DEFAULT '0.00',
  `StoreAdjustQuantity` tinyint(3) unsigned DEFAULT '0',
  `StoreCouponID` int(10) unsigned DEFAULT '0',
  `StoreCouponQuantity` tinyint(3) unsigned DEFAULT '0',
  `MiscValue` decimal(6,2) DEFAULT '0.00',
  `MiscQuantity` tinyint(3) unsigned DEFAULT '0',
  `UnitAmount` decimal(6,2) DEFAULT NULL,
  `UnitType` varchar(20) DEFAULT NULL,
  `PercentSaved` int(3) NOT NULL DEFAULT '0',
  `FinalPrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `FinalPriceRegister` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`DealID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealProducts_archive
CREATE TABLE IF NOT EXISTS `DealProducts_archive` (
  `DealID` int(10) unsigned NOT NULL DEFAULT '0',
  `UPC` varchar(12) NOT NULL DEFAULT '',
  `RegPrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `SalePrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `PercentSaved` int(3) NOT NULL DEFAULT '0',
  `FinalPrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`DealID`,`UPC`),
  UNIQUE KEY `DealID_2` (`DealID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Deals
CREATE TABLE IF NOT EXISTS `Deals` (
  `DealID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CUPC` varchar(12) DEFAULT '0',
  `MarketID` int(3) NOT NULL DEFAULT '0',
  `StoreID` int(2) NOT NULL DEFAULT '0',
  `Comment` varchar(350) NOT NULL DEFAULT '',
  `StartDate` date NOT NULL DEFAULT '0000-00-00',
  `EndDate` date NOT NULL DEFAULT '2005-12-31',
  `Quantity` int(2) NOT NULL DEFAULT '1',
  `totalselect` int(11) NOT NULL DEFAULT '0',
  `maintselect` int(11) NOT NULL DEFAULT '0',
  `maintdate` date NOT NULL DEFAULT '0000-00-00',
  `MfgID` varchar(5) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `last_updated_user_id` int(10) unsigned DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `CouponID` int(11) NOT NULL DEFAULT '0',
  `CouponID_Other` int(11) NOT NULL DEFAULT '0',
  `Coupons_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `Coupons_com_CouponID_alt` int(11) NOT NULL DEFAULT '0',
  `Upromise_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `RedPlum_CouponID` int(11) NOT NULL DEFAULT '0',
  `SmartSource_CouponID` int(11) NOT NULL DEFAULT '0',
  `Shortcuts_com_CouponID` int(11) DEFAULT '0',
  `Cellfire_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `Savingstar_com_CouponID` int(11) DEFAULT '0',
  `Couponnetwork_com_CouponID` int(11) DEFAULT '0',
  `has_multiple_coupons` tinyint(3) unsigned DEFAULT '0',
  `bestdealstatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`DealID`),
  KEY `StartDate` (`StartDate`),
  KEY `EndDate` (`EndDate`),
  KEY `StoreID` (`StoreID`),
  KEY `MarketID` (`MarketID`),
  KEY `DealID` (`DealID`),
  KEY `created` (`created`),
  KEY `user_id` (`user_id`),
  KEY `CouponID` (`CouponID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Deals_archive
CREATE TABLE IF NOT EXISTS `Deals_archive` (
  `DealID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CUPC` varchar(12) DEFAULT '0',
  `MarketID` int(3) NOT NULL DEFAULT '0',
  `StoreID` int(2) NOT NULL DEFAULT '0',
  `Comment` varchar(350) NOT NULL DEFAULT '',
  `StartDate` date NOT NULL DEFAULT '0000-00-00',
  `EndDate` date NOT NULL DEFAULT '2005-12-31',
  `Quantity` int(2) NOT NULL DEFAULT '1',
  `totalselect` int(11) NOT NULL DEFAULT '0',
  `maintselect` int(11) NOT NULL DEFAULT '0',
  `maintdate` date NOT NULL DEFAULT '0000-00-00',
  `MfgID` varchar(5) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `last_updated_user_id` int(10) unsigned DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `CouponID` int(11) NOT NULL DEFAULT '0',
  `CouponID_Other` int(11) NOT NULL DEFAULT '0',
  `Coupons_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `Coupons_com_CouponID_alt` int(11) NOT NULL DEFAULT '0',
  `Upromise_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `RedPlum_CouponID` int(11) NOT NULL DEFAULT '0',
  `SmartSource_CouponID` int(11) NOT NULL DEFAULT '0',
  `Shortcuts_com_CouponID` int(11) DEFAULT '0',
  `Cellfire_com_CouponID` int(11) NOT NULL DEFAULT '0',
  `has_multiple_coupons` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`DealID`),
  KEY `StartDate` (`StartDate`),
  KEY `EndDate` (`EndDate`),
  KEY `StoreID` (`StoreID`),
  KEY `MarketID` (`MarketID`),
  KEY `StartDate_2` (`StartDate`),
  KEY `EndDate_2` (`EndDate`),
  KEY `StoreID_2` (`StoreID`),
  KEY `MarketID_2` (`MarketID`),
  KEY `DealID` (`DealID`),
  KEY `created` (`created`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Deals_ExtraContent
CREATE TABLE IF NOT EXISTS `Deals_ExtraContent` (
  `contentid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `content` longtext,
  `dateentered` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.DealTags
CREATE TABLE IF NOT EXISTS `DealTags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DealID` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DealID` (`DealID`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailList
CREATE TABLE IF NOT EXISTS `EmailList` (
  `EmailID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `EmailAddress` varchar(35) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `Agree` char(1) NOT NULL DEFAULT 'Y',
  `Registered_Date` date NOT NULL DEFAULT '0000-00-00',
  `UnSubscribe` char(1) NOT NULL DEFAULT 'N',
  `UnSubscribedDate` date DEFAULT NULL,
  PRIMARY KEY (`EmailID`),
  UNIQUE KEY `EmailIndex` (`EmailID`),
  KEY `EmailAddress` (`EmailAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailListAlert
CREATE TABLE IF NOT EXISTS `EmailListAlert` (
  `EmailID` int(11) NOT NULL DEFAULT '0',
  `AlertItem` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`EmailID`,`AlertItem`),
  KEY `EmailAlertIndex` (`EmailID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailListDealPrefs
CREATE TABLE IF NOT EXISTS `EmailListDealPrefs` (
  `EmailID` int(11) DEFAULT NULL,
  `DealMarketID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailListMarket
CREATE TABLE IF NOT EXISTS `EmailListMarket` (
  `EmailID` int(11) NOT NULL DEFAULT '0',
  `MarketID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EmailID`,`MarketID`),
  KEY `EmailMarketIndex` (`EmailID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailOpenHistory
CREATE TABLE IF NOT EXISTS `EmailOpenHistory` (
  `HistoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailID` int(11) NOT NULL DEFAULT '0',
  `EmailOpenDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`HistoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.EmailSentHistory
CREATE TABLE IF NOT EXISTS `EmailSentHistory` (
  `EmailSentID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailSentDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TotalCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmailSentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.ExcelDeal
CREATE TABLE IF NOT EXISTS `ExcelDeal` (
  `deal_id` int(11) NOT NULL AUTO_INCREMENT,
  `market_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `start_dt` date NOT NULL DEFAULT '0000-00-00',
  `end_dt` date NOT NULL DEFAULT '0000-00-00',
  `coupon_pub_dt` date DEFAULT NULL,
  `coupon_source` varchar(5) DEFAULT NULL,
  `product` varchar(55) NOT NULL DEFAULT '',
  `sale_price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `coupon_face_value` double DEFAULT NULL,
  `coupon_total_value` double DEFAULT NULL,
  `final_price` double NOT NULL DEFAULT '0',
  `percent_saved` int(11) NOT NULL DEFAULT '0',
  `reg_price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.ExcelHeaderFooter
CREATE TABLE IF NOT EXISTS `ExcelHeaderFooter` (
  `market_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `top_page` varchar(80) DEFAULT NULL,
  `bottom_page` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`market_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.HeaderFooter
CREATE TABLE IF NOT EXISTS `HeaderFooter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MarketID` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `header_content` text NOT NULL,
  `footer_content` text NOT NULL,
  `TopPage` varchar(80) NOT NULL DEFAULT '',
  `BottomPage` varchar(80) NOT NULL DEFAULT '',
  `Coupon` int(1) NOT NULL DEFAULT '0',
  `StoreID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `market_coupon_store` (`MarketID`,`Coupon`,`StoreID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.header_footer
CREATE TABLE IF NOT EXISTS `header_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `XDLocationID` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `public_name` varchar(255) NOT NULL,
  `header_content` text NOT NULL,
  `footer_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `market_coupon_store` (`market_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.hot_deal_log
CREATE TABLE IF NOT EXISTS `hot_deal_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) unsigned NOT NULL,
  `register_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_id` (`deal_id`,`register_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.imported_deal
CREATE TABLE IF NOT EXISTS `imported_deal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `feed_item_id` int(10) unsigned NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.MarketDealPreviews
CREATE TABLE IF NOT EXISTS `MarketDealPreviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `market_id` (`market_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Markets
CREATE TABLE IF NOT EXISTS `Markets` (
  `MarketID` int(3) NOT NULL AUTO_INCREMENT,
  `MarketName` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`MarketID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.markets_hitcounter_old
CREATE TABLE IF NOT EXISTS `markets_hitcounter_old` (
  `hit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `market_id` int(11) NOT NULL DEFAULT '0',
  `hit_date` date NOT NULL DEFAULT '0000-00-00',
  `hit_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.markets_hit_counter
CREATE TABLE IF NOT EXISTS `markets_hit_counter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_add` (`time_add`),
  KEY `market_it` (`market_id`,`time_add`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.markets_hit_counter_log
CREATE TABLE IF NOT EXISTS `markets_hit_counter_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(10) unsigned NOT NULL,
  `day` date NOT NULL,
  `total_views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.ProductFamilies
CREATE TABLE IF NOT EXISTS `ProductFamilies` (
  `UPC` varchar(12) NOT NULL DEFAULT '',
  `FamilyCode` char(3) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`UPC`,`FamilyCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Products
CREATE TABLE IF NOT EXISTS `Products` (
  `UPC` varchar(12) NOT NULL DEFAULT '',
  `Descr` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`UPC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table listing all products';

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.registered_user_password_reset
CREATE TABLE IF NOT EXISTS `registered_user_password_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_id` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.rss_deal
CREATE TABLE IF NOT EXISTS `rss_deal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vertis_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vertis_id_idx` (`vertis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.schema_version
CREATE TABLE IF NOT EXISTS `schema_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delta_id` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `ran_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.site_maintenance
CREATE TABLE IF NOT EXISTS `site_maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.state
CREATE TABLE IF NOT EXISTS `state` (
  `id` varchar(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.StateMarketAssociation
CREATE TABLE IF NOT EXISTS `StateMarketAssociation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state_id` varchar(3) DEFAULT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `alt_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.StateMarketStoreAssociation
CREATE TABLE IF NOT EXISTS `StateMarketStoreAssociation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state_id` varchar(3) DEFAULT NULL,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `alt_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.StoreCouponRules
CREATE TABLE IF NOT EXISTS `StoreCouponRules` (
  `StoreCouponRuleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `StoreID` smallint(5) unsigned NOT NULL,
  `MarketID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CouponRuleID` smallint(5) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  PRIMARY KEY (`StoreCouponRuleID`),
  UNIQUE KEY `StrMktRule_uk` (`StoreID`,`MarketID`,`CouponRuleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.StoreCouponRules_log
CREATE TABLE IF NOT EXISTS `StoreCouponRules_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `StoreCouponRuleID` int(10) unsigned NOT NULL,
  `StoreID` smallint(5) unsigned NOT NULL,
  `MarketID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CouponRuleID` smallint(5) unsigned NOT NULL,
  `Created` datetime NOT NULL,
  `ActionOccurred` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.Stores
CREATE TABLE IF NOT EXISTS `Stores` (
  `StoreID` int(2) NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned DEFAULT '0',
  `store_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.stores_hitcounter_old
CREATE TABLE IF NOT EXISTS `stores_hitcounter_old` (
  `hit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `market_id` int(11) NOT NULL DEFAULT '0',
  `hit_date` date NOT NULL DEFAULT '0000-00-00',
  `hit_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.stores_hit_counter
CREATE TABLE IF NOT EXISTS `stores_hit_counter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `market_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_add` (`time_add`),
  KEY `store_id` (`store_id`,`market_id`,`time_add`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.stores_hit_counter_log
CREATE TABLE IF NOT EXISTS `stores_hit_counter_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `day` date NOT NULL,
  `total_views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.time_clock
CREATE TABLE IF NOT EXISTS `time_clock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `pay_time` int(10) unsigned NOT NULL,
  `data` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `time_clock_user_id_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.XDLocationMarketStores
CREATE TABLE IF NOT EXISTS `XDLocationMarketStores` (
  `XDLocationMarketStoreID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `XDLocationID` int(10) unsigned NOT NULL,
  `MarketID` int(3) NOT NULL,
  `StoreID` int(2) NOT NULL,
  PRIMARY KEY (`XDLocationMarketStoreID`),
  UNIQUE KEY `XDLMS_LocMarketStore_uk` (`XDLocationID`,`MarketID`,`StoreID`),
  KEY `XDLMS_LocationID_idx` (`XDLocationID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dev_jtap_coupons.XDLocations
CREATE TABLE IF NOT EXISTS `XDLocations` (
  `XDLocationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `XDLocationName` varchar(100) NOT NULL,
  `XDLocationHeaderName` varchar(100) NOT NULL DEFAULT '',
  `XDLocationSlug` varchar(120) NOT NULL,
  `Publish` tinyint(1) NOT NULL DEFAULT '1',
  `state_id` varchar(3) DEFAULT NULL,
  `SubName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`XDLocationID`),
  UNIQUE KEY `XDLocationSlug` (`XDLocationSlug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
