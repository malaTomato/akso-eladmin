-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: rm-wz9o5wuvhy1r7z35ito.mysql.rds.aliyuncs.com    Database: eladmin
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `code_column_config`
--

DROP TABLE IF EXISTS `code_column_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_column_config` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `form_show` bit(1) DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `key_type` varchar(255) DEFAULT NULL,
  `list_show` bit(1) DEFAULT NULL,
  `not_null` bit(1) DEFAULT NULL,
  `query_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date_annotation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`column_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_column_config`
--

LOCK TABLES `code_column_config` WRITE;
/*!40000 ALTER TABLE `code_column_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `code_column_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_gen_config`
--

DROP TABLE IF EXISTS `code_gen_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_gen_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`config_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_gen_config`
--

LOCK TABLES `code_gen_config` WRITE;
/*!40000 ALTER TABLE `code_gen_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `code_gen_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_app`
--

DROP TABLE IF EXISTS `mnt_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_app` (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) DEFAULT NULL COMMENT '备份路径',
  `port` int(255) DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) DEFAULT NULL COMMENT '部署脚本',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_app`
--

LOCK TABLES `mnt_app` WRITE;
/*!40000 ALTER TABLE `mnt_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_database`
--

DROP TABLE IF EXISTS `mnt_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_database` (
  `db_id` varchar(50) NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) NOT NULL COMMENT '账号',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_database`
--

