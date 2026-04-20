# 📋 Vercel Deployment Checklist

## Pre-Deployment Checklist

### Local Testing
- [ ] Backend runs locally: `npm run dev`
- [ ] Frontend runs locally: `npm run dev`
- [ ] Can signup new user
- [ ] Can login with credentials
- [ ] Dashboard loads and shows users
- [ ] Profile edit works
- [ ] No console errors
- [ ] No network errors

### Code Quality
- [ ] No console.log statements left
- [ ] All environment variables configured
- [ ] No hardcoded URLs or API keys
- [ ] No TODO comments
- [ ] Code is formatted
- [ ] No unused imports

### Environment Files
- [ ] Backend `.env` has all required variables
- [ ] Frontend `.env` configured with local backend URL
- [ ] `.gitignore` includes `.env` files
- [ ] `.env.example` created (optional but recommended)

### Repository Setup
- [ ] Code pushed to GitHub
- [ ] Commit messages are clear
- [ ] No node_modules in git
- [ ] No build folders in git
- [ ] Branch is `main` or `master`

---

## Backend Deployment Checklist

### Vercel Configuration
- [ ] `vercel.json` created with proper config
- [ ] `.vercelignore` created
- [ ] `package.json` has build script
- [ ] `server.js` is in root directory

### Environment Variables (Set in Vercel)
- [ ] `MONGO_URI` = Your MongoDB connection string
- [ ] `JWT_SECRET` = Generated random secret
- [ ] `NODE_ENV` = `production`
- [ ] `PORT` = `3001`

### Post-Deployment
- [ ] Backend deployed successfully
- [ ] Backend URL is accessible
- [ ] Health check works: `/api/health`
- [ ] MongoDB connection verified
- [ ] No errors in Vercel logs
- [ ] Backend URL noted for frontend

### API Testing (Deployed)
- [ ] POST `/api/auth/signup` works
- [ ] POST `/api/auth/login` works
- [ ] POST `/auth/verify` works
- [ ] GET `/api/user/me` works (with token)
- [ ] GET `/api/user/all` returns users
- [ ] PUT `/api/user/update` works

---

## Frontend Deployment Checklist

### Vercel Configuration
- [ ] `vercel.json` created with SPA config
- [ ] `.vercelignore` created
- [ ] `package.json` has build script
- [ ] `build` folder generates correctly locally

### Environment Variables
- [ ] Updated Frontend `.env` with backend URL
- [ ] `REACT_APP_API_BASE_URL` = Backend Vercel URL/api
- [ ] No hardcoded localhost URLs
- [ ] Environment variables committed and pushed

### Build Verification
- [ ] Local build works: `npm run build`
- [ ] Build output in `build/` folder
- [ ] No build errors or warnings
- [ ] Build is under 1GB

### Post-Deployment
- [ ] Frontend deployed successfully
- [ ] Frontend URL is accessible
- [ ] Home page loads
- [ ] Navigation works
- [ ] No CORS errors in console
- [ ] API calls reach backend
- [ ] Frontend URL noted

### Full Integration Testing
- [ ] Open frontend URL
- [ ] Click "Get Started"
- [ ] Fill signup form
- [ ] Submit form
- [ ] See success message
- [ ] Redirected to dashboard
- [ ] Can view profile
- [ ] Can edit profile
- [ ] Can view all users
- [ ] Can logout
- [ ] Can login again
- [ ] Can delete account (optional test)

---

## Deployment Process

### Step 1: Prepare Backend (Backend/)
```
- Push code to GitHub
- Create Vercel project
- Set environment variables
- Deploy
- Verify with health check
- Save backend URL
```

### Step 2: Prepare Frontend (Frontend/)
```
- Update .env with backend URL
- Commit and push to GitHub
- Create Vercel project
- Set environment variables
- Deploy
- Verify deployment
```

### Step 3: Full System Test
```
- Open frontend URL in browser
- Test complete flow (signup → dashboard → logout → login)
- Check browser console for errors
- Check backend logs
- Verify data in MongoDB
```

---

## Common Issues to Check

If deployment fails:
- [ ] GitHub repository is public
- [ ] Files are actually committed
- [ ] Environment variables are set
- [ ] File names are correct (server.js, App.js)
- [ ] No syntax errors locally
- [ ] Dependencies are in package.json

---

## Rollback Plan

If something goes wrong:
1. Go to Vercel Dashboard
2. Find your project
3. Go to Deployments tab
4. Find previous working version
5. Click three dots → Redeploy

---

## Post-Deployment Monitoring

- [ ] Check Vercel logs daily
- [ ] Monitor MongoDB usage
- [ ] Check for errors in console
- [ ] Test critical user flows
- [ ] Collect user feedback

---

## Success Criteria

✅ Deployment is complete when:
- Backend is accessible and responds to API calls
- Frontend is accessible and displays correctly
- Users can signup and login
- Database stores data
- No CORS errors
- No console errors
- All features work

---

## Deployment Status

| Component | Status | URL | Deployed Date |
|-----------|--------|-----|---------------|
| Backend | ⏳ Pending | - | - |
| Frontend | ⏳ Pending | - | - |

Update these after successful deployment!

---

**Total Estimated Time: 15-20 minutes**

For detailed steps, see: `VERCEL_DEPLOYMENT.md`
