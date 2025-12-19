# MediSales ERP

Modern Medical Sales Management System with a premium UI, secured backend, and integrated AI Assistant.

## 🔗 Live Access
**URL**: [https://full-stack-java-project.onrender.com](https://full-stack-java-project.onrender.com)

## 🚀 Deployment Guide (Render.com)

This project is configured for **Docker**, allowing you to host the App and DB for free on Render.

### 1. Create a Free PostgreSQL DB
- Go to [Render Dashboard](https://dashboard.render.com).
- Click **New** -> **PostgreSQL**.
- Name: `medi_sales`, Tier: `Free`.
- Copy the **Internal Database URL**.

### 2. Create a Web Service
- Click **New** -> **Web Service**.
- Connect this GitHub Repository.
- **Runtime**: `Docker`.
- **Advanced** -> **Add Environment Variables**:
  - `DB_URL`: Your Database URL (Ensure it uses `jdbc:postgresql://`).
  - `DB_USERNAME`: Database username.
  - `DB_PASSWORD`: Database password.
  - `MAIL_USERNAME`: Your Gmail.
  - `MAIL_PASSWORD`: Your Gmail App Password.
  - `AI_API_KEY`: Your Google Gemini API Key.
- Click **Deploy Web Service**.

## 🤖 AI Assistant (Google Gemini)
The system features an integrated AI Chatbot to help navigate and answer pharmaceutical queries.
1. Get a free API Key from [Google AI Studio](https://aistudio.google.com/).
2. Add the key to your `.env` or Environment Variables as `AI_API_KEY`.
3. The chatbot uses a secure backend proxy to protect your key from being exposed in the browser.

## 🛠️ Local Development

1. **Environment Variables**: 
   - Create a `.env` file in the `medi_sales/` directory.
   - Use `.env.example` from the root as a template.
   - **Crucial**: Never commit your `.env` file to Git. (It is already ignored by `.gitignore`).
2. **Database**: Ensure you have a PostgreSQL instance running locally.
3. **Build & Run**:
   ```bash
   mvn clean package
   ```
   Deploy the generated `target/medi_sales.war` to Tomcat 9 or use the provided `Dockerfile`.

## ✨ Key Features
- **AI Assistant**: Smart navigation and assistance.
- **Enterprise Billing**: Dynamic invoice generation with "Company - Contact" identification.
- **Stock Management**: Inventory tracking with real-time availability.
- **Modern UI**: Glassmorphism aesthetic for a premium experience.