LOCK TABLES `mnt_database` WRITE;
/*!40000 ALTER TABLE `mnt_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy`
--

DROP TABLE IF EXISTS `mnt_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_deploy` (
  `deploy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用编号',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  KEY `FK6sy157pseoxx4fmcqr1vnvvhy` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy`
--

LOCK TABLES `mnt_deploy` WRITE;
/*!40000 ALTER TABLE `mnt_deploy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy_history`
--

DROP TABLE IF EXISTS `mnt_deploy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_deploy_history` (
  `history_id` varchar(50) NOT NULL COMMENT 'ID',
  `app_name` varchar(255) NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) NOT NULL COMMENT '部署用户',
  `ip` varchar(20) NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint(20) DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署历史管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy_history`
--

LOCK TABLES `mnt_deploy_history` WRITE;
/*!40000 ALTER TABLE `mnt_deploy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy_server`
--

DROP TABLE IF EXISTS `mnt_deploy_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_deploy_server` (
  `deploy_id` bigint(20) NOT NULL COMMENT '部署ID',
  `server_id` bigint(20) NOT NULL COMMENT '服务ID',
  PRIMARY KEY (`deploy_id`,`server_id`) USING BTREE,
  KEY `FKeaaha7jew9a02b3bk9ghols53` (`server_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用与服务器关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy_server`
--

LOCK TABLES `mnt_deploy_server` WRITE;
/*!40000 ALTER TABLE `mnt_deploy_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_server`
--

DROP TABLE IF EXISTS `mnt_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnt_server` (
  `server_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`server_id`) USING BTREE,
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务器管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_server`
--

LOCK TABLES `mnt_server` WRITE;
/*!40000 ALTER TABLE `mnt_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级部门',
  `sub_count` int(5) DEFAULT '0' COMMENT '子部门数目',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `dept_sort` int(5) DEFAULT '999' COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `inx_pid` (`pid`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (2,7,1,'研发部',3,'','admin','admin','2019-03-25 09:15:32','2020-08-02 14:48:47'),(5,7,0,'运维部',4,'','admin','admin','2019-03-25 09:20:44','2020-05-17 14:27:27'),(6,8,0,'测试部',6,'','admin','admin','2019-03-25 09:52:18','2020-06-08 11:59:21'),(7,NULL,2,'华南分部',0,'','admin','admin','2019-03-25 11:04:50','2020-06-08 12:08:56'),(8,NULL,2,'华北分部',1,'','admin','admin','2019-03-25 11:04:53','2020-05-14 12:54:00'),(15,8,0,'UI部门',7,'','admin','admin','2020-05-13 22:56:53','2020-05-14 12:54:13'),(17,2,0,'研发一组',999,'','admin','admin','2020-08-02 14:49:07','2020-08-02 14:49:07');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'user_status','用户状态',NULL,NULL,'2019-10-27 20:31:36',NULL),(4,'dept_status','部门状态',NULL,NULL,'2019-10-27 20:31:36',NULL),(5,'job_status','岗位状态',NULL,NULL,'2019-10-27 20:31:36',NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_detail`
--

DROP TABLE IF EXISTS `sys_dict_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `dict_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_detail`
--

LOCK TABLES `sys_dict_detail` WRITE;
/*!40000 ALTER TABLE `sys_dict_detail` DISABLE KEYS */;
INSERT INTO `sys_dict_detail` VALUES (1,1,'激活','true',1,NULL,NULL,'2019-10-27 20:31:36',NULL),(2,1,'禁用','false',2,NULL,NULL,NULL,NULL),(3,4,'启用','true',1,NULL,NULL,NULL,NULL),(4,4,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL),(5,5,'启用','true',1,NULL,NULL,NULL,NULL),(6,5,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL);
/*!40000 ALTER TABLE `sys_dict_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (8,'人事专员','',3,NULL,NULL,'2019-03-29 14:52:28',NULL),(10,'产品经理','',4,NULL,NULL,'2019-03-29 14:55:51',NULL),(11,'全栈开发','',2,NULL,'admin','2019-03-31 13:39:30','2020-05-05 11:33:43'),(12,'软件测试','',5,NULL,'admin','2019-03-31 13:39:43','2020-05-10 19:56:26');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `log_create_time_index` (`create_time`),
  KEY `inx_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3559 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (3537,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"app\",\"updateTime\":1618744765385,\"title\":\"调查问卷\",\"type\":0,\"subCount\":0,\"path\":\"/\",\"createBy\":\"admin\",\"createTime\":1618744765385,\"iFrame\":false,\"id\":118,\"menuSort\":999}','101.86.120.214',102,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:19:25'),(3538,'修改菜单','INFO','com.akso.modules.system.rest.MenuController.update()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"app\",\"permission\":\"\",\"updateTime\":1618744765000,\"title\":\"调查问卷\",\"type\":0,\"subCount\":0,\"path\":\"question\",\"component\":\"\",\"createBy\":\"admin\",\"createTime\":1618744765000,\"iFrame\":false,\"id\":118,\"componentName\":\"\",\"menuSort\":999}','101.86.120.214',41,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:19:41'),(3539,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"list\",\"updateTime\":1618744842443,\"title\":\"文件用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"createBy\":\"admin\",\"createTime\":1618744842443,\"iFrame\":false,\"id\":119,\"menuSort\":999}','101.86.120.214',18,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:20:42'),(3540,'修改菜单','ERROR','com.akso.modules.system.rest.MenuController.update()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"list\",\"permission\":\"\",\"pid\":118,\"updateTime\":1618744842000,\"title\":\"文件用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"component\":\"\",\"createBy\":\"admin\",\"createTime\":1618744842000,\"iFrame\":false,\"id\":119,\"componentName\":\"\",\"menuSort\":999}','101.86.120.214',40,'admin','中国|上海|上海市|电信','Chrome 8','org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [uniq_name]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:296)\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:253)\n	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	at com.sun.proxy.$Proxy201.countByPid(Unknown Source)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.updateSubCnt(MenuServiceImpl.java:334)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.update(MenuServiceImpl.java:184)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$236eb49e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$93dd256a.update(<generated>)\n	at com.akso.modules.system.rest.MenuController.update(MenuController.java:129)\n	at com.akso.modules.system.rest.MenuController$$FastClassBySpringCGLIB$$48783bd8.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at com.akso.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.rest.MenuController$$EnhancerBySpringCGLIB$$9b45cf86.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:912)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:663)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at com.akso.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:59)\n	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:178)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3356)\n	at org.hibernate.persister.entity.AbstractEntityPersister.updateOrInsert(AbstractEntityPersister.java:3229)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3630)\n	at org.hibernate.action.internal.EntityUpdateAction.execute(EntityUpdateAction.java:146)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:604)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:478)\n	at org.hibernate.event.internal.AbstractFlushingEventListener.performExecutions(AbstractFlushingEventListener.java:356)\n	at org.hibernate.event.internal.DefaultAutoFlushEventListener.onAutoFlush(DefaultAutoFlushEventListener.java:50)\n	at org.hibernate.internal.SessionImpl.autoFlushIfRequired(SessionImpl.java:1415)\n	at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1501)\n	at org.hibernate.query.internal.AbstractProducedQuery.doList(AbstractProducedQuery.java:1537)\n	at org.hibernate.query.internal.AbstractProducedQuery.list(AbstractProducedQuery.java:1505)\n	at org.hibernate.query.internal.AbstractProducedQuery.getSingleResult(AbstractProducedQuery.java:1553)\n	at org.hibernate.query.criteria.internal.compile.CriteriaQueryTypeQueryAdapter.getSingleResult(CriteriaQueryTypeQueryAdapter.java:109)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution$SingleEntityExecution.doExecute(JpaQueryExecution.java:214)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:91)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:136)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:125)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:605)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	... 126 more\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'\' for key \'uniq_name\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:974)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1113)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1061)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeLargeUpdate(ClientPreparedStatement.java:1381)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdate(ClientPreparedStatement.java:1046)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.executeUpdate(PreparedStatementSpy.java:1080)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3253)\n	at com.alibaba.druid.filter.FilterAdapter.preparedStatement_executeUpdate(FilterAdapter.java:1092)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeUpdate(FilterEventAdapter.java:491)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3251)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeUpdate(PreparedStatementProxyImpl.java:194)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeUpdate(DruidPooledPreparedStatement.java:255)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:175)\n	... 154 more\n','2021-04-18 19:20:53'),(3541,'删除菜单','INFO','com.akso.modules.system.rest.MenuController.delete()','[119]','101.86.120.214',55,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:21:04'),(3542,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"Steve-Jobs\",\"pid\":118,\"updateTime\":1618744902442,\"title\":\"问卷用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"createBy\":\"admin\",\"createTime\":1618744902442,\"iFrame\":false,\"id\":120,\"menuSort\":999}','101.86.120.214',24,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:21:42'),(3543,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"menu\",\"pid\":118,\"updateTime\":1618744961446,\"title\":\"问卷记录\",\"type\":1,\"subCount\":0,\"path\":\"questionRecord\",\"createBy\":\"admin\",\"createTime\":1618744961446,\"iFrame\":false,\"id\":121,\"menuSort\":999}','101.86.120.214',22,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:22:41'),(3544,'修改角色菜单','INFO','com.akso.modules.system.rest.RoleController.updateMenu()','{\"level\":3,\"dataScope\":\"本级\",\"id\":1,\"menus\":[{\"subCount\":0,\"id\":33,\"menuSort\":999},{\"subCount\":0,\"id\":97,\"menuSort\":999},{\"subCount\":0,\"id\":34,\"menuSort\":999},{\"subCount\":0,\"id\":98,\"menuSort\":999},{\"subCount\":0,\"id\":35,\"menuSort\":999},{\"subCount\":0,\"id\":36,\"menuSort\":999},{\"subCount\":0,\"id\":37,\"menuSort\":999},{\"subCount\":0,\"id\":38,\"menuSort\":999},{\"subCount\":0,\"id\":39,\"menuSort\":999},{\"subCount\":0,\"id\":41,\"menuSort\":999},{\"subCount\":0,\"id\":116,\"menuSort\":999},{\"subCount\":0,\"id\":118,\"menuSort\":999},{\"subCount\":0,\"id\":120,\"menuSort\":999},{\"subCount\":0,\"id\":121,\"menuSort\":999},{\"subCount\":0,\"id\":1,\"menuSort\":999},{\"subCount\":0,\"id\":2,\"menuSort\":999},{\"subCount\":0,\"id\":3,\"menuSort\":999},{\"subCount\":0,\"id\":5,\"menuSort\":999},{\"subCount\":0,\"id\":6,\"menuSort\":999},{\"subCount\":0,\"id\":7,\"menuSort\":999},{\"subCount\":0,\"id\":9,\"menuSort\":999},{\"subCount\":0,\"id\":10,\"menuSort\":999},{\"subCount\":0,\"id\":11,\"menuSort\":999},{\"subCount\":0,\"id\":14,\"menuSort\":999},{\"subCount\":0,\"id\":15,\"menuSort\":999},{\"subCount\":0,\"id\":80,\"menuSort\":999},{\"subCount\":0,\"id\":18,\"menuSort\":999},{\"subCount\":0,\"id\":82,\"menuSort\":999},{\"subCount\":0,\"id\":19,\"menuSort\":999},{\"subCount\":0,\"id\":83,\"menuSort\":999},{\"subCount\":0,\"id\":21,\"menuSort\":999},{\"subCount\":0,\"id\":22,\"menuSort\":999},{\"subCount\":0,\"id\":23,\"menuSort\":999},{\"subCount\":0,\"id\":24,\"menuSort\":999},{\"subCount\":0,\"id\":90,\"menuSort\":999},{\"subCount\":0,\"id\":27,\"menuSort\":999},{\"subCount\":0,\"id\":28,\"menuSort\":999},{\"subCount\":0,\"id\":92,\"menuSort\":999},{\"subCount\":0,\"id\":93,\"menuSort\":999},{\"subCount\":0,\"id\":30,\"menuSort\":999},{\"subCount\":0,\"id\":94,\"menuSort\":999},{\"subCount\":0,\"id\":32,\"menuSort\":999}]}','101.86.120.214',88,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:23:15'),(3545,'修改菜单','ERROR','com.akso.modules.system.rest.MenuController.update()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"Steve-Jobs\",\"permission\":\"\",\"pid\":118,\"updateTime\":1618744902000,\"title\":\"问卷用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"component\":\"question/user/index\",\"createBy\":\"admin\",\"createTime\":1618744902000,\"iFrame\":false,\"id\":120,\"componentName\":\"\",\"menuSort\":999}','101.86.120.214',19,'admin','中国|上海|上海市|电信','Chrome 8','org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [uniq_name]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:296)\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:253)\n	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	at com.sun.proxy.$Proxy201.countByPid(Unknown Source)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.updateSubCnt(MenuServiceImpl.java:334)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.update(MenuServiceImpl.java:183)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$236eb49e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$93dd256a.update(<generated>)\n	at com.akso.modules.system.rest.MenuController.update(MenuController.java:129)\n	at com.akso.modules.system.rest.MenuController$$FastClassBySpringCGLIB$$48783bd8.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at com.akso.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.rest.MenuController$$EnhancerBySpringCGLIB$$9b45cf86.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:912)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:663)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at com.akso.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:59)\n	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:178)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3356)\n	at org.hibernate.persister.entity.AbstractEntityPersister.updateOrInsert(AbstractEntityPersister.java:3229)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3630)\n	at org.hibernate.action.internal.EntityUpdateAction.execute(EntityUpdateAction.java:146)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:604)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:478)\n	at org.hibernate.event.internal.AbstractFlushingEventListener.performExecutions(AbstractFlushingEventListener.java:356)\n	at org.hibernate.event.internal.DefaultAutoFlushEventListener.onAutoFlush(DefaultAutoFlushEventListener.java:50)\n	at org.hibernate.internal.SessionImpl.autoFlushIfRequired(SessionImpl.java:1415)\n	at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1501)\n	at org.hibernate.query.internal.AbstractProducedQuery.doList(AbstractProducedQuery.java:1537)\n	at org.hibernate.query.internal.AbstractProducedQuery.list(AbstractProducedQuery.java:1505)\n	at org.hibernate.query.internal.AbstractProducedQuery.getSingleResult(AbstractProducedQuery.java:1553)\n	at org.hibernate.query.criteria.internal.compile.CriteriaQueryTypeQueryAdapter.getSingleResult(CriteriaQueryTypeQueryAdapter.java:109)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution$SingleEntityExecution.doExecute(JpaQueryExecution.java:214)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:91)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:136)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:125)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:605)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	... 126 more\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'\' for key \'uniq_name\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:974)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1113)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1061)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeLargeUpdate(ClientPreparedStatement.java:1381)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdate(ClientPreparedStatement.java:1046)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.executeUpdate(PreparedStatementSpy.java:1080)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3253)\n	at com.alibaba.druid.filter.FilterAdapter.preparedStatement_executeUpdate(FilterAdapter.java:1092)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeUpdate(FilterEventAdapter.java:491)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3251)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeUpdate(PreparedStatementProxyImpl.java:194)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeUpdate(DruidPooledPreparedStatement.java:255)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:175)\n	... 154 more\n','2021-04-18 19:24:22'),(3546,'修改菜单','ERROR','com.akso.modules.system.rest.MenuController.update()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"menu\",\"permission\":\"\",\"pid\":118,\"updateTime\":1618744961000,\"title\":\"问卷记录\",\"type\":1,\"subCount\":0,\"path\":\"questionRecord\",\"component\":\"dad\",\"createBy\":\"admin\",\"createTime\":1618744961000,\"iFrame\":false,\"id\":121,\"componentName\":\"\",\"menuSort\":999}','101.86.120.214',16,'admin','中国|上海|上海市|电信','Chrome 8','org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [uniq_name]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:296)\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:253)\n	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	at com.sun.proxy.$Proxy201.countByPid(Unknown Source)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.updateSubCnt(MenuServiceImpl.java:334)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.update(MenuServiceImpl.java:183)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$236eb49e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$93dd256a.update(<generated>)\n	at com.akso.modules.system.rest.MenuController.update(MenuController.java:129)\n	at com.akso.modules.system.rest.MenuController$$FastClassBySpringCGLIB$$48783bd8.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at com.akso.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.rest.MenuController$$EnhancerBySpringCGLIB$$9b45cf86.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:912)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:663)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at com.akso.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:59)\n	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:178)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3356)\n	at org.hibernate.persister.entity.AbstractEntityPersister.updateOrInsert(AbstractEntityPersister.java:3229)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3630)\n	at org.hibernate.action.internal.EntityUpdateAction.execute(EntityUpdateAction.java:146)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:604)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:478)\n	at org.hibernate.event.internal.AbstractFlushingEventListener.performExecutions(AbstractFlushingEventListener.java:356)\n	at org.hibernate.event.internal.DefaultAutoFlushEventListener.onAutoFlush(DefaultAutoFlushEventListener.java:50)\n	at org.hibernate.internal.SessionImpl.autoFlushIfRequired(SessionImpl.java:1415)\n	at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1501)\n	at org.hibernate.query.internal.AbstractProducedQuery.doList(AbstractProducedQuery.java:1537)\n	at org.hibernate.query.internal.AbstractProducedQuery.list(AbstractProducedQuery.java:1505)\n	at org.hibernate.query.internal.AbstractProducedQuery.getSingleResult(AbstractProducedQuery.java:1553)\n	at org.hibernate.query.criteria.internal.compile.CriteriaQueryTypeQueryAdapter.getSingleResult(CriteriaQueryTypeQueryAdapter.java:109)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution$SingleEntityExecution.doExecute(JpaQueryExecution.java:214)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:91)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:136)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:125)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:605)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	... 126 more\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'\' for key \'uniq_name\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:974)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1113)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1061)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeLargeUpdate(ClientPreparedStatement.java:1381)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdate(ClientPreparedStatement.java:1046)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.executeUpdate(PreparedStatementSpy.java:1080)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3253)\n	at com.alibaba.druid.filter.FilterAdapter.preparedStatement_executeUpdate(FilterAdapter.java:1092)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeUpdate(FilterEventAdapter.java:491)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3251)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeUpdate(PreparedStatementProxyImpl.java:194)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeUpdate(DruidPooledPreparedStatement.java:255)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:175)\n	... 154 more\n','2021-04-18 19:24:36'),(3547,'删除菜单','INFO','com.akso.modules.system.rest.MenuController.delete()','[120]','101.86.120.214',49,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:24:46'),(3548,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"pid\":118,\"updateTime\":1618745128065,\"title\":\"问卷用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"component\":\"question/user/index\",\"createBy\":\"admin\",\"createTime\":1618745128065,\"iFrame\":false,\"id\":122,\"menuSort\":999}','101.86.120.214',18,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:25:28'),(3549,'修改菜单','ERROR','com.akso.modules.system.rest.MenuController.update()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"Steve-Jobs\",\"permission\":\"\",\"pid\":118,\"updateTime\":1618745128000,\"title\":\"问卷用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"component\":\"question/user/index\",\"createBy\":\"admin\",\"createTime\":1618745128000,\"iFrame\":false,\"id\":122,\"componentName\":\"\",\"menuSort\":999}','101.86.120.214',20,'admin','中国|上海|上海市|电信','Chrome 8','org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [uniq_name]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:296)\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:253)\n	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	at com.sun.proxy.$Proxy201.countByPid(Unknown Source)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.updateSubCnt(MenuServiceImpl.java:334)\n	at com.akso.modules.system.service.impl.MenuServiceImpl.update(MenuServiceImpl.java:183)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$236eb49e.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$93dd256a.update(<generated>)\n	at com.akso.modules.system.rest.MenuController.update(MenuController.java:129)\n	at com.akso.modules.system.rest.MenuController$$FastClassBySpringCGLIB$$48783bd8.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at com.akso.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:69)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	at com.akso.modules.system.rest.MenuController$$EnhancerBySpringCGLIB$$9b45cf86.update(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:912)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:663)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at com.akso.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: org.hibernate.exception.ConstraintViolationException: could not execute statement\n	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:59)\n	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:178)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3356)\n	at org.hibernate.persister.entity.AbstractEntityPersister.updateOrInsert(AbstractEntityPersister.java:3229)\n	at org.hibernate.persister.entity.AbstractEntityPersister.update(AbstractEntityPersister.java:3630)\n	at org.hibernate.action.internal.EntityUpdateAction.execute(EntityUpdateAction.java:146)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:604)\n	at org.hibernate.engine.spi.ActionQueue.executeActions(ActionQueue.java:478)\n	at org.hibernate.event.internal.AbstractFlushingEventListener.performExecutions(AbstractFlushingEventListener.java:356)\n	at org.hibernate.event.internal.DefaultAutoFlushEventListener.onAutoFlush(DefaultAutoFlushEventListener.java:50)\n	at org.hibernate.internal.SessionImpl.autoFlushIfRequired(SessionImpl.java:1415)\n	at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1501)\n	at org.hibernate.query.internal.AbstractProducedQuery.doList(AbstractProducedQuery.java:1537)\n	at org.hibernate.query.internal.AbstractProducedQuery.list(AbstractProducedQuery.java:1505)\n	at org.hibernate.query.internal.AbstractProducedQuery.getSingleResult(AbstractProducedQuery.java:1553)\n	at org.hibernate.query.criteria.internal.compile.CriteriaQueryTypeQueryAdapter.getSingleResult(CriteriaQueryTypeQueryAdapter.java:109)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution$SingleEntityExecution.doExecute(JpaQueryExecution.java:214)\n	at org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:91)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:136)\n	at org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:125)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:605)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	at org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	... 126 more\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'\' for key \'uniq_name\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:974)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1113)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdateInternal(ClientPreparedStatement.java:1061)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeLargeUpdate(ClientPreparedStatement.java:1381)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeUpdate(ClientPreparedStatement.java:1046)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.executeUpdate(PreparedStatementSpy.java:1080)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3253)\n	at com.alibaba.druid.filter.FilterAdapter.preparedStatement_executeUpdate(FilterAdapter.java:1092)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeUpdate(FilterEventAdapter.java:491)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeUpdate(FilterChainImpl.java:3251)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeUpdate(PreparedStatementProxyImpl.java:194)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeUpdate(DruidPooledPreparedStatement.java:255)\n	at org.hibernate.engine.jdbc.internal.ResultSetReturnImpl.executeUpdate(ResultSetReturnImpl.java:175)\n	... 154 more\n','2021-04-18 19:25:39'),(3550,'修改角色菜单','INFO','com.akso.modules.system.rest.RoleController.updateMenu()','{\"level\":3,\"dataScope\":\"本级\",\"id\":1,\"menus\":[{\"subCount\":0,\"id\":33,\"menuSort\":999},{\"subCount\":0,\"id\":97,\"menuSort\":999},{\"subCount\":0,\"id\":34,\"menuSort\":999},{\"subCount\":0,\"id\":98,\"menuSort\":999},{\"subCount\":0,\"id\":35,\"menuSort\":999},{\"subCount\":0,\"id\":36,\"menuSort\":999},{\"subCount\":0,\"id\":37,\"menuSort\":999},{\"subCount\":0,\"id\":38,\"menuSort\":999},{\"subCount\":0,\"id\":39,\"menuSort\":999},{\"subCount\":0,\"id\":41,\"menuSort\":999},{\"subCount\":0,\"id\":116,\"menuSort\":999},{\"subCount\":0,\"id\":118,\"menuSort\":999},{\"subCount\":0,\"id\":121,\"menuSort\":999},{\"subCount\":0,\"id\":122,\"menuSort\":999},{\"subCount\":0,\"id\":1,\"menuSort\":999},{\"subCount\":0,\"id\":2,\"menuSort\":999},{\"subCount\":0,\"id\":3,\"menuSort\":999},{\"subCount\":0,\"id\":5,\"menuSort\":999},{\"subCount\":0,\"id\":6,\"menuSort\":999},{\"subCount\":0,\"id\":7,\"menuSort\":999},{\"subCount\":0,\"id\":9,\"menuSort\":999},{\"subCount\":0,\"id\":10,\"menuSort\":999},{\"subCount\":0,\"id\":11,\"menuSort\":999},{\"subCount\":0,\"id\":14,\"menuSort\":999},{\"subCount\":0,\"id\":15,\"menuSort\":999},{\"subCount\":0,\"id\":80,\"menuSort\":999},{\"subCount\":0,\"id\":18,\"menuSort\":999},{\"subCount\":0,\"id\":82,\"menuSort\":999},{\"subCount\":0,\"id\":19,\"menuSort\":999},{\"subCount\":0,\"id\":83,\"menuSort\":999},{\"subCount\":0,\"id\":21,\"menuSort\":999},{\"subCount\":0,\"id\":22,\"menuSort\":999},{\"subCount\":0,\"id\":23,\"menuSort\":999},{\"subCount\":0,\"id\":24,\"menuSort\":999},{\"subCount\":0,\"id\":90,\"menuSort\":999},{\"subCount\":0,\"id\":27,\"menuSort\":999},{\"subCount\":0,\"id\":28,\"menuSort\":999},{\"subCount\":0,\"id\":92,\"menuSort\":999},{\"subCount\":0,\"id\":93,\"menuSort\":999},{\"subCount\":0,\"id\":30,\"menuSort\":999},{\"subCount\":0,\"id\":94,\"menuSort\":999},{\"subCount\":0,\"id\":32,\"menuSort\":999}]}','101.86.120.214',60,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:25:58'),(3551,'删除菜单','INFO','com.akso.modules.system.rest.MenuController.delete()','[122]','101.86.120.214',44,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:26:21'),(3552,'删除菜单','INFO','com.akso.modules.system.rest.MenuController.delete()','[121]','101.86.120.214',37,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:26:25'),(3553,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"Steve-Jobs\",\"pid\":118,\"updateTime\":1618745218362,\"title\":\"问卷用户\",\"type\":1,\"subCount\":0,\"path\":\"questionUser\",\"component\":\"question/user/index\",\"createBy\":\"admin\",\"createTime\":1618745218362,\"iFrame\":false,\"id\":123,\"menuSort\":999}','101.86.120.214',17,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:26:58'),(3554,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"app\",\"pid\":118,\"updateTime\":1618745274730,\"title\":\"问卷信息\",\"type\":1,\"subCount\":0,\"path\":\"questionInfo\",\"component\":\"question/info/index\",\"createBy\":\"admin\",\"createTime\":1618745274730,\"iFrame\":false,\"id\":124,\"menuSort\":999}','101.86.120.214',18,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:27:55'),(3555,'新增菜单','INFO','com.akso.modules.system.rest.MenuController.create()','{\"cache\":false,\"updatedBy\":\"admin\",\"hidden\":false,\"roles\":[],\"icon\":\"tab\",\"pid\":118,\"updateTime\":1618745317711,\"title\":\"问卷记录\",\"type\":1,\"subCount\":0,\"path\":\"questionRecord\",\"component\":\"question/record/index\",\"createBy\":\"admin\",\"createTime\":1618745317711,\"iFrame\":false,\"id\":125,\"menuSort\":999}','101.86.120.214',20,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:28:38'),(3556,'修改角色菜单','INFO','com.akso.modules.system.rest.RoleController.updateMenu()','{\"level\":3,\"dataScope\":\"本级\",\"id\":1,\"menus\":[{\"subCount\":0,\"id\":33,\"menuSort\":999},{\"subCount\":0,\"id\":97,\"menuSort\":999},{\"subCount\":0,\"id\":34,\"menuSort\":999},{\"subCount\":0,\"id\":98,\"menuSort\":999},{\"subCount\":0,\"id\":35,\"menuSort\":999},{\"subCount\":0,\"id\":36,\"menuSort\":999},{\"subCount\":0,\"id\":37,\"menuSort\":999},{\"subCount\":0,\"id\":38,\"menuSort\":999},{\"subCount\":0,\"id\":39,\"menuSort\":999},{\"subCount\":0,\"id\":41,\"menuSort\":999},{\"subCount\":0,\"id\":116,\"menuSort\":999},{\"subCount\":0,\"id\":118,\"menuSort\":999},{\"subCount\":0,\"id\":123,\"menuSort\":999},{\"subCount\":0,\"id\":124,\"menuSort\":999},{\"subCount\":0,\"id\":125,\"menuSort\":999},{\"subCount\":0,\"id\":1,\"menuSort\":999},{\"subCount\":0,\"id\":2,\"menuSort\":999},{\"subCount\":0,\"id\":3,\"menuSort\":999},{\"subCount\":0,\"id\":5,\"menuSort\":999},{\"subCount\":0,\"id\":6,\"menuSort\":999},{\"subCount\":0,\"id\":7,\"menuSort\":999},{\"subCount\":0,\"id\":9,\"menuSort\":999},{\"subCount\":0,\"id\":10,\"menuSort\":999},{\"subCount\":0,\"id\":11,\"menuSort\":999},{\"subCount\":0,\"id\":14,\"menuSort\":999},{\"subCount\":0,\"id\":15,\"menuSort\":999},{\"subCount\":0,\"id\":80,\"menuSort\":999},{\"subCount\":0,\"id\":18,\"menuSort\":999},{\"subCount\":0,\"id\":82,\"menuSort\":999},{\"subCount\":0,\"id\":19,\"menuSort\":999},{\"subCount\":0,\"id\":83,\"menuSort\":999},{\"subCount\":0,\"id\":21,\"menuSort\":999},{\"subCount\":0,\"id\":22,\"menuSort\":999},{\"subCount\":0,\"id\":23,\"menuSort\":999},{\"subCount\":0,\"id\":24,\"menuSort\":999},{\"subCount\":0,\"id\":90,\"menuSort\":999},{\"subCount\":0,\"id\":27,\"menuSort\":999},{\"subCount\":0,\"id\":28,\"menuSort\":999},{\"subCount\":0,\"id\":92,\"menuSort\":999},{\"subCount\":0,\"id\":93,\"menuSort\":999},{\"subCount\":0,\"id\":30,\"menuSort\":999},{\"subCount\":0,\"id\":94,\"menuSort\":999},{\"subCount\":0,\"id\":32,\"menuSort\":999}]}','101.86.120.214',52,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:28:48'),(3557,'修改角色菜单','INFO','com.akso.modules.system.rest.RoleController.updateMenu()','{\"level\":3,\"dataScope\":\"本级\",\"id\":2,\"menus\":[{\"subCount\":0,\"id\":1,\"menuSort\":999},{\"subCount\":0,\"id\":2,\"menuSort\":999},{\"subCount\":0,\"id\":3,\"menuSort\":999},{\"subCount\":0,\"id\":118,\"menuSort\":999},{\"subCount\":0,\"id\":123,\"menuSort\":999},{\"subCount\":0,\"id\":124,\"menuSort\":999},{\"subCount\":0,\"id\":125,\"menuSort\":999}]}','101.86.120.214',119,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:29:58'),(3558,'新增用户','INFO','com.akso.modules.system.rest.UserController.create()','{\"updatedBy\":\"admin\",\"gender\":\"女\",\"nickName\":\"熊亮\",\"roles\":[{\"level\":3,\"dataScope\":\"本级\",\"id\":2}],\"jobs\":[{\"id\":10}],\"avatarPath\":\"\",\"updateTime\":1618745520987,\"dept\":{\"subCount\":0,\"id\":7},\"isAdmin\":false,\"enabled\":true,\"avatarName\":\"\",\"password\":\"$2a$10$97qTOpNvvMcRooROnuUzvOAd2GdXn7Hi3VLjkjRLlUVwoggtfblRG\",\"createBy\":\"admin\",\"phone\":\"13787317460\",\"createTime\":1618745520987,\"id\":3,\"email\":\"xxx@163.com\",\"username\":\"xiongliang\"}','101.86.120.214',130,'admin','中国|上海|上海市|电信','Chrome 8',NULL,'2021-04-18 19:32:01');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(5) DEFAULT '0' COMMENT '子菜单数目',
  `type` int(11) DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `menu_sort` int(5) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_title` (`title`),
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,NULL,7,0,'系统管理',NULL,NULL,1,'system','system','\0','\0','\0',NULL,NULL,NULL,'2018-12-18 15:11:29',NULL),(2,1,3,1,'用户管理','User','system/user/index',2,'peoples','user','\0','\0','\0','user:list',NULL,NULL,'2018-12-18 15:14:44',NULL),(3,1,3,1,'角色管理','Role','system/role/index',3,'role','role','\0','\0','\0','roles:list',NULL,NULL,'2018-12-18 15:16:07',NULL),(5,1,3,1,'菜单管理','Menu','system/menu/index',5,'menu','menu','\0','\0','\0','menu:list',NULL,NULL,'2018-12-18 15:17:28',NULL),(6,NULL,5,0,'系统监控',NULL,NULL,10,'monitor','monitor','\0','\0','\0',NULL,NULL,NULL,'2018-12-18 15:17:48',NULL),(7,6,0,1,'操作日志','Log','monitor/log/index',11,'log','logs','\0','','\0',NULL,NULL,'admin','2018-12-18 15:18:26','2020-06-06 13:11:57'),(9,6,0,1,'SQL监控','Sql','monitor/sql/index',18,'sqlMonitor','druid','\0','\0','\0',NULL,NULL,NULL,'2018-12-18 15:19:34',NULL),(10,NULL,5,0,'组件管理',NULL,NULL,50,'zujian','components','\0','\0','\0',NULL,NULL,NULL,'2018-12-19 13:38:16',NULL),(11,10,0,1,'图标库','Icons','components/icons/index',51,'icon','icon','\0','\0','\0',NULL,NULL,NULL,'2018-12-19 13:38:49',NULL),(14,36,0,1,'邮件工具','Email','tools/email/index',35,'email','email','\0','\0','\0',NULL,NULL,NULL,'2018-12-27 10:13:09',NULL),(15,10,0,1,'富文本','Editor','components/Editor',52,'fwb','tinymce','\0','\0','\0',NULL,NULL,NULL,'2018-12-27 11:58:25',NULL),(18,36,3,1,'存储管理','Storage','tools/storage/index',34,'qiniu','storage','\0','\0','\0','storage:list',NULL,NULL,'2018-12-31 11:12:15',NULL),(19,36,0,1,'支付宝工具','AliPay','tools/aliPay/index',37,'alipay','aliPay','\0','\0','\0',NULL,NULL,NULL,'2018-12-31 14:52:38',NULL),(21,NULL,2,0,'多级菜单',NULL,'',900,'menu','nested','\0','\0','\0',NULL,NULL,'admin','2019-01-04 16:22:03','2020-06-21 17:27:35'),(22,21,2,1,'二级菜单1',NULL,'nested/menu1/index',999,'menu','menu1','\0','\0','\0',NULL,NULL,'admin','2019-01-04 16:23:29','2020-06-21 17:27:20'),(23,21,0,1,'二级菜单2',NULL,'nested/menu2/index',999,'menu','menu2','\0','\0','\0',NULL,NULL,NULL,'2019-01-04 16:23:57',NULL),(24,22,0,1,'三级菜单1',NULL,'nested/menu1/menu1-1',999,'menu','menu1-1','\0','\0','\0',NULL,NULL,NULL,'2019-01-04 16:24:48',NULL),(27,22,0,1,'三级菜单2',NULL,'nested/menu1/menu1-2',999,'menu','menu1-2','\0','\0','\0',NULL,NULL,NULL,'2019-01-07 17:27:32',NULL),(28,1,3,1,'任务调度','Timing','system/timing/index',999,'timing','timing','\0','\0','\0','timing:list',NULL,NULL,'2019-01-07 20:34:40',NULL),(30,36,0,1,'代码生成','GeneratorIndex','generator/index',32,'dev','generator','\0','','\0',NULL,NULL,NULL,'2019-01-11 15:45:55',NULL),(32,6,0,1,'异常日志','ErrorLog','monitor/log/errorLog',12,'error','errorLog','\0','\0','\0',NULL,NULL,NULL,'2019-01-13 13:49:03',NULL),(33,10,0,1,'Markdown','Markdown','components/MarkDown',53,'markdown','markdown','\0','\0','\0',NULL,NULL,NULL,'2019-03-08 13:46:44',NULL),(34,10,0,1,'Yaml编辑器','YamlEdit','components/YamlEdit',54,'dev','yaml','\0','\0','\0',NULL,NULL,NULL,'2019-03-08 15:49:40',NULL),(35,1,3,1,'部门管理','Dept','system/dept/index',6,'dept','dept','\0','\0','\0','dept:list',NULL,NULL,'2019-03-25 09:46:00',NULL),(36,NULL,7,0,'系统工具',NULL,'',30,'sys-tools','sys-tools','\0','\0','\0',NULL,NULL,NULL,'2019-03-29 10:57:35',NULL),(37,1,3,1,'岗位管理','Job','system/job/index',7,'Steve-Jobs','job','\0','\0','\0','job:list',NULL,NULL,'2019-03-29 13:51:18',NULL),(38,36,0,1,'接口文档','Swagger','tools/swagger/index',36,'swagger','swagger2','\0','\0','\0',NULL,NULL,NULL,'2019-03-29 19:57:53',NULL),(39,1,3,1,'字典管理','Dict','system/dict/index',8,'dictionary','dict','\0','\0','\0','dict:list',NULL,NULL,'2019-04-10 11:49:04',NULL),(41,6,0,1,'在线用户','OnlineUser','monitor/online/index',10,'Steve-Jobs','online','\0','\0','\0',NULL,NULL,NULL,'2019-10-26 22:08:43',NULL),(44,2,0,2,'用户新增',NULL,'',2,'','','\0','\0','\0','user:add',NULL,NULL,'2019-10-29 10:59:46',NULL),(45,2,0,2,'用户编辑',NULL,'',3,'','','\0','\0','\0','user:edit',NULL,NULL,'2019-10-29 11:00:08',NULL),(46,2,0,2,'用户删除',NULL,'',4,'','','\0','\0','\0','user:del',NULL,NULL,'2019-10-29 11:00:23',NULL),(48,3,0,2,'角色创建',NULL,'',2,'','','\0','\0','\0','roles:add',NULL,NULL,'2019-10-29 12:45:34',NULL),(49,3,0,2,'角色修改',NULL,'',3,'','','\0','\0','\0','roles:edit',NULL,NULL,'2019-10-29 12:46:16',NULL),(50,3,0,2,'角色删除',NULL,'',4,'','','\0','\0','\0','roles:del',NULL,NULL,'2019-10-29 12:46:51',NULL),(52,5,0,2,'菜单新增',NULL,'',2,'','','\0','\0','\0','menu:add',NULL,NULL,'2019-10-29 12:55:07',NULL),(53,5,0,2,'菜单编辑',NULL,'',3,'','','\0','\0','\0','menu:edit',NULL,NULL,'2019-10-29 12:55:40',NULL),(54,5,0,2,'菜单删除',NULL,'',4,'','','\0','\0','\0','menu:del',NULL,NULL,'2019-10-29 12:56:00',NULL),(56,35,0,2,'部门新增',NULL,'',2,'','','\0','\0','\0','dept:add',NULL,NULL,'2019-10-29 12:57:09',NULL),(57,35,0,2,'部门编辑',NULL,'',3,'','','\0','\0','\0','dept:edit',NULL,NULL,'2019-10-29 12:57:27',NULL),(58,35,0,2,'部门删除',NULL,'',4,'','','\0','\0','\0','dept:del',NULL,NULL,'2019-10-29 12:57:41',NULL),(60,37,0,2,'岗位新增',NULL,'',2,'','','\0','\0','\0','job:add',NULL,NULL,'2019-10-29 12:58:27',NULL),(61,37,0,2,'岗位编辑',NULL,'',3,'','','\0','\0','\0','job:edit',NULL,NULL,'2019-10-29 12:58:45',NULL),(62,37,0,2,'岗位删除',NULL,'',4,'','','\0','\0','\0','job:del',NULL,NULL,'2019-10-29 12:59:04',NULL),(64,39,0,2,'字典新增',NULL,'',2,'','','\0','\0','\0','dict:add',NULL,NULL,'2019-10-29 13:00:17',NULL),(65,39,0,2,'字典编辑',NULL,'',3,'','','\0','\0','\0','dict:edit',NULL,NULL,'2019-10-29 13:00:42',NULL),(66,39,0,2,'字典删除',NULL,'',4,'','','\0','\0','\0','dict:del',NULL,NULL,'2019-10-29 13:00:59',NULL),(73,28,0,2,'任务新增',NULL,'',2,'','','\0','\0','\0','timing:add',NULL,NULL,'2019-10-29 13:07:28',NULL),(74,28,0,2,'任务编辑',NULL,'',3,'','','\0','\0','\0','timing:edit',NULL,NULL,'2019-10-29 13:07:41',NULL),(75,28,0,2,'任务删除',NULL,'',4,'','','\0','\0','\0','timing:del',NULL,NULL,'2019-10-29 13:07:54',NULL),(77,18,0,2,'上传文件',NULL,'',2,'','','\0','\0','\0','storage:add',NULL,NULL,'2019-10-29 13:09:09',NULL),(78,18,0,2,'文件编辑',NULL,'',3,'','','\0','\0','\0','storage:edit',NULL,NULL,'2019-10-29 13:09:22',NULL),(79,18,0,2,'文件删除',NULL,'',4,'','','\0','\0','\0','storage:del',NULL,NULL,'2019-10-29 13:09:34',NULL),(80,6,0,1,'服务监控','ServerMonitor','monitor/server/index',14,'codeConsole','server','\0','\0','\0','monitor:list',NULL,'admin','2019-11-07 13:06:39','2020-05-04 18:20:50'),(82,36,0,1,'生成配置','GeneratorConfig','generator/config',33,'dev','generator/config/:tableName','\0','','','',NULL,NULL,'2019-11-17 20:08:56',NULL),(83,10,0,1,'图表库','Echarts','components/Echarts',50,'chart','echarts','\0','','\0','',NULL,NULL,'2019-11-21 09:04:32',NULL),(90,NULL,5,1,'运维管理','Mnt','',20,'mnt','mnt','\0','\0','\0',NULL,NULL,NULL,'2019-11-09 10:31:08',NULL),(92,90,3,1,'服务器','ServerDeploy','mnt/server/index',22,'server','mnt/serverDeploy','\0','\0','\0','serverDeploy:list',NULL,NULL,'2019-11-10 10:29:25',NULL),(93,90,3,1,'应用管理','App','mnt/app/index',23,'app','mnt/app','\0','\0','\0','app:list',NULL,NULL,'2019-11-10 11:05:16',NULL),(94,90,3,1,'部署管理','Deploy','mnt/deploy/index',24,'deploy','mnt/deploy','\0','\0','\0','deploy:list',NULL,NULL,'2019-11-10 15:56:55',NULL),(97,90,1,1,'部署备份','DeployHistory','mnt/deployHistory/index',25,'backup','mnt/deployHistory','\0','\0','\0','deployHistory:list',NULL,NULL,'2019-11-10 16:49:44',NULL),(98,90,3,1,'数据库管理','Database','mnt/database/index',26,'database','mnt/database','\0','\0','\0','database:list',NULL,NULL,'2019-11-10 20:40:04',NULL),(102,97,0,2,'删除',NULL,'',999,'','','\0','\0','\0','deployHistory:del',NULL,NULL,'2019-11-17 09:32:48',NULL),(103,92,0,2,'服务器新增',NULL,'',999,'','','\0','\0','\0','serverDeploy:add',NULL,NULL,'2019-11-17 11:08:33',NULL),(104,92,0,2,'服务器编辑',NULL,'',999,'','','\0','\0','\0','serverDeploy:edit',NULL,NULL,'2019-11-17 11:08:57',NULL),(105,92,0,2,'服务器删除',NULL,'',999,'','','\0','\0','\0','serverDeploy:del',NULL,NULL,'2019-11-17 11:09:15',NULL),(106,93,0,2,'应用新增',NULL,'',999,'','','\0','\0','\0','app:add',NULL,NULL,'2019-11-17 11:10:03',NULL),(107,93,0,2,'应用编辑',NULL,'',999,'','','\0','\0','\0','app:edit',NULL,NULL,'2019-11-17 11:10:28',NULL),(108,93,0,2,'应用删除',NULL,'',999,'','','\0','\0','\0','app:del',NULL,NULL,'2019-11-17 11:10:55',NULL),(109,94,0,2,'部署新增',NULL,'',999,'','','\0','\0','\0','deploy:add',NULL,NULL,'2019-11-17 11:11:22',NULL),(110,94,0,2,'部署编辑',NULL,'',999,'','','\0','\0','\0','deploy:edit',NULL,NULL,'2019-11-17 11:11:41',NULL),(111,94,0,2,'部署删除',NULL,'',999,'','','\0','\0','\0','deploy:del',NULL,NULL,'2019-11-17 11:12:01',NULL),(112,98,0,2,'数据库新增',NULL,'',999,'','','\0','\0','\0','database:add',NULL,NULL,'2019-11-17 11:12:43',NULL),(113,98,0,2,'数据库编辑',NULL,'',999,'','','\0','\0','\0','database:edit',NULL,NULL,'2019-11-17 11:12:58',NULL),(114,98,0,2,'数据库删除',NULL,'',999,'','','\0','\0','\0','database:del',NULL,NULL,'2019-11-17 11:13:14',NULL),(116,36,0,1,'生成预览','Preview','generator/preview',999,'java','generator/preview/:tableName','\0','','',NULL,NULL,NULL,'2019-11-26 14:54:36',NULL),(118,NULL,3,0,'调查问卷','','',999,'app','question','\0','\0','\0','','admin','admin','2021-04-18 19:19:25','2021-04-18 19:19:41'),(123,118,0,1,'问卷用户',NULL,'question/user/index',999,'Steve-Jobs','questionUser','\0','\0','\0',NULL,'admin','admin','2021-04-18 19:26:58','2021-04-18 19:26:58'),(124,118,0,1,'问卷信息',NULL,'question/info/index',999,'app','questionInfo','\0','\0','\0',NULL,'admin','admin','2021-04-18 19:27:55','2021-04-18 19:27:55'),(125,118,0,1,'问卷记录',NULL,'question/record/index',999,'tab','questionRecord','\0','\0','\0',NULL,'admin','admin','2021-04-18 19:28:38','2021-04-18 19:28:38');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quartz_job`
--

DROP TABLE IF EXISTS `sys_quartz_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_quartz_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `inx_is_pause` (`is_pause`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quartz_job`
--

LOCK TABLES `sys_quartz_job` WRITE;
/*!40000 ALTER TABLE `sys_quartz_job` DISABLE KEYS */;
INSERT INTO `sys_quartz_job` VALUES (2,'testTask','0/5 * * * * ?','','测试1','run1','test','带参测试，多参使用json','测试',NULL,NULL,NULL,NULL,'admin','2019-08-22 14:08:29','2020-05-24 13:58:33'),(3,'testTask','0/5 * * * * ?','','测试','run','','不带参测试','Zheng Jie','','5,6','',NULL,'admin','2019-09-26 16:44:39','2020-05-24 14:48:12'),(5,'Test','0/5 * * * * ?','','任务告警测试','run',NULL,'测试','test','',NULL,'','admin','admin','2020-05-05 20:32:41','2020-05-05 20:36:13'),(6,'testTask','0/5 * * * * ?','','测试3','run2',NULL,'测试3','Zheng Jie','',NULL,'','admin','admin','2020-05-05 20:35:41','2020-05-05 20:36:07');
/*!40000 ALTER TABLE `sys_quartz_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quartz_log`
--

DROP TABLE IF EXISTS `sys_quartz_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_quartz_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quartz_log`
--

LOCK TABLES `sys_quartz_log` WRITE;
/*!40000 ALTER TABLE `sys_quartz_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_quartz_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `level` int(255) DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `role_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员',1,'-','自定义',NULL,'admin','2018-11-23 11:04:37','2021-04-18 19:28:48'),(2,'普通用户',2,'-','自定义',NULL,'admin','2018-11-23 13:09:06','2021-04-18 19:29:58');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_roles_depts`
--

DROP TABLE IF EXISTS `sys_roles_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色部门关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_roles_depts`
--

LOCK TABLES `sys_roles_depts` WRITE;
/*!40000 ALTER TABLE `sys_roles_depts` DISABLE KEYS */;
INSERT INTO `sys_roles_depts` VALUES (2,6),(1,7),(1,8);
/*!40000 ALTER TABLE `sys_roles_depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_roles_menus`
--

DROP TABLE IF EXISTS `sys_roles_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_roles_menus`
--

LOCK TABLES `sys_roles_menus` WRITE;
/*!40000 ALTER TABLE `sys_roles_menus` DISABLE KEYS */;
INSERT INTO `sys_roles_menus` VALUES (1,1),(2,1),(3,1),(5,1),(6,1),(7,1),(9,1),(10,1),(11,1),(14,1),(15,1),(18,1),(19,1),(21,1),(22,1),(23,1),(24,1),(27,1),(28,1),(30,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(41,1),(80,1),(82,1),(83,1),(90,1),(92,1),(93,1),(94,1),(97,1),(98,1),(116,1),(118,1),(123,1),(124,1),(125,1),(1,2),(2,2),(3,2),(118,2),(123,2),(124,2),(125,2);
/*!40000 ALTER TABLE `sys_roles_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新着',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`),
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_name`) USING BTREE,
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,2,'admin','管理员','男','18888888888','201507802@qq.com','avatar-20200806032259161.png','/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png','$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa','',1,NULL,'admin','2020-05-03 16:38:31','2018-08-23 09:11:56','2020-09-05 10:43:31'),(2,2,'test','测试','男','18888888888','231@qq.com',NULL,NULL,'$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK','\0',1,'admin','admin',NULL,'2020-05-05 11:15:49','2020-09-05 10:43:38'),(3,7,'xiongliang','熊亮','女','13787317460','xxx@163.com','','','$2a$10$97qTOpNvvMcRooROnuUzvOAd2GdXn7Hi3VLjkjRLlUVwoggtfblRG','\0',1,'admin','admin',NULL,'2021-04-18 19:32:01','2021-04-18 19:32:01');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users_jobs`
--

DROP TABLE IF EXISTS `sys_users_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_users_jobs` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users_jobs`
--

LOCK TABLES `sys_users_jobs` WRITE;
/*!40000 ALTER TABLE `sys_users_jobs` DISABLE KEYS */;
INSERT INTO `sys_users_jobs` VALUES (1,11),(2,12),(3,10);
/*!40000 ALTER TABLE `sys_users_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users_roles`
--

DROP TABLE IF EXISTS `sys_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users_roles`
--

LOCK TABLES `sys_users_roles` WRITE;
/*!40000 ALTER TABLE `sys_users_roles` DISABLE KEYS */;
INSERT INTO `sys_users_roles` VALUES (1,1),(2,2),(3,2);
/*!40000 ALTER TABLE `sys_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_info`
--

DROP TABLE IF EXISTS `tb_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(125) DEFAULT NULL,
  `link` varchar(125) DEFAULT NULL,
  `content` text,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_info`
--

LOCK TABLES `tb_info` WRITE;
/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;
INSERT INTO `tb_info` VALUES (4,'尿道下裂，是哪里裂？',NULL,'<ul><li><div><h1>尿道下裂，是哪里裂？&nbsp;</h1></div><article id=\"mp-editor\"><p>尿道下裂是一种什么疾病，普通人一听说尿道下裂，便立即问“是哪里裂呢？”其实尿道下裂并不是哪里裂开而是一种男性尿道开口位置异常的先天缺陷，尿道口可分布在正常尿道口至会阴部的连线上，多数病人可伴有阴茎向腹侧弯曲。尿道下裂是小儿泌尿系统中的常见畸形，国外报道发病率可高达125～250出生男婴中有1个尿道下裂。在尿道下裂中，阴茎筋膜和皮肤在孕期8～14周发育过程中未能在阴茎腹侧正常发育，尿道沟融合不全时可形成尿道下裂，同时尿道海绵体也发育不全，在尿道下裂的远端形成索状，可导致阴茎弯曲。多数的尿道下裂病例没有明确的病因，大部分学者认为有多个因素参与尿道下裂的形成。有少数病例可能是由于单基因突变引起，而文献中报道的多数病例与产妇高龄、内分泌水平、促排卵药、抗癫痫药、低体重儿、先兆子痫以及其他环境因素相关。</p><p>尿道下裂可有以下表现</p><p><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20181012/acd1d83d2d324b2781b6982bc8ec5e1b.jpeg\"></p><p>1.异位尿道口：尿道口可出现在正常尿道口近端至会阴部尿道的任何部位。</p><p>2.阴茎下弯：即阴茎向腹侧弯曲，不能正常排尿和性生活。导致阴茎下弯的原因有阴茎腹侧发育不全及组织轴向短缩。</p><p>3.包皮的异常分布：阴茎头腹侧包皮因未能在中线融合，故呈V形缺损，包皮系带缺如，全部包皮转至阴茎头背侧呈帽状堆积。</p><p>4.排尿时尿流溅射。</p><p>尿道下裂依尿道口解剖位置可分为4型</p><p><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20181012/7bd27068772f46beaf15961aff774d92.jpeg\"></p><p>1.阴茎头型：尿道口位于冠状沟的腹侧，多呈裂隙状，一般仅伴有轻度阴茎弯曲，多不影响性生活及生育；</p><p>2.阴茎型：尿道口位于阴茎腹侧从冠状沟到阴囊阴茎交接处之间，伴有阴茎弯曲；</p><p>3.阴囊型：尿道口位于阴囊部，常伴有阴囊分裂，阴茎弯曲严重；</p><p>4.会阴型：尿道外口位于会阴部，阴囊分裂，发育不全，阴茎短小而弯曲，常误诊为女性。由于阴茎弯曲纠正后，尿道外口会由不同程度的向会阴回缩，故近年来按阴茎下弯矫正后尿道口的退缩位置来分型的方法被很多医师接受。严重的尿道下裂患儿常有其他伴随畸形，包括隐睾、腹股沟疝、鞘膜积液、前列腺囊、阴茎阴囊转位、阴茎扭转、小阴茎、重复尿道等，少数患者可合并肛门直肠畸形。</p><p><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20181012/98e4521d99b44368af9ae69ab7bca873.jpeg\"></p><p>尿道下裂是外生殖器畸形，根据典型临床表现和体格检查很容易确诊。确诊尿道下裂后需进一步检查有无伴发畸形，严重的尿道下裂需行进一步泌尿系检查。外三科近年来致力于开展各种男科疾病的诊疗，对尿道下裂的诊疗技术已相当成熟，近年来约有近百例患者在外三科行尿道下裂修复术，如果您不能明确您或您的小孩是否患有尿道下裂，请到正规医院诊断咨询。</p></article></li></ul>',0,'2021-05-03 11:11:33','2021-05-03 11:11:33');
/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_question_config`
--

DROP TABLE IF EXISTS `tb_question_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_question_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_question_config`
--

LOCK TABLES `tb_question_config` WRITE;
/*!40000 ALTER TABLE `tb_question_config` DISABLE KEYS */;
INSERT INTO `tb_question_config` VALUES (1,'尿道下裂手术阴茎外观满意度随访调查问卷','[{\"id\":\"1\",\"title\":\"1.是否认为自己的阴茎外观与他人不同(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"不是\"}],\"value\":\"\"},{\"id\":\"2\",\"title\":\"不满意的主要原因(   )\",\"type\":\"checkbox\",\"options\":[{\"key\":\"A\",\"value\":\"龟头小\"},{\"key\":\"B\",\"value\":\"阴茎短小\"},{\"key\":\"C\",\"value\":\"阴茎弯曲\"},{\"key\":\"D\",\"value\":\"阴茎头形态异常\"},{\"key\":\"E\",\"value\":\"阴茎短粗胖\"},{\"key\":\"F\",\"value\":\"尿道外口位置异常\"},{\"key\":\"G\",\"value\":\"阴茎短粗胖\"},{\"key\":\"H\",\"value\":\"包皮分布异常(皮赘等)\"},{\"key\":\"I\",\"value\":\"阴茎体阴毛分布多\"},{\"key\":\"J\",\"value\":\"阴茎短粗胖\"},{\"key\":\"I\",\"value\":\"其他\"}]},{\"id\":\"3\",\"title\":\"2.对阴茎长度的满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"4\",\"title\":\"3.对尿道口位置和形态满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"5\",\"title\":\"4.对龟头外形的满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"6\",\"title\":\"5.对包皮分布满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"7\",\"title\":\"6.阴茎勃起时伸直满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"8\",\"title\":\"7.对整体阴茎外观的满意度(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"非常满意\"},{\"key\":\"B\",\"value\":\"基本满意\"},{\"key\":\"C\",\"value\":\"不满意\"},{\"key\":\"D\",\"value\":\"极不满意\"}],\"value\":\"\"},{\"id\":\"9\",\"title\":\"不满意的主要原因(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"龟头小\"},{\"key\":\"B\",\"value\":\"阴茎短小\"},{\"key\":\"C\",\"value\":\"阴茎弯曲\"},{\"key\":\"D\",\"value\":\"阴茎头形态异常\"},{\"key\":\"E\",\"value\":\"阴茎短粗胖\"},{\"key\":\"F\",\"value\":\"尿道外口位置异常\"},{\"key\":\"G\",\"value\":\"阴茎短粗胖\"},{\"key\":\"H\",\"value\":\"包皮分布异常(皮赘等)\"},{\"key\":\"I\",\"value\":\"阴茎体阴毛分布多\"},{\"key\":\"J\",\"value\":\"阴茎短粗胖\"},{\"key\":\"I\",\"value\":\"其他\"}],\"value\":\"\"},{\"id\":\"10\",\"title\":\"8.是否想再次行手术治疗改进阴茎外观(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"11\",\"title\":\"要求再次手术的主要原因(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"龟头小\"},{\"key\":\"B\",\"value\":\"阴茎短小\"},{\"key\":\"C\",\"value\":\"阴茎弯曲\"},{\"key\":\"D\",\"value\":\"阴茎头形态异常\"},{\"key\":\"E\",\"value\":\"阴茎短粗胖\"},{\"key\":\"F\",\"value\":\"尿道外口位置异常\"},{\"key\":\"G\",\"value\":\"阴茎短粗胖\"},{\"key\":\"H\",\"value\":\"包皮分布异常(皮赘等)\"},{\"key\":\"I\",\"value\":\"阴茎体阴毛分布多\"},{\"key\":\"J\",\"value\":\"阴茎短粗胖\"},{\"key\":\"I\",\"value\":\"其他\"}],\"value\":\"\"},{\"id\":\"12\",\"title\":\"9.是否认为正常的阴茎外观是正常排尿功能和性功能的重要保证(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"}]'),(2,'术前（第1次）尿道下裂手术功能随访调查问卷','[{\"id\":\"1\",\"title\":\"1.尿道口开口位置是否正常(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"2\",\"title\":\"2.尿液性状(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"透明\"},{\"key\":\"B\",\"value\":\"浑浊\"},{\"key\":\"C\",\"value\":\"带血丝\"}],\"value\":\"\"},{\"id\":\"3\",\"title\":\"3.尿液颜色(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"浅黄色\"},{\"key\":\"B\",\"value\":\"黄色\"},{\"key\":\"C\",\"value\":\"深黄色\"}],\"value\":\"\"},{\"id\":\"4\",\"title\":\"4.站立排尿(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"}]'),(3,'术后第4周（第2次）尿道下裂手术功能随访调查问卷','[{\"id\":\"1\",\"title\":\"1.尿道口开口位置是否正常(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"2\",\"title\":\"2.有无尿道瘘(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"3\",\"title\":\"3.排尿费力(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"4\",\"title\":\"4.尿线粗细是否满意(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"5\",\"title\":\"5.站立排尿(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"6\",\"title\":\"6.家长对患儿排尿满意与否(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"}]'),(4,'术后第12周（第3次）尿道下裂手术功能随访调查问卷','[{\"id\":\"1\",\"title\":\"1.尿道口开口位置是否正常(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"2\",\"title\":\"2.有无尿道瘘(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"3\",\"title\":\"3.排尿费力(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"4\",\"title\":\"4.尿线粗细是否满意(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"5\",\"title\":\"5.站立排尿(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"6\",\"title\":\"6.家长对患儿排尿满意与否(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"}]'),(5,'术后第24周（第4次）尿道下裂手术功能随访调查问卷','[{\"id\":\"1\",\"title\":\"1.尿道口开口位置是否正常(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"2\",\"title\":\"2.有无尿道瘘(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"3\",\"title\":\"3.排尿费力(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"4\",\"title\":\"4.尿线粗细是否满意(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"5\",\"title\":\"5.站立排尿(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"},{\"id\":\"6\",\"title\":\"6.家长对患儿排尿满意与否(   )\",\"type\":\"radio\",\"options\":[{\"key\":\"A\",\"value\":\"是\"},{\"key\":\"B\",\"value\":\"否\"}],\"value\":\"\"}]');
/*!40000 ALTER TABLE `tb_question_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_question_record`
--

DROP TABLE IF EXISTS `tb_question_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_question_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(64) DEFAULT NULL,
  `record` varchar(255) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_openid` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_question_record`
--

LOCK TABLES `tb_question_record` WRITE;
/*!40000 ALTER TABLE `tb_question_record` DISABLE KEYS */;
INSERT INTO `tb_question_record` VALUES (2,'obIio5JCTbGE2ZXhqMSi3ZSj8onw','{\"11\":\"C\",\"1\":\"A\",\"12\":\"B\",\"2\":[\"B\",\"C\"],\"3\":\"C\",\"4\":\"D\",\"5\":\"D\",\"6\":\"A\",\"7\":\"B\",\"8\":\"C\",\"9\":\"B\",\"10\":\"B\"}',1,'熊','17612176234','2021-05-03 09:59:44','2021-05-03 09:59:44',NULL),(3,'obIio5JCTbGE2ZXhqMSi3ZSj8onw','{\"1\":\"B\",\"2\":\"B\",\"3\":\"A\",\"4\":\"A\"}',2,'熊','17612176234','2021-05-03 15:50:54','2021-05-03 15:50:54',NULL),(4,'obIio5JCTbGE2ZXhqMSi3ZSj8onw','{\"11\":\"D\",\"1\":\"B\",\"12\":\"B\",\"2\":[\"E\",\"H\"],\"3\":\"C\",\"4\":\"D\",\"5\":\"D\",\"6\":\"C\",\"7\":\"D\",\"8\":\"C\",\"9\":\"I\",\"10\":\"B\"}',1,'熊','17612176237','2021-10-31 22:21:35','2021-10-31 22:21:35',NULL),(5,'obIio5JCTbGE2ZXhqMSi3ZSj8onw','{\"11\":\"I\",\"1\":\"A\",\"12\":\"B\",\"2\":[\"G\",\"E\"],\"3\":\"C\",\"4\":\"B\",\"5\":\"C\",\"6\":\"A\",\"7\":\"D\",\"8\":\"A\",\"9\":\"E\",\"10\":\"B\"}',1,'熊某','17212173331','2022-01-12 18:35:40','2022-01-12 18:35:40',NULL);
/*!40000 ALTER TABLE `tb_question_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT '',
  `nickname` varchar(64) DEFAULT '',
  `phone` varchar(20) DEFAULT '',
  `open_id` varchar(64) DEFAULT '',
  `operation_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_openId` (`open_id`) USING BTREE,
  KEY `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (3,'cc','','17612176759','','2011-01-04 00:00:00','2021-05-05 20:09:59','2021-05-05 20:09:59'),(5,'熊某','','17212173331','obIio5JCTbGE2ZXhqMSi3ZSj8onw','2012-01-01 00:00:00','2022-01-12 18:35:15','2022-01-12 18:35:15');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_alipay_config`
--

DROP TABLE IF EXISTS `tool_alipay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_alipay_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text COMMENT '私钥',
  `public_key` text COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_alipay_config`
--

LOCK TABLES `tool_alipay_config` WRITE;
/*!40000 ALTER TABLE `tool_alipay_config` DISABLE KEYS */;
INSERT INTO `tool_alipay_config` VALUES (1,'2016091700532697','utf-8','JSON','https://openapi.alipaydev.com/gateway.do','http://api.auauz.net/api/aliPay/notify','MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB','http://api.auauz.net/api/aliPay/return','RSA2','2088102176044281');
/*!40000 ALTER TABLE `tool_alipay_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_email_config`
--

DROP TABLE IF EXISTS `tool_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_email_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_email_config`
--

LOCK TABLES `tool_email_config` WRITE;
/*!40000 ALTER TABLE `tool_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_local_storage`
--

DROP TABLE IF EXISTS `tool_local_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_local_storage` (
  `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `size` varchar(100) DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='本地存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_local_storage`
--

LOCK TABLES `tool_local_storage` WRITE;
/*!40000 ALTER TABLE `tool_local_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_local_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_qiniu_config`
--

DROP TABLE IF EXISTS `tool_qiniu_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_qiniu_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `access_key` text COMMENT 'accessKey',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) NOT NULL COMMENT '外链域名',
  `secret_key` text COMMENT 'secretKey',
  `type` varchar(255) DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_qiniu_config`
--

LOCK TABLES `tool_qiniu_config` WRITE;
/*!40000 ALTER TABLE `tool_qiniu_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_qiniu_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_qiniu_content`
--

DROP TABLE IF EXISTS `tool_qiniu_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_qiniu_content` (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) DEFAULT NULL COMMENT '文件后缀',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_qiniu_content`
--

LOCK TABLES `tool_qiniu_content` WRITE;
/*!40000 ALTER TABLE `tool_qiniu_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_qiniu_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eladmin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-19 16:41:21
