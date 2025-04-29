-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 12:26 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int NOT NULL,
  `annouce_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `annouce_place` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `annouce_date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `details` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(7, 'Vegetarian Dishes'),
(11, 'Non-Vegetarian Dishes'),
(12, 'Rice & Biryani'),
(13, 'Indian Breads'),
(14, 'Street Food & Chaats'),
(15, 'Snacks & Starters'),
(16, 'Desserts & Sweets'),
(17, 'Beverages');

-- --------------------------------------------------------

--
-- Table structure for table `combo`
--

CREATE TABLE `combo` (
  `combo_id` int NOT NULL,
  `combo_name` varchar(100) NOT NULL,
  `combo_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `combo`
--

INSERT INTO `combo` (`combo_id`, `combo_name`, `combo_price`) VALUES
(4, 'Veg', 340.00),
(5, 'Non-Veg', 370.00),
(6, 'Veg & Non-Veg', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `combo_details`
--

CREATE TABLE `combo_details` (
  `combo_details_id` int NOT NULL,
  `combo_id` int NOT NULL,
  `menu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `combo_details`
--

INSERT INTO `combo_details` (`combo_details_id`, `combo_id`, `menu_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 1),
(4, 2, 3),
(5, 3, 2),
(6, 3, 4),
(7, 4, 9),
(8, 4, 11),
(9, 4, 36),
(10, 4, 42),
(11, 5, 12),
(12, 5, 20),
(14, 5, 41),
(15, 5, 34),
(16, 6, 11),
(17, 6, 31),
(18, 6, 38),
(19, 6, 43);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int NOT NULL,
  `event_what` varchar(500) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event_where` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_what`, `event_date`, `event_time`, `event_where`) VALUES
(1, 'Company Christmas Party', '2024-12-15', '10:39:00', 'Gym');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `member_last` varchar(15) NOT NULL,
  `member_first` varchar(15) NOT NULL,
  `member_status` varchar(10) NOT NULL,
  `member_contact` varchar(30) NOT NULL,
  `member_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_last`, `member_first`, `member_status`, `member_contact`, `member_address`) VALUES
(1, 'mallah', 'rohan', 'active', '1212123434', 'bhandup'),
(2, 'yadav', 'shyam', 'active', '3434341212', 'bhandup'),
(3, 'gupta', 'sahil', 'active', '5656563434', 'mulund'),
(4, 'kannaujiya', 'vivek', 'active', '1231231234', 'bhandup'),
(5, 'maurya', 'piyush', 'inactive', '2342342341', 'mumbra');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `cat_id` int NOT NULL,
  `subcat_name` varchar(30) NOT NULL,
  `menu_desc` varchar(100) NOT NULL,
  `menu_price` decimal(10,2) NOT NULL,
  `menu_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `cat_id`, `subcat_name`, `menu_desc`, `menu_price`, `menu_pic`) VALUES
(8, 'Palak Paneer', 7, 'Paneer Dishes', 'palak paneer', 100.00, 'palak paneer.jpg'),
(9, 'Paneer Butter Masala', 7, 'Paneer Dishes', 'famous paneer dish', 120.00, 'paneer-butter-masala.jpg'),
(10, 'Shahi Paneer', 7, 'Paneer Dishes', 'shahi paneer', 150.00, 'shahi-paneer.jpg'),
(11, 'Dal Tadka', 7, 'Dal & Lentils', 'indian dal', 60.00, 'dal-tadka.webp'),
(12, 'Dal Makhani', 7, 'Dal & Lentils', 'famous daal', 80.00, 'Dal-Makhani.jpg'),
(13, 'Moong Dal', 7, 'Dal & Lentils', 'tasty moong dal', 60.00, 'moong-dal.webp'),
(14, 'Navratan Korma', 7, 'Mixed Vegetable Curries', 'mix indian bhaji', 70.00, 'Navratan Korma.jpeg'),
(15, 'Aloo Gobhi', 7, 'Mixed Vegetable Curries', 'gobhi bhaaji', 70.00, 'Aloo-Gobi.jpg'),
(16, 'Bhindi Masala', 7, 'Mixed Vegetable Curries', 'Bhindi sabji', 50.00, 'Bhindi-Masala.jpg'),
(17, 'Sambar', 7, 'South Indian Specials', 'south indian sambar', 70.00, 'sambar.jpg'),
(18, 'Rasam', 7, 'South Indian Specials', 'south indian rasam', 80.00, 'rasam.jpg'),
(19, 'Avial', 7, 'South Indian Specials', 'south indian avial', 80.00, 'Avial.webp'),
(20, 'Butter Chicken', 11, 'Chicken', 'butter chicken', 100.00, 'chicken-butter.jpg'),
(21, 'Chicken Curry', 11, 'Chicken', 'chicken curry', 100.00, 'Chicken-Curry.jpg'),
(22, 'Chicken Chettinad', 11, 'Chicken', 'tasty chicken ', 120.00, 'chicken-chettinad.jpg'),
(23, 'Mutton Rogan Jos', 11, 'Mutton', 'rogan jos', 120.00, 'Mutton-Rogan-Josh.jpg'),
(24, 'Mutton Korma', 11, 'Mutton', 'Mutton kurma', 130.00, 'mutton-korma.jpg'),
(25, 'Keema', 11, 'Mutton', 'mutton keema', 140.00, 'keema.jpg'),
(26, 'Fish Curry', 11, 'Seafood', 'fish curry', 90.00, 'fish-curry.jpg'),
(27, 'Prawns Masala', 11, 'Seafood', 'prawns sabji', 120.00, 'prawns-masala.jpg'),
(28, 'Crab Masala', 11, 'Seafood', 'Crab food', 150.00, 'crab-masala.jpeg'),
(29, 'Egg Curry', 11, 'Egg', 'egg curry', 60.00, 'egg-curry.jpg'),
(30, 'Masala Omelette', 11, 'Egg', 'masala omelette', 70.00, 'masala-omelette.jpg'),
(31, 'Egg Bhurji', 11, 'Egg', 'egg bhurji', 80.00, 'Egg-Bhurji.jpg'),
(32, 'Hyderabadi Veg Biryani', 12, 'Veg Biryani', 'hyderbadi veg', 80.00, 'Hyderabadi-Veg-Biryani.jpg'),
(33, 'Paneer Biryani', 12, 'Veg Biryani', 'paneer biryani', 90.00, 'Paneer-biryani.jpg'),
(34, 'Chicken Biryani', 11, 'Non-Veg Biryani', 'chicken biryani', 110.00, 'chicken-biryani.jpg'),
(35, 'Mutton Biryani', 11, 'Non-Veg Biryani', 'mutton biryani', 140.00, 'mutton-biryani.webp'),
(36, 'Jeera Pulao', 12, 'Pulao', 'jeera rice', 100.00, 'jeera-pulao.jpg'),
(37, 'Peas Pulao', 12, 'Pulao', 'matar pulao', 100.00, 'peas-pulao.jpg'),
(38, 'Kashmiri Pulao', 12, 'Pulao', 'kashmiri rice', 140.00, 'kashmiri-pulao.jpg'),
(39, 'Dal Khichdi', 12, 'Khichdi', 'dal khichdi', 60.00, 'dal-khichdi.jpg'),
(40, 'Masala Khichdi', 12, 'Khichdi', 'masala khichdi', 70.00, 'masala-khichdi.webp'),
(41, 'Tandoori Roti', 13, 'Roti & Paratha', 'tandoori roti', 50.00, 'Tandoori-Roti.jpg'),
(42, 'Naan', 13, 'Roti & Paratha', 'Naan', 60.00, 'Naan.avif'),
(43, 'Lacchha Paratha', 13, 'Roti & Paratha', 'lacchha paratha', 60.00, 'laccha paratha.jpg'),
(44, 'Aloo Paratha', 13, 'Stuffed Parathas', 'aloo ka paratha', 90.00, 'Aloo-Paratha.jpg'),
(45, 'Paneer Paratha', 13, 'Stuffed Parathas', 'paneer paratha', 110.00, 'Paneer-Paratha.jpg'),
(46, 'Mooli Paratha', 13, 'Stuffed Parathas', 'mooli paratha', 80.00, 'mooli-paratha.webp'),
(47, 'Chole Bhature', 13, 'Poori & Bhature', 'chole bhature', 120.00, 'chole-bhature.jpg'),
(48, 'Aloo Puri', 13, 'Poori & Bhature', 'aloo puri bhaji', 130.00, 'Aloo-Puri-Bhaji.jpg'),
(49, 'Pani Puri', 14, 'Puri street food', 'golgappe', 60.00, 'pani-puri.jpg'),
(50, 'Shev Puri', 14, 'Puri street food', 'shev puri', 80.00, 'sev-puri.jpg'),
(51, 'Dahi Puri', 14, 'Puri street food', 'dahi puri', 90.00, 'dahi-puri.jpg'),
(52, 'Pav Bhaji', 14, 'Pav street food', 'pavbhaji', 80.00, 'pav-bhaji.jpg'),
(53, 'Vada Pav', 14, 'Pav street food', 'vadapav', 70.00, 'vada-pav.jpg'),
(54, 'Misal Pav', 14, 'Pav street food', 'misal pav', 90.00, 'Misal-Pav.webp'),
(55, 'Chole Kulche', 14, 'famouse street food', 'chole kulche', 90.00, 'chole-kulche.webp'),
(56, 'Samosa', 14, 'famouse street food', 'samosa', 60.00, 'samosa.jpeg'),
(57, 'Kachori', 14, 'famouse street food', 'kachori', 70.00, 'kachori.jpg'),
(58, 'Hara Bhara Kebab', 15, 'Vegetarian', 'hara bhara kebab', 80.00, 'hara-bhara-kebab.jpg'),
(59, 'Aloo Tikki', 15, 'Vegetarian', 'aloo tikki', 60.00, 'aloo-tikki.jpg'),
(60, 'Veg Cutlet', 15, 'Vegetarian', 'veg cutlet', 80.00, 'Veg-cutlet.jpg'),
(61, 'Chicken Tikka', 15, 'Non-Vegetarian', 'chicken tikka', 100.00, 'chicken-tikka.jpg'),
(62, 'Seekh Kebab', 15, 'Non-Vegetarian', 'seekh kebab', 90.00, 'seekh-kebab.jpg'),
(63, 'Fish Fry', 15, 'Non-Vegetarian', 'fish fry', 120.00, 'fish-fry.jpg'),
(64, 'Gulab Jamun', 16, 'North Indian', 'gulab jamun', 80.00, 'gulab-jamun.jpg'),
(65, 'Ras Gulla', 16, 'Bengali Sweets', 'rasgulla', 100.00, 'rasgulla.jpg'),
(66, 'Ras Malai', 16, 'North Indian', 'rasmalai', 100.00, 'Rasmalai.webp'),
(67, 'Kaju Katli', 16, 'North Indian', 'kajukatli', 80.00, 'kaju-katli.jpg'),
(68, 'Mysore Pak', 16, 'South Indian', 'mysorepak', 120.00, 'Mysore-Pak.webp'),
(69, 'Payasam', 16, 'South Indian', 'payasam', 80.00, 'payasam.jpg'),
(70, 'Kesari', 16, 'South Indian', 'kesari', 110.00, 'kesari.webp'),
(71, 'Sandesh', 16, 'Bengali Sweets', 'sandesh', 60.00, 'sandesh.jpeg'),
(72, 'Mishti Doi', 16, 'Bengali Sweets', 'mishti doi', 120.00, 'mishti-doi.jpg'),
(73, 'Masala Chai', 17, 'Hot', 'masala chai', 60.00, 'masala-chai.jpg'),
(74, 'Filter Coffee', 17, 'Hot', 'filter coffee', 70.00, 'filter-coffee.jpg'),
(75, 'Badam Milk', 17, 'Hot', 'badam milk', 100.00, 'badam-milkshake.jpg'),
(76, 'Lassi', 17, 'Cold', 'lassi', 80.00, 'Lassi.webp'),
(77, 'Jaljeera', 17, 'Cold', 'jaljeera', 70.00, 'Jaljeera.jpg'),
(78, 'Nimbu Pani', 17, 'Cold', 'nimbupani', 60.00, 'Nimbu-Pani.webp');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `fullname`, `email`, `subject`, `message`, `date`) VALUES
(1, 'shyam yadav', 'shyam@gmail.com', 'food quality', 'great food tasty , the guests loved it', '2025-04-22 03:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `amount` int NOT NULL,
  `rid` int NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `amount`, `rid`, `payment_date`) VALUES
