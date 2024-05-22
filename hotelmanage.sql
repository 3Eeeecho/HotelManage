-- ----------------------------
-- 管理员表信息
-- ----------------------------

CREATE TABLE `administrators` (
    `Ano` char(10) NOT NULL,
    `Aname` char(10) NOT NULL,
    `Aposition` char(10) NOT NULL,
    `Apassword` char(20) NOT NULL,
    PRIMARY KEY (`Ano`),
    UNIQUE KEY `Admintno` (`Ano`)
) ENGINE = InnoDB DEFAULT CHARSET = gbk;

-- ----------------------------
-- 插入管理员数据
-- ----------------------------

INSERT INTO `administrators` VALUES ('1', 'jing', '经理', '123');

-- ----------------------------
-- 客户表信息
-- ----------------------------

CREATE TABLE `customers` (
    `Cno` char(10) NOT NULL,
    `Cname` char(10) NOT NULL,
    `Csex` char(2) DEFAULT NULL,
    `Cid` char(20) NOT NULL,
    PRIMARY KEY (`Cno`),
    UNIQUE KEY `Custno` (`Cno`)
) ENGINE = InnoDB DEFAULT CHARSET = gbk;

-- ----------------------------
-- 插入客户数据
-- ----------------------------
INSERT INTO
    `customers`
VALUES (
        '1',
        '竹',
        '男',
        '413026200004059317'
    );

INSERT INTO
    `customers`
VALUES (
        '2',
        '京',
        '女',
        '41302620000405918'
    );

INSERT INTO
    `customers`
VALUES (
        '3',
        '崔',
        '男',
        '413026200004059318'
    );

-- ----------------------------
-- 客户住宿信息表
-- ----------------------------

CREATE TABLE `living` (
    `Cno` char(10) NOT NULL,
    `Rno` char(10) NOT NULL,
    `Ccomedate` datetime NOT NULL,
    `Cleftdate` datetime NOT NULL,
    `Ctime` char(11) DEFAULT NULL,
    `Camount` int(11) DEFAULT NULL,
    PRIMARY KEY (`Cno`, `Rno`),
    UNIQUE KEY `Livno` (`Cno`),
    KEY `living_ibfk_2` (`Rno`),
    CONSTRAINT `living_ibfk_1` FOREIGN KEY (`Cno`) REFERENCES `customers` (`Cno`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `living_ibfk_2` FOREIGN KEY (`Rno`) REFERENCES `tb_rooms` (`Rno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = gbk;

-- ----------------------------
-- 插入客户住宿信息
-- ----------------------------
INSERT INTO
    `living`
VALUES (
        '1',
        '0001',
        '2021-12-12 10:38:17',
        '2021-12-13 10:38:19',
        NULL,
        NULL
    );

INSERT INTO
    `living`
VALUES (
        '2',
        '0006',
        '2021-12-12 17:49:24',
        '2021-12-13 17:49:27',
        NULL,
        NULL
    );

-- ----------------------------
-- 客房物品信息表
-- ----------------------------
DROP TABLE IF EXISTS `roomitem`;

CREATE TABLE `roomitem` (
    `Ritemno` char(10) NOT NULL,
    `Rno` char(10) NOT NULL,
    `Ritemname` char(20) NOT NULL,
    `Ritemprice` int(11) DEFAULT NULL,
    `Ritemstate` char(10) CHARACTER SET utf8 DEFAULT NULL,
    `Ritemnum` int(11) DEFAULT NULL,
    PRIMARY KEY (`Ritemno`),
    UNIQUE KEY `Ritemno` (`Ritemno`),
    KEY `roomitem_fk1` (`Rno`),
    CONSTRAINT `roomitem_fk1` FOREIGN KEY (`Rno`) REFERENCES `tb_rooms` (`Rno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = gbk;

-- ----------------------------
-- 插入客房物品数据
-- ----------------------------
INSERT INTO
    `roomitem`
VALUES (
        '01',
        '0001',
        '牙刷',
        '10',
        '损坏',
        '1'
    );

INSERT INTO `roomitem` VALUES ( '02', '0001', '毛巾', '5', '完好', '1' );

INSERT INTO `roomitem` VALUES ( '03', '0001', '0', '0', '损坏', '1' );

INSERT INTO
    `roomitem`
VALUES (
        '04',
        '0002',
        '牙刷',
        '10',
        '损坏',
        '1'
    );

INSERT INTO `roomitem` VALUES ( '05', '0006', '毛巾', '3', '损坏', '1' );

-- ----------------------------
-- 客房基本信息表
-- ----------------------------
DROP TABLE IF EXISTS `tb_rooms`;

CREATE TABLE `tb_rooms` (
    `Rno` char(20) NOT NULL,
    `Rstyle` enum('A', 'B', 'C', 'D') NOT NULL DEFAULT 'D',
    `Rprice` int(11) DEFAULT NULL,
    `Rstate` char(10) DEFAULT '空',
    `Rtel` char(15) DEFAULT NULL,
    PRIMARY KEY (`Rno`),
    UNIQUE KEY `Roomno` (`Rno`)
) ENGINE = InnoDB DEFAULT CHARSET = gbk;

-- ----------------------------
-- 插入客房基本数据
-- ----------------------------
INSERT INTO `tb_rooms` VALUES ( '0001', 'A', '200', '满', '0001' );

INSERT INTO `tb_rooms` VALUES ( '0002', 'A', '200', '空', '0002' );

INSERT INTO `tb_rooms` VALUES ( '0003', 'B', '150', '空', '0003' );

INSERT INTO `tb_rooms` VALUES ( '0004', 'B', '150', '空', '0004' );

INSERT INTO `tb_rooms` VALUES ( '0005', 'C', '100', '空', '0005' );

INSERT INTO `tb_rooms` VALUES ( '0006', 'C', '100', '满', '0006' );

INSERT INTO `tb_rooms` VALUES ( '0007', 'D', '50', '空', '0007' );

INSERT INTO `tb_rooms` VALUES ( '0008', 'D', '50', '空', '0008' );

INSERT INTO `tb_rooms` VALUES ( '0009', 'D', '50', '空', '0009' );