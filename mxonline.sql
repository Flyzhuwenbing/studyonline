-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 课程资源',9,'add_courseresource'),(26,'Can change 课程资源',9,'change_courseresource'),(27,'Can delete 课程资源',9,'delete_courseresource'),(28,'Can add 章节',10,'add_lesson'),(29,'Can change 章节',10,'change_lesson'),(30,'Can delete 章节',10,'delete_lesson'),(31,'Can add 视频',11,'add_video'),(32,'Can change 视频',11,'change_video'),(33,'Can delete 视频',11,'delete_video'),(34,'Can add 课程',12,'add_course'),(35,'Can change 课程',12,'change_course'),(36,'Can delete 课程',12,'delete_course'),(37,'Can add 教师',13,'add_teacher'),(38,'Can change 教师',13,'change_teacher'),(39,'Can delete 教师',13,'delete_teacher'),(40,'Can add 课程机构',14,'add_courseorg'),(41,'Can change 课程机构',14,'change_courseorg'),(42,'Can delete 课程机构',14,'delete_courseorg'),(43,'Can add 城市',15,'add_citydict'),(44,'Can change 城市',15,'change_citydict'),(45,'Can delete 城市',15,'delete_citydict'),(46,'Can add 用户咨询',16,'add_useask'),(47,'Can change 用户咨询',16,'change_useask'),(48,'Can delete 用户咨询',16,'delete_useask'),(49,'Can add 课程评论',17,'add_coursecomments'),(50,'Can change 课程评论',17,'change_coursecomments'),(51,'Can delete 课程评论',17,'delete_coursecomments'),(52,'Can add 用户课程',18,'add_usercourse'),(53,'Can change 用户课程',18,'change_usercourse'),(54,'Can delete 用户课程',18,'delete_usercourse'),(55,'Can add 用户收藏',19,'add_userfavorite'),(56,'Can change 用户收藏',19,'change_userfavorite'),(57,'Can delete 用户收藏',19,'delete_userfavorite'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',12,'view_course'),(66,'Can view 课程资源',9,'view_courseresource'),(67,'Can view 章节',10,'view_lesson'),(68,'Can view 视频',11,'view_video'),(69,'Can view 课程评论',17,'view_coursecomments'),(70,'Can view 用户咨询',16,'view_useask'),(71,'Can view 用户课程',18,'view_usercourse'),(72,'Can view 用户收藏',19,'view_userfavorite'),(73,'Can view 用户消息',20,'view_usermessage'),(74,'Can view 城市',15,'view_citydict'),(75,'Can view 课程机构',14,'view_courseorg'),(76,'Can view 教师',13,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_userprofile'),(81,'Can add User Widget',21,'add_userwidget'),(82,'Can change User Widget',21,'change_userwidget'),(83,'Can delete User Widget',21,'delete_userwidget'),(84,'Can add log entry',22,'add_log'),(85,'Can change log entry',22,'change_log'),(86,'Can delete log entry',22,'delete_log'),(87,'Can add Bookmark',23,'add_bookmark'),(88,'Can change Bookmark',23,'change_bookmark'),(89,'Can delete Bookmark',23,'delete_bookmark'),(90,'Can add User Setting',24,'add_usersettings'),(91,'Can change User Setting',24,'change_usersettings'),(92,'Can delete User Setting',24,'delete_usersettings'),(93,'Can view Bookmark',23,'view_bookmark'),(94,'Can view log entry',22,'view_log'),(95,'Can view User Setting',24,'view_usersettings'),(96,'Can view User Widget',21,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_notes` varchar(300) NOT NULL,
  `learned` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'python入门','python入门','python入门','cj',0,0,0,'courses/2017/11/540e57300001d6d906000338-240-135.jpg',0,'2017-11-12 15:27:00.000000',2,'web后端开发','',NULL,'','',0),(2,'MySQL5.7','MySQL5.7','MySQL5.7','zj',0,0,0,'courses/2017/11/mysql.jpg',1,'2017-11-13 10:39:00.000000',1,'web后端开发','',NULL,'','',0),(3,'python文件处理','python文件处理','python文件处理','gj',0,0,0,'courses/2017/11/python文件处理.jpg',0,'2017-11-13 10:41:00.000000',7,'web后端开发','',NULL,'','',0),(4,'python错误和异常','python错误和异常','python错误和异常','cj',0,0,0,'courses/2017/11/python错误和异常.jpg',1,'2017-11-13 10:42:00.000000',1,'web后端开发','',NULL,'','',0),(5,'python面向对象','python面向对象','python面向对象','cj',0,0,0,'courses/2017/11/python面向对象.jpg',0,'2017-11-13 10:42:00.000000',3,'web后端开发','',NULL,'','',0),(6,'JAVA入门','JAVA入门','JAVA入门','cj',0,0,0,'courses/2017/11/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg',0,'2017-11-13 10:43:00.000000',9,'web后端开发','',NULL,'','',0),(7,'xadmin进阶开发','xadmin进阶开发','xadmin进阶开发','gj',0,0,0,'courses/2017/11/540e57300001d6d906000338-240-135_Z3HIQ2t.jpg',0,'2017-11-13 10:43:00.000000',5,'web后端开发','',NULL,'','',0),(8,'python入门2','python入门2','python入门2','cj',0,0,0,'courses/2017/11/540e57300001d6d906000338-240-135_MSIqfvw.jpg',2,'2017-11-13 10:44:00.000000',4,'web后端开发','',NULL,'','',0),(9,'python错误和异常2','python错误和异常2','python错误和异常2','gj',0,0,0,'courses/2017/11/python错误和异常_aL6wZhF.jpg',25,'2017-11-13 10:45:00.000000',2,'web后端开发','python',NULL,'','',0),(10,'python面向对象2','python面向对象2','python面向对象2','gj',0,0,0,'courses/2017/11/python面向对象_fqvW6cG.jpg',25,'2017-11-13 10:46:00.000000',7,'web后端开发','python',2,'计算机基础 数据库','面向对象思想与应用',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'面向对象','course/resource/2017/m/media.zip','2017-11-13 18:23:00.000000',10);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一章 基础知识','2017-11-13 17:56:00.000000',10),(2,'第二章 进阶开发','2017-11-13 17:57:00.000000',10);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 面向对象','2017-11-13 18:03:00.000000',1,'https://www.liaoxuefeng.com',0),(2,'1.2  类和实例','2017-11-13 18:05:00.000000',1,'https://www.liaoxuefeng.com',0),(3,'2.1 访问限制','2017-11-13 18:06:00.000000',2,'https://www.liaoxuefeng.com',0),(4,'2.2 继承和多态','2017-11-13 18:06:00.000000',2,'https://www.liaoxuefeng.com',0);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-11-24 10:45:10.972977','1','Banner object',1,'[{\"added\": {}}]',7,1),(2,'2017-11-24 10:45:55.536607','1','Banner object',2,'[{\"changed\": {\"fields\": [\"title\", \"image\", \"index\"]}}]',7,1),(3,'2017-11-24 10:46:08.979318','1','Banner object',2,'[{\"changed\": {\"fields\": [\"title\", \"image\", \"index\"]}}]',7,1),(4,'2017-11-24 10:46:14.402501','1','Banner object',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',7,1),(5,'2017-11-24 10:46:24.214181','1','Banner object',2,'[{\"changed\": {\"fields\": [\"image\", \"index\"]}}]',7,1),(6,'2017-11-24 10:46:38.237909','1','Banner object',2,'[{\"changed\": {\"fields\": [\"title\", \"image\", \"index\"]}}]',7,1),(7,'2017-11-24 10:46:51.953968','1','Banner object',3,'',7,1),(8,'2017-11-24 10:47:11.998811','2','Banner object',1,'[{\"added\": {}}]',7,1),(9,'2017-11-24 10:47:31.856523','3','Banner object',1,'[{\"added\": {}}]',7,1),(10,'2017-11-24 10:47:47.673934','4','Banner object',1,'[{\"added\": {}}]',7,1),(11,'2017-11-24 10:48:04.646100','5','Banner object',1,'[{\"added\": {}}]',7,1),(12,'2017-11-24 10:48:19.219078','6','Banner object',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(12,'courses','course'),(9,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(17,'operation','coursecomments'),(16,'operation','useask'),(18,'operation','usercourse'),(19,'operation','userfavorite'),(20,'operation','usermessage'),(15,'organization','citydict'),(14,'organization','courseorg'),(13,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','userprofile'),(23,'xadmin','bookmark'),(22,'xadmin','log'),(24,'xadmin','usersettings'),(21,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-02 13:07:26.687716'),(2,'contenttypes','0002_remove_content_type_name','2017-11-02 13:07:29.007595'),(3,'auth','0001_initial','2017-11-02 13:07:33.897677'),(4,'auth','0002_alter_permission_name_max_length','2017-11-02 13:07:34.813445'),(5,'auth','0003_alter_user_email_max_length','2017-11-02 13:07:34.869469'),(6,'auth','0004_alter_user_username_opts','2017-11-02 13:07:34.924552'),(7,'auth','0005_alter_user_last_login_null','2017-11-02 13:07:34.978353'),(8,'auth','0006_require_contenttypes_0002','2017-11-02 13:07:35.024908'),(9,'auth','0007_alter_validators_add_error_messages','2017-11-02 13:07:35.081900'),(10,'auth','0008_alter_user_username_max_length','2017-11-02 13:07:35.135945'),(11,'users','0001_initial','2017-11-02 13:07:40.564363'),(12,'admin','0001_initial','2017-11-02 13:07:42.821089'),(13,'admin','0002_logentry_remove_auto_add','2017-11-02 13:07:42.989459'),(14,'sessions','0001_initial','2017-11-02 13:07:43.670464'),(15,'courses','0001_initial','2017-11-02 15:30:10.361000'),(16,'operation','0001_initial','2017-11-02 15:30:17.846295'),(17,'organization','0001_initial','2017-11-02 15:30:21.350510'),(18,'users','0002_banner_emailverifyrecord','2017-11-02 15:30:22.205463'),(19,'users','0003_auto_20171103_2123','2017-11-03 21:23:48.305315'),(20,'xadmin','0001_initial','2017-11-03 23:15:32.962458'),(21,'xadmin','0002_log','2017-11-03 23:15:36.042080'),(22,'xadmin','0003_auto_20160715_0100','2017-11-03 23:15:37.055075'),(23,'captcha','0001_initial','2017-11-08 22:08:36.333856'),(24,'courses','0002_auto_20171108_2207','2017-11-08 22:08:36.631382'),(25,'users','0004_auto_20171108_2207','2017-11-08 22:08:37.175024'),(26,'organization','0002_auto_20171111_1730','2017-11-11 17:31:01.406151'),(27,'organization','0003_auto_20171112_0913','2017-11-12 09:14:32.684562'),(28,'courses','0003_course_course_org','2017-11-12 15:14:26.088200'),(29,'organization','0004_teacher_image','2017-11-12 21:27:08.020179'),(30,'courses','0004_course_category','2017-11-13 14:39:30.465078'),(31,'courses','0005_course_tag','2017-11-13 16:28:59.815878'),(32,'courses','0006_video_url','2017-11-13 18:03:31.712327'),(33,'courses','0007_video_learn_times','2017-11-13 18:17:57.430600'),(34,'courses','0008_course_teacher','2017-11-13 18:43:45.233737'),(35,'courses','0009_auto_20171113_1855','2017-11-13 18:55:17.079542'),(36,'organization','0005_teacher_age','2017-11-14 14:18:46.439545'),(37,'users','0002_auto_20171115_1547','2017-11-15 15:47:38.631017'),(38,'users','0003_auto_20171115_1557','2017-11-15 16:02:14.951988'),(39,'users','0004_auto_20171115_1558','2017-11-15 16:02:15.225501'),(40,'users','0005_auto_20171115_1559','2017-11-15 16:02:16.479269'),(41,'users','0006_auto_20171115_1602','2017-11-15 16:02:17.585392'),(42,'courses','0010_course_is_banner','2017-11-24 10:28:34.141681'),(43,'organization','0006_auto_20171124_1114','2017-11-24 11:14:39.988268');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('s6d994nmku6e502cvsp78gkga6ojxz2k','MDU2YTAwODEwN2Q2ZmI4Y2Q5NDJkYTYwZGZlOWJkZDczODU2MDNmYTp7IkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjA2OTZiYWQwMmE3ZTc2NDRlZjUzNGM0NWI5NWYyYzRiNmUyMTc1NjUifQ==','2017-12-09 08:22:59.592172'),('uhs77tfeb5flxu81jfjfl3d47lnkl6v9','NDZmODE2Y2M0YjU1YTZiMzdhOTJmMWE0MmNhMjVkNjBjOTUxMmNiOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkMzFjYmNlMWM0MWJiZDA0NjQ2ODQwM2M3N2Q1Yjk1MDViMTA4ZTcwIn0=','2017-11-21 22:30:43.766349');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (3,'很好','2017-11-13 23:53:00.000000',10,1),(5,'谢谢','2017-11-13 23:56:00.000000',10,1),(6,'django很好','2017-11-14 00:01:32.876963',10,1),(7,'差点放弃','2017-11-14 00:02:18.418055',10,1),(8,'再试下','2017-11-14 00:03:47.359832',10,1),(9,'为啥','2017-11-14 00:10:11.137999',10,1),(10,'会出现偶尔不能评论的情况','2017-11-14 00:13:24.950551',10,1),(11,'关于json及js时注意引号与强制刷新的问题','2017-11-14 00:22:04.480888',10,1),(12,'的撒','2017-11-14 00:22:04.505089',10,1),(13,'得到','2017-11-14 00:26:10.545506',10,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_useask`
--

DROP TABLE IF EXISTS `operation_useask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_useask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_useask`
--

LOCK TABLES `operation_useask` WRITE;
/*!40000 ALTER TABLE `operation_useask` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_useask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (2,'2017-11-13 14:55:00.000000',10,1),(3,'2017-11-14 11:20:04.326826',8,1),(4,'2017-11-15 23:22:47.130472',9,12),(5,'2017-11-15 23:22:56.074396',10,12);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (24,9,1,'2017-11-13 16:51:49.328712',1),(31,10,1,'2017-11-13 23:16:55.830359',1),(36,2,2,'2017-11-14 16:14:37.353373',1),(38,9,1,'2017-11-16 09:24:37.798474',12),(39,2,2,'2017-11-16 09:24:39.416605',12),(41,10,1,'2017-11-16 10:41:27.586120',12),(42,2,3,'2017-11-16 11:04:38.659676',12),(43,2,3,'2017-11-24 09:54:47.476989',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2017-11-11 17:11:00.000000'),(2,'上海市','上海市','2017-11-11 17:12:00.000000'),(3,'广州市','广州市','2017-11-11 17:12:00.000000'),(4,'深圳市','深圳市','2017-11-11 17:12:00.000000'),(5,'天津市','天津市','2017-11-11 17:12:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'实验楼','实验楼是以实验为核心的IT在线教育网站，网站为IT学习者提供实践操作实验环境和全面的IT课程。是成都琛石科技有限公司旗下网站。',8,0,'org/2017/11/shiyanlou.jpg','北京市','2017-11-11 17:14:00.000000',1,'pxjg',0,0,'全国知名'),(2,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n   慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。[1] \r\n   4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2017/11/imooc.png','北京市','2017-11-11 17:32:00.000000',1,'pxjg',0,0,'全国知名'),(3,'黑马程序员','“中关村黑马程序员训练营”是由传智播客联合中关村软件园、CSDN，并委托传智播客进行教学实施的软件开发高端培训机构，致力于服务各大软件企业，解决当前软件开发技术飞速发展下企业招不到优秀人才的困扰。 目前，“中关村黑马程序员训练营”已成长为行业“学员质量好、课程内容深、企业满意”的移动开发高端训练基地，并被评为中关村软件园重点扶持人才企业。',0,0,'org/2017/11/黑马程序员.jpg','深圳市','2017-11-11 17:34:00.000000',4,'pxjg',0,0,'全国知名'),(4,'达内','达内，全称达内时代科技集团有限公司，是中国高端IT培训的领先品牌，致力于培养面向电信和金融领域的Java、C++、C#/.Net、软件测试、嵌入式、PHP、android等方面的中高端软件人才。',0,0,'org/2017/11/danei.jpg','上海市','2017-11-11 17:38:00.000000',2,'pxjg',0,0,'全国知名'),(5,'北京大学','北京大学，简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是第一个以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者。',0,0,'org/2017/11/bjdx.jpg','北京市','2017-11-11 17:39:00.000000',1,'gx',0,0,'全国知名'),(6,'清华大学','清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制的全国重点大学，位列“双一流”[1]  、“211工程”、“985工程”，入选“珠峰计划”、“2011计划”、“111计划”、“卓越工程师教育培养计划”、“卓越法律人才教育培养计划”、“卓越医生教育培养计划”，为九校联盟（C9）、中国大学校长联谊会、东亚研究型大学协会、环太平洋大学联盟、亚洲大学联盟、清华—剑桥—MIT低碳大学联盟成员',0,0,'org/2017/11/qhdx-logo.png','北京市','2017-11-11 17:40:00.000000',1,'gx',0,0,'全国知名'),(7,'无痕空间','个人博客学习空间',0,0,'org/2017/11/wuhen.jpg','广州市','2017-11-11 17:42:00.000000',3,'gr',0,0,'全国知名'),(8,'天津大学','天津大学（TianjinUniversity），简称“天大”，坐落于历史文化名城、中国北方经济中心天津，其前身为北洋大学，始建于1895年10月2日，是中国第一所现代大学，开中国现代高等教育之先河，素以“实事求是”的校训、“严谨治学”的校风和“爱国奉献”的传统享誉海内外。1951年,北洋大学与河北工学院合并定名为“天津大学”，沿用至今',0,0,'org/2017/11/tjdx.jpg','天津市','2017-11-11 17:45:00.000000',5,'gx',0,0,'全国知名'),(9,'静觅','个人博客爬虫实战',0,0,'org/2017/11/jingmi.jpg','上海市','2017-11-11 17:47:00.000000',2,'gr',0,0,'全国知名'),(10,'crossin','python初学者入门指导',0,0,'org/2017/11/crossin.jpg','上海市','2017-11-11 17:49:00.000000',2,'gr',0,0,'全国知名');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_year` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (2,'Fly',1,'xxxx','xxxx','xxxx',2,1,'2017-11-12 15:07:00.000000',2,'teachers/2017/11/aobama.png',18),(3,'无痕空间',1,'xxxx','xxxx','无',0,0,'2017-11-14 14:25:00.000000',7,'teachers/2017/11/python面向对象.jpg',18);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (2,'第一','banner/2017/11/57a801860001c34b12000460_fU62cmA.jpg','https://www.imooc.com',1,'2017-11-24 10:46:00.000000'),(3,'二','banner/2017/11/57a801860001c34b12000460_z4Vb8zl_ZTq6kDH.jpg','https://www.imooc.com',2,'2017-11-24 10:47:00.000000'),(4,'三','banner/2017/11/57aa86a0000145c512000460_jDAJtXQ.jpg','https://www.imooc.com',3,'2017-11-24 10:47:00.000000'),(5,'四','banner/2017/11/57aa86a0000145c512000460_GXIBATC_CkMKgSJ.jpg','https://www.imooc.com',4,'2017-11-24 10:47:00.000000'),(6,'五','banner/2017/11/57aa86a0000145c512000460_nMwvoQD_ZwhrmKX.jpg','https://www.imooc.com',5,'2017-11-24 10:48:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'admin','xxx@qq.com','register','2017-11-04 00:15:00.000000'),(2,'U0Ebt1DoZpblVpBp','wenbing.zhu@outlook.com','register','2017-11-09 23:07:55.231337'),(3,'QpTOOxSaI1zsyvhn','13534116718m@sina.cn','register','2017-11-09 23:57:34.650811'),(4,'oteGvZFxZy17oQbI','1@1.com','register','2017-11-10 09:59:33.051640'),(5,'q4P5v7FJVhTjiv1P','1@1.com','register','2017-11-10 10:10:04.361935'),(6,'J9qpCPgECE5HcvMd','2@2.com','register','2017-11-10 15:11:19.761263'),(7,'iSOfJh00KPnoXo8n','13534116718@sina.cn','register','2017-11-10 16:34:17.227743'),(8,'x7IOkUOhtH3Xy1fm','13534116718@sina.cn','forget','2017-11-10 21:49:44.272488'),(9,'3X7uBNCw30v6fP5S','13534116718@sina.cn','forget','2017-11-10 21:51:02.981556'),(10,'7hrn14j7N1h6vx6O','958442436@qq.com','register','2017-11-15 14:06:47.966354'),(11,'atnj2uD7oGPGvBhp','13534116718@sina.cn','register','2017-11-15 15:37:42.206308'),(13,'o2CL','958442436@qq.com','update_email','2017-11-15 16:07:16.994146');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$36000$6PkkSLvZ0nGg$mTBt7tB7LOt0Uqo76O6MocQaqKcG16dhj8bl3G9Tq/8=','2017-11-25 08:14:06.632434',1,'Fly','','','wenbing.zhu@outlook.com',1,1,'2017-11-03 21:24:00.000000','Fly','2017-11-07','male','深圳市','13534123214','image/2017/11/default_big_14.png'),(3,'pbkdf2_sha256$36000$hICQGRxTRtfv$pq6z8F5ayro9uLtgXTTivmeX7Y1uhPstIhAPpqqWdlc=',NULL,0,'13534116718m@sina.cn','','','13534116718m@sina.cn',0,1,'2017-11-09 23:57:34.473071','',NULL,'female','',NULL,'image/default.png'),(4,'pbkdf2_sha256$36000$ECvVDHtiWVI3$3hTKQWTo8WM3pozozuaYDBLqHkR28KrLT6J7ofdPLFM=',NULL,0,'1@1.com','','','1@1.com',0,1,'2017-11-10 09:59:32.951890','',NULL,'female','',NULL,'image/default.png'),(9,'pbkdf2_sha256$36000$hscfyDnooWSo$EAFruVUc/WQ4pUK4JRVW/ukdsDeFijueOpyyJTA8+JI=',NULL,0,'2@2.com','','','2@2.com',0,1,'2017-11-10 15:11:19.683402','',NULL,'female','',NULL,'image/default.png'),(12,'pbkdf2_sha256$36000$J0YjScXBZ2DM$E91tHq+ImbFNQXN5L4YNRtDDEI5W1r1m7Q7DX+9e/8E=','2017-11-24 11:25:11.780353',0,'13534116718@sina.cn','','','958442436@qq.com',0,1,'2017-11-15 15:37:42.028070','了无痕','2013-11-01','male','深圳','1830000000','image/2017/11/default_middile_8.png'),(13,'pbkdf2_sha256$36000$xY003NkOoAo8$fFYxB9Y/3XJILowCJE1z/q+xFulk19xjvv/0qF0Ghk8=','2017-11-24 14:32:58.124159',1,'zhuwenbing','','','wenbing@zhu.com',1,1,'2017-11-24 14:31:16.861267','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2017-11-04 00:22:03.323864','127.0.0.1','1','EmailVerifyRecord object','create','已添加。',8,1),(2,'2017-11-11 17:12:18.381315','127.0.0.1','1','CityDict object','create','已添加。',15,1),(3,'2017-11-11 17:12:35.429402','127.0.0.1','2','CityDict object','create','已添加。',15,1),(4,'2017-11-11 17:12:49.511926','127.0.0.1','3','CityDict object','create','已添加。',15,1),(5,'2017-11-11 17:12:56.462206','127.0.0.1','4','CityDict object','create','已添加。',15,1),(6,'2017-11-11 17:13:08.919635','127.0.0.1','5','CityDict object','create','已添加。',15,1),(7,'2017-11-11 17:22:18.206151','127.0.0.1','1','CourseOrg object','create','已添加。',14,1),(8,'2017-11-11 17:34:30.423075','127.0.0.1','2','慕课网','create','已添加。',14,1),(9,'2017-11-11 17:38:13.600694','127.0.0.1','3','黑马程序员','create','已添加。',14,1),(10,'2017-11-11 17:39:48.157123','127.0.0.1','4','达内','create','已添加。',14,1),(11,'2017-11-11 17:40:47.299075','127.0.0.1','5','北京大学','create','已添加。',14,1),(12,'2017-11-11 17:41:31.869437','127.0.0.1','6','清华大学','create','已添加。',14,1),(13,'2017-11-11 17:44:44.804437','127.0.0.1','7','无痕空间','create','已添加。',14,1),(14,'2017-11-11 17:46:22.898220','127.0.0.1','8','天津大学','create','已添加。',14,1),(15,'2017-11-11 17:49:43.011993','127.0.0.1','9','静觅','create','已添加。',14,1),(16,'2017-11-11 17:51:07.953488','127.0.0.1','10','crossin','create','已添加。',14,1),(17,'2017-11-11 22:50:26.423383','127.0.0.1','10','crossin','change','修改 image',14,1),(18,'2017-11-11 22:51:02.459979','127.0.0.1','9','静觅','change','修改 image',14,1),(19,'2017-11-11 22:51:28.054649','127.0.0.1','8','天津大学','change','修改 image',14,1),(20,'2017-11-11 22:51:45.146546','127.0.0.1','7','无痕空间','change','修改 image',14,1),(21,'2017-11-11 22:52:10.294573','127.0.0.1','6','清华大学','change','修改 image',14,1),(22,'2017-11-11 22:52:22.143743','127.0.0.1','5','北京大学','change','修改 image',14,1),(23,'2017-11-11 22:52:41.369295','127.0.0.1','4','达内','change','修改 image',14,1),(24,'2017-11-11 22:52:54.237149','127.0.0.1','3','黑马程序员','change','修改 image',14,1),(25,'2017-11-11 22:53:06.954626','127.0.0.1','2','慕课网','change','修改 image',14,1),(26,'2017-11-11 22:53:19.740886','127.0.0.1','1','实验楼','change','修改 image',14,1),(27,'2017-11-12 15:06:07.763777','127.0.0.1','1','Teacher object','create','已添加。',13,1),(28,'2017-11-12 15:07:45.151506','127.0.0.1','2','Fly','create','已添加。',13,1),(29,'2017-11-12 16:17:56.993064','127.0.0.1','1','python入门','create','已添加。',12,1),(30,'2017-11-12 21:28:21.312003','127.0.0.1','2','Fly','change','修改 image',13,1),(31,'2017-11-12 21:35:59.108748','127.0.0.1',NULL,'','delete','批量删除 1 个 教师',NULL,1),(32,'2017-11-13 10:41:02.290170','127.0.0.1','2','MySQL5.7','create','已添加。',12,1),(33,'2017-11-13 10:42:07.922942','127.0.0.1','3','python文件处理','create','已添加。',12,1),(34,'2017-11-13 10:42:51.295719','127.0.0.1','4','python错误和异常','create','已添加。',12,1),(35,'2017-11-13 10:43:18.664257','127.0.0.1','5','python面向对象','create','已添加。',12,1),(36,'2017-11-13 10:43:50.234286','127.0.0.1','6','JAVA入门','create','已添加。',12,1),(37,'2017-11-13 10:44:36.194390','127.0.0.1','7','xadmin进阶开发','create','已添加。',12,1),(38,'2017-11-13 10:45:15.376494','127.0.0.1','8','python入门2','create','已添加。',12,1),(39,'2017-11-13 10:45:56.358461','127.0.0.1','9','python错误和异常2','create','已添加。',12,1),(40,'2017-11-13 10:46:38.954661','127.0.0.1','10','python面向对象2','create','已添加。',12,1),(41,'2017-11-13 14:54:31.491751','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(42,'2017-11-13 14:54:59.756341','127.0.0.1','1','UserCourse object','create','已添加。',18,1),(43,'2017-11-13 14:55:33.418883','127.0.0.1',NULL,'','delete','批量删除 1 个 用户课程',NULL,1),(44,'2017-11-13 14:55:47.852261','127.0.0.1','2','UserCourse object','create','已添加。',18,1),(45,'2017-11-13 15:00:03.114568','127.0.0.1','1','Fly','change','修改 last_login，nick_name，gender，address，mobile 和 image',6,1),(46,'2017-11-13 16:36:12.274379','127.0.0.1','10','python面向对象2','change','修改 image 和 tag',12,1),(47,'2017-11-13 16:36:34.912599','127.0.0.1','9','python错误和异常2','change','修改 image 和 tag',12,1),(48,'2017-11-13 17:57:16.880512','127.0.0.1','1','Lesson object','create','已添加。',10,1),(49,'2017-11-13 17:57:32.390658','127.0.0.1','2','Lesson object','create','已添加。',10,1),(50,'2017-11-13 18:05:19.887126','127.0.0.1','1','1.1 面向对象','create','已添加。',11,1),(51,'2017-11-13 18:06:05.543625','127.0.0.1','2','1.2  类和实例','create','已添加。',11,1),(52,'2017-11-13 18:06:33.543223','127.0.0.1','3','2.1 访问限制','create','已添加。',11,1),(53,'2017-11-13 18:06:54.267262','127.0.0.1','4','2.2 继承和多态','create','已添加。',11,1),(54,'2017-11-13 18:23:59.846786','127.0.0.1','1','CourseResource object','create','已添加。',9,1),(55,'2017-11-13 18:45:11.752877','127.0.0.1','10','python面向对象2','change','修改 teacher 和 image',12,1),(56,'2017-11-13 18:57:19.488232','127.0.0.1','10','python面向对象2','change','修改 image，course_notes 和 learned',12,1),(57,'2017-11-13 23:53:35.549089','127.0.0.1','2','CourseComments object','create','已添加。',17,1),(58,'2017-11-13 23:53:55.342169','127.0.0.1',NULL,'','delete','批量删除 1 个 课程评论',NULL,1),(59,'2017-11-13 23:54:14.965968','127.0.0.1','3','CourseComments object','create','已添加。',17,1),(60,'2017-11-13 23:56:22.588084','127.0.0.1','5','Fly','create','已添加。',17,1),(61,'2017-11-14 14:26:20.167633','127.0.0.1','3','无痕空间','create','已添加。',13,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'dashboard:home:pos','',13);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-25 10:36:47
