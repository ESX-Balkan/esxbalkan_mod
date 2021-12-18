-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2021 at 06:23 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esx_mod`
--

CREATE DATABASE esx_mod;
USE esx_mod;
-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'Caution', 0),
('society_ambulance', 'Ambulance', 1),
('society_automafija', 'Auto Mafija', 1),
('society_ballas', 'Ballas', 1),
('society_camorra', 'Camorra', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_favela', 'Favela', 1),
('society_gsf', 'Gsf', 1),
('society_juzniv', 'Juzni Vetar', 1),
('society_lazarevacki', 'Lazarevacki', 1),
('society_lcn', 'Lcn', 1),
('society_ludisrbi', 'Ludi Srbi', 1),
('society_mechanic', 'Mécano', 1),
('society_peaky', 'Peaky', 1),
('society_police', 'Police', 1),
('society_stikla', 'Stikla', 1),
('society_vagos', 'Vagos', 1),
('society_yakuza', 'Yakuza', 1),
('society_zemunski', 'Zemunski', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 0, NULL),
(2, 'society_cardealer', 0, NULL),
(3, 'society_mechanic', 28, NULL),
(4, 'society_police', 0, NULL),
(5, 'caution', 0, '74876a5c901a8e0eb1dab4c60798874d5c67c025'),
(6, 'caution', 0, '497d0f594ba68e8de1ed7c76a16e8227ae79ec73'),
(7, 'caution', 0, '1100001368c2b7f'),
(8, 'caution', 0, '85a0b3b8f6ee3f54a776465fa558c16f1bcf077e'),
(9, 'caution', 0, '9385bc3fef24766260c44eb73ad73da85782b297'),
(10, 'society_automafija', 0, NULL),
(11, 'society_ballas', 500, NULL),
(12, 'society_camorra', 0, NULL),
(13, 'society_favela', 0, NULL),
(14, 'society_gsf', 0, NULL),
(15, 'society_juzniv', 0, NULL),
(16, 'society_lazarevacki', 0, NULL),
(17, 'society_lcn', 0, NULL),
(18, 'society_ludisrbi', 0, NULL),
(19, 'society_peaky', 0, NULL),
(20, 'society_stikla', 0, NULL),
(21, 'society_vagos', 0, NULL),
(22, 'society_yakuza', 0, NULL),
(23, 'society_zemunski', 0, NULL),
(24, 'caution', 0, '07515101c0843ddf01f8985a829f2d423cdd38e2'),
(25, 'caution', 0, '268b2536b75639708e06700024756888b750a72e'),
(26, 'caution', 0, '7bca483b9477213d53a35b78315ab33e887053bb'),
(27, 'caution', 0, 'f09f38f79007574c1d130b7a57c3644de11a00af'),
(28, 'caution', 0, '520152e6b62d8a1d1d9d86303941fd1f0c93792f'),
(29, 'caution', 0, '15c6f612f8a16611c23a4e61d08df1a37aeeaaf0'),
(30, 'caution', 0, '635f5bba392d3cf02ad1bdb8787e14cbab3704a4'),
(31, 'caution', 0, '7f0664d44e029905a8847ab05ea7a4c3cce38ddd'),
(32, 'caution', 0, '7c494b13b239fb2d864f42972105e86644afadc7'),
(33, 'caution', 0, 'dfb0e0e8023d54b5f5c8fbdaac888f7c55dfe4b5'),
(34, 'caution', 0, '177a6e1228f8553597ee7463cf2e230d0877e851'),
(35, 'caution', 0, '270b9841e2cfe14d234f89ba6629d6022294c12f'),
(36, 'caution', 0, '2318a335db2a0bc2e6f03a7b9819e0f50466a42a'),
(37, 'caution', 0, '3caac2be7748d7b3f0ecb5851d19bede577bed24'),
(38, 'caution', 0, '307a510f074f80e4eddbdd3698c65106ab258604'),
(39, 'caution', 0, '3cedde67dde789867b5c93d584221b86ed2e0f17'),
(40, 'caution', 0, '9846ab4991d69724c22bef43c023d6c2c4e0c976'),
(41, 'caution', 0, 'd9e2c93bd8138de24409ae26ab30ee60300eb318'),
(42, 'caution', 0, 'a5095c00fea8b8a27477453a4a15cf344aebb8d2'),
(43, 'caution', 0, 'f6504ac54725e6f5c923746d9ae3ee7bd63cf850'),
(44, 'caution', 0, '957cb76cab7243e3e956db21fcd9ec780875cae7'),
(45, 'caution', 0, '8410f18ba2f947b999d1f540ab0b102d9d930967'),
(46, 'caution', 0, 'd484b96e8844cdac6fb1db6626f37e35ac80696d'),
(47, 'caution', 0, 'ba5035c1445e08235fbfe5d1520137d59c10a8c4'),
(48, 'caution', 0, 'a06b962e5952a23b82561a23d0724834db06bdb5'),
(49, 'caution', 0, 'fb2e1f925ca6e42169719d57b874cabdbff6ee27'),
(50, 'caution', 0, 'bc1d9c8fbabf453d50f89fc38c3cce23dba5f9f7'),
(51, 'caution', 0, 'e2aeac2d102b850a58c4a372d4a1eb2d0e99f05f'),
(52, 'caution', 0, '9ac5a5f38034f4fdc36baafdde6439ad30074d42'),
(53, 'caution', 0, '54852a65952cf15c791afa693458fd047d071a99'),
(54, 'caution', 0, '56b748c30d6d8f3daa6a8ce49ce40d444ce123be'),
(55, 'caution', 0, '45cc17a554d771c10a81c8e7c0668693ab4ca72c'),
(56, 'caution', 0, '8475d066c5331ef8ab14992cd0b4c5bafd26e6d3'),
(57, 'caution', 0, 'e9d85e7f372e8b485c1538ae14bc427721a46eea'),
(58, 'caution', 0, '4ae5c2a567322ad67b79721c4f5884d42f3fd902'),
(59, 'caution', 0, 'd68ea116085b9520cb16dcc21130e681f37eed89'),
(60, 'caution', 0, '5ea6a64393f967c4484892d6b6f246844dffb42a'),
(61, 'caution', 0, 'e60d8aff6aed89317467377fd69eacb2646c7bff'),
(62, 'caution', 0, 'f21bd8b2d7faceb4c14abaf7dce6c3f103d4c642'),
(63, 'caution', 0, 'a3870e4f3b5d7385752471bbad71000dd100a316'),
(64, 'caution', 0, '8596880b4ce63e7578fd7ce6845be396a0df647b');

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'Ambulance', 1),
('society_automafija', 'Auto Mafija', 1),
('society_ballas', 'Ballas', 1),
('society_camorra', 'Camorra', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_favela', 'Favela', 1),
('society_gsf', 'Gsf', 1),
('society_juzniv', 'Juzni Vetar', 1),
('society_lazarevacki', 'Lazarevacki', 1),
('society_lcn', 'Lcn', 1),
('society_ludisrbi', 'Ludi Srbi', 1),
('society_mechanic', 'Mécano', 1),
('society_peaky', 'Peaky', 1),
('society_police', 'Police', 1),
('society_stikla', 'Stikla', 1),
('society_vagos', 'Vagos', 1),
('society_yakuza', 'Yakuza', 1),
('society_zemunski', 'Zemunski', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_ballas', 'bread', 0, NULL),
(2, 'society_ballas', 'WEAPON_PISTOL', 1, NULL),
(3, 'society_ballas', 'WEAPON_ASSAULTSMG', 0, NULL),
(4, 'society_ballas', 'phone', 29, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communityservice`
--

