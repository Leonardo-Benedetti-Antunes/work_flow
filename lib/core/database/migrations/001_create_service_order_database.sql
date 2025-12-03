CREATE TABLE service_order (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    status INT DEFAULT 0,
    location TEXT,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    started_at TEXT,
    finished_at TEXT
);