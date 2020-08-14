-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Ağu 2020, 23:31:32
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `linkmoodkariyer`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `adv_name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `com_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `business_area` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `explanation` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `advertisement`
--

INSERT INTO `advertisement` (`id`, `adv_name`, `com_id`, `date`, `business_area`, `position`, `type`, `explanation`) VALUES
(1, 'Software Developer', 2005, '2019-12-10', 'Software', 'Software Engineer', 'Full Time', 'Python'),
(2, 'Storm Management', 2007, '2020-01-01', 'Civil Engineering', 'Civil Engineer', 'Fulltime', 'Roads Design'),
(3, 'Otomotive Designer', 2014, '2019-12-11', 'Otomotive', 'Otomotive Engineer', 'Intern', 'Engineering'),
(4, 'Web Developer', 2016, '2019-12-03', 'Web Development', 'Web Developer', 'Fulltime', 'PHP'),
(5, 'Cyber Security Expert', 2002, '2019-12-04', 'Cyber Security', 'Software Engineer', 'Fulltime', 'Python');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `certificates`
--

INSERT INTO `certificates` (`id`, `name`) VALUES
(1, 'Cyber Security Expert'),
(2, 'Human Resources Specialist Training'),
(3, 'Leadership and Effective Management Training'),
(4, 'Expertise in Labor Law and Social Security'),
(5, 'Digital Marketing and Social Media Expertise'),
(6, 'Artificial Intelligence Training'),
(7, 'Advanced Programming Training');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_date` date NOT NULL,
  `like_count` int(11) NOT NULL,
  `content` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`comment_id`, `user_id`, `post_id`, `comment_date`, `like_count`, `content`) VALUES
(1, 3002, 2, '2019-12-11', 3, 'text1'),
(2, 3012, 2, '2019-12-11', 0, 'text2'),
(3, 3006, 3, '2019-11-13', 1, 'text3'),
(4, 3006, 4, '2019-12-17', 2, 'text4'),
(5, 3009, 4, '2019-12-17', 0, 'text5'),
(6, 3008, 5, '2019-12-26', 0, 'text6'),
(7, 3012, 6, '2019-12-16', 2, 'text7'),
(8, 3003, 7, '2019-12-23', 1, 'text8'),
(9, 3004, 7, '2019-12-24', 0, 'text9'),
(10, 3008, 7, '2019-12-24', 0, 'text10'),
(11, 3002, 6, '2019-12-17', 0, 'text11'),
(12, 3009, 6, '2019-12-17', 1, 'text12'),
(13, 3006, 8, '2019-10-06', 1, 'text13'),
(14, 3004, 9, '2019-10-11', 3, 'text14'),
(15, 3006, 9, '2019-10-11', 0, 'text15'),
(16, 3002, 10, '2018-01-02', 0, 'text16'),
(17, 3017, 10, '2018-01-02', 0, 'text17'),
(18, 3023, 10, '2018-01-02', 2, 'text18'),
(19, 3008, 11, '2019-08-15', 0, 'text19'),
(20, 3013, 11, '2019-08-15', 0, 'text19'),
(21, 3018, 11, '2019-08-15', 1, 'text20'),
(22, 3007, 12, '2019-09-11', 3, 'text21'),
(23, 3019, 13, '2019-12-02', 0, 'text22'),
(24, 3024, 13, '2019-12-02', 1, 'text23'),
(25, 3003, 14, '2019-12-31', 2, 'text24'),
(26, 3020, 14, '2019-12-30', 1, 'text25'),
(27, 3023, 14, '2019-12-30', 0, 'text26'),
(28, 3005, 16, '2019-07-02', 2, 'text27'),
(29, 3011, 17, '2019-11-01', 1, 'text28'),
(30, 3002, 17, '2019-11-02', 1, 'text29'),
(31, 3009, 17, '2019-11-02', 0, 'text30');

--
-- Tetikleyiciler `comment`
--
DELIMITER $$
CREATE TRIGGER `after_delete_comment` AFTER DELETE ON `comment` FOR EACH ROW BEGIN
	UPDATE post
    SET comment_count = comment_count - 1 WHERE post_id = Old.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment_li̇ke`
--