CREATE TABLE `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crew_phone_bank`
--

CREATE TABLE `crew_phone_bank` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crew_phone_news`
--

CREATE TABLE `crew_phone_news` (
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'Ambulance', 1),
('society_automafija', 'Auto Mafija', 1),
('society_ballas', 'Ballas', 1),
('society_camorra', 'Camorra', 1),
('society_favela', 'Favela', 1),
('society_gsf', 'Gsf', 1),
('society_juzniv', 'Juzni Vetar', 1),
('society_lazarevacki', 'Lazarevacki', 1),
('society_lcn', 'Lcn', 1),
('society_ludisrbi', 'Ludi Srbi', 1),
('society_mechanic', 'Mécano', 1),
('society_peaky', 'Peaky', 1),
('society_police', 'Police', 1),
('society_stikla', 'Stikla', 1),
('society_vagos', 'Vagos', 1),
('society_yakuza', 'Yakuza', 1),
('society_zemunski', 'Zemunski', 1);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_mechanic', NULL, '{}'),
(3, 'society_police', NULL, '{}'),
(4, 'society_automafija', NULL, '{}'),
(5, 'society_ballas', NULL, '{}'),
(6, 'society_camorra', NULL, '{}'),
(7, 'society_favela', NULL, '{}'),
(8, 'society_gsf', NULL, '{}'),
(9, 'society_juzniv', NULL, '{}'),
(10, 'society_lazarevacki', NULL, '{}'),
(11, 'society_lcn', NULL, '{}'),
(12, 'society_ludisrbi', NULL, '{}'),
(13, 'society_peaky', NULL, '{}'),
(14, 'society_stikla', NULL, '{}'),
(15, 'society_vagos', NULL, '{}'),
(16, 'society_yakuza', NULL, '{}'),
(17, 'society_zemunski', NULL, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `disc_ammo`
--

CREATE TABLE `disc_ammo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner` text NOT NULL,
  `hash` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attach` text NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0),
