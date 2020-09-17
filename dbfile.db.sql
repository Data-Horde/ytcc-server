BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "workers" (
	"WorkerID"	TEXT NOT NULL UNIQUE,
	"CreatedTime"	TEXT NOT NULL,
	"LastAliveTime"	TEXT NOT NULL,
	"LastAliveIP"	TEXT NOT NULL,
	PRIMARY KEY("WorkerID")
);
CREATE TABLE IF NOT EXISTS "main" (
	"BatchID"	INTEGER NOT NULL,
	"BatchStatus"	INTEGER NOT NULL,
	"BatchStatusUpdateTime"	TEXT,
	"BatchStatusUpdateIP"	TEXT,
	"BatchContent"	TEXT,
	"WorkerKey"	TEXT,
	"RandomKey"	INTEGER,
	"AssignedTime"	TEXT,
	"BatchSize"	INTEGER,
	PRIMARY KEY("BatchID" AUTOINCREMENT)
);
CREATE INDEX IF NOT EXISTS "main_combined" ON "main" (
	"BatchID",
	"WorkerKey",
	"RandomKey"
);
CREATE INDEX IF NOT EXISTS "worker_id" ON "workers" (
	"WorkerID"
);
CREATE INDEX IF NOT EXISTS "main_BatchStatus" ON "main" (
	"BatchStatus"
);
CREATE INDEX IF NOT EXISTS "main_BatchContent" ON "main" (
	"BatchContent"
);
COMMIT;
