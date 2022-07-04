-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 02, 2022 lúc 04:19 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shoplaptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Quản trị viên', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'Mod đz', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Danh mục', '', 0, 1, '2022-06-28 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2022-06-28 05:35:21'),
(3, 'Khuyến mại', '', 0, 3, '2022-06-28 05:35:21'),
(6, 'Liên hệ', '', 0, 5, '2022-06-28 05:35:21'),
(9, 'Laptop', '', 1, 3, '2022-06-28 05:35:21'),
(19, 'Dell', '', 9, 1, '2022-06-28 05:35:21'),
(20, 'Asus', '', 9, 2, '2022-06-28 05:35:21'),
(21, 'Macbook', '', 9, 4, '2022-06-28 05:35:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(17, 19, 'Dell Vostro 5402 i5', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-bo-xu-ly-intel-core-the-he-thu-11-1304404\" target=\"_blank\">Intel Core i5 Tiger Lake</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cpu-laptop-intel-core-i5-tiger-lake-1135g7-1305385\" target=\"_blank\">1135G7</a>, 2.40 GHz</p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ram-ddr4-la-gi-882173#ddr4\" target=\"_blank\">DDR4 (2 khe)</a>, 3200 MHz</p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD 256GB NVMe PCIe</a></p>\r\n	</li>\r\n</ul>\r\n', '8500000.00', 500000, 'download_(14).jpg', '[\"download_(15).jpg\",\"download_(14)1.jpg\",\"download_(13).jpg\"]', 38, 2, 14, 4, 1493983674),
(18, 20, 'Asus Vivobook X509JA', '<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">M&agrave;n h&igrave;nh: 15.6 inch, Full HD (1920 x 1080)</a></strong></p>\r\n\r\n<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">CPU: Intel Core i3 Ice Lake, 1.20 GHz</a></strong></p>\r\n\r\n<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">Đồ họa: Intel UHD Graphics1.73 kg, Pin: Li-Ion 2 cell</a></strong></p>\r\n', '9000000.00', 0, 'download_(11).jpg', '[\"download_(12).jpg\",\"download_(11)1.jpg\",\"download_(10).jpg\"]', 3, 2, 5, 1, 0),
(19, 21, 'Macbook Pro M1', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\">Apple M1</a></p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a></p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD: 256 GB</a></p>\r\n	</li>\r\n	<li>M&agrave;n h&igrave;nh:\r\n	<p>13.3 inch,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-retina-la-gi-905780\" target=\"_blank\">Retina (2560 x 1600)</a></p>\r\n	</li>\r\n	<li>Card m&agrave;n h&igrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/card-do-hoa-tich-hop-la-gi-950047\" target=\"_blank\">Card đồ họa t&iacute;ch hợp</a>, 8 nh&acirc;n GPU</p>\r\n	</li>\r\n	<li>Cổng kết nối:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/cong-thunderbolt-la-gi-uu-va-nhuoc-diem-cua-thunde-1180891\" target=\"_blank\">2 x Thunderbolt 3 (USB-C)</a></p>\r\n	</li>\r\n	<li>Hệ điều h&agrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/mac-os-la-gi-838020\" target=\"_blank\">Mac OS</a></p>\r\n	</li>\r\n	<li>Thiết kế:\r\n	<p>Vỏ kim loại nguy&ecirc;n khối, PIN liền</p>\r\n	</li>\r\n	<li>K&iacute;ch thước:\r\n	<p>D&agrave;y 15.6 mm, 1.4 kg</p>\r\n	</li>\r\n	<li>Thời điểm ra mắt:\r\n	<p>2020</p>\r\n	</li>\r\n</ul>\r\n', '9000000.00', 500000, 'download_(8).jpg', '[\"download_(9).jpg\",\"download_(8)1.jpg\",\"images_(8).jpg\"]', 3, 1, 4, 1, 1493983674),
(20, 21, 'Macbook Air 2017', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-intel-core-i-the-he-thu-5-broadwell-1192827\" target=\"_blank\">Intel Core i5 Broadwell</a>, 1.80 GHz</p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ram-ddr4-la-gi-882173#ddr3\" target=\"_blank\">DDR3L(On board)</a>, 1600 MHz</p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD: 128 GB</a></p>\r\n	</li>\r\n	<li>M&agrave;n h&igrave;nh:\r\n	<p>13.3 inch, WXGA+(1440 x 900)</p>\r\n	</li>\r\n	<li>Card m&agrave;n h&igrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/card-do-hoa-tich-hop-la-gi-950047\" target=\"_blank\">Card đồ họa t&iacute;ch hợp</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-card-do-hoa-tich-hop-intel-hd-graphics-1199634\" target=\"_blank\">Intel HD Graphics 6000</a></p>\r\n	</li>\r\n	<li>Cổng kết nối:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/magsafe-2-tren-macbook-la-gi-959220?clearcache=1\" target=\"_blank\">MagSafe 2</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cac-tieu-chuan-cong-usb-tren-laptop-va-cach-phan-b-1180516\" target=\"_blank\">2 x USB 3.0</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cong-thunderbolt-la-gi-uu-va-nhuoc-diem-cua-thunde-1180891\" target=\"_blank\">Thunderbolt 2</a></p>\r\n	</li>\r\n	<li>Hệ điều h&agrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/mac-os-la-gi-838020\" target=\"_blank\">Mac OS</a></p>\r\n	</li>\r\n	<li>Thiết kế:\r\n	<p>Vỏ kim loại nguy&ecirc;n khối, PIN liền</p>\r\n	</li>\r\n	<li>K&iacute;ch thước:\r\n	<p>D&agrave;y 17 mm, 1.35 Kg</p>\r\n	</li>\r\n	<li>Thời điểm ra mắt:\r\n	<p>2017</p>\r\n	</li>\r\n</ul>\r\n', '8800000.00', 500000, 'download_(7).jpg', '[\"download_(7)1.jpg\",\"images_(7).jpg\",\"images_(6).jpg\"]', 36, 3, 14, 3, 1493983674),
(56, 21, 'Macbook Air 2017', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-intel-core-i-the-he-thu-5-broadwell-1192827\" target=\"_blank\">Intel Core i5 Broadwell</a>, 1.80 GHz</p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ram-ddr4-la-gi-882173#ddr3\" target=\"_blank\">DDR3L(On board)</a>, 1600 MHz</p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD: 128 GB</a></p>\r\n	</li>\r\n	<li>M&agrave;n h&igrave;nh:\r\n	<p>13.3 inch, WXGA+(1440 x 900)</p>\r\n	</li>\r\n	<li>Card m&agrave;n h&igrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/card-do-hoa-tich-hop-la-gi-950047\" target=\"_blank\">Card đồ họa t&iacute;ch hợp</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-card-do-hoa-tich-hop-intel-hd-graphics-1199634\" target=\"_blank\">Intel HD Graphics 6000</a></p>\r\n	</li>\r\n	<li>Cổng kết nối:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/magsafe-2-tren-macbook-la-gi-959220?clearcache=1\" target=\"_blank\">MagSafe 2</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cac-tieu-chuan-cong-usb-tren-laptop-va-cach-phan-b-1180516\" target=\"_blank\">2 x USB 3.0</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cong-thunderbolt-la-gi-uu-va-nhuoc-diem-cua-thunde-1180891\" target=\"_blank\">Thunderbolt 2</a></p>\r\n	</li>\r\n	<li>Hệ điều h&agrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/mac-os-la-gi-838020\" target=\"_blank\">Mac OS</a></p>\r\n	</li>\r\n	<li>Thiết kế:\r\n	<p>Vỏ kim loại nguy&ecirc;n khối, PIN liền</p>\r\n	</li>\r\n	<li>K&iacute;ch thước:\r\n	<p>D&agrave;y 17 mm, 1.35 Kg</p>\r\n	</li>\r\n	<li>Thời điểm ra mắt:\r\n	<p>2017</p>\r\n	</li>\r\n</ul>\r\n', '8800000.00', 500000, 'download_(7).jpg', '[\"download_(7)1.jpg\",\"images_(7).jpg\",\"images_(6).jpg\"]', 37, 3, 14, 3, 1493983674),
(55, 21, 'Macbook Pro M1', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" target=\"_blank\">Apple M1</a></p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a></p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD: 256 GB</a></p>\r\n	</li>\r\n	<li>M&agrave;n h&igrave;nh:\r\n	<p>13.3 inch,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-retina-la-gi-905780\" target=\"_blank\">Retina (2560 x 1600)</a></p>\r\n	</li>\r\n	<li>Card m&agrave;n h&igrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/card-do-hoa-tich-hop-la-gi-950047\" target=\"_blank\">Card đồ họa t&iacute;ch hợp</a>, 8 nh&acirc;n GPU</p>\r\n	</li>\r\n	<li>Cổng kết nối:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/cong-thunderbolt-la-gi-uu-va-nhuoc-diem-cua-thunde-1180891\" target=\"_blank\">2 x Thunderbolt 3 (USB-C)</a></p>\r\n	</li>\r\n	<li>Hệ điều h&agrave;nh:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/mac-os-la-gi-838020\" target=\"_blank\">Mac OS</a></p>\r\n	</li>\r\n	<li>Thiết kế:\r\n	<p>Vỏ kim loại nguy&ecirc;n khối, PIN liền</p>\r\n	</li>\r\n	<li>K&iacute;ch thước:\r\n	<p>D&agrave;y 15.6 mm, 1.4 kg</p>\r\n	</li>\r\n	<li>Thời điểm ra mắt:\r\n	<p>2020</p>\r\n	</li>\r\n</ul>\r\n', '9000000.00', 500000, 'download_(8).jpg', '[\"download_(9).jpg\",\"download_(8)1.jpg\",\"images_(8).jpg\"]', 4, 1, 4, 1, 1493983674),
(53, 19, 'Dell Vostro 5402 i5', '<ul>\r\n	<li>CPU:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-bo-xu-ly-intel-core-the-he-thu-11-1304404\" target=\"_blank\">Intel Core i5 Tiger Lake</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cpu-laptop-intel-core-i5-tiger-lake-1135g7-1305385\" target=\"_blank\">1135G7</a>, 2.40 GHz</p>\r\n	</li>\r\n	<li>RAM:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" target=\"_blank\">8 GB</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ram-ddr4-la-gi-882173#ddr4\" target=\"_blank\">DDR4 (2 khe)</a>, 3200 MHz</p>\r\n	</li>\r\n	<li>Ổ cứng:\r\n	<p><a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" target=\"_blank\">SSD 256GB NVMe PCIe</a></p>\r\n	</li>\r\n</ul>\r\n', '8500000.00', 500000, 'download_(14).jpg', '[\"download_(15).jpg\",\"download_(14)1.jpg\",\"download_(13).jpg\"]', 37, 2, 14, 4, 1493983674),
(54, 20, 'Asus Vivobook X509JA', '<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">M&agrave;n h&igrave;nh: 15.6 inch, Full HD (1920 x 1080)</a></strong></p>\r\n\r\n<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">CPU: Intel Core i3 Ice Lake, 1.20 GHz</a></strong></p>\r\n\r\n<p><strong><a href=\"https://www.thegioididong.com/laptop/asus-vivobook-x509ja-i3-ej480t\">Đồ họa: Intel UHD Graphics1.73 kg, Pin: Li-Ion 2 cell</a></strong></p>\r\n', '9000000.00', 0, 'download_(11).jpg', '[\"download_(12).jpg\",\"download_(11)1.jpg\",\"download_(10).jpg\"]', 3, 2, 5, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', '0503_Facebookpost_1200x628px.jpg', '#', 1, '2022-06-28 05:35:21'),
(4, '2', 'thumb_salelaptop_800x450.png', '#', 4, '2022-06-28 05:35:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
