# Dockerfile

# Stage 1: Build the Node.js frontend
FROM node:14 AS frontend-build
WORKDIR /app
COPY frontend/package.json frontend/package-lock.json ./
RUN npm install
COPY frontend/ .
RUN npm run build

# Stage 2: Build the Python Flask backend
FROM python:3.9 AS backend-build
WORKDIR /app
COPY backend/requirements.txt ./
RUN pip install -r requirements.txt
COPY backend/ .

# Stage 3: Final image
FROM python:3.9
WORKDIR /app

# Copy frontend build files
COPY --from=frontend-build /app/build ./frontend

# Copy backend files
COPY --from=backend-build /app .

# Set environment variables for Railway deployment
ENV FLASK_ENV=production
EXPOSE 5000
CMD ["python", "app.py"]
