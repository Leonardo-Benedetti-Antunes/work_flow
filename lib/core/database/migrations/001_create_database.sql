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

CREATE TABLE image (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    service_order_id INT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (service_order_id) REFERENCES service_order (id) ON DELETE CASCADE
);