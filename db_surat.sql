/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.19-MariaDB : Database - db_surat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_surat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_surat`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id_admin`,`username`,`password`) values 
(111,'admin','admin');

/*Table structure for table `cetak` */

DROP TABLE IF EXISTS `cetak`;

CREATE TABLE `cetak` (
  `no_cetak` int(11) NOT NULL,
  `kode_surat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_cetak`),
  KEY `kode_surat` (`kode_surat`),
  CONSTRAINT `cetak_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `surat_keluar` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cetak_ibfk_2` FOREIGN KEY (`kode_surat`) REFERENCES `surat_masuk` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cetak` */

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `no_laporan` int(11) NOT NULL,
  `kode_surat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_laporan`),
  KEY `kode_surat` (`kode_surat`),
  CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `surat_keluar` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`kode_surat`) REFERENCES `surat_masuk` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `laporan` */

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pegawai` */

insert  into `pegawai`(`nip`,`nama`,`jabatan`) values 
('2145501','Sandi Ando','Staff IT'),
('2144607','Rizqyanto','Admin');

/*Table structure for table `penduduk` */

DROP TABLE IF EXISTS `penduduk`;

CREATE TABLE `penduduk` (
  `id_penduduk` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jenkel` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penduduk` */

insert  into `penduduk`(`id_penduduk`,`nama`,`jenkel`,`tempat_lahir`,`tgl_lahir`) values 
('340207','Mufliyadi','Laki-Laki','Bantul','1994-06-14'),
('357091','Cindyati','Perempuan','Magelang','1999-08-21');

/*Table structure for table `surat_keluar` */

DROP TABLE IF EXISTS `surat_keluar`;

CREATE TABLE `surat_keluar` (
  `kode_surat` varchar(50) NOT NULL,
  `tgl_kirim` datetime DEFAULT NULL,
  `isi_surat` varchar(50) DEFAULT NULL,
  `kepada` varchar(50) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_surat`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `surat_keluar_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `surat_keluar` */

insert  into `surat_keluar`(`kode_surat`,`tgl_kirim`,`isi_surat`,`kepada`,`id_admin`) values 
('K001','2020-04-16 17:56:51','Pengesahan','Suradi',111),
('K002','2020-05-16 17:57:57','Legalisir','Ahmad Harlan',111);

/*Table structure for table `surat_masuk` */

DROP TABLE IF EXISTS `surat_masuk`;

CREATE TABLE `surat_masuk` (
  `kode_surat` varchar(50) NOT NULL,
  `tgl_input` date DEFAULT NULL,
  `isi_ringkasan` varchar(50) DEFAULT NULL,
  `dari` varchar(50) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_surat`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `surat_masuk` */

insert  into `surat_masuk`(`kode_surat`,`tgl_input`,`isi_ringkasan`,`dari`,`tgl_surat`,`id_admin`) values 
('M001','2020-05-14','Undangan','Bupati Bantul','2020-05-23',111),
('M002','2020-05-16','Legalisir','Ahmad Harlan','2020-05-18',111);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
