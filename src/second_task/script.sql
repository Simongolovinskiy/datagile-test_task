CREATE TABLE DAT_PUBLIC_COMMON (
    Timestamp TIMESTAMP,
    EventNumID INT,
    Severity VARCHAR(10),
    EventID INT,
    EventName VARCHAR(100),
    UserID INT,
    ServerID VARCHAR(20),
    ServerName VARCHAR(50),
    DeviceID INT,
    DeviceName VARCHAR(20),
    DataID INT
);

CREATE TABLE DAT_PUBLIC_USER (
    UserID INT,
    UserName VARCHAR(50),
    ClientAddress VARCHAR(15),
    ClientHostName VARCHAR(50)
);

CREATE TABLE DAT_PUBLIC_DOC (
    DataID INT,
    DataName VARCHAR(10),
    DataDetail1 VARCHAR(20),
    DataDetail2 VARCHAR(50),
    DataConfidLevel VARCHAR(50)
);

INSERT INTO DAT_PUBLIC_COMMON VALUES
('2018-05-11 12:13:09', 1, 'Critical', 45, 'Печать входной формы №23', 12, '10.10.10.1', 'GEOSERVER.CORP.LOC', 11, 'Printer-11', 1245),
('2018-05-12 15:55:05', 2, 'Info', 45, 'Печать входной формы №23', 13, '10.10.10.1', 'GEOSERVER.CORP.LOC', 11, 'Printer-11', 1145),
('2018-05-13 08:26:55', 3, 'High', 44, 'Выход из архива входной формы №23', 14, '10.10.10.1', 'GEOSERVER.CORP.LOC', 3, 'Monitor-3', 1245),
('2018-05-14 12:25:00', 4, 'Info', 44, 'Выход из архива входной формы №23', 13, '10.10.10.1', 'GEOSERVER.CORP.LOC', 4, 'Monitor-4', 1145),
('2018-05-15 08:55:45', 5, 'Info', 15, 'Успешный вход пользователя', 14, '10.10.10.1', 'GEOSERVER.CORP.LOC', NULL, NULL, NULL),
('2018-05-16 20:15:56', 6, 'High', 15, 'Неуспешный вход пользователя', 13, '10.10.10.1', 'GEOSERVER.CORP.LOC', NULL, NULL, NULL),
('2018-05-18 11:23:02', 7, 'High', 33, 'Доступ к секретному ресурсу', 12, '10.10.10.1', 'GEOSERVER.CORP.LOC', NULL, NULL, 1248);

INSERT INTO DAT_PUBLIC_USER VALUES
(12, 'Иванов А.А.', '192.168.45.55', 'ARM-2.CORP.LOC'),
(13, 'Петров А.А.', '192.168.45.56', 'ARM-1.CORP.LOC'),
(14, 'Сидоров А.А.', '192.168.45.57', 'ARM-3.CORP.LOC');

INSERT INTO DAT_PUBLIC_DOC VALUES
(1245, 'Doc1', 'DOC1-1245', 'Шифр "DOC-1-1245"', 'Коммерческая тайна'),
(1145, 'Doc14', 'DOC14-1145', 'Шифр "DOC-1-1145"', 'Не коммерческая тайна'),
(1248, 'Doc2', 'DOC2-1248', 'Шифр "DOC-1-1245"', 'Коммерческая тайна');

SELECT c.Timestamp, c.EventNumID, c.Severity, c.EventID, c.EventName,
       u.UserName, c.ServerID, c.ServerName, c.DeviceID, c.DeviceName,
       d.DataName, d.DataDetail1, d.DataDetail2, d.DataConfidLevel
FROM DAT_PUBLIC_COMMON c
JOIN DAT_PUBLIC_USER u ON c.UserID = u.UserID
LEFT JOIN DAT_PUBLIC_DOC d ON c.DataID = d.DataID
WHERE c.UserID != 14 AND c.Timestamp > '2018-05-11 12:13:00'
ORDER BY c.Timestamp DESC;