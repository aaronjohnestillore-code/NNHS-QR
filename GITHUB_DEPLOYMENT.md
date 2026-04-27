# GitHub & Vercel Deployment Instructions

## Prerequisites

1. **GitHub Account**: https://github.com/signup
2. **Vercel Account**: https://vercel.com/signup
3. **Git installed**: https://git-scm.com/
4. **GitHub CLI** (optional): https://cli.github.com/

## Step 1: Initialize Git Repository

```bash
cd "c:\Users\User\Downloads\NNHS QRCBSAMS (ffffffffffffinal)"

# Initialize git
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: NNHS Attendance System with security improvements"
```

## Step 2: Create GitHub Repository

### Option A: Using GitHub Web Interface
1. Go to https://github.com/new
2. Repository name: `nnhs-attendance-system` (or your preference)
3. Description: "QR Code-Based Attendance Management System for NNHS"
4. Choose: Public or Private
5. **IMPORTANT**: Do NOT initialize with README (we already have one)
6. Click "Create repository"

### Option B: Using GitHub CLI
```bash
gh repo create nnhs-attendance-system --public --source=. --remote=origin --push
```

## Step 3: Add Remote and Push to GitHub

```bash
# Add remote (replace USERNAME and REPO_NAME)
git remote add origin https://github.com/USERNAME/nnhs-attendance-system.git

# Rename branch to main if needed
git branch -M main

# Push code
git push -u origin main
```

## Step 4: Create GitHub Secrets for Deployment

1. Go to your repository on GitHub
2. Settings → Secrets and variables → Actions
3. Add these secrets:
   - `DATABASE_URL`: mysql+pymysql://user:password@host/dbname
   - `SECRET_KEY`: Your generated secret key
   - `FRONTEND_URL`: Your Vercel frontend URL (after deployment)

## Step 5: Deploy Backend to Heroku

### Prerequisites
- Heroku account: https://heroku.com/

### Steps
```bash
# Install Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli

# Login
heroku login

# Create app
heroku create nnhs-attendance-backend

# Configure buildpack
heroku buildpacks:set heroku/python

# Set environment variables
heroku config:set FLASK_ENV=production
heroku config:set MYSQL_HOST=your-db-host
heroku config:set MYSQL_USER=your-db-user
heroku config:set MYSQL_PASSWORD=your-db-pass
heroku config:set MYSQL_DB=nnhs_attendance
heroku config:set SECRET_KEY=your-generated-secret-key
heroku config:set FRONTEND_URL=https://your-vercel-domain.vercel.app

# Deploy from GitHub
heroku git:remote -a nnhs-attendance-backend
git push heroku main

# View logs
heroku logs --tail
```

### Get Backend URL
```bash
heroku apps:info nnhs-attendance-backend
# Backend URL: https://nnhs-attendance-backend.herokuapp.com
```

## Step 6: Deploy Frontend to Vercel

### Steps
1. Go to https://vercel.com/new
2. Import Git repository:
   - Select your GitHub repository
   - Click "Import"
3. Configure project:
   - Framework: Vite
   - Build command: `npm run build`
   - Output directory: `dist`
   - Root directory: `.` (current)
4. Environment variables:
   - Add `VITE_API_URL`: https://your-backend-url.herokuapp.com/api
5. Click "Deploy"

### Get Frontend URL
After deployment, you'll get a URL like:
- https://nnhs-attendance-system.vercel.app

## Step 7: Update Backend with Frontend URL

After Vercel deployment, update backend environment:
```bash
heroku config:set FRONTEND_URL=https://nnhs-attendance-system.vercel.app
```

## Step 8: Verify Deployment

### Test Backend
```bash
curl https://nnhs-attendance-backend.herokuapp.com/api/health
```

Expected response:
```json
{
  "status": "healthy",
  "environment": "production",
  "database": "connected"
}
```

### Test Frontend
1. Open https://nnhs-attendance-system.vercel.app
2. Login with credentials:
   - Username: admin
   - Password: admin123
3. Check admin dashboard
4. Test QR code scanner

## Step 9: Set Up Continuous Deployment

### Vercel (Frontend)
- Automatically deploys on push to main branch
- Check Deployments tab for status

### Heroku (Backend)
- Option 1: Automatic (connect GitHub)
  - Go to Deploy tab → Connect to GitHub
  - Enable "Automatic deploys" on main branch
- Option 2: Manual
  - `git push heroku main`

## Step 10: Database Setup

### Recommended: AWS RDS or PlanetScale

#### For AWS RDS
1. Create MySQL instance
2. Note endpoint, username, password
3. Create database: `nnhs_attendance`
4. Allow inbound traffic on port 3306

#### For PlanetScale
1. Create MySQL database
2. Get connection string
3. Set as DATABASE_URL

## Important Security Notes

✅ **What's included:**
- `.env` file is in `.gitignore` (won't be committed)
- Environment variables required for production
- Rate limiting on login (10 attempts/min)
- Password hashing with bcrypt
- CORS security headers
- Auto database initialization

⚠️ **Before going live:**
1. Change default admin password
2. Set strong SECRET_KEY
3. Use strong database password
4. Enable HTTPS (automatic with Vercel/Heroku)
5. Monitor logs regularly
6. Set up backups for database

## Troubleshooting

### "Database connection failed" on Vercel
- Check MYSQL_HOST is publicly accessible
- Verify firewall rules allow connection
- Test with MySQL Workbench or command line

### "CORS error" in browser
- Check FRONTEND_URL matches deployment URL
- Check backend CORS configuration
- Clear browser cache

### "Tables not found" after deployment
- Backend auto-creates tables on first request
- Check `/api/health` endpoint
- Review Heroku logs: `heroku logs --tail`

### "Module not found" error
- Check requirements.txt is in backend folder
- Heroku auto-detects it for Python apps

## Monitoring and Maintenance

### View Logs
```bash
# Heroku backend
heroku logs --tail

# Vercel frontend
# Check in Vercel dashboard → Deployments → Runtime Logs
```

### Update Code
```bash
# Make changes locally
git add .
git commit -m "Description of changes"
git push origin main

# Automatic deployment happens on both Vercel and Heroku
```

### Emergency: Rollback
```bash
# Heroku
heroku releases
heroku rollback v123  # replace with version number

# Vercel
# Click "Promote to Production" on previous deployment
```

## Cost Considerations

- **Heroku**: $7-12/month (paid tier needed after free tier ends)
- **Vercel**: Free for frontend, custom domain
- **Database**: AWS RDS ~$10-20/month or free tier
- **Total**: ~$30-40/month for production setup

## Additional Resources

- Vercel Docs: https://vercel.com/docs
- Heroku Docs: https://devcenter.heroku.com/
- Flask Deployment: https://flask.palletsprojects.com/en/2.3.x/deploying/
- MySQL Cloud Options: https://www.mysql.com/why-mysql/
