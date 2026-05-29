-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2026 at 08:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mfshop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(12, 'Áo Polo'),
(13, 'Áo sơ mi'),
(15, 'Quần Tây - Âu'),
(16, 'Quần Jean');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `payment_method` enum('cod','banking') NOT NULL DEFAULT 'cod',
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(50) DEFAULT 'Chưa thanh toán',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `gender` enum('nam','nu','unisex') NOT NULL DEFAULT 'unisex',
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `colors` varchar(255) DEFAULT 'Mặc định',
  `sizes` varchar(255) DEFAULT 'Mặc định',
  `extra_images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `gender`, `name`, `description`, `price`, `image_url`, `stock`, `created_at`, `colors`, `sizes`, `extra_images`) VALUES
(10, 12, 'nam', 'Áo Polo Cổ V RTCLASSY Vải Cotton Dệt Chéo Dày Dặn Form Regular Trẻ Trung', '✨ Áo Polo Cổ V RTCLASSY Vải Cotton Dệt Chéo Dày Dặn Form Regular Trẻ Trung    Thiết kế trẻ trung  - Form áo Regular Fit tôn dáng, phù hợp với hầu hết kích thước cơ thể. Phối màu bo cổ nổi bật trẻ trung.   - Màu sắc: Đen / Trắng / Xanh than.   * Chất liệu : Vải Cotton dệt chéo dày dặn .Các sợi vải đan chéo nhau, tạo nên vân chéo đặc trưng  *Tính chất: Thấm hút mồ hôi tốt, thoáng khí, giữ ấm, co giãn nhẹ, bền màu, ít nhăn.  *Tặng kèm hộp đóng gói cao cấp.', 209000.00, 'assets/images/1779978576_vn-11134207-820l4-miil3grveosn09@resize_w900_nl.webp', 10, '2026-05-28 14:26:30', 'Đen, Trắng', 'S, M, L, XL', 'assets/images/1779978576_0_vn-11134207-820l4-miil3gre4f7na4@resize_w900_nl.webp'),
(11, 12, 'nam', 'Áo Polo Nam Nữ Thêu Chữ STAR Unisex - Áo Cổ Bẻ Chất Cotton Cá Sấu Mềm Và Mát Cực Chất', 'Áo Polo Nam Nữ Thêu Chữ SCLA NAD Unisex - Áo Cổ Bẻ Chất Cotton Cá Sấu Mềm Và Mát Cực Chất', 180000.00, 'assets/images/1779978813_vn-11134207-7r98o-lvmo9mnyy39te6.webp', 10, '2026-05-28 14:33:33', 'Đen, Xanh', 'S, M, L, XL', 'assets/images/1779978813_0_vn-11134207-7r98o-lvmo9mnz544140.webp'),
(12, 12, 'nam', 'Áo Polo Nam Nữ HXTXMEN NAD Unisex - Áo Cổ Bẻ Tay Lỡ Chất Liệu Cotton Co Giãn 2 Chiều Cao Cấp Trẻ Trung Cá Tính', ' Hàng chuẩn NAD Unisex sản xuất, tem mác chuẩn chính hãng.  - Chất liệu: Thun Cotton , co giãn 2 chiều, vải mềm, vải mịn, thoáng mát, không xù lông. - Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.  - Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp khi mix đồ với nhiều loại.  - Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.', 170000.00, 'assets/images/1779979094_vn-11134207-81ztc-mmr7kgjmb85c69.webp', 15, '2026-05-28 14:38:14', 'Đen, Nâu', 'S, M, L, XL', 'assets/images/1779979094_0_vn-11134207-81ztc-mmr7kgjivm69c9.webp'),
(13, 12, 'nu', 'Áo polo nữ YourSee form rộng, Áo polo nữ màu đen chất tổ ong cotton mềm mịn phối khóa', 'Đ????̣̆???? Đ????????̂̉???? ????????̉???? ????????????̂̉????:  Áo Polo Nữ YourSee Chất Cotton CVC Cao Cấp Áo Thun Cổ Bẻ Cộc Tay Mềm Mại Thoáng Mát.(Không Kèm Quần). 5% Spandex: Chất liệu vải SPANDEX với khả năng đàn hồi cực tốt giúp cho áo đẹp luôn phẳng tinh tươm chẳng mất công là ủi mỗi ngày. Áo thun polo nữ thiết kế tinh tế tối giản với phần cổ bo dệt jacquard sợi nổi cùng màu áo tạo điểm nhấn, form áo vừa, màu sắc dễ mặc không kén da.', 185000.00, 'assets/images/1779979601_vn-11134207-7r98o-lslbhta83ijd44.webp', 15, '2026-05-28 14:39:18', 'Đen, Trắng', 'S, M, L, XL', 'assets/images/1779979601_0_vn-11134207-7r98o-lqc1txzwe987aa.webp'),
(14, 12, 'nam', 'Áo Polo unisex phối viền HEARTEN Áo cổ bẻ chất liệu cotton cá sấu Áo thun unisex nam nữ phong cách Hàn Quốc', 'Tên sản phẩm : Áo Polo thun unisex. Chất Liệu: chất Cotton cá sấu. Màu Sắc:   Be, xanh navy. Đặc Tính:  Chất vải áo là chất cotton cá sấu mặc thoáng mát thấm hút mồ hôi', 116000.00, 'assets/images/1779979401_vn-11134207-7r98o-lssdpfkrtj15a5@resize_w900_nl.webp', 20, '2026-05-28 14:43:21', 'Be, xanh Navy', 'S, M, L, XL', 'assets/images/1779979401_0_vn-11134207-7r98o-lssdkfd3w3ice7@resize_w900_nl.webp'),
(15, 12, 'nu', 'Áo polo nữ thiết kế, áo thun nữ có cổ, áo thun nữ cổ trụ phong cách Hàn Quốc, áo thun polo cotton', 'Áo polo nữ chất liệu: cotton dày dặn, thấm hút mồ hôi rất tốt, mềm mịn, thoáng mát, không xù lông. Đường may tỉ mỉ, chắc chắn.  Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Thiết kế hiện đại, trẻ trung, năng động. ', 165000.00, 'assets/images/1779979737_vn-11134207-7r98o-lsbesgmyg6u14e@resize_w900_nl.webp', 20, '2026-05-28 14:48:57', 'Trắng cổ đen, Đen cổ trắng', 'S, M, L, XL', 'assets/images/1779979737_0_vn-11134207-7r98o-lsec51j470yh33@resize_w900_nl.webp'),
(16, 12, 'nu', 'Áo polo nữ kiểu dáng Hàn Quốc, áo thun polo nữ chất cotton mịn mát, áo thun cổ trụ đen phối trắng, áo thun cổ bẻ', 'Chất liệu: cotton dày dặn, thấm hút mồ hôi rất tốt, mềm mịn, thoáng mát, không xù lông.  Đường may tỉ mỉ, chắc chắn.  Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao.  Thiết kế hiện đại, trẻ trung, năng động. ', 175000.00, 'assets/images/1779979918_vn-11134207-7r98o-lsbesgmxo3h5a6@resize_w900_nl.webp', 17, '2026-05-28 14:51:58', 'Đen phối trắng', 'S, M, L, XL', ''),
(17, 13, 'unisex', 'ÁO SƠMI TAY DÀI CÔNG SỞ VẢI LỤA CAO CẤP MỀM MỊN, CHỐNG NHĂN, THOÁNG KHÍ, THẤM HÚT TỐT XXL - GLO', 'Vải chéo lụa thái co giãn nhẹ, bề mặt mịn, mát, chống nhăn, không bay nhàu, không xù, không khô cứng mang lại cảm mềm mại và thoải mái tối đa cho người mặt mọi lúc mọi nơi. Đường may tỉ mỉ, chắc chắn, form áo dáng suông, chuẩn số đo, tôn dáng, phù hợp cho mọi hoạt động cũng như dễ dàng kết hợp với tất cả kiểu quần để tạo nên một bộ trang phục hoàn hảo theo phong cách riêng của bạn', 169000.00, 'assets/images/1779980145_vn-11134207-7ras8-m1im8ovhcklva8 (1).webp', 12, '2026-05-28 14:55:45', 'Đen, Trắng', 'S, M, L, XL', 'assets/images/1779980145_0_vn-11134207-7ras8-m1im8zesczb3bc.webp'),
(18, 13, 'unisex', 'Áo sơ mi trắng nam form rộng dài tay đẹp lụa mát giấu cúc cổ bẻ hàn quốc MEMOTOP MM03', 'Áo sơ mi nam là một items không thể thiếu trong tủ đồ của phái nam, có rất nhiều dáng áo và màu sắc khác nhau tạo nên vẻ đẹp và khí chất của người đàn ông. Bạn đã biết cách chọn áo sơ mi nam tay dài sao cho phù hợp với mình chưa nào? .Áo sơ mi nam Form rộng - được may rộng nhiều so với vóc dáng cơ thể. Xu hướng trẻ hiện nay cực thích kiểu form áo sơ mi nam hàn quốc này vì dù mập ốm gì cũng không kén “giấu nhẹm”  khuyết điểm béo bụng, mix với quần Baggy, quần túi hộp, ống rộng tạo phong cách Hàn quốc rất trẻ trung, năng động', 134000.00, 'assets/images/1779980245_eb547e901dba3e6ffdf3adcb65f08d7f@resize_w900_nl.webp', 20, '2026-05-28 14:57:25', 'Đen, Trắng có che nút', 'S, M, L, XL', 'assets/images/1779980245_0_88d72ea94140d6bf27b7a7e7bcbf44a8@resize_w900_nl.webp'),
(19, 15, 'unisex', 'Quần tây hàn quốc JBAGY dáng baggy vải co giãn dày dặn dáng suông ống rộng, màu đen, kem JA0101', ' Sự hoài nghi về hình ảnh và video sản phẩm không rõ nguồn gốc khiến các cậu mất niềm tin về hàng giá rẻ mà vẫn đảm bảo chất lượng tốt. Quần tây baggy cho nam JA0101 đến từ thương hiệu thời trang nam JBAGY có mặt ở đây để giúp cậu xóa bỏ những nỗi lo không đáng có này.  Cùng shop quần nam JBAGY tìm hiểu thêm về chiếc quần tây JA0101 này trong nội dung sau đây nha.  *Việc chọn một chiếc quần tây nam dáng baggy với giá nhỉn hơn 100k luôn khiến cậu phân vân vì: Chất lượng vải kém? Đường may không tốt? Form dáng quần không chuẩn làm cậu mặc vào cảm thấy chật/ rộng và bị lộ nhiều khuyết điểm.', 220392.00, 'assets/images/1779980437_vn-11134207-7r98o-lmowcwih2ifz26.webp', 17, '2026-05-28 15:00:37', 'Đen', 'S, M, L, XL', ''),
(20, 15, 'unisex', 'New Arrivals | Quần tây Bootcut ống loe nhẹ tinh tế, cao cấp co giãn hack dáng JBAGY - JA2602', 'Lấy cảm hứng từ những chiếc quần loe cổ điển, JBAGY tinh chỉnh và phát triển dòng Bootcut với độ mở từ đầu gối tạo hiệu ứng kéo dài dáng, cân bằng giữa cấu trúc chuẩn mực và sự linh hoạt cho dòng quần này.', 329000.00, 'assets/images/1779980498_vn-11134207-81ztc-mobdyy7aaoehc6@resize_w900_nl.webp', 20, '2026-05-28 15:01:38', 'Đen', 'S, M, L, XL', ''),
(21, 15, 'unisex', 'Quần tây ống rộng xếp ly suông đứng, cạp cao hách dáng chất vải lụa chống nhăn JBAGY - JD0108', 'Quần tây nam ống rộng với thiết kế 2 ly thanh lịch, chất liệu lụa cotton cao cấp, mang lại cảm giác thoải mái và lịch sự. Phom suông rộng thời thượng, phù hợp đi học, đi làm, đi chơi. Phối đẹp với áo sơ mi, áo thun hoặc blazer.  Từ khóa: quần tây nam ống rộng, quần suông nam, quần 2 ly, quần tây lụa cotton, quần tây công sở nam', 339000.00, 'assets/images/1779980579_vn-11134207-7r98o-ly4zvhyae84h3c@resize_w900_nl.webp', 11, '2026-05-28 15:02:59', 'Đen', 'S, M, L, XL', ''),
(22, 15, 'unisex', 'Quần Âu  Dáng Suông Cạp Chun, Quần Tây Ống Rộng Hách Dáng Vải Vintex Co Dãn Nhẹ Thoáng Khí Q087', 'Chiếc quần tây nam Hàn Quốc dù kết hợp với áo sơ mi, áo phông đều Nổi bật – Thoải mái – Phong cách Hàn Quốc trẻ trung. Với form dáng vừa vặn các chàng có thể tự tin khoe dáng cực chuẩn của mình. ', 129000.00, 'assets/images/1779981000_vn-11134207-7ra0g-m724o8a9688o6a.webp', 20, '2026-05-28 15:10:00', 'Xám', 'S, M, L, XL', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `phone`, `address`, `password`, `role`, `created_at`) VALUES
(2, 'Quản trị viên', NULL, 'admin', NULL, NULL, '$2y$10$GFCkuakwYp94OQEXFGdDtOgBn06iCRZMXeODN3SuPU4cJT6oivzk.', 'admin', '2026-05-28 07:54:52'),
(8, 'Dao Anh Tuan', 'omg', 'daoanhtuan18012006@gmail.com', '0862913094', NULL, '$2y$10$NpEHHupCLHybV3it5FGDleBOnv52i49omh7MQuGD7lq8bglCKw7QG', 'customer', '2026-05-29 04:28:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