(2, 'Illegally Crossing a continuous Line', 40, 0),
(3, 'Driving on the wrong side of the road', 250, 0),
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken', 'Živa piletina', 50, 0, 1),
('bandage', 'Zavoji', 1, 0, 1),
('blowpipe', 'Cijev', 1, 0, 1),
('bread', 'Kruh', 1, 0, 1),
('cannabis', 'Kanabis', 0.1, 0, 1),
('carokit', 'Mehanicarski Dio 1', 3, 0, 1),
('carotool', 'Mehanicarski Dio 2', 2, 0, 1),
('chemicals', 'hemikalije', 51, 0, 1),
('clothe', 'Odeća', 1, 0, 1),
('coca_leaf', 'Coca Leaf', 50, 0, 1),
('coke', 'Kokain', 1, 0, 1),
('copper', 'Bakar', 1, 0, 1),
('cutted_wood', 'Iseceno drvo', 1, 0, 1),
('diamond', 'Dijamant', 1, 0, 1),
('disc_ammo_pistol', 'Pistol Ammo', 0.01, 0, 1),
('disc_ammo_pistol_large', 'Pistol Ammo Large', 0.01, 0, 1),
('disc_ammo_rifle', 'Rifle Ammo', 0.01, 0, 1),
('disc_ammo_rifle_large', 'Rifle Ammo Large', 0.01, 0, 1),
('disc_ammo_shotgun', 'Shotgun Shells', 0.01, 0, 1),
('disc_ammo_shotgun_large', 'Shotgun Shells Large', 0.01, 0, 1),
('disc_ammo_smg', 'SMG Ammo', 0.01, 0, 1),
('disc_ammo_smg_large', 'SMG Ammo Large', 0.01, 0, 1),
('disc_ammo_snp', 'Sniper Ammo', 0.01, 0, 1),
('disc_ammo_snp_large', 'Sniper Ammo Large', 0.01, 0, 1),
('drill', 'Busilica', 10, 0, 1),
('essence', 'Benzin', 10, 0, 1),
('fabric', 'Tkivo', 0.01, 0, 1),
('fish', 'Riba', 0.01, 0, 1),
('fixkit', 'Alat za popravku', 3, 0, 1),
('fixtool', 'Mehanicarski Dio 3', 2, 0, 1),
('flashlight', 'Flashlight', 2, 0, 1),
('gazbottle', 'Mehanicarski Dio 4', 2, 0, 1),
('gljive', 'Gljive', 3, 0, 1),
('gold', 'Zlato', 0.1, 0, 1),
('gold_bar', 'Zlatna Poluga', 0.1, 0, 1),
('grip', 'Grip', 2, 0, 1),
('heroin', 'Heroin', 0.01, 0, 1),
('hydrochloric_acid', 'Hlorovodonična kiselina', 0.01, 0, 1),
('iron', 'Metal', 0.1, 0, 1),
('jewels', 'Jewels', 0.01, 0, 1),
('laptop_h', 'Laptop za Hakovanje', 3, 0, 1),
('listkoke', 'List Koke', 0.01, 0, 1),
('lsa', 'LSA', 0.01, 0, 1),
('lsd', 'LSD', 0.01, 0, 1),
('marijuana', 'Marijuana', 0.01, 0, 1),
('medikit', 'Prva Pomoc', 2, 0, 1),
('meth', 'Meth', 0.01, 0, 1),
('packaged_chicken', 'Piletina u poslužavniku', 0.01, 0, 1),
('packaged_plank', 'Paket ploča', 0.01, 0, 1),
('petrol', 'ulje', 0.01, 0, 1),
('petrol_raffin', 'Rafinisana nafta', 1, 0, 1),
('phone', 'Mobilni Telefon', 1, 0, 1),
('poppyresin', 'Poppi Resin', 1, 0, 1),
('scope', 'Scope', 2, 0, 1),
('skin', 'Skin', 2, 0, 1),
('slaughtered_chicken', 'Zaklana piletina', 1, 0, 1),
('sodium_hydroxide', 'Natrijum hidroksid', 1, 0, 1),
('stone', 'Kamen', 1, 0, 1),
('sulfuric_acid', 'Sumporna kiselina', 1, 0, 1),
('supressor', 'Suppressor', 2, 0, 1),
('thermal_charge', 'Bomba', 3, 0, 1),
('thionyl_chloride', 'Thionil Chloride', 1, 0, 1),
('washed_stone', 'Oprani Kamen', 1, 0, 1),
('water', 'Voda', 1, 0, 1),
('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 0, 1),
('WEAPON_APPISTOL', 'AP Pistol', 1, 0, 1),
('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 0, 1),
('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 0, 1),
('WEAPON_ASSAULTSMG', 'Assault SMG', 1, 0, 1),
('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 0, 1),
('WEAPON_BALL', 'Ball', 1, 0, 1),
('WEAPON_BAT', 'Bat', 1, 0, 1),
('WEAPON_BATTLEAXE', 'Battle Axe', 1, 0, 1),
('WEAPON_BOTTLE', 'Bottle', 1, 0, 1),
('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1, 0, 1),
('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1, 0, 1),
('WEAPON_BZGAS', 'BZ Gas', 1, 0, 1),
('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 0, 1),
('WEAPON_COMBATMG', 'Combat MG', 1, 0, 1),
('WEAPON_COMBATPDW', 'Combat PDW', 1, 0, 1),
('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 0, 1),
('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 1, 0, 1),
('WEAPON_COMPACTRIFLE', 'Compact Rifle', 1, 0, 1),
('WEAPON_CROWBAR', 'Crowbar', 1, 0, 1),
('WEAPON_DAGGER', 'Dagger', 1, 0, 1),
('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1, 0, 1),
('WEAPON_DIGISCANNER', 'Digiscanner', 1, 0, 1),
('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1, 0, 1),
('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1, 0, 1),
('WEAPON_FIREWORK', 'Firework Launcher', 1, 0, 1),
('WEAPON_FLARE', 'Flare', 1, 0, 1),
('WEAPON_FLAREGUN', 'Flare Gun', 1, 0, 1),
('WEAPON_FLASHLIGHT', 'Flashlight', 1, 0, 1),
('WEAPON_GARBAGEBAG', 'Garbage Bag', 1, 0, 1),
('WEAPON_GOLFCLUB', 'Golf Club', 1, 0, 1),
('WEAPON_GRENADE', 'Grenade', 1, 0, 1),
('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 1, 0, 1),
('WEAPON_GUSENBERG', 'Gusenberg', 1, 0, 1),
('WEAPON_HAMMER', 'Hammer', 1, 0, 1),
('WEAPON_HANDCUFFS', 'Handcuffs', 1, 0, 1),
('WEAPON_HATCHET', 'Hatchet', 1, 0, 1),
('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1, 0, 1),
('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1, 0, 1),
('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 0, 1),
('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 1, 0, 1),
('WEAPON_KNIFE', 'Knife', 1, 0, 1),
('WEAPON_KNUCKLE', 'Knuckle Dusters ', 1, 0, 1),
('WEAPON_MACHETE', 'Machete', 1, 0, 1),
('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1, 0, 1),
('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1, 0, 1),
('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 1, 0, 1),
('WEAPON_MG', 'MG', 1, 0, 1),
('WEAPON_MICROSMG', 'Micro SMG', 1, 0, 1),
('WEAPON_MINIGUN', 'Minigun', 1, 0, 1),
('WEAPON_MINISMG', 'Mini SMG', 1, 0, 1),
('WEAPON_MOLOTOV', 'Molotov', 1, 0, 1),
('WEAPON_MUSKET', 'Musket', 1, 0, 1),
('WEAPON_NIGHTSTICK', 'Police Baton', 1, 0, 1),
('WEAPON_PETROLCAN', 'Petrol Can', 1, 0, 1),
('WEAPON_PIPEBOMB', 'Pipe Bomb', 1, 0, 1),
('WEAPON_PISTOL', 'Pistol', 1, 0, 1),
('WEAPON_PISTOL50', 'Police .50', 1, 0, 1),
('WEAPON_POOLCUE', 'Pool Cue', 1, 0, 1),
('WEAPON_PROXMINE', 'Proximity Mine', 1, 0, 1),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1),
('WEAPON_RAILGUN', 'Rail Gun', 1, 0, 1),
('WEAPON_REVOLVER', 'Revolver', 1, 0, 1),
('WEAPON_RPG', 'RPG', 1, 0, 1),
('WEAPON_SAWNOFFSHOTGUN', 'Sawn Off Shotgun', 1, 0, 1),
('WEAPON_SMG', 'SMG', 1, 0, 1),
('WEAPON_SMOKEGRENADE', 'Smoke Gernade', 1, 0, 1),
('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1, 0, 1),
('WEAPON_SNOWBALL', 'Snow Ball', 1, 0, 1),
('WEAPON_SNSPISTOL', 'SNS Pistol', 1, 0, 1),
('WEAPON_SPECIALCARBINE', 'Special Rifle', 1, 0, 1),
('WEAPON_STICKYBOMB', 'Sticky Bombs', 1, 0, 1),
('WEAPON_STINGER', 'Stinger', 1, 0, 1),
('WEAPON_STUNGUN', 'Police Taser', 1, 0, 1),
('WEAPON_SWITCHBLADE', 'Switch Blade', 1, 0, 1),
('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 1, 0, 1),
('WEAPON_WRENCH', 'Wrench', 1, 0, 1),
('whitehaze', 'White Haze', 3, 0, 1),
('wood', 'Drvo', 1, 0, 1),
('wool', 'Vuna', 0.1, 0, 1);

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'Hitna', 0),
('automafija', 'Auto Mafija', 1),
('ballas', 'Ballas', 1),
('camorra', 'Camorra', 1),
('cardealer', 'Autosalon', 0),
('favela', 'Favela', 1),
('fisherman', 'Ribarnica', 0),
('fueler', 'Rafiner', 0),
('gsf', 'Gsf', 1),
('juzniv', 'Juzni Vetar', 1),
('lazarevacki', 'Lazarevacki Klan', 1),
('lcn', 'Lcn', 1),
('ludisrbi', 'Ludi Srbi', 1),
('lumberjack', 'Drvoseča', 0),
('mechanic', 'Mehanicarska Radiona', 0),
('miner', 'Rudnik', 0),
('peaky', 'Peaky', 1),
('police', 'MUP', 0),
('reporter', 'Novinarska Kompanija', 0),
('slaughterer', 'Mesara', 0),
('stikla', 'Stikla', 1),
('tailor', 'Krojačica', 0),
('unemployed', 'Socijalna Pomoc', 0),
('vagos', 'Vagos', 1),
('yakuza', 'Yakuza', 1),
('zemunski', 'Zemunski Klan', 1);

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Nezaposlen', 200, '{}', '{}'),
(9, 'cardealer', 0, 'recruit', 'Pocetnik', 10, '{}', '{}'),
(10, 'cardealer', 1, 'novice', 'Radnik', 25, '{}', '{}'),
(11, 'cardealer', 2, 'experienced', 'Iskusni Saloner', 40, '{}', '{}'),
(12, 'cardealer', 3, 'boss', 'Gazda', 0, '{}', '{}'),
(13, 'police', 0, 'recruit', 'Kadet', 20, '{}', '{}'),
(14, 'police', 1, 'officer', 'Policajac', 40, '{}', '{}'),
(15, 'police', 2, 'sergeant', 'Narednik', 60, '{}', '{}'),
(16, 'police', 3, 'lieutenant', 'Zamjenik Nacelnika', 85, '{}', '{}'),
(17, 'police', 4, 'boss', 'Nacelnik', 100, '{}', '{}'),
(18, 'mechanic', 0, 'recrue', 'Segrt', 12, '{}', '{}'),
(19, 'mechanic', 1, 'novice', 'Limar', 24, '{}', '{}'),
(20, 'mechanic', 2, 'experimente', 'Mehanicar', 36, '{}', '{}'),
(21, 'mechanic', 3, 'chief', 'Iskusni Mehanicar', 48, '{}', '{}'),
(22, 'mechanic', 4, 'boss', 'Vlasnik Radnje', 0, '{}', '{}'),
(23, 'ambulance', 0, 'ambulance', 'Bolnicar', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(24, 'ambulance', 1, 'doctor', 'Doktor', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(25, 'ambulance', 2, 'chief_doctor', 'Pickotehnicar', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(26, 'ambulance', 3, 'boss', 'Direktor Bolnice', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(27, 'zemunski', 0, 'novi', 'Novi', 0, '{}', '{}'),
(28, 'zemunski', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(29, 'zemunski', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(30, 'zemunski', 3, 'boss', 'Sef', 0, '{}', '{}'),
(31, 'vagos', 0, 'novi', 'Novi', 0, '{}', '{}'),
(32, 'vagos', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(33, 'vagos', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(34, 'vagos', 3, 'boss', 'Sef', 0, '{}', '{}'),
(35, 'peaky', 0, 'novi', 'Novi', 0, '{}', '{}'),
(36, 'peaky', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(37, 'peaky', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(38, 'peaky', 3, 'boss', 'Sef', 0, '{}', '{}'),
(39, 'stikla', 0, 'novi', 'Novi', 0, '{}', '{}'),
(40, 'stikla', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(41, 'stikla', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(42, 'stikla', 3, 'boss', 'Sef', 0, '{}', '{}'),
(43, 'ludisrbi', 0, 'novi', 'Novi', 0, '{}', '{}'),
(44, 'ludisrbi', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(45, 'ludisrbi', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(46, 'ludisrbi', 3, 'boss', 'Sef', 0, '{}', '{}'),
(47, 'lcn', 0, 'novi', 'Novi', 0, '{}', '{}'),
(48, 'lcn', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(49, 'lcn', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(50, 'lcn', 3, 'boss', 'Sef', 0, '{}', '{}'),
(51, 'lazarevacki', 0, 'novi', 'Novi', 0, '{}', '{}'),
(52, 'lazarevacki', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(53, 'lazarevacki', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(54, 'lazarevacki', 3, 'boss', 'Sef', 0, '{}', '{}'),
(55, 'juzniv', 0, 'novi', 'Novi', 0, '{}', '{}'),
(56, 'juzniv', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(57, 'juzniv', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(58, 'juzniv', 3, 'boss', 'Sef', 0, '{}', '{}'),
(59, 'gsf', 0, 'novi', 'Novi', 0, '{}', '{}'),
(60, 'gsf', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(61, 'gsf', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(62, 'gsf', 3, 'boss', 'Sef', 0, '{}', '{}'),
(63, 'favela', 0, 'novi', 'Novi', 0, '{}', '{}'),
(64, 'favela', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(65, 'favela', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(66, 'favela', 3, 'boss', 'Sef', 0, '{}', '{}'),
(67, 'camorra', 0, 'novi', 'Novi', 0, '{}', '{}'),
(68, 'camorra', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(69, 'camorra', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(70, 'camorra', 3, 'boss', 'Sef', 0, '{}', '{}'),
(71, 'ballas', 0, 'novi', 'Novi', 0, '{}', '{}'),
(72, 'ballas', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(73, 'ballas', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(74, 'ballas', 3, 'boss', 'Sef', 0, '{}', '{}'),
(75, 'automafija', 0, 'novi', 'Novi', 0, '{}', '{}'),
(76, 'automafija', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(77, 'automafija', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(78, 'automafija', 3, 'boss', 'Sef', 0, '{}', '{}'),
(79, 'yakuza', 0, 'novi', 'Novi', 0, '{}', '{}'),
(80, 'yakuza', 1, 'radnik', 'Radnik', 0, '{}', '{}'),
(81, 'yakuza', 2, 'zamenik', 'Zamenik Sefa', 0, '{}', '{}'),
(82, 'yakuza', 3, 'boss', 'Sef', 0, '{}', '{}'),
(83, 'lumberjack', 0, 'employee', 'Drvoseča', 0, '{}', '{}'),
(84, 'fisherman', 0, 'employee', 'Ribar', 0, '{}', '{}'),
(85, 'fueler', 0, 'employee', 'Razvozac Nafte', 0, '{}', '{}'),
(86, 'reporter', 0, 'employee', 'Novinar', 0, '{}', '{}'),
(87, 'tailor', 0, 'employee', 'Krojac', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(88, 'miner', 0, 'employee', 'Rudar', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(89, 'slaughterer', 0, 'employee', 'Mesar', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}');

CREATE TABLE `kredit` (
  `igrac` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `preostalo` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Teorijski Ispit'),
('drive', 'B Kategorija'),
('drive_bike', 'A Kategorija'),
('drive_truck', 'C Kategorija'),
('weapon', 'Dozvola za Vatreno Oruzje');

CREATE TABLE `owned_vehicles` (
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `garage` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'A',
  `vehiclename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
(16336, '3103607', 'police', 1, '2021-12-12 14:54:10', 0);

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `registracija` (
  `tablice` longtext DEFAULT NULL,
  `izvadio` varchar(30) DEFAULT '30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `report` (
  `z` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accounts` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `inventory` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users_banovi` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `users_banovi` (`identifier`) VALUES
('steam:11000010fc3019c');


CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(4, 'dmv', 'f21bd8b2d7faceb4c14abaf7dce6c3f103d4c642');


CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
(5, 'GunShop', 'WEAPON_MACHETE', 90),
(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
(9, 'GunShop', 'WEAPON_BAT', 100),
(10, 'BlackWeashop', 'WEAPON_BAT', 100),
(11, 'GunShop', 'WEAPON_STUNGUN', 50),
(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
(25, 'GunShop', 'WEAPON_GRENADE', 500),
(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
(27, 'GunShop', 'WEAPON_BZGAS', 200),
(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
(31, 'GunShop', 'WEAPON_BALL', 50),
(32, 'BlackWeashop', 'WEAPON_BALL', 50),
(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

-- --------------------------------------------------------

--
-- Table structure for table `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `ime` varchar(50) NOT NULL DEFAULT 'Nema',
  `vlasnik` varchar(255) DEFAULT NULL,
  `koordinate` text DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `boja` varchar(50) DEFAULT NULL,
  `mestozauzimanja` text DEFAULT NULL,
  `placanje` int(11) DEFAULT NULL,
  `vreme` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communityservice`
--
ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `disc_ammo`
--
ALTER TABLE `disc_ammo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_name` (`job_name`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `users_banovi`
--
ALTER TABLE `users_banovi`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_yellowpages_posts_twitter_accounts` (`authorId`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`ime`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `disc_ammo`
--
ALTER TABLE `disc_ammo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16337;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45400;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1644;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10722;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD CONSTRAINT `job_grades_ibfk_1` FOREIGN KEY (`job_name`) REFERENCES `jobs` (`name`);

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);

--
-- Constraints for table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD CONSTRAINT `FK_yellowpages_posts_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

