-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2016 at 05:02 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `items`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `name` varchar(16) DEFAULT NULL,
  `create_dt_tm` datetime(6) DEFAULT NULL,
  `last_updt_dt_tm` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `gear_library`
--

CREATE TABLE `gear_library` (
  `item_name` varchar(16) DEFAULT NULL,
  `category` varchar(16) DEFAULT NULL,
  `description` varchar(16) DEFAULT NULL,
  `qty` int(16) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `unit` varchar(16) DEFAULT NULL,
  `item_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gear_library`
--

INSERT INTO `gear_library` (`item_name`, `category`, `description`, `qty`, `weight`, `unit`, `item_id`) VALUES
('Petzl Adjama', 'Climbing Gear', 'Harness', 1, 390, 'gram', 1),
('Petzl Elios', 'Climbing Gear', 'Helmet', 1, 10.6, 'ounce', 2),
('Black Diamond Po', 'Climbing Gear', 'Quickdraw', 5, 107, 'gram', 3),
('Petzl Grigri 2', 'Climbing Gear', 'Belay Device', 1, 170, 'gram', 4),
('Wildwire Wildwir', 'Climbing Gear', 'Quickdraw', 5, 97, 'gram', 5),
('Petzl Xion ', 'Climbing Gear', 'Rope 10.1mm 60m', 1, 3960, 'gram', 6),
('Grivel Quantum T', 'Climbing Gear', 'Ice Tool', 2, 18.3, 'ounce', 7),
('Black Diamond Sp', 'Climbing Gear', 'Ice Tool Umbilic', 1, 120, 'gram', 8),
('Grivel Spring Le', 'Climbing Gear', 'Ice Tool Umbilic', 1, 55, 'gram', 9),
('Black Diamond AT', 'Climbing Gear', 'Belay Device', 1, 2.3, 'ounce', 10),
('Black Diamond Cy', 'Climbing Gear', 'Step-in Crampons', 2, 540, 'gram', 11),
('Black Diamond Sa', 'Climbing Gear', 'Strap-on Crampon', 2, 455, 'gram', 12),
('Kahtoola microsp', 'Climbing Gear', 'size L', 1, 372, 'gram', 13),
('Kahtoola microsp', 'Climbing Gear', 'size M', 1, 338, 'gram', 14),
('Petzl Reverso', 'Climbing Gear', 'Belay Device', 1, 59, 'gram', 15),
('Edelweiss Oxygen', 'Climbing Gear', 'Rope 8.2mm 60m', 1, 27, 'kilogram', 16),
('CAMP USA Speed 2', 'Climbing Gear', 'Helmet', 1, 9.5, 'ounce', 17),
('Metolius Ropebag', 'Climbing Gear', 'ropebag / tarp', 1, 567, 'gram', 18),
('Dynex Runners', 'Climbing Gear', '10mm gold 60cm', 4, 0.7, 'ounce', 19),
('Black Diamond Ho', 'Climbing Gear', 'wiregate', 8, 1.4, 'ounce', 20),
('CAMP Runners', 'Climbing Gear', '10mm 120cm Dynee', 1, 1.6, 'ounce', 21),
('Sterling Cordele', 'Climbing Gear', '25ft 5mm', 1, 0, 'ounce', 22),
('Spectra Cordelet', 'Climbing Gear', '25ft 5.5mm Dynee', 1, 0, 'ounce', 23),
('Arc''teryx Psipho', 'Jackets', 'Softshell', 1, 285, 'gram', 24),
('Rab Xenon X', 'Jackets', 'Mid-layer Synthe', 1, 370, 'gram', 25),
('Westcomb Apoc Sh', 'Jackets', 'Hardshell', 1, 482, 'gram', 26),
('Crux Plasma Down', 'Jackets', 'Down Jacket eVen', 1, 570, 'gram', 27),
('Mountain Hardwar', 'Jackets', 'Synthetic Insula', 1, 479, 'gram', 28),
('Mountain Hardwar', 'Jackets', 'Hardshell', 1, 218, 'gram', 29),
('Mountain Hardwar', 'Jackets', 'Synthetic Insula', 1, 617, 'gram', 30),
('Mountain Hardwar', 'Jackets', 'Down Puffy', 1, 729, 'gram', 31),
('GoLite Flatiron ', 'Jackets', 'zip-up fleece', 1, 18, 'ounce', 32),
('TNF Torpedo Jack', 'Jackets', 'running/cycling ', 1, 0, 'gram', 33),
('Outdoor Research', 'Jackets', 'Delta Softshell', 1, 8, 'ounce', 34),
('Patagonia 2L Uni', 'Pants', 'Snow', 1, 913, 'gram', 35),
('Outdoor Research', 'Pants', 'Softshell Pant', 1, 303, 'gram', 36),
('Outdoor Research', 'Pants', 'Softshell Pant', 1, 563, 'gram', 37),
('Prana Menace Kni', 'Pants', '3/4 Capri Pant', 1, 10.4, 'ounce', 38),
('La Sportiva Nepa', 'Footwear', 'Ice Climbing Boo', 1, 72, 'ounce', 39),
('La Sportiva Spec', 'Footwear', 'Ski Boot', 1, 2892, 'gram', 40),
('La Sportiva Futu', 'Footwear', 'Climbing shoe', 1, 450, 'gram', 41),
('La Sportiva TC P', 'Footwear', 'Climbing shoe', 1, 494, 'gram', 42),
('Teva Terra-Fi', 'Footwear', 'Sandals', 1, 19.2, 'ounce', 43),
('Adidas Terrex So', 'Footwear', 'Approach Shoe', 1, 12, 'ounce', 44),
('Adidas Swift R G', 'Footwear', 'Hiking shoe', 1, 738, 'gram', 45),
('MSR Evo Ascent', 'Footwear', 'Snowshoe', 1, 1.78, 'kilogram', 46),
('MSR Evo Tails', 'Footwear', 'Snowshoe tails', 1, 12, 'ounce', 47),
('NRS Hydroskin So', 'Footwear', 'Neoprene Socks', 1, 0, 'gram', 48),
('Darn Tough Hiker', 'Footwear', 'Merino Micro cus', 1, 1.5, 'ounce', 49),
('REI Flash 45', 'Packs', 'Backpacking', 1, 964, 'gram', 50),
('Patagonia Linked', 'Packs', 'Day pack', 1, 468, 'gram', 51),
('Zpacks Arc Haul', 'Packs', 'Backpacking Ultr', 1, 700, 'gram', 52),
('Patagonia Ascens', 'Packs', 'Climbing pack', 1, 998, 'gram', 53),
('Mammut Couloir 3', 'Packs', '', 1, 1815, 'gram', 54),
('BCA Float 32', 'Packs', 'Airbag Avalanche', 1, 3218, 'gram', 55),
('TNF Base Camp Du', 'Packs', '', 1, 1840, 'gram', 56),
('TNF Base Camp Du', 'Packs', '', 1, 1590, 'gram', 57),
('Camelback Volt', 'Packs', 'Cycling Pack', 1, 730, 'gram', 58),
('REI Rain Cover', 'Packs', 'Rain Cover', 1, 125, 'gram', 59),
('Mountainsmith Sc', 'Packs', 'Day Pack', 1, 16.75, 'ounce', 60),
('EMS Packable Pac', 'Packs', '20-24L ultraligh', 1, 9, 'ounce', 61),
('Camelbak Antidot', 'Hydration System', '100oz/3L bladder', 1, 195, 'gram', 62),
('Camelbak Antidot', 'Hydration System', '100oz/3L bladder', 1, 200, 'gram', 63),
('Nalgene', 'Hydration System', '32oz/1L wide mou', 2, 178, 'gram', 64),
('MSR Autoflow Fil', 'Hydration System', 'Filtration', 1, 299, 'gram', 65),
('Steripen', 'Hydration System', 'Purification', 1, 162, 'gram', 66),
('Sea to Summit X-', 'Hydration System', 'Cup', 2, 2.4, 'ounce', 67),
('Nalgene', 'Hydration System', '48oz/1.5L', 1, 5.5, 'ounce', 68),
('Hydroflask', 'Hydration System', '32oz/1L', 1, 14.1, 'ounce', 69),
('MSR Dromedary', 'Hydration System', '4L', 1, 6.9, 'ounce', 70),
('Primus ETA Lite ', 'Cooking Gear', 'Stove', 1, 14.1, 'ounce', 71),
('Big Agnes Air Co', 'Sleeping Systems', 'Sleeping Pad', 1, 596, 'gram', 72),
('Therm-a-Rest Pro', 'Sleeping Systems', 'Sleeping Pad', 2, 680, 'gram', 73),
('Zpack 20', 'Sleeping Systems', 'Ultralight Down ', 1, 473, 'gram', 74),
('Big Agnes Roxy A', 'Sleeping Systems', 'Down Sleeping Ba', 1, 2.75, 'ounce', 75),
('Terra Nova Laser', 'Sleeping Systems', 'Tent', 1, 709, 'gram', 76),
('MSR Carbon Core', 'Sleeping Systems', 'Tent Stakes', 6, 5.75, 'gram', 77),
('Toaks V-Shaped', 'Sleeping Systems', 'Tent Stakes', 6, 12, 'gram', 78),
('Therm-a-Rest Z L', 'Sleeping Systems', 'Sleeping Pad', 1, 14, 'ounce', 79),
('Black Diamond Ca', 'Ski Gear', '164cm', 1, 2.6, 'kilogram', 80),
('Dynafit Beast 14', 'Ski Gear', 'Binding', 1, 830, 'gram', 81),
('Montana Monta Mi', 'Ski Gear', '130mm', 1, 0, 'ounce', 82),
('Black Diamond Al', 'Ski Gear', 'Whippet', 1, 430, 'gram', 83),
('Black Diamond Ul', 'Ski Gear', 'Poles', 1, 453, 'gram', 84),
('MSR Flight 3', 'Ski Gear', 'Poles', 1, 490, 'gram', 85),
('BCA B1 Avy Shove', 'Ski Gear', 'Avy Shovel', 1, 600, 'gram', 86),
('Pieps Pieps DSP ', 'Ski Gear', 'Avy Beacon (w ba', 1, 7, 'ounce', 87),
('Ski Tour Repair ', 'Ski Gear', 'Screw driver set', 1, 13, 'ounce', 88),
('Ortovox Probe', 'Ski Gear', '200 economic pro', 1, 194, 'gram', 89),
('Patagonia R1', 'Baselayer', '1/2 zip waffle l', 1, 14.1, 'ounce', 90),
('Stoic Merino Woo', 'Baselayer', 'Merino Wool Pant', 1, 6, 'ounce', 91),
('Buff', 'Baselayer', 'Face Neck Mask', 1, 2.9, 'ounce', 92),
('Icebreaker Sprin', 'Baselayer', 'Merino Wool top', 1, 7.05, 'ounce', 93),
('Icebreaker Ellip', 'Baselayer', 'ski tour long sl', 1, 14, 'ounce', 94),
('Seirus Ultra Cla', 'Baselayer', 'balaclava ', 1, 1.6, 'ounce', 95),
('Swiss Army Signa', 'Tools and Device', 'Multitool', 1, 0.8, 'ounce', 96),
('Leatherman Style', 'Tools and Device', 'Multitool', 1, 44.7, 'gram', 97),
('Leatherman Wave', 'Tools and Device', 'Multitool', 1, 241, 'gram', 98),
('Suunto Ambit3 Pe', 'Tools and Device', 'Watch', 1, 89, 'gram', 99),
('Black Diamond Re', 'Tools and Device', 'Headlamp', 1, 3.4, 'ounce', 100),
('Anker Astro2', 'Tools and Device', 'External Battery', 1, 250, 'gram', 101),
('Ext. Battery', 'Tools and Device', '2200mAh', 1, 3, 'ounce', 102),
('Julbo Pipelines', 'Eyewear', 'Sunglasses', 1, 0.5, 'ounce', 103),
('Julbo Aerospace', 'Eyewear', 'Goggles', 1, 1, 'ounce', 104),
('Mountain Hardwea', 'Gloves', 'Liners', 1, 36, 'gram', 105),
('The North Face V', 'Gloves', 'Waterproof Mitte', 1, 100, 'gram', 106),
('Rab VR Tour', 'Gloves', 'General gloves', 1, 4, 'ounce', 107),
('Mountain Hardwea', 'Gloves', 'Fingerless', 1, 4, 'ounce', 108),
('Hefstra Freeride', 'Gloves', 'Midweight Leathe', 1, 120, 'gram', 109),
('Packtowel XL', 'Miscellaneous', '', 1, 90, 'gram', 110),
('Olympus OM-D em1', 'Miscellaneous', 'Camera', 1, 390, 'gram', 111),
('Bausch & Lomb 28', 'Miscellaneous', 'Binoculars 10x42', 1, 0, 'ounce', 112);

-- --------------------------------------------------------

--
-- Table structure for table `item_specifications`
--

CREATE TABLE `item_specifications` (
  `item_cd` int(16) NOT NULL,
  `weight` float DEFAULT NULL,
  `unit` varchar(16) DEFAULT NULL,
  `material` varchar(16) DEFAULT NULL,
  `create_dt_tm` datetime(6) DEFAULT NULL,
  `last_updt_dt_tm` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gear_library`
--
ALTER TABLE `gear_library`
  ADD PRIMARY KEY (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gear_library`
--
ALTER TABLE `gear_library`
  MODIFY `item_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `item_specifications`
--
ALTER TABLE `item_specifications`
  MODIFY `item_cd` int(16) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
