# 🚀 Vercel Deployment Guide - Deknek MERN

Complete step-by-step guide to deploy both Backend and Frontend to Vercel.

## 📋 Prerequisites

- GitHub account with your Deknek repository
- Vercel account (free at https://vercel.com)
- MongoDB Atlas account (already set up)
- Git installed

---

## 🔵 PART 1: Deploy Backend to Vercel

### Step 1: Push Backend to GitHub

```bash
cd Backend
git init
git add .
git commit -m "Backend ready for Vercel deployment"
git remote add origin https://github.com/YOUR_USERNAME/deknek-backend.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username.

### Step 2: Create Vercel Project for Backend

1. Go to https://vercel.com/dashboard
2. Click **"Add New..."** → **"Project"**
3. Select **"Import Git Repository"**
4. Paste your Backend repository URL
5. Click **"Import"**

### Step 3: Configure Environment Variables

After importing, you'll see "Configure Project" page:

1. Under **"Environment Variables"**, add:

| Name | Value |
|------|-------|
| `MONGO_URI` | Your MongoDB connection string |
| `JWT_SECRET` | Generate a strong random secret |
| `NODE_ENV` | `production` |
| `PORT` | `3001` |

**To generate JWT_SECRET:**
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

2. Click **"Deploy"**

### Step 4: Wait for Deployment

- Vercel will build and deploy your backend
- You'll get a URL like: `https://deknek-backend.vercel.app`
- Check the status on the Vercel dashboard
- Save this URL for frontend configuration

### Verify Backend Deployment

Test your deployed backend:
```bash
curl https://YOUR_BACKEND_URL/api/health
```

You should get: `{"status":"Backend is running! ✅"}`

---

## 🟡 PART 2: Deploy Frontend to Vercel

### Step 1: Push Frontend to GitHub

```bash
cd ../Frontend
git init
git add .
git commit -m "Frontend ready for Vercel deployment"
git remote add origin https://github.com/YOUR_USERNAME/deknek-frontend.git
git push -u origin main
```

### Step 2: Update Frontend Environment Variables

Update **`Frontend/.env`** with your deployed backend URL:

```env
REACT_APP_API_BASE_URL=https://YOUR_BACKEND_URL.vercel.app/api
```

Replace `YOUR_BACKEND_URL` with your actual Vercel backend URL.

Commit and push:
```bash
git add .env
git commit -m "Update backend URL"
git push origin main
```

### Step 3: Create Vercel Project for Frontend

1. Go to https://vercel.com/dashboard
2. Click **"Add New..."** → **"Project"**
3. Select **"Import Git Repository"**
4. Paste your Frontend repository URL
5. Click **"Import"**

### Step 4: Configure Frontend Project

On the "Configure Project" page:

1. **Framework Preset**: Select **"Create React App"**
2. **Root Directory**: Leave empty (or set to `Frontend` if in monorepo)
3. **Build Command**: `npm run build` (pre-filled)
4. **Output Directory**: `build` (pre-filled)
5. **Install Command**: `npm install` (pre-filled)

### Step 5: Add Environment Variables

1. Click **"Environment Variables"**
2. Add:

| Name | Value |
|------|-------|
| `REACT_APP_API_BASE_URL` | `https://your-backend.vercel.app/api` |

3. Click **"Deploy"**

### Step 6: Wait for Deployment

- Vercel will build and deploy your frontend
- You'll get a URL like: `https://deknek-frontend.vercel.app`
- Visit your frontend URL to verify it's working

---

## ✅ Verification Checklist

Test your deployed application:

### Backend Checks
- [ ] Backend is deployed on Vercel
- [ ] Backend URL is accessible
- [ ] Health check endpoint works (`/api/health`)
- [ ] MongoDB connection is working
- [ ] Environment variables are set

### Frontend Checks
- [ ] Frontend is deployed on Vercel
- [ ] Frontend URL is accessible
- [ ] Home page loads correctly
- [ ] Backend API URL is configured

### Integration Tests
- [ ] Go to frontend URL
- [ ] Click "Get Started"
- [ ] Fill signup form
- [ ] Submit (should call backend API)
- [ ] Receive response without CORS errors
- [ ] Get redirected to dashboard
- [ ] See your profile
- [ ] Test login/logout
- [ ] Edit profile

---

## 🔗 Environment Variables Reference

### Backend (Vercel)
```
MONGO_URI=<your-mongodb-connection-string>
JWT_SECRET=<generated-random-secret>
NODE_ENV=production
PORT=3001
```

### Frontend (Vercel)
```
REACT_APP_API_BASE_URL=https://your-backend.vercel.app/api
```

---

## 🐛 Troubleshooting

### Backend Deployment Issues

**Problem: Deployment fails with "Build failed"**
- Check that `package.json` has proper scripts
- Verify `server.js` exists in root
- Check `vercel.json` is correctly configured

**Problem: Backend runs but MongoDB connection fails**
- Verify MongoDB URI in environment variables
- Check IP is whitelisted in MongoDB Atlas
- Test connection string locally first

**Problem: Deployment succeeds but API returns 404**
- Ensure routes are properly defined in `server.js`
- Check CORS configuration
- Verify environment variables are set

### Frontend Deployment Issues

**Problem: React build fails**
- Check for TypeScript/syntax errors locally
- Ensure all dependencies are in `package.json`
- Run `npm run build` locally to test

**Problem: "Cannot GET /" on frontend**
- Verify `vercel.json` is configured correctly
- Check build directory is set to `build`
- Ensure `package.json` build script works

**Problem: Frontend can't connect to backend**
- Verify `REACT_APP_API_BASE_URL` is set in Vercel
- Check the backend URL is correct
- Ensure backend API is accessible
- Check browser console for CORS errors

---

## 📊 Your Deployment URLs

After deployment, save these URLs:

**Backend URL:** ___________________________________

**Frontend URL:** ___________________________________

**MongoDB URI:** (Keep secure!) ___________________________________

---

## 🔐 Security Checklist

- [ ] JWT_SECRET is strong and random
- [ ] MongoDB credentials are kept secure
- [ ] Environment variables are NOT committed to git
- [ ] `.env` files are in `.gitignore`
- [ ] Both services are HTTPS (automatic on Vercel)
- [ ] CORS is properly configured
- [ ] No sensitive data in public files

---

## 📈 Performance Tips

1. **Enable Caching** - Vercel caches automatically
2. **Optimize Images** - Use optimized formats
3. **Database Indexes** - Create indexes in MongoDB
4. **API Rate Limiting** - Implement in Express if needed
5. **CDN** - Vercel includes CDN automatically

---

## 🔄 Continuous Deployment

Once deployed, every push to your GitHub repository will:
1. Trigger Vercel build
2. Run tests (if configured)
3. Deploy automatically if successful
4. Rollback if failed

---

## 📚 Useful Resources

- Vercel Docs: https://vercel.com/docs
- Node.js Deployment: https://vercel.com/docs/concepts/runtimes/nodejs
- React Deployment: https://vercel.com/docs/frameworks/react
- Environment Variables: https://vercel.com/docs/concepts/projects/environment-variables

---

## 🎯 Next Steps After Deployment

1. Test all authentication flows
2. Monitor Vercel dashboard for errors
3. Check MongoDB Atlas for connection logs
4. Set up monitoring/alerts (optional)
5. Share deployed URLs with team
6. Collect feedback and iterate

---

## 💡 Tips for Success

✅ **DO:**
- Test locally before pushing to GitHub
- Use different environment variables for dev/prod
- Keep `.env` files out of git
- Monitor Vercel logs for errors
- Update dependencies regularly

❌ **DON'T:**
- Commit secrets or API keys
- Use same JWT_SECRET as local development
- Skip environment variable setup
- Ignore Vercel build errors
- Deploy broken code

---

## 📞 Support

If deployment fails:
1. Check Vercel build logs
2. Review environment variables
3. Test backend API locally
4. Check MongoDB connection
5. Review browser console for frontend errors
6. Check network tab for API calls

---

**Happy Deploying! 🚀**

For additional help, refer to:
- README.md
- API_TESTING.md
- DEPLOYMENT.md (general deployment guide)

---

Deployment Time: ~5-10 minutes per service
Status Page: https://vercel.com/status
