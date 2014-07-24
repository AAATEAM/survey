
-- ----------------------------
-- Table structure for manager_ea_extp
-- ----------------------------
CREATE TABLE `manager_ea_extp` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `modelname` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_extv
-- ----------------------------
CREATE TABLE `manager_ea_extv` (
  `id` bigint(20) NOT NULL ,
  `extpalias` varchar(255) default NULL,
  `modelid` varchar(255) default NULL,
  `modelname` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_organize
-- ----------------------------
CREATE TABLE `manager_ea_organize` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `imgfilename` varchar(255) default NULL,
  `inputtime` varchar(255) default NULL,
  `kpidescription` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `organizedescription` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK250C6854D7988410` (`parent_id`),
  CONSTRAINT `FK250C6854D7988410` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_organize` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_organize_role
-- ----------------------------
CREATE TABLE `manager_ea_organize_role` (
  `role_id` bigint(20) NOT NULL,
  `organize_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`organize_id`,`role_id`),
  KEY `FK2F3BE581E9FDBE17` (`role_id`),
  KEY `FK2F3BE5812CEB3C77` (`organize_id`),
  CONSTRAINT `FK2F3BE5812CEB3C77` FOREIGN KEY (`organize_id`) REFERENCES `manager_ea_organize` (`id`),
  CONSTRAINT `FK2F3BE581E9FDBE17` FOREIGN KEY (`role_id`) REFERENCES `manager_ea_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_organizegroup
-- ----------------------------
CREATE TABLE `manager_ea_organizegroup` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `inputtime` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK2FACA2AB9777DC0F` (`parent_id`),
  CONSTRAINT `FK2FACA2AB9777DC0F` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_organizegroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_organizegroup_organize
-- ----------------------------
CREATE TABLE `manager_ea_organizegroup_organize` (
  `organizegroup_id` bigint(20) NOT NULL,
  `organize_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`organize_id`,`organizegroup_id`),
  KEY `FKAC53E0B79637D0BD` (`organizegroup_id`),
  KEY `FKAC53E0B72CEB3C77` (`organize_id`),
  CONSTRAINT `FKAC53E0B72CEB3C77` FOREIGN KEY (`organize_id`) REFERENCES `manager_ea_organize` (`id`),
  CONSTRAINT `FKAC53E0B79637D0BD` FOREIGN KEY (`organizegroup_id`) REFERENCES `manager_ea_organizegroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_resource
-- ----------------------------
CREATE TABLE `manager_ea_resource` (
  `id` bigint(20) NOT NULL ,
  `actionUrl` varchar(255) default NULL,
  `alias` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `inputtime` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `newPage` varchar(255) default NULL,
  `publi` varchar(255) default NULL,
  `ruleNum` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `tipInfo` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC241AABF74CDC67B` (`parent_id`),
  CONSTRAINT `FKC241AABF74CDC67B` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_resource_role
-- ----------------------------
CREATE TABLE `manager_ea_resource_role` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`resource_id`,`role_id`),
  KEY `FKE1966DF6E9FDBE17` (`role_id`),
  KEY `FKE1966DF642FCA097` (`resource_id`),
  CONSTRAINT `FKE1966DF642FCA097` FOREIGN KEY (`resource_id`) REFERENCES `manager_ea_resource` (`id`),
  CONSTRAINT `FKE1966DF6E9FDBE17` FOREIGN KEY (`role_id`) REFERENCES `manager_ea_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_resource_rolegroup
-- ----------------------------
CREATE TABLE `manager_ea_resource_rolegroup` (
  `rolegroup_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`resource_id`,`rolegroup_id`),
  KEY `FK560ED24942FCA097` (`resource_id`),
  KEY `FK560ED2496695531D` (`rolegroup_id`),
  CONSTRAINT `FK560ED2496695531D` FOREIGN KEY (`rolegroup_id`) REFERENCES `manager_ea_rolegroup` (`id`),
  CONSTRAINT `FK560ED24942FCA097` FOREIGN KEY (`resource_id`) REFERENCES `manager_ea_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_resource_user
-- ----------------------------
CREATE TABLE `manager_ea_resource_user` (
  `user_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`resource_id`,`user_id`),
  KEY `FKE197D94B8F2881F7` (`user_id`),
  KEY `FKE197D94B42FCA097` (`resource_id`),
  CONSTRAINT `FKE197D94B42FCA097` FOREIGN KEY (`resource_id`) REFERENCES `manager_ea_resource` (`id`),
  CONSTRAINT `FKE197D94B8F2881F7` FOREIGN KEY (`user_id`) REFERENCES `manager_ea_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_role
-- ----------------------------
CREATE TABLE `manager_ea_role` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `inputtime` varchar(255) default NULL,
  `kpidescription` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `positiondescription` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKA3E467A71352D963` (`parent_id`),
  CONSTRAINT `FKA3E467A71352D963` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_role_user
