-- Cryptotracker — SQLite schema
-- Recreate the database with:  sqlite3 db/crypto_tracker.sqlite < schema.sql

CREATE TABLE IF NOT EXISTS users (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    username   TEXT NOT NULL UNIQUE,
    password   TEXT NOT NULL,            -- password_hash(), never plaintext
    role       TEXT NOT NULL DEFAULT 'user',   -- 'user' | 'admin'
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS portfolio (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id       INTEGER NOT NULL,
    crypto_symbol TEXT NOT NULL,
    amount        REAL NOT NULL,
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_portfolio_user ON portfolio(user_id);
