# NNHS QR Code-Based Student Attendance Monitoring System

**Version**: 5.0 - Production Ready  
**Last Updated**: April 27, 2026  
**Status**: ✅ Secure, Auto-Initialize, Cloud-Ready

A comprehensive web-based attendance tracking system for Nahawan National High School, featuring QR code scanning, real-time monitoring, admin registration, and multi-subject attendance tracking.

---

## 📚 Documentation

### Getting Started
- **[SETUP_GUIDE.txt](SETUP_GUIDE.txt)** - Quick local setup (for development)
- **[TESTING_CHECKLIST.md](TESTING_CHECKLIST.md)** - Pre-deployment verification

### Deployment & Hosting
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Cloud deployment options (Heroku, Railway, AWS RDS)
- **[GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md)** - GitHub & Vercel deployment step-by-step

### System Documentation  
- **[SYSTEM_GUIDE.md](SYSTEM_GUIDE.md)** - Complete feature documentation & user guide
- **[backend/HELPER_SCRIPTS_INFO.md](backend/HELPER_SCRIPTS_INFO.md)** - Development utilities

---

## ✨ What's New in v5.0

### Security Improvements
✅ Environment variables for all configuration  
✅ Removed hardcoded credentials  
✅ Rate limiting on authentication (10 attempts/min)  
✅ Security headers (CORS, CSP, X-Frame-Options)  
✅ Password hashing with bcrypt  
✅ Session cookie security configured

### Automatic Setup
✅ Database tables auto-create on first run  
✅ Default admin account auto-initialized  
✅ School classrooms auto-populated  
✅ No manual database scripts needed

### Production Ready
✅ Comprehensive environment configuration  
✅ Docker/Cloud-ready deployment configs  
✅ Logging and error handling  
✅ Health check endpoint (`/api/health`)  
✅ CORS properly configured for production

---

## 🚀 Quick Start

### Local Development (with MySQL)

```bash
# 1. Install dependencies
cd backend
pip install -r requirements.txt

cd ..
npm install

# 2. Start backend (creates tables automatically)
cd backend
python app.py
# Output: ✓ Database initialized, ✓ Tables created

# 3. Start frontend (in new terminal)
npm run dev

# 4. Open http://localhost:5173
```

**Default credentials (auto-created):**
- Admin: `admin` / `admin123`  
- Teacher: `teacher1` / `teacher123` (if needed)

### Environment Variables
Create a `.env` file in the project root:
```bash
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=
MYSQL_DB=nnhs_attendance
FLASK_ENV=development
FRONTEND_URL=http://localhost:5173
```

See `.env.example` for all available options.

---

## 🌐 Production Deployment

### Option 1: Vercel (Frontend) + Heroku (Backend)
**Best for:** Quick, easy hosting
- Frontend: Free on Vercel
- Backend: $7-12/month (Heroku Eco plan)
- Database: $10-20/month (AWS RDS or PlanetScale)

[Complete Guide →](GITHUB_DEPLOYMENT.md)

### Option 2: Railway.app (Recommended)
**Best for:** Simplicity
- One-click deployment from GitHub
- Includes database option
- ~$5-20/month depending on usage

