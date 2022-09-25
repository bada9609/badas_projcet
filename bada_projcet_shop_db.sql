-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.6063
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- project_shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `project_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_shop`;

-- 테이블 project_shop.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(100) NOT NULL,
  `admin_pw` varchar(100) NOT NULL,
  `admin_regdate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.admin:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT IGNORE INTO `admin` (`admin_id`, `admin_pw`, `admin_regdate`) VALUES
	('bada', '$2a$10$srb803MBFPyPpkPkR0bsu.l200Q2kp85i5ZeSBvn7SSxBpfsGg.mi', '2022-08-04 10:48:58'),
	('444', '$2a$10$OZKQJMdoprxDYAs75Ut/leG2S0Ho9TiguHKnSCt5Xlyv/bysqikz.', '2022-08-04 10:49:13'),
	('123', '123', '2022-08-04 12:00:26'),
	('ad994', '$2a$10$YjjIUE9qWWpqv2JdU2.8kOfoicamAQKZzv6Owf7csCFv4MrQWsACm', '2022-08-04 12:08:47'),
	('ad994', '$2a$10$lLNoKeV1EwHF.o51AGbiIuYwufLP/JHjx.EddD.WbwKowyXbIpZxu', '2022-08-04 12:09:18'),
	('alpha', '$2a$10$kfKVq9QqzGTn73R3mkgj4eO12Erx4i8hhk3BSGd1Hn2UrGturRpKS', '2022-08-04 12:09:42');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 project_shop.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(255) NOT NULL AUTO_INCREMENT,
  `category_type` int(255) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_regdate` varchar(50) NOT NULL DEFAULT '',
  `category_update` varbinary(50) DEFAULT NULL,
  `category_useYN` varchar(50) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.category:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT IGNORE INTO `category` (`category_id`, `category_type`, `category_name`, `category_regdate`, `category_update`, `category_useYN`) VALUES
	(1, 1, 'OUTER', '2022-08-05', _binary 0x323032322D30382D31302031323A34303A3035, 'Y'),
	(2, 1, 'BOTTOM', '2022-08-05', _binary 0x323032322D30382D30392032303A30343A3032, 'Y'),
	(5, 2, 'OXFORD', '2022-08-08 22:46:33', _binary 0x323032322D30382D30392032303A30343A3535, 'Y'),
	(6, 1, 'TOP', '2022-08-09 20:06:11', _binary 0x323032322D30382D30392032303A33353A3131, 'Y'),
	(7, 2, 'LOAFER', '2022-08-09 20:37:42', _binary 0x323032322D30382D30392032303A33383A3237, 'Y'),
	(8, 3, 'BELT', '2022-08-23 14:31:02', NULL, 'Y'),
	(9, 3, 'TIE', '2022-08-23 14:31:15', NULL, 'Y'),
	(10, 4, 'TOP', '2022-08-23 14:31:30', NULL, 'Y'),
	(11, 4, 'BOTTOM', '2022-08-23 14:31:36', NULL, 'Y'),
	(12, 3, 'JEWERLY', '2022-08-23 14:31:48', NULL, 'Y');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 project_shop.color_opiton 구조 내보내기
CREATE TABLE IF NOT EXISTS `color_opiton` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `color_type` int(11) NOT NULL,
  `color_name` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.color_opiton:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `color_opiton` DISABLE KEYS */;
/*!40000 ALTER TABLE `color_opiton` ENABLE KEYS */;

