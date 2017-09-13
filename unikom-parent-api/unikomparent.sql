/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.13-MariaDB : Database - unikomparent
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`unikomparent` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `unikomparent`;

/*Table structure for table `keluhan` */

DROP TABLE IF EXISTS `keluhan`;

CREATE TABLE `keluhan` (
  `id_keluhan` int(11) NOT NULL AUTO_INCREMENT,
  `isi_keluhan` text,
  `tgl_keluhan` datetime DEFAULT NULL,
  `id_ortu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_keluhan`),
  KEY `id_ortu` (`id_ortu`),
  CONSTRAINT `id_ortu` FOREIGN KEY (`id_ortu`) REFERENCES `orangtua` (`id_ortu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `keluhan` */

insert  into `keluhan`(`id_keluhan`,`isi_keluhan`,`tgl_keluhan`,`id_ortu`) values (1,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf',NULL,1),(2,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3),(3,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3),(4,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3);

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nim` varchar(8) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `fakultas` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `thn_msk` year(4) NOT NULL,
  `kls_angkatan` varchar(10) NOT NULL,
  `dosen_wali` varchar(50) NOT NULL,
  `kontak_dosen_wali` varchar(20) NOT NULL,
  `photo_url` varchar(256) NOT NULL,
  `semester_sekarang` int(11) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`nim`,`nama_mhs`,`fakultas`,`jurusan`,`thn_msk`,`kls_angkatan`,`dosen_wali`,`kontak_dosen_wali`,`photo_url`,`semester_sekarang`) values ('10114453','Mike Aria Dwiputri Santoso','Teknik dan Ilmu Komputer','Teknik Informatika',2014,'IF-1','Dian Dharmayanti S.Kom., M.Kom.','0898989899','',6);

/*Table structure for table `orangtua` */

DROP TABLE IF EXISTS `orangtua`;

CREATE TABLE `orangtua` (
  `id_ortu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ortu` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ortu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `orangtua` */

insert  into `orangtua`(`id_ortu`,`nama_ortu`,`email`,`password`) values (1,'huhugygyg','huhu@gmail.com','huhu123'),(2,'huhugygyg','huhu@gmail.com','huhu123'),(3,'huhugygyg','huhu@gmail.com','huhu123'),(4,'','huhu@gmail.com','huhu123'),(5,'','huhu@gmail.com','huhu123'),(6,'','huhu@gmail.com','huhu123'),(7,'','huhu@gmail.com','huhu123'),(8,'huhugygyg','huhu@gmail.com','huhu123'),(9,'huhugygyg','huhu@gmail.com','huhu123'),(10,'','huhu@gmail.com','huhu123'),(11,'jashka','kksak@gmail.com','hka92');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
