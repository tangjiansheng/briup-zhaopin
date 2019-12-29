/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : recruit

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2019-12-28 20:58:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zp_browse`
-- ----------------------------
DROP TABLE IF EXISTS `zp_browse`;
CREATE TABLE `zp_browse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employment_id` bigint(20) NOT NULL,
  `jobhunter_id` bigint(20) NOT NULL,
  `look_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of zp_browse
-- ----------------------------
INSERT INTO `zp_browse` VALUES ('1', '2855', '1136', '2019-10-18 10:02:50');
INSERT INTO `zp_browse` VALUES ('2', '1136', '2855', '2019-10-18 11:27:11');
INSERT INTO `zp_browse` VALUES ('3', '360', '32', '2019-10-18 14:14:18');
INSERT INTO `zp_browse` VALUES ('4', '2855', '1070', '2019-10-18 14:19:22');
INSERT INTO `zp_browse` VALUES ('5', '2855', '1070', '2019-10-18 14:19:28');
INSERT INTO `zp_browse` VALUES ('6', '2936', '1136', '2019-10-18 14:20:53');
INSERT INTO `zp_browse` VALUES ('7', '2855', '32', '2019-10-18 14:25:01');
INSERT INTO `zp_browse` VALUES ('8', '2855', '1069', '2019-10-18 14:27:18');
INSERT INTO `zp_browse` VALUES ('9', '2855', '1069', '2019-10-18 14:30:02');
INSERT INTO `zp_browse` VALUES ('10', '3217', '1070', '2019-10-18 14:30:19');
INSERT INTO `zp_browse` VALUES ('11', '2855', '1069', '2019-10-18 15:41:14');

-- ----------------------------
-- Table structure for `zp_business`
-- ----------------------------
DROP TABLE IF EXISTS `zp_business`;
CREATE TABLE `zp_business` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `scale` varchar(255) NOT NULL,
  `established_time` varchar(255) NOT NULL,
  `registered_capital` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `business_license` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province`),
  KEY `city_id` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=2929 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_business
-- ----------------------------
INSERT INTO `zp_business` VALUES ('2355', '瞎子公司', '张开', '0909-7896789', '金融', '文昌路', '100-200', '2014-04-19', '10万', '可乐金融公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '审核通过', '广西', '柳州');
INSERT INTO `zp_business` VALUES ('2902', '安拉斯加公司', '李依依', '0909-7896789', '科技', '学院路36号', '400-600', '2013-11-11', '100万', 'A公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '审核通过', '江苏', '苏州');
INSERT INTO `zp_business` VALUES ('2903', '艾欧尼亚公司', '包青天', '0808-7878787', '软件', '工业园区', '20-100', '2012-10-04', '100万', 'B公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '审核通过', '江苏', '昆山');
INSERT INTO `zp_business` VALUES ('2904', 'C公司', '王玉', '6787-7878756', '金融', '闻喜', '200-400', '2017-12-09', '20万', 'C公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '审核通过', '山西', '运城');
INSERT INTO `zp_business` VALUES ('2905', 'D公司', '李田田', '0359-4567654', '软件', '尖草坪区', '400-600', '2016-09-24', '100万', 'D公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '审核未通过', '山西', '太原');
INSERT INTO `zp_business` VALUES ('2928', '22ww', 'q覃革', 'q6787-7878756', '科技q', 'q文昌路', 'q200-4000', '2014-04-19', '100万', 'q该公司是一家集生物产品等委托生产、推广于一体的现代化股份制集团公司。公司以客户需求为经营导向，以人类大众健康为己任，提倡健康的生活方式。', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577270460404&di=22afcdf32649055dff3e5d570fdb40d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190129%2Fa05e6d1a31734b54a3e139795ca06a4e.jpeg', '待审核', '广西', '柳州');

-- ----------------------------
-- Table structure for `zp_city`
-- ----------------------------
DROP TABLE IF EXISTS `zp_city`;
CREATE TABLE `zp_city` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `province_id` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `zp_city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `zp_province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_city
-- ----------------------------
INSERT INTO `zp_city` VALUES ('628', '南昌', '18');
INSERT INTO `zp_city` VALUES ('651', '运城', '17');
INSERT INTO `zp_city` VALUES ('652', '太原', '17');
INSERT INTO `zp_city` VALUES ('653', '柳州', '13');
INSERT INTO `zp_city` VALUES ('655', '苏州', '8');
INSERT INTO `zp_city` VALUES ('657', '昆山', '8');

-- ----------------------------
-- Table structure for `zp_collect`
-- ----------------------------
DROP TABLE IF EXISTS `zp_collect`;
CREATE TABLE `zp_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobhunter_id` bigint(20) NOT NULL,
  `employment_id` bigint(20) NOT NULL,
  `collect_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `zp_customer_service`
