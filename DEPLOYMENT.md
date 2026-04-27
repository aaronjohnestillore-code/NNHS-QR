# PRODUCTION DEPLOYMENT GUIDE

## Prerequisites
- GitHub account and repository
- Vercel account (free tier available)
- MySQL database (cloud service like AWS RDS, Azure Database, or ClearDB)
- GitHub CLI or Git

## Step 1: Prepare Environment Variables

Before deploying, ensure you have set these environment variables:

### Backend (.env file - DO NOT COMMIT)
```
FLASK_ENV=production
MYSQL_HOST=your-database-host
MYSQL_USER=your-database-user
MYSQL_PASSWORD=your-database-password
MYSQL_DB=your-database-name
MYSQL_PORT=3306
SECRET_KEY=<generate-unique-key>
FRONTEND_URL=https://your-frontend-domain.com
FLASK_HOST=0.0.0.0
FLASK_PORT=5000
FLASK_DEBUG=False
```

### Generate SECRET_KEY
```bash
python -c "import secrets; print(secrets.token_hex(32))"
```

## Step 2: Backend Deployment (Heroku or Railway)

### Option A: Deploy to Heroku
```bash
# Install Heroku CLI
# Login
heroku login

# Create app
heroku create your-app-name

# Set environment variables
heroku config:set FLASK_ENV=production
heroku config:set MYSQL_HOST=your-db-host
heroku config:set MYSQL_USER=your-db-user
heroku config:set MYSQL_PASSWORD=your-db-password
heroku config:set MYSQL_DB=your-db-name
heroku config:set SECRET_KEY=<your-secret-key>
heroku config:set FRONTEND_URL=https://your-frontend.vercel.app

# Deploy
git push heroku main

# View logs
heroku logs --tail
```

### Option B: Deploy to Railway.app (Recommended)
1. Connect GitHub repository to Railway
2. Select `backend` directory as root
3. Set environment variables in Railway dashboard
4. Railway will auto-detect Procfile and deploy

## Step 3: Frontend Deployment (Vercel)

### Deploy with Vercel CLI
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel

# Follow prompts and set:
# - Build command: npm run build
# - Output directory: dist
```

### Deploy with GitHub Integration
1. Push code to GitHub
2. Go to vercel.com and connect repository
3. Set build settings:
   - Build Command: `npm run build`
   - Output Directory: `dist`
   - Root Directory: `.` (or leave blank)
4. Set environment variable:
   - VITE_API_URL=https://your-backend-api.com

## Step 4: Database Setup

### Cloud Database Options
- **AWS RDS**: https://aws.amazon.com/rds/
- **Azure Database for MySQL**: https://azure.microsoft.com/en-us/services/mysql/
- **ClearDB**: https://www.cleardb.com/
- **PlanetScale**: https://planetscale.com/

### After Database is Created
1. Note the host, username, password
2. Create database: `nnhs_attendance`
3. The backend will auto-create tables on first run

## Step 5: Verify Deployment

1. **Health Check**
   ```
   curl https://your-backend-api.com/api/health
   ```

2. **Database Check**
   - Admin should exist with username: `admin`, password: `admin123`
   - Classrooms should be auto-created (28 total)

3. **Frontend Check**
   - Open https://your-frontend.vercel.app
   - Test login with admin credentials
   - Try scanning a QR code

## Security Checklist

- [ ] `.env` file is in `.gitignore`
- [ ] `SECRET_KEY` is unique and strong (32+ characters)
- [ ] `MYSQL_PASSWORD` is strong and secure
- [ ] HTTPS is enabled on both frontend and backend
- [ ] CORS is configured for correct domains
- [ ] No hardcoded credentials in code
- [ ] Database backups are configured
- [ ] Logs are monitored

## Environment-Specific Settings

### Development
- FLASK_ENV=development
- FLASK_DEBUG=True
- Use local MySQL
- Allow all CORS origins (localhost:5173)

### Production
- FLASK_ENV=production
- FLASK_DEBUG=False
- Use cloud MySQL database
- Restrict CORS to your domain
- Use strong SECRET_KEY

## Troubleshooting

### "Database connection failed"
- Verify database host, user, password
- Check firewall rules allow access
- Test connection with MySQL client

### "CORS error"
- Verify FRONTEND_URL matches your domain
- Check headers in browser console

### "Tables not created"
- Backend will auto-create on startup
- Check /api/health endpoint
- Review server logs

## Post-Deployment

1. Change default admin password immediately
2. Configure security questions
3. Add real teachers and classrooms
4. Set up database backups
5. Monitor application logs
6. Set up alerts/monitoring

## Support

For issues, check:
1. Application logs (Heroku/Railway dashboard)
2. Database connection
3. Environment variables
4. Firewall/network rules
