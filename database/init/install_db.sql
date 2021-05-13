  /*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS employees;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `col1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
INSERT INTO employees(id,create_time,update_time,col1) VALUES(1,NULL,NULL,'Nathan'),(2,NULL,NULL,'Krasney');