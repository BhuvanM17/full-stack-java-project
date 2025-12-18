# MediSales ERP

Modern Medical Sales Management System with a premium UI and secured backend.

## 🚀 Free "All-in-One" Deployment (Render.com)

This project is configured for **PostgreSQL**, allowing you to host the App and DB for free on Render.

### 1. Create a Free PostgreSQL DB
- Go to [Render Dashboard](https://dashboard.render.com).
- Click **New** -> **PostgreSQL**.
- Name: `medi_sales`, Region: `Oregon` (or closest), Tier: `Free`.
- Click **Create Database**.
- Copy the **Internal Database URL** (e.g., `postgres://user:pass@host:port/db`).

### 2. Create a Web Service
- Click **New** -> **Web Service**.
- Connect this GitHub Repository.
- **Runtime**: `Docker`.
- **Advanced** -> **Add Environment Variables**:
  - `DB_URL`: Insert your Database URL (Change `postgres://` to `jdbc:postgresql://`).
  - `DB_USERNAME`: (From your Render DB details).
  - `DB_PASSWORD`: (From your Render DB details).
  - `MAIL_USERNAME`: Your Gmail.
  - `MAIL_PASSWORD`: Your Gmail App Password.
- Click **Deploy Web Service**.

## 🛠️ Local Development

1. **Environment Variables**: Use `.env.example` as a template.
2. **Database**: Ensure you have a PostgreSQL instance running locally.
3. **Build**:
   ```bash
   mvn clean package
   ```
4. **Run**: Deploy the generated `target/medi_sales.war` to Tomcat 9.
