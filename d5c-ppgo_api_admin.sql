/*
 Navicat Premium Data Transfer

 Source Server         : localhost-本地
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : localhost:3306
 Source Schema         : ppgo_api_admin

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 15/07/2019 11:51:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pp_api_detail
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_detail`;
CREATE TABLE `pp_api_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT 0 COMMENT '主表ID',
  `method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '方法名称：1-GET 2-POST 3-PUT 4-PATCH 5-DELETE',
  `api_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '接口名称',
  `api_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '接口地址',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回结果，正确或错误',
  `audit_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核时间',
  `audit_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核人',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0-暂停使用，1-正在开发，2-正在审核，3-正常，4-未通过',
  `create_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_main_id`(`source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_api_detail
-- ----------------------------
INSERT INTO `pp_api_detail` VALUES (1, 1, 1, '新闻列表', '/v1/artcat/15/articles?page=1&per_page=10', '#### 简要描述：\n\n- 新闻列表\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|cat_id |是  |int |文章类别   | 1\n|page |否  |int | 页码    | 1\n|per_page |否  |int | 每页记录数    | 10\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"articles\":\n      [\n             {\n                    \"id\": 1,\n                    \"title\": \"疑问解答\",\n                    \"subtitle\": \"\",\n                    \"about\": \"\",\n                    \"content\": \"\",\n                    \"url\": \"\",\n                    \"cover\": \"\",\n                    \"source\": \"\",\n                    \"editor\": \"\",\n                    \"click\": 15,\n                    \"sort\": 0,\n                    \"state\": 1,\n                    \"created_by\": \"\",\n                    \"article_cat_id\": 15,\n                    \"agree\": 0,\n                    \"disagree\": 0,\n                    \"tags\": \"\",\n                    \"recommend\": 0,\n                    \"ctime\": 1479202729,\n                    \"created_at\": \"2016-11-15T17:38:49+08:00\",\n                    \"updated_at\": \"2016-11-16T14:50:26+08:00\"\n             }\n      ],\n      \"article_cat\":\n      {\n             \"id\": 15,\n             \"name\": \"疑问解答(FAQ)\",\n             \"position\": 1,\n             \"state\": 1\n      }\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |neak  |2018-01-15 |  2018-01-15 |', 1562231445, 1, 3, 1, 1, 1507617867, 1562315392);
INSERT INTO `pp_api_detail` VALUES (2, 1, 1, '获取文章详情', '/v1/article/1', '#### 获取文章详情：\n\n- 获取文章详情\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|article_id |是  |int |文章ID   | 1\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|id |int   |文章id  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n  \"article\": {\n    \"id\": 7,\n    \"title\": \"平台介绍\",\n    \"subtitle\": \"\",\n    \"about\": \"\",\n    \"content\": \"\\u003cp\\u003e文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章文章文章文章文章文章文章文章文章文章文章文章文章文章 文章\\u003c/p\\u003e\\r\\n\",\n    \"url\": \"\",\n    \"cover\": \"\",\n    \"source\": \"\",\n    \"editor\": \"\",\n    \"click\": 812,\n    \"sort\": 0,\n    \"state\": 1,\n    \"created_by\": \"\",\n    \"article_cat_id\": 3,\n    \"article_cat\": [\n      {\n        \"id\": 2,\n        \"name\": \"关于我们\",\n        \"position\": 4,\n        \"state\": 1\n      },\n      {\n        \"id\": 3,\n        \"name\": \"平台介绍\",\n        \"position\": 1,\n        \"state\": 1\n      }\n    ],\n    \"agree\": 0,\n    \"disagree\": 0,\n    \"display_cover\": 0,\n    \"tags\": \"\",\n    \"recommend\": 0,\n    \"ctime\": 1479268142,\n    \"seo_title\": \"\",\n    \"seo_keyword\": \"\",\n    \"seo_desc\": \"\",\n    \"benefit_max\": 0,\n    \"url_guide\": \"\",\n    \"share_benefit_desc\": \"\",\n    \"otime\": 0,\n    \"show_cs_qrcode\": 1\n  },\n  \"pre_one\": null,\n  \"next_one\": null\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |neak  |2018-01-15 |  2018-01-15 |', 1562231431, 1, 3, 1, 1, 1507619939, 1562315462);
INSERT INTO `pp_api_detail` VALUES (3, 1, 1, '获取热门新闻', '/v1/article/hotest', '#### 获取热门新闻接口\n\n- 用户登录接口\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n无\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n[\n      {\n             \"id\": 1,\n             \"title\": \"这是一篇行业资讯\",\n             \"subtitle\": \"行业资讯\",\n             \"about\": \"关于\",\n             \"content\": \"<p> 文章内容</p> \",\n             \"url\": \"http://weibo.com\",\n             \"cover\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/articles/37e717c0.jpg\",\n             \"source\": \"新浪网\",\n             \"editor\": \"小编\",\n             \"state\": 1,\n             \"created_by\": \"小编\",\n             \"article_cat_id\": 5,\n             \"recommend\": 10,\n             \"created_at\": \"2016-11-03T14:53:58+08:00\",\n             \"updated_at\": \"2016-11-03T15:03:56+08:00\"\n      },\n      {\n             \"id\": 3,\n             \"title\": \"文章3\",\n             \"state\": 1,\n             \"article_cat_id\": 5,\n             \"recommend\": 6,\n             \"created_at\": \"2016-11-03T15:04:33+08:00\",\n             \"updated_at\": \"2016-11-03T15:11:37+08:00\"\n      },\n      {\n             \"id\": 2,\n             \"title\": \"新手帮助\",\n             \"cover\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/articles/8dd87670.jpg\",\n             \"state\": 1,\n             \"article_cat_id\": 4,\n             \"recommend\": 5,\n             \"created_at\": \"2016-11-03T15:03:32+08:00\",\n             \"updated_at\": \"2016-11-03T15:11:22+08:00\"\n      },\n      {\n             \"id\": 4,\n             \"title\": \"文章4\",\n             \"state\": 1,\n             \"article_cat_id\": 4,\n             \"recommend\": 3,\n             \"created_at\": \"2016-11-03T15:05:01+08:00\",\n             \"updated_at\": \"2016-11-03T15:11:53+08:00\"\n      }\n]\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |neak  |2018-01-15 |  2018-01-15 |', 1562231392, 0, 3, 1, 1, 1507699351, 1562315497);
INSERT INTO `pp_api_detail` VALUES (4, 1, 1, '移动端获取通知类文章标题', '/v1/notice/:cat_id([0-9]+)', '#### 移动端获取通知类文章标题\n\n- 移动端获取通知类文章标题\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|cat_id |是  |int |通知类文章栏目id   |1\n|n |否  |int | 返回多少条记录,默认5条    |5\n|cache |否  |boolen | 缓存,默认true    |true\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n[\n      {\n             \"id\": 502,\n             \"title\": \"不蓝瘦，不香菇，你的海南游被我们承包了！\",\n             \"subtitle\": \"海口维也纳国际大酒店即将在第五创上线，认投即\",\n             \"about\": \"海口维也纳国际大酒店即将在第五创上线，认投即有机会享受平台赠送的海南一游哦！\",\n             \"content\": \"\",\n             \"url\": \"\",\n             \"cover\": \"old_system/imagestore/2016/1020/a6a84280-9e3f-4dd6-b46d-165da6d37897.png\",\n             \"source\": \"\",\n             \"editor\": \"\",\n             \"click\": 2570,\n             \"sort\": 0,\n             \"state\": 1,\n             \"created_by\": \"\",\n             \"article_cat_id\": 12,\n             \"article_cat\": null,\n             \"agree\": 0,\n             \"disagree\": 0,\n             \"tags\": \"\",\n             \"recommend\": 0,\n             \"ctime\": 0,\n             \"created_at\": \"2016-10-21T01:59:52+08:00\",\n             \"updated_at\": \"2016-12-15T15:10:00+08:00\"\n      },\n      {\n             \"id\": 460,\n             \"title\": \"关于第五创更换支付系统的公告\",\n             \"subtitle\": \"\",\n             \"about\": \"近期平台频繁收到投资人反馈第三方支付问题，例如银行充值额度限制、支持的银行越来越少、手机端支付功能暂停等\",\n             \"content\": \"\",\n             \"url\": \"\",\n             \"cover\": \"old_system/imagestore/2016/0818/07767639-4579-4905-aaca-bb588d516a59.jpg\",\n             \"source\": \"第五创\",\n             \"editor\": \"\",\n             \"click\": 555,\n             \"sort\": 0,\n             \"state\": 1,\n             \"created_by\": \"\",\n             \"article_cat_id\": 12,\n             \"article_cat\": null,\n             \"agree\": 0,\n             \"disagree\": 0,\n             \"tags\": \"\",\n             \"recommend\": 0,\n             \"ctime\": 0,\n             \"created_at\": \"2016-08-18T23:11:01+08:00\",\n             \"updated_at\": \"2016-12-10T14:40:36+08:00\"\n      },\n      {\n             \"id\": 454,\n             \"title\": \"第五创年度总结报告（2-7月），来一份走心的报告！\",\n             \"subtitle\": \"\",\n             \"about\": \"第五创年度总结报告（2-7月），来一份走心的报告！\",\n             \"content\": \"\",\n             \"url\": \"\",\n             \"cover\": \"old_system/imagestore/2016/0809/4189cfe8-35bd-4441-b4ee-0aa800d3fd7e.jpg\",\n             \"source\": \"\",\n             \"editor\": \"\",\n             \"click\": 1039,\n             \"sort\": 0,\n             \"state\": 1,\n             \"created_by\": \"\",\n             \"article_cat_id\": 12,\n             \"article_cat\": null,\n             \"agree\": 0,\n             \"disagree\": 0,\n             \"tags\": \"\",\n             \"recommend\": 0,\n             \"ctime\": 0,\n             \"created_at\": \"2016-08-10T02:29:53+08:00\",\n             \"updated_at\": \"2016-12-15T12:50:05+08:00\"\n      },\n      {\n             \"id\": 449,\n             \"title\": \"跨界 共赢 第五创&喆啡酒店（九江店）投资品鉴会\",\n             \"subtitle\": \"\",\n             \"about\": \"新趋势、新思维、众筹赢未来！\",\n             \"content\": \"\",\n             \"url\": \"\",\n             \"cover\": \"old_system/imagestore/2016/0803/6f141932-03e3-48c1-bf5a-8c9924754f9d.png\",\n             \"source\": \"\",\n             \"editor\": \"\",\n             \"click\": 237,\n             \"sort\": 0,\n             \"state\": 1,\n             \"created_by\": \"\",\n             \"article_cat_id\": 12,\n             \"article_cat\": null,\n             \"agree\": 0,\n             \"disagree\": 0,\n             \"tags\": \"\",\n             \"recommend\": 0,\n             \"ctime\": 0,\n             \"created_at\": \"2016-08-03T19:21:39+08:00\",\n             \"updated_at\": \"2016-12-12T18:32:11+08:00\"\n      },\n      {\n             \"id\": 446,\n             \"title\": \"别人投资，你享收益！第五创10%的利润分给你！\",\n             \"subtitle\": \"\",\n             \"about\": \"福利发放送，推荐赏佣金\",\n             \"content\": \"\",\n             \"url\": \"\",\n             \"cover\": \"old_system/imagestore/2016/0729/09df7f2c-9fc0-49ea-afb5-508d0b00cb8d.png\",\n             \"source\": \"第五创\",\n             \"editor\": \"\",\n             \"click\": 749,\n             \"sort\": 0,\n             \"state\": 1,\n             \"created_by\": \"\",\n             \"article_cat_id\": 12,\n             \"article_cat\": null,\n             \"agree\": 0,\n             \"disagree\": 0,\n             \"tags\": \"\",\n             \"recommend\": 0,\n             \"ctime\": 0,\n             \"created_at\": \"2016-07-30T02:36:31+08:00\",\n             \"updated_at\": \"2016-12-12T18:27:51+08:00\"\n      }\n]\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |neak  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515762214, 1562315526);
INSERT INTO `pp_api_detail` VALUES (5, 1, 1, '文章点击送佣金', '/v1/article/cb/:article_id([0-9]+)/:benefit_wx_uid([0-9]+)/:o_time([0-9]+)', '#### 文章点击送佣金\n\n- 文章点击送佣金\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|article_id |是  |string |文章id   | -\n|benefit_wx_uid |是  |string | 受益人wx user_id    | -\n|o_time |是  |string | 文章打开时间，在详情接口中获得    | -\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |neak  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763734, 1562315565);
INSERT INTO `pp_api_detail` VALUES (6, 1, 1, '文章收益详情', '/v1/article/cb/:article_id([0-9]+)/info', '#### 删除评价接口：\n\n- 获取文章收益详情\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|article_id |是  |int |文章ID   | 1\n|page |否  |int | 页码    | 1\n|per_page |否  |int | 每页记录数,默认20条    | 10\n|cache |否  |boolen | 缓存,默认true    |true\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"article\": \"asfdqweraf\",\n      \"source\": \"fafd\",\n      \"c_time\": 1491121956,\n      \"benefit_user\":\n      [\n             {\n                    \"wx_user_id\": 187,\n                    \"wx_user\": \"灰灰\",\n                    \"head\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/wx_user_head/3504299c.jpg\",\n                    \"benefit\": 11\n             },\n             {\n                    \"wx_user_id\": 230,\n                    \"wx_user\": \"谭伟斌.\",\n                    \"head\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/wx_user_head/9e19efae.jpg\",\n                    \"benefit\": 6\n             }\n      ],\n      \"count\": 2\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763795, 1562315603);
INSERT INTO `pp_api_detail` VALUES (7, 1, 1, '文章留言列表', '/v1/article/:article_id([0-9]+)/comments', '#### 获取物流详情\n\n- 获取文章留言列表\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|article_id |是  |int |文章ID   | 1\n|page |否  |int | 页码    | 1\n|per_page |否  |int | 每页记录数,默认20条    | 10\n|cache |否  |boolen | 缓存,默认true    |true\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n  \"list\": [\n    {\n      \"id\": 2,\n      \"article_id\": 1,\n      \"wx_uid\": 146,\n      \"comment\": \"好2\",\n      \"reply\": \"回2\",\n      \"comment_like_count\": 1,\n      \"reply_like_count\": 1,\n      \"c_like\": 0,\n      \"r_like\": 0,\n      \"nickname\": \"\",\n      \"head\": \"\"\n    },\n    {\n      \"id\": 1,\n      \"article_id\": 1,\n      \"wx_uid\": 146,\n      \"comment\": \"好文章\",\n      \"reply\": \"好恢复\",\n      \"comment_like_count\": 0,\n      \"reply_like_count\": 1,\n      \"c_like\": 0,\n      \"r_like\": 0,\n      \"nickname\": \"\",\n      \"head\": \"\"\n    }\n  ],\n  \"list_count\": 2\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763945, 1562315627);
INSERT INTO `pp_api_detail` VALUES (8, 1, 2, '创建留言', '/v1/article/:article_id([0-9]+)/comment/create', '#### 简要描述：\n\n- 创建留言\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|article_id |是  |int |文章ID   | 1\n|content |是  |string | 留言内容    | hi,你好！\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|id |int   |留言ID  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"id\": 3,\n      \"article_id\": 1,\n      \"wx_uid\": 235,\n      \"comment\": \"hahaha\",\n      \"reply\": \"\",\n      \"comment_like_count\": 0,\n      \"reply_like_count\": 0,\n      \"c_like\": 0,\n      \"r_like\": 0,\n      \"nickname\": \"\",\n      \"head\": \"\"\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515764025, 1562316066);
INSERT INTO `pp_api_detail` VALUES (9, 1, 2, '点赞、取消点赞', '/v1/article/comment/:comment_id([0-9]+)/like/:c_type', '#### 简要描述：\n\n- 点赞、取消点赞\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|comment_id |是  |int |留言ID   | 1\n|c_type |是  |string | 类型：comment:留言，reply:回复内容    | comment\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|id |int   |留言id  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"id\": 3,\n      \"wx_uid\": 235,\n      \"comment_id\": 1,\n      \"comment_like\": 0,\n      \"reply_like\": 1\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 4, 1, 1, 1515937531, 1562316258);
INSERT INTO `pp_api_detail` VALUES (10, 2, 1, '获取广告位信息', '/v1/user/binding/id_card', '#### 简要描述：\n\n- 获取广告位信息\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|ad_code |是  |string |广告位标识符   | 如：pc_home\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n| |   |  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n[\n      {\n             \"id\": 8,\n             \"name\": \"图片3\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/ce828dd0.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/8/click\"\n      },\n      {\n             \"id\": 7,\n             \"name\": \"图片2\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/ba5e3950.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/7/click\"\n      },\n      {\n             \"id\": 6,\n             \"name\": \"图片1\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/d7b066f0.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/6/click\"\n      }\n]\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 首页广告图特殊：返回3个数组，代表三个位置的图片集\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562231760, 0, 3, 1, 1, 1515981318, 1562317297);
INSERT INTO `pp_api_detail` VALUES (11, 2, 1, '修改交易状态', '/v1/ad/:ad_item_id([0-9]+)/show', '#### 简要描述：\n\n- 展示统计\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|ad_item_id |是  |int |广告项id   | 1\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n| |   |  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 1, 1, 1, 1516003820, 1562317468);
INSERT INTO `pp_api_detail` VALUES (12, 2, 1, '获取指定广告位(by id)详情', '/v1/ad/items', '#### 简要描述：\n\n- 用户登录接口\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|ad_pid |是  |int |广告位id   | 1\n|cache |否  |boolen | 缓存,默认true    |true\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|-- |--   |-- |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n[\n      {\n             \"id\": 16,\n             \"name\": \"3\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/b36e8ac0.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/16/click\",\n             \"bg_color\": \"\"\n      },\n      {\n             \"id\": 15,\n             \"name\": \"2\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/29285730.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/15/click\",\n             \"bg_color\": \"\"\n      },\n      {\n             \"id\": 14,\n             \"name\": \"1\",\n             \"img\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/ad_item/23ae7520.jpg\",\n             \"click_url\": \"http://testapi.d5c360.com/v1/ad/14/click\",\n             \"bg_color\": \"\"\n      }\n]\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562231760, 0, 3, 1, 1, 1515981318, 1562317645);
INSERT INTO `pp_api_detail` VALUES (13, 3, 3, '绑定身份证', '/v1/user/binding/id_card', '#### 简要描述：\n\n- 绑定身份证修改\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|id_card |是  |string |身份证号   | 430111****正确的身份证号\n|real_name |是  |string | 真实姓名    | 真实姓名\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n用户信息\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562231760, 0, 3, 1, 1, 1515981318, 1562316596);
INSERT INTO `pp_api_detail` VALUES (14, 3, 3, '绑定身份证', '/v1/user/binding/id_card', '#### 简要描述：\n\n- 绑定身份证修改\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|id_card |是  |string |身份证号   | 430111****正确的身份证号\n|real_name |是  |string | 真实姓名    | 真实姓名\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n用户信息\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562231760, 0, 3, 1, 1, 1515981318, 1562316596);
INSERT INTO `pp_api_detail` VALUES (15, 3, 3, '绑定身份证', '/v1/user/binding/id_card', '#### 简要描述：\n\n- 绑定身份证修改\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|id_card |是  |string |身份证号   | 430111****正确的身份证号\n|real_name |是  |string | 真实姓名    | 真实姓名\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n用户信息\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562231760, 0, 3, 1, 1, 1515981318, 1562316596);
INSERT INTO `pp_api_detail` VALUES (16, 3, 3, '修改登录密码', '/v1/user/pwd/update', '#### 简要描述：\n\n- 用户登录接口\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|org_pwd |是  |string |原始密码   | 123456\n|new_pwd |是  |string | 新密码    | aa8w88\n|confirmed_pwd |是  |string | 确认密码    | aa8w88\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|-- |--   |--  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"id\": 600104,\n      \"tel\": \"13570643147\",\n      \"real_name\": \"\",\n      \"head\": \"\",\n      \"birthday\": \"\",\n      \"qq\": \"\",\n      \"email\": \"\",\n      \"invite_id\": 0\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 1, 1, 1, 1562317932, 1562317932);
INSERT INTO `pp_api_detail` VALUES (17, 3, 2, '头像上传', '/v1/user/head/upload', '#### 简要描述：\n- 用户登录接口\n\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|head |是  |file |头像文件   | 本地file文件\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|-- |--   |--  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"id\": 600106,\n      \"tel\": \"13570643147\",\n      \"identity_card\": \"\",\n      \"is_certification\": 0,\n      \"real_name\": \"\",\n      \"nickname\": \"Lane Wang\",\n      \"sex\": 1,\n      \"head\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/user_head/071858bd.jpg\",\n      \"birthday\": \"\",\n      \"qq\": \"\",\n      \"email\": \"\",\n      \"invite_id\": 0,\n      \"ctime\": 0\n}\n```\n\n**错误时返回:**\n\n```\n{\n    \"status\": 403,\n    \"err_code\": \"uploadUserHeadError\",\n    \"err_msg\": \"上传头像错误\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 调用示例:\n\n```\n<?php\n    echo \"Hello world\";\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1562318522, 0, 3, 1, 1, 1562318122, 1562318279);
INSERT INTO `pp_api_detail` VALUES (18, 3, 2, '头像上传222', '/v1/user/head/upload', '#### 简要描述：\n- 用户登录接口\n\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|head |是  |file |头像文件   | 本地file文件\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|-- |--   |--  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n      \"id\": 600106,\n      \"tel\": \"13570643147\",\n      \"identity_card\": \"\",\n      \"is_certification\": 0,\n      \"real_name\": \"\",\n      \"nickname\": \"Lane Wang\",\n      \"sex\": 1,\n      \"head\": \"http://d5ctest.oss-cn-shanghai.aliyuncs.com/user_head/071858bd.jpg\",\n      \"birthday\": \"\",\n      \"qq\": \"\",\n      \"email\": \"\",\n      \"invite_id\": 0,\n      \"ctime\": 0\n}\n```\n\n**错误时返回:**\n\n```\n{\n    \"status\": 403,\n    \"err_code\": \"uploadUserHeadError\",\n    \"err_msg\": \"上传头像错误\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 调用示例:\n\n```\n<?php\n    echo \"Hello world\";\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |wt  |2018-01-15 |  2018-01-15 |', 0, 0, 1, 1, 1, 1562404943, 1562404943);

-- ----------------------------
-- Table structure for pp_api_public
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_public`;
CREATE TABLE `pp_api_public`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_public_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '公共文档名称',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 99 COMMENT '排序，越小越往前',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_main_id`(`api_public_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_api_public
-- ----------------------------
INSERT INTO `pp_api_public` VALUES (1, '平台接口简介', 1, '#### 平台接口简介\n\n- 这是一个测试接口平台\n\n#### 阅读对象\n - 给开发人员的看的', 1, 1, 1, 1516071841, 1516282117);
INSERT INTO `pp_api_public` VALUES (2, '接入须知', 2, '#### key 和secret获取：\n\n- 直接联系商务人员索取\n\n#### 公共参数\n|参数名|说明|\n|:-------   |:-----   |\n|time |接口调用时的时间戳，即当前时间戳（时间戳：当前距离Epoch（1970年1月1日) 以秒计算的时间，即unix-timestamp，请使用精确到秒的时间戳。|\n|app-key|上文获取的三方商家系统的唯一标示|\n|sign|输入参数的签名结果，签名方法见下节|\n\n#### 返回格式\n```\n{\n	success:true/false,\n	data:\n	error_code:\n	error_msg:\n}\n```', 1, 1, 1, 1516080573, 1516283006);
INSERT INTO `pp_api_public` VALUES (3, '回调说明', 3, '#### 加密算法\n\n- 使用用户配置的URL地址替换url路径，然后采用sign签名计算小节的方法，即可得到正确的签名结果\n\n#### 返回结果\n\n|参数名|类型|取值说明|\n|:----   |:-----  |: -----    |\n|success |Boolean |接口执行结果;为true表示执行成功; 为false表示执行失败  |\n|error_msg |String |错误信息描述|\n|error_code|String|错误码，如有具体涉及错误码请严格按照给到的错误码|\n|data|String|返回结果|', 1, 1, 1, 1516282746, 1516282746);

-- ----------------------------
-- Table structure for pp_api_source
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_source`;
CREATE TABLE `pp_api_source`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '分组ID',
  `source_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '接口名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-正常，0-删除',
  `audit_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人ID',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `audit_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_api_source
-- ----------------------------
INSERT INTO `pp_api_source` VALUES (1, 1, '文章相关 - Article', 1, 0, 1, 1, 1507616276, 1562203796, 0);
INSERT INTO `pp_api_source` VALUES (2, 1, '广告位相关 - Ad', 1, 0, 1, 1, 1507616329, 1562203826, 0);
INSERT INTO `pp_api_source` VALUES (3, 1, '会员中心相关 - User', 1, 0, 1, 1, 1507616394, 1562203846, 0);
INSERT INTO `pp_api_source` VALUES (4, 1, '项目相关 - Project', 1, 0, 1, 1, 1507616421, 1562203865, 0);
INSERT INTO `pp_api_source` VALUES (5, 1, '登录注册相关 - Permit', 1, 0, 1, 1, 1510122234, 1562203884, 0);
INSERT INTO `pp_api_source` VALUES (6, 1, '商务合作 - Cooperation', 1, 0, 1, 1, 1515575836, 1562203932, 0);
INSERT INTO `pp_api_source` VALUES (7, 1, '统计相关 - Statistic', 1, 0, 1, 1, 1515914737, 1562203989, 0);

-- ----------------------------
-- Table structure for pp_set_code
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_code`;
CREATE TABLE `pp_set_code`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态码',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '描述',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_env_name`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '环境分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_set_code
-- ----------------------------
INSERT INTO `pp_set_code` VALUES (1, '200', '返回成功', '请求成功', 1, 0, 0, 1506328003, 1506328037);
INSERT INTO `pp_set_code` VALUES (2, '403', '返回错误', '请求失败', 1, 0, 1, 1506328023, 1562118952);
INSERT INTO `pp_set_code` VALUES (3, '302', '请求成功', '错误', 0, 0, 0, 1506328070, 1506334951);

-- ----------------------------
-- Table structure for pp_set_env
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_env`;
CREATE TABLE `pp_set_env`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '环境名称',
  `env_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '环境host',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_env_name`(`env_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '环境分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_set_env
-- ----------------------------
INSERT INTO `pp_set_env` VALUES (1, '测试地址', 'https://mptapi.d5c360.com', '测试地址', 1, 0, 1, 1506316614, 1562229217);
INSERT INTO `pp_set_env` VALUES (2, '测试地址3', 'http://127.0.0.1:8083', '测试地址3', 0, 0, 0, 1506316696, 1506316850);
INSERT INTO `pp_set_env` VALUES (3, '正式环境', 'https://api.d5ct.com/', '生产环境API', 1, 1, 1, 1515140110, 1562312864);

-- ----------------------------
-- Table structure for pp_set_group
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_group`;
CREATE TABLE `pp_set_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `env_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '环境ID，1,2',
  `code_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态码id 1,2',
  `api_public_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公共文档ids 1,2',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：1-正常，0-删除',
  `create_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `update_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_id`(`create_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_set_group
-- ----------------------------
INSERT INTO `pp_set_group` VALUES (1, '第五创', '<p>有关第五创平台的接口</p>', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237536, 1562118396);
INSERT INTO `pp_set_group` VALUES (2, '拉比兔', '关于拉比兔的接口', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237621, 1562118323);
INSERT INTO `pp_set_group` VALUES (3, '创易宝', '有关第五创平台的接口', '1,3', '1,2', '1,2,3', 1, 1, 1, 1516281298, 1562118361);

-- ----------------------------
-- Table structure for pp_set_template
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_template`;
CREATE TABLE `pp_set_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '模板ID',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_main_id`(`template_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_set_template
-- ----------------------------
INSERT INTO `pp_set_template` VALUES (1, '接口通用模板', '#### 简要描述：\n\n- 用户登录接口\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n```\n\n<?php\n    echo \"Hello world\";\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |作者  |2018-01-15 |  2018-01-15 |', 1, 1, 1, 1516085341, 1562315724);
INSERT INTO `pp_set_template` VALUES (2, '公共文档模板', '#### 这是标题\n\n- 这是内容这是一个AP管理的内容模板\n内容模板啊啊', 1, 1, 1, 1516085369, 1516281799);
INSERT INTO `pp_set_template` VALUES (3, '接口模板-精简', '#### 简要描述：\n\n- 用户登录接口\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n```\n{\n    \"status\": 403,\n    \"err_code\": \"userNotExist\",\n    \"err_msg\": \"用户不存在\",\n    \"redirect_to\": \"\",\n    \"data\": null\n}\n```\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.0 |wt  |2018-01-15 |  2018-01-15 |', 1, 1, 1, 1562233265, 1562315785);

-- ----------------------------
-- Table structure for pp_uc_admin
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_admin`;
CREATE TABLE `pp_uc_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_uc_admin
-- ----------------------------
INSERT INTO `pp_uc_admin` VALUES (1, 'admin', '管理员', 'd5a829f13e840016487b00f26fbd3d28', '0', '13888888889', 'haodaquan2008@163.com', 'JCKo', 1563162242, '127.0.0.1', 1, 0, 1, 0, 1562229494);
INSERT INTO `pp_uc_admin` VALUES (2, 'wangpeng', '王鹏', 'ae5d01aa1ad1cc106ed8416b021c7d06', '1,2', '13811558899', '12@11.com', 'wbBj', 1562135512, '[::1]', 1, 0, 1, 0, 1562135476);
INSERT INTO `pp_uc_admin` VALUES (3, 'shencaibiao', '沈才飚', 'e9fa9187e7497892c237433aee966cc1', '1', '13811559988', 'hao@123.com', '6fWE', 1505960085, '127.0.0.1', 1, 1, 1, 1505919245, 1562135906);
INSERT INTO `pp_uc_admin` VALUES (4, 'sunny', '罗澎', '0b381989f03774a21fd1a3775c72c1be', '3', '13988009988', '232@124.com', 'RZcM', 1562136660, '[::1]', 1, 1, 1, 1506047337, 1562136070);

-- ----------------------------
-- Table structure for pp_uc_auth
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_auth`;
CREATE TABLE `pp_uc_auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) UNSIGNED NOT NULL DEFAULT 999 COMMENT '排序，越小越前',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者ID',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改者ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限因子' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_uc_auth
-- ----------------------------
INSERT INTO `pp_uc_auth` VALUES (1, 0, '所有权限', '/', 1, '', 0, 1, 1, 1, 1, 1505620970, 1505620970);
INSERT INTO `pp_uc_auth` VALUES (2, 1, '权限管理', '/', 999, 'fa-id-card', 1, 1, 0, 1, 1, 0, 1505622360);
INSERT INTO `pp_uc_auth` VALUES (3, 2, '管理员', '/admin/list', 1, 'fa-user-o', 1, 1, 1, 1, 1, 1505621186, 1505621186);
INSERT INTO `pp_uc_auth` VALUES (4, 2, '角色管理', '/role/list', 2, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1505621852);
INSERT INTO `pp_uc_auth` VALUES (5, 3, '新增', '/admin/add', 1, '', 0, 1, 0, 1, 1, 0, 1505621685);
INSERT INTO `pp_uc_auth` VALUES (6, 3, '修改', '/admin/edit', 2, '', 0, 1, 0, 1, 1, 0, 1505621697);
INSERT INTO `pp_uc_auth` VALUES (7, 3, '删除', '/admin/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621756, 1505621756);
INSERT INTO `pp_uc_auth` VALUES (8, 4, '新增', '/role/add', 1, '', 1, 1, 0, 1, 1, 0, 1505698716);
INSERT INTO `pp_uc_auth` VALUES (9, 4, '修改', '/role/edit', 2, '', 0, 1, 1, 1, 1, 1505621912, 1505621912);
INSERT INTO `pp_uc_auth` VALUES (10, 4, '删除', '/role/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621951, 1505621951);
INSERT INTO `pp_uc_auth` VALUES (11, 2, '权限因子', '/auth/list', 3, 'fa-list', 1, 1, 1, 1, 1, 1505621986, 1505621986);
INSERT INTO `pp_uc_auth` VALUES (12, 11, '新增', '/auth/add', 1, '', 0, 1, 1, 1, 1, 1505622009, 1505622009);
INSERT INTO `pp_uc_auth` VALUES (13, 11, '修改', '/auth/edit', 2, '', 0, 1, 1, 1, 1, 1505622047, 1505622047);
INSERT INTO `pp_uc_auth` VALUES (14, 11, '删除', '/auth/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505622111, 1505622111);
INSERT INTO `pp_uc_auth` VALUES (15, 1, '个人中心', 'profile/edit', 1001, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1506001114);
INSERT INTO `pp_uc_auth` VALUES (16, 1, 'API管理', '/', 1, 'fa-cubes', 1, 0, 0, 0, 1, 0, 1506125698);
INSERT INTO `pp_uc_auth` VALUES (17, 16, 'API接口', '/api/list', 1, 'fa-link', 1, 1, 1, 1, 1, 1505622447, 1505622447);
INSERT INTO `pp_uc_auth` VALUES (19, 20, '公共文档', '/apipublic/list', 3, 'fa-files-o', 1, 1, 0, 1, 1, 0, 1516155852);
INSERT INTO `pp_uc_auth` VALUES (20, 1, '基础设置', '/', 2, 'fa-cogs', 1, 1, 1, 1, 1, 1505622601, 1505622601);
INSERT INTO `pp_uc_auth` VALUES (21, 20, '项目分组', '/group/list', 1, 'fa-object-ungroup', 1, 1, 0, 1, 1, 0, 1562142389);
INSERT INTO `pp_uc_auth` VALUES (22, 20, '环境设置', '/env/list', 2, 'fa-tree', 1, 1, 1, 1, 1, 1505622681, 1505622681);
INSERT INTO `pp_uc_auth` VALUES (23, 20, '状态码设置', '/code/list', 3, 'fa-code', 1, 1, 1, 1, 1, 1505622728, 1505622728);
INSERT INTO `pp_uc_auth` VALUES (24, 15, '资料修改', '/user/edit', 1, 'fa-edit', 1, 1, 0, 1, 1, 0, 1506057468);
INSERT INTO `pp_uc_auth` VALUES (25, 21, '新增', '/group/add', 1, 'n', 0, 1, 0, 1, 1, 0, 1513324170);
INSERT INTO `pp_uc_auth` VALUES (26, 21, '修改', '/group/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506237920, 1506237920);
INSERT INTO `pp_uc_auth` VALUES (27, 21, '删除', '/group/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506237948, 1506237948);
INSERT INTO `pp_uc_auth` VALUES (28, 22, '新增', '/env/add', 1, 'fa', 0, 0, 0, 0, 1, 1506316506, 1506316506);
INSERT INTO `pp_uc_auth` VALUES (29, 22, '修改', '/env/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506316532, 1506316532);
INSERT INTO `pp_uc_auth` VALUES (30, 22, '删除', '/env/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506316567, 1506316567);
INSERT INTO `pp_uc_auth` VALUES (31, 23, '新增', '/code/add', 1, 'fa', 0, 0, 0, 0, 1, 1506327812, 1506327812);
INSERT INTO `pp_uc_auth` VALUES (32, 23, '修改', '/code/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506327831, 1506327831);
INSERT INTO `pp_uc_auth` VALUES (33, 23, '删除', '/code/ajadel', 3, 'fa', 0, 0, 0, 0, 1, 1506327857, 1506327857);
INSERT INTO `pp_uc_auth` VALUES (34, 17, '新增接口', '/api/add', 1, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984869);
INSERT INTO `pp_uc_auth` VALUES (35, 17, '修改接口', '/api/edit', 2, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984880);
INSERT INTO `pp_uc_auth` VALUES (36, 17, '删除接口', '/api/ajaxdel', 3, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984893);
INSERT INTO `pp_uc_auth` VALUES (37, 17, '查看接口', '/api/detail', 4, '', 0, 1, 0, 1, 1, 0, 1515984908);
INSERT INTO `pp_uc_auth` VALUES (38, 17, '批量审核接口', '/api/ajaxchangestatus', 5, '', 0, 1, 0, 1, 1, 0, 1516000160);
INSERT INTO `pp_uc_auth` VALUES (39, 16, 'API分类', '/apisource/list', 1, 'fa-skyatlas', 1, 1, 0, 1, 1, 0, 1562142833);
INSERT INTO `pp_uc_auth` VALUES (40, 39, '新增', '/apisource/add', 1, '', 0, 1, 0, 1, 1, 0, 1515905034);
INSERT INTO `pp_uc_auth` VALUES (41, 39, '修改', '/apisource/edit', 2, '', 0, 1, 0, 1, 1, 0, 1515905044);
INSERT INTO `pp_uc_auth` VALUES (42, 39, '删除', '/apisource/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1515905055);
INSERT INTO `pp_uc_auth` VALUES (43, 17, '审核页面', '/api/audit', 6, '', 0, 1, 1, 1, 1, 1516000189, 1516000189);
INSERT INTO `pp_uc_auth` VALUES (44, 19, '新增', '/apipublic/add', 1, '', 0, 1, 1, 1, 1, 1516067809, 1516067809);
INSERT INTO `pp_uc_auth` VALUES (45, 19, '修改', '/apipublic/edit', 2, '', 0, 1, 1, 1, 1, 1516067841, 1516067841);
INSERT INTO `pp_uc_auth` VALUES (46, 19, '删除', '/apipublic/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516067881, 1516067881);
INSERT INTO `pp_uc_auth` VALUES (47, 20, '模板设置', '/template/list', 4, 'fa-file-text', 1, 1, 1, 1, 1, 1516083233, 1516083233);
INSERT INTO `pp_uc_auth` VALUES (48, 47, '新增', '/template/add', 1, '', 0, 1, 1, 1, 1, 1516083262, 1516083262);
INSERT INTO `pp_uc_auth` VALUES (49, 47, '修改', '/template/edit', 2, '', 0, 1, 1, 1, 1, 1516083296, 1516083296);
INSERT INTO `pp_uc_auth` VALUES (50, 47, '删除', '/template/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516083335, 1516083335);
INSERT INTO `pp_uc_auth` VALUES (51, 17, '复制接口', '/api/copy', 2, 'fa-link', 0, 1, 1, 1, 1, 1562404897, 1562404897);

-- ----------------------------
-- Table structure for pp_uc_role
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role`;
CREATE TABLE `pp_uc_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '备注',
  `create_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `update_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改这ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1-正常，0-删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_uc_role
-- ----------------------------
INSERT INTO `pp_uc_role` VALUES (1, 'API管理员', '拥有API所有权限', 0, 2, 1, 1505874156, 1505874156);
INSERT INTO `pp_uc_role` VALUES (2, '系统管理员', '系统管理员', 0, 0, 1, 1506124114, 1506124114);
INSERT INTO `pp_uc_role` VALUES (3, 'API接口查看', '只允许查看接口权限', 1, 1, 1, 1562135769, 1562135769);

-- ----------------------------
-- Table structure for pp_uc_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role_auth`;
CREATE TABLE `pp_uc_role_auth`  (
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `auth_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限和角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pp_uc_role_auth
-- ----------------------------
INSERT INTO `pp_uc_role_auth` VALUES (1, 16);
INSERT INTO `pp_uc_role_auth` VALUES (1, 17);
INSERT INTO `pp_uc_role_auth` VALUES (1, 18);
INSERT INTO `pp_uc_role_auth` VALUES (1, 19);
INSERT INTO `pp_uc_role_auth` VALUES (2, 0);
INSERT INTO `pp_uc_role_auth` VALUES (2, 1);
INSERT INTO `pp_uc_role_auth` VALUES (2, 15);
INSERT INTO `pp_uc_role_auth` VALUES (2, 20);
INSERT INTO `pp_uc_role_auth` VALUES (2, 21);
INSERT INTO `pp_uc_role_auth` VALUES (2, 22);
INSERT INTO `pp_uc_role_auth` VALUES (2, 23);
INSERT INTO `pp_uc_role_auth` VALUES (2, 24);
INSERT INTO `pp_uc_role_auth` VALUES (3, 0);
INSERT INTO `pp_uc_role_auth` VALUES (3, 1);
INSERT INTO `pp_uc_role_auth` VALUES (3, 15);
INSERT INTO `pp_uc_role_auth` VALUES (3, 16);
INSERT INTO `pp_uc_role_auth` VALUES (3, 17);
INSERT INTO `pp_uc_role_auth` VALUES (3, 24);
INSERT INTO `pp_uc_role_auth` VALUES (3, 37);

SET FOREIGN_KEY_CHECKS = 1;
