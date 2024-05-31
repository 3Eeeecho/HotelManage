CREATE DATABASE `HotelSystem` DEFAULT CHARACTER SET = 'utf8mb4';

SHOW DATABASES;

USE HotelSystem;

CREATE TABLE `room` (
    `rid` VARCHAR(255) NOT NULL,
    `rtype` VARCHAR(255) NOT NULL,
    `rsize` SMALLINT NOT NULL,
    `rprice` VARCHAR(255) NOT NULL,
    `rstatus` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`rid`),
    KEY `rprice` (`rprice`),
    KEY `rtype` (`rtype`, `rprice`)
);

INSERT INTO
    `room` (
        `rid`,
        `rtype`,
        `rsize`,
        `rprice`,
        `rstatus`
    )
VALUES (
        '201',
        '标准间（单人）',
        1,
        '208',
        '空闲'
    ),
    (
        '203',
        '标准间（单人）',
        1,
        '208',
        '空闲'
    ),
    (
        '205',
        '标准间（双人）',
        2,
        '268',
        '空闲'
    ),
    (
        '207',
        '标准间（双人）',
        2,
        '268',
        '空闲'
    ),
    (
        '301',
        '标准间（单人）',
        1,
        '208',
        '空闲'
    ),
    ('303', '大床房', 2, '258', '空闲'),
    ('305', '大床房', 2, '258', '空闲'),
    (
        '307',
        '标准间（单人）',
        1,
        '208',
        '空闲'
    ),
    ('308', '总统套房', 2, '688', '空闲'),
    (
        '402',
        '标准间（双人）',
        2,
        '268',
        '空闲'
    );

CREATE TABLE `staff` (
    `sid` varchar(255) NOT NULL,
    `sname` varchar(255) NOT NULL,
    `ssex` varchar(255) DEFAULT NULL,
    `susername` varchar(255) NOT NULL,
    `spassword` varchar(255) NOT NULL,
    `srole` varchar(255) NOT NULL,
    PRIMARY KEY (`sid`),
    UNIQUE KEY `susername` (`susername`)
);

INSERT INTO
    `staff` (
        `sid`,
        `sname`,
        `ssex`,
        `susername`,
        `spassword`,
        `srole`
    )
VALUES (
        '1',
        '冉冉',
        '男',
        'ranxi',
        '123456',
        '2'
    ),
    (
        '2',
        '张三',
        '女',
        'zs123',
        '123456',
        '1'
    ),
    (
        '3',
        '李四',
        '男',
        'ls123',
        '123456',
        '1'
    ),
    (
        '4',
        '赵六',
        '女',
        'zl123',
        '123456',
        '1'
    ),
    (
        '5',
        '王五',
        '男',
        'wang123',
        '123456',
        '1'
    ),
    (
        '6',
        '黄七',
        '男',
        'hq123',
        '123456',
        '1'
    ),
    (
        '7',
        '欧阳毅',
        '男',
        'oyy123',
        '123456',
        '2'
    ),
    (
        '8',
        'Jack',
        '男',
        'jack123',
        '123456',
        '1'
    ),
    (
        '9',
        'Lucy',
        '女',
        'lucy123',
        '123456',
        '1'
    ),
    (
        '10',
        'Tom',
        '男',
        'tom123',
        '123456',
        '2'
    );

