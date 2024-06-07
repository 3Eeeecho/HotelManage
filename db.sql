CREATE DATABASE `HotelSystemplus` DEFAULT CHARACTER SET = 'utf8mb4';

SHOW DATABASES;

USE HotelSystemplus;

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

-----------改进-------------
-- 创建新的 booking 表
CREATE TABLE `booking` (
    `booking_id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('individual', 'team') NOT NULL,
    `client_or_team_id` VARCHAR(255) NOT NULL,
    `room_id` VARCHAR(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `booking_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `register_sid` VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (`room_id`) REFERENCES `room` (`rid`),
    FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `booking` (
        `type`,
        `client_or_team_id`,
        `room_id`,
        `start_time`,
        `end_time`,
        `booking_time`,
        `register_sid`
    )
VALUES (
        'individual',
        '130898199212233434',
        '201',
        '2024-06-01',
        '2024-06-05',
        '2024-05-29 10:15:00',
        '1'
    ),
    (
        'individual',
        '131989238123991309',
        '203',
        '2024-06-10',
        '2024-06-12',
        '2024-05-30 09:30:00',
        '2'
    ),
    (
        'individual',
        '189322199312262232',
        '301',
        '2024-07-01',
        '2024-07-03',
        '2024-05-28 14:20:00',
        '3'
    ),
    (
        'individual',
        '289193212393128999',
        '308',
        '2024-08-15',
        '2024-08-20',
        '2024-05-27 08:45:00',
        '4'
    ),
    (
        'individual',
        '290389199412280303',
        '402',
        '2024-09-05',
        '2024-09-10',
        '2024-05-27 11:00:00',
        '5'
    ),
    (
        'individual',
        '320198199812243456',
        '205',
        '2024-06-06',
        '2024-06-10',
        '2024-05-30 10:20:00',
        '6'
    ),
    (
        'individual',
        '320222199102036712',
        '207',
        '2024-07-10',
        '2024-07-15',
        '2024-05-28 16:45:00',
        '7'
    ),
    (
        'individual',
        '320678199012243333',
        '305',
        '2024-06-20',
        '2024-06-25',
        '2024-05-29 12:00:00',
        '8'
    ),
    (
        'individual',
        '320876196510200099',
        '307',
        '2024-08-21',
        '2024-08-25',
        '2024-05-30 14:30:00',
        '9'
    ),
    (
        'individual',
        '320897189722334567',
        '303',
        '2024-07-15',
        '2024-07-18',
        '2024-05-28 17:10:00',
        '10'
    ),
    (
        'team',
        '1',
        '301',
        '2024-06-06',
        '2024-06-10',
        '2024-05-29 10:15:00',
        '1'
    ),
    (
        'team',
        '1',
        '303',
        '2024-06-11',
        '2024-06-15',
        '2024-05-30 09:30:00',
        '2'
    ),
    (
        'team',
        '16',
        '305',
        '2024-07-04',
        '2024-07-08',
        '2024-05-28 14:20:00',
        '3'
    ),
    (
        'team',
        '16',
        '307',
        '2024-08-26',
        '2024-08-30',
        '2024-05-27 08:45:00',
        '4'
    ),
    (
        'team',
        '32',
        '201',
        '2024-09-11',
        '2024-09-15',
        '2024-05-30 10:20:00',
        '5'
    ),
    (
        'team',
        '32',
        '203',
        '2024-09-11',
        '2024-09-15',
        '2024-05-28 16:45:00',
        '6'
    ),
    (
        'team',
        '32',
        '308',
        '2024-09-11',
        '2024-09-15',
        '2024-05-27 11:00:00',
        '7'
    ),
    (
        'team',
        '7',
        '205',
        '2024-06-21',
        '2024-06-25',
        '2024-05-29 12:00:00',
        '8'
    ),
    (
        'team',
        '7',
        '207',
        '2024-06-21',
        '2024-06-25',
        '2024-05-30 14:30:00',
        '9'
    ),
    (
        'team',
        '7',
        '402',
        '2024-09-11',
        '2024-09-15',
        '2024-05-28 17:10:00',
        '10'
    );

-- 更新触发器以适应新的 booking 表
DELIMITER $$

CREATE TRIGGER after_insert_booking
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE roomPrice DECIMAL(10, 2);
    DECLARE daysBooked INT;
    DECLARE totalCost DECIMAL(10, 2);

    SELECT rprice INTO roomPrice FROM room WHERE rid = NEW.room_id;
    SET daysBooked = DATEDIFF(NEW.end_time, NEW.start_time);
    SET totalCost = roomPrice * daysBooked;
    
    INSERT INTO hotelorder (ordertype, start_time, end_time, rid, money, order_time, register_sid)
    VALUES ('预约', NEW.start_time, NEW.end_time, NEW.room_id, totalCost, NEW.booking_time, NEW.register_sid);
END$$

DELIMITER;

--验证触发器是否被激活---
SHOW TRIGGERS LIKE 'booking';

----------------------------

CREATE TABLE `checkin` (
    `checkin_id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('individual', 'team') NOT NULL,
    `client_or_team_id` VARCHAR(255) NOT NULL,
    `room_id` VARCHAR(255) NOT NULL,
    `start_time` DATE DEFAULT NULL,
    `end_time` DATE DEFAULT NULL,
    `total_price` DECIMAL(10, 2) DEFAULT NULL,
    `check_in_sid` VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (`room_id`) REFERENCES `room` (`rid`),
    FOREIGN KEY (`check_in_sid`) REFERENCES `staff` (`sid`)
);

INSERT INTO
    `checkin` (
        `type`,
        `client_or_team_id`,
        `room_id`,
        `start_time`,
        `end_time`,
        `total_price`,
        `check_in_sid`
    )
VALUES
    -- 插入调整后的个人入住数据
    (
        'individual',
        '130898199212233434',
        '201',
        '2024-06-06',
        '2024-06-10',
        832,
        '1'
    ),
    (
        'individual',
        '131989238123991309',
        '203',
        '2024-06-13',
        '2024-06-17',
        416,
        '2'
    ),
    (
        'individual',
        '189322199312262232',
        '301',
        '2024-07-04',
        '2024-07-08',
        416,
        '3'
    ),
    (
        'individual',
        '289193212393128999',
        '308',
        '2024-08-21',
        '2024-08-25',
        3440,
        '4'
    ),
    (
        'individual',
        '290389199412280303',
        '402',
        '2024-09-11',
        '2024-09-15',
        1340,
        '5'
    ),
    (
        'individual',
        '320198199812243456',
        '205',
        '2024-06-11',
        '2024-06-15',
        1072,
        '6'
    ),
    (
        'individual',
        '320222199102036712',
        '207',
        '2024-07-16',
        '2024-07-20',
        1340,
        '7'
    ),
    (
        'individual',
        '320678199012243333',
        '305',
        '2024-06-26',
        '2024-06-30',
        1290,
        '8'
    ),
    (
        'individual',
        '320876196510200099',
        '307',
        '2024-08-26',
        '2024-08-30',
        1040,
        '9'
    ),
    (
        'individual',
        '320897189722334567',
        '303',
        '2024-07-19',
        '2024-07-23',
        774,
        '10'
    ),
    -- 插入调整后的团队入住数据
    (
        'team',
        '1',
        '301',
        '2024-06-11',
        '2024-06-15',
        832,
        '1'
    ),
    (
        'team',
        '11',
        '303',
        '2024-06-16',
        '2024-06-20',
        416,
        '2'
    ),
    (
        'team',
        '16',
        '305',
        '2024-07-09',
        '2024-07-13',
        416,
        '3'
    ),
    (
        'team',
        '30',
        '307',
        '2024-08-26',
        '2024-08-30',
        3440,
        '4'
    ),
    (
        'team',
        '32',
        '308',
        '2024-09-11',
        '2024-09-15',
        3440,
        '5'
    ),
    (
        'team',
        '43',
        '201',
        '2024-06-11',
        '2024-06-15',
        1072,
        '6'
    ),
    (
        'team',
        '55',
        '203',
        '2024-07-16',
        '2024-07-20',
        1340,
        '7'
    ),
    (
        'team',
        '7',
        '205',
        '2024-06-26',
        '2024-06-30',
        1290,
        '8'
    ),
    (
        'team',
        '7',
        '207',
        '2024-06-26',
        '2024-06-30',
        1040,
        '9'
    ),
    (
        'team',
        '9',
        '402',
        '2024-07-19',
        '2024-07-23',
        774,
        '10'
    );

CREATE TABLE IF NOT EXISTS `hotelorder` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `ordertype` VARCHAR(255) NOT NULL,
    `start_time` DATE NOT NULL,
    `end_time` DATE NOT NULL,
    `rid` VARCHAR(255) NOT NULL,
    `money` DECIMAL(10, 2) DEFAULT NULL,
    `order_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `register_sid` VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
    FOREIGN KEY (`register_sid`) REFERENCES `staff` (`sid`)
);

-----触发器-----
DELIMITER $$

CREATE TRIGGER after_insert_checkin
AFTER INSERT ON checkin
FOR EACH ROW
BEGIN
    -- 更新房间状态为占用
    UPDATE room
    SET rstatus = '占用'
    WHERE rid = NEW.room_id;

    -- 插入订单到 hotelorder 表
    INSERT INTO hotelorder (ordertype, start_time, end_time, rid, money, order_time, register_sid)
    VALUES ('前台登记', NEW.start_time, NEW.end_time, NEW.room_id, NEW.total_price, NOW(), NEW.check_in_sid);
END$$

CREATE TRIGGER after_update_checkin
AFTER UPDATE ON checkin
FOR EACH ROW
BEGIN
    IF NEW.end_time < CURRENT_DATE THEN
        UPDATE room
        SET rstatus = '空闲'
        WHERE rid = NEW.room_id;
    END IF;
END$$

DELIMITER;

DROP VIEW IF EXISTS `Customers`;

CREATE VIEW Customers AS SELECT Cid, Cname, Csex, Cphone FROM Client;

DROP VIEW IF EXISTS `Rooms`;

CREATE VIEW Rooms AS
SELECT Rid, Rtype, Rsize, Rprice, rstatus
FROM Room;

DROP VIEW IF EXISTS `Living`;

CREATE VIEW Living AS
SELECT
    checkin_id,
    client_or_team_id,
    start_time,
    end_time,
    total_price
FROM checkin;

DROP VIEW IF EXISTS `Administrators`;

CREATE VIEW Administrators AS
SELECT Sid, Sname, Susername
FROM Staff
WHERE
    Srole > 1

DELIMITER $$

CREATE TRIGGER UpdateRoomStatusOnCheckIn
AFTER INSERT ON checkin
FOR EACH ROW
BEGIN
    UPDATE room
    SET rstatus = '占用'
    WHERE rid = NEW.room_id;
END$$

CREATE TRIGGER UpdateRoomStatusOnCheckOut
AFTER UPDATE ON checkin
FOR EACH ROW
BEGIN
    IF NEW.end_time < CURRENT_DATE THEN
        UPDATE room
        SET rstatus = '空闲'
        WHERE rid = NEW.room_id;
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
CREATE INDEX idx_booking_start_time ON booking (start_time);

CREATE INDEX idx_booking_end_time ON booking (end_time);

CREATE INDEX idx_client_register_time ON client (register_time);

CREATE INDEX idx_checkin_start_time ON checkin (start_time);

CREATE INDEX idx_checkin_end_time ON checkin (end_time);

--创建员工账号
CREATE USER 'ranxi' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'zs123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'ls123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'zl123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'wang123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'hq123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'oyy123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'jack123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'lucy123' @'localhost' IDENTIFIED BY '123456';

CREATE USER 'tom123' @'localhost' IDENTIFIED BY '123456';

-- 创建1级权限员工角色
CREATE ROLE Level1_Staff @'localhost';

-- 1级权限员工角色权限
GRANT SELECT ON hotelsystemplus.* TO Level1_Staff;

GRANT
INSERT
,
UPDATE,
DELETE ON HotelSystemplus.room TO Level1_Staff;

GRANT
INSERT
,
UPDATE,
DELETE ON HotelSystemplus.checkin TO Level1_Staff;

GRANT
INSERT
,
UPDATE,
DELETE ON HotelSystemplus.client TO Level1_Staff;

GRANT
INSERT
,
UPDATE,
DELETE ON HotelSystemplus.booking TO Level1_Staff;

GRANT
INSERT
,
UPDATE,
DELETE ON HotelSystemplus.team TO Level1_Staff;

-- 创建2级权限员工角色
CREATE ROLE Level2_Staff;

-- 2级权限员工角色权限
GRANT ALL PRIVILEGES ON HotelSystemplus.* TO Level2_Staff;

--激活所有角色权限
SET global activate_all_roles_on_login = ON;

-- 为1级权限员工分配角色
GRANT Level1_Staff TO 'zs123' @'localhost';

GRANT Level1_Staff TO 'ls123' @'localhost';

GRANT Level1_Staff TO 'zl123' @'localhost';

GRANT Level1_Staff TO 'wang123' @'localhost';

GRANT Level1_Staff TO 'hq123' @'localhost';

GRANT Level1_Staff TO 'jack123' @'localhost';

GRANT Level1_Staff TO 'lucy123' @'localhost';

-- 为2级权限员工分配角色
GRANT Level2_Staff TO 'ranxi' @'%';

GRANT Level2_Staff TO 'tom123' @'localhost';

GRANT Level2_Staff TO 'oyy123' @'localhost';

FLUSH PRIVILEGES;