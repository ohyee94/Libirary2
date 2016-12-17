-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2016 at 12:15 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `utube`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitystream`
--

CREATE TABLE IF NOT EXISTS `activitystream` (
  `activity_stream_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `activity_type` varchar(250) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`activity_stream_id`,`user_id`,`video_id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activitystream`
--

INSERT INTO `activitystream` (`activity_stream_id`, `user_id`, `video_id`, `activity_type`, `date`) VALUES
(1, 1, 2, 'Author', '2016-12-16'),
(2, 1, 3, 'comment', '2016-12-16'),
(3, 1, 4, 'comment', '2016-12-16'),
(4, 2, 1, 'comment', '2016-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `user_id`, `video_id`, `content`, `date`) VALUES
(1, 1, 2, 'This video is such!!!!!!!!!!', '2016-12-15'),
(2, 1, 2, 'This video is such!!!!!!!!!!', '2016-12-15'),
(3, 2, 2, 'HAHAHAHAHA', '2016-12-20'),
(4, 2, 1, 'kkkkkkkkkkkkkkk', '2016-12-09'),
(5, 2, 1, 'boring', '2016-12-09'),
(6, 3, 3, 'sad', '2016-12-09'),
(7, 4, 1, 'anrgy', '2016-12-09'),
(8, 2, 3, 'love', '2016-12-09'),
(9, 2, 1, 'hate', '2016-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `mail` varchar(250) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `mail`) VALUES
(1, 'Tam', 'tam@gmail.com'),
(2, 'Tan', 'tan@gmail.com'),
(3, 'Vu', 'vu@gmail.com'),
(4, 'Hao', 'hao@gmail.com'),
(5, 'Tuan', 'tuan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `video_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date_creation` date NOT NULL,
  `video_type` varchar(250) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `title`, `date_creation`, `video_type`, `author_id`) VALUES
(1, 'Best Action Movie 1', '2016-12-16', 'SD', 1),
(2, 'Best Action Movie 2', '2016-12-16', 'SD', 2),
(3, 'Best Action Movie 3', '2016-12-16', 'HD', 1),
(4, 'Best Action Movie 4', '2016-12-16', 'HD', 2),
(5, 'Best Action Movie 5', '2016-12-16', 'HD', 1),
(6, 'Best Action Movie 6', '2016-12-16', 'SD', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activitystream`
--
ALTER TABLE `activitystream`
  ADD CONSTRAINT `activitystream_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`),
  ADD CONSTRAINT `activitystream_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`),
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