(1, 2000, 42, '2017-04-28'),
(2, 15000, 47, '2025-03-14'),
(3, 50000, 48, '2025-03-20'),
(4, 50000, 48, '2025-03-20'),
(5, 7500, 49, '2025-03-20'),
(6, 17000, 52, '2025-04-22'),
(7, 50000, 51, '2025-04-22'),
(8, 10000, 50, '2025-04-22'),
(9, 50000, 53, '2025-04-22'),
(10, 7500, 54, '2025-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `rid` int NOT NULL,
  `r_date` date DEFAULT NULL,
  `r_time` time DEFAULT NULL,
  `r_last` varchar(30) NOT NULL,
  `r_first` varchar(30) NOT NULL,
  `r_contact` varchar(30) NOT NULL,
  `r_email` varchar(50) NOT NULL,
  `r_address` varchar(100) NOT NULL,
  `r_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `r_ocassion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `r_motif` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `r_venue` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payable` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `r_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_reserved` date NOT NULL,
  `r_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pax` int DEFAULT NULL,
  `combo_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `modeofpayment` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`rid`, `r_date`, `r_time`, `r_last`, `r_first`, `r_contact`, `r_email`, `r_address`, `r_type`, `r_ocassion`, `r_motif`, `team_id`, `r_venue`, `payable`, `balance`, `r_status`, `date_reserved`, `r_code`, `pax`, `combo_id`, `price`, `modeofpayment`) VALUES
