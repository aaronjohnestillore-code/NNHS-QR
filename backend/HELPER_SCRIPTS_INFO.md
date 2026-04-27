# Backend Helper Scripts - For Development Only

These files are utility scripts for local development. They can be deleted before production deployment.

## Files (Development Use Only)

### ✅ Keep for Local Development
- `app.py` - Main Flask application
- `requirements.txt` - Python dependencies
- `Procfile` - Production deployment configuration
- `runtime.txt` - Python version specification

### ❌ Remove for Production (Optional)
The following are helper scripts for local development. Since the system now auto-initializes the database, these are no longer needed:

1. **init_database.py**
   - Purpose: Initialize database locally
   - Why remove: Backend now auto-creates tables on startup
   - Keep if: You want to manually reset development database

2. **add_classroom.py**
   - Purpose: Add classrooms one by one
   - Why remove: Use admin dashboard instead
   - Keep if: Batch importing classrooms locally

3. **quick_add_student.py**
   - Purpose: Quick student entry
   - Why remove: Use admin dashboard
   - Keep if: Batch importing students locally

4. **populate_classrooms.py**
   - Purpose: Populate with sample data
   - Why remove: Admin dashboard handles this
   - Keep if: Testing with specific data patterns

5. **view_classrooms.py**
   - Purpose: View classrooms in terminal
   - Why remove: Admin dashboard shows this
   - Keep if: Debugging database from terminal

6. **Procfile/** directory (the old folder)
   - This contains `main.tsx` which seems misplaced
   - Remove entirely - we have a new `Procfile` file at the root

## Migration Path

### Local Development (Keep Everything)
```
backend/
├── app.py
├── requirements.txt
├── init_database.py        ← Keep for testing
├── add_classroom.py        ← Keep for testing
├── quick_add_student.py    ← Keep for testing
├── populate_classrooms.py  ← Keep for testing
├── view_classrooms.py      ← Keep for testing
└── Procfile                ← Updated for production
```

### Production Deployment (Clean)
```
backend/
├── app.py
├── requirements.txt
├── Procfile                ← Production configuration
└── runtime.txt             ← Python version
```

## Usage

### Before Committing to GitHub
```bash
# Option 1: Delete helper scripts
cd backend
rm init_database.py add_classroom.py quick_add_student.py populate_classrooms.py view_classrooms.py
rm -rf Procfile/  # Remove old Procfile directory

# Option 2: Keep them but ignore in git
# Already in .gitignore under "# Local development only files"
```

### If You Need Them Later
You can download them from GitHub history or keep them locally (they're in .gitignore).

## Why Auto-Initialization is Better

✅ **Advantages:**
- Database tables auto-create on first run
- No manual database setup needed
- Works with cloud MySQL databases
- Consistent across dev and production
- Admin can add data through dashboard

❌ **No need for:**
- Running init scripts manually
- Batch import tools
- Database reset utilities
