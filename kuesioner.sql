-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kuesioner.criticism_and_suggestions
CREATE TABLE IF NOT EXISTS `criticism_and_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Kritik dan Saran';

-- Dumping data for table kuesioner.criticism_and_suggestions: ~2 rows (approximately)
/*!40000 ALTER TABLE `criticism_and_suggestions` DISABLE KEYS */;
INSERT INTO `criticism_and_suggestions` (`id`, `email`, `name`, `subject`, `message`) VALUES
	(1, 'lia@mail.com', 'lia', 'kebersihan', 'kebersihan perlu di tingkatkan lagi\r\n'),
	(2, 'fakhrifajar21@gmail.com', 'fakhri', 'ruangan', 'sound system ruangan belum menyala\r\n');
/*!40000 ALTER TABLE `criticism_and_suggestions` ENABLE KEYS */;

-- Dumping structure for table kuesioner.faculty
CREATE TABLE IF NOT EXISTS `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL COMMENT 'Nama Fakultas dalam bahasa English',
  `code` tinyint(4) NOT NULL,
  `dean` varchar(255) NOT NULL COMMENT 'Nama Dekan',
  `dean_nik` varchar(50) NOT NULL COMMENT 'NIK Dekan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Fakultas';

-- Dumping data for table kuesioner.faculty: ~6 rows (approximately)
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` (`id`, `name`, `name_en`, `code`, `dean`, `dean_nik`) VALUES
	(1, 'Fakultas Teknologi Informasi', 'Faculty of Information Technology', 4, 'DR. UMMI AZIZAH RACHMAWATI, M.KOM', '531141106017'),
	(2, 'Fakultas Kedokteran', 'medical School', 1, 'dr. Hj. Rika Yuliwulandari, M.Sc., PhD.', ''),
	(3, 'Fakultas Kedokteran Gigi', 'faculty of Dentistry', 0, 'Prof. Dr. Bambang S. Trenggono, drg. M. Biomed', ''),
	(5, 'Fakultas Ekonomi dan Bisnis', 'Faculty of Economics and Business', 2, 'Dr. Ir. Verni Yuliaty Ismail, MM, MSi.', ''),
	(6, 'Fakultas Hukum', 'Faculty of Law', 3, ' Dr. Ely Alawiyah Jufri, SH, MH.', ''),
	(7, 'Fakultas Psikologi', 'Faculty of Psychology', 5, 'Dr. Octaviani Indrasari Ranakusuma, M.Si., Psi', '');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;

-- Dumping structure for table kuesioner.global_options
CREATE TABLE IF NOT EXISTS `global_options` (
  `key` char(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuesioner.global_options: ~1 rows (approximately)
/*!40000 ALTER TABLE `global_options` DISABLE KEYS */;
INSERT INTO `global_options` (`key`, `value`) VALUES
	('petunjuk_pengisian', '1. Isilah kuesioner ini dengan memberi tanda centang di kolom pada jawaban yang disediakan.\r');
/*!40000 ALTER TABLE `global_options` ENABLE KEYS */;

-- Dumping structure for table kuesioner.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table kuesioner.groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator DPT'),
	(2, 'dpt', 'DPT'),
	(3, 'dosen', 'Dosen'),
	(4, 'mahasiswa', 'Mahasiswa');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for function kuesioner.json_extract_c
DELIMITER //
CREATE FUNCTION `json_extract_c`(`details` TEXT,
	`required_field` VARCHAR(255)
) RETURNS text CHARSET latin1
BEGIN
  DECLARE search_term TEXT;
  SET details = SUBSTRING_INDEX(details, "{", -1);
  SET details = SUBSTRING_INDEX(details, "}", 1);
  SET search_term = CONCAT('"', SUBSTRING_INDEX(required_field,'$.', - 1), '"');
  IF INSTR(details, search_term) > 0 THEN
    RETURN TRIM(
      BOTH '"' FROM SUBSTRING_INDEX(
        SUBSTRING_INDEX(
          SUBSTRING_INDEX(
            details,
            search_term,
            - 1
          ),
          ',"',
          1
        ),
        ':',
        -1
      )
    );
  ELSE
    RETURN NULL;
  END IF;
END//
DELIMITER ;

-- Dumping structure for table kuesioner.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table kuesioner.login_attempts: ~0 rows (approximately)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Dumping structure for table kuesioner.questionnaire_categories
CREATE TABLE IF NOT EXISTS `questionnaire_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Visitor','User Logged') NOT NULL,
  `category` varchar(150) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `target` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table kuesioner.questionnaire_categories: ~16 rows (approximately)
