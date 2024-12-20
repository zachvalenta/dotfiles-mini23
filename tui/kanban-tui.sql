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
INSERT INTO tasks VALUES(3,'aider','Doing',NULL,'','2024-12-07T15:28:26','2024-12-09T11:43:59',NULL,NULL,0,3);
INSERT INTO tasks VALUES(5,'quit smoking','Doing',NULL,'','2024-12-07T15:56:15','2024-12-07T16:00:42',NULL,NULL,0,4);
INSERT INTO tasks VALUES(6,'back to cooking','Done',NULL,'','2024-12-07T15:56:24','2024-12-07T15:56:55','2024-12-07T15:56:58',NULL,1,4);
INSERT INTO tasks VALUES(7,'exercise schedule','Ready',NULL,'','2024-12-07T15:57:14',NULL,NULL,NULL,0,4);
INSERT INTO tasks VALUES(8,'start boxing','Ready',NULL,'','2024-12-07T16:00:38',NULL,NULL,NULL,0,4);
INSERT INTO tasks VALUES(9,'buy/learn k8','Done',NULL,'','2024-12-07T16:00:58','2024-12-07T16:00:59','2024-12-07T16:00:59',NULL,1,2);
INSERT INTO tasks VALUES(10,'buy/learn v8','Done',NULL,'learn how to program','2024-12-07T16:01:15','2024-12-20T18:43:18','2024-12-20T18:43:20',NULL,1,2);
INSERT INTO tasks VALUES(11,'RAG for Dror','Ready',NULL,'','2024-12-09T11:40:52',NULL,NULL,NULL,0,3);
INSERT INTO tasks VALUES(12,'personal site','Doing',NULL,'','2024-12-09T11:42:10','2024-12-09T11:42:12',NULL,NULL,0,5);
INSERT INTO tasks VALUES(13,'feedback','Ready',NULL,replace('affected projects\n\n* posts on personal site?\n* Ramalho\n* query sandbox\n* algos\n* grokking concurrency','\n',char(10)),'2024-12-09T11:43:31',NULL,NULL,NULL,0,5);
INSERT INTO tasks VALUES(14,'build from scratch (Perrota)','Ready',NULL,'','2024-12-09T11:43:55',NULL,NULL,NULL,0,3);
INSERT INTO tasks VALUES(15,'dataclerk','Ready',NULL,'','2024-12-09T11:44:19',NULL,NULL,NULL,0,5);
INSERT INTO tasks VALUES(16,'canonical datasets','Ready',NULL,replace('* Iris\n* Sakila','\n',char(10)),'2024-12-09T11:44:45',NULL,NULL,NULL,0,5);
INSERT INTO tasks VALUES(17,'containerization','Ready',NULL,replace('* read Evans zines\n* Colima / OCI / CRI\n* uv support','\n',char(10)),'2024-12-09T11:45:23',NULL,NULL,NULL,0,5);
INSERT INTO tasks VALUES(18,'PIM','Ready',NULL,'* Django','2024-12-09T11:47:28',NULL,NULL,NULL,0,5);
INSERT INTO tasks VALUES(19,'ecommerce for Jack','Ready',NULL,'* "Flame depot was the site, and it was just Wordpress and woo commerce."','2024-12-09T11:47:44',NULL,NULL,NULL,0,5);
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
INSERT INTO boards VALUES(5,'projects',':🏗️:','2024-12-09T11:41:57');
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
INSERT INTO columns VALUES(17,'Ready',1,1,5);
INSERT INTO columns VALUES(18,'Doing',1,2,5);
INSERT INTO columns VALUES(19,'Done',1,3,5);
INSERT INTO columns VALUES(20,'Archive',0,4,5);
COMMIT;
