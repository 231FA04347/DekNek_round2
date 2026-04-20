# Deployment Guide - Deknek MERN Application

Complete guide to deploy your Deknek application to production.

## 🚀 Option 1: Deploy Backend to Render

### Step 1: Prepare Your Repository

1. Create a `.gitignore` in Backend folder:
   ```
   node_modules/
   .env
   .env.local
   ```

2. Initialize git (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

3. Push to GitHub

### Step 2: Deploy on Render

1. Go to [https://render.com](https://render.com)
2. Sign up and connect your GitHub account
3. Click "New +" → "Web Service"
4. Select your repository
5. Configure:
   - **Name**: deknek-backend
   - **Environment**: Node
   - **Build Command**: `npm install`
   - **Start Command**: `node server.js`
   - **Branch**: main

6. Add Environment Variables:
   - Click "Add Environment Variable"
   - Add all variables from `.env`:
     ```
     MONGO_URI=mongodb+srv://<REDACTED>@cluster0.hucssvr.mongodb.net/?appName=Cluster0
     JWT_SECRET=create_a_strong_random_secret_here
     PORT=5000
     NODE_ENV=production
     ```

7. Click "Deploy"

### Your Backend URL
Once deployed, you'll get a URL like:
```
https://deknek-backend.onrender.com
```

---

## 🎨 Option 2: Deploy Frontend to Vercel

### Step 1: Prepare for Deployment

1. Update `.env` file in Frontend:
   ```
   REACT_APP_API_BASE_URL=https://deknek-backend.onrender.com/api
   ```
   (Replace with your actual Render URL)

2. Build the project:
   ```bash
   cd Frontend
   npm run build
   ```

3. Test locally:
   ```bash
   npm run start
   ```

### Step 2: Deploy on Vercel

1. Go to [https://vercel.com](https://vercel.com)
2. Sign up and connect your GitHub account
3. Click "Add New..." → "Project"
4. Select your repository
5. Configure:
   - **Framework Preset**: Create React App
   - **Root Directory**: Frontend
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`

6. Add Environment Variables:
   - Click "Environment Variables"
   - Add: `REACT_APP_API_BASE_URL` = `https://your-backend-url.onrender.com/api`

7. Click "Deploy"

### Your Frontend URL
Once deployed, you'll get a URL like:
```
https://deknek-frontend.vercel.app
```

---

## 🌐 Option 3: Deploy Everything to Heroku

### Prerequisites
- Heroku account
- Heroku CLI installed

### Step 1: Setup Heroku Backend

1. Create `Procfile` in Backend folder:
   ```
   web: node server.js
   ```

2. Login to Heroku:
   ```bash
   heroku login
   ```

3. Create Heroku app:
   ```bash
   heroku create deknek-backend
   ```

4. Set environment variables:
   ```bash
   heroku config:set MONGO_URI="your_mongo_uri" JWT_SECRET="your_secret"
   ```

5. Deploy:
   ```bash
   git push heroku main
   ```

### Step 2: Deploy Frontend to Netlify

1. Go to [https://netlify.com](https://netlify.com)
2. Click "Add new site" → "Import an existing project"
3. Connect GitHub
4. Select your repository
5. Configure:
   - **Base directory**: Frontend
   - **Build command**: `npm run build`
   - **Publish directory**: `build`

6. Add Environment Variables:
   - Go to "Site settings" → "Build & deploy" → "Environment"
   - Add: `REACT_APP_API_BASE_URL` = `https://your-heroku-url.herokuapp.com/api`

7. Deploy

---

## ✅ Post-Deployment Checklist

- [ ] Backend is running and accessible
- [ ] Frontend can communicate with backend
- [ ] Login/Signup works on production
- [ ] MongoDB is storing data correctly
- [ ] Environment variables are set correctly
- [ ] HTTPS is enabled
- [ ] CORS is properly configured
- [ ] JWT_SECRET is changed from default
- [ ] No sensitive data in code
- [ ] Error handling works properly

---

## 🔧 Common Issues & Solutions

### Issue: CORS Error
**Solution**: Update CORS in backend `server.js`:
```javascript
app.use(cors({
  origin: 'https://your-frontend-url.vercel.app',
  credentials: true
}));
```

### Issue: 502 Bad Gateway on Render
**Solution**: 
1. Check logs: `render logs`
2. Verify PORT is 5000
3. Check MongoDB connection string

### Issue: Frontend can't reach backend
**Solution**:
1. Verify `REACT_APP_API_BASE_URL` in frontend `.env`
2. Check backend is running
3. Test backend URL in browser

### Issue: Token not persisting
**Solution**:
1. Check localStorage is enabled
2. Verify JWT expiration
3. Check token format in requests

---

## 📊 Monitoring

### Render Dashboard
- View logs
- Check resource usage
- Monitor uptime
- Manage environment variables

### Vercel Dashboard
- View deployment status
- Check analytics
- Monitor performance
- View logs

### MongoDB Atlas
- Check cluster status
- Monitor database performance
- Review network access
- Check backup status

---

## 🔐 Security Checklist

- [ ] JWT_SECRET is strong and random
- [ ] Environment variables are not committed
- [ ] HTTPS is enforced
- [ ] CORS is restricted to your domain
- [ ] Input validation is in place
- [ ] Rate limiting is enabled
- [ ] Sensitive data is encrypted
- [ ] Regular security updates

---

## 📈 Performance Tips

1. **Enable compression** in Express
2. **Use CDN** for static files
3. **Optimize database queries**
4. **Implement caching** strategies
5. **Monitor API response times**
6. **Use production builds** for frontend

---

## 🎯 Your Deployment URLs

Update these after deployment:

**Backend URL**: `_________________________`

**Frontend URL**: `_________________________`

**MongoDB Connection**: `_________________________`

---

## 📞 Support

For deployment issues:
1. Check service logs
2. Verify environment variables
3. Test API endpoints
4. Check network connectivity
5. Review error messages

---

**Happy Deploying!** 🚀