CREATE TABLE `client` (
    `cname` varchar(255) NOT NULL,
    `cid` varchar(255) NOT NULL,
    `cphone` varchar(255) DEFAULT NULL,
    `cage` varchar(255) NOT NULL,
    `csex` varchar(255) DEFAULT NULL,
    `register_sid` varchar(255) DEFAULT NULL,
    `register_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`cid`),
    KEY `sid` (`register_sid`),
    KEY `cid` (`cid`, `register_sid`),
    CONSTRAINT `sid` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `client` (
        `cname`,
        `cid`,
        `cphone`,
        `cage`,
        `csex`,
        `register_sid`,
        `register_time`
    )
VALUES (
        '吴超梦',
        '130898199212233434',
        '13898322223',
        '28',
        '女',
        '1',
        '2024-05-20 10:48:42'
    ),
    (
        '黄荣',
        '131989238123991309',
        '13123323212',
        '52',
        '男',
        '2',
        '2024-03-17 09:24:48'
    ),
    (
        '王潇',
        '189322199312262232',
        '13098722343',
        '27',
        '男',
        '3',
        '2024-05-27 00:17:20'
    ),
    (
        '柯镇恶',
        '289193212393128999',
        '13310913888',
        '50',
        '男',
        '5',
        '2024-05-27 09:16:01'
    ),
    (
        '段深',
        '290389199412280303',
        '13898767890',
        '26',
        '男',
        '2',
        '2024-05-27 09:15:32'
    ),
    (
        '黄晓让',
        '320198199812243456',
        '13789098789',
        '21',
        '女',
        '6',
        '2024-05-27 10:06:33'
    ),
    (
        '赵超',
        '320222199102036712',
        '13821322312',
        '23',
        '男',
        '2',
        '2024-05-27 09:24:42'
    ),
    (
        '赵重样',
        '320678199012243333',
        '13765434212',
        '30',
        '男',
        '3',
        '2024-05-27 09:12:44'
    ),
    (
        '黄穰',
        '320876196510200099',
        '13876534543',
        '55',
        '女',
        '1',
        '2024-05-27 09:12:26'
    ),
    (
        '黄晓让',
        '320897189722334567',
        '13987667890',
        '30',
        '男',
        '7',
        '2024-05-27 10:09:29'
    );

CREATE TABLE `team` (
    `tname` varchar(255) NOT NULL,
    `tid` varchar(255) NOT NULL,
    `tphone` varchar(255) DEFAULT NULL,
    `check_in_sid` varchar(255) DEFAULT NULL,
    `register_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`tid`),
    KEY `team_sid` (`check_in_sid`),
    CONSTRAINT `team_sid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `team` (
        `tname`,
        `tid`,
        `tphone`,
        `check_in_sid`,
        `register_time`
    )
VALUES (
        '团队1',
        '1',
        '13896534534',
        '1',
        '2020-01-06 00:50:46'
    ),
    (
        '团队2',
        '11',
        '13976523423',
        '6',
        '2020-01-04 09:10:02'
    ),
    (
        '团队3',
        '16',
        '13987667890',
        '3',
        '2020-01-04 09:06:55'
    ),
    (
        '团队4',
        '30',
        '13898700998',
        '1',
        '2020-01-05 11:09:25'
    ),
    (
        '团队5',
        '32',
        '13962463676',
        '2',
        '2020-01-04 09:06:37'
    ),
    (
        '腾讯',
        '43',
        '13829833333',
        '1',
        '2020-01-04 11:55:01'
    ),
    (
        '团队6',
        '55',
        '13678998789',
        '2',
        '2020-01-05 06:41:05'
    ),
    (
        '团队7',
        '7',
        '17878989098',
        '6',
        '2020-01-04 09:25:37'
    ),
    (
        'Alibaba',
        '8',
        '18978978909',
        '4',
        '2020-01-04 09:07:48'
    ),
    (
        '团队8',
        '9',
        '13712345678',
        '5',
        '2020-01-07 09:25:37'
    );

CREATE TABLE `booking_client` (
    `cid` varchar(255) NOT NULL,
    `rid` varchar(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `booking_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`cid`, `rid`),
    KEY `rid` (`rid`),
    CONSTRAINT `booking_client_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`),
    CONSTRAINT `booking_client_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`)
);

INSERT INTO
    `booking_client` (
        `cid`,
        `rid`,
        `start_time`,
        `end_time`,
        `booking_time`
    )
