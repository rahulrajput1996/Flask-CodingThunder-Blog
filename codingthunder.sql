-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2022 at 09:11 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `SerialNumber` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `Message` text NOT NULL,
  `DateTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`SerialNumber`, `Name`, `EmailAddress`, `PhoneNumber`, `Message`, `DateTime`) VALUES
(1, 'rahul kumar singh', 'ra10011996@gmail.com', '7060810244', 'hi ! how are you', '2022-07-28 17:49:10'),
(61, 'ashish', 'ashish@gmail.com', '7064215411', 'i am good', '2022-07-29 00:19:27'),
(62, 'ashish', 'ggtr@gmail.com', '49851984', 'good', '2022-07-29 00:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `SerialNumber` int(11) NOT NULL,
  `Title` text NOT NULL,
  `SubTitle` varchar(50) NOT NULL,
  `Content` text NOT NULL,
  `ImgFile` varchar(20) NOT NULL,
  `SlugName` varchar(20) NOT NULL,
  `PostedBy` varchar(50) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`SerialNumber`, `Title`, `SubTitle`, `Content`, `ImgFile`, `SlugName`, `PostedBy`, `Date`) VALUES
(1, 'Welcome to Python Learning', 'Flask journey starts soon', 'Python is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.[31]\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming. It is often described as a \"batteries included\" language due to its comprehensive standard library.[32][33]\r\n\r\nGuido van Rossum began working on Python in the late 1980s as a successor to the ABC programming language and first released it in 1991 as Python 0.9.0.[34] Python 2.0 was released in 2000 and introduced new features such as list comprehensions, cycle-detecting garbage collection, reference counting, and Unicode support. Python 3.0, released in 2008, was a major revision that is not completely backward-compatible with earlier versions. Python 2 was discontinued with version 2.7.18 in 2020.', 'post-bg.jpg', 'first-post', 'Rahul Kumar Singh', '2022-07-29 10:15:36'),
(2, 'Welcome to Java Programming', 'Spring journey starts soon', 'In this tutorial, you will learn to write \"Hello World\" program in Java.  A \"Hello, World!\" is a simple program that outputs Hello, World! on the screen. Since it\'s a very simple program, it\'s often used to introduce a new programming language to a newbie.  Let\'s explore how Java \"Hello, World!\" program works.  Note: You can use our online Java compiler to run Java programs.  Java \"Hello, World!\" Program // Your First Program  class HelloWorld {     public static void main(String[] args) {         System.out.println(\"Hello, World!\");      } } Output  Hello, World!', 'post-image.jpg', 'second-post', 'Ashish Kumar Singh', '2022-07-29 12:51:53'),
(3, 'Welcome to C++ Programming', 'Advanced Tutorial start soon', 'Before starting the abcd of C++ language, you need to learn how to write, compile and run the first C++ program.  To write the first C++ program, open the C++ console and write the following code:  #include <iostream.h>   #include<conio.h>   void main() {      clrscr();      cout << \"Welcome to C++ Programming.\";       getch();   }   #include<iostream.h> includes the standard input output library functions. It provides cin and cout methods for reading from input and writing to output respectively.  #include <conio.h> includes the console input output library functions. The getch() function is defined in conio.h file.', 'home-bg.jpg', 'third-post', 'Sumit Kumar', '2022-07-29 12:52:08'),
(4, 'C Programming', 'Welcome to C', 'C (/ˈsiː/, as in the letter c) is a general-purpose computer programming language. It was created in the 1970s by Dennis Ritchie, and remains very widely used and influential. By design, C\'s features cleanly reflect the capabilities of the targeted CPUs. It has found lasting use in operating systems, device drivers, protocol stacks, though decreasingly for application software, and is common in computer architectures that range from the largest supercomputers to the smallest microcontrollers and embedded systems.  A successor to the programming language B, C was originally developed at Bell Labs by Dennis Ritchie between 1972 and 1973 to construct utilities running on Unix. It was applied to re-implementing the kernel of the Unix operating system.[6] During the 1980s, C gradually gained popularity. It has become one of the most widely used programming languages,[7][8] with C compilers available for almost[citation needed] all modern computer architectures and operating systems. C has been standardized by ANSI since 1989 (ANSI C) and by the International Organization for Standardization (ISO).  C is an imperative procedural language supporting structured programming, lexical variable scope, and recursion, with a static type system. It was designed to be compiled to provide low-level access to memory and language constructs that map efficiently to machine instructions, all with minimal runtime support. Despite its low-level capabilities, the language was designed to encourage cross-platform programming. A standards-compliant C program written with portability in mind can be compiled for a wide variety of computer platforms and operating systems with few changes to its source code.[9]  Since 2000, C has consistently ranked among the top two languages in the TIOBE index, a measure of the popularity of programming languages.[10]', 'home-bg.jpg', 'four-post', 'LINUS TORWARDS', '2022-07-30 02:30:03'),
(5, 'Welcome to JavaScript', 'JavaScript is a high-level, often just-in-time com', 'JavaScript (/ˈdʒɑːvəskrɪpt/),[10] often abbreviated JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.[11] As of 2022, 98% of websites use JavaScript on the client side for webpage behavior,[12] often incorporating third-party libraries.[13] All major web browsers have a dedicated JavaScript engine to execute the code on users\' devices.  JavaScript is a high-level, often just-in-time compiled language that conforms to the ECMAScript standard.[14] It has dynamic typing, prototype-based object-orientation, and first-class functions. It is multi-paradigm, supporting event-driven, functional, and imperative programming styles. It has application programming interfaces (APIs) for working with text, dates, regular expressions, standard data structures, and the Document Object Model (DOM).  The ECMAScript standard does not include any input/output (I/O), such as networking, storage, or graphics facilities. In practice, the web browser or other runtime system provides JavaScript APIs for I/O.  JavaScript engines were originally used only in web browsers, but are now core components of some servers and a variety of applications. The most popular runtime system for this usage is Node.js.  Although Java and JavaScript are similar in name, syntax, and respective standard libraries, the two languages are distinct and differ greatly in design.', 'home-bg.jpg', 'five-post', 'Ravi Kant', '2022-07-30 02:58:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`SerialNumber`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`SerialNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `SerialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `SerialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
