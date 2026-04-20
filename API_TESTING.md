# API Testing Guide

Test all endpoints using these examples with cURL, Postman, or Axios.

## Base URL
```
http://localhost:5000/api
```

---

## 🔐 Authentication Endpoints

### 1. Signup (Create Account)
```bash
POST /auth/signup
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

**Response (201):**
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

---

### 2. Login
```bash
POST /auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "password123"
}
```

**Response (200):**
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

---

### 3. Verify Token
```bash
POST /auth/verify
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response (200):**
```json
{
  "message": "Token is valid",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com"
  }
}
```

---

## 👤 User Management Endpoints

### 4. Get Current User Profile
```bash
GET /user/me
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response (200):**
```json
{
  "_id": "507f1f77bcf86cd799439011",
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com",
  "profile": {
    "bio": "Software developer",
    "avatar": "url",
    "phone": "1234567890"
  },
  "createdAt": "2023-01-01T00:00:00.000Z"
}
```

---

### 5. Update User Profile
```bash
PUT /user/update
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "bio": "Full Stack Developer",
  "phone": "9876543210"
}
```

**Response (200):**
```json
{
  "message": "Profile updated successfully",
  "user": {
    "_id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com",
    "profile": {
      "bio": "Full Stack Developer",
      "phone": "9876543210"
    }
  }
}
```

---

### 6. Get All Users
```bash
GET /user/all
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response (200):**
```json
[
  {
    "_id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com",
    "profile": {
      "bio": "Developer"
    },
    "createdAt": "2023-01-01T00:00:00.000Z"
  },
  {
    "_id": "507f1f77bcf86cd799439012",
    "firstName": "Jane",
    "lastName": "Smith",
    "email": "jane@example.com",
    "profile": {
      "bio": "Designer"
    },
    "createdAt": "2023-01-02T00:00:00.000Z"
  }
]
```

---

### 7. Delete Account
```bash
DELETE /user/delete
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response (200):**
```json
{
  "message": "Account deleted successfully"
}
```

---

## 🧪 Testing with cURL

### Signup Example
```bash
curl -X POST http://localhost:5000/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Login Example
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

### Get Current User (Replace TOKEN)
```bash
curl -X GET http://localhost:5000/api/user/me \
  -H "Authorization: Bearer TOKEN_HERE"
```

---

## 🧪 Testing with Postman

1. **Create Collection** - Deknek API
2. **Add Environment Variable**
   - Variable: `base_url` = `http://localhost:5000/api`
   - Variable: `token` = (will be set after login)

3. **Create Requests**
   - Signup: POST {{base_url}}/auth/signup
   - Login: POST {{base_url}}/auth/login
   - Get Me: GET {{base_url}}/user/me
   - etc.

4. **In Tests Tab** (Auto-set token after login):
   ```javascript
   if (pm.response.code === 200) {
     pm.environment.set("token", pm.response.json().token);
   }
   ```

5. **In Authorization Tab**:
   - Type: Bearer Token
   - Token: {{token}}

---

## 🧪 Testing with JavaScript/Axios

```javascript
import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5000/api'
});

// Signup
async function signup() {
  try {
    const res = await api.post('/auth/signup', {
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@example.com',
      password: 'password123'
    });
    console.log('Signup successful:', res.data);
    localStorage.setItem('token', res.data.token);
  } catch (error) {
    console.error('Signup failed:', error.response.data);
  }
}

// Login
async function login() {
  try {
    const res = await api.post('/auth/login', {
      email: 'john@example.com',
      password: 'password123'
    });
    console.log('Login successful:', res.data);
    localStorage.setItem('token', res.data.token);
  } catch (error) {
    console.error('Login failed:', error.response.data);
  }
}

// Get Current User
async function getCurrentUser() {
  try {
    const token = localStorage.getItem('token');
    const res = await api.get('/user/me', {
      headers: { Authorization: `Bearer ${token}` }
    });
    console.log('Current user:', res.data);
  } catch (error) {
    console.error('Error:', error.response.data);
  }
}

// Run tests
signup();
// Then after signup, you can call:
// getCurrentUser();
```

---

## ⚠️ Error Responses

### 400 Bad Request
```json
{
  "errors": [
    {
      "msg": "Please provide a valid email",
      "param": "email"
    }
  ]
}
```

### 401 Unauthorized
```json
{
  "message": "Invalid credentials"
}
```

### 409 Conflict (Duplicate Email)
```json
{
  "message": "User already exists"
}
```

### 500 Server Error
```json
{
  "message": "Server error",
  "error": "Error details..."
}
```

---

## 📋 Testing Checklist

- [ ] Signup with valid data
- [ ] Signup with invalid email
- [ ] Signup with duplicate email
- [ ] Signup with weak password
- [ ] Login with correct credentials
- [ ] Login with wrong password
- [ ] Login with non-existent email
- [ ] Get current user with valid token
- [ ] Get current user with invalid token
- [ ] Update profile with valid data
- [ ] Get all users
- [ ] Delete account
- [ ] Access protected route without token

---

## 🔍 Status Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Request successful |
| 201 | Created - Resource created |
| 400 | Bad Request - Invalid data |
| 401 | Unauthorized - No/invalid token |
| 409 | Conflict - Duplicate data |
| 500 | Server Error |

---

Happy Testing! 🎉