VALUES (
        '130898199212233434',
        '201',
        '2024-06-01',
        '2024-06-05',
        '2024-05-29 10:15:00'
    ),
    (
        '131989238123991309',
        '203',
        '2024-06-10',
        '2024-06-12',
        '2024-05-30 09:30:00'
    ),
    (
        '189322199312262232',
        '301',
        '2024-07-01',
        '2024-07-03',
        '2024-05-28 14:20:00'
    ),
    (
        '289193212393128999',
        '308',
        '2024-08-15',
        '2024-08-20',
        '2024-05-27 08:45:00'
    ),
    (
        '290389199412280303',
        '402',
        '2024-09-05',
        '2024-09-10',
        '2024-05-27 11:00:00'
    ),
    (
        '320198199812243456',
        '205',
        '2024-06-06',
        '2024-06-10',
        '2024-05-30 10:20:00'
    ),
    (
        '320222199102036712',
        '207',
        '2024-07-10',
        '2024-07-15',
        '2024-05-28 16:45:00'
    ),
    (
        '320678199012243333',
        '305',
        '2024-06-20',
        '2024-06-25',
        '2024-05-29 12:00:00'
    ),
    (
        '320876196510200099',
        '307',
        '2024-08-21',
        '2024-08-25',
        '2024-05-30 14:30:00'
    ),
    (
        '320897189722334567',
        '303',
        '2024-07-15',
        '2024-07-18',
        '2024-05-28 17:10:00'
    );