-- ----------------------------
DROP TABLE IF EXISTS `zp_customer_service`;
CREATE TABLE `zp_customer_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_customer_service
-- ----------------------------
INSERT INTO `zp_customer_service` VALUES ('30', '张益达', '李伟', '男', '在线');
INSERT INTO `zp_customer_service` VALUES ('35', '客服一', '张三', '男', '离线');
INSERT INTO `zp_customer_service` VALUES ('36', '客服二', '张小美', '女', '在线');
INSERT INTO `zp_customer_service` VALUES ('37', '客服三', '李依依', '女', '离线');
INSERT INTO `zp_customer_service` VALUES ('38', '客服四', '张黎', '男', '在线');

-- ----------------------------
-- Table structure for `zp_employment`
-- ----------------------------
DROP TABLE IF EXISTS `zp_employment`;
CREATE TABLE `zp_employment` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `welfare` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `description` varchar(2550) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `num` bigint(11) DEFAULT NULL,
  `business_id` bigint(11) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `job_id` bigint(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `audit_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Publisher_ID` (`contact_name`),
  KEY `job_id` (`job_id`),
  KEY `city_id` (`city`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `zp_employment_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `zp_jobs` (`id`),
  CONSTRAINT `zp_employment_ibfk_3` FOREIGN KEY (`business_id`) REFERENCES `zp_business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_employment
-- ----------------------------
INSERT INTO `zp_employment` VALUES ('360', '前端招聘1', '张三', '15835686574', '程序员', '2019-12-28 17:12:40', '五险一金、高温假、高温补贴', '500022', '无责任底薪3500（依个人能力而定）+全勤奖+提成综合待遇 多劳多得', '审核通过', '50', '2355', '1', '7', '南昌', '江西', '2019-12-28 16:48:08', '2019-12-28 16:48:08', '拒绝');
INSERT INTO `zp_employment` VALUES ('2855', '明动软件招聘', '张天池', '16839876597', '经理', '2019-12-28 16:34:27', '扁平化、技术提升、员工旅游、五险一金', '5000', '1、负责各种操作系统、应用系统的安装、部署、维护和调优工作；\r\n\r\n2、负责linux系统维护及故障处理，必须熟练使用linux下各种常用命令；\r\n\r\n3、负责weblogic、lvs、nginx、tomcat、redis等生产环境的部署应用及调优；\r\n\r\n4、负责项目业务系统集群的反向代理、负载均衡和高可用集群等部署配置；\r\n\r\n5、熟练掌握shell，能够应对日常工作中编写脚本的需求；\r\n\r\n6、负责oracle、mysql数据库安装、维护、数据迁移及故障排除；\r\n\r\n7、负责对项目现场制定并实施完善的数据库备份及灾害预防方案。', '审核通过', '20', '2904', '3', '21', '', '', '2019-12-28 16:34:27', '2019-12-28 16:34:27', '审核通过');
INSERT INTO `zp_employment` VALUES ('2897', '人寿服务部招聘', '古天乐', '13321677994', '销售员', '2019-11-21 00:00:00', '国企、收入高、晋升透明、双休', '8000', '工作内容：\r\n\r\n1.执行招聘工作流程，协调、办理员工招聘、入职、离职、调任、升职等手续。\r\n\r\n2.协同开展新员工入职培训，业务培训，执行培训计划，联系组织外部培训以及培训效果的跟踪、反馈。\r\n职位要求：专业不限，人力资源或相关专业优先考虑，条件优异者可放宽。', '待审核', '10', '2903', '4', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('2901', '安卓工程师招聘', '甄子丹', '13265994464', '程序员', '2019-10-20 00:00:00', '五险一金、高温补贴', '8000', '1、设计、实现、交付和测试Android app，并能够从技术和业务角度理解和拓展我们的产品 2、通过基于对业务和技术优先级的理解，与产品经理、设计师、后端工程师等协同合作 3、有优秀的问题解决能力，能通过将复杂问题分解为优雅的技术解决方案，并完成实现', '审核未通过', '10', '2355', '1', '7', '南昌', '江西', '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('2903', '商家运营招聘', '明凯', '15978451364', '经理', '2019-10-28 00:00:00', '五险一金、高温放假', '5000', '1、前期负责熟悉公司的整个大型ERP系统的业务和流程，手动编辑一些数据和图片信息上传到ERP系统；\r\n\r\n2、熟悉ERP并完成基础数据上传后，负责对接一些ERP用户的运营工作；\r\n\r\n3、完成领导交代的一些其他有关公司ERP产品上线前和上线后的运营工作，可能涉及数据录入、商户对接、培训等方面工作；', '审核未通过', '1', '2904', '5', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('2936', '产品经理招聘', '李伟', '18977526451', '经理', '2019-11-05 00:00:00', '带薪休假、健康体检', '8000', '1、专科及以上学历，理工科或者计算机相关专业；\r\n\r\n2、熟练使用excel公式，会PS一些简单的图片；\r\n\r\n3、对运营岗位感兴趣；\r\n\r\n4、有格局和远见，认同新零售供应链行业，服从公司的工作安排；\r\n\r\n5、此岗位可培养性很强，会接触很多领导，故希望此员工具有自驱力，愿意不断主动学习新知识；', '招聘中', '5', '2902', '6', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('2970', '金融助手招聘', '黄晓田', '17896263945', '助理', '2019-10-25 00:00:00', '五险一金、年终分红、带薪年假', '8000', '岗位要求:\r\n\r\n1、年龄：22-35岁，五官端正，无不良嗜好；\r\n\r\n2、性格开朗，责任心强，遵守纪律，反应灵敏，执行力强；\r\n\r\n3、有励志于长期业内发展意愿；\r\n\r\n4、认同公司的发展理念，愿意与公司共同发展，具有很强的工作责任心和团队合作精神；', '待审核', '1', '2903', '3小时', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('2973', '后期剪辑招聘', '林天社', '18752659956', '后期人员', '2019-11-27 00:00:00', '过节费、旅游奖励', '8000', '1.负责后期剪辑，包装，合成等工作（商业广告，宣传片，抖音短视频）。\r\n\r\n2.拥有独立完成项目后期的能力。\r\n\r\n3.可以对拍摄团队提出合理拍摄建议，特效建议等。', '审核通过', '10', '2355', '7', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('2980', '数据挖掘专家招聘', '蒙肖', '18755649852', '程序员', '2019-11-25 00:00:00', '五险一金、通讯补贴、年底双薪', '15000', '1、具备高复杂度的系统和架构开发经验者，有高并发网站或金融行业智能系统研发、设计经验者，优先; 2、有Flink、ES、Hive、Spark、HBase、图数据库等平台化调用整合经验者，优先；', '审核未通过', '3', '2904', '1', '7', '南昌', '江西', '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('3072', '招商经理招聘', '林华', '13549854611', '经理', '2019-11-15 00:00:00', '包吃、包住、餐补、房补', '7000', '1.依据市场/平台的发展策略,制定护肤／美妆／饰品等商品类目的招商计划；\r\n\r\n2.负责入驻商家的运营协调管理工作，提高运营效率；\r\n\r\n3.针对不同层级的商家提供有效的运营支持和帮助；', '审核通过', '10', '2903', '8', null, '', '', '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3113', '物理项目管理', '周驰飞', '15978515315', '管理人员', '2019-12-25 00:00:00', '年度旅游、五险一金、通讯补贴', '8000', '1、  物流项目管理，对于物流类项目能全程跟进、对项目实施过程有效的监督，确保项目交付质量；\r\n2、  按照项目管理要求，负责编制、收集、分析、审核各类文件表单，制作物流月度报表或物流数据分析；\r\n3、  保持与客户及公司内部业务部门良好的沟通，处理和协调项目交付工作中的疑难问题\r\n4、  项目指标、服务质量、操作流程的监控及优化；', '招聘完成', '30', '2902', '312', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3154', '销售经理招聘', '李飞飞', '18796563245', '经理', '2019-11-23 00:00:00', '五险一金、通讯补贴、年底双薪', '5000', '1、大专或以上学历；\r\n\r\n2、有多年销售经验，在教育行业有一定人脉，从事过教学设备、器材方面销售的优先；\r\n\r\n3、有驾照；', '审核通过', '10', '2904', '4', null, '', '', '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3155', 'Java开发工程师招聘', '刘市域', '17895264232', '程序员', '2019-10-05 00:00:00', '医疗保险、定期体检、免费班车', '15000', '1、承担公司产品后端架构、开发工作。\r\n\r\n2、参与系统体系结构分析、数据库、接口设计等工作；负责模块的核心代码编写；\r\n\r\n3、指导普通开发工程师的工作，审核代码质量，并协助解决疑难问题；\r\n\r\n4、负责系统的性能优化、技术难点攻关。', '审核通过', '2', '2355', '3小时', '7', null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3166', '前端开发工程师招聘', '李宏凯', '13213213456', '程序员', '2019-10-24 00:00:00', '采暖补、贴弹性工作、医疗保险', '8000', '1、根据产品设计文档、产品原型，利用前端相关技术，和UI工程师配合还原设计；\r\n2、Web前端功能设计、开发和实现，与后台工程师协作，完成数据交互；\r\n3、参与对基础组件的设计、编写和实现；\r\n4、负责前端新技术调研，系统安全、性能提升，并运用到实际开发。', '审核通过', '20', '2902', '20', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3167', '运营专员招聘', '李圣心', '13213213458', '管理人员', '2019-10-23 00:00:00', '五险一金、年底双薪、年终分红、加班补助', '5000', '1、运作券商核心部门子品牌；\r\n\r\n2、配合渠道经理策划线下活动，实现获客。\r\n\r\n3、协助公司App品牌宣传与业务的运营推广；\r\n\r\n4、制定微信与微博等新媒体平台营销推广方案；\r\n\r\n5、负责运营活动策划，并进行推广，实现运营效果最大化', '审核通过', '20', '2904', '20', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3184', '运营策划经理招聘', '黄俊天', '15798265325', '经理', '2019-10-20 00:00:00', '五险一金、年度旅游、年终分红加班补助、带薪年假、全勤奖、美女如云', '8000', '1.    负责BC端各类线上线下活动策划和执行，能有效的针对运营目标策划对应的活动类型，具有独立完成活动并推进活动落地执行的能力。\r\n\r\n2.    根据业务需求，针对不同的活动类型进行创新策划，确保活动以及策划有足够的吸引力以及影响力。\r\n\r\n3.    主动思考，提前做好策划储备以及积累，对市场敏感度高，能主动发起并进行产品推广方案的完成以及文案撰写。', '审核通过', '20', '2902', '8', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3189', '客户经理招聘', '雷鑫', '17895562355', '经理', '2019-11-24 00:00:00', '股票期权、交通补贴、高温补贴', '8000', '1、通过电话、拜访开发、维护企业客户，分析客户招聘需求,制定销售计划和招聘解决方案 ；\r\n\r\n2、服务合作中的客户并发掘潜在客户，独立完成新客户的开发；\r\n\r\n3、按期完成销售目标，负责解决方案制作,商务谈判，合同签订、回款等事项；\r\n\r\n4、定期拜访客户,持续关注客户使用情况和需求，维护客户关系，促进产品的二次销售；\r\n\r\n5、定期进行回访以及信息收集，整理和分析市场数据，并定期反馈最新信息；', '审核通过', '1', '2902', '24h', null, '', '', '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3194', '顾问销售招聘', '梁科基', '15589303039', '销售员', '2019-12-25 00:00:00', '五险一金、带薪年假、晋升快', '15000', '1、底薪高、有保障：试用期无责高底薪5000元/月；2、收入有竞争力：综合收入高于其他行业销售的收入水平，1年内新人平均月收入达到10000元，2年以上的经纪人平均月收入会迅速达到15000---20000元；3、收入公平：努力决定业绩，业绩决定提成；努力越多，收入越高，永不封顶。', '待审核', '10', '2355', '4', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3198', '摄像后期招聘', '高盛', '18765123165', '后期人员', '2019-11-22 00:00:00', '五险一金、加班补助', '5000', '1、跟大神一起，协助完成短视频的灯光、置景、导戏、拍摄、剪辑，圆你一个导演梦！\r\n\r\n2、把控短视频内容的脉络、节奏、风格、色调、音乐，让内容在你手里进行二次绽放！\r\n\r\n3、参与视频前期策划，独立撰写分镜脚本，享受与团队并肩作战的feel！', '审核未通过', '3', '2903', '3小时', '7', null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('3200', 'ios开发工程师招聘', '李毅', '19875232649', '程序员', '2019-10-25 00:00:00', '五险一金、包住、餐补', '8000', '1、负责IOS手机和平板应用开发；\r\n2、配合产品经理完成产品设计；\r\n3、按照产品设计完成指定的开发工作；\r\n\r\n4、根据测试反馈，修正测试中发现的问题；\r\n5、对IOS平台开发技术进行研究，根据开发过程中的体验对产品提出改进建议；\r\n6、操作app提交苹果审核流程，了解产品关键词，能够根据用户反馈，持续进行产品优化。', '招聘完成', '2', '2904', '3小时', '7', null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('3208', '销售经理招聘', '黄凯魏', '18645795631', '经理', '2019-12-25 00:00:00', '员工旅游、五险一金', '15000', '1. 公司提供意向客户资源，注重客户体验，一对一通过电话、微信与用户沟通，解决用户咨询问题；\r\n\r\n2. 通过系统化专业分析，帮助用户分析产品的优劣特征，正确地解答用户的疑问；\r\n\r\n3. 把握客户的细致需求，关怀客户的问题，帮助用户进行需求状况确认；\r\n\r\n4. 及时反馈客户诉求，促进网站产品迭代，提升用户体验和运营效率；', '审招聘完成', '11', '2904', '46', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3209', 'Python工程师招聘', '李廖晨', '16894515699', '程序员', '2019-11-15 00:00:00', '六险一金,年底双薪、出国旅行、包午晚餐', '15000', '1、负责开发Python后台系统，包括但不限于CMS系统、视频接入系统、MRSS系统等\r\n\r\n2、负责相应系统、模块的开发工作，包括需求分析、接口设计、数据设计、测试、性能优化等\r\n\r\n3、负责持续优化系统架构，提升系统性能，优化数据结构，提升系统可扩展性\r\n\r\n4、负责持续跟进系统 bug，构建高可用性后台系统', '审核通过', '4', '2355', '8', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3210', '视觉设计师招聘', '雷富田', '17896412315', '后期人员', '2019-11-21 00:00:00', '五险一金、加班补助', '8000', '1、负责公司游戏相关图片设计，熟练掌握PS.AE.SPINE.\r\n\r\n2、banner图,落地页,短视频等美术需求', '审核未通过', '2', '2903', '6', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '拒绝');
INSERT INTO `zp_employment` VALUES ('3223', '测试开发工程师招聘', '黄乡利', '18956513564', '程序员', '2019-11-02 00:00:00', '五险一金', '15000', '1、主要负责H5/小程序/京喜App渠道京东商城相关业务的测试工作，对被测对象进行需求分析、测试设计、测试执行、发布验证、线上问题跟进等闭环工作；兼顾进行对应业务所需要的测试工具、测试脚本开发，提升测试效率，通过多手段保障测试质量；\r\n2、具备良好的质量意识，对所负责测试的项目质量负责，能独立承担项目质量分析及推动工作；\r\n3、具有独立的测试项目管理协调能力，以及风险把控能力；\r\n4、挖掘工作中的问题及改进点，有效进行工作方法优化提升；具备较好的主动性和学习提升动力；\r\n5、掌握岗位所需要的基本技术和知识，并能沉淀工作方法和经验，进行分享传承。', '待审核', '1', '2902', '3小时', '7', null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3319', '市场营销招聘', '梁军垦', '17856232465', '销售员', '2019-01-02 00:00:00', '就近分配、季度晋升、无责底薪、弹性工作', '8000', '1．年龄：20-34周岁，大专及以上学历，退伍军人学历学历可放宽，专业不限\r\n\r\n2．学习能力强，并具备管理素养，在校有学生会工作经验或担任社团管理工作的同学优先\r\n\r\n3．阳光踏实，务实进取，有理想有追求\r\n\r\n4．具备良好的心理素养，具备团队合作精神', '审核通过', '5', '2355', '7', null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3320', '董事长助理招聘', '李伟达', '18812344321', '助理', '2019-12-25 00:00:00', '双休 五险一金', '15000', '1、协助董事长处理重要投资者关系，配合领导联络战略合作伙伴，与机构投资者接触，并与之保持持久的联系，做好联络、跟进维护等工作；\r\n\r\n2、上市公司的定增与路演，维护及提升公司在资本市场上的形象；\r\n\r\n3、协助董事长接待政府领导及重要客户，跟进联系及维护；\r\n\r\n4、与董秘办一起做媒体应急公关工作；\r\n\r\n5、起草董事长需要的文件；', '审核通过', '10', '2903', null, null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3321', 'php开发工程师 ', '李毅何', '18856984321', '程序员', '2019-10-25 00:00:00', '贴弹性工作、医疗保险', '8000', '1、负责前后台开发 \r\n\r\n   2、对现有架构、性能进行优化, 参与技术方案制定与实施 \r\n\r\n\r\n', '招聘中', '5', '2903', null, null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3347', '1212', '21', '1', null, '2019-12-28 00:00:00', null, null, null, '招聘中', null, '2903', null, null, null, null, '2019-12-28 15:40:06', '2019-12-28 15:40:06', '审核通过');
INSERT INTO `zp_employment` VALUES ('3348', '理发学员', '茸茸', '1245678902', '理发师', '2019-12-28 16:36:08', '周末双休', '3000', '有良好的能力', '待审核', '3', '2355', '4', null, null, null, '2019-12-28 16:36:08', '2019-12-28 16:36:08', '审核通过');
INSERT INTO `zp_employment` VALUES ('3349', '理发师', '森森', '1897075332432', '理发师', '2019-12-28 19:04:47', '周末双休', '3000', '头长者优先', null, '3', '2904', '6', null, null, null, '2019-12-28 19:04:47', '2019-12-28 19:04:47', null);

-- ----------------------------
-- Table structure for `zp_employment_jobhunter`
-- ----------------------------
DROP TABLE IF EXISTS `zp_employment_jobhunter`;
CREATE TABLE `zp_employment_jobhunter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ask_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `employment_id` bigint(20) NOT NULL,
  `jobhunter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employment_id` (`employment_id`),
  KEY `jobhunter_id` (`jobhunter_id`),
  CONSTRAINT `zp_employment_jobhunter_ibfk_1` FOREIGN KEY (`employment_id`) REFERENCES `zp_employment` (`id`),
  CONSTRAINT `zp_employment_jobhunter_ibfk_2` FOREIGN KEY (`jobhunter_id`) REFERENCES `zp_jobhunter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_employment_jobhunter
-- ----------------------------
INSERT INTO `zp_employment_jobhunter` VALUES ('1', '2019-11-15 16:23:31', '已联系', '2897', '1069');
INSERT INTO `zp_employment_jobhunter` VALUES ('70', '2019-09-26 22:20:26', 'null', '360', '1069');
INSERT INTO `zp_employment_jobhunter` VALUES ('75', '2019-09-26 22:11:24', 'null', '2855', '32');
INSERT INTO `zp_employment_jobhunter` VALUES ('79', '2019-09-26 22:21:03', 'null', '360', '1074');
INSERT INTO `zp_employment_jobhunter` VALUES ('83', '2019-10-03 08:16:45', '已联系,2019/10/02,', '360', '1136');
INSERT INTO `zp_employment_jobhunter` VALUES ('87', '2019-10-02 15:31:22', null, '2855', '1177');
INSERT INTO `zp_employment_jobhunter` VALUES ('90', '2019-10-02 16:14:43', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('91', '2019-10-02 17:45:57', '已联系,2,2', '360', '1179');
INSERT INTO `zp_employment_jobhunter` VALUES ('92', '2019-10-02 17:47:53', '稍后联系,2019/10/3,电话无法接通', '2897', '1180');
INSERT INTO `zp_employment_jobhunter` VALUES ('94', '2019-10-02 16:15:30', null, '2903', '1179');
INSERT INTO `zp_employment_jobhunter` VALUES ('96', '2019-10-02 16:17:03', null, '360', '1181');
INSERT INTO `zp_employment_jobhunter` VALUES ('97', '2019-10-02 16:17:03', null, '360', '1181');
INSERT INTO `zp_employment_jobhunter` VALUES ('98', '2019-10-02 16:17:03', null, '2903', '1181');
INSERT INTO `zp_employment_jobhunter` VALUES ('99', '2019-10-02 16:17:04', null, '360', '1181');
INSERT INTO `zp_employment_jobhunter` VALUES ('100', '2019-10-02 16:17:50', null, '2855', '1177');
INSERT INTO `zp_employment_jobhunter` VALUES ('101', '2019-10-02 16:18:27', null, '2855', '1182');
INSERT INTO `zp_employment_jobhunter` VALUES ('102', '2019-10-02 16:19:04', null, '2897', '1183');
INSERT INTO `zp_employment_jobhunter` VALUES ('103', '2019-10-02 16:19:04', null, '2903', '1183');
INSERT INTO `zp_employment_jobhunter` VALUES ('104', '2019-10-02 16:19:04', null, '360', '1183');
INSERT INTO `zp_employment_jobhunter` VALUES ('105', '2019-10-02 16:19:04', null, '360', '1183');
INSERT INTO `zp_employment_jobhunter` VALUES ('106', '2019-10-02 16:19:04', null, '360', '1184');
INSERT INTO `zp_employment_jobhunter` VALUES ('107', '2019-10-02 17:51:16', '已联系,,', '2855', '1183');
INSERT INTO `zp_employment_jobhunter` VALUES ('108', '2019-10-02 21:04:46', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('109', '2019-10-02 21:05:07', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('110', '2019-10-02 21:05:44', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('111', '2019-10-02 21:05:44', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('112', '2019-10-02 21:07:01', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('113', '2019-10-02 21:07:52', null, '360', '1185');
INSERT INTO `zp_employment_jobhunter` VALUES ('114', '2019-10-04 09:29:51', null, '360', '1188');
INSERT INTO `zp_employment_jobhunter` VALUES ('115', '2019-10-04 09:35:07', null, '360', '1189');
INSERT INTO `zp_employment_jobhunter` VALUES ('116', '2019-10-04 09:35:17', null, '360', '1189');
INSERT INTO `zp_employment_jobhunter` VALUES ('117', '2019-10-04 09:36:33', null, '360', '1189');
INSERT INTO `zp_employment_jobhunter` VALUES ('118', '2019-10-04 09:41:31', null, '360', '1189');
INSERT INTO `zp_employment_jobhunter` VALUES ('119', '2019-10-04 09:42:00', null, '360', '1189');
INSERT INTO `zp_employment_jobhunter` VALUES ('120', '2019-10-04 14:54:06', null, '360', '1194');
INSERT INTO `zp_employment_jobhunter` VALUES ('126', '2019-10-05 10:42:19', null, '360', '1069');
INSERT INTO `zp_employment_jobhunter` VALUES ('127', '2019-10-05 10:42:56', null, '2855', '1069');
INSERT INTO `zp_employment_jobhunter` VALUES ('130', '2019-10-05 10:45:06', null, '360', '1202');
INSERT INTO `zp_employment_jobhunter` VALUES ('131', '2019-10-05 15:58:36', null, '360', '1202');
INSERT INTO `zp_employment_jobhunter` VALUES ('133', '2019-10-05 15:58:52', null, '360', '1202');
INSERT INTO `zp_employment_jobhunter` VALUES ('135', '2019-10-05 16:03:40', null, '360', '1202');
INSERT INTO `zp_employment_jobhunter` VALUES ('136', '2019-10-05 16:56:46', null, '360', '1205');
INSERT INTO `zp_employment_jobhunter` VALUES ('137', '2019-10-05 17:03:01', null, '360', '1205');
INSERT INTO `zp_employment_jobhunter` VALUES ('138', '2019-10-05 17:07:38', null, '2903', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('139', '2019-10-05 18:12:12', null, '360', '1208');
INSERT INTO `zp_employment_jobhunter` VALUES ('140', '2019-10-05 18:13:36', null, '360', '1209');
INSERT INTO `zp_employment_jobhunter` VALUES ('141', '2019-10-05 18:15:55', null, '360', '1210');
INSERT INTO `zp_employment_jobhunter` VALUES ('142', '2019-10-05 18:16:01', null, '360', '1211');
INSERT INTO `zp_employment_jobhunter` VALUES ('143', '2019-10-05 18:16:04', null, '360', '1211');
INSERT INTO `zp_employment_jobhunter` VALUES ('144', '2019-10-05 18:16:11', null, '360', '1212');
INSERT INTO `zp_employment_jobhunter` VALUES ('145', '2019-10-05 18:16:45', null, '360', '1212');
INSERT INTO `zp_employment_jobhunter` VALUES ('146', '2019-10-05 18:16:51', null, '360', '1210');
INSERT INTO `zp_employment_jobhunter` VALUES ('147', '2019-10-05 18:16:55', null, '360', '1213');
INSERT INTO `zp_employment_jobhunter` VALUES ('149', '2019-10-05 18:18:41', null, '360', '1213');
INSERT INTO `zp_employment_jobhunter` VALUES ('150', '2019-10-05 18:18:50', null, '360', '1213');
INSERT INTO `zp_employment_jobhunter` VALUES ('151', '2019-10-05 18:19:13', null, '360', '1213');
INSERT INTO `zp_employment_jobhunter` VALUES ('153', '2019-10-05 18:19:38', null, '360', '1214');
INSERT INTO `zp_employment_jobhunter` VALUES ('154', '2019-10-05 20:29:54', null, '360', '1215');
INSERT INTO `zp_employment_jobhunter` VALUES ('155', '2019-10-06 15:01:06', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('163', '2019-10-06 15:02:05', null, '360', '1216');
INSERT INTO `zp_employment_jobhunter` VALUES ('168', '2019-10-06 15:02:32', null, '360', '1216');
INSERT INTO `zp_employment_jobhunter` VALUES ('169', '2019-10-06 15:05:27', null, '360', '1217');
INSERT INTO `zp_employment_jobhunter` VALUES ('170', '2019-10-06 15:05:37', null, '360', '1218');
INSERT INTO `zp_employment_jobhunter` VALUES ('171', '2019-10-06 15:05:54', null, '360', '1218');
INSERT INTO `zp_employment_jobhunter` VALUES ('172', '2019-10-06 15:05:58', null, '360', '1218');
INSERT INTO `zp_employment_jobhunter` VALUES ('173', '2019-10-06 15:07:16', null, '360', '1219');
INSERT INTO `zp_employment_jobhunter` VALUES ('174', '2019-10-06 15:07:25', null, '360', '1220');
INSERT INTO `zp_employment_jobhunter` VALUES ('175', '2019-10-06 15:09:43', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('176', '2019-10-06 15:09:59', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('177', '2019-10-06 15:10:03', null, '360', '1221');
INSERT INTO `zp_employment_jobhunter` VALUES ('178', '2019-10-06 15:10:08', null, '360', '1221');
INSERT INTO `zp_employment_jobhunter` VALUES ('179', '2019-10-06 15:10:23', null, '360', '1221');
INSERT INTO `zp_employment_jobhunter` VALUES ('180', '2019-10-06 15:10:30', null, '360', '1221');
INSERT INTO `zp_employment_jobhunter` VALUES ('181', '2019-10-06 15:13:29', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('182', '2019-10-06 15:13:34', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('183', '2019-10-06 15:13:38', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('184', '2019-10-06 15:17:41', null, '360', '1221');
INSERT INTO `zp_employment_jobhunter` VALUES ('185', '2019-10-06 15:18:16', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('186', '2019-10-06 15:18:21', null, '360', '1223');
INSERT INTO `zp_employment_jobhunter` VALUES ('187', '2019-10-06 15:18:36', null, '360', '1223');
INSERT INTO `zp_employment_jobhunter` VALUES ('188', '2019-10-06 15:18:49', null, '360', '1223');
INSERT INTO `zp_employment_jobhunter` VALUES ('189', '2019-10-06 15:19:04', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('190', '2019-10-06 15:19:12', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('191', '2019-10-06 15:19:20', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('192', '2019-10-06 15:20:26', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('193', '2019-10-06 15:20:33', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('194', '2019-10-06 15:20:48', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('195', '2019-10-06 15:21:07', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('196', '2019-10-06 15:21:12', null, '360', '1224');
INSERT INTO `zp_employment_jobhunter` VALUES ('197', '2019-10-06 15:23:44', null, '360', '1224');
INSERT INTO `zp_employment_jobhunter` VALUES ('198', '2019-10-06 15:23:52', null, '360', '1224');
INSERT INTO `zp_employment_jobhunter` VALUES ('199', '2019-10-06 15:23:56', null, '360', '1225');
INSERT INTO `zp_employment_jobhunter` VALUES ('200', '2019-10-06 15:24:33', null, '360', '1226');
INSERT INTO `zp_employment_jobhunter` VALUES ('201', '2019-10-06 15:24:48', null, '360', '1227');
INSERT INTO `zp_employment_jobhunter` VALUES ('202', '2019-10-06 15:25:56', null, '360', '1228');
INSERT INTO `zp_employment_jobhunter` VALUES ('203', '2019-10-06 15:26:01', null, '360', '1229');
INSERT INTO `zp_employment_jobhunter` VALUES ('204', '2019-10-06 15:27:05', null, '360', '1230');
INSERT INTO `zp_employment_jobhunter` VALUES ('205', '2019-10-06 15:27:07', null, '360', '1231');
INSERT INTO `zp_employment_jobhunter` VALUES ('206', '2019-10-06 15:27:11', null, '360', '1232');
INSERT INTO `zp_employment_jobhunter` VALUES ('207', '2019-10-06 15:27:15', null, '360', '1233');
INSERT INTO `zp_employment_jobhunter` VALUES ('208', '2019-10-06 15:27:35', null, '360', '1230');
INSERT INTO `zp_employment_jobhunter` VALUES ('209', '2019-10-06 15:27:37', null, '360', '1230');
INSERT INTO `zp_employment_jobhunter` VALUES ('210', '2019-10-06 15:27:37', null, '360', '1230');
INSERT INTO `zp_employment_jobhunter` VALUES ('211', '2019-10-06 15:28:10', null, '360', '1230');
INSERT INTO `zp_employment_jobhunter` VALUES ('212', '2019-10-06 15:28:12', null, '360', '1234');
INSERT INTO `zp_employment_jobhunter` VALUES ('213', '2019-10-06 15:28:35', null, '360', '1234');
INSERT INTO `zp_employment_jobhunter` VALUES ('214', '2019-10-06 15:28:38', null, '360', '1234');
INSERT INTO `zp_employment_jobhunter` VALUES ('215', '2019-10-06 15:28:57', null, '360', '1234');
INSERT INTO `zp_employment_jobhunter` VALUES ('216', '2019-10-06 15:29:54', null, '360', '1235');
INSERT INTO `zp_employment_jobhunter` VALUES ('217', '2019-10-06 15:31:00', null, '360', '1235');
INSERT INTO `zp_employment_jobhunter` VALUES ('218', '2019-10-06 15:32:04', null, '360', '1235');
INSERT INTO `zp_employment_jobhunter` VALUES ('222', '2019-10-06 17:39:27', null, '2897', '1239');
INSERT INTO `zp_employment_jobhunter` VALUES ('223', '2019-10-06 20:36:31', null, '360', '1243');
INSERT INTO `zp_employment_jobhunter` VALUES ('224', '2019-10-06 20:36:34', null, '360', '1244');
INSERT INTO `zp_employment_jobhunter` VALUES ('225', '2019-10-06 20:39:59', null, '360', '1245');
INSERT INTO `zp_employment_jobhunter` VALUES ('226', '2019-10-06 20:40:02', null, '360', '1246');
INSERT INTO `zp_employment_jobhunter` VALUES ('227', '2019-10-06 20:41:08', null, '360', '1247');
INSERT INTO `zp_employment_jobhunter` VALUES ('228', '2019-10-06 20:41:23', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('229', '2019-10-06 20:42:26', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('230', '2019-10-06 20:45:33', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('231', '2019-10-06 20:45:37', null, '360', '1248');
INSERT INTO `zp_employment_jobhunter` VALUES ('232', '2019-10-06 20:45:44', null, '360', '1248');
INSERT INTO `zp_employment_jobhunter` VALUES ('233', '2019-10-06 20:57:28', null, '360', '1249');
INSERT INTO `zp_employment_jobhunter` VALUES ('234', '2019-10-06 20:58:22', null, '360', '1249');
INSERT INTO `zp_employment_jobhunter` VALUES ('235', '2019-10-07 11:15:04', null, '360', '1265');
INSERT INTO `zp_employment_jobhunter` VALUES ('236', '2019-10-07 11:16:28', null, '360', '1266');
INSERT INTO `zp_employment_jobhunter` VALUES ('237', '2019-10-07 11:21:38', null, '360', '1267');
INSERT INTO `zp_employment_jobhunter` VALUES ('238', '2019-10-07 11:24:28', null, '360', '1179');
INSERT INTO `zp_employment_jobhunter` VALUES ('239', '2019-10-07 11:25:38', null, '2855', '1268');
INSERT INTO `zp_employment_jobhunter` VALUES ('240', '2019-10-07 11:26:40', null, '2855', '1269');
INSERT INTO `zp_employment_jobhunter` VALUES ('241', '2019-10-07 14:09:53', null, '2897', '1271');
INSERT INTO `zp_employment_jobhunter` VALUES ('242', '2019-10-07 14:16:15', null, '360', '1272');
INSERT INTO `zp_employment_jobhunter` VALUES ('243', '2019-10-07 14:17:27', null, '360', '1273');
INSERT INTO `zp_employment_jobhunter` VALUES ('244', '2019-10-07 14:22:43', null, '2855', '1273');
INSERT INTO `zp_employment_jobhunter` VALUES ('245', '2019-10-07 14:26:33', null, '2970', '1272');
INSERT INTO `zp_employment_jobhunter` VALUES ('246', '2019-10-07 14:32:36', null, '2973', '1275');
INSERT INTO `zp_employment_jobhunter` VALUES ('247', '2019-10-07 19:55:18', null, '2855', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('248', '2019-10-07 19:56:41', null, '360', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('249', '2019-10-07 20:00:54', null, '2855', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('250', '2019-10-07 20:03:20', null, '360', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('252', '2019-10-07 20:08:45', null, '360', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('253', '2019-10-07 20:12:10', null, '2901', '1087');
INSERT INTO `zp_employment_jobhunter` VALUES ('254', '2019-10-07 20:12:54', null, '2855', '1280');
INSERT INTO `zp_employment_jobhunter` VALUES ('255', '2019-10-07 21:07:42', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('258', '2019-10-07 22:05:47', null, '360', '1281');
INSERT INTO `zp_employment_jobhunter` VALUES ('259', '2019-10-07 22:08:01', null, '360', '1224');
INSERT INTO `zp_employment_jobhunter` VALUES ('260', '2019-10-07 22:38:34', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('261', '2019-10-07 22:38:35', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('262', '2019-10-07 23:15:46', null, '360', '1282');
INSERT INTO `zp_employment_jobhunter` VALUES ('263', '2019-10-07 23:16:04', null, '360', '1282');
INSERT INTO `zp_employment_jobhunter` VALUES ('264', '2019-10-07 23:18:01', null, '360', '1282');
INSERT INTO `zp_employment_jobhunter` VALUES ('265', '2019-10-07 23:18:06', null, '360', '1283');
INSERT INTO `zp_employment_jobhunter` VALUES ('266', '2019-10-07 23:21:43', null, '360', '1283');
INSERT INTO `zp_employment_jobhunter` VALUES ('267', '2019-10-07 23:21:47', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('268', '2019-10-07 23:23:25', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('269', '2019-10-07 23:23:26', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('270', '2019-10-07 23:23:26', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('271', '2019-10-07 23:23:26', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('272', '2019-10-07 23:23:28', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('273', '2019-10-07 23:23:28', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('274', '2019-10-07 23:23:28', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('275', '2019-10-07 23:23:29', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('276', '2019-10-07 23:23:29', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('277', '2019-10-07 23:23:29', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('278', '2019-10-07 23:23:29', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('279', '2019-10-07 23:23:30', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('280', '2019-10-07 23:23:32', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('281', '2019-10-07 23:23:37', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('282', '2019-10-07 23:23:37', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('283', '2019-10-07 23:26:27', null, '360', '1285');
INSERT INTO `zp_employment_jobhunter` VALUES ('284', '2019-10-07 23:27:02', null, '360', '1284');
INSERT INTO `zp_employment_jobhunter` VALUES ('285', '2019-10-07 23:27:06', null, '360', '1286');
INSERT INTO `zp_employment_jobhunter` VALUES ('286', '2019-10-08 09:08:33', null, '360', '1305');
INSERT INTO `zp_employment_jobhunter` VALUES ('287', '2019-10-08 09:09:02', null, '2936', '1306');
INSERT INTO `zp_employment_jobhunter` VALUES ('288', '2019-10-08 09:09:26', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('289', '2019-10-08 09:09:26', null, '2936', '1308');
INSERT INTO `zp_employment_jobhunter` VALUES ('290', '2019-10-08 09:10:01', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('291', '2019-10-08 09:10:14', null, '2936', '1310');
INSERT INTO `zp_employment_jobhunter` VALUES ('292', '2019-10-08 09:13:02', null, '2897', '1311');
INSERT INTO `zp_employment_jobhunter` VALUES ('293', '2019-10-08 09:13:08', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('294', '2019-10-08 09:13:30', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('295', '2019-10-08 09:13:53', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('296', '2019-10-08 09:14:35', null, '360', '1307');
INSERT INTO `zp_employment_jobhunter` VALUES ('297', '2019-10-08 09:28:27', null, '360', '1319');
INSERT INTO `zp_employment_jobhunter` VALUES ('298', '2019-10-08 09:33:16', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('299', '2019-10-08 09:33:50', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('300', '2019-10-08 09:34:24', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('301', '2019-10-08 09:34:41', null, '2855', '1266');
INSERT INTO `zp_employment_jobhunter` VALUES ('302', '2019-10-08 09:34:52', null, '360', '1153');
INSERT INTO `zp_employment_jobhunter` VALUES ('303', '2019-10-08 09:37:49', null, '360', '1324');
INSERT INTO `zp_employment_jobhunter` VALUES ('304', '2019-10-08 09:39:32', null, '2901', '1266');
INSERT INTO `zp_employment_jobhunter` VALUES ('305', '2019-10-08 09:43:53', null, '2897', '1268');
INSERT INTO `zp_employment_jobhunter` VALUES ('308', '2019-10-08 09:44:48', null, '2897', '1328');
INSERT INTO `zp_employment_jobhunter` VALUES ('313', '2019-10-08 09:45:40', null, '2901', '1330');
INSERT INTO `zp_employment_jobhunter` VALUES ('317', '2019-10-08 09:46:09', null, '360', '1331');
INSERT INTO `zp_employment_jobhunter` VALUES ('318', '2019-10-08 09:46:31', null, '360', '1332');
INSERT INTO `zp_employment_jobhunter` VALUES ('320', '2019-10-08 09:51:06', null, '2901', '1336');
INSERT INTO `zp_employment_jobhunter` VALUES ('321', '2019-10-08 09:52:03', null, '2855', '1337');
INSERT INTO `zp_employment_jobhunter` VALUES ('322', '2019-10-08 09:52:17', null, '2897', '1338');
INSERT INTO `zp_employment_jobhunter` VALUES ('323', '2019-10-08 10:00:24', null, '360', '1345');
INSERT INTO `zp_employment_jobhunter` VALUES ('324', '2019-10-08 10:04:43', null, '2901', '1348');
INSERT INTO `zp_employment_jobhunter` VALUES ('325', '2019-10-08 10:05:10', null, '2903', '1348');
INSERT INTO `zp_employment_jobhunter` VALUES ('326', '2019-10-08 10:05:31', null, '2901', '1349');
INSERT INTO `zp_employment_jobhunter` VALUES ('327', '2019-10-08 10:06:00', null, '2901', '1350');
INSERT INTO `zp_employment_jobhunter` VALUES ('328', '2019-10-08 10:07:45', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('329', '2019-10-08 10:11:28', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('330', '2019-10-08 10:11:31', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('331', '2019-10-08 10:11:58', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('332', '2019-10-08 10:12:04', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('333', '2019-10-08 10:12:30', null, '360', '1358');
INSERT INTO `zp_employment_jobhunter` VALUES ('334', '2019-10-08 10:17:59', null, '360', '1361');
INSERT INTO `zp_employment_jobhunter` VALUES ('335', '2019-10-08 10:18:24', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('336', '2019-10-08 10:19:24', null, '360', '1362');
INSERT INTO `zp_employment_jobhunter` VALUES ('337', '2019-10-08 10:20:39', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('339', '2019-10-08 10:22:32', null, '360', '1363');
INSERT INTO `zp_employment_jobhunter` VALUES ('340', '2019-10-08 10:25:15', null, '360', '1364');
INSERT INTO `zp_employment_jobhunter` VALUES ('341', '2019-10-08 11:11:14', null, '2855', '1373');
INSERT INTO `zp_employment_jobhunter` VALUES ('342', '2019-10-08 11:11:34', null, '360', '1374');
INSERT INTO `zp_employment_jobhunter` VALUES ('343', '2019-10-08 11:12:21', null, '2901', '1336');
INSERT INTO `zp_employment_jobhunter` VALUES ('344', '2019-10-08 11:16:45', null, '2897', '1336');
INSERT INTO `zp_employment_jobhunter` VALUES ('345', '2019-10-08 11:18:13', null, '2897', '1336');
INSERT INTO `zp_employment_jobhunter` VALUES ('346', '2019-10-08 11:18:54', null, '2897', '1375');
INSERT INTO `zp_employment_jobhunter` VALUES ('347', '2019-10-08 14:41:57', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('348', '2019-10-08 14:42:02', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('349', '2019-10-08 14:42:12', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('350', '2019-10-08 14:43:03', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('351', '2019-10-08 14:43:23', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('352', '2019-10-08 14:45:29', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('353', '2019-10-08 14:45:32', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('354', '2019-10-08 14:45:37', null, '360', '1222');
INSERT INTO `zp_employment_jobhunter` VALUES ('355', '2019-10-08 14:46:13', null, '360', '1397');
INSERT INTO `zp_employment_jobhunter` VALUES ('356', '2019-10-08 14:46:18', null, '360', '1397');
INSERT INTO `zp_employment_jobhunter` VALUES ('357', '2019-10-08 14:47:32', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('358', '2019-10-08 14:47:32', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('359', '2019-10-08 14:47:32', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('360', '2019-10-08 14:47:32', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('361', '2019-10-08 14:47:32', null, '360', '1198');
INSERT INTO `zp_employment_jobhunter` VALUES ('362', '2019-10-08 14:50:44', null, '360', '1239');
INSERT INTO `zp_employment_jobhunter` VALUES ('363', '2019-10-08 22:31:30', null, '360', '1239');
INSERT INTO `zp_employment_jobhunter` VALUES ('364', '2019-10-17 22:19:53', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('365', '2019-10-21 16:21:43', '稍后联系', '360', '32');
INSERT INTO `zp_employment_jobhunter` VALUES ('366', '2019-10-28 16:09:56', '已联系', '360', '32');
INSERT INTO `zp_employment_jobhunter` VALUES ('367', '2019-10-28 16:26:57', null, '2901', '1426');
INSERT INTO `zp_employment_jobhunter` VALUES ('368', '2019-10-30 17:29:58', null, '3200', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('369', '2019-11-05 16:41:28', null, '3194', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('370', '2019-11-11 11:03:16', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('371', '2019-11-18 14:06:42', null, '360', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('372', '2019-11-18 15:51:13', null, '2970', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('373', '2019-11-24 18:33:33', null, '2897', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('374', '2019-11-24 18:33:33', null, '2897', '1070');
INSERT INTO `zp_employment_jobhunter` VALUES ('375', '2019-11-25 20:49:20', null, '2855', '1397');
INSERT INTO `zp_employment_jobhunter` VALUES ('376', '2019-11-26 15:11:18', null, '360', '1397');
INSERT INTO `zp_employment_jobhunter` VALUES ('377', '2019-11-26 15:14:21', null, '360', '1397');
INSERT INTO `zp_employment_jobhunter` VALUES ('378', '2019-11-28 20:18:22', null, '360', '1469');

-- ----------------------------
-- Table structure for `zp_jobhunter`
-- ----------------------------
DROP TABLE IF EXISTS `zp_jobhunter`;
CREATE TABLE `zp_jobhunter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `work_time` varchar(255) DEFAULT NULL,
  `current_status` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5556 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_jobhunter
