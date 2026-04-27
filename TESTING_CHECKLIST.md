# Pre-Deployment Testing Checklist

## Backend Testing

### ✅ Code Quality
- [x] No Python syntax errors
- [x] All required imports available
- [x] Environment variables properly configured
- [x] Database auto-initialization implemented
- [x] Security improvements added (rate limiting, headers, etc.)

### Environment Setup
```bash
# Test that packages are installed
cd backend
python -c "from flask import Flask; from flask_limiter import Limiter; print('✓ All imports working')"

# Test .env loading
python -c "from dotenv import load_dotenv; import os; load_dotenv(); print(f'✓ Environment: {os.getenv(\"FLASK_ENV\", \"not set\")}')"
```

### Database Tests
- [ ] MySQL/Database running and accessible
- [ ] Database credentials correct
- [ ] Database auto-creates tables on first run
- [ ] Admin account auto-created
- [ ] Sample classrooms auto-created

### API Endpoint Tests
```bash
# Health check
curl http://localhost:5000/api/health

# Check admin exists
curl http://localhost:5000/api/admin/exists

# Login test (will fail without running server)
curl -X POST http://localhost:5000/api/login \
  -H "Content-Type: application/json" \
  -d '{"userType":"admin","username":"admin","password":"admin123"}'
```

### Frontend Testing

### Build Test
```bash
npm install
npm run build
```

### Development Test
```bash
npm run dev
# Check http://localhost:5173 loads correctly
```

### Login Flow
- [ ] Admin can login with credentials
- [ ] Teacher can login (if created)
- [ ] Invalid credentials show error
- [ ] Session persists after login

### Features Test
- [ ] Dashboard loads correctly
- [ ] QR Scanner page loads
- [ ] Can scan/enter student ID
- [ ] Attendance records show
- [ ] Admin settings accessible

## Security Checklist

- [x] Environment variables configured
- [x] .env file in .gitignore
- [x] Database credentials not in code
- [x] Password hashing with bcrypt
- [x] Rate limiting on login
- [x] CORS properly configured
- [x] Security headers added
- [x] No hardcoded secrets

## File Organization

- [x] .env and .gitignore created
- [x] Deployment configs created (Procfile, runtime.txt, vercel.json)
- [x] Documentation created (DEPLOYMENT.md, GITHUB_DEPLOYMENT.md)
- [x] Database auto-initialization implemented

## Git Preparation

- [ ] All files staged in git
- [ ] No sensitive files in .gitignore violations
- [ ] Commit message is clear and descriptive
- [ ] .env is NOT committed
- [ ] node_modules is NOT committed
- [ ] __pycache__ is NOT committed

## Pre-Push Checks

```bash
# Check git status
git status

# Verify .env is not included
git check-ignore .env

# Verify node_modules is not included  
git check-ignore node_modules/

# Verify __pycache__ is not included
git check-ignore __pycache__/
```

## Deployment Preparation

### Before Pushing to GitHub
1. [ ] Run all tests locally
2. [ ] Verify .env is in .gitignore
3. [ ] Commit all changes
4. [ ] Create GitHub repository
5. [ ] Add deployment secrets

### Before Deploying to Production
1. [ ] Set up cloud database (AWS RDS, PlanetScale, etc.)
2. [ ] Create strong SECRET_KEY
3. [ ] Update FRONTEND_URL environment variable
4. [ ] Set FLASK_ENV=production
5. [ ] Disable debug mode
6. [ ] Configure CORS for production domain
7. [ ] Set up database backups
8. [ ] Enable HTTPS on all endpoints

## Post-Deployment Tests

### Health Check
```bash
curl https://your-backend.herokuapp.com/api/health
```

### API Tests
```bash
# Admin login
curl -X POST https://your-backend.herokuapp.com/api/login \
  -H "Content-Type: application/json" \
  -d '{"userType":"admin","username":"admin","password":"admin123"}'

# Get classrooms
curl https://your-backend.herokuapp.com/api/classrooms
```

### Frontend Verification
1. [ ] Frontend loads on Vercel
2. [ ] Can login to backend from frontend
3. [ ] API calls working (check Network tab in DevTools)
4. [ ] No CORS errors
5. [ ] QR scanner functions
6. [ ] Data displays correctly

## Performance Checks

- [ ] Backend responds in <500ms
- [ ] Frontend loads in <3 seconds
- [ ] Database queries efficient
- [ ] No console errors in browser
- [ ] No server-side errors in logs

## Security Verification

- [ ] HTTPS enabled on frontend
- [ ] HTTPS enforced on backend
- [ ] Cookies marked as secure
- [ ] CSRF protection active
- [ ] Rate limiting working
- [ ] Security headers present

## Backup and Recovery

- [ ] Database backup configured
- [ ] Can rollback deployment if needed
- [ ] Error logs accessible
- [ ] Monitoring/alerts set up

## Sign-Off

- [ ] All tests passed
- [ ] Code reviewed
- [ ] Documentation complete
- [ ] Ready for production

---

## Quick Start Commands

```bash
# 1. Install dependencies
cd backend
pip install -r requirements.txt

cd ..
npm install

# 2. Run backend (in one terminal)
cd backend
python app.py

# 3. Run frontend (in another terminal)
npm run dev

# 4. Test health endpoint
curl http://localhost:5000/api/health

# 5. Open frontend
# http://localhost:5173

# 6. Login
# Username: admin
# Password: admin123
```

## Troubleshooting Test Failures

### Backend won't start
- [ ] Check MySQL is running
- [ ] Verify database credentials in .env
- [ ] Check .env file exists
- [ ] Try: `pip install -r requirements.txt --force-reinstall`

### Frontend won't start
- [ ] Check Node.js version (need 16+)
- [ ] Try: `npm install`
- [ ] Try: `npm cache clean --force`
- [ ] Check package.json exists

### Database connection errors
- [ ] Verify MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD
- [ ] Check MySQL service is running
- [ ] Test with MySQL CLI: `mysql -u root -h localhost`

### CORS errors
- [ ] Check FRONTEND_URL in backend
- [ ] Verify frontend URL matches exactly
- [ ] Clear browser cache

### Can't login
- [ ] Check backend is running
- [ ] Check database has admin user
- [ ] Review backend logs
- [ ] Test with curl (above)
