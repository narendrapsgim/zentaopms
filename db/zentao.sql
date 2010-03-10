SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- DROP TABLE IF EXISTS `zt_action`;
CREATE TABLE IF NOT EXISTS `zt_action` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `objectType` varchar(30) NOT NULL default '',
  `objectID` mediumint(8) unsigned NOT NULL default '0',
  `actor` varchar(30) NOT NULL default '',
  `action` varchar(30) NOT NULL default '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_bug`;
CREATE TABLE IF NOT EXISTS `zt_bug` (
  `id` mediumint(8) NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `project` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(8) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `task` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `severity` tinyint(4) NOT NULL default '0',
  `type` varchar(30) NOT NULL default '',
  `os` varchar(30) NOT NULL default '',
  `browser` varchar(30) NOT NULL default '',
  `hardware` varchar(30) NOT NULL,
  `found` varchar(30) NOT NULL default '',
  `steps` text NOT NULL,
  `status` enum('active','resolved','closed') NOT NULL default 'active',
  `mailto` varchar(255) NOT NULL default '',
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `openedBuild` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL default '',
  `assignedDate` datetime NOT NULL,
  `resolvedBy` varchar(30) NOT NULL default '',
  `resolution` varchar(30) NOT NULL default '',
  `resolvedBuild` varchar(30) NOT NULL default '',
  `resolvedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` datetime NOT NULL,
  `duplicateBug` mediumint(8) unsigned NOT NULL,
  `linkBug` varchar(255) NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `caseVersion` smallint(6) NOT NULL default '1',
  `result` mediumint(8) unsigned NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_build`;
CREATE TABLE IF NOT EXISTS `zt_build` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `project` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `scmPath` char(255) NOT NULL,
  `filePath` char(255) NOT NULL,
  `date` date NOT NULL,
  `builder` char(30) NOT NULL default '',
  `desc` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_burn`;
CREATE TABLE IF NOT EXISTS `zt_burn` (
  `project` mediumint(8) unsigned NOT NULL,
  `date` date NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY  (`project`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_case`;
CREATE TABLE IF NOT EXISTS `zt_case` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `path` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(30) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `title` char(90) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL default '0',
  `type` char(30) NOT NULL default '1',
  `status` char(30) NOT NULL default '1',
  `frequency` enum('1','2','3') NOT NULL default '1',
  `order` tinyint(30) unsigned NOT NULL default '0',
  `openedBy` char(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `lastEditedBy` char(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  `version` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_caseStep`;
CREATE TABLE IF NOT EXISTS `zt_caseStep` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `case` mediumint(8) unsigned NOT NULL default '0',
  `version` smallint(3) unsigned NOT NULL default '0',
  `desc` text NOT NULL,
  `expect` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_company`;
CREATE TABLE IF NOT EXISTS `zt_company` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(120) default NULL,
  `phone` char(20) default NULL,
  `fax` char(20) default NULL,
  `address` char(120) default NULL,
  `zipcode` char(10) default NULL,
  `website` char(120) default NULL,
  `backyard` char(120) default NULL,
  `pms` char(120) default NULL,
  `guest` enum('1','0') NOT NULL default '0',
  `admins` char(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pms` (`pms`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_config`;
CREATE TABLE IF NOT EXISTS `zt_config` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `owner` char(30) NOT NULL default '',
  `section` char(30) NOT NULL default '',
  `key` char(30) NOT NULL default '',
  `value` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_dept`;
CREATE TABLE IF NOT EXISTS `zt_dept` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `path` char(255) NOT NULL default '',
  `grade` tinyint(3) unsigned NOT NULL default '0',
  `order` tinyint(3) unsigned NOT NULL default '0',
  `position` char(30) NOT NULL default '',
  `function` char(255) NOT NULL default '',
  `manager` char(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `company` (`company`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_effort`;
CREATE TABLE IF NOT EXISTS `zt_effort` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user` char(30) NOT NULL default '',
  `todo` enum('1','0') NOT NULL default '1',
  `date` date NOT NULL default '0000-00-00',
  `begin` datetime NOT NULL default '0000-00-00 00:00:00',
  `end` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` enum('1','2','3') NOT NULL default '1',
  `idvalue` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `desc` char(255) NOT NULL default '',
  `status` enum('1','2','3') NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_file`;
CREATE TABLE IF NOT EXISTS `zt_file` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `pathname` char(50) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) unsigned NOT NULL default '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL default '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL default '0',
  `extra` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_group`;
CREATE TABLE IF NOT EXISTS `zt_group` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL,
  `name` char(30) NOT NULL,
  `desc` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_groupPriv`;
CREATE TABLE IF NOT EXISTS `zt_groupPriv` (
  `group` mediumint(8) unsigned NOT NULL default '0',
  `module` char(30) NOT NULL default '',
  `method` char(30) NOT NULL default '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_history`;
CREATE TABLE IF NOT EXISTS `zt_history` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `action` mediumint(8) unsigned NOT NULL default '0',
  `field` varchar(30) NOT NULL default '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_module`;
CREATE TABLE IF NOT EXISTS `zt_module` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `path` char(255) NOT NULL default '',
  `grade` tinyint(3) unsigned NOT NULL default '0',
  `order` tinyint(3) unsigned NOT NULL default '0',
  `view` char(30) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_product`;
CREATE TABLE IF NOT EXISTS `zt_product` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `code` varchar(10) NOT NULL default '',
  `order` tinyint(3) unsigned NOT NULL default '0',
  `status` varchar(30) NOT NULL default '',
  `desc` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `company` (`company`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_productPlan`;
CREATE TABLE IF NOT EXISTS `zt_productPlan` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL,
  `title` varchar(90) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_project`;
CREATE TABLE IF NOT EXISTS `zt_project` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `isCat` enum('1','0') NOT NULL default '0',
  `catID` mediumint(8) unsigned NOT NULL,
  `type` enum('sprint','project') NOT NULL default 'sprint',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `code` varchar(20) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `statge` enum('1','2','3','4','5') NOT NULL default '1',
  `pri` enum('1','2','3','4') NOT NULL default '1',
  `desc` text NOT NULL,
  `goal` text NOT NULL,
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` int(10) unsigned NOT NULL default '0',
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` int(10) unsigned NOT NULL default '0',
  `canceledBy` varchar(30) NOT NULL default '',
  `canceledDate` int(10) unsigned NOT NULL default '0',
  `PO` varchar(30) NOT NULL default '',
  `PM` varchar(30) NOT NULL default '',
  `QM` varchar(30) NOT NULL default '',
  `team` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `company` (`company`,`type`,`parent`,`begin`,`end`,`status`,`statge`,`pri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_projectProduct`;
CREATE TABLE IF NOT EXISTS `zt_projectProduct` (
  `project` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`project`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_projectStory`;
CREATE TABLE IF NOT EXISTS `zt_projectStory` (
  `project` mediumint(8) unsigned NOT NULL default '0',
  `product` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) unsigned NOT NULL default '0',
  `version` smallint(6) NOT NULL default '1',
  UNIQUE KEY `project` (`project`,`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_release`;
CREATE TABLE IF NOT EXISTS `zt_release` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `build` mediumint(8) unsigned NOT NULL,
  `name` char(30) NOT NULL default '',
  `date` date NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_story`;
CREATE TABLE IF NOT EXISTS `zt_story` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `plan` mediumint(8) unsigned NOT NULL default '0',
  `fromBug` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(90) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `pri` tinyint(3) unsigned NOT NULL default '3',
  `estimate` float unsigned NOT NULL,
  `status` varchar(30) NOT NULL default '',
  `stage` varchar(30) NOT NULL,
  `mailto` varchar(255) NOT NULL default '',
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL default '',
  `assignedDate` datetime NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  `reviewedBy` varchar(30) NOT NULL,
  `reviewedDate` date NOT NULL,
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `toBug` mediumint(9) NOT NULL,
  `childStories` varchar(255) NOT NULL,
  `linkStories` varchar(255) NOT NULL,
  `duplicateStory` mediumint(8) unsigned NOT NULL,
  `version` smallint(6) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `product` (`product`,`module`,`plan`,`type`,`pri`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_storySpec`;
CREATE TABLE IF NOT EXISTS `zt_storySpec` (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(90) NOT NULL,
  `spec` text NOT NULL,
  UNIQUE KEY `story` (`story`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_task`;
CREATE TABLE IF NOT EXISTS `zt_task` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `project` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(8) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `name` varchar(90) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL default '0',
  `owner` char(30) NOT NULL default '',
  `estimate` float unsigned NOT NULL,
  `consumed` float unsigned NOT NULL,
  `left` float unsigned NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('wait','doing','done','cancel') NOT NULL default 'wait',
  `statusCustom` tinyint(3) unsigned NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `statusOrder` (`statusCustom`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_taskEstimate`;
CREATE TABLE IF NOT EXISTS `zt_taskEstimate` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `task` mediumint(8) unsigned NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `estimate` tinyint(3) unsigned NOT NULL default '0',
  `estimater` char(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `task` (`task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_team`;
CREATE TABLE IF NOT EXISTS `zt_team` (
  `project` mediumint(8) unsigned NOT NULL default '0',
  `account` char(30) NOT NULL default '',
  `role` char(30) NOT NULL default '',
  `joinDate` date NOT NULL default '0000-00-00',
  `workingHour` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`project`,`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testResult`;
CREATE TABLE IF NOT EXISTS `zt_testResult` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `run` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `caseResult` char(30) NOT NULL,
  `stepResults` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `run` (`run`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testRun`;
CREATE TABLE IF NOT EXISTS `zt_testRun` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `task` mediumint(8) unsigned NOT NULL default '0',
  `case` mediumint(8) unsigned NOT NULL default '0',
  `version` tinyint(3) unsigned NOT NULL default '0',
  `assignedTo` char(30) NOT NULL default '',
  `lastRun` datetime NOT NULL,
  `lastResult` char(30) NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `task` (`task`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testTask`;
CREATE TABLE IF NOT EXISTS `zt_testTask` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(90) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL default '0',
  `build` char(30) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `desc` text NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_todo`;
CREATE TABLE IF NOT EXISTS `zt_todo` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `account` char(30) NOT NULL,
  `date` date NOT NULL default '0000-00-00',
  `begin` smallint(4) unsigned zerofill NOT NULL,
  `end` smallint(4) unsigned zerofill NOT NULL,
  `type` char(10) NOT NULL,
  `idvalue` mediumint(8) unsigned NOT NULL default '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` char(20) NOT NULL default '',
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_user`;
CREATE TABLE IF NOT EXISTS `zt_user` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `dept` mediumint(8) unsigned NOT NULL default '0',
  `account` char(30) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `realname` char(30) NOT NULL default '',
  `nickname` char(60) NOT NULL default '',
  `avatar` char(30) NOT NULL default '',
  `birthyear` smallint(5) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  `gendar` enum('f','m') NOT NULL default 'f',
  `email` char(90) NOT NULL default '',
  `msn` char(90) NOT NULL default '',
  `qq` char(20) NOT NULL default '',
  `yahoo` char(90) NOT NULL default '',
  `gtalk` char(90) NOT NULL default '',
  `wangwang` char(90) NOT NULL default '',
  `mobile` char(11) NOT NULL default '',
  `phone` char(20) NOT NULL default '',
  `address` char(120) NOT NULL default '',
  `zipcode` char(10) NOT NULL default '',
  `join` date NOT NULL default '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `last` int(10) unsigned NOT NULL default '0',
  `status` varchar(30) NOT NULL default 'active',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `company` (`company`,`dept`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_userGroup`;
CREATE TABLE IF NOT EXISTS `zt_userGroup` (
  `account` char(30) NOT NULL default '',
  `group` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `account` (`account`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zt_group` (id, company, name, `desc`) VALUES
(1, 1, 'admin', 'Admin'),
(2, 1, 'product', 'Product'),
(3, 1, 'develop', 'Develop'),
(4, 1, 'qa', 'QA'),
(5, 1, 'pm', 'PM');

INSERT INTO `zt_groupPriv` (`group`, `module`, `method`) VALUES
(1, 'admin', 'browseCompany'),
(1, 'admin', 'index'),
(1, 'bug', 'activate'),
(1, 'bug', 'ajaxGetUserBugs'),
(1, 'bug', 'browse'),
(1, 'bug', 'close'),
(1, 'bug', 'create'),
(1, 'bug', 'edit'),
(1, 'bug', 'index'),
(1, 'bug', 'report'),
(1, 'bug', 'resolve'),
(1, 'bug', 'view'),
(1, 'build', 'ajaxGetProductBuilds'),
(1, 'build', 'ajaxGetProjectBuilds'),
(1, 'build', 'create'),
(1, 'build', 'delete'),
(1, 'build', 'edit'),
(1, 'build', 'view'),
(1, 'company', 'browse'),
(1, 'company', 'create'),
(1, 'company', 'delete'),
(1, 'company', 'edit'),
(1, 'company', 'index'),
(1, 'dept', 'browse'),
(1, 'dept', 'delete'),
(1, 'dept', 'manageChild'),
(1, 'dept', 'updateOrder'),
(1, 'group', 'browse'),
(1, 'group', 'create'),
(1, 'group', 'delete'),
(1, 'group', 'edit'),
(1, 'group', 'manageMember'),
(1, 'group', 'managePriv'),
(1, 'index', 'index'),
(1, 'index', 'ping'),
(1, 'my', 'bug'),
(1, 'my', 'editProfile'),
(1, 'my', 'index'),
(1, 'my', 'profile'),
(1, 'my', 'project'),
(1, 'my', 'story'),
(1, 'my', 'task'),
(1, 'my', 'todo'),
(1, 'product', 'ajaxGetPlans'),
(1, 'product', 'ajaxGetProjects'),
(1, 'product', 'browse'),
(1, 'product', 'create'),
(1, 'product', 'delete'),
(1, 'product', 'edit'),
(1, 'product', 'index'),
(1, 'product', 'roadmap'),
(1, 'productplan', 'browse'),
(1, 'productplan', 'create'),
(1, 'productplan', 'delete'),
(1, 'productplan', 'edit'),
(1, 'productplan', 'linkStory'),
(1, 'productplan', 'unlinkStory'),
(1, 'productplan', 'view'),
(1, 'project', 'browse'),
(1, 'project', 'bug'),
(1, 'project', 'build'),
(1, 'project', 'burn'),
(1, 'project', 'burnData'),
(1, 'project', 'create'),
(1, 'project', 'delete'),
(1, 'project', 'edit'),
(1, 'project', 'grouptask'),
(1, 'project', 'index'),
(1, 'project', 'linkStory'),
(1, 'project', 'manageChilds'),
(1, 'project', 'manageMembers'),
(1, 'project', 'manageProducts'),
(1, 'project', 'story'),
(1, 'project', 'task'),
(1, 'project', 'team'),
(1, 'project', 'unlinkMember'),
(1, 'project', 'unlinkStory'),
(1, 'project', 'view'),
(1, 'qa', 'index'),
(1, 'release', 'browse'),
(1, 'release', 'create'),
(1, 'release', 'delete'),
(1, 'release', 'edit'),
(1, 'release', 'view'),
(1, 'search', 'buildForm'),
(1, 'search', 'buildQuery'),
(1, 'story', 'activate'),
(1, 'story', 'ajaxGetProductStories'),
(1, 'story', 'ajaxGetProjectStories'),
(1, 'story', 'change'),
(1, 'story', 'close'),
(1, 'story', 'create'),
(1, 'story', 'delete'),
(1, 'story', 'edit'),
(1, 'story', 'review'),
(1, 'story', 'tasks'),
(1, 'story', 'view'),
(1, 'task', 'ajaxGetProjectTasks'),
(1, 'task', 'ajaxGetUserTasks'),
(1, 'task', 'create'),
(1, 'task', 'delete'),
(1, 'task', 'edit'),
(1, 'task', 'view'),
(1, 'testcase', 'browse'),
(1, 'testcase', 'create'),
(1, 'testcase', 'edit'),
(1, 'testcase', 'index'),
(1, 'testcase', 'view'),
(1, 'testtask', 'batchAssign'),
(1, 'testtask', 'browse'),
(1, 'testtask', 'create'),
(1, 'testtask', 'delete'),
(1, 'testtask', 'edit'),
(1, 'testtask', 'index'),
(1, 'testtask', 'linkcase'),
(1, 'testtask', 'results'),
(1, 'testtask', 'runcase'),
(1, 'testtask', 'unlinkcase'),
(1, 'testtask', 'view'),
(1, 'todo', 'create'),
(1, 'todo', 'delete'),
(1, 'todo', 'edit'),
(1, 'todo', 'import2Today'),
(1, 'todo', 'mark'),
(1, 'todo', 'view'),
(1, 'tree', 'ajaxGetOptionMenu'),
(1, 'tree', 'browse'),
(1, 'tree', 'delete'),
(1, 'tree', 'edit'),
(1, 'tree', 'manageChild'),
(1, 'tree', 'updateOrder'),
(1, 'user', 'bug'),
(1, 'user', 'create'),
(1, 'user', 'delete'),
(1, 'user', 'edit'),
(1, 'user', 'profile'),
(1, 'user', 'project'),
(1, 'user', 'task'),
(1, 'user', 'todo'),
(1, 'user', 'view'),
(2, 'bug', 'activate'),
(2, 'bug', 'ajaxGetUserBugs'),
(2, 'bug', 'browse'),
(2, 'bug', 'close'),
(2, 'bug', 'create'),
(2, 'bug', 'edit'),
(2, 'bug', 'index'),
(2, 'bug', 'report'),
(2, 'bug', 'resolve'),
(2, 'bug', 'view'),
(2, 'build', 'ajaxGetProductBuilds'),
(2, 'build', 'ajaxGetProjectBuilds'),
(2, 'build', 'create'),
(2, 'build', 'delete'),
(2, 'build', 'edit'),
(2, 'build', 'view'),
(2, 'company', 'browse'),
(2, 'company', 'index'),
(2, 'index', 'index'),
(2, 'index', 'ping'),
(2, 'my', 'bug'),
(2, 'my', 'editProfile'),
(2, 'my', 'index'),
(2, 'my', 'profile'),
(2, 'my', 'project'),
(2, 'my', 'story'),
(2, 'my', 'task'),
(2, 'my', 'todo'),
(2, 'product', 'ajaxGetPlans'),
(2, 'product', 'ajaxGetProjects'),
(2, 'product', 'browse'),
(2, 'product', 'create'),
(2, 'product', 'edit'),
(2, 'product', 'index'),
(2, 'product', 'roadmap'),
(2, 'productplan', 'browse'),
(2, 'productplan', 'create'),
(2, 'productplan', 'delete'),
(2, 'productplan', 'edit'),
(2, 'productplan', 'linkStory'),
(2, 'productplan', 'unlinkStory'),
(2, 'productplan', 'view'),
(2, 'project', 'browse'),
(2, 'project', 'bug'),
(2, 'project', 'build'),
(2, 'project', 'burn'),
(2, 'project', 'burnData'),
(2, 'project', 'grouptask'),
(2, 'project', 'index'),
(2, 'project', 'linkStory'),
(2, 'project', 'manageProducts'),
(2, 'project', 'story'),
(2, 'project', 'task'),
(2, 'project', 'team'),
(2, 'project', 'unlinkStory'),
(2, 'project', 'view'),
(2, 'qa', 'index'),
(2, 'release', 'browse'),
(2, 'release', 'create'),
(2, 'release', 'delete'),
(2, 'release', 'edit'),
(2, 'release', 'view'),
(2, 'search', 'buildForm'),
(2, 'search', 'buildQuery'),
(2, 'story', 'activate'),
(2, 'story', 'ajaxGetProductStories'),
(2, 'story', 'ajaxGetProjectStories'),
(2, 'story', 'change'),
(2, 'story', 'close'),
(2, 'story', 'create'),
(2, 'story', 'delete'),
(2, 'story', 'edit'),
(2, 'story', 'review'),
(2, 'story', 'tasks'),
(2, 'story', 'view'),
(2, 'task', 'ajaxGetProjectTasks'),
(2, 'task', 'ajaxGetUserTasks'),
(2, 'task', 'create'),
(2, 'task', 'edit'),
(2, 'task', 'view'),
(2, 'testcase', 'browse'),
(2, 'testcase', 'create'),
(2, 'testcase', 'edit'),
(2, 'testcase', 'index'),
(2, 'testcase', 'view'),
(2, 'testtask', 'browse'),
(2, 'testtask', 'index'),
(2, 'testtask', 'results'),
(2, 'testtask', 'view'),
(2, 'todo', 'create'),
(2, 'todo', 'delete'),
(2, 'todo', 'edit'),
(2, 'todo', 'import2Today'),
(2, 'todo', 'mark'),
(2, 'todo', 'view'),
(2, 'tree', 'ajaxGetOptionMenu'),
(2, 'tree', 'browse'),
(2, 'tree', 'delete'),
(2, 'tree', 'edit'),
(2, 'tree', 'manageChild'),
(2, 'tree', 'updateOrder'),
(2, 'user', 'bug'),
(2, 'user', 'profile'),
(2, 'user', 'project'),
(2, 'user', 'task'),
(2, 'user', 'todo'),
(2, 'user', 'view'),
(3, 'bug', 'activate'),
(3, 'bug', 'ajaxGetUserBugs'),
(3, 'bug', 'browse'),
(3, 'bug', 'close'),
(3, 'bug', 'create'),
(3, 'bug', 'edit'),
(3, 'bug', 'index'),
(3, 'bug', 'report'),
(3, 'bug', 'resolve'),
(3, 'bug', 'view'),
(3, 'build', 'ajaxGetProductBuilds'),
(3, 'build', 'ajaxGetProjectBuilds'),
(3, 'build', 'create'),
(3, 'build', 'edit'),
(3, 'build', 'view'),
(3, 'company', 'browse'),
(3, 'company', 'index'),
(3, 'index', 'index'),
(3, 'index', 'ping'),
(3, 'my', 'bug'),
(3, 'my', 'editProfile'),
(3, 'my', 'index'),
(3, 'my', 'profile'),
(3, 'my', 'project'),
(3, 'my', 'story'),
(3, 'my', 'task'),
(3, 'my', 'todo'),
(3, 'product', 'ajaxGetPlans'),
(3, 'product', 'ajaxGetProjects'),
(3, 'product', 'browse'),
(3, 'product', 'index'),
(3, 'product', 'roadmap'),
(3, 'productplan', 'browse'),
(3, 'productplan', 'view'),
(3, 'project', 'browse'),
(3, 'project', 'bug'),
(3, 'project', 'build'),
(3, 'project', 'burn'),
(3, 'project', 'burnData'),
(3, 'project', 'grouptask'),
(3, 'project', 'index'),
(3, 'project', 'story'),
(3, 'project', 'task'),
(3, 'project', 'team'),
(3, 'project', 'view'),
(3, 'qa', 'index'),
(3, 'release', 'browse'),
(3, 'release', 'view'),
(3, 'search', 'buildForm'),
(3, 'search', 'buildQuery'),
(3, 'story', 'activate'),
(3, 'story', 'ajaxGetProductStories'),
(3, 'story', 'ajaxGetProjectStories'),
(3, 'story', 'change'),
(3, 'story', 'close'),
(3, 'story', 'create'),
(3, 'story', 'edit'),
(3, 'story', 'review'),
(3, 'story', 'tasks'),
(3, 'story', 'view'),
(3, 'task', 'ajaxGetProjectTasks'),
(3, 'task', 'ajaxGetUserTasks'),
(3, 'task', 'create'),
(3, 'task', 'edit'),
(3, 'task', 'view'),
(3, 'testcase', 'browse'),
(3, 'testcase', 'index'),
(3, 'testcase', 'view'),
(3, 'testtask', 'browse'),
(3, 'testtask', 'index'),
(3, 'testtask', 'results'),
(3, 'testtask', 'view'),
(3, 'todo', 'create'),
(3, 'todo', 'delete'),
(3, 'todo', 'edit'),
(3, 'todo', 'import2Today'),
(3, 'todo', 'mark'),
(3, 'todo', 'view'),
(3, 'user', 'bug'),
(3, 'user', 'profile'),
(3, 'user', 'project'),
(3, 'user', 'task'),
(3, 'user', 'todo'),
(3, 'user', 'view'),
(4, 'bug', 'activate'),
(4, 'bug', 'ajaxGetUserBugs'),
(4, 'bug', 'browse'),
(4, 'bug', 'close'),
(4, 'bug', 'create'),
(4, 'bug', 'edit'),
(4, 'bug', 'index'),
(4, 'bug', 'report'),
(4, 'bug', 'resolve'),
(4, 'bug', 'view'),
(4, 'build', 'ajaxGetProductBuilds'),
(4, 'build', 'ajaxGetProjectBuilds'),
(4, 'build', 'create'),
(4, 'build', 'delete'),
(4, 'build', 'edit'),
(4, 'build', 'view'),
(4, 'company', 'browse'),
(4, 'company', 'index'),
(4, 'index', 'index'),
(4, 'index', 'ping'),
(4, 'my', 'bug'),
(4, 'my', 'editProfile'),
(4, 'my', 'index'),
(4, 'my', 'profile'),
(4, 'my', 'project'),
(4, 'my', 'story'),
(4, 'my', 'task'),
(4, 'my', 'todo'),
(4, 'product', 'ajaxGetPlans'),
(4, 'product', 'ajaxGetProjects'),
(4, 'product', 'browse'),
(4, 'product', 'index'),
(4, 'product', 'roadmap'),
(4, 'productplan', 'browse'),
(4, 'productplan', 'view'),
(4, 'project', 'browse'),
(4, 'project', 'bug'),
(4, 'project', 'build'),
(4, 'project', 'burn'),
(4, 'project', 'burnData'),
(4, 'project', 'grouptask'),
(4, 'project', 'index'),
(4, 'project', 'story'),
(4, 'project', 'task'),
(4, 'project', 'team'),
(4, 'project', 'view'),
(4, 'qa', 'index'),
(4, 'release', 'browse'),
(4, 'release', 'view'),
(4, 'search', 'buildForm'),
(4, 'search', 'buildQuery'),
(4, 'story', 'activate'),
(4, 'story', 'ajaxGetProductStories'),
(4, 'story', 'ajaxGetProjectStories'),
(4, 'story', 'change'),
(4, 'story', 'close'),
(4, 'story', 'create'),
(4, 'story', 'edit'),
(4, 'story', 'review'),
(4, 'story', 'tasks'),
(4, 'story', 'view'),
(4, 'task', 'ajaxGetProjectTasks'),
(4, 'task', 'ajaxGetUserTasks'),
(4, 'task', 'create'),
(4, 'task', 'edit'),
(4, 'task', 'view'),
(4, 'testcase', 'browse'),
(4, 'testcase', 'create'),
(4, 'testcase', 'edit'),
(4, 'testcase', 'index'),
(4, 'testcase', 'view'),
(4, 'testtask', 'batchAssign'),
(4, 'testtask', 'browse'),
(4, 'testtask', 'create'),
(4, 'testtask', 'delete'),
(4, 'testtask', 'edit'),
(4, 'testtask', 'index'),
(4, 'testtask', 'linkcase'),
(4, 'testtask', 'results'),
(4, 'testtask', 'runcase'),
(4, 'testtask', 'unlinkcase'),
(4, 'testtask', 'view'),
(4, 'todo', 'create'),
(4, 'todo', 'delete'),
(4, 'todo', 'edit'),
(4, 'todo', 'import2Today'),
(4, 'todo', 'mark'),
(4, 'todo', 'view'),
(4, 'tree', 'ajaxGetOptionMenu'),
(4, 'tree', 'browse'),
(4, 'tree', 'delete'),
(4, 'tree', 'edit'),
(4, 'tree', 'manageChild'),
(4, 'tree', 'updateOrder'),
(4, 'user', 'bug'),
(4, 'user', 'profile'),
(4, 'user', 'project'),
(4, 'user', 'task'),
(4, 'user', 'todo'),
(4, 'user', 'view'),
(5, 'bug', 'activate'),
(5, 'bug', 'ajaxGetUserBugs'),
(5, 'bug', 'browse'),
(5, 'bug', 'close'),
(5, 'bug', 'create'),
(5, 'bug', 'edit'),
(5, 'bug', 'index'),
(5, 'bug', 'report'),
(5, 'bug', 'resolve'),
(5, 'bug', 'view'),
(5, 'build', 'ajaxGetProductBuilds'),
(5, 'build', 'ajaxGetProjectBuilds'),
(5, 'build', 'create'),
(5, 'build', 'delete'),
(5, 'build', 'edit'),
(5, 'build', 'view'),
(5, 'company', 'browse'),
(5, 'company', 'index'),
(5, 'index', 'index'),
(5, 'index', 'ping'),
(5, 'my', 'bug'),
(5, 'my', 'editProfile'),
(5, 'my', 'index'),
(5, 'my', 'profile'),
(5, 'my', 'project'),
(5, 'my', 'story'),
(5, 'my', 'task'),
(5, 'my', 'todo'),
(5, 'product', 'ajaxGetPlans'),
(5, 'product', 'ajaxGetProjects'),
(5, 'product', 'browse'),
(5, 'product', 'index'),
(5, 'product', 'roadmap'),
(5, 'productplan', 'browse'),
(5, 'productplan', 'linkStory'),
(5, 'productplan', 'unlinkStory'),
(5, 'productplan', 'view'),
(5, 'project', 'browse'),
(5, 'project', 'bug'),
(5, 'project', 'build'),
(5, 'project', 'burn'),
(5, 'project', 'burnData'),
(5, 'project', 'create'),
(5, 'project', 'delete'),
(5, 'project', 'edit'),
(5, 'project', 'grouptask'),
(5, 'project', 'index'),
(5, 'project', 'linkStory'),
(5, 'project', 'manageChilds'),
(5, 'project', 'manageMembers'),
(5, 'project', 'manageProducts'),
(5, 'project', 'story'),
(5, 'project', 'task'),
(5, 'project', 'team'),
(5, 'project', 'unlinkMember'),
(5, 'project', 'unlinkStory'),
(5, 'project', 'view'),
(5, 'qa', 'index'),
(5, 'release', 'browse'),
(5, 'release', 'view'),
(5, 'search', 'buildForm'),
(5, 'search', 'buildQuery'),
(5, 'story', 'activate'),
(5, 'story', 'ajaxGetProductStories'),
(5, 'story', 'ajaxGetProjectStories'),
(5, 'story', 'change'),
(5, 'story', 'close'),
(5, 'story', 'create'),
(5, 'story', 'edit'),
(5, 'story', 'review'),
(5, 'story', 'tasks'),
(5, 'story', 'view'),
(5, 'task', 'ajaxGetProjectTasks'),
(5, 'task', 'ajaxGetUserTasks'),
(5, 'task', 'create'),
(5, 'task', 'delete'),
(5, 'task', 'edit'),
(5, 'task', 'view'),
(5, 'testcase', 'browse'),
(5, 'testcase', 'edit'),
(5, 'testcase', 'index'),
(5, 'testcase', 'view'),
(5, 'testtask', 'browse'),
(5, 'testtask', 'index'),
(5, 'testtask', 'results'),
(5, 'testtask', 'view'),
(5, 'todo', 'create'),
(5, 'todo', 'delete'),
(5, 'todo', 'edit'),
(5, 'todo', 'import2Today'),
(5, 'todo', 'mark'),
(5, 'todo', 'view'),
(5, 'user', 'bug'),
(5, 'user', 'profile'),
(5, 'user', 'project'),
(5, 'user', 'task'),
(5, 'user', 'todo'),
(5, 'user', 'view');
