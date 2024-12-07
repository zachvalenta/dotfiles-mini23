PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE tasks (
    task_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    column TEXT NOT NULL,
    category TEXT,
    description TEXT,
    creation_date DATETIME NOT NULL,
    start_date DATETIME,
    finish_date DATETIME,
    due_date DATETIME,
    time_worked_on INTEGER,
    board_id INTEGER,
    FOREIGN KEY (board_id) REFERENCES boards(board_id),
    CHECK (title <> "")
    );
INSERT INTO tasks VALUES(1,'Moonlander','Ready',NULL,'','2024-12-07T15:27:27',NULL,NULL,NULL,0,2);
INSERT INTO tasks VALUES(2,'llm','Ready',NULL,'','2024-12-07T15:28:19',NULL,NULL,NULL,0,3);
INSERT INTO tasks VALUES(3,'aider','Ready',NULL,'','2024-12-07T15:28:26',NULL,NULL,NULL,0,3);
INSERT INTO tasks VALUES(4,'learn how to program keychron','Ready',NULL,'','2024-12-07T15:39:23',NULL,NULL,NULL,0,2);
INSERT INTO tasks VALUES(5,'quit smoking','Doing',NULL,'','2024-12-07T15:56:15','2024-12-07T16:00:42',NULL,NULL,0,4);
INSERT INTO tasks VALUES(6,'back to cooking','Done',NULL,'','2024-12-07T15:56:24','2024-12-07T15:56:55','2024-12-07T15:56:58',NULL,1,4);
INSERT INTO tasks VALUES(7,'exercise schedule','Ready',NULL,'','2024-12-07T15:57:14',NULL,NULL,NULL,0,4);
INSERT INTO tasks VALUES(8,'start boxing','Ready',NULL,'','2024-12-07T16:00:38',NULL,NULL,NULL,0,4);
INSERT INTO tasks VALUES(9,'buy/learn k8','Done',NULL,'','2024-12-07T16:00:58','2024-12-07T16:00:59','2024-12-07T16:00:59',NULL,1,2);
INSERT INTO tasks VALUES(10,'buy/learn v8','Ready',NULL,'','2024-12-07T16:01:15',NULL,NULL,NULL,0,2);
CREATE TABLE boards (
    board_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    icon TEXT,
    creation_date DATETIME NOT NULL,
    CHECK (name <> "")
    );
INSERT INTO boards VALUES(1,'Kanban Board',':sparkles:','2024-12-07T15:26:24');
INSERT INTO boards VALUES(2,'keeb',':⌨️:','2024-12-07T15:26:50');
INSERT INTO boards VALUES(3,'AI',':🧠:','2024-12-07T15:28:03');
INSERT INTO boards VALUES(4,'health',':👟:','2024-12-07T15:56:01');
CREATE TABLE columns (
    column_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    visible BOOLEAN,
    position INTEGER,
    board_id INTEGER,
    FOREIGN KEY (board_id) REFERENCES boards(board_id),
    CHECK (name <> "")
    );
INSERT INTO columns VALUES(1,'Ready',1,1,1);
INSERT INTO columns VALUES(2,'Doing',1,2,1);
INSERT INTO columns VALUES(3,'Done',1,3,1);
INSERT INTO columns VALUES(4,'Archive',0,4,1);
INSERT INTO columns VALUES(5,'Ready',1,1,2);
INSERT INTO columns VALUES(6,'Doing',1,2,2);
INSERT INTO columns VALUES(7,'Done',1,3,2);
INSERT INTO columns VALUES(8,'Archive',0,4,2);
INSERT INTO columns VALUES(9,'Ready',1,1,3);
INSERT INTO columns VALUES(10,'Doing',1,2,3);
INSERT INTO columns VALUES(11,'Done',1,3,3);
INSERT INTO columns VALUES(12,'Archive',0,4,3);
INSERT INTO columns VALUES(13,'Ready',1,1,4);
INSERT INTO columns VALUES(14,'Doing',1,2,4);
INSERT INTO columns VALUES(15,'Done',1,3,4);
INSERT INTO columns VALUES(16,'Archive',0,4,4);
COMMIT;