CREATE TABLE `booking_team` (
    `tid` varchar(255) NOT NULL,
    `rid` varchar(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `booking_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`tid`, `rid`),
    KEY `rid` (`rid`),
    CONSTRAINT `booking_team_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`),
    CONSTRAINT `booking_team_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`)
);

INSERT INTO
    `booking_team` (
        `tid`,
        `rid`,
        `start_time`,
        `end_time`,
        `booking_time`
    )
VALUES (
        '1',
        '301',
        '2024-06-01',
        '2024-06-05',
        '2024-05-29 10:15:00'
    ),
    (
        '11',
        '303',
        '2024-06-10',
        '2024-06-12',
        '2024-05-30 09:30:00'
    ),
    (
        '16',
        '305',
        '2024-07-01',
        '2024-07-03',
        '2024-05-28 14:20:00'
    ),
    (
        '30',
        '307',
        '2024-08-15',
        '2024-08-20',
        '2024-05-27 08:45:00'
    ),
    (
        '32',
        '308',
        '2024-09-05',
        '2024-09-10',
        '2024-05-27 11:00:00'
    ),
    (
        '43',
        '201',
        '2024-06-06',
        '2024-06-10',
        '2024-05-30 10:20:00'
    ),
    (
        '55',
        '203',
        '2024-07-10',
        '2024-07-15',
        '2024-05-28 16:45:00'
    ),
    (
        '7',
        '205',
        '2024-06-20',
        '2024-06-25',
        '2024-05-29 12:00:00'
    ),
    (
        '8',
        '207',
        '2024-08-21',
        '2024-08-25',
        '2024-05-30 14:30:00'
    ),
    (
        '9',
        '402',
        '2024-07-15',
        '2024-07-18',
        '2024-05-28 17:10:00'
    );

CREATE TABLE `checkin_client` (
    `rid` varchar(255) NOT NULL,
    `cid` varchar(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `total_price` varchar(255) DEFAULT NULL,
    `check_in_sid` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`rid`, `cid`),
    KEY `cid` (`cid`),
    KEY `check_in_sid` (`check_in_sid`),
    CONSTRAINT `checkin_client_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
    CONSTRAINT `checkin_client_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`),
    CONSTRAINT `checkin_client_ibfk_3` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `checkin_client` (
        `rid`,
        `cid`,
        `start_time`,
        `end_time`,
        `total_price`,
        `check_in_sid`
    )
VALUES (
        '201',
        '130898199212233434',
        '2024-06-01',
        '2024-06-05',
        '832',
        '1'
    ),
    (
        '203',
        '131989238123991309',
        '2024-06-10',
        '2024-06-12',
        '416',
        '2'
    ),
    (
        '301',
        '189322199312262232',
        '2024-07-01',
        '2024-07-03',
        '416',
        '3'
    ),
    (
        '308',
        '289193212393128999',
        '2024-08-15',
        '2024-08-20',
        '3440',
        '4'
    ),
    (
        '402',
        '290389199412280303',
        '2024-09-05',
        '2024-09-10',
        '1340',
        '5'
    ),
    (
        '205',
        '320198199812243456',
        '2024-06-06',
        '2024-06-10',
        '1072',
        '6'
    ),
    (
        '207',
        '320222199102036712',
        '2024-07-10',
        '2024-07-15',
        '1340',
        '7'
    ),
    (
        '305',
        '320678199012243333',
        '2024-06-20',
        '2024-06-25',
        '1290',
        '8'
    ),
    (
        '307',
        '320876196510200099',
        '2024-08-21',
        '2024-08-25',
        '1040',
        '9'
    ),
    (
        '303',
        '320897189722334567',
        '2024-07-15',
        '2024-07-18',
        '774',
        '10'
    );

CREATE TABLE `checkin_team` (
    `rid` varchar(255) NOT NULL,
    `tid` varchar(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `total_price` varchar(255) DEFAULT NULL,
    `check_in_sid` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`rid`, `tid`),
    KEY `teamsid` (`check_in_sid`),
    KEY `teamtid` (`tid`),
    CONSTRAINT `teamrid` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
    CONSTRAINT `teamsid` FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`),
    CONSTRAINT `teamtid` FOREIGN KEY (`tid`) REFERENCES `team` (`tid`)
);

INSERT INTO
    `checkin_team` (
        `rid`,
        `tid`,
        `start_time`,
        `end_time`,
        `total_price`,
        `check_in_sid`
    )
VALUES (
        '301',
        '1',
        '2024-06-01',
        '2024-06-05',
        '832',
        '1'
    ),
    (
        '303',
        '11',
        '2024-06-10',
        '2024-06-12',
        '416',
        '2'
    ),
    (
        '305',
        '16',
        '2024-07-01',
        '2024-07-03',
        '416',
        '3'
    ),
    (
        '307',
        '30',
        '2024-08-15',
        '2024-08-20',
        '3440',
        '4'
    ),
    (
        '308',
        '32',
        '2024-09-05',
        '2024-09-10',
        '3440',
        '5'
    ),
    (
        '201',
        '43',
        '2024-06-06',
        '2024-06-10',
        '1072',
        '6'
    ),
    (
        '203',
        '55',
        '2024-07-10',
        '2024-07-15',
        '1340',
        '7'
    ),
    (
        '205',
        '7',
        '2024-06-20',
        '2024-06-25',
        '1290',
        '8'
    ),
    (
        '207',
        '8',
        '2024-08-21',
        '2024-08-25',
        '1040',
        '9'
    ),
    (
        '402',
        '9',
        '2024-07-15',
        '2024-07-18',
        '774',
        '10'
    );

CREATE TABLE `hotelorder` (
    `id` varchar(255) NOT NULL,
    `ordertype` varchar(255) NOT NULL,
    `start_time` DATE NOT NULL,
    `end_time` DATE NOT NULL,
    `rid` varchar(255) NOT NULL,
    `money` varchar(255) DEFAULT NULL,
    `order_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `register_sid` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `rid` (`rid`),
    KEY `register_sid` (`register_sid`),
    CONSTRAINT `hotelorder_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
    CONSTRAINT `hotelorder_ibfk_2` FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `hotelorder` (
        `id`,
        `ordertype`,
        `start_time`,
        `end_time`,
        `rid`,
        `money`,
        `order_time`,
        `register_sid`
    )
VALUES (
        '1',
        '团队',
        '2024-06-01',
        '2024-06-05',
        '201',
        '832',
        '2024-05-29 10:15:00',
        '1'
    ),
    (
        '2',
        '团队',
        '2024-06-10',
        '2024-06-12',
        '203',
        '416',
        '2024-05-30 09:30:00',
        '2'
    ),
    (
        '3',
        '团队',
        '2024-07-01',
        '2024-07-03',
        '301',
        '416',
        '2024-05-28 14:20:00',
        '3'
    ),
    (
        '4',
        '团队',
        '2024-08-15',
        '2024-08-20',
        '308',
        '3440',
        '2024-05-27 08:45:00',
        '4'
    ),
    (
        '5',
        '团队',
        '2024-09-05',
        '2024-09-10',
        '402',
        '1340',
        '2024-05-27 11:00:00',
        '5'
    ),
    (
        '6',
        '团队',
        '2024-06-01',
        '2024-06-05',
        '205',
        '1072',
        '2024-05-30 10:20:00',
        '6'
    ),
    (
        '7',
        '团队',
        '2024-07-10',
        '2024-07-15',
        '207',
        '1340',
        '2024-05-28 16:45:00',
        '7'
    ),
    (
        '8',
        '团队',
        '2024-06-20',
        '2024-06-25',
        '305',
        '1290',
        '2024-05-29 12:00:00',
        '8'
    ),
    (
        '9',
        '团队',
        '2024-08-01',
        '2024-08-05',
        '307',
        '1040',
        '2024-05-30 14:30:00',
        '9'
    ),
    (
        '10',
        '团队',
        '2024-07-15',
        '2024-07-18',
        '303',
        '774',
        '2024-05-28 17:10:00',
        '10'
    ),
    (
        '21',
        '个体',
        '2024-06-01',
        '2024-06-05',
        '201',
        '832',
        '2024-05-29 10:15:00',
        '1'
    ),
    (
        '22',
        '个体',
        '2024-06-10',
        '2024-06-12',
        '203',
        '416',
        '2024-05-30 09:30:00',
        '2'
    ),
    (
        '23',
        '个体',
        '2024-07-01',
        '2024-07-03',
        '301',
        '416',
        '2024-05-28 14:20:00',
        '3'
    ),
    (
        '24',
        '个体',
        '2024-08-15',
        '2024-08-20',
        '308',
        '3440',
        '2024-05-27 08:45:00',
        '4'
    ),
    (
        '25',
        '个体',
        '2024-09-05',
        '2024-09-10',
        '402',
        '1340',
        '2024-05-27 11:00:00',
        '5'
    ),
    (
        '26',
        '团队',
        '2024-06-06',
        '2024-06-10',
        '301',
        '832',
        '2024-05-29 10:15:00',
        '1'
    ),
    (
        '27',
        '团队',
        '2024-06-11',
        '2024-06-15',
        '303',
        '416',
        '2024-05-30 09:30:00',
        '2'
    ),
    (
        '28',
        '团队',
        '2024-07-04',
        '2024-07-08',
        '305',
        '416',
        '2024-05-28 14:20:00',
        '3'
    ),
    (
        '29',
        '团队',
        '2024-08-26',
        '2024-08-30',
        '307',
        '3440',
        '2024-05-27 08:45:00',
        '4'
    ),
    (
        '30',
        '团队',
        '2024-09-11',
        '2024-09-15',
        '308',
        '1340',
        '2024-05-27 11:00:00',
        '5'
    );

DROP VIEW IF EXISTS `Customers`;

CREATE VIEW Customers AS SELECT Cid, Cname, Csex, Cphone FROM Client;

DROP VIEW IF EXISTS `Rooms`;

CREATE VIEW Rooms AS
SELECT Rid, Rtype, Rsize, Rprice, rstatus
FROM Room;

DROP VIEW IF EXISTS `Living`;

CREATE VIEW Living AS
SELECT
    Rid,
    Cid,
    start_time,
    end_time,
    total_price
FROM checkin_client;

DROP VIEW IF EXISTS `Administrators`;

CREATE VIEW Administrators AS
SELECT Sid, Sname, Susername
FROM Staff
WHERE
    Srole > 1
-- 创建入住时更新房间状态的触发器
DELIMITER $$

CREATE TRIGGER UpdateRoomStatusOnCheckIn
AFTER INSERT ON checkin_client
FOR EACH ROW
BEGIN
    UPDATE room
    SET rstatus = '占用'
    WHERE rid = NEW.rid;
END$$

DELIMITER;

-- 创建退房时更新房间状态的触发器
DELIMITER $$

CREATE TRIGGER UpdateRoomStatusOnCheckOut
AFTER UPDATE ON checkin_client
FOR EACH ROW
BEGIN
    IF NEW.end_time < CURRENT_DATE THEN
        UPDATE room
        SET rstatus = '空闲'
        WHERE rid = NEW.rid;
    END IF;
END$$

DELIMITER;

--客户电话号码索引：加快通过电话号码查询客户信息的速度
CREATE INDEX idx_cphone ON client (cphone);

--房间价格索索引：加快通过价格查询房间的速度
CREATE INDEX idx_rprice ON room (rprice);

--为状态字段添加索引可能会有助于快速筛选
CREATE INDEX idx_rstatus ON room (rstatus);
--根据入住日期、预订日期或注册时间来查询数据
CREATE INDEX idx_start_time ON booking_client (start_time);

CREATE INDEX idx_end_time ON booking_client (end_time);

CREATE INDEX idx_register_time ON client (register_time);

--创建员工账号
CREATE USER 'ranxi' @'%' IDENTIFIED BY '123456';

CREATE USER 'zs123' @'%' IDENTIFIED BY '123456';

CREATE USER 'ls123' @'%' IDENTIFIED BY '123456';

CREATE USER 'zl123' @'%' IDENTIFIED BY '123456';

CREATE USER 'wang123' @'%' IDENTIFIED BY '123456';

CREATE USER 'hq123' @'%' IDENTIFIED BY '123456';

CREATE USER 'oyy123' @'%' IDENTIFIED BY '123456';

CREATE USER 'jack123' @'%' IDENTIFIED BY '123456';

CREATE USER 'lucy123' @'%' IDENTIFIED BY '123456';

CREATE USER 'tom123' @'%' IDENTIFIED BY '123456';

--授予员工权限
GRANT Level1_Staff TO 'zs123' @'%';

GRANT Level1_Staff TO 'ls123' @'%';

GRANT Level1_Staff TO 'zl123' @'%';

GRANT Level1_Staff TO 'wang123' @'%';

GRANT Level1_Staff TO 'hq123' @'%';

GRANT Level1_Staff TO 'jack123' @'%';

GRANT Level1_Staff TO 'lucy123' @'%';

GRANT Level2_Staff TO 'ranxi' @'%';

GRANT Level2_Staff TO 'oyy123' @'%';

GRANT Level2_Staff TO 'tom123' @'%';

-- 创建1级权限员工角色
CREATE ROLE Level1_Staff;

-- 授予更新权限
GRANT UPDATE ON hotelsystem.booking_client TO Level1_Staff;

GRANT UPDATE ON hotelsystem.booking_team TO Level1_Staff;

GRANT UPDATE ON hotelsystem.checkin_client TO Level1_Staff;

GRANT UPDATE ON hotelsystem.checkin_team TO Level1_Staff;

-- 授予查询权限
GRANT SELECT ON hotelsystem.client TO Level1_Staff;

GRANT SELECT ON hotelsystem.room TO Level1_Staff;

GRANT SELECT ON hotelsystem.team TO Level1_Staff;

GRANT SELECT ON hotelsystem.hotelorder TO Level1_Staff;

-- 创建2级权限员工角色
CREATE ROLE Level2_Staff;

-- 授予更新、删除和选择权限
GRANT SELECT, UPDATE, DELETE ON hotelsystem.staff TO Level2_Staff;

GRANT SELECT, UPDATE, DELETE ON hotelsystem.room TO Level2_Staff;

-- 授予投放、更新、删除和选择权限
GRANT
SELECT,
UPDATE, DELETE,
DROP ON hotelsystem.client TO Level2_Staff;

GRANT
SELECT,
UPDATE, DELETE,
DROP ON hotelsystem.team TO Level2_Staff;

-- 授予更新、选择、投放和删除权限
GRANT
SELECT,
UPDATE, DELETE,
DROP ON hotelsystem.hotelorder TO Level2_Staff;

GRANT
SELECT,
UPDATE, DELETE,
DROP ON hotelsystem.booking_client TO Level2_Staff;

GRANT
SELECT,
UPDATE, DELETE,
DROP ON hotelsystem.booking_team TO Level2_Staff;