-- 테이블 project_shop.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(25) NOT NULL AUTO_INCREMENT,
  `order_customer_id` varchar(50) NOT NULL,
  `order_customer_name` varchar(350) NOT NULL,
  `order_regdate` varchar(50) NOT NULL,
  `order_dr_name` varchar(350) NOT NULL,
  `payment_type` varchar(350) NOT NULL,
  `order_customer_email` varchar(350) NOT NULL,
  `order_customer_addr` varchar(350) NOT NULL,
  `order_customer_addr2` varchar(350) NOT NULL,
  `order_customer_addr_detail` varchar(350) NOT NULL,
  `order_total_pay` int(250) NOT NULL,
  `order_state` int(25) NOT NULL DEFAULT 1,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(350) NOT NULL,
  `product_size` varchar(50) NOT NULL,
  `product_color` varchar(50) NOT NULL,
  `product_quantity` int(250) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.orders:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`order_id`, `order_customer_id`, `order_customer_name`, `order_regdate`, `order_dr_name`, `payment_type`, `order_customer_email`, `order_customer_addr`, `order_customer_addr2`, `order_customer_addr_detail`, `order_total_pay`, `order_state`, `product_id`, `product_name`, `product_size`, `product_color`, `product_quantity`) VALUES
	(1, 'bada8111', '조바다', '2022-09-08 13:01:09', '조바다', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 52500, 3, '10', '정장바지 블루', '48', 'OneColor', 1),
	(2, 'bada8111', '조바다', '2022-09-08 13:18:41', '조바다', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 52500, 1, '11', '정장바지 베이지', '52', 'OneColor', 1),
	(3, 'bada8111', '조바다', '2022-09-11 16:47:55', '조바다', 'banktransfer', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 52500, 3, '10', '정장바지 블루', '48', 'OneColor', 1),
	(4, 'bada8111', '조바다', '2022-09-12 19:38:14', '조바다', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 2552500, 2, '14', '블랙코듀로이수트', '58', 'OneColor', 3),
	(5, 'bada8111', '조바다', '2022-09-12 19:41:52', '조바다', 'banktransfer', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 52500, 2, '16', '치노 베이지 팬츠', 'S', 'NAVY', 1),
	(6, 'bada8111', '조바다', '2022-09-12 19:42:14', '조바다', 'banktransfer', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 62300, 2, '15', '클래식 크림 컬러 폴로 셔츠', 'S', 'BLACK', 1),
	(7, 'bada8111', '조바다', '2022-09-12 19:42:35', '조바다', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', 'weq', 1502500, 3, '12', '사파리자켓', 'M', 'o', 6),
	(8, 'bada8111', '조바다', '2022-09-12 19:44:37', '조바다', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', 'erterte', 52500, 3, '11', '정장바지 베이지', '50', 'OneColor', 1),
	(13, 'bada8111', '조바다', '2022-09-12 19:57:43', '', '', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 52500, 1, '11', '정장바지 베이지', '48', 'OneColor', 1),
	(14, 'bada8111', '조바다', '2022-09-12 20:02:15', '', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 52500, 1, '11', '정장바지 베이지', '48', 'OneColor', 1),
	(15, 'bada8111', '조바다', '2022-09-12 20:17:59', '', '', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 852500, 1, '14', '블랙코듀로이수트', '46', 'OneColor', 1),
	(16, 'bada8111', '조바다', '2022-09-12 20:20:00', '', '', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 852500, 1, '14', '블랙코듀로이수트', '46', 'OneColor', 1),
	(17, 'bada8111', '조바다', '2022-09-12 20:20:08', '조바다', 'directbanktransfer', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', 'erterte', 852500, 1, '14', '블랙코듀로이수트', '46', 'OneColor', 1),
	(18, 'bada8111', '조바다', '2022-09-12 20:24:57', '', 'paypal', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 52500, 1, '11', '정장바지 베이지', '48', 'OneColor', 1),
	(19, 'bada8111', '조바다', '2022-09-12 20:25:56', '', '', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '', 52500, 3, '10', '정장바지 블루', '48', 'OneColor', 1),
	(20, 'bada8111', '조바다', '2022-09-12 20:53:31', '조바다', 'directbanktransfer', 'adad@naver.com', '56447', '전북 고창군 고수면 가협길 21', '전농동', 62300, 3, '15', '클래식 크림 컬러 폴로 셔츠', 'M', 'BLACK', 1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 project_shop.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type` int(11) NOT NULL,
  `product_category` varchar(500) NOT NULL,
  `product_name` varchar(500) NOT NULL,
  `product_price` int(255) DEFAULT NULL,
  `product_regdate` varchar(500) NOT NULL,
  `product_update` varchar(500) DEFAULT NULL,
  `product_imageYN` varchar(50) NOT NULL DEFAULT 'N',
  `product_useYN` varchar(50) NOT NULL DEFAULT 'Y',
  `product_maintext` longtext DEFAULT NULL,
  `product_subtext` longtext DEFAULT NULL,
  `product_size` varchar(500) DEFAULT NULL,
  `product_color` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.product:~25 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`product_id`, `product_type`, `product_category`, `product_name`, `product_price`, `product_regdate`, `product_update`, `product_imageYN`, `product_useYN`, `product_maintext`, `product_subtext`, `product_size`, `product_color`) VALUES
	(10, 1, 'BOTTOM', '정장바지 블루', 50000, '2022-08-15 15:14:51', '2022-08-26 15:42:28', 'Y', 'Y', '단품으로 입기 좋은 블루 컬러의 울 팬츠입니다.\r\n헤링본 무늬를 특징적으로 가지고 있으며, 테일러드 패턴을 통해 제작된 특수 기성 트라우져입니다.', '트라우저 전문 생산업체인 xxx에서 생산된 제품으로\r\n고퀄리티 원단, 봉제, 패턴을 통해 착용자에게 최상의 핏팅감을 선사합니다.', '48,50,52,54,56', 'OneColor'),
	(11, 1, 'BOTTOM', '정장바지 베이지', 50000, '2022-08-15 15:16:37', '2022-08-26 15:43:23', 'Y', 'Y', '베이지 컬러의 팬츠로 \r\n어떠한 자켓 위에도 어울리는 최적의 패턴 및 원단으로 비즈니스 룩에 최적화된 팬츠입니다.', '\r\n트라우저 전문 생산업체인 xxx에서 생산된 제품으로\r\n고퀄리티 원단, 봉제, 패턴을 통해 착용자에게 최상의 핏팅감을 선사합니다.', '48,50,52,54,56', 'OneColor'),
	(12, 1, 'OUTER', '사파리자켓', 250000, '2022-08-15 15:18:36', '2022-08-26 15:46:03', 'Y', 'Y', 'So-1 signeture colombo safari jacket 소개해드립니다.\r\n\r\n이번에 매료가 사용한 원단은 리넨같은 조직감을 보여주지만 울과 울,실크로 표현해낸 colombo社의 원단을 채택하였습니다.\r\n\r\n채택된 colombo社 는 이태리 고급 원단으로 루이비통, 샤넬, 프라다, 에르메스, 구찌 등 다양한 명품 브랜드에서 사용되고\r\n있을 만큼 고급 퀄리티와 발색력 또한 뛰어나기로 유명한 원단社 입니다.\r\n\r\n또한 해당제품은 허리에 스트링이 있어 다양한 연출이 가능하도록 하였고,\r\n4포켓으로 수납기능 또한 챙겨 활용도를 높였습니다.\r\n매료가 새롭게 선보이는 시그니처 사파리 자켓을 경험해보시길 바라겠습니다.', 'Maeryo의 signeture outer series 첫번째 제품', 'M,L', 'o'),
	(13, 1, 'OUTER', '네이비 수트', 800000, '2022-08-15 15:24:50', '2022-08-23 14:23:03', 'Y', 'Y', NULL, NULL, NULL, NULL),
	(14, 1, 'OUTER', '블랙코듀로이수트', 850000, '2022-08-15 15:25:45', '2022-08-26 15:44:35', 'Y', 'Y', '국내 제일모직의 블랙 코듀로이 원단을 사용하여 제작된 더블브레스티드 수트입니다.\r\n벨벳과 같은 느낌의 고급스러운 원단과 한국인에게 최적화된 패턴을 통해 올 겨울 최고의 드레스업을 선사합니다.', '수트 전문 생산업체인 xxx에서 생산된 제품으로\r\n고퀄리티 원단, 봉제, 패턴을 통해 착용자에게 최상의 핏팅감을 선사합니다.', '46,48,50,52,54,56,58', 'OneColor'),
	(15, 1, 'TOP', '클래식 크림 컬러 폴로 셔츠', 59800, '2022-08-15 16:01:24', '2022-08-26 15:54:46', 'Y', 'Y', '스윙클럽의 \'클래식 크림칼라 폴로셔츠 는 피케면의 장점인 땀 흡수력을 그대로 살리면서, \r\n몸에 달라붙는 단점을 보완해 여름에 입기 적합 한 상품입니다.\r\n\r\n여유있고 자연스러운 세미 오버핏 실루엣을 보여주며, 포인트로는 배색 카라와 오픈 플라켓을 적용하여 클래식한 캐주얼 무드를 더했습니다. 더운 여름 가볍게 걸처서 포인트를 주기 좋은 상품입니다.', '스윙클럽의 \'클래식 크림칼라 폴로셔츠 는 피케면의 장점인 땀 흡수력을 그대로 살리면서, \r\n몸에 달라붙는 단점을 보완해 여름에 입기 적합 한 상품입니다.', 'S,M,L', 'BLACK'),
	(16, 1, 'BOTTOM', '치노 베이지 팬츠', 50000, '2022-08-15 16:02:49', '2022-08-26 15:51:18', 'Y', 'Y', 'One-Tuck tapered casual pants - l.beige\r\nbirbante(비르반테)는 밑단의 턴업 디테일을 이용하여 다양한 기장 연출이 가능하고 \r\n가먼트 다잉의 내츄럴한 컬러감을 통해서 더욱 편안한 룩을 표현할 수 있습니다.', '엉덩이부터 허벅지까지 전체적으로 여유있는 핏으로\r\n무릎 아래로는 살짝 좁아지는 테이퍼드 스타일의 팬츠입니다.', 'S,M,L,XL,2XL', 'BEIGE,NAVY'),
	(17, 1, 'TOP', 'Hound tooth check knit Black ', 35000, '2022-08-15 17:16:40', '2022-08-26 15:54:37', 'Y', 'Y', 'Hound tooth check knit\r\n\r\n베르노에서 출시된 하운드투스 니트셔츠입니다.\r\n한정수량 리미티드에디션 제품으로 \r\n6월3일 발송전까지 20% 세일 진행되는 제품입니다.', '발송은 6월3일부터 순차적으로 발송됩니다.\r\n오직 테너리,베르노에서만 만나보실 수 있습니다.\r\n\r\nLinen 39% Cotton 31% Nylon 30\r\n﻿Size\r\n\r\nM - 어깨(42.5cm) 가슴(52.5cm) 암홀(23.5cm) 소매(26cm) 총장(63cm)\r\nL - 어깨(44.5cm) 가슴(54.5cm) 암홀(24.5cm) 소매(26.5cm) 총장(65cm)\r\nXL - 어깨(46.5cm) 가슴(56.5cm) 암홀(25.5cm) 소매(27cm) 총장(67cm)', 'M,L,XL', 'OneColor'),
	(18, 1, 'OUTER', '그린 린넨 자켓', 650000, '2022-08-15 20:29:54', '2022-08-26 15:56:52', 'Y', 'Y', '전세계 적으로 많은 매니아층을 보유하고 있는 "스틸레라티노"\r\n나폴리 스타일의 정수로 손꼽히는 "체사레아톨리니" 의\r\n헤리티지를 그대로 이어받으면서도 보다 젊은 감성의 클래식 의류를 제안하는\r\n이태리 브랜드입니다!', '8드랍\r\n코튼 100%\r\n아웃포켓', '46,48,50,52,54,56', 'OneColor'),
	(19, 1, 'OUTER', '깅엄체크자켓', 580000, '2022-08-16 10:12:33', '2022-08-23 14:27:10', 'Y', 'Y', NULL, NULL, NULL, NULL),
	(20, 1, 'OUTER', '그레이 플란넬 수트', 1100000, '2022-08-16 14:46:46', '2022-08-23 14:27:52', 'Y', 'Y', NULL, NULL, NULL, NULL),
	(21, 1, 'BOTTOM', '데님팬츠', 105000, '2022-08-19 17:34:19', '2022-08-23 14:28:45', 'Y', 'Y', NULL, NULL, NULL, NULL),
	(22, 2, 'OXFORD', '기본옥스포드', 250000, '2022-08-23 14:29:30', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(23, 2, 'LOAFER', '블랙페니로퍼', 210000, '2022-08-23 14:29:54', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(24, 2, 'LOAFER', '브라운페니로퍼', 215000, '2022-08-23 14:30:14', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(25, 2, 'OXFORD', '브라운옥스포드', 250000, '2022-08-23 14:30:40', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(26, 3, 'BELT', '플라크벨트', 180000, '2022-08-23 14:32:27', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(27, 3, 'TIE', '기본타이', 35000, '2022-08-23 14:32:50', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(28, 3, 'JEWERLY', '팔찌', 14000, '2022-08-23 14:33:05', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(29, 1, 'TOP', '화이트서머니트', 35000, '2022-08-23 14:35:02', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(30, 1, 'TOP', '네이비반팔티셔츠', 28000, '2022-08-23 14:35:19', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(31, 1, 'BOTTOM', '그레이수트팬츠', 190000, '2022-08-23 14:36:12', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(32, 2, 'LOAFER', '테슬로퍼', 220000, '2022-08-23 14:36:44', '2022-08-23 14:57:49', 'Y', 'Y', NULL, NULL, NULL, NULL),
	(33, 1, 'OUTER', '네이비별주자켓', 685000, '2022-08-24 11:31:55', NULL, 'Y', 'Y', NULL, NULL, NULL, NULL),
	(34, 4, 'TOP', '샘플입니다', 30000, '2022-08-25 15:58:43', '2022-08-25 16:28:09', 'N', 'Y', '다시 테스트 줄바꿈 진행\r\n줄바꿨다!\r\n\r\n제발 좀 띄어쓰기좀;;', '나는 조바다입니다.\r\n줄도 바꿨습니다', '90,95,100', 'BLACK,SILVER');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 project_shop.product_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_id` int(11) NOT NULL,
  `main_image_filepath` varchar(250) DEFAULT NULL,
  `main_image_filename` varchar(250) DEFAULT NULL,
  `main_image_uuid` varchar(1000) DEFAULT NULL,
  `sub_image_filepath` varchar(1000) DEFAULT NULL,
  `sub_image_filename` varchar(1000) DEFAULT NULL,
  `sub_image_uuid` varchar(1000) DEFAULT NULL,
  `image_regdate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.product_image:~24 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT IGNORE INTO `product_image` (`product_id`, `main_image_filepath`, `main_image_filename`, `main_image_uuid`, `sub_image_filepath`, `sub_image_filename`, `sub_image_uuid`, `image_regdate`) VALUES
	(10, '2022\\08\\23', '856e3fd71fa1196b8d90a890b0475aad.jpg', '9f26e6cd-2df5-4cbd-9cbb-c6a856780391', '2022\\08\\23', 'DSC00038.jpg', '05b2c9f7-b605-44b8-bcbf-3674851760f5', '2022-08-26 15:42:28'),
	(11, '2022\\08\\23', '4f3b6f170090359d457f0d1c9d59a029.jpg', '6fbfb845-f6b1-4f8a-b0a7-acf9f1f23c60', NULL, NULL, NULL, '2022-08-26 15:43:23'),
	(12, '2022\\08\\23', '76134941ae621458051b4996feed36a9.jpg', 'b4c4c420-0595-4195-86d8-dea33f4c384e', '2022\\08\\23', '1649920713052.png', '80624f61-c222-4b87-976e-b26aa7ae54d3', '2022-08-26 15:46:03'),
	(13, '2022\\08\\23', '68a93a824012f7185b20af35d89891f9.jpg', '739cd157-7626-4cb9-8034-111abac103e6', '2022\\08\\23', 'KakaoTalk_20220408_162553888.jpg', '3fbfea76-b4d8-40c7-8e0b-04a7a9af4daa', '2022-08-23 14:23:03'),
	(14, '2022\\08\\23', 'e8bd4f3a1e86d6fe730bb29199f9ca6f.jpeg', '4f85565f-9f5a-4db4-b3ab-804ec288847c', '2022\\08\\23', 'KakaoTalk_20220819_154414147_01.jpg', '5bf06b92-15bc-4264-be2f-33b24a2e80cf', '2022-08-26 15:44:35'),
	(15, '2022\\08\\23', '47f818e37df203f697e6589b90d5c605.png', '1999e435-87e9-4a15-a9e1-844a581a4fa4', '2022\\08\\23', 'TERRY-BUTTONS-SUMMER-KNITWEAR_Navy.jpg', 'c8544272-2d9e-4116-93f0-8624278d3521', '2022-08-26 15:54:46'),
	(16, '2022\\08\\23', '869efd95e398f90b9f47d44e0762108e.jpg', 'bac71e81-8979-4443-a17f-8122210a0be5', '2022\\08\\23', 'copy-1650534502-005.jpg', '3cf8834b-e40a-41af-a1e4-2779430aae33', '2022-08-26 15:51:18'),
	(17, '2022\\08\\23', 'dc09b1e2e85abc9e8b5c60284f05c5ba.jpg', '416aaf94-e5eb-4f6b-93ed-8887d34226f5', '2022\\08\\23', '220526_EBB2A0EBA5B4EB85B80476.jpg', '89f0ea79-6dff-4c4c-b346-097f1067293d', '2022-08-26 15:54:37'),
	(18, '2022\\08\\23', 'fbcfe9d49988a1db4cde85e2bcaffb2e.jpg', '0d8b1073-0743-4c3a-98b5-ec4e4947680d', '2022\\08\\23', '2_shop1_182100.jpg', '94da6ad9-6188-4e94-a64d-de1fd3acea61', '2022-08-26 15:56:52'),
	(19, '2022\\08\\23', 'c2d7ff580740bfe14a5cfd4ab24499a7.jpg', 'baf56a3b-758d-4d22-923e-21d87c25b8bb', '2022\\08\\23', 'IMG_08795B15D.jpg', 'b9c65c6d-aa48-449e-ae8e-77a9bd9c9e24', '2022-08-23 14:27:10'),
	(20, '2022\\08\\23', 'ade56a6cff502f5d97aadabe7388e206.jpg', '0fda85c1-78bf-47d4-92ba-13a6a1510df7', '2022\\08\\23', 'IMG_59485B15D.jpg', '8e23474e-43a1-437f-9298-bc4aeb9f183c', '2022-08-23 14:27:52'),
	(21, '2022\\08\\23', 'b437960e58234602ee7ff44d2e478d05.jpg', 'af0debc2-b89c-4796-b24b-a3bcd541e07b', '2022\\08\\23', '643ef1d179f7f9c268fb8dc46f27c3c6.jpg', 'e1689971-ad8f-45c2-b97a-be997e3b6a31', '2022-08-23 14:28:45'),
	(22, '2022\\08\\23', 'ad2dbcc31f9ea8395405cc6302588a6f.jpg', '9774a9bd-42fe-482d-8e66-e87291a79a2f', '2022\\08\\23', 'se12-222001203.jpg', '80245cd3-23bb-41b5-b9be-7c37e01e7ffe', '2022-08-23 14:29:30'),
	(23, '2022\\08\\23', '812d15b5e0c64303a1a5697086654180.jpg', '6fa679b0-47bf-4293-acb9-b6db4507f0a9', '2022\\08\\23', 'copy-1573013441-main.jpg', '3f9072f3-d97f-48ad-b04b-4338d075dff7', '2022-08-23 14:29:54'),
	(24, '2022\\08\\23', '118_shop1_997975.jpg', 'c71a42ae-130d-49c5-963e-628ef22a4b3e', '2022\\08\\23', 'IMG_3678.jpg', 'c87e38b1-3ac2-4dc7-8e2c-5636798a917e', '2022-08-23 14:30:14'),
	(25, '2022\\08\\23', '66decbe4fc8c14d0e9e7ab5999b4b950.jpg', 'a95b7888-5cfe-4932-9b19-115caf3bad24', '2022\\08\\23', '스트팁_shop1_180044.jpg', 'eff0b50a-6042-4932-820c-a431455f28af', '2022-08-23 14:30:40'),
	(26, '2022\\08\\23', '5c6353504bfc6d73c8ba2fe91d11d02c.jpg', '3ba8e95a-bd56-4cb4-8e3a-6aac4ad0323d', '2022\\08\\23', '41111444.jpg', 'f022e4fd-74de-41d0-9a2d-279a87132d51', '2022-08-23 14:32:27'),
	(27, '2022\\08\\23', '1ca860bfbf63692fdace7d643049eadf.jpg', 'e55b82fc-8b07-4077-b99f-09626b7c2bf7', NULL, NULL, NULL, '2022-08-23 14:32:50'),
	(28, '2022\\08\\23', '5961d78320822da1d194a77d78a7d2ee.png', '61949fde-bfb2-4179-8bfe-460986079ae0', '2022\\08\\23', '22222_shop1_174911.jpg', 'de3f97fd-bb29-4fd7-9e9a-8e2622c40bdb', '2022-08-23 14:33:05'),
	(29, '2022\\08\\23', '7d5c28d1dfaac648f6e4085a48c46ad1.jpg', '637bb5a8-1641-407d-80ab-9eda566f4187', '2022\\08\\23', '220526_EBB2A0EBA5B4EB85B80506.jpg', '53742e09-d35c-4a52-b108-eed7b2b4852e', '2022-08-23 14:35:02'),
	(30, '2022\\08\\23', '702ba84712c58ff84b0bcd724340f766.jpg', 'b0401fd2-3f91-4e25-a9d5-c9ca07b5bab9', '2022\\08\\23', 'copy-1655375047-3-320EBB0B0EC8389ED94BCECBC8020EBB894EB9E99.jpg', '00ba51ab-3ba1-4398-9834-ddc1ccf0ed53', '2022-08-23 14:35:19'),
	(31, '2022\\08\\23', '85b26f01db65293310d0d4bba6c3ee46.jpg', 'd1a5bdfe-9015-4440-bf11-428bfe3e04b9', '2022\\08\\23', '1st-JEAN-Offwhite1.jpg', 'bdc720a8-8d46-4d5c-93d1-237889ffd51f', '2022-08-23 14:36:12'),
	(32, '2022\\08\\23', '2f8aa5d10d09eb38090080430a542597.jpg', '0c50c7d4-b223-45c4-b1dd-f6139e85245f', '2022\\08\\23', '33_shop1_180739.jpg', '2aa1567a-5a03-4815-9d69-f6430f92a21e', '2022-08-23 14:57:49'),
	(33, '2022\\08\\24', 'KakaoTalk_20170712_1904111435B15D.jpg', '6d60dad5-9ce8-4fa1-a168-b5fb023e7d42', '2022\\08\\24', '681_shop1_580666.jpg', '0f0b908c-a6d3-43b2-924e-d126881c42f0', '2022-08-24 11:31:55');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- 테이블 project_shop.product_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `product_type` (
  `mp_code` int(255) NOT NULL AUTO_INCREMENT,
  `mp_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`mp_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.product_type:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT IGNORE INTO `product_type` (`mp_code`, `mp_name`) VALUES
	(1, 'CLOTHINGS'),
	(2, 'FOOTWEAR'),
	(3, 'ACCESSORIES'),
	(4, 'WOMAN');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;

-- 테이블 project_shop.shopmember 구조 내보내기
CREATE TABLE IF NOT EXISTS `shopmember` (
  `member_id` varchar(100) NOT NULL,
  `member_pw` varchar(1000) NOT NULL,
  `member_name` varchar(1000) NOT NULL,
  `member_addr` varchar(1000) NOT NULL,
  `member_addr2` varchar(1000) NOT NULL,
  `member_birth` varchar(1000) NOT NULL,
  `member_regdate` date NOT NULL DEFAULT '0000-00-00',
  `member_email` varchar(1000) DEFAULT NULL,
  `member_number` varchar(1000) DEFAULT NULL,
  `member_point` int(255) DEFAULT NULL,
  `member_del` varchar(50) NOT NULL DEFAULT '''n''',
  `memeber_deldate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.shopmember:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shopmember` DISABLE KEYS */;
INSERT IGNORE INTO `shopmember` (`member_id`, `member_pw`, `member_name`, `member_addr`, `member_addr2`, `member_birth`, `member_regdate`, `member_email`, `member_number`, `member_point`, `member_del`, `memeber_deldate`) VALUES
	('bada8111', '$2a$10$eY5mj4BjEKYMMuqD6.dRTuky.osobi.us.cIM4pLT/RCJ6UDXAsdK', '조바다', '56447', '전북 고창군 고수면 가협길 21', '1999-99-99', '2022-08-02', 'adad@naver.com', '010-6625-9609', 2500000, '\'n\'', NULL),
	('bada9609', '$2a$10$.SHcCnzl0Jl.O3unW7xeou9QEGsY89ortwQR9VMMHlC/WMqqeT1Bm', '바다', '02559', '서울 동대문구 답십리로 3 (전농동)', '1996-09-06', '2022-09-13', 'bada9609@naver.com', '010-6625-9609', 2000000, '\'n\'', NULL);
/*!40000 ALTER TABLE `shopmember` ENABLE KEYS */;

-- 테이블 project_shop.size_option 구조 내보내기
CREATE TABLE IF NOT EXISTS `size_option` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_type` int(11) NOT NULL,
  `size_name` varchar(2000) DEFAULT NULL,
  `size_priceoption` int(255) DEFAULT NULL,
  `size_regdate` varchar(2000) NOT NULL,
  `size_useYN` varchar(50) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 project_shop.size_option:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `size_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `size_option` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
