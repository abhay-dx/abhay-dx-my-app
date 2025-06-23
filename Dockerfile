# -------- FRONTEND BUILD STAGE --------
    FROM node:18 AS frontend

    WORKDIR /app/frontend
    COPY frontend/package*.json ./
    RUN npm install
    COPY frontend/ ./
    RUN npm run build
    
    # -------- BACKEND STAGE --------
    FROM node:18
    
    WORKDIR /app
    
    # Copy backend code
    COPY backend/package*.json ./
    RUN npm install
    COPY backend/ ./
    
    # Copy frontend build output to backend's public folder
    COPY --from=frontend /app/frontend/build ./public
    
    EXPOSE 5000
    CMD ["node", "server.js"]
    