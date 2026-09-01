# Cryptotracker

A cryptocurrency price tracker with user accounts and a personal portfolio.
Built as a university group project, set as an exercise in consuming public APIs.

**Stack:** PHP · SQLite · vanilla JavaScript · no framework

---

## What it does

- **Search** any currency and see its current price, pulled live from the
  [CoinGecko API](https://www.coingecko.com/en/api) (`/simple/price`)
- **Dashboard** with prices and market news
- **Portfolio** — record how much of each coin you hold and see what it's worth now
- **Accounts** — registration, login, sessions, and an `admin` role with its own panel

## My part

I did the frontend and the design — the layout, the CSS, and how the dashboard,
search and portfolio pages behave. I also spent a fair amount of the project
keeping the group coordinated and touching most parts of the codebase, which
turned out to be as much of the work as the code itself.

## Structure

```
index.php            landing page
config.php           database path + connection
create_user.php      CLI-ish helper for seeding a user
css/styles.css
js/script.js         API calls to CoinGecko
php/
  session.php        session bootstrap + auth guard
  header.php
  footer.php
pages/
  register.php  login.php  logout.php
  dashboard.php      prices + news
  search.php         currency lookup
  portfolio.php      holdings, add/remove
  admin.php          admin-only panel
db/                  SQLite file lives here (not committed)
```

## Running it locally

The database file isn't in the repo — it holds user accounts. Create it first:

```bash
sqlite3 db/crypto_tracker.sqlite < schema.sql
php -S localhost:8000
```

Then open <http://localhost:8000> and register an account.

To make that account an admin:

```bash
sqlite3 db/crypto_tracker.sqlite "UPDATE users SET role='admin' WHERE username='YOURNAME';"
```

## Notes

Written as coursework, and it shows in places — it's plain PHP with no
framework, no build step and no tests. Queries do use prepared statements
with bound parameters throughout, which was the part the assignment cared about.