[Railway Deployment](DEPLOYMENT.md#option-b-deploy-to-railwayapp-recommended)

### Option 3: Docker + Cloud Provider
**Best for:** Control and scaling
- Deploy anywhere (AWS, Google Cloud, Azure, etc.)
- Use Docker containers
- Full customization

[Deployment Guide →](DEPLOYMENT.md)

---

## 📋 Features

### Admin Dashboard
- ✅ Register admin accounts (first-time only, then locked)
- ✅ Manage teachers & classrooms
- ✅ Configure attendance rules
- ✅ View attendance reports
- ✅ Security Q&A for password recovery

### Teacher Dashboard
- ✅ QR code scanner (real-time)
- ✅ Manual student entry
- ✅ View class roster
- ✅ Record attendance by subject
- ✅ View attendance history

### Features
- ✅ QR code scanning (by student ID)
- ✅ Multi-classroom support
- ✅ Multi-subject tracking
- ✅ Real-time attendance updates
- ✅ Attendance reports
- ✅ Student/Guardian contact info
- ✅ Absence auto-marking

---

## 🔧 Configuration

### Backend (.env)
```env
# Database
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=
MYSQL_DB=nnhs_attendance

# Security
SECRET_KEY=your-generated-key
FLASK_ENV=development

# CORS
FRONTEND_URL=http://localhost:5173

# Server
FLASK_HOST=0.0.0.0
FLASK_PORT=5000
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:5000/api
```

For production, update these URLs to your actual domain.

---

## 📁 Project Structure

```
├── frontend/
│   ├── src/
│   │   ├── app/
│   │   │   ├── components/      # React components
│   │   │   ├── pages/           # Page components
│   │   │   ├── services/        # API service
│   │   │   └── data/            # Static data
│   │   └── main.tsx
│   └── package.json
│
├── backend/
│   ├── app.py                   # Flask app (UPDATED - production ready)
│   ├── requirements.txt         # Python dependencies
│   ├── Procfile                 # Production config
│   └── runtime.txt              # Python version
│
├── .env                         # Environment variables (auto-create)
├── .gitignore                   # Git ignore rules
└── documentation files
```

---

## 🔒 Security Features

- **Password Hashing**: bcrypt with salt
- **Environment Secrets**: Not in version control
- **CORS Protection**: Only allow frontend domain
- **Rate Limiting**: 10 login attempts/minute
- **Security Headers**: X-Frame-Options, CSP, etc.
- **Session Security**: HttpOnly, SameSite cookies
- **Input Validation**: All endpoints validate inputs
- **Database**: Auto-escapes queries (SQLAlchemy)

---

## 🧪 Testing

See [TESTING_CHECKLIST.md](TESTING_CHECKLIST.md) for:
- ✓ Backend tests
- ✓ Frontend tests  
- ✓ API endpoint tests
- ✓ Security verification
- ✓ Performance checks

Quick test:
```bash
# Check backend health
curl http://localhost:5000/api/health
```

---

## 🐛 Troubleshooting

### Database
- **"Connection refused"**: Check MySQL is running
- **"Database not created"**: Backend auto-creates on first request
- **"Tables missing"**: Wait for backend to start, then refresh frontend

### Frontend
- **"Can't connect to backend"**: Check VITE_API_URL, backend running
- **"CORS error"**: Update FRONTEND_URL in backend .env

### General
- Check [SETUP_GUIDE.txt](SETUP_GUIDE.txt) for common issues
- Review [DEPLOYMENT.md](DEPLOYMENT.md) troubleshooting section
- Check logs: `tail -f backend/app.log`

---

## 📞 Support

For detailed documentation:
- Local setup → [SETUP_GUIDE.txt](SETUP_GUIDE.txt)
- Production deployment → [GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md)
- Cloud deployment → [DEPLOYMENT.md](DEPLOYMENT.md)
- System features → [SYSTEM_GUIDE.md](SYSTEM_GUIDE.md)

---

## 📄 License

This project is created for Nahawan National High School.

---

## ✅ Deployment Checklist

Before pushing to production:
- [ ] All tests pass (see [TESTING_CHECKLIST.md](TESTING_CHECKLIST.md))
- [ ] `.env` file is in `.gitignore`
- [ ] Database credentials changed from defaults
- [ ] `SECRET_KEY` is strong and unique
- [ ] FRONTEND_URL updated to production domain
- [ ] Backups configured
- [ ] Monitoring set up

[Full deployment guide →](GITHUB_DEPLOYMENT.md)

**First-time setup**: When you deploy online, the system automatically prompts you to create an admin account (no database initialization needed!)

---

## ✨ New in Version 4.5

- ✅ **Admin Registration**: Secure first-time admin account creation for production
- ✅ **One Admin Limit**: System allows only 1 admin for security
- ✅ **No Database Scripts Needed**: Deploy and register admin directly from web interface
- ✅ **Security Question**: Built into registration for password recovery

---

## 🏗️ Tech Stack

- **Frontend**: React 18 + TypeScript, Vite, Tailwind CSS
- **Backend**: Flask (Python), SQLAlchemy, MySQL
- **Deployment**: Vercel (frontend), Railway (backend + database)

---

## 📞 Support

**Read the complete guide**: [SYSTEM_GUIDE.md](SYSTEM_GUIDE.md)

**Quick Links**:
- [Features](SYSTEM_GUIDE.md#features)
- [Admin Registration](SYSTEM_GUIDE.md#first-time-setup--admin-registration)
- [User Guide](SYSTEM_GUIDE.md#user-guide)
- [Deployment](SYSTEM_GUIDE.md#deployment-guide)
- [Troubleshooting](SYSTEM_GUIDE.md#troubleshooting)

---

**Status**: ✅ Production Ready  
🎓 Developed for Nahawan National High School