CREATE TABLE `comment_li̇ke` (
  `user_id` int(11) NOT NULL COMMENT 'yorumu like layanın id si',
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `comment_li̇ke`
--

INSERT INTO `comment_li̇ke` (`user_id`, `comment_id`) VALUES
(3002, 1),
(3002, 7),
(3002, 14),
(3003, 7),
(3003, 29),
(3004, 4),
(3005, 4),
(3005, 14),
(3005, 28),
(3006, 22),
(3007, 13),
(3007, 23),
(3009, 18),
(3009, 22),
(3009, 28),
(3010, 1),
(3011, 1),
(3013, 22),
(3014, 3),
(3014, 14),
(3014, 26),
(3014, 30),
(3015, 18),
(3016, 8),
(3017, 24),
(3018, 21),
(3018, 24),
(3019, 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `sector` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `employee_count` int(11) NOT NULL,
  `center` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `establishment` date NOT NULL,
  `Uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `company`
--

INSERT INTO `company` (`id`, `name`, `sector`, `employee_count`, `center`, `establishment`, `Uid`) VALUES
(2001, 'Stark Industry', 'Defense Industry', 650, 'New York', '1995-05-16', 4001),
(2002, 'Aselsan', 'Defense Industry', 670, 'Ankara', '1975-01-01', 4002),
(2003, 'Nissan Türkiye', 'Otomotive', 253, 'Kocaeli', '2017-06-12', 4003),
(2004, 'Samsung ', 'Technology', 953, 'Seul', '1938-03-01', 4004),
(2005, 'Arçelik', 'Technology', 1253, 'İstanbul', '1955-01-01', 4005),
(2006, 'Vestel ', 'Technology', 652, 'Manisa', '1984-03-08', 4006),
(2007, 'Folkart', 'Construction', 3000, 'İzmir', '2012-08-20', 4007),
(2008, 'Arkas Holding', 'Shipping/Trucking/rail', 9500, 'İzmir', '1902-10-19', 4008),
(2009, 'Kipaş Holding', 'Textile', 6000, 'Kahramanmaraş', '1984-10-15', 4009),
(2010, 'Hatay Medeniyetler Sofrası', 'Food/Restaurant', 320, 'Hatay', '2000-02-14', 4010),
(2011, 'Acun Medya', 'Media Publishing', 320, 'İstanbul', '2005-10-23', 4011),
(2012, 'Bursa Beton Sanayi ve Ticaret A.Ş.', 'Construction', 650, 'Bursa', '1986-12-02', 4012),
(2013, 'Datahan Bilişim', 'Software', 20, 'İzmir', '2015-03-05', 4013),
(2014, 'GMC', 'Otomotive', 9000, 'Detroit', '1911-01-03', 4014),
(2015, 'Türk Hava Yolları', 'Aviation', 2000, 'İstanbul', '1980-02-03', 4015),
(2016, 'Netflix', 'Entertainment', 250, 'Scoots Valley', '1997-02-27', 4016);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `connection`
--

CREATE TABLE `connection` (
  `mem_id1` int(11) NOT NULL,
  `mem_id2` int(11) NOT NULL
) ;

--
-- Tablo döküm verisi `connection`
--

INSERT INTO `connection` (`mem_id1`, `mem_id2`) VALUES
(1001, 1002),
(1001, 1004),
(1001, 1005),
(1001, 1006),
(1001, 1007),
(1001, 1008),
(1001, 1009),
(1001, 1010),
(1001, 1011),
(1001, 1012),
(1001, 1013),
(1001, 1014),
(1001, 1015),
(1001, 1016),
(1001, 1017),
(1001, 1018),
(1001, 1019),
(1001, 1020),
(1001, 1021),
(1002, 1003),
(1002, 1004),
(1002, 1005),
(1002, 1006),
(1003, 1010),
(1003, 1012),
(1003, 1015),
(1003, 1020),
(1004, 1005),
(1004, 1011),
(1004, 1018),
(1004, 1019),
(1005, 1002),
(1005, 1020),
(1006, 1003),
(1006, 1008),
(1007, 1010),
(1007, 1019),
(1007, 1021);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

CREATE TABLE `courses` (
  `course_code` varchar(50) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `term` varchar(50) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`course_code`, `lecturer_id`, `course_name`, `term`, `year`) VALUES
('ALGO1_2', 1001, 'Algorithm and Programming 1', 'Autumn', 2003),
('ALGO2_1', 1026, 'Algorithm and Programming 2', 'Spring', 2002),
('CL_1', 1027, 'Commercial Law', 'Spring', 2003),
('DBMS_1', 1001, 'Database Management', 'Autumn', 2002),
('DBMS_2', 1001, 'Database Management', 'Autumn', 2003),
('RD_1', 1026, 'Road Design', 'Autumn', 2004);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `enroll`
--

CREATE TABLE `enroll` (
  `course_code` varchar(50) NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `enroll`
--

INSERT INTO `enroll` (`course_code`, `mem_id`) VALUES
('ALGO1_2', 1002),
('ALGO2_1', 1002),
('CL_1', 1021),
('DBMS_1', 1002),
('RD_1', 1008),
('RD_1', 1023);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `experience`
--

CREATE TABLE `experience` (
  `mem_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `position` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ;

--
-- Tablo döküm verisi `experience`
--

INSERT INTO `experience` (`mem_id`, `com_id`, `start_date`, `end_date`, `position`) VALUES
(1002, 2002, '2005-10-12', '2009-05-13', 'Computer Engineer'),
(1002, 2006, '2010-05-10', '2010-10-12', 'Test Engineer'),
(1003, 2016, '2006-10-12', '2009-11-20', 'Software Developer'),
(1004, 2008, '2003-10-12', '2009-11-20', 'Software Engineer'),
(1009, 2013, '2016-10-12', '2018-10-22', 'Web Developer'),
(1010, 2005, '2008-10-12', '2010-05-03', 'Electronic Engineer');

--
-- Tetikleyiciler `experience`
--
DELIMITER $$
CREATE TRIGGER `before_experience_enddate` BEFORE INSERT ON `experience` FOR EACH ROW BEGIN
 IF New.end_date>CURRENT_TIMESTAMP
 THEN
 	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deneyimlerde bitiş tarihi şuandan büyük olamaz';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `follow`
--

CREATE TABLE `follow` (
  `member_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `follow`
--

INSERT INTO `follow` (`member_id`, `company_id`) VALUES
(1001, 2002),
(1003, 2015),
(1004, 2008),
(1004, 2015),
(1013, 2013),
(1016, 2003),
(1016, 2010),
(1016, 2015),
(1019, 2016),
(1021, 2011),
(1023, 2014),
(1024, 2009),
(1025, 2011),
(1027, 2001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `graduation`
--

CREATE TABLE `graduation` (
  `mem_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `graduate_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `graduation`
--

INSERT INTO `graduation` (`mem_id`, `school_id`, `graduate_date`) VALUES
(1001, 1, '1991-07-13'),
(1002, 1, '2005-08-10'),
(1004, 1, '2001-07-10'),
(1005, 4, '2001-07-13'),
(1006, 3, '2006-07-13'),
(1007, 6, '2000-08-15'),
(1008, 2, '2000-08-10'),
(1009, 1, '2003-07-10'),
(1010, 9, '1998-07-12'),
(1011, 2, NULL),
(1012, 7, '2000-03-10'),
(1013, 8, '2001-07-10'),
(1015, 6, '1996-07-10'),
(1017, 1, '0000-00-00'),
(1019, 1, '2003-08-12'),
(1020, 6, '1996-07-10'),
(1021, 4, '2005-07-12'),
(1022, 6, '1995-07-08'),
(1023, 2, '1993-07-12');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `group`
--

CREATE TABLE `group` (
  `grup_id` int(11) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `member_count` int(11) NOT NULL
) ;

--
-- Tablo döküm verisi `group`
--

INSERT INTO `group` (`grup_id`, `creater_id`, `group_name`, `description`, `member_count`) VALUES
(1, 1022, 'Apple Lovers', 'Bu grup apple sevenler için oluşturulmuştur...', 5),
(2, 1025, 'Masterchef', 'Bu sene de yine zımba gibi aşçılarla yarışmaya hazırız!!', 10),
(3, 1001, 'Database Dersi Alanlar', 'Proje kontrol tarihleri ektedir...', 8),
(4, 1014, 'Avengers', 'Uzayda daha kurtarılacak Milyonlarca gezegen var.', 6),
(5, 1015, 'Mafia', 'La famiglia viene prima di tutto.', 3),
(6, 1023, 'Windows Sevenler', 'Windows kullananları bekliyoruz...', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_certi̇fi̇cate`
--

CREATE TABLE `has_certi̇fi̇cate` (
  `mem_id` int(11) NOT NULL,
  `certificate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `has_certi̇fi̇cate`
--

INSERT INTO `has_certi̇fi̇cate` (`mem_id`, `certificate_id`) VALUES
(1003, 5),
(1007, 2),
(1007, 4),
(1011, 2),
(1011, 3),
(1017, 5),
(1017, 6),
(1021, 2),
(1023, 3),
(1023, 4),
(1024, 1),
(1024, 5),
(1025, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_interest`
--

CREATE TABLE `has_interest` (
  `mem_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `has_interest`
--

INSERT INTO `has_interest` (`mem_id`, `interest_id`) VALUES
(1002, 1),
(1002, 5),
(1003, 1),
(1003, 4),
(1004, 2),
(1013, 5),
(1014, 4),
(1015, 1),
(1015, 4),
(1023, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `interest`
--

CREATE TABLE `interest` (
  `int_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `interest`
--

INSERT INTO `interest` (`int_id`, `name`) VALUES
(1, 'Artificial Intelligence'),
(2, 'Civil Engineering'),
(3, 'Image Processing'),
(4, 'Cyber Security'),
(5, 'Otomotive');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `look`
--

CREATE TABLE `look` (
  `mem_id` int(11) NOT NULL,
  `adv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `look`
--

INSERT INTO `look` (`mem_id`, `adv_id`) VALUES
(1025, 4),
(1025, 2),
(1014, 4),
(1009, 2),
(1016, 3),
(1006, 5),
(1007, 3),
(1022, 3),
(1011, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `media_type`
--

CREATE TABLE `media_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `media_type`
--

INSERT INTO `media_type` (`id`, `name`) VALUES
(1, 'Document'),
(2, 'Video'),
(3, 'Photo'),
(4, 'Audio'),
(5, 'Text');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mediia`
--

CREATE TABLE `mediia` (
  `type_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `mediia`
--

INSERT INTO `mediia` (`type_id`, `post_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(1, 12),
(1, 13),
(1, 17),
(2, 3),
(2, 4),
(2, 9),
(2, 10),
(2, 11),
(2, 16),
(3, 5),
(3, 8),
(3, 15),
(4, 14),
(5, 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `Fname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Lname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Phone` bigint(15) DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Sex` varchar(1) COLLATE utf8_turkish_ci NOT NULL,
  `City` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Job` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `connection_count` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `member`
--

INSERT INTO `member` (`id`, `Fname`, `Lname`, `Phone`, `Email`, `Sex`, `City`, `Job`, `Password`, `connection_count`, `uid`) VALUES
(1001, 'Murat Osman', 'Ünalır', 5325843535, 'unalir@gmail.com', 'M', 'İzmir', 'Lecturer', '1D2B3c4a.', 9999, 3001),
(1002, 'İrfan', 'Türkmen', 5534633329, 'irfantrkmn@icloud.com', 'M', 'Kahramanmaraş', 'Computer Engineer', '1234abcd.,', 123, 3002),
(1003, 'Cenk', 'Göktay', 5554236589, 'cenkgoktay@gmail.com', 'M', 'Ankara', 'Student', 'cng2631.', 446, 3003),
(1004, 'Ümmet', 'Duran', 5682225698, 'ummetduran@outlook.com', 'M', 'İzmir', 'Software Engineer', '548wadas562', 741, 3004),
(1005, 'Buket', 'Yavnık', NULL, 'mizrak@yahoo.com', 'F', 'İstanbul', 'Lawyer', 'asdfe32421a', 521, 3005),
(1006, 'Metehan', 'Özarslan', 5486232214, 'metehanozarslan@yandex.com', 'M', 'İstanbul', 'Flight Engineer', '548aw21sc.', 522, 3006),
(1007, 'Ayça', 'Duran', 5622235485, 'ayca22@hotmail.com', 'F', 'Bursa', 'Manager', 'ayca23sf2', 842, 3007),
(1008, 'Selin', 'Köprülü', 5612258563, 'selinkoprulu@yahoo.com', 'M', 'Bursa', 'Civil Enginner', '21432asdf', 98, 3008),
(1009, 'Serdar ', 'Zeybek', 5423212526, 'serdarzeybek@outlook.com', 'M', 'Manisa', 'Web Developer', '4551256+', 231, 3009),
(1010, 'Zihni', 'Yavnık', NULL, 'zihniyavnik45@hotmail.com', 'M', 'Manisa', 'Electrical Engineer', '5452112asdasw', 256, 3010),
(1011, 'Buse', 'Arısoy', 5623332589, 'busearisoy44@icloud.com', 'F', 'Ankara', 'Lecturer', '21acv3523a', 952, 3011),
(1012, 'Yağmur', 'Arıkan', 5486232215, '12yagmur@gmail.com', 'F', 'İstanbul', 'Human Resources', 'asf21wa2', 224, 3012),
(1013, 'Scarlett', 'Johansson', 1500032646, 'scarjohan@outlook.com', 'F', 'Detroit', 'Otomotive Engineer', 'asd21dasf', 962, 3013),
(1014, 'Tony ', 'Stark', NULL, 'tonystark@gmail.com', 'M', 'New York', 'Ironman', 'asdas124asfv..', 9998, 3014),
(1015, 'Vito', 'Corleone', NULL, 'vitocorleone', 'M', 'Ankara', 'Test Engineer', 'thegod.,', 9997, 3015),
(1016, 'Fatma', 'Kızgın', 5532456985, 'fatma.kizgin@hotmail.com', 'F', 'Hatay', 'Chef', '124ras1', 12, 3016),
(1017, 'Ali', 'Kızgın', NULL, 'alikizgin@icloud.com', 'M', 'İzmir', 'Web Developer', 'asd12ed', 126, 3017),
(1018, 'Mustafa', 'Turan', 5562265489, 'mustafaturan@gmail.com', 'M', 'İstanbul', 'Lecturer', 'asd219asfsd', 124, 3018),
(1019, 'Metehan', 'Göktay', 5562365482, 'metaasfsdj@gmail.com', 'M', 'İzmir', 'Web Developer', 'asd21asd', 563, 3019),
(1020, 'Remzi', 'Kurnaz', 5563258996, 'remzikurnaz@hotmail.com', 'M', 'Ankara', 'Software Engineer', 'asd123ac', 334, 3020),
(1021, 'Ahsen', 'Zeybek', 5563256985, 'zeybekahsen@icloud.com', 'F', 'İstanbul', 'Lawyer', 'asd1234qa', 665, 3021),
(1022, 'Steve ', 'Jobs', 1564785523, 'stevejobs@icloud.com', 'M', 'Seul', 'Android Developer', 'iMac2019.,', 895, 3022),
(1023, 'Bill ', 'Gates', 5562685532, 'billgates@icloud.com', 'M', 'İzmir', 'Civil Engineer', 'windowsXP95', 996, 3023),
(1024, 'Nigar', 'Muharrem', 4956842635, 'muharremnigar@yahoo.com', 'F', 'San Fransisco', 'Movie Director', 'asd212das', 885, 3024),
(1025, 'Acun ', 'Ilıcalı', NULL, 'acunmedya@gmail.com', 'M', 'İstanbul', 'CEO', 'asd213a', 235, 3025),
(1026, 'Ahmet', 'Turan', NULL, 'ahmetturan@gmail.com', 'M', 'İzmir', 'Lecturer', 'dasd2123asd', 124, 3026),
(1027, 'Selim', 'Yıldırım', 5563265489, 'selmyildirim@gmail.com', 'M', 'Bursa', 'Lecturer', '123asf', 124, 3027);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `member_of`
--

CREATE TABLE `member_of` (
  `group_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `member_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `message`
--

INSERT INTO `message` (`message_id`, `sender_id`, `type_id`, `date`, `content`) VALUES
(1, 1003, 5, '2020-01-01', 'Selam :D'),
(2, 1022, 5, '2019-12-31', 'Happy New Year Bro'),
(3, 1023, 5, '2020-01-01', 'Thanks bro, where are You? Send Photo please.'),
(4, 1002, 5, '2020-01-02', 'Hocam kaldım mı?'),
(5, 1002, 3, '2020-01-02', ''),
(6, 1004, 2, '2020-01-03', 'Hayırlı cumalar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8_turkish_ci NOT NULL,
  `like_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `content`, `like_count`, `comment_count`) VALUES
(1, 3002, 'Dosya1', 23, 1),
(2, 3002, 'PDF1', 10, 2),
(3, 3003, 'video1', 22, 1),
(4, 3004, 'video2', 10, 2),
(5, 3011, 'fotoğraf1', 5, 1),
(6, 3003, 'dosya2', 6, 3),
(7, 3008, 'text1', 20, 3),
(8, 3005, 'fotoğraf2', 5, 1),
(9, 3011, 'video2', 21, 2),
(10, 3006, 'video3', 5, 3),
(11, 3008, 'video3', 12, 3),
(12, 3012, 'dosya3', 21, 1),
(13, 3011, 'dosya4', 22, 2),
(14, 3008, 'ses1', 21, 3),
(15, 3008, 'fotoğraf3', 2, 0),
(16, 3002, 'video4', 5, 1),
(17, 3010, 'dosya5', 6, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post_like`
--

CREATE TABLE `post_like` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `post_like`
--

INSERT INTO `post_like` (`user_id`, `post_id`) VALUES
(3001, 1),
(3001, 2),
(3001, 4),
(3001, 6),
(3001, 12),
(3002, 1),
(3002, 2),
(3002, 4),
(3002, 12),
(3002, 14),
(3003, 1),
(3003, 2),
(3003, 3),
(3003, 4),
(3003, 6),
(3003, 7),
(3003, 8),
(3003, 9),
(3003, 10),
(3003, 12),
(3003, 13),
(3003, 14),
(3003, 17),
(3004, 1),
(3004, 2),
(3004, 6),
(3004, 9),
(3004, 12),
(3004, 16),
(3005, 1),
(3005, 2),
(3005, 3),
(3005, 6),
(3005, 12),
(3006, 1),
(3006, 2),
(3006, 4),
(3006, 6),
(3006, 12),
(3007, 1),
(3007, 2),
(3007, 4),
(3007, 6),
(3007, 12),
(3008, 1),
(3008, 2),
(3008, 6),
(3008, 12),
(3009, 1),
(3009, 2),
(3009, 6),
(3009, 12),
(3009, 15),
(3010, 1),
(3010, 2),
(3010, 6),
(3010, 12),
(3011, 1),
(3011, 3),
(3012, 1),
(3012, 3),
(3013, 3),
(3014, 3),
(3015, 3),
(3016, 3),
(3017, 3),
(3018, 3),
(3019, 3),
(3020, 3),
(3021, 3),
(3022, 3),
(3024, 3),
(4001, 1),
(4001, 4),
(4002, 1),
(4003, 1),
(4003, 4),
(4004, 1),
(4005, 1),
(4006, 1),
(4007, 1),
(4008, 1),
(4009, 1),
(4010, 1),
(4010, 3),
(4010, 4),
(4011, 1),
(4011, 3),
(4011, 4),
(4012, 3),
(4013, 3),
(4014, 3),
(4015, 3),
(4015, 4),
(4016, 3);

--
-- Tetikleyiciler `post_like`
--
DELIMITER $$
CREATE TRIGGER `after_insert_post_like` AFTER INSERT ON `post_like` FOR EACH ROW BEGIN
	UPDATE post
    SET like_count = like_count + 1 WHERE post_id = New.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `receive`
--

CREATE TABLE `receive` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `receive`
--

INSERT INTO `receive` (`id`, `message_id`) VALUES
(1001, 4),
(1002, 6),
(1008, 1),
(1009, 2),
(1014, 5),
(1022, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `school`
--

CREATE TABLE `school` (
  `educ_id` int(11) NOT NULL,
  `school_name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `department` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `school`
--

INSERT INTO `school` (`educ_id`, `school_name`, `department`) VALUES
(1, 'Ege University', 'Computer Engineering'),
(2, 'Ege University', 'Civil Engineering'),
(3, 'İstanbul Technical University', 'Flight Engineering'),
(4, 'Uludağ University', 'Law'),
(5, 'MIT', 'Computer Science'),
(6, 'Stanford University', 'Economy'),
(7, 'Eskişehir Anatolian University', 'Public Relations'),
(8, 'Kocaeli University', 'Otomotive Engineering'),
(9, 'Boğaziçi University', 'Electrical Electronics Engineering');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `share`
--

CREATE TABLE `share` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `share`
--

INSERT INTO `share` (`user_id`, `post_id`) VALUES
(3002, 3),
(3002, 7),
(3004, 4),
(3008, 2),
(3010, 11),
(3021, 15),
(3024, 13),
(4003, 5),
(4004, 2),
(4008, 3),
(4010, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `skill`
--

CREATE TABLE `skill` (
  `mem_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `skill`
--

INSERT INTO `skill` (`mem_id`, `skill_id`) VALUES
(1002, 1),
(1002, 2),
(1002, 4),
(1002, 11),
(1003, 9),
(1003, 11),
(1003, 12),
(1003, 34),
(1004, 2),
(1004, 7),
(1004, 10),
(1004, 11),
(1004, 39),
(1005, 34),
(1005, 35),
(1005, 36),
(1005, 40),
(1006, 31),
(1006, 32),
(1006, 37),
(1006, 38),
(1007, 22),
(1007, 25),
(1007, 33),
(1007, 40),
(1008, 16),
(1008, 17),
(1008, 18),
(1008, 28),
(1008, 31),
(1009, 3),
(1009, 11),
(1009, 14),
(1009, 15),
(1010, 1),
(1010, 29),
(1010, 30),
(1010, 33),
(1012, 25),
(1012, 34),
(1012, 40),
(1013, 12),
(1013, 34),
(1013, 37),
(1013, 38),
(1015, 1),
(1017, 5),
(1017, 14),
(1017, 15),
(1018, 3),
(1018, 7),
(1019, 15),
(1020, 3),
(1020, 9),
(1020, 11),
(1021, 35),
(1021, 36),
(1022, 3),
(1022, 12),
(1023, 18),
(1023, 26),
(1023, 28),
(1023, 39),
(1024, 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`) VALUES
(1, 'Python'),
(2, 'Java'),
(3, 'C#'),
(4, 'SQL'),
(5, 'Javascript'),
(6, 'OOP'),
(7, 'Image Processing'),
(8, 'Visual Studio'),
(9, 'C++'),
(10, 'C'),
(11, 'DBMS'),
(12, 'Android Studio'),
(13, 'Swift'),
(14, 'PHP'),
(15, 'HTML'),
(16, 'Earthwork Design'),
(17, 'Drainage Desig'),
(18, 'Storm Management'),
(20, 'Roads Design'),
(21, 'Flood Plain'),
(22, 'Quality Control'),
(23, 'Math'),
(24, 'Hardware'),
(25, 'Teamwork'),
(26, 'Engineering'),
(27, 'Defense'),
(28, 'Design'),
(29, 'Circuit Design'),
(30, 'Embeded Card Design'),
(31, 'Production Planning'),
(32, 'Plane Engine'),
(33, 'Integration'),
(34, 'Time Management'),
(35, 'Commercial Law'),
(36, 'Law'),
(37, 'Engine'),
(38, 'Aerodynamic'),
(39, 'Matlab'),
(40, 'Leadership'),
(41, 'Interior Design');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`user_id`) VALUES
(3001),
(3002),
(3003),
(3004),
(3005),
(3006),
(3007),
(3008),
(3009),
(3010),
(3011),
(3012),
(3013),
(3014),
(3015),
(3016),
(3017),
(3018),
(3019),
(3020),
(3021),
(3022),
(3023),
(3024),
(3025),
(4001),
(4002),
(4003),
(4004),
(4005),
(4006),
(4007),
(4008),
(4009),
(4010),
(4011),
(4012),
(4013),
(4014),
(4015),
(4016);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `works_on`
--

CREATE TABLE `works_on` (
  `mem_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `works_on`
--

INSERT INTO `works_on` (`mem_id`, `company_id`, `position`, `start_date`) VALUES
(1002, 2009, 'Computer Engineer', '2019-12-17'),
(1004, 2008, 'Software Engineer', '2019-09-10'),
(1005, 2015, 'Lawyer', '2017-05-20'),
(1006, 2015, 'Flight Engineer', '2015-10-11'),
(1007, 2012, 'Manager', '2016-10-12'),
(1008, 2012, 'Civil Engineer', '2014-12-01'),
(1009, 2006, 'Web Developer', '2019-12-05'),
(1010, 2006, 'Electrical Engineer', '2019-12-10'),
(1012, 2005, 'Human Resources', '2013-05-12'),
(1013, 2014, 'Otomotive Engineer', '2016-12-10'),
(1014, 2001, 'Ironman', '2008-10-10'),
(1015, 2002, 'Test Engineer', '2019-04-09'),
(1016, 2010, 'Chef', '2010-10-05'),
(1017, 2013, 'Web Developer', '2012-03-21'),
(1019, 2013, 'Web Developer', '2012-03-22'),
(1020, 2002, 'Software Engineer', '2016-03-15'),
(1021, 2005, 'Lawyer', '2012-11-03'),
(1022, 2004, 'Android Developer', '2019-11-28'),
(1023, 2007, 'Civil Engineer', '2019-12-12'),
(1024, 2016, 'Director', '2012-10-26'),
(1025, 2011, 'CEO', '2005-10-23');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`,`com_id`),
  ADD UNIQUE KEY `com_id` (`com_id`);

--
-- Tablo için indeksler `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `commnt_postid` (`post_id`),
  ADD KEY `cmmnt_userid` (`user_id`);

--
-- Tablo için indeksler `comment_li̇ke`
--
ALTER TABLE `comment_li̇ke`
  ADD PRIMARY KEY (`user_id`,`comment_id`),
  ADD KEY `commentid` (`comment_id`);

--
-- Tablo için indeksler `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_to_user` (`Uid`);

--
-- Tablo için indeksler `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`mem_id1`,`mem_id2`),
  ADD KEY `mem_id2` (`mem_id2`);

--
-- Tablo için indeksler `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_code`,`lecturer_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Tablo için indeksler `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`course_code`,`mem_id`),
  ADD KEY `memid_enroll` (`mem_id`);

--
-- Tablo için indeksler `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`mem_id`,`com_id`,`position`),
  ADD KEY `experience_com_id` (`com_id`);

--
-- Tablo için indeksler `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`member_id`,`company_id`),
  ADD KEY `Fmember_to_Mmember` (`member_id`),
  ADD KEY `Fcompany_to_Ccompany` (`company_id`);

--
-- Tablo için indeksler `graduation`
--
ALTER TABLE `graduation`
  ADD PRIMARY KEY (`mem_id`,`school_id`),
  ADD KEY `educ_id` (`school_id`);

--
-- Tablo için indeksler `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`grup_id`),
  ADD UNIQUE KEY `creater_id` (`creater_id`);

--
-- Tablo için indeksler `has_certi̇fi̇cate`
--
ALTER TABLE `has_certi̇fi̇cate`
  ADD PRIMARY KEY (`mem_id`,`certificate_id`),
  ADD KEY `certificate_id` (`certificate_id`);

--
-- Tablo için indeksler `has_interest`
--
ALTER TABLE `has_interest`
  ADD PRIMARY KEY (`mem_id`,`interest_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Tablo için indeksler `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`int_id`);

--
-- Tablo için indeksler `look`
--
ALTER TABLE `look`
  ADD KEY `look_member_id` (`mem_id`),
  ADD KEY `look_adv_id` (`adv_id`);

--
-- Tablo için indeksler `media_type`
--
ALTER TABLE `media_type`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `mediia`
--
ALTER TABLE `mediia`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `foreign_type` (`type_id`);

--
-- Tablo için indeksler `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_to_user` (`uid`);

--
-- Tablo için indeksler `member_of`
--
ALTER TABLE `member_of`
  ADD PRIMARY KEY (`group_id`,`mem_id`),
  ADD KEY `group_member_id` (`mem_id`);

--
-- Tablo için indeksler `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `frgn_sender` (`sender_id`),
  ADD KEY `frgn_type` (`type_id`);

--
-- Tablo için indeksler `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_user_id` (`user_id`);

--
-- Tablo için indeksler `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `postlike_postid` (`post_id`);

--
-- Tablo için indeksler `receive`
--
ALTER TABLE `receive`
  ADD PRIMARY KEY (`id`,`message_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `message_id` (`message_id`);

--
-- Tablo için indeksler `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`educ_id`);

--
-- Tablo için indeksler `share`
--
ALTER TABLE `share`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `shar_post_id` (`post_id`);

--
-- Tablo için indeksler `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`mem_id`,`skill_id`),
  ADD KEY `skill_skillsid` (`skill_id`);

--
-- Tablo için indeksler `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Tablo için indeksler `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`mem_id`,`company_id`),
  ADD KEY `comp_id` (`company_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Tablo için AUTO_INCREMENT değeri `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `comid` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `cmmnt_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commnt_postid` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `comment_li̇ke`
--
ALTER TABLE `comment_li̇ke`
  ADD CONSTRAINT `commentid` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userrid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_to_user` FOREIGN KEY (`Uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `memid_1` FOREIGN KEY (`mem_id1`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memid_2` FOREIGN KEY (`mem_id2`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memid_enroll` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_com_id` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `experience_mem_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `Fcompany_to_Ccompany` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fmember_to_Mmember` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `graduation`
--
ALTER TABLE `graduation`
  ADD CONSTRAINT `graduation_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `graduation_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`educ_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`creater_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `has_certi̇fi̇cate`
--
ALTER TABLE `has_certi̇fi̇cate`
  ADD CONSTRAINT `has_certi̇fi̇cate_ibfk_1` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `has_certi̇fi̇cate_ibfk_2` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `has_interest`
--
ALTER TABLE `has_interest`
  ADD CONSTRAINT `has_interest_ibfk_1` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`int_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `has_interest_ibfk_2` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `look`
--
ALTER TABLE `look`
  ADD CONSTRAINT `look_adv_id` FOREIGN KEY (`adv_id`) REFERENCES `advertisement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `look_member_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `mediia`
--
ALTER TABLE `mediia`
  ADD CONSTRAINT `foreign_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_type` FOREIGN KEY (`type_id`) REFERENCES `media_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `member_of`
--
ALTER TABLE `member_of`
  ADD CONSTRAINT `group_member_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_of_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`grup_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `frgn_sender` FOREIGN KEY (`sender_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frgn_type` FOREIGN KEY (`type_id`) REFERENCES `media_type` (`id`);

--
-- Tablo kısıtlamaları `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `foreign_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `receive`
--
ALTER TABLE `receive`
  ADD CONSTRAINT `receive_ibfk_1` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `receive_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