/*!40000 ALTER TABLE `questionnaire_categories` DISABLE KEYS */;
INSERT INTO `questionnaire_categories` (`id`, `type`, `category`, `order`, `status`, `target`) VALUES
	(1, 'Visitor', 'Pelayanan Administrasi', 1, 'Aktif', NULL),
	(2, 'Visitor', 'Lingkungan Universitas Yarsi', 2, 'Aktif', NULL),
	(3, 'Visitor', 'Auditorium Yarsi', 3, 'Aktif', NULL),
	(4, 'User Logged', 'Pelayanan Administrasi', 1, 'Aktif', '1,2'),
	(5, 'User Logged', 'Pelayanan Laboratorium', 2, 'Aktif', '1,2'),
	(6, 'User Logged', 'Pelayanan & Sarana - Ruang Kuliah', 3, 'Aktif', '1,2'),
	(7, 'User Logged', 'Pelayanan & Sarana - Toilet', 4, 'Aktif', '1,2'),
	(8, 'User Logged', 'Pelayanan & Sarana - Lingkungan Kampus', 5, 'Aktif', '1,2'),
	(9, 'User Logged', 'Pelayanan & Sarana - Perpustakaan', 6, 'Aktif', '1,2'),
	(11, 'User Logged', 'Khusus DOSEN', 1, 'Aktif', '1'),
	(12, 'User Logged', 'KHUSUS MAHASISWA', 2, 'Aktif', '2'),
	(13, 'User Logged', 'Tata kelola prasarana', 7, 'Aktif', '1,2'),
	(14, 'User Logged', 'Layanan Pengelolaan Fasilitas, ', 8, 'Aktif', '1,2'),
	(15, 'User Logged', 'Layanan Informasi mahasiswa', 9, 'Aktif', '2'),
	(16, 'User Logged', 'Layanan Operasional Akademik', 10, 'Aktif', '2'),
	(17, 'Visitor', 'Sarana  - Toilet', 4, 'Aktif', NULL);
/*!40000 ALTER TABLE `questionnaire_categories` ENABLE KEYS */;

