# 🚀 MERN Stack App with Docker 🐳  

This is a **fully Dockerized MERN (MongoDB, Express, React, Node.js) application**, designed for easy deployment and scalability. The project uses **Docker Compose** to orchestrate the frontend, backend, and database efficiently.  

---

## 📌 Table of Contents  
- [🚀 Features](#-features)  
- [🛠 Tech Stack](#-tech-stack)  
- [👆 Prerequisites](#-prerequisites)  
- [⚙️ Installation & Setup](#%EF%B8%8F-installation--setup)  
- [📌 Project Structure](#-project-structure)  
- [🔄 Running the Application](#-running-the-application)  
- [🦾 Troubleshooting](#-troubleshooting)  
- [📸 Screenshots](#-screenshots)  
- [📝 License](#-license)  

---

## 🚀 Features  
✅ **Fully containerized** with **Docker & Docker Compose**  
✅ **Frontend** built with React and served using **Nginx**  
✅ **Backend** powered by Node.js & Express for REST APIs  
✅ **Database** handled by MongoDB inside a **Docker network**  
✅ **Multi-stage Docker builds** for optimized deployment  
✅ **Easily scalable & portable**  

---

## 🛠 Tech Stack  
- **Frontend:** React, Nginx  
- **Backend:** Node.js, Express  
- **Database:** MongoDB  
- **Containerization:** Docker, Docker Compose  
- **Orchestration:** Docker Compose  

---

## 👆 Prerequisites  
Before running the project, ensure you have the following installed:  

1️⃣ **Docker** – [Download & Install](https://docs.docker.com/get-docker/)  
2️⃣ **Docker Compose** – [Install Guide](https://docs.docker.com/compose/install/)  
3️⃣ **Git** – [Download & Install](https://git-scm.com/downloads)  

---

## ⚙️ Installation & Setup  

### **1️⃣ Clone the Repository**  
```bash
git clone https://github.com/your-username/mern-docker.git
cd mern-docker
```

### **2️⃣ Install Dependencies (For Local Development Without Docker)**  
If you want to run the frontend and backend locally (without Docker), install dependencies manually:  

**Install Backend Dependencies:**  
```bash
cd backend
npm install
```
**Install Frontend Dependencies:**  
```bash
cd ../frontend
npm install
```

### **3️⃣ Build & Run with Docker Compose**  
```bash
docker-compose up --build
```

### **4️⃣ Access the Application**  
- 🌐 **Frontend (React App via Nginx):**  
  - http://localhost:8000  
- ⚙️ **Backend API (Node.js + Express):**  
  - http://localhost:5000/api  
- 📞 **MongoDB (Accessible within Docker network):**  
  - `mongodb://mongo:27017`  

---

## 📌 Project Structure  
```
mern-docker/
│── backend/            # Express Backend
│   ├── server.js       # Main Server File
│   ├── package.json    # Dependencies
│── frontend/           # React Frontend
│   ├── src/            # React Components
│   ├── public/         # Static Files
│── docker-compose.yml  # Docker Configuration
│── Dockerfile          # Multi-Stage Dockerfile
│── README.md           # Project Documentation
```

---

## 🔄 Running the Application  
To stop the application:  
```bash
docker-compose down
```

To remove all containers and volumes:  
```bash
docker-compose down -v
```

To rebuild and restart the application:  
```bash
docker-compose up --build
```

---

## 🦾 Troubleshooting  

### **1️⃣ MongoDB Connection Issue**  
If you see an error like:  
> "It looks like you are trying to access MongoDB over HTTP on the native driver port."  

Fix: Ensure MongoDB is running inside Docker:  
```bash
docker ps
```
If MongoDB is missing, restart the containers:  
```bash
docker-compose down && docker-compose up --build
```

### **2️⃣ Port Conflicts**  
If ports `5000` or `8000` are already in use, change them in **docker-compose.yml**:  
```yaml
ports:
  - "NEW_PORT:5000"  # For backend
  - "NEW_PORT:8000"  # For frontend
```
Then restart the containers.

### **3️⃣ View Docker Logs**  
If the app isn't working, check logs for errors:  
```bash
docker-compose logs -f
```


## 📝 License  
This project is licensed under the **MIT License**.  

---

💡 **Have feedback or suggestions?** Drop a comment or contribute! Let’s build something amazing together! 🚀  

#MERN #Docker #DevOps #Containerization #React #NodeJS #MongoDB #SoftwareEngineering  

