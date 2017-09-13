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

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `nip` varchar(11) NOT NULL,
  `nama_dosen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dosen` */

insert  into `dosen`(`nip`,`nama_dosen`) values ('41277006005','Dian Dharmayanti, S.T., M.Kom');

/*Table structure for table `dosen_wali` */

DROP TABLE IF EXISTS `dosen_wali`;

CREATE TABLE `dosen_wali` (
  `nip` varchar(11) NOT NULL,
  `nama_dosen_wali` varchar(50) DEFAULT NULL,
  `kontak` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dosen_wali` */

insert  into `dosen_wali`(`nip`,`nama_dosen_wali`,`kontak`) values ('41277006005','Dian Dharmayanti, S.T., M.Kom','0876676577');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `keluhan` */

insert  into `keluhan`(`id_keluhan`,`isi_keluhan`,`tgl_keluhan`,`id_ortu`) values (1,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf',NULL,1),(2,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3),(3,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3),(4,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg dggfdgfdgfdgf hdk hweh dwk',NULL,3),(5,'bjdsj jsgj d jdgjdsjh jdgjs  jhgdsj  jhgsjdg djhgdsjg',NULL,3);

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `id_krs` varchar(8) NOT NULL,
  `nim` varchar(8) DEFAULT NULL,
  `id_matkul` varchar(8) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `ruangan` varchar(8) DEFAULT NULL,
  `nip` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_krs`),
  KEY `nim` (`nim`),
  KEY `id_matkul` (`id_matkul`),
  KEY `nip_dosen` (`nip`),
  CONSTRAINT `id_matkul` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`),
  CONSTRAINT `nim` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  CONSTRAINT `nip_dosen` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `krs` */

insert  into `krs`(`id_krs`,`nim`,`id_matkul`,`hari`,`jam`,`ruangan`,`nip`) values ('1','10114453','2','senin','09:15:00','R5403','41277006005');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nim` varchar(8) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `fakultas` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `thn_msk` year(4) NOT NULL,
  `kls_angkatan` varchar(10) NOT NULL,
  `photo_url` varchar(256) NOT NULL,
  `semester_sekarang` int(11) NOT NULL,
  `nip` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `nip_dosen_wali` (`nip`),
  CONSTRAINT `nip_dosen_wali` FOREIGN KEY (`nip`) REFERENCES `dosen_wali` (`nip`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`nim`,`nama_mhs`,`fakultas`,`jurusan`,`thn_msk`,`kls_angkatan`,`photo_url`,`semester_sekarang`,`nip`) values ('10114453','Mike Aria Dwiputri Santoso','Teknik dan Ilmu Komputer','Teknik Informatika',2014,'IF-1','',6,'41277006005');

/*Table structure for table `matkul` */

DROP TABLE IF EXISTS `matkul`;

CREATE TABLE `matkul` (
  `id_matkul` varchar(8) NOT NULL,
  `nama_matkul` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_matkul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `matkul` */

insert  into `matkul`(`id_matkul`,`nama_matkul`) values ('1','Algoritma dan Pemrograman'),('2','Kalkulus'),('3','Fisika'),('4','Aplikasi IT');

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

/*Table structure for table `status_aktif` */

DROP TABLE IF EXISTS `status_aktif`;

CREATE TABLE `status_aktif` (
  `id_status` varchar(8) NOT NULL,
  `nim` varchar(8) DEFAULT NULL,
  `semester` int(2) DEFAULT NULL,
  `status` set('Aktif','Tidak Aktif') DEFAULT NULL,
  `tgl_perwalian` datetime DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id_status`),
  KEY `nim_status` (`nim`),
  CONSTRAINT `nim_status` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `status_aktif` */

insert  into `status_aktif`(`id_status`,`nim`,`semester`,`status`,`tgl_perwalian`,`keterangan`) values ('1','10114453',7,'Aktif','2017-09-06 11:20:14','hgjjhvbvjh bfhf hjgjj uigjg uggjjk');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
