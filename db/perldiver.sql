DROP TABLE IF EXISTS repo;
DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS run;
DROP TABLE IF EXISTS run_file;

CREATE TABLE repo (
id INTEGER PRIMARY KEY NOT NULL,
name CHAR(50) NOT NULL,
uri VARCHAR(500) NOT NULL,
owner CHAR(50) NOT NULL);

CREATE TABLE file (
id INTEGER PRIMARY KEY NOT NULL,
repo_id INTEGER NOT NULL,
path VARCHAR(200) NOT NULL,
name CHAR(50) NOT NULL,
FOREIGN KEY (repo_id) REFERENCES repo(id) ON DELETE RESTRICT ON UPDATE RESTRICT);

CREATE TABLE run (
id INTEGER PRIMARY KEY NOT NULL,
repo_id INTEGER NOT NULL,
date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
data JSON,
notes LONGTEXT,
FOREIGN KEY (repo_id) REFERENCES repo(id) ON DELETE RESTRICT ON UPDATE RESTRICT);

CREATE TABLE run_file (
id INTEGER PRIMARY KEY NOT NULL,
run_id INTEGER NOT NULL,
file_id INTEGER NOT NULL,
data JSON,
FOREIGN KEY (run_id) REFERENCES run(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (file_id) REFERENCES file(id) ON DELETE RESTRICT ON UPDATE RESTRICT);