-- ----------------------------
INSERT INTO `zp_jobhunter` VALUES ('32', '往事随风', '', '刘能', '男', '1998.05.12', '13977977777', '本科', '', '求职者', '');
INSERT INTO `zp_jobhunter` VALUES ('1069', '长城', '', '莉莉', '女', '1997.03.15', '18688888888', '博士', '', '', '');
INSERT INTO `zp_jobhunter` VALUES ('1070', '三年级', '123123', '张三', '男', '1998.11.02', '15478459874', '专科', '朝九晚五', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1074', '外网', '111111111111', '张柠', '女', '1997.08.18', '12728292555', '大专', '', '', '');
INSERT INTO `zp_jobhunter` VALUES ('1087', '233', null, '王超', '男', '12', '123', '小学', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1136', '郝先生', null, '郝鸽鸽', '男', null, '1', '本科', null, null, 'male');
INSERT INTO `zp_jobhunter` VALUES ('1153', 'hx', '1234', '黄鑫', '男', '1998.03', '123456789', '本科', '', null, '');
INSERT INTO `zp_jobhunter` VALUES ('1177', '皮卡丘2', '121', '皮卡丘', '女', '2000', '1234', '本科', null, '求职中', null);
INSERT INTO `zp_jobhunter` VALUES ('1179', '皮卡丘1', null, '皮卡皮卡', '男', '1997/5/20', '12345', '博士', '2年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1180', '皮卡丘', null, '皮卡皮卡', '男', '1997/5/20', '12345', '博士', '2年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1181', '憨憨', null, '憨八龟', '男', null, '15707031913', '博士', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1182', '方法', '', '皮卡丘', '男', '2000', '157070', '本科', null, null, '');
INSERT INTO `zp_jobhunter` VALUES ('1183', '11', null, '11', '女', '1900', '1570903', '博士', '', '', null);
INSERT INTO `zp_jobhunter` VALUES ('1184', '11', null, '11', '男', '1900', '1570903', '博士', '', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1185', '小娴', '111111111111', '王二麻', '女', '1997-10-18', '234879452968345', '本科', null, null, '');
INSERT INTO `zp_jobhunter` VALUES ('1188', '1', null, null, '女', null, null, '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1189', '张益达', null, '李伟', '男', '1', '18812344321', '本科', '1', 'null', '');
INSERT INTO `zp_jobhunter` VALUES ('1194', '213213', '123456', '张三', '男', '2019/10/01', '1568888888', '研究生', '无', null, '无');
INSERT INTO `zp_jobhunter` VALUES ('1198', null, null, '111', '女', '111', '11', '本科', null, null, '111');
INSERT INTO `zp_jobhunter` VALUES ('1202', null, null, '张三', '男', null, '15535166703', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1205', null, null, '佳佳', '男', null, '15535156663', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1208', null, null, '佳佳', '男', null, '15535166635', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1209', null, null, '加急', '男', null, '1553346666', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1210', null, null, '哈', '男', null, '15536444', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1211', null, null, '哈', '男', null, '155364445', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1212', null, null, '哈', '男', null, '15536444555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1213', null, null, '哈', '男', null, '1553644422', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1214', null, null, '看看', '男', null, '1553511111', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1215', null, null, '张三', '男', null, '13366331113', '研究生', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1216', 'null', null, '梁iiiui', '女', null, '155', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1217', null, null, '是', '女', null, '12', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1218', null, null, '是', '女', null, '125555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1219', null, null, '是是', '女', null, '12555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1220', null, null, '', '男', null, '144654565', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1221', null, null, '搜索', '男', null, '555555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1222', null, null, '流量', '女', null, '1555555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1223', null, null, '搜索', '男', null, '15555555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1224', null, null, '搜索', '女', null, '1111111111', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1225', '皇家空军', null, '搜索', '男', null, '111111110', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1226', null, null, '搜索', '男', null, '11111111', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1227', null, null, '搜索', '女', null, '2222222', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1228', null, null, '哈哈哈', '男', null, '222222', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1229', null, null, '哈哈哈', '男', null, '222222555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1230', null, null, '哈哈哈', '男', null, '2222225', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1231', null, null, '哈哈哈', '男', null, '222222500', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1232', 'null', null, 'ii语言', '女', null, '2222225000000', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1233', null, null, '哈哈哈', '男', null, '2222225000', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1234', null, null, '哈哈哈', '男', null, '222222522', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1235', null, null, '哈哈哈', '男', null, '22222252', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1239', null, null, '日日日', '女', '2019-10-15', '111111111', '普通高中(包括中职)', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1243', null, null, '那你', '男', null, '12222', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1244', null, null, '那你', '男', null, '122221111', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1245', null, null, '那你', '男', null, '1222211', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1246', null, null, '那你', '男', null, '122221122', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1247', null, null, '那你', '男', null, '122221', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1248', null, null, '搜索', '女', null, '222222222', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1249', null, null, '哈哈', '男', null, '5555555555', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1265', '丫丫', null, '小艾', '女', '1997-7-9', '123455678', '本科', '2年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1266', '明明', null, '小明', '女', '1995-2-3', '123123123212', '本科', '1年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1267', '王五', null, '王五', '男', '1994-4-5', '12342345354', '本科', '1年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1268', '小明明', null, '明明', '男', '2000-3-3', '11111111111111111', '本科', '1年', 'null', '');
INSERT INTO `zp_jobhunter` VALUES ('1269', '鑫鑫', null, '小鑫', '女', '1999-3-8', '2222222222222', '大专', '1年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1271', '1', null, '1', '女', '1', '18879827866', '本科', '1', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1272', '小三', null, '黄三', '男', '200010', '1234566', '本科', '3年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1273', '小四', null, '刘四', '女', '1990', '1233', '专科', '5年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1275', '小七', null, '琪琪', '女', '1989', '18989839238', '初中', '2年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1280', null, null, '喵喵喵', '女', null, '123123123', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1281', null, null, '藏三', '男', '2019-10-07', '11111111111', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1282', null, null, '张三', '男', null, '123333333', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1283', null, null, '张三', '男', null, '12333333322', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1284', null, null, '张', '男', null, '123333', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1285', '路人甲', null, '边城', '男', '1997-1-1', '18777465231', '本科', '暂无', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1286', 'null', '', '张是', '男', '1997', '123333111', '本科', '', '', '');
INSERT INTO `zp_jobhunter` VALUES ('1305', '232', null, '23', '男', null, '23', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1306', '5V5', null, '王者峡谷', '女', '1997.07', null, '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1307', '张大帅', null, '张三', '男', '1997年9月10好', '197732984792347', '本科', '3年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1308', '125', null, '无极', '女', null, '1234156789', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1310', '123', null, '312', '女', '1322313', '12345678909', '本科', '1年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1311', 'crystal', null, 'qiuqian', '男', '19980908', '15179519999', '高中及以下', '3年以上', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1319', '7888', null, '7', '男', '7', '7', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1324', '6', null, '6', '女', '6', '9527', '本科', '6', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1328', '小吴', null, '王五', '女', '1999-1-2', '1231', '本科', '无', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1330', '211', null, '1111111', '男', '1221', '12321', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1331', '12', null, '112', '男', '121', '22', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1332', '159', null, '弟弟', '男', '357', '456', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1336', '123456', null, '李四', '男', '1989.12', '15693450922', '本科', '3年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1337', '112112', null, '1111111111', '女', '1111111111', '211', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1338', '邓', null, '对对对', '女', '1121', '11111112', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1345', '111', null, 'lan', '男', '1998', '18819981998', '专科', '1~3年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1348', '312', null, '213', '男', '312', '321', '本科', '312', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1349', '312', null, '窝窝窝为', '男', '312', '131131313313', '本科', '312', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1350', '312', null, '窝窝窝为', '男', '312', '17313114499', '本科', '312', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1358', '1', null, '1', '女', '1', '121', '本科', '1', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1361', '123', null, '123', '女', '123', '103039333', '本科', '6年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1362', '嗯嗯', null, '11212', '女', '11', '111', '研究生', null, null, '111');
INSERT INTO `zp_jobhunter` VALUES ('1363', null, null, '2341', '男', null, '727374234', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1364', '321', null, '321', '女', '321', '3213421345367', '本科', '123123', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1373', 'asdf', null, '哈哈哈', '男', '1998.11.11', '5941888888888888', '本科', '无', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1374', '1', null, '1', '男', '1', '18879827860', '本科', '1', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1375', '123456', null, '李四', '男', '1989-12-1', '15693450923', '本科', '3年', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1397', '尽快解决', null, '', '男', null, '', '本科', null, null, null);
INSERT INTO `zp_jobhunter` VALUES ('1426', 'yanz', null, 'zht Yan', '男', '12', '13672223717', '本科', '3', null, null);
INSERT INTO `zp_jobhunter` VALUES ('1469', null, 'wqer', '112121221', '女', null, '18821415140', '本科', '34', '求职者', null);
INSERT INTO `zp_jobhunter` VALUES ('2222', '2222222222222', '2222222222222222', '22222222222', '女', '22222222', '222222222222222222', '本科', '2', '22222222222', '222222222');
INSERT INTO `zp_jobhunter` VALUES ('3333', '222222222', '2222222', '33333', '男', '33333333', '3333333333', '本科', '3333333', '333333333', '3333333');
INSERT INTO `zp_jobhunter` VALUES ('4444', '344444444', '444444444', '4444444444', '女', '44444444', '444444', '本科', '444444', '444444', '44444444');
INSERT INTO `zp_jobhunter` VALUES ('5555', '55555555', '55555555', '5555555', '男', '5555555', '55555', '本科', '5555555', '55555', '55555555');

-- ----------------------------
-- Table structure for `zp_jobhunter_service`
-- ----------------------------
DROP TABLE IF EXISTS `zp_jobhunter_service`;
CREATE TABLE `zp_jobhunter_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_service_id` bigint(20) NOT NULL,
  `employment_jobhunter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_service_id` (`customer_service_id`),
  KEY `employment_jobhunter_id` (`employment_jobhunter_id`),
  CONSTRAINT `zp_jobhunter_service_ibfk_1` FOREIGN KEY (`customer_service_id`) REFERENCES `zp_customer_service` (`id`),
  CONSTRAINT `zp_jobhunter_service_ibfk_2` FOREIGN KEY (`employment_jobhunter_id`) REFERENCES `zp_employment_jobhunter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_jobhunter_service
-- ----------------------------
INSERT INTO `zp_jobhunter_service` VALUES ('1', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('2', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('3', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('4', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('5', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('6', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('7', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('8', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('9', '30', '1');
INSERT INTO `zp_jobhunter_service` VALUES ('10', '30', '1');

-- ----------------------------
-- Table structure for `zp_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `zp_jobs`;
CREATE TABLE `zp_jobs` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `job_type_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_id` (`job_type_id`),
  CONSTRAINT `zp_jobs_ibfk_1` FOREIGN KEY (`job_type_id`) REFERENCES `zp_job_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_jobs
-- ----------------------------
INSERT INTO `zp_jobs` VALUES ('7', '1', '前端工程师', '互联网');
INSERT INTO `zp_jobs` VALUES ('21', '1', 'Java工程师', null);
INSERT INTO `zp_jobs` VALUES ('22', '1', '程序员', null);
INSERT INTO `zp_jobs` VALUES ('24', '1', '销售员', null);
INSERT INTO `zp_jobs` VALUES ('25', '1', '码农', null);
INSERT INTO `zp_jobs` VALUES ('32', '1', '码农', null);
INSERT INTO `zp_jobs` VALUES ('33', '1', '程序员', null);
INSERT INTO `zp_jobs` VALUES ('124', '1', '泥瓦工', '普工');
INSERT INTO `zp_jobs` VALUES ('125', '1', '电路工', '普工');
INSERT INTO `zp_jobs` VALUES ('126', '1', '电镀工', '普工');
INSERT INTO `zp_jobs` VALUES ('127', '1', '汽修工', '普工');
INSERT INTO `zp_jobs` VALUES ('129', '1', '工程师', null);
INSERT INTO `zp_jobs` VALUES ('134', null, '程序员', null);
INSERT INTO `zp_jobs` VALUES ('136', null, '后台', null);
INSERT INTO `zp_jobs` VALUES ('144', null, '程序员', null);
INSERT INTO `zp_jobs` VALUES ('146', null, '高级工程师', '互联网');
INSERT INTO `zp_jobs` VALUES ('150', '7', '前端工程师', null);
INSERT INTO `zp_jobs` VALUES ('155', null, '码农', null);
INSERT INTO `zp_jobs` VALUES ('159', null, '会计', 'undefined');
INSERT INTO `zp_jobs` VALUES ('160', null, '码农', null);
INSERT INTO `zp_jobs` VALUES ('166', '2', '产品经理', '');
INSERT INTO `zp_jobs` VALUES ('167', '4', '工地头头', '');
INSERT INTO `zp_jobs` VALUES ('170', null, '老师', null);
INSERT INTO `zp_jobs` VALUES ('193', null, '工程师', null);
INSERT INTO `zp_jobs` VALUES ('194', null, '搬砖', null);
INSERT INTO `zp_jobs` VALUES ('200', null, 'java', null);
INSERT INTO `zp_jobs` VALUES ('201', null, 'java', null);
INSERT INTO `zp_jobs` VALUES ('202', null, 'java', '互联网');
INSERT INTO `zp_jobs` VALUES ('203', null, '前端工程', '1');
INSERT INTO `zp_jobs` VALUES ('204', null, 'java', null);
INSERT INTO `zp_jobs` VALUES ('206', null, 'javaee', null);

-- ----------------------------
-- Table structure for `zp_job_type`
-- ----------------------------
DROP TABLE IF EXISTS `zp_job_type`;
CREATE TABLE `zp_job_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_job_type
-- ----------------------------
INSERT INTO `zp_job_type` VALUES ('1', '程序员');
INSERT INTO `zp_job_type` VALUES ('2', '销售员');
INSERT INTO `zp_job_type` VALUES ('4', '经理');
INSERT INTO `zp_job_type` VALUES ('6', '助理');
INSERT INTO `zp_job_type` VALUES ('7', '后期人员');
INSERT INTO `zp_job_type` VALUES ('10', '管理人员');
INSERT INTO `zp_job_type` VALUES ('11', '服务人员');
INSERT INTO `zp_job_type` VALUES ('12', '会计师');
INSERT INTO `zp_job_type` VALUES ('13', '按摩师');
INSERT INTO `zp_job_type` VALUES ('14', '农民工');
INSERT INTO `zp_job_type` VALUES ('15', '理发师');
INSERT INTO `zp_job_type` VALUES ('16', '电脑维修工');
INSERT INTO `zp_job_type` VALUES ('17', '导游');
INSERT INTO `zp_job_type` VALUES ('18', '轿车司机');
INSERT INTO `zp_job_type` VALUES ('19', '卡车司机');
INSERT INTO `zp_job_type` VALUES ('20', '救生员');
INSERT INTO `zp_job_type` VALUES ('21', '健身教练');
INSERT INTO `zp_job_type` VALUES ('22', '教师');

-- ----------------------------
-- Table structure for `zp_message`
-- ----------------------------
DROP TABLE IF EXISTS `zp_message`;
CREATE TABLE `zp_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `zp_jobhunter_service_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_message
-- ----------------------------
INSERT INTO `zp_message` VALUES ('1', '这是一条消息', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('2', '123', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('3', '123', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('4', '123', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('5', '1324', '2019-09-24 09:27:21', '1234');
INSERT INTO `zp_message` VALUES ('6', '1324', '2019-09-24 09:27:21', '1234');
INSERT INTO `zp_message` VALUES ('7', '12', '2019-09-24 09:27:21', '21');
INSERT INTO `zp_message` VALUES ('8', '1', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('9', '2', '2019-09-24 09:27:33', '2');
INSERT INTO `zp_message` VALUES ('10', '12', '2019-09-24 09:27:21', '21');
INSERT INTO `zp_message` VALUES ('11', '11', '2019-09-24 09:27:21', '11');
INSERT INTO `zp_message` VALUES ('12', '1', '2019-09-24 09:27:21', '1');
INSERT INTO `zp_message` VALUES ('13', '1', '2019-09-24 09:38:50', '1');

-- ----------------------------
-- Table structure for `zp_province`
-- ----------------------------
DROP TABLE IF EXISTS `zp_province`;
CREATE TABLE `zp_province` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_province
-- ----------------------------
INSERT INTO `zp_province` VALUES ('8', '江苏');
INSERT INTO `zp_province` VALUES ('13', '广西');
INSERT INTO `zp_province` VALUES ('14', '河南');
INSERT INTO `zp_province` VALUES ('15', '河北');
INSERT INTO `zp_province` VALUES ('17', '山西');
INSERT INTO `zp_province` VALUES ('18', '江西');

-- ----------------------------
-- Table structure for `zp_welfare`
-- ----------------------------
DROP TABLE IF EXISTS `zp_welfare`;
CREATE TABLE `zp_welfare` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zp_welfare
-- ----------------------------
INSERT INTO `zp_welfare` VALUES ('198', '双休', '使用中');
INSERT INTO `zp_welfare` VALUES ('199', '双休', '被冻结');
INSERT INTO `zp_welfare` VALUES ('200', '一月4休', '冻结中');
INSERT INTO `zp_welfare` VALUES ('202', '五险一金', '冻结中');
INSERT INTO `zp_welfare` VALUES ('203', '五险一金', '使用中');
INSERT INTO `zp_welfare` VALUES ('204', '五险一金', '被冻结');
INSERT INTO `zp_welfare` VALUES ('207', '下午茶', '被冻结');
INSERT INTO `zp_welfare` VALUES ('208', '下午茶', '冻结中');
INSERT INTO `zp_welfare` VALUES ('209', '下午茶', '冻结中');
INSERT INTO `zp_welfare` VALUES ('210', '下午茶', '冻结中');
INSERT INTO `zp_welfare` VALUES ('211', '下午茶', '被冻结');
INSERT INTO `zp_welfare` VALUES ('212', '下午茶', '冻结');
INSERT INTO `zp_welfare` VALUES ('214', '五险一金', '使用中');