(42, '2017-05-04', '14:00:00', 'kannaujiya', 'vivek', '09001914000', 'vivek@gmail.com', 'bhandup', 'buffet', 'Baptism', 'White', 0, 'Bago City', 2500.00, 500.00, 'Cancelled', '2017-04-28', '5xkKxwWasn', 50, 3, 50.00, ''),
(45, '2017-06-07', '01:00:00', 'klj', 'kkj', 'kjk', 'emoblazz@gmail.com', 'kjk', 'buffet', 'Baptism', 'jjj', 0, 'lkjkj', 1500.00, 1500.00, 'Cancelled', '2017-04-28', 'Bg0GueD1Vg', 10, 1, 150.00, 'Bank to Bank'),
(46, '2017-08-07', '01:00:00', 'maurya', 'piyush', '9656798778', 'nakli@gmail.com', 'sonapur', 'buffet', 'Baptism', 'jjj', 0, 'lkjkj', 1500.00, 1500.00, 'Cancelled', '2017-04-28', 'Bg0GuezJd8', 10, 1, 150.00, ''),
(47, '2025-03-26', '22:00:00', 'gupta', 'sahil', '1234567890', 'sahilgpta301@gmail.com', 'B/308, Parishram Society', 'plated', 'Birthday', 'birthday theme', NULL, 'Wamanrao Muranjan Banquet Hall', 15000.00, 0.00, 'Approved', '2025-03-14', 'CSSykjMJiSE', 100, 1, 150.00, 'Cash'),
(48, '2025-03-29', '18:27:00', 'mallah', 'rohan', '123455432', 'rohan@gmail.com', 'bhandup', 'buffet', 'Wedding', 'weddding', NULL, 'thane', 50000.00, -50000.00, 'Approved', '2025-03-14', 'prHZ3vO9bgI', 200, 2, 250.00, 'Bank to Bank'),
(49, '2025-03-19', '19:47:00', 'yadav', 'shyam', '1234512345', 'shyam@gmail.com', 'bhandup', 'plated', 'Others', 'engagement', NULL, 'Chembur', 7500.00, 0.00, 'Finished', '2025-03-14', 'Pzc3U0IVW0W', 150, 3, 50.00, 'Bank to Bank'),
(50, '2025-04-23', '16:00:00', 'kumar', 'param', '5647389210', 'param@gmail.com', 'B/505, Anjani heights, Bandra West', 'plated', 'Wedding', 'indian hindu shaadi', NULL, 'Royal Banquets Ceremony and Co, Worli, near Sea-link', 148000.00, 138000.00, 'Approved', '2025-03-20', 'GmFNGvCiqXl', 400, 5, 370.00, 'Online/UPI'),
(51, '2025-04-30', '12:17:00', 'Rajeevan', 'Vighnesh', '1234567890', 'vighnesh@gmail.com', 'Dombivli', 'buffet', 'Wedding', 'south indian wedding', NULL, 'Kalyan', 80000.00, 30000.00, 'Approved', '2025-04-22', '9eJWOgg6cTv', 200, 6, 400.00, 'Online/UPI'),
(52, '2025-05-02', '12:41:00', 'singh', 'Krishna', '2342342341', 'krishna@gmail.com', 'dombivli', 'plated', 'Others', 'Ritual', NULL, 'lonavla', 17000.00, 0.00, 'Approved', '2025-04-22', '7Jkr2v9jDJW', 50, 4, 340.00, 'Cash'),
(53, '2025-05-15', '12:46:00', 'Narewade', 'Siddesh', '09001914000', 'sid@gmail.com', 'Diva', 'buffet', 'Wedding', 'weddding', NULL, 'uhasnagar', 60000.00, 10000.00, 'Approved', '2025-04-22', 'gTq29HmUhza', 150, 6, 400.00, 'Online/UPI'),
(54, '2025-06-04', '12:50:00', 'gupta', 'anurag', '09001914000', 'anurag@gmail.com', 'diva', 'buffet', 'Birthday', 'birthday theme', NULL, 'thane', 37000.00, 29500.00, 'Approved', '2025-04-22', 'yK13ggnzKEh', 100, 5, 370.00, 'Bank to Bank'),
(55, NULL, NULL, 'gupta', 'sahil', '1234567890', 'sahilgpta301@gmail.com', 'mulund', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22', 'p8uKzqBUUj9', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `r_combo`
--

CREATE TABLE `r_combo` (
  `r_combo_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `r_details_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_details`
--

CREATE TABLE `r_details` (
  `r_details_id` int NOT NULL,
  `rid` int NOT NULL,
  `combo_id` int NOT NULL,
  `r_nop` int NOT NULL,
  `r_total` decimal(10,2) NOT NULL,
  `r_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_noncombo`
--

CREATE TABLE `r_noncombo` (
  `r_non_id` int NOT NULL,
  `rid` int NOT NULL,
  `menu_id` int NOT NULL,
  `serve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `subcat_id` int NOT NULL,
  `subcat_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`subcat_id`, `subcat_name`) VALUES
(11, 'Paneer Dishes'),
(12, 'Dal & Lentils'),
(13, 'South Indian Specials'),
(14, 'Chicken '),
(15, 'Mutton'),
(16, 'Seafood'),
(17, 'Egg'),
(18, 'Mixed Vegetable Curries'),
(19, 'Veg Biryani'),
(20, 'Non-Veg Biryani'),
(21, 'Pulao '),
(22, 'Khichdi'),
(23, 'Roti & Paratha'),
(24, 'Stuffed Parathas'),
(25, 'Poori & Bhature'),
(26, 'Puri street food'),
(27, 'Pav street food'),
(28, 'famouse street food'),
(29, 'Vegetarian '),
(30, 'Non-Vegetarian '),
(31, 'North Indian'),
(32, 'South Indian'),
(33, 'Bengali Sweets'),
(34, 'Hot'),
(35, 'Cold');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`) VALUES
(1, 'Team 1');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `team_member_id` int NOT NULL,
  `team_id` int NOT NULL,
  `member_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_member`
--

INSERT INTO `team_member` (`team_member_id`, `team_id`, `member_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 1),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `username`, `password`, `status`) VALUES
(1, 'Lee Pipez', 'admin', '123', 'active'),
(2, 'Sahil Gupta', 'sahil301', '123456', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`combo_id`);

--
-- Indexes for table `combo_details`
--
ALTER TABLE `combo_details`
  ADD PRIMARY KEY (`combo_details_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `r_combo`
--
ALTER TABLE `r_combo`
  ADD PRIMARY KEY (`r_combo_id`);

--
-- Indexes for table `r_details`
--
ALTER TABLE `r_details`
  ADD PRIMARY KEY (`r_details_id`);

--
-- Indexes for table `r_noncombo`
--
ALTER TABLE `r_noncombo`
  ADD PRIMARY KEY (`r_non_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcat_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`team_member_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `combo`
--
ALTER TABLE `combo`
  MODIFY `combo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `combo_details`
--
ALTER TABLE `combo_details`
  MODIFY `combo_details_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `rid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `r_combo`
--
ALTER TABLE `r_combo`
  MODIFY `r_combo_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_details`
--
ALTER TABLE `r_details`
  MODIFY `r_details_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `r_noncombo`
--
ALTER TABLE `r_noncombo`
  MODIFY `r_non_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `team_member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