-- Dumping structure for table kuesioner.questionnaire_questions
CREATE TABLE IF NOT EXISTS `questionnaire_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `is_parent` enum('Y','N') NOT NULL,
  `type_answer` enum('Y','N') DEFAULT NULL,
  `questionnaire_category_id` int(11) NOT NULL,
  `questions` text NOT NULL,
  `type_answers` varchar(50) NOT NULL,
  `answers` text NOT NULL,
  `required` enum('Y','N') NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 0,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`id`),
  KEY `questionnaire_category_id` (`questionnaire_category_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `FK_questionnaire_questions_questionnaire_categories` FOREIGN KEY (`questionnaire_category_id`) REFERENCES `questionnaire_categories` (`id`),
  CONSTRAINT `FK_questionnaire_questions_questionnaire_questions` FOREIGN KEY (`parent_id`) REFERENCES `questionnaire_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- Dumping data for table kuesioner.questionnaire_questions: ~85 rows (approximately)
/*!40000 ALTER TABLE `questionnaire_questions` DISABLE KEYS */;
INSERT INTO `questionnaire_questions` (`id`, `parent_id`, `is_parent`, `type_answer`, `questionnaire_category_id`, `questions`, `type_answers`, `answers`, `required`, `order`, `status`) VALUES
	(1, 92, 'Y', 'Y', 1, 'Bagaimana loket/tempat layanan administrasi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(2, 1, 'Y', 'Y', 1, 'Bagaimana sikap dan penampilan petugas administrasi terhadap Saudara?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(3, 92, 'Y', 'Y', 1, 'Bagaimana petugas administrasi dalam memberi informasi tentang perkuliahan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(4, 92, 'Y', 'Y', 1, 'Bagaimana petugas administrasi dalam memberi informasi tentang keuangan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(5, 92, 'Y', 'Y', 1, 'Bagaiman petugas administarasi dalam memberi informasi tentang sarana dan prasarana?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(6, 92, 'Y', 'Y', 1, 'Bagaimanan kesan saudara terhadap petugas administrasi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(7, NULL, 'N', NULL, 2, 'Bagaimana kebersihan & kenyamanan lingkungan kampus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(8, NULL, 'N', NULL, 2, 'Bagaimana ketersediaan tempat sampah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(9, NULL, 'N', NULL, 2, 'Bagaimana kondisi ruangan di  kampus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(10, NULL, 'N', NULL, 2, 'Bagaimana keamanan di lingkungan kampus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(11, 55, 'Y', 'Y', 3, 'Berapa kali dalam sebulan Saudara ke Auditorium yarsi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(12, 55, 'Y', 'Y', 3, 'Bagaimana ketersiadan kursi di auditorium?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(13, 55, 'Y', 'Y', 3, 'Bagaimana kebersihan di audotorium?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(14, 55, 'Y', 'Y', 3, 'Bagaimana perlengkapan sound system, OHP & infocus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(15, NULL, 'N', NULL, 4, 'Bagaimana loket/tempat layanan administrasi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(16, NULL, 'N', NULL, 4, 'Bagaimana sikap petugas administrasi terhadap Saudara?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(17, NULL, 'N', NULL, 4, 'Bagaimana penampilan petugas administrasi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(18, NULL, 'N', NULL, 4, 'Bagaimana respon petugas administrasi terhadap keluhan Saudara?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(19, NULL, 'N', NULL, 4, 'Bagaimana petugas administrasi dalam memberi informasi tentang perkuliahan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(20, NULL, 'N', NULL, 4, 'Bagaimana petugas administrasi dalam memberi informasi tentang keuangan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(21, NULL, 'N', NULL, 5, 'Bagaimana kebersihan ruang laboratorium?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(22, NULL, 'N', NULL, 5, 'Apakah jumlah kursi di laboratorium mencukupi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(23, NULL, 'N', NULL, 5, 'Apakah semua kursi di laboratorium dalam kondisi baik?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(24, NULL, 'N', NULL, 5, 'Apakah semua PC di laboratorium dapat dioperasikan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(25, NULL, 'N', NULL, 5, 'Apakah semua PC di laboratorium bebas dari virus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(26, NULL, 'N', NULL, 5, 'Apakah jaringan internet terkoneksi dengan baik', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(27, NULL, 'N', 'Y', 5, 'Apakah kondisi keyboard baik?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 7, 'Aktif'),
	(28, NULL, 'N', NULL, 5, 'Apakah kondisi mouse baik?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 8, 'Aktif'),
	(29, NULL, 'N', NULL, 6, 'Bagaimana penerangan di ruang kuliah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(30, NULL, 'N', NULL, 6, 'Bagaimana kondisi kursi / tempat duduk?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(31, NULL, 'N', NULL, 6, 'Bagaimana kondisi AC?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(32, NULL, 'N', NULL, 6, 'Bagaimana perlengkapan sound system, OHP & infocus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(33, NULL, 'N', NULL, 6, 'Bagaimana kebersihan di ruang kuliah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(34, NULL, 'N', NULL, 6, 'Bagaimana sistem kedap suara di ruang kuliah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(35, NULL, 'N', NULL, 7, 'Bagaimana penerangan di toilet?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(36, NULL, 'N', NULL, 7, 'Bagaimana kebersihan di toilet?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(37, NULL, 'N', NULL, 7, 'Bagaimana ketersediaan jumlah toilet yang ada saat ini?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(38, NULL, 'N', NULL, 8, 'Bagaimana kebersihan & kenyamanan lingkungan kampus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(39, NULL, 'N', NULL, 8, 'Bagaimana ketersediaan tempat sampah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(40, NULL, 'N', NULL, 8, 'Bagaimana ketersediaan tempat untuk duduk/diskusi?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(41, NULL, 'N', NULL, 8, 'Bagaimana keamanan di lingkungan kampus?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(42, NULL, 'Y', NULL, 9, 'Apakah Saudara pernah mengunjungi dan memanfaatkan perpustakaan?', 'option', '[{"order":"1","value":"1","label":"Ya (lanjut pada PERTANYAAN )"},{"order":"2","value":"2","label":"Tidak (langsung pada item e pertanyaan wifi dan intranet)"}]', 'Y', 1, 'Aktif'),
	(43, 42, 'Y', 'Y', 9, 'Apakah perpustakaan sudah membantu anda dalam menyelesaikan tugas perkuliahan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"4","value":"3","label":"3"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(44, 42, 'Y', 'Y', 9, 'Bagaimana ketersediaan buku referensi di perpustakaan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(45, 42, 'Y', 'Y', 9, 'Bagaimana pelayanan Pusnet di perpustakaan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(46, 42, 'Y', 'Y', 9, 'Bagaimana fasilitas kursi untuk baca?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(47, 42, 'Y', 'Y', 9, 'Bagaimana sistem pelayanan di perpustakaan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(55, NULL, 'Y', NULL, 3, 'Apakah saudara pernah mengunjungi auditorium Universitas Yarsi , kalo pernah silahkan isi ? kalo tidak maka silahkan submitt', 'option', '[{"order":"1","value":"1","label":"1 iya"},{"order":"2","value":"2","label":"2 tidak"}]', 'Y', 1, 'Aktif'),
	(56, 42, 'Y', 'N', 9, 'Bagaimana kecepatan wifi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(57, 42, 'Y', 'N', 9, 'Bagaimana kemudahan untuk download data dibawah 50 MB ? *', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(58, 42, 'Y', 'N', 9, 'Bagaimana kemudahan untuk akses intranet di Universitas Yarsi? *', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(59, 42, 'Y', 'N', 9, 'Bagaimana penggunan mail.Yarsi.ac.id apakah sudah memuaskan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(60, 42, 'Y', 'N', 9, 'Bagaimana penggunaan sisakad di yarsi apakah sudah memuaskan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(61, 42, 'Y', 'Y', 9, 'Bagaimana  penggunan  e-yarsi apakah sudah memuaskan    ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(62, 42, 'Y', 'Y', 9, 'Apakah ruang diskusi nyaman digunakan untuk diskusi tugas kuliah?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 7, 'Aktif'),
	(63, 42, 'Y', 'Y', 9, 'Bagaiaman kondisi Kebersihan di setiap ruangan  Perpustakaan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 8, 'Aktif'),
	(64, 42, 'Y', 'Y', 9, 'Apakah ketersediaan spidol dan penghapus di setiap ruangan sudah mencukupi', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 9, 'Aktif'),
	(65, 42, 'Y', 'Y', 9, 'Apakah PC yang tersedia cukup untuk memenuhi kebutuhan?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 10, 'Aktif'),
	(66, NULL, 'N', NULL, 13, 'Universitas Yarsi memiliki kebijakan / pedoman / prosedur untuk pengelolaan Pelayanan dan Sarana / Prasarana.', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'N', 1, 'Aktif'),
	(67, NULL, 'N', NULL, 13, 'Universitas Yarsi memiliki kebijakan / pedoman / prosedur untuk pengelolaan Pelayanan dan Sarana / Prasarana.', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'N', 2, 'Aktif'),
	(68, NULL, 'N', NULL, 13, 'Universitas Yarsi melaksanakan pengelolaan Pelayanan dan Sarana / Prasarana sesuai dengan kebijakan / pedoman / prosedur yang telah ditetapkan', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(69, NULL, 'N', NULL, 14, 'Bagaimana  penanganan pengguaan prasarana di Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(70, NULL, 'N', 'N', 14, 'Bagaimana  keamanan di Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(71, NULL, 'N', NULL, 14, 'Apakah sistem yang ada sekarang telah memudahkan dalam penggunaan ruangan  di Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(72, NULL, 'N', NULL, 14, 'Apakah petugas kebersihan di univeristas Yarsi sudah mencukupi   ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(73, NULL, 'N', NULL, 14, 'Bagaimana  kondisi tempat parkir di Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(74, NULL, 'N', NULL, 14, 'Apakah kendaran dan barang anda aman saat terparkir  di Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(75, NULL, 'N', NULL, 15, 'Bagaimana kemudahan dalam mendapatkan kartu tanda mahasiswa  ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(76, NULL, 'N', NULL, 15, 'Apakah sistem yang sudah ada dapat memudahkan mahasiswa dalam isi krs ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(77, NULL, 'N', NULL, 15, 'Apakah sistem yang sudah ada dapat menangani transaksi keungan yang error dengan baik ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(78, NULL, 'N', NULL, 15, 'Bagaimana publikasi akademik di universitas yarsi ? 1', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(79, NULL, 'N', NULL, 16, 'Bagaimana  Administrasi keungaan Universitas Yarsi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(80, NULL, 'N', NULL, 16, 'Bagaimana loket/tempat layanan administrasi ? *', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"4","value":"3","label":"4"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(81, NULL, 'N', NULL, 16, 'Bagaimana sikap  petugas administrasi terhadap Saudara ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(82, NULL, 'N', NULL, 16, 'Bagaimana penampilan petugas administrasi ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(83, NULL, 'N', NULL, 16, 'Bagaimana respon petugas administrasi terhadap keluhan Saudara ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 5, 'Aktif'),
	(84, NULL, 'N', NULL, 16, 'Bagaimana petugas administrasi dalam memberi informasi tentang perkuliahan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 6, 'Aktif'),
	(85, NULL, 'N', NULL, 16, 'Bagaimana petugas administrasi dalam memberi informasi tentang keuangan ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 7, 'Aktif'),
	(86, NULL, 'N', NULL, 16, 'Apakah sistem informasi pengolalan KRS dalam kondisi baik?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'N', 8, 'Aktif'),
	(87, NULL, 'N', NULL, 16, 'Apakah pengelolaan SPP-BPP di Universitas Yarsi sudah baik ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 9, 'Aktif'),
	(88, NULL, 'N', NULL, 17, 'Bagaimana penerangan di toilet ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 1, 'Aktif'),
	(89, NULL, 'N', NULL, 17, 'Bagaimana kebersihan di toilet ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 2, 'Aktif'),
	(90, NULL, 'N', NULL, 17, 'Bagaimana ketersediaan jumlah toilet yang ada saat ini ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 3, 'Aktif'),
	(91, NULL, 'N', NULL, 17, 'Apakah sabun, hand dryer, atau tisu tersedia di dalan toilet ?', 'option', '[{"order":"1","value":"1","label":"1"},{"order":"2","value":"2","label":"2"},{"order":"3","value":"3","label":"3"},{"order":"4","value":"4","label":"4"},{"order":"5","value":"5","label":"5"}]', 'Y', 4, 'Aktif'),
	(92, NULL, 'Y', NULL, 1, 'Apakah anda pernah berkunjung atau menggunakan layanan administrasi di Universitas Yarsi jika iya isilah pertanyaan bertikut ini jika tidak maka silahkan ke pertanyaan selanjutnya', 'option', '[{"order":"1","value":"1","label":"iya"},{"order":"2","value":"2","label":"tidak"}]', 'Y', 0, 'Aktif');
/*!40000 ALTER TABLE `questionnaire_questions` ENABLE KEYS */;

-- Dumping structure for table kuesioner.questionnaire_user_logged
CREATE TABLE IF NOT EXISTS `questionnaire_user_logged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) DEFAULT NULL,
  `faculty_id` int(11) NOT NULL,
  `study_program_id` int(11) NOT NULL,
  `pangkat_gol_dikti` varchar(50) NOT NULL,
  `jabatan_fungsional_dikti` varchar(50) NOT NULL,
  `sex` tinyint(4) NOT NULL COMMENT '1: Laki-laki, 2: Perempuan',
  `age` tinyint(120) NOT NULL,
  `length_of_working` tinyint(100) NOT NULL,
  `answers` text NOT NULL,
  `answers_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sutdy_program_id` (`study_program_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `faculty_id` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuesioner.questionnaire_user_logged: ~0 rows (approximately)
/*!40000 ALTER TABLE `questionnaire_user_logged` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_user_logged` ENABLE KEYS */;

-- Dumping structure for table kuesioner.questionnaire_visitors
CREATE TABLE IF NOT EXISTS `questionnaire_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor` varchar(50) NOT NULL,
  `sex` tinyint(4) NOT NULL COMMENT '1: Laki-laki, 2: Perempuan',
  `age` tinyint(150) NOT NULL COMMENT 'Umur',
  `necessity` varchar(250) NOT NULL COMMENT 'Keperluan di Yarsi',
  `answers` text NOT NULL COMMENT 'Jawaban setiap pertanyaan. Format JSON',
  `answers_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table kuesioner.questionnaire_visitors: ~3 rows (approximately)
/*!40000 ALTER TABLE `questionnaire_visitors` DISABLE KEYS */;
INSERT INTO `questionnaire_visitors` (`id`, `visitor`, `sex`, `age`, `necessity`, `answers`, `answers_value`, `created_at`) VALUES
	(1, 'Calon Mahasiswa', 1, 17, 'mendaftar mahasiswa baru', '{"cat_id-1-que_id-1":{"questions_raw":"{\\"id\\":\\"1\\",\\"parent_id\\":null,\\"is_parent\\":\\"Y\\",\\"type_answer\\":null,\\"category_id\\":\\"1\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana loket\\\\\\/tempat layanan administrasi?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"3"}}', '{"1":0,"2":0,"3":1,"4":0,"5":0}', '2020-06-21 23:44:49'),
	(2, 'Tamu Fakultas', 2, 21, 'memberi bantuan', '{"cat_id-1-que_id-1":{"questions_raw":"{\\"id\\":\\"1\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"1\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana loket\\\\\\/tempat layanan administrasi?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"2"},"cat_id-1-que_id-3":{"questions_raw":"{\\"id\\":\\"3\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":\\"Y\\",\\"category_id\\":\\"1\\",\\"order\\":\\"3\\",\\"questions\\":\\"Bagaimana petugas administrasi dalam memberi informasi tentang perkuliahan?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"4"},"cat_id-1-que_id-4":{"questions_raw":"{\\"id\\":\\"4\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":\\"Y\\",\\"category_id\\":\\"1\\",\\"order\\":\\"4\\",\\"questions\\":\\"Bagaimana petugas administrasi dalam memberi informasi tentang keuangan?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"5"},"cat_id-1-que_id-5":{"questions_raw":"{\\"id\\":\\"5\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":\\"Y\\",\\"category_id\\":\\"1\\",\\"order\\":\\"5\\",\\"questions\\":\\"Bagaiman petugas administarasi dalam memberi informasi tentang sarana dan prasarana?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"4"},"cat_id-1-que_id-6":{"questions_raw":"{\\"id\\":\\"6\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":\\"Y\\",\\"category_id\\":\\"1\\",\\"order\\":\\"6\\",\\"questions\\":\\"Bagaimanan kesan saudara terhadap petugas administrasi?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"4"},"cat_id-2-que_id-7":{"questions_raw":"{\\"id\\":\\"7\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana kebersihan & kenyamanan lingkungan kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"3"},"cat_id-2-que_id-8":{"questions_raw":"{\\"id\\":\\"8\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"2\\",\\"questions\\":\\"Bagaimana ketersediaan tempat sampah?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"5"},"cat_id-2-que_id-9":{"questions_raw":"{\\"id\\":\\"9\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"3\\",\\"questions\\":\\"Bagaimana kondisi ruangan di  kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"4"},"cat_id-2-que_id-10":{"questions_raw":"{\\"id\\":\\"10\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"4\\",\\"questions\\":\\"Bagaimana keamanan di lingkungan kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"3"},"cat_id-3-que_id-55":{"questions_raw":"{\\"id\\":\\"55\\",\\"parent_id\\":null,\\"is_parent\\":\\"Y\\",\\"type_answer\\":null,\\"category_id\\":\\"3\\",\\"order\\":\\"1\\",\\"questions\\":\\"Apakah saudara pernah mengunjungi auditorium Universitas Yarsi , kalo pernah silahkan isi ? kalo tidak maka silahkan submitt\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1 iya\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2 tidak\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Auditorium Yarsi\\"}","answer":"2"}}', '{"1":0,"2":2,"3":2,"4":4,"5":2}', '2020-06-22 00:52:45'),
	(3, 'Orang tua Mahasiswa', 1, 42, 'mendaftarkan anak', '{"cat_id-1-que_id-92":{"questions_raw":"{\\"id\\":\\"92\\",\\"parent_id\\":null,\\"is_parent\\":\\"Y\\",\\"type_answer\\":null,\\"category_id\\":\\"1\\",\\"order\\":\\"0\\",\\"questions\\":\\"Apakah anda pernah berkunjung atau menggunakan layanan administrasi di Universitas Yarsi jika iya isilah pertanyaan bertikut ini jika tidak maka silahkan ke pertanyaan selanjutnya\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"iya\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"tidak\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"1"},"cat_id-1-que_id-1":{"questions_raw":"{\\"id\\":\\"1\\",\\"parent_id\\":\\"92\\",\\"category_id\\":\\"1\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana loket\\/tempat layanan administrasi?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"1"},"cat_id-1-que_id-3":{"questions_raw":"{\\"id\\":\\"3\\",\\"parent_id\\":\\"92\\",\\"category_id\\":\\"1\\",\\"order\\":\\"3\\",\\"questions\\":\\"Bagaimana petugas administrasi dalam memberi informasi tentang perkuliahan?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"2"},"cat_id-1-que_id-4":{"questions_raw":"{\\"id\\":\\"4\\",\\"parent_id\\":\\"92\\",\\"category_id\\":\\"1\\",\\"order\\":\\"4\\",\\"questions\\":\\"Bagaimana petugas administrasi dalam memberi informasi tentang keuangan?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"1"},"cat_id-1-que_id-5":{"questions_raw":"{\\"id\\":\\"5\\",\\"parent_id\\":\\"92\\",\\"category_id\\":\\"1\\",\\"order\\":\\"5\\",\\"questions\\":\\"Bagaiman petugas administarasi dalam memberi informasi tentang sarana dan prasarana?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"3"},"cat_id-1-que_id-6":{"questions_raw":"{\\"id\\":\\"6\\",\\"parent_id\\":\\"92\\",\\"category_id\\":\\"1\\",\\"order\\":\\"6\\",\\"questions\\":\\"Bagaimanan kesan saudara terhadap petugas administrasi?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Pelayanan Administrasi\\"}","answer":"4"},"cat_id-2-que_id-7":{"questions_raw":"{\\"id\\":\\"7\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana kebersihan & kenyamanan lingkungan kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"1"},"cat_id-2-que_id-8":{"questions_raw":"{\\"id\\":\\"8\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"2\\",\\"questions\\":\\"Bagaimana ketersediaan tempat sampah?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"1"},"cat_id-2-que_id-9":{"questions_raw":"{\\"id\\":\\"9\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"3\\",\\"questions\\":\\"Bagaimana kondisi ruangan di  kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"2"},"cat_id-2-que_id-10":{"questions_raw":"{\\"id\\":\\"10\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"2\\",\\"order\\":\\"4\\",\\"questions\\":\\"Bagaimana keamanan di lingkungan kampus?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Lingkungan Universitas Yarsi\\"}","answer":"2"},"cat_id-3-que_id-55":{"questions_raw":"{\\"id\\":\\"55\\",\\"parent_id\\":null,\\"is_parent\\":\\"Y\\",\\"type_answer\\":null,\\"category_id\\":\\"3\\",\\"order\\":\\"1\\",\\"questions\\":\\"Apakah saudara pernah mengunjungi auditorium Universitas Yarsi , kalo pernah silahkan isi ? kalo tidak maka silahkan submitt\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1 iya\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2 tidak\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Auditorium Yarsi\\"}","answer":"2"},"cat_id-17-que_id-88":{"questions_raw":"{\\"id\\":\\"88\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"17\\",\\"order\\":\\"1\\",\\"questions\\":\\"Bagaimana penerangan di toilet ?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Sarana  - Toilet\\"}","answer":"1"},"cat_id-17-que_id-89":{"questions_raw":"{\\"id\\":\\"89\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"17\\",\\"order\\":\\"2\\",\\"questions\\":\\"Bagaimana kebersihan di toilet ?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Sarana  - Toilet\\"}","answer":"1"},"cat_id-17-que_id-90":{"questions_raw":"{\\"id\\":\\"90\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"17\\",\\"order\\":\\"3\\",\\"questions\\":\\"Bagaimana ketersediaan jumlah toilet yang ada saat ini ?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Sarana  - Toilet\\"}","answer":"1"},"cat_id-17-que_id-91":{"questions_raw":"{\\"id\\":\\"91\\",\\"parent_id\\":null,\\"is_parent\\":\\"N\\",\\"type_answer\\":null,\\"category_id\\":\\"17\\",\\"order\\":\\"4\\",\\"questions\\":\\"Apakah sabun, hand dryer, atau tisu tersedia di dalan toilet ?\\",\\"type_answers\\":\\"option\\",\\"answers\\":[{\\"order\\":\\"1\\",\\"value\\":\\"1\\",\\"label\\":\\"1\\"},{\\"order\\":\\"2\\",\\"value\\":\\"2\\",\\"label\\":\\"2\\"},{\\"order\\":\\"3\\",\\"value\\":\\"3\\",\\"label\\":\\"3\\"},{\\"order\\":\\"4\\",\\"value\\":\\"4\\",\\"label\\":\\"4\\"},{\\"order\\":\\"5\\",\\"value\\":\\"5\\",\\"label\\":\\"5\\"}],\\"required\\":\\"Y\\",\\"category_label\\":\\"Sarana  - Toilet\\"}","answer":"3"}}', '{"1":8,"2":4,"3":2,"4":1,"5":0}', '2020-06-24 01:43:53');
/*!40000 ALTER TABLE `questionnaire_visitors` ENABLE KEYS */;

-- Dumping structure for table kuesioner.study_programs
CREATE TABLE IF NOT EXISTS `study_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL DEFAULT 0,
  `name` varchar(45) NOT NULL,
  `initial` varchar(3) NOT NULL,
  `degree` varchar(50) NOT NULL COMMENT 'Gelar',
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_faculty_id` (`faculty_id`),
  CONSTRAINT `FK_study_programs_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='Program Studi';

-- Dumping data for table kuesioner.study_programs: ~10 rows (approximately)
/*!40000 ALTER TABLE `study_programs` DISABLE KEYS */;
INSERT INTO `study_programs` (`id`, `code`, `name`, `initial`, `degree`, `faculty_id`) VALUES
	(5, 55201, 'Teknik Informatika', 'TI', 'Sarjana Komputer (S. Kom)', 1),
	(6, 71201, 'Ilmu Perpustakaan', 'IP', 'Sarjana Ilmu Perpustakaan (S.I.Ptk.)', 1),
	(8, 11201, 'Pendidikan Dokter', 'PD', 'Sarjana Kedokteran (S.Ked.)', 2),
	(9, 11901, 'Profesi Dokter', 'FD', 'Sarjana Kedokteran (S.Ked.)', 2),
	(10, 12201, 'Pendidikan Dokter Gigi', 'PDG', 'Sarjana Kedokteran Gigi (S.K.G.)', 3),
	(11, 12901, 'Profesi Dokter Gigi', 'FDG', 'Sarjana Kedokteran Gigi (S.K.G.)', 3),
	(12, 62201, 'Akuntansi', 'AK', 'Sarjana Ekonomi (S.E.) ', 5),
	(13, 61201, 'Manajemen', 'MNJ', 'Sarjana Ekonomi (S.E.) ', 5),
	(14, 74201, 'Ilmu Hukum', 'HK', 'Sarjana Hukum (S.H.)', 6),
	(15, 73201, 'Psikologi', 'PSI', 'Sarjana Psikologi (S.Psi.)', 7);
/*!40000 ALTER TABLE `study_programs` ENABLE KEYS */;

-- Dumping structure for table kuesioner.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `study_programs_id` int(11) DEFAULT NULL,
  `no_identity` varchar(20) DEFAULT NULL COMMENT 'Mahasiswa: NPM, Dosen: NIK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `study_programs` (`study_programs_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table kuesioner.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `study_programs_id`, `no_identity`) VALUES
	(1, '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, 'admin@example.com', NULL, NULL, NULL, NULL, 1451903855, 1592680865, 1, 'Admin', 'Yarsi', NULL, NULL),
	(2, '127.0.0.1', 'dpt', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, 'dpt@example.com', NULL, NULL, NULL, NULL, 1451903855, 1593348366, 1, 'DPT', 'Yarsi', NULL, NULL),
	(3, '127.0.0.1', 'dosen', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, 'dosen@example.com', NULL, NULL, NULL, NULL, 1451903855, 1592830179, 1, 'Dosen', 'Yarsi', NULL, NULL),
	(4, '127.0.0.1', 'mahasiswa', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, 'mahasiswa@example.com', NULL, NULL, NULL, NULL, 1451903855, 1593277988, 1, 'Mahasiswa', 'Yarsi', NULL, NULL),
	(5, '127.0.0.1', 'fakhrifajar21@gmail.com', '$2y$08$xokhNZb9GXKc18W7KIOLjOJD5.aROUxykC/p/XNzYeeK2SOwWZPqe', NULL, 'fakhrifajar21@gmail.com', NULL, '.FrWqdA.Gf8vCPr5-KkJZO5c9157a0adcd372342', 1592930093, NULL, 1592757053, 1592930460, 1, 'fakhri', 'fajar', 14, '140201401111'),
	(6, '127.0.0.1', 'fadhillahfaritz@gmail.com', '$2y$08$wOA/zGQpS4qq15uK9.BDVu.EP4tdQGkvCdQuOenzusDqpP3853Ofi', NULL, 'fadhillahfaritz@gmail.com', NULL, 'DL5PU6guXvw9slX0qrjx5.5c20798db55ef632b6', 1593258416, NULL, 1592757506, 1593259331, 1, 'Faritz', 'Fadhillah', 5, '1402014039'),
	(7, '127.0.0.1', 'fakhrifajar057@gmail.com', '$2y$08$EI1OEVl6X76caNxBLxS.QO0vfkVmkVygdx3uNCHjXEshpzmGk.1u6', NULL, 'Firzaavi@gmail.com', NULL, 'X.qiVhJd-8NPdbCrijp4aO218164cfc056cfb170', 1593276405, NULL, 1593274629, 1593278216, 1, 'avi', 'firza', 13, '1111101');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table kuesioner.users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table kuesioner.users_groups: ~8 rows (approximately)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(11, 11, 4),
	(12, 5, 4),
	(13, 6, 4),
	(14, 7, 3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