-- ----------------------------
CREATE TABLE `manager_ea_role_user` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `FK102EED63E9FDBE17` (`role_id`),
  KEY `FK102EED638F2881F7` (`user_id`),
  CONSTRAINT `FK102EED638F2881F7` FOREIGN KEY (`user_id`) REFERENCES `manager_ea_user` (`id`),
  CONSTRAINT `FK102EED63E9FDBE17` FOREIGN KEY (`role_id`) REFERENCES `manager_ea_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_rolegroup
-- ----------------------------
CREATE TABLE `manager_ea_rolegroup` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `inputtime` varchar(255) default NULL,
  `kpidescription` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `positiondescription` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK109E3F38398CE29C` (`parent_id`),
  CONSTRAINT `FK109E3F38398CE29C` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_rolegroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_rolegroup_role
-- ----------------------------
CREATE TABLE `manager_ea_rolegroup_role` (
  `rolegroup_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`role_id`,`rolegroup_id`),
  KEY `FK8870BD1DE9FDBE17` (`role_id`),
  KEY `FK8870BD1D6695531D` (`rolegroup_id`),
  CONSTRAINT `FK8870BD1D6695531D` FOREIGN KEY (`rolegroup_id`) REFERENCES `manager_ea_rolegroup` (`id`),
  CONSTRAINT `FK8870BD1DE9FDBE17` FOREIGN KEY (`role_id`) REFERENCES `manager_ea_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_rule
-- ----------------------------
CREATE TABLE `manager_ea_rule` (
  `id` bigint(20) NOT NULL ,
  `name` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKA3E47E2D1352EFE9` (`parent_id`),
  CONSTRAINT `FKA3E47E2D1352EFE9` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_ruledetail
-- ----------------------------
CREATE TABLE `manager_ea_ruledetail` (
  `id` bigint(20) NOT NULL ,
  `align` varchar(255) default NULL,
  `attachfilename` varchar(255) default NULL,
  `attachfilepath` varchar(255) default NULL,
  `imagefilepath` varchar(255) default NULL,
  `imageheight` varchar(255) default NULL,
  `imagewidth` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `videofilepath` varchar(255) default NULL,
  `videoheight` varchar(255) default NULL,
  `videowidth` varchar(255) default NULL,
  `rule_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK76F080BEF43AE857` (`rule_id`),
  CONSTRAINT `FK76F080BEF43AE857` FOREIGN KEY (`rule_id`) REFERENCES `manager_ea_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_smtp
-- ----------------------------
CREATE TABLE `manager_ea_smtp` (
  `id` bigint(20) NOT NULL ,
  `account` varchar(255) default NULL,
  `host` varchar(255) default NULL,
  `passwd` varchar(255) default NULL,
  `port` varchar(255) default NULL,
  `sender` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_ea_systempara
-- ----------------------------
CREATE TABLE `manager_ea_systempara` (
  `id` bigint(20) NOT NULL ,
  `alias` varchar(255) default NULL,
  `keyname` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `sortNob` bigint(20) default NULL,
  `value` varchar(255) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKAF1525002DF235BC` (`parent_id`),
  CONSTRAINT `FKAF1525002DF235BC` FOREIGN KEY (`parent_id`) REFERENCES `manager_ea_systempara` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for manager_ea_user
-- ----------------------------
CREATE TABLE `manager_ea_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `account` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `allrole` varchar(255) default NULL,
  `allrolegroup` varchar(255) default NULL,
  `assessLev` varchar(255) default NULL,
  `birthDate` varchar(255) default NULL,
  `certification` varchar(255) default NULL,
  `companyname` varchar(255) default NULL,
  `conadminfee` varchar(255) default NULL,
  `conbegindate` varchar(255) default NULL,
  `condayfee` varchar(255) default NULL,
  `conmonfee` varchar(255) default NULL,
  `connetfee` varchar(255) default NULL,
  `contenddate` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `efee` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `email2` varchar(255) default NULL,
  `englishname` varchar(255) default NULL,
  `ericssonid` varchar(255) default NULL,
  `experience` varchar(255) default NULL,
  `graduateDate` varchar(255) default NULL,
  `groupname` varchar(255) default NULL,
  `home` varchar(255) default NULL,
  `identityCard` varchar(255) default NULL,
  `imgfilename` varchar(255) default NULL,
  `kpidescription` varchar(255) default NULL,
  `ksonumber` varchar(255) default NULL,
  `lastdate` varchar(255) default NULL,
  `laste` varchar(255) default NULL,
  `lastw` varchar(255) default NULL,
  `leftDate` varchar(255) default NULL,
  `mark` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `passwd` varchar(255) default NULL,
  `phoneNumber` varchar(255) default NULL,
  `positiondescription` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `rollDate` varchar(255) default NULL,
  `score` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `sognumber` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `teamname` varchar(255) default NULL,
  `techname` varchar(255) default NULL,
  `wfee` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
