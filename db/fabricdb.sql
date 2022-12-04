-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 09:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fab_o`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `ID` int(20) NOT NULL,
  `cus_Action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`ID`, `cus_Action`) VALUES
(1, 'New'),
(2, 'Ordered'),
(3, 'Partial Paid'),
(4, 'Full Paid'),
(5, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `bolt`
--

CREATE TABLE `bolt` (
  `Bolt_Code` int(20) NOT NULL,
  `Fabric_Code` int(20) NOT NULL,
  `Order_Code` int(20) DEFAULT NULL,
  `Length` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bolt`
--

INSERT INTO `bolt` (`Bolt_Code`, `Fabric_Code`, `Order_Code`, `Length`) VALUES
(1, 1, 1, 20),
(2, 6, 2, 12),
(3, 2, 2, 100),
(4, 3, 3, 30),
(5, 4, 3, 20),
(6, 5, 3, 29),
(7, 7, 4, 23),
(8, 8, 4, 26),
(9, 9, 5, 34),
(10, 1, 4, 20),
(11, 2, NULL, 10),
(12, 3, NULL, 12),
(13, 4, NULL, 15),
(14, 5, NULL, 2),
(15, 6, NULL, 15),
(16, 7, NULL, 10),
(17, 8, NULL, 10),
(18, 9, NULL, 14),
(19, 8, NULL, 18),
(20, 7, NULL, 30),
(21, 1, NULL, 12),
(22, 5, NULL, 2),
(23, 6, NULL, 4),
(24, 6, NULL, 20),
(25, 2, NULL, 20),
(26, 1, NULL, 25),
(27, 3, NULL, 10),
(28, 7, NULL, 5),
(29, 5, NULL, 20),
(30, 6, NULL, 20),
(31, 2, NULL, 20),
(32, 9, NULL, 20),
(33, 8, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Fabric_Code` int(20) NOT NULL,
  `Supplier_Code` int(11) NOT NULL,
  `Name` varchar(55) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Fabric_Code`, `Supplier_Code`, `Name`, `Color`, `Quantity`) VALUES
(1, 4, 'Silk', 'Blue', 2),
(2, 3, 'Khaki', 'Brown', 3),
(3, 2, 'Damask', 'Black', 2),
(4, 1, 'Crewel', 'Black', 1),
(5, 5, 'Jacquard', 'Red', 3),
(6, 4, 'Faux silk', 'Yellow', 4),
(7, 6, 'Cotton', 'White', 3),
(8, 1, 'Satin', 'Purple', 3),
(9, 1, 'Velvet', 'Orange', 2);

-- --------------------------------------------------------

--
-- Table structure for table `current_price`
--

CREATE TABLE `current_price` (
  `Fabric_Code` int(20) NOT NULL,
  `Price` double NOT NULL,
  `Date_of_price` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `current_price`
--

INSERT INTO `current_price` (`Fabric_Code`, `Price`, `Date_of_price`) VALUES
(1, 434000, '2022-11-07'),
(2, 500000, '2022-11-07'),
(3, 222000, '2022-11-07'),
(4, 31000, '2022-11-04'),
(5, 400000, '2022-11-01'),
(6, 200000, '2022-11-03'),
(7, 310000, '2022-11-03'),
(8, 500000, '2022-11-05'),
(9, 31000, '2022-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Code` int(20) NOT NULL,
  `Address` varchar(55) NOT NULL,
  `Arrerage` int(255) NOT NULL,
  `Fname` varchar(55) NOT NULL,
  `Lname` varchar(55) NOT NULL,
  `Office_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Code`, `Address`, `Arrerage`, `Fname`, `Lname`, `Office_staff_Code`) VALUES
(1, '11 Vugk, Pokin', 100000, 'Pok', 'Pik', 5),
(2, '123 HaNoi, VietNam', 0, 'Ngoc', 'Nghia', 0),
(3, '23 Washington D.C USA', 70000, 'Rosalia', 'Roxana', 5),
(4, '456 HoChiMinh,VietNam', 0, 'Ying', 'Yang', 8),
(5, '234 RedStream, USA', 0, 'Yasuo', 'Yone', 7),
(6, '123 Tokyo, Japan', 0, 'Nezuko', 'Tanjiro', 5),
(7, '345 Tokyo, Japan', 0, 'Net', 'Telsa', 7),
(8, '43 Washington DC, USA', 0, 'Yugi', 'Mutou', 6),
(9, '67 HaLong, VietNam', 0, 'Red', 'Skull', 8);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

CREATE TABLE `customer_phone` (
  `Customer_Code` int(20) NOT NULL,
  `Phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`Customer_Code`, `Phone_number`) VALUES
(1, '0765432'),
(1, '0876543'),
(3, '09876543'),
(4, '087654'),
(5, '0956433'),
(7, '0765432312'),
(7, '08765432'),
(9, '08765432');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_Code` int(20) NOT NULL,
  `Emp_Fname` varchar(55) NOT NULL,
  `Emp_Lname` varchar(55) NOT NULL,
  `Gender` varchar(10) NOT NULL COMMENT 'Male/Female',
  `Emp_Address` varchar(55) NOT NULL,
  `Emp_Phone` varchar(10) NOT NULL,
  `Operational_staff_Code` int(20) DEFAULT NULL,
  `Office_staff_Code` int(20) DEFAULT NULL,
  `Partner_staff_Code` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_Code`, `Emp_Fname`, `Emp_Lname`, `Gender`, `Emp_Address`, `Emp_Phone`, `Operational_staff_Code`, `Office_staff_Code`, `Partner_staff_Code`) VALUES
(1, 'Adam', 'Smith', 'Male', '205 Mountain View Ter Leeds, Alabama', '0912345678', 1, NULL, NULL),
(2, 'Gogi', 'King', 'Male', '205 Mountain, Alpha', '0902233123', 2, NULL, NULL),
(3, 'Qiqi', 'Bob', 'Female', '2 Beach, Osaka', '07112301', 3, NULL, NULL),
(4, 'White', 'Taylor', 'Female', '102 Luv, Area', '021150302', 4, NULL, NULL),
(5, 'Lee', 'Ling', 'Male', '1 One, Olala', '030111020', NULL, 5, NULL),
(6, 'Jung', 'Gle', 'Male', '220 What, Wrong', '0201110234', NULL, 6, NULL),
(7, 'Oli', 'Hui', 'Female', '23 Tree, Moutaijn', '03532331', NULL, 7, NULL),
(8, 'Emme', 'Thor', 'Male', '12 Jili, Will', '0745622', NULL, 8, NULL),
(9, 'Sun', 'Sil', 'Female', '12 Kilo, China', '0643245', NULL, NULL, 9),
(10, 'Lee', 'Coco', 'Female', '67 Huni, Bit', '07356246', NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `imported`
--

CREATE TABLE `imported` (
  `Fabric_Code` int(20) NOT NULL,
  `Purchase_price` double NOT NULL,
  `Date` date NOT NULL,
  `Qty_of_cate` int(255) NOT NULL,
  `Supplier_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imported`
--

INSERT INTO `imported` (`Fabric_Code`, `Purchase_price`, `Date`, `Qty_of_cate`, `Supplier_Code`) VALUES
(1, 200000, '2022-11-01', 31, 4),
(2, 400000, '2022-11-01', 24, 3),
(3, 150000, '2022-11-01', 32, 2),
(4, 20000, '2022-11-01', 18, 1),
(5, 200000, '2022-11-01', 50, 5),
(6, 100000, '2022-11-01', 20, 4),
(7, 220000, '2022-11-01', 10, 6),
(8, 300000, '2022-11-01', 30, 1),
(9, 25000, '2022-11-01', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `office_staff`
--

CREATE TABLE `office_staff` (
  `Office_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office_staff`
--

INSERT INTO `office_staff` (`Office_staff_Code`) VALUES
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `operational_staff`
--

CREATE TABLE `operational_staff` (
  `Operational_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operational_staff`
--

INSERT INTO `operational_staff` (`Operational_staff_Code`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_Code` int(20) NOT NULL,
  `qty_Ordered` int(255) NOT NULL,
  `Total_price` double NOT NULL,
  `Status_by_time` varchar(20) NOT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Operational_staff_Code` int(20) NOT NULL,
  `Customer_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_Code`, `qty_Ordered`, `Total_price`, `Status_by_time`, `Reason`, `Operational_staff_Code`, `Customer_Code`) VALUES
(1, 1, 200000, 'New', '', 1, 1),
(2, 2, 500000, 'Full Paid', '', 1, 7),
(3, 3, 370000, 'Partial Paid', '', 3, 3),
(4, 3, 520000, 'Ordered', '', 2, 4),
(5, 1, 0, 'Canceled', 'No longer need to buy', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `partial_payment`
--

CREATE TABLE `partial_payment` (
  `Order_Code` int(20) NOT NULL,
  `Date` date NOT NULL,
  `Amount_of_money` double NOT NULL,
  `Customer_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partial_payment`
--

INSERT INTO `partial_payment` (`Order_Code`, `Date`, `Amount_of_money`, `Customer_Code`) VALUES
(1, '2022-11-08', 100000, 1),
(3, '2022-11-08', 300000, 3),
(4, '2022-11-08', 520000, 4),
(2, '2022-11-08', 500000, 7),
(5, '2022-11-08', 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `partner_staff`
--

CREATE TABLE `partner_staff` (
  `Partner_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_staff`
--

INSERT INTO `partner_staff` (`Partner_staff_Code`) VALUES
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `processed`
--

CREATE TABLE `processed` (
  `Order_code` int(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time(6) NOT NULL,
  `Operational_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processed`
--

INSERT INTO `processed` (`Order_code`, `Date`, `Time`, `Operational_staff_Code`) VALUES
(1, '2022-11-09', '22:12:20.519000', 1),
(2, '2022-11-09', '22:15:16.015000', 2),
(3, '2022-11-09', '22:33:16.000000', 3),
(4, '2022-11-09', '10:00:00.093000', 4),
(5, '2022-11-09', '20:00:00.093000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_Code` int(20) NOT NULL,
  `Sup_Name` varchar(55) NOT NULL,
  `Tax_code` int(20) NOT NULL,
  `Sup_Address` varchar(55) NOT NULL,
  `Bank_account` varchar(55) NOT NULL,
  `Partner_staff_Code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_Code`, `Sup_Name`, `Tax_code`, `Sup_Address`, `Bank_account`, `Partner_staff_Code`) VALUES
(1, 'Camera Tette', 12324, '123 Shanghai, China', '1234567', 9),
(2, 'Kuroko Jouda', 3244, '456 Tokyo, Japan ', '1444123', 10),
(3, 'Jakey Tenten', 12345, '32 HaNoi, VietNam', '3212213', 10),
(4, 'Emperor Enday', 7563, '14 Washington DC, America', '1231231', 9),
(5, 'Sasuke Papa', 235347, '232 Tokyo, VietNam', '2223112', 9),
(6, 'Kakashi Hatake', 12446, '123 HoChiMinh, VietNam', '2213426', 10);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_phone`
--

CREATE TABLE `supplier_phone` (
  `Supplier_Code` int(20) NOT NULL,
  `Sup_phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_phone`
--

INSERT INTO `supplier_phone` (`Supplier_Code`, `Sup_phone_number`) VALUES
(1, '0743434'),
(1, '08745365'),
(2, '0876543'),
(3, '08754542'),
(4, '0776432'),
(5, '0767543'),
(6, '07754334'),
(6, '08765432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bolt`
--
ALTER TABLE `bolt`
  ADD PRIMARY KEY (`Bolt_Code`,`Fabric_Code`) USING BTREE,
  ADD KEY `Fabric_Code` (`Fabric_Code`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Fabric_Code`),
  ADD KEY `category_ibfk_1` (`Supplier_Code`);

--
-- Indexes for table `current_price`
--
ALTER TABLE `current_price`
  ADD PRIMARY KEY (`Fabric_Code`,`Price`,`Date_of_price`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Code`),
  ADD KEY `Office_staff_Code` (`Office_staff_Code`);

--
-- Indexes for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD PRIMARY KEY (`Customer_Code`,`Phone_number`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_Code`),
  ADD KEY `Operational_staff_Code` (`Operational_staff_Code`),
  ADD KEY `Office_staff_Code` (`Office_staff_Code`),
  ADD KEY `Partner_staff_Code` (`Partner_staff_Code`);

--
-- Indexes for table `imported`
--
ALTER TABLE `imported`
  ADD PRIMARY KEY (`Fabric_Code`) USING BTREE,
  ADD KEY `Supplier_Code` (`Supplier_Code`);

--
-- Indexes for table `office_staff`
--
ALTER TABLE `office_staff`
  ADD PRIMARY KEY (`Office_staff_Code`);

--
-- Indexes for table `operational_staff`
--
ALTER TABLE `operational_staff`
  ADD PRIMARY KEY (`Operational_staff_Code`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_Code`),
  ADD KEY `Customer_Code` (`Customer_Code`),
  ADD KEY `Operational_staff_Code` (`Operational_staff_Code`) USING BTREE;

--
-- Indexes for table `partial_payment`
--
ALTER TABLE `partial_payment`
  ADD PRIMARY KEY (`Order_Code`,`Date`,`Amount_of_money`),
  ADD KEY `Customer_Code` (`Customer_Code`);

--
-- Indexes for table `partner_staff`
--
ALTER TABLE `partner_staff`
  ADD PRIMARY KEY (`Partner_staff_Code`);

--
-- Indexes for table `processed`
--
ALTER TABLE `processed`
  ADD PRIMARY KEY (`Order_code`),
  ADD KEY `Operational_staff_Code` (`Operational_staff_Code`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_Code`),
  ADD KEY `Partner_staff_Code` (`Partner_staff_Code`);

--
-- Indexes for table `supplier_phone`
--
ALTER TABLE `supplier_phone`
  ADD PRIMARY KEY (`Supplier_Code`,`Sup_phone_number`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bolt`
--
ALTER TABLE `bolt`
  MODIFY `Bolt_Code` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Fabric_Code` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_Code` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_Code` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_Code` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bolt`
--
ALTER TABLE `bolt`
  ADD CONSTRAINT `bolt_ibfk_1` FOREIGN KEY (`Fabric_Code`) REFERENCES `category` (`Fabric_Code`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Supplier_Code`) REFERENCES `supplier` (`Supplier_Code`);

--
-- Constraints for table `current_price`
--
ALTER TABLE `current_price`
  ADD CONSTRAINT `current_price_ibfk_1` FOREIGN KEY (`Fabric_Code`) REFERENCES `category` (`Fabric_Code`);

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `customer_phone_ibfk_1` FOREIGN KEY (`Customer_Code`) REFERENCES `customer` (`Customer_Code`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Operational_staff_Code`) REFERENCES `operational_staff` (`Operational_staff_Code`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Office_staff_Code`) REFERENCES `office_staff` (`Office_staff_Code`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`Partner_staff_Code`) REFERENCES `partner_staff` (`Partner_staff_Code`);

--
-- Constraints for table `imported`
--
ALTER TABLE `imported`
  ADD CONSTRAINT `imported_ibfk_1` FOREIGN KEY (`Fabric_Code`) REFERENCES `category` (`Fabric_Code`),
  ADD CONSTRAINT `imported_ibfk_2` FOREIGN KEY (`Supplier_Code`) REFERENCES `supplier` (`Supplier_Code`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Operational_staff_Code`) REFERENCES `operational_staff` (`Operational_staff_Code`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Customer_Code`) REFERENCES `customer` (`Customer_Code`);

--
-- Constraints for table `partial_payment`
--
ALTER TABLE `partial_payment`
  ADD CONSTRAINT `partial_payment_ibfk_1` FOREIGN KEY (`Order_Code`) REFERENCES `order` (`Order_Code`),
  ADD CONSTRAINT `partial_payment_ibfk_2` FOREIGN KEY (`Customer_Code`) REFERENCES `customer` (`Customer_Code`);

--
-- Constraints for table `processed`
--
ALTER TABLE `processed`
  ADD CONSTRAINT `processed_ibfk_1` FOREIGN KEY (`Operational_staff_Code`) REFERENCES `operational_staff` (`Operational_staff_Code`),
  ADD CONSTRAINT `processed_ibfk_2` FOREIGN KEY (`Order_code`) REFERENCES `order` (`Order_Code`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`Partner_staff_Code`) REFERENCES `partner_staff` (`Partner_staff_Code`);

--
-- Constraints for table `supplier_phone`
--
ALTER TABLE `supplier_phone`
  ADD CONSTRAINT `supplier_phone_ibfk_1` FOREIGN KEY (`Supplier_Code`) REFERENCES `supplier` (`Supplier_Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
