# 📚 Complete Deknek MERN Documentation

## 📖 Table of Contents

1. [Overview](#overview)
2. [Quick Start](#quick-start)
3. [Project Structure](#project-structure)
4. [Features](#features)
5. [File Descriptions](#file-descriptions)
6. [Setup Instructions](#setup-instructions)
7. [Running Locally](#running-locally)
8. [API Reference](#api-reference)
9. [Deployment](#deployment)
10. [Troubleshooting](#troubleshooting)

---

## 🎯 Overview

**Deknek** is a full-stack MERN (MongoDB, Express, React, Node.js) application designed for user authentication and management. Perfect for hackathons!

### What You Get:
- ✅ Complete user authentication system
- ✅ JWT-based security
- ✅ MongoDB integration
- ✅ Beautiful React frontend
- ✅ Protected routes
- ✅ User dashboard
- ✅ Profile management
- ✅ Production-ready code
- ✅ Deployment guides

---

## 🚀 Quick Start

### For Windows:
```bash
setup.bat
```

### For Mac/Linux:
```bash
chmod +x setup.sh
./setup.sh
```

### Manual Setup:
```bash
# Terminal 1 - Backend
cd Backend
npm install
npm run dev

# Terminal 2 - Frontend
cd Frontend
npm install
npm run dev

# Then open: http://localhost:3000
```

---

## 📁 Project Structure

```
deknek/
├── Backend/
│   ├── models/
│   │   └── User.js              # MongoDB User schema
│   ├── routes/
│   │   ├── auth.js              # Auth routes (login/signup)
│   │   └── user.js              # User management routes
│   ├── middleware/
│   │   └── auth.js              # JWT verification
│   ├── server.js                # Express server
│   ├── package.json
│   └── .env                     # Environment variables
│
├── Frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── services/
│   │   │   └── api.js           # Axios API calls
│   │   ├── context/
│   │   │   └── AuthContext.js   # Global auth state
│   │   ├── components/
│   │   │   └── ProtectedRoute.js
│   │   ├── pages/
│   │   │   ├── Home.js
│   │   │   ├── Signup.js
│   │   │   ├── Login.js
│   │   │   ├── Dashboard.js
│   │   │   └── Profile.js
│   │   ├── styles/              # CSS files
│   │   ├── App.js
│   │   └── index.js
│   ├── package.json
│   └── .env
│
├── Documentation Files
│   ├── README.md                # Main documentation
│   ├── QUICKSTART.md            # 5-minute setup
│   ├── DEPLOYMENT.md            # Deployment guide
│   ├── ENV_GUIDE.md             # Environment setup
│   ├── API_TESTING.md           # API test examples
│   └── DOCS.md                  # This file
│
├── Setup Scripts
│   ├── setup.sh                 # Linux/Mac setup
│   └── setup.bat                # Windows setup
│
└── Config Files
    ├── .gitignore               # Git ignore rules
    └── Various config files
```

---

## ✨ Features

### Authentication
- User registration with validation
- Secure login with JWT
- Password hashing with bcryptjs
- Token verification
- Auto-logout on token expiration

### User Management
- User profiles with bio and phone
- View all users
- Edit profile information
- Delete account
- User listing

### Security
- JWT token-based authentication
- Password hashing
- Protected routes
- CORS enabled
- Input validation
- Error handling

### Frontend
- Responsive design
- React Router for navigation
- Context API for state management
- Axios for API calls
- Toast notifications
- Loading states

### Database
- MongoDB Atlas integration
- Mongoose ODM
- Automatic schema validation
- Timestamps on records

---

## 📄 File Descriptions

### Backend Files

#### `server.js`
- Main Express server
- MongoDB connection
- Middleware setup
- Route mounting

#### `models/User.js`
- MongoDB schema for users
- Password hashing on save
- Password comparison method
- Email validation

#### `middleware/auth.js`
- JWT token verification
- Request authentication
- Token parsing from headers

#### `routes/auth.js`
- POST `/signup` - Register user
- POST `/login` - Login user
- POST `/verify` - Verify token

#### `routes/user.js`
- GET `/me` - Get current user
- PUT `/update` - Update profile
- GET `/all` - Get all users
- DELETE `/delete` - Delete account

### Frontend Files

#### `context/AuthContext.js`
- Global authentication state
- useAuth hook
- Login/signup/logout functions
- Token persistence

#### `services/api.js`
- Axios instance
- API endpoints
- Automatic token injection
- Request/response interceptors

#### `pages/Home.js`
- Landing page
- Features showcase
- Call-to-action buttons

#### `pages/Signup.js`
- Registration form
- Form validation
- Password confirmation
- Error handling

#### `pages/Login.js`
- Login form
- Email/password input
- Error messages
- Loading states

#### `pages/Dashboard.js`
- User profile display
- All users listing
- Logout button
- Delete account option

#### `pages/Profile.js`
- Edit user information
- Bio and phone fields
- Form submission
- Validation

#### `components/ProtectedRoute.js`
- Route protection
- Authentication check
- Redirect to login

---

## 🛠️ Setup Instructions

### Prerequisites
- Node.js (v14+) - [Download](https://nodejs.org)
- npm (comes with Node.js)
- MongoDB Atlas account - [Create Free](https://www.mongodb.com/atlas)
- Git (optional) - [Download](https://git-scm.com)

### Step 1: Create MongoDB Cluster

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up or login
3. Create a free cluster
4. Create a database user
5. Copy connection string
6. Update `Backend/.env` with your connection string

### Step 2: Install Dependencies

**Option A: Automated**
```bash
# Windows
setup.bat

# Mac/Linux
./setup.sh
```

**Option B: Manual**
```bash
# Backend
cd Backend
npm install

# Frontend
cd ../Frontend
npm install
```

### Step 3: Configure Environment

**Backend/.env**
```
MONGO_URI=your_mongodb_connection_string
JWT_SECRET=your_secret_key
PORT=5000
NODE_ENV=development
```

**Frontend/.env**
```
REACT_APP_API_BASE_URL=http://localhost:5000/api
```

### Step 4: Start Servers

**Terminal 1 - Backend**
```bash
cd Backend
npm run dev
```

**Terminal 2 - Frontend**
```bash
cd Frontend
npm run dev
```

### Step 5: Access Application

Open browser and go to: `http://localhost:3000`

---

## 🏃 Running Locally

### Development Mode

```bash
# Backend (with auto-reload)
cd Backend
npm run dev

# Frontend (with hot reload)
cd Frontend
npm run dev
```

### Production Build

```bash
# Backend
cd Backend
npm start

# Frontend
cd Frontend
npm run build
npm start
```

### Health Check

```bash
# Test backend
curl http://localhost:5000/api/health

# Output: { "status": "Backend is running! ✅" }
```

---

## 📡 API Reference

### Base URL
```
http://localhost:5000/api
```

### Authentication Endpoints

#### Signup
```
POST /auth/signup
{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

#### Login
```
POST /auth/login
{
  "email": "john@example.com",
  "password": "password123"
}
```

#### Verify Token
```
POST /auth/verify
Headers: Authorization: Bearer <token>
```

### User Endpoints (All require Bearer token)

#### Get Current User
```
GET /user/me
```

#### Update Profile
```
PUT /user/update
{
  "firstName": "John",
  "lastName": "Doe",
  "bio": "Developer",
  "phone": "1234567890"
}
```

#### Get All Users
```
GET /user/all
```

#### Delete Account
```
DELETE /user/delete
```

See `API_TESTING.md` for detailed examples.

---

## 🌐 Deployment

### Deploy Backend

**Option 1: Render**
1. Go to render.com
2. Connect GitHub
3. Create new web service
4. Deploy

**Option 2: Heroku**
```bash
heroku login
heroku create app-name
git push heroku main
```

**Option 3: Any Node.js host**
- DigitalOcean
- AWS
- HostingProvider

### Deploy Frontend

**Option 1: Vercel**
1. Go to vercel.com
2. Connect GitHub
3. Deploy

**Option 2: Netlify**
1. Go to netlify.com
2. Connect GitHub
3. Deploy

See `DEPLOYMENT.md` for step-by-step guides.

---

## 🐛 Troubleshooting

### Backend Issues

**Port already in use**
```bash
# Kill process on port 5000
# Windows: netstat -ano | findstr :5000
# Mac/Linux: lsof -i :5000
```

**MongoDB connection error**
- Check connection string in .env
- Ensure IP is whitelisted in MongoDB
- Test connection URL directly

**Token errors**
- Clear browser localStorage
- Restart backend server
- Check JWT_SECRET

### Frontend Issues

**Can't reach backend**
- Verify backend is running
- Check REACT_APP_API_BASE_URL
- Check browser console for errors

**Login not working**
- Check network tab (DevTools)
- Verify backend API response
- Clear localStorage
- Check user exists in database

**Styling issues**
- Clear browser cache (Ctrl+Shift+Delete)
- Refresh page
- Check CSS files are imported

### Database Issues

**MongoDB Atlas connection**
1. Check connection string
2. Verify database credentials
3. Whitelist your IP
4. Check network status

---

## 📚 Resources

### Documentation Files
- `README.md` - Complete documentation
- `QUICKSTART.md` - 5-minute setup
- `DEPLOYMENT.md` - Deployment guide
- `ENV_GUIDE.md` - Environment setup
- `API_TESTING.md` - API examples
- `DOCS.md` - This file

### External Resources
- [Express.js Docs](https://expressjs.com)
- [MongoDB Atlas](https://www.mongodb.com/atlas)
- [React Docs](https://react.dev)
- [Mongoose Docs](https://mongoosejs.com)
- [JWT.io](https://jwt.io)

### Tools
- [Postman](https://www.postman.com) - API testing
- [MongoDB Compass](https://www.mongodb.com/products/compass) - Database GUI
- [VS Code](https://code.visualstudio.com) - Code editor

---

## 🎓 Learning Path

1. **Understand the Flow**
   - User clicks Signup
   - Form data sent to backend
   - Backend validates and saves to DB
   - JWT token returned
   - Token stored in localStorage
   - User redirected to dashboard

2. **Explore the Code**
   - Start with `Frontend/src/App.js`
   - Check `Backend/server.js`
   - Review authentication flow
   - Understand routing

3. **Modify and Extend**
   - Add new fields to User model
   - Create new routes
   - Add new pages
   - Customize styling

4. **Deploy**
   - Follow DEPLOYMENT.md
   - Set environment variables
   - Test on production
   - Monitor performance

---

## ✅ Deployment Checklist

- [ ] Backend deployed and working
- [ ] Frontend deployed and accessible
- [ ] Environment variables set correctly
- [ ] MongoDB connection verified
- [ ] JWT_SECRET changed
- [ ] HTTPS enabled
- [ ] CORS configured correctly
- [ ] No sensitive data in code
- [ ] Error handling working
- [ ] Logging configured
- [ ] Database backups enabled
- [ ] Performance optimized

---

## 🎉 You're Ready!

You now have a complete, production-ready MERN stack application with:
- ✅ Real authentication
- ✅ Database integration
- ✅ Beautiful UI
- ✅ Proper backend system
- ✅ Deployment guides

**Next Steps:**
1. Start the servers
2. Create an account
3. Explore the app
4. Customize for your needs
5. Deploy to production
6. Share with the world! 🚀

---

## 📞 Support

For issues or questions:
1. Check this documentation
2. Review code comments
3. Check browser console
4. Check terminal logs
5. Use API_TESTING.md for verification

---

**Happy Coding! 🎉**

Built with ❤️ for Hackathons
