/*
 Navicat MySQL Data Transfer

 Source Server         : mysql57
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : db_studentmo

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 08/02/2023 20:07:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content_type_id`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add student', 7, 'add_student');
INSERT INTO `auth_permission` VALUES (20, 'Can change student', 7, 'change_student');
INSERT INTO `auth_permission` VALUES (21, 'Can delete student', 7, 'delete_student');
INSERT INTO `auth_permission` VALUES (22, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (23, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (24, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (25, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (26, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (27, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (28, 'Can view 学生', 7, 'view_student');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$20000$RceVcQEeVlsa+OzbaR6FccejdeGoYbUQCJHIm5ccI36t/s9GUsIxNXQ=', '2018-03-22 07:34:57', 1, 'admin', '', '', '255922@qq.com', 1, 1, '2018-03-22 07:26:20');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$260000$Z3AM7LX7Wbj6XulR80KURS$+OzbaR6FccejdeGoYbUQCJHIm5ccI36t/s9GUsIxNXQ=', '2023-02-08 09:22:19', 1, 'bhml', '', '', '', 1, 1, '2023-02-07 13:29:55');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_30a071c9_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin__content_type_id_5151027a_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_1c5f563_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-03-22 07:28:56', '1', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-03-22 07:29:50', '2', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-03-22 08:41:56', '3', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-03-22 08:42:29', '3', 'Student object', 2, '已修改 stu_nianji 。', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-03-22 08:42:52', '2', 'Student object', 2, '已修改 stu_password 。', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-03-22 08:43:40', '4', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-03-22 08:44:02', '4', 'Student object', 2, '没有字段被修改。', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-03-22 08:44:43', '5', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-03-22 08:46:02', '6', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-03-22 08:47:25', '7', 'Student object', 1, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-02-08 09:22:34', '7', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (12, '2023-02-08 09:22:34', '6', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (13, '2023-02-08 09:22:34', '5', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (14, '2023-02-08 09:22:34', '4', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (15, '2023-02-08 09:22:34', '3', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (16, '2023-02-08 09:22:35', '2', '李杀神', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (17, '2023-02-08 09:22:35', '1', '赵日天', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (18, '2023-02-08 09:25:00', '1001', '高启强', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (19, '2023-02-08 09:27:21', '2', '高启强', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (20, '2023-02-08 09:28:01', '3', '安欣', 1, '[{\"added\": {}}]', 7, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_3ec8c61c_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'stu', 'student');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-03-22 07:24:52');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-03-22 07:24:54');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-03-22 07:24:54');
INSERT INTO `django_migrations` VALUES (4, 'contenttypes', '0002_remove_content_type_name', '2018-03-22 07:24:55');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2018-03-22 07:24:55');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0003_alter_user_email_max_length', '2018-03-22 07:24:55');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0004_alter_user_username_opts', '2018-03-22 07:24:55');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0005_alter_user_last_login_null', '2018-03-22 07:24:55');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0006_require_contenttypes_0002', '2018-03-22 07:24:56');
INSERT INTO `django_migrations` VALUES (10, 'sessions', '0001_initial', '2018-03-22 07:24:56');
INSERT INTO `django_migrations` VALUES (11, 'stu', '0001_initial', '2018-03-22 07:24:56');
INSERT INTO `django_migrations` VALUES (12, 'admin', '0002_logentry_remove_auto_add', '2023-02-08 09:21:43');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-08 09:21:43');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2023-02-08 09:21:43');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2023-02-08 09:21:44');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2023-02-08 09:21:45');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2023-02-08 09:21:45');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2023-02-08 09:21:45');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0012_alter_user_first_name_max_length', '2023-02-08 09:21:46');
INSERT INTO `django_migrations` VALUES (20, 'stu', '0002_auto_20230208_1721', '2023-02-08 09:21:47');
INSERT INTO `django_migrations` VALUES (21, 'stu', '0003_alter_student_id', '2023-02-08 09:23:55');
INSERT INTO `django_migrations` VALUES (22, 'stu', '0004_alter_student_id', '2023-02-08 09:26:33');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(0) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('tbsjjofvz0wjyce4z9yiu2wop804f8g6', 'ZDliZGUzM2Q2OGRlY2RhYzk1MWQyZGJiOTE2MzA2NWU4ZDkyOGViMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjczY2U3NWE4MTI2ZWJmMWI5MjZiOWNkNzMzMGE3NmE3ZDJkMzM1OTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-04-05 07:34:57');
INSERT INTO `django_session` VALUES ('wv0x75kg6q4sksrxwf0xuywmiuujont9', '.eJxVjMsOwiAQRf-FtSHyBpfu-w2EGQapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQ5swuT7PS7QcIHtR3ke2q3zrG3dZmB7wo_6OBTz_S8Hu7fQU2jfmvwgoSX1gapdAmOlERpkvdQBOkAQphAqC1kOJPWFktSwWpymVRGZ9j7A9EBN-c:1pPgeh:xLMPOf-y95_2Geqk7xr5o7EDtnue_6JN_buvD3Kx23k', '2023-02-22 09:22:19');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL,
  `stu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_gender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_course` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_score` int(11) NOT NULL,
  `stu_nianji` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_xueqi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '高启强', '123456', '男', '25', '软件工程', 60, '大一', '上');
INSERT INTO `student` VALUES (2, '高启强', '123456', '男', '25', 'python编程', 99, '大二', '下');
INSERT INTO `student` VALUES (3, '安欣', '123456', '男', '34', '软件工程', 88, '大一', '上');

SET FOREIGN_KEY_CHECKS = 1;
