CREATE TABLE image (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    service_order_id INT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (service_order_id) REFERENCES service_order (id) ON DELETE CASCADE
);