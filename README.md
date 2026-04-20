# Deknek - MERN Stack Authentication Application

A complete MERN (MongoDB, Express, React, Node.js) stack application with user authentication, database integration, and deployment-ready code.

## 🎯 Features

- ✅ User Registration & Login (with JWT authentication)
- ✅ Password Hashing with bcryptjs
- ✅ MongoDB Atlas Integration
- ✅ Protected Routes
- ✅ User Dashboard
- ✅ Profile Management
- ✅ User Listing
- ✅ Responsive UI
- ✅ Error Handling & Validation

## 📁 Project Structure

```
deknek/
├── Backend/
│   ├── server.js              # Express server entry point
│   ├── package.json           # Dependencies
│   ├── .env                   # Environment variables
│   ├── middleware/
│   │   └── auth.js           # JWT authentication middleware
│   ├── models/
│   │   └── User.js           # MongoDB User model
│   └── routes/
│       ├── auth.js           # Authentication routes (signup, login)
│       └── user.js           # User management routes
└── Frontend/
    ├── public/
    │   └── index.html
    ├── src/
    │   ├── services/
    │   │   └── api.js         # Axios API calls
    │   ├── context/
    │   │   └── AuthContext.js # Auth state management
    │   ├── components/
    │   │   └── ProtectedRoute.js
    │   ├── pages/
    │   │   ├── Home.js
    │   │   ├── Signup.js
    │   │   ├── Login.js
    │   │   ├── Dashboard.js
    │   │   └── Profile.js
    │   ├── styles/
    │   ├── App.js
    │   └── index.js
    └── package.json
```

## 🚀 Getting Started

### Prerequisites
- Node.js (v14+)
- npm or yarn
- MongoDB Atlas account

### Backend Setup

1. **Install dependencies**
   ```bash
   cd Backend
   npm install
   ```

2. **Configure environment variables** (`.env`)
   ```
   MONGO_URI=mongodb+srv://<REDACTED>@cluster0.hucssvr.mongodb.net/?appName=Cluster0
   JWT_SECRET=your_super_secret_jwt_key_change_this_in_production_12345
   PORT=5000
   NODE_ENV=development
   ```

3. **Start the backend server**
   ```bash
   npm run dev
   ```
   
   Server will run on `http://localhost:5000`

### Frontend Setup

1. **Install dependencies**
   ```bash
   cd Frontend
   npm install
   ```

2. **Configure environment variables** (`.env`)
   ```
   REACT_APP_API_BASE_URL=http://localhost:5000/api
   ```

3. **Start the development server**
   ```bash
   npm run dev
   ```
   
   Frontend will run on `http://localhost:3000`

## 🔐 API Endpoints

### Authentication
- `POST /api/auth/signup` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/verify` - Verify JWT token

### User Management
- `GET /api/user/me` - Get current user (protected)
- `PUT /api/user/update` - Update user profile (protected)
- `GET /api/user/all` - Get all users (protected)
- `DELETE /api/user/delete` - Delete account (protected)

## 📝 API Request/Response Examples

### Signup
**Request:**
```json
POST /api/auth/signup
{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com",
  "password": "secure123"
}
```

**Response:**
```json
{
  "message": "User registered successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com"
  }
}
```

### Login
**Request:**
```json
POST /api/auth/login
{
  "email": "john@example.com",
  "password": "secure123"
}
```

**Response:**
```json
{
  "message": "User logged in successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com"
  }
}
```

## 🛡️ Security Features

1. **Password Hashing** - bcryptjs with salt rounds
2. **JWT Authentication** - Secure token-based auth
3. **Protected Routes** - Frontend route protection
4. **Input Validation** - Express validator on backend
5. **CORS** - Cross-origin resource sharing enabled
6. **HTTP Headers** - Security best practices

## 💻 Frontend Pages

- **Home** - Landing page with features
- **Signup** - User registration form
- **Login** - User login form
- **Dashboard** - User profile and all users list
- **Profile** - Edit user profile

## 🧪 Testing the Application

1. **Create an account** - Go to `/signup`
2. **Login** - Go to `/login`
3. **View Dashboard** - Protected route, redirects to login if not authenticated
4. **Edit Profile** - Update user information
5. **View All Users** - See all registered users
6. **Logout** - Clear session and redirect to home

## 📦 Technologies Used

### Backend
- Express.js - Web framework
- MongoDB - Database
- Mongoose - ODM
- bcryptjs - Password hashing
- jsonwebtoken - JWT authentication
- Cors - Cross-origin support
- Dotenv - Environment variables

### Frontend
- React 18 - UI library
- React Router - Routing
- Axios - HTTP client
- React Toastify - Notifications
- CSS3 - Styling

## 🌐 Deployment

### Backend Deployment (Heroku/Render)

1. Create an account on [Render](https://render.com) or [Heroku](https://heroku.com)
2. Connect your GitHub repository
3. Set environment variables in dashboard
4. Deploy

### Frontend Deployment (Vercel/Netlify)

1. Create an account on [Vercel](https://vercel.com) or [Netlify](https://netlify.com)
2. Connect your GitHub repository
3. Set `REACT_APP_API_BASE_URL` to your deployed backend URL
4. Deploy

## 📚 Environment Variables

### Backend
| Variable | Description | Example |
|----------|-------------|---------|
| MONGO_URI | MongoDB connection string | mongodb+srv://... |
| JWT_SECRET | Secret key for JWT | your_secret_key |
| PORT | Server port | 5000 |
| NODE_ENV | Environment | development/production |

### Frontend
| Variable | Description | Example |
|----------|-------------|---------|
| REACT_APP_API_BASE_URL | Backend API URL | http://localhost:5000/api |

## ⚠️ Important Security Notes

1. **Change JWT_SECRET** in production
2. **Never commit .env files** to version control
3. **Use HTTPS** in production
4. **Validate input** on both frontend and backend
5. **Set strong passwords** requirements
6. **Regular dependency updates** - Run `npm audit`

## 🐛 Troubleshooting

### Backend won't connect to MongoDB
- Check MongoDB connection string in `.env`
- Ensure IP is whitelisted in MongoDB Atlas
- Verify network connectivity

### Frontend can't reach backend
- Check if backend is running on correct port
- Verify `REACT_APP_API_BASE_URL` in `.env`
- Check CORS settings in `server.js`

### Token not working
- Clear browser localStorage
- Check JWT_SECRET matches
- Ensure token format is `Bearer <token>`

## 📞 Support

For issues or questions:
1. Check environment variables
2. Review error messages in console
3. Check network tab in browser DevTools
4. Review backend logs in terminal

## 📄 License

ISC

---

**Built for Hackathon** 🚀
