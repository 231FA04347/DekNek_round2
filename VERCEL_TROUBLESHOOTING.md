# 🔧 Vercel Deployment Troubleshooting Guide

Solutions for common issues when deploying to Vercel.

---

## 🚨 Backend Deployment Issues

### Issue 1: "Cannot find module" Error

**Problem:** Build fails with `Cannot find module 'express'`

**Solution:**
1. Check `package.json` has all dependencies
2. Verify npm install worked locally:
   ```bash
   cd Backend
   npm install
   npm list
   ```
3. Commit `package-lock.json`:
   ```bash
   git add package-lock.json
   git commit -m "Add package lock"
   git push
   ```
4. Redeploy on Vercel

---

### Issue 2: "MONGO_URI is not defined"

**Problem:** MongoDB connection fails, says `MONGO_URI` is undefined

**Solution:**
1. Go to Vercel Dashboard
2. Project → Settings → Environment Variables
3. Add `MONGO_URI` with your connection string
4. Redeploy:
   ```bash
   vercel --prod
   ```

**Verify:**
```bash
curl https://your-backend.vercel.app/api/health
```

---

### Issue 3: "Port 3001 already in use"

**Problem:** Shows port binding error in logs

**Solution:**
- Vercel assigns ports automatically
- Remove or change `PORT` environment variable
- Or set `PORT=0` for auto-assignment

---

### Issue 4: Build Succeeds but API Returns 404

**Problem:** Backend deploys but all endpoints return 404

**Solution:**
1. Check `vercel.json` routes configuration
2. Verify routes are correctly defined in `server.js`
3. Test health endpoint:
   ```bash
   curl https://your-backend.vercel.app/api/health
   ```
4. If health check works, routes should work

**Typical `vercel.json`:**
```json
{
  "version": 2,
  "builds": [{
    "src": "server.js",
    "use": "@vercel/node"
  }],
  "routes": [{
    "src": "/(.*)",
    "dest": "server.js"
  }]
}
```

---

### Issue 5: MongoDB Connection Timeout

**Problem:** `MongooseError: connect ECONNREFUSED`

**Solution:**
1. Verify MongoDB URI is correct
2. Check IP is whitelisted in MongoDB Atlas:
   - Go to MongoDB Atlas → Cluster → Network Access
   - Add Vercel IP or allow all: `0.0.0.0/0`
3. Test connection string locally first
4. Check MongoDB cluster is running
5. Restart MongoDB connection

**Test locally:**
```bash
cd Backend
npm run dev
# Should see: ✅ MongoDB connected successfully
```

---

### Issue 6: CORS Errors from Frontend

**Problem:** Frontend can't call backend, CORS error

**Solution:**

Check backend `server.js` has:
```javascript
app.use(cors());
```

Or specific domain:
```javascript
app.use(cors({
  origin: 'https://your-frontend.vercel.app',
  credentials: true
}));
```

If still issues:
1. Go to Backend `routes/auth.js`
2. Ensure routes are defined correctly
3. Check response format

---

### Issue 7: 502 Bad Gateway Error

**Problem:** Backend deployed but shows 502 error

**Solution:**
1. Check Vercel logs:
   ```bash
   vercel logs https://your-backend.vercel.app
   ```
2. Look for errors in output
3. Common causes:
   - MongoDB not connected
   - Environment variables missing
   - Code syntax error

4. Fix and redeploy:
   ```bash
   git push origin main
   # or
   vercel --prod --force
   ```

---

## 🚨 Frontend Deployment Issues

### Issue 1: "Cannot find module" in Frontend

**Problem:** Build fails for missing dependency

**Solution:**
1. Install missing package locally:
   ```bash
   cd Frontend
   npm install missing-package-name
   ```
2. Verify build works:
   ```bash
   npm run build
   ```
3. Commit and push:
   ```bash
   git add package.json package-lock.json
   git commit -m "Add dependency"
   git push origin main
   ```

---

### Issue 2: "REACT_APP_API_BASE_URL is undefined"

**Problem:** Frontend shows API connection errors

**Solution:**
1. Update `Frontend/.env`:
   ```
   REACT_APP_API_BASE_URL=https://your-backend.vercel.app/api
   ```
2. Commit and push
3. Go to Vercel → Frontend Project → Settings → Environment Variables
4. Add `REACT_APP_API_BASE_URL` with backend URL
5. Redeploy

**Verify:**
```bash
# Check in browser console:
# console.log(process.env.REACT_APP_API_BASE_URL)
```

---

### Issue 3: React Build Fails

**Problem:** `npm run build` fails with syntax errors

**Solution:**
1. Run build locally first:
   ```bash
   cd Frontend
   npm run build
   ```
2. Fix any errors shown
3. Test locally with production build:
   ```bash
   npm start
   ```
4. Commit and push
5. Redeploy

**Common causes:**
- Unused variables
- ESLint warnings treated as errors
- Missing dependencies
- TypeScript errors

---

### Issue 4: "Cannot GET /" Error

**Problem:** Frontend loads but shows "Cannot GET /"

**Solution:**
1. Check `vercel.json` exists in Frontend root
2. Verify it has SPA configuration:
   ```json
   {
     "version": 2,
     "routes": [
       {
         "src": "^/(?!static)(.*)$",
         "dest": "/index.html"
       }
     ]
   }
   ```
3. Redeploy

---

### Issue 5: Frontend Loads but Can't Connect to Backend

**Problem:** Frontend shows but API calls fail

**Solution:**
1. Check browser console for errors (F12 → Console)
2. Check Network tab to see API calls
3. Verify backend URL is correct:
   ```bash
   # In browser console:
   fetch('https://your-backend.vercel.app/api/health')
   ```
4. If endpoint responds, but signup fails:
   - Check CORS in backend
   - Verify request body format
   - Check backend logs

---

### Issue 6: Blank Page on Frontend

**Problem:** Frontend deployment shows blank/white page

**Solution:**
1. Check browser console (F12)
2. Look for JavaScript errors
3. Verify public/index.html exists
4. Check build process:
   ```bash
   npm run build
   ```
5. Verify dependencies are installed
6. Clear browser cache: Ctrl+Shift+Delete

---

## 🚨 Integration Issues (Frontend + Backend)

### Issue 1: CORS Error

**Error:** `Access to XMLHttpRequest at 'https://backend.url' from origin 'https://frontend.url' has been blocked by CORS policy`

**Solution:**

Update Backend `server.js`:
```javascript
const cors = require('cors');

// Allow specific frontend URL
app.use(cors({
  origin: 'https://your-frontend.vercel.app',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));
```

Or allow all (less secure):
```javascript
app.use(cors());
```

---

### Issue 2: Token Not Persisting

**Problem:** After login, user gets logged out immediately

**Solution:**
1. Check localStorage in browser DevTools
2. Verify token is being saved:
   ```javascript
   // In browser console:
   localStorage.getItem('token')
   ```
3. Check token expiration:
   ```javascript
   // In Frontend AuthContext.js
   // Ensure token verification works
   ```

---

### Issue 3: User Data Not Saving

**Problem:** Signup works but data not in database

**Solution:**
1. Check MongoDB connection in logs
2. Verify database name and collection names match
3. Check User model in Backend:
   ```bash
   # Check Backend/models/User.js
   ```
4. Test API directly:
   ```bash
   curl -X POST https://your-backend.vercel.app/api/auth/signup \
     -H "Content-Type: application/json" \
     -d '{"firstName":"Test","lastName":"User","email":"test@example.com","password":"pass123"}'
   ```

---

### Issue 4: Login Works but Dashboard is Blank

**Problem:** After login, dashboard shows but no data

**Solution:**
1. Check backend is fetching users:
   ```bash
   curl -H "Authorization: Bearer YOUR_TOKEN" \
        https://your-backend.vercel.app/api/user/all
   ```
2. Verify MongoDB has data
3. Check browser Network tab for API response
4. Look for JavaScript errors in console

---

## 🔍 Debugging Tips

### Check Vercel Logs
```bash
vercel logs <project-url>
```

### Check Backend Functionality
```bash
# Test health check
curl https://your-backend.vercel.app/api/health

# Test signup
curl -X POST https://your-backend.vercel.app/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"firstName":"John","lastName":"Doe","email":"john@test.com","password":"pass123"}'
```

### Check Frontend Network
1. Open DevTools (F12)
2. Go to Network tab
3. Perform action (signup/login)
4. Check request/response
5. Look for errors in Console

### MongoDB Connection
1. Go to MongoDB Atlas
2. Clusters → Status
3. Check cluster is running
4. Verify IP is whitelisted
5. Test connection string locally

---

## 🛠️ Quick Fixes

### Clear Vercel Cache
```bash
vercel --prod --force
```

### Redeploy Everything
```bash
git push origin main
# Wait for auto-deployment or
vercel --prod
```

### Reset Environment Variables
```bash
# Remove all
vercel env rm VARIABLE_NAME

# Re-add them
vercel env add VARIABLE_NAME
```

### Check Project Config
```bash
vercel projects ls
vercel projects inspect
```

---

## 📊 Verification Checklist

After deployment, verify:
- [ ] Backend URL is accessible
- [ ] Backend health check works
- [ ] Frontend URL is accessible
- [ ] Frontend loads without errors
- [ ] Signup works
- [ ] Login works
- [ ] Dashboard displays
- [ ] Profile edit works
- [ ] Logout works
- [ ] No CORS errors
- [ ] No console errors
- [ ] Database stores data
- [ ] No 502 errors

---

## 🆘 If Still Stuck

1. **Check Logs:**
   ```bash
   vercel logs https://your-backend.vercel.app
   vercel logs https://your-frontend.vercel.app
   ```

2. **Test Locally:**
   - Run both servers locally
   - Test complete flow
   - Verify works before re-deploying

3. **Verify Variables:**
   - Print environment variables
   - Ensure they're loaded correctly
   - Check for typos

4. **Review Code:**
   - Check for syntax errors
   - Verify imports are correct
   - Check file paths

5. **Restart Services:**
   - Redeploy project
   - Clear browser cache
   - Restart MongoDB connection

---

## 📚 Resources

- Vercel Logs: https://vercel.com/docs/concepts/projects/overview#inspecting-logs
- Node.js Runtime: https://vercel.com/docs/concepts/runtimes/nodejs
- Error Codes: https://vercel.com/docs/concepts/deployments/deployment-errors-and-logs
- MongoDB Atlas Status: https://status.cloud.mongodb.com

---

## 💬 Getting Help

If you're still having issues:
1. Check Vercel status: https://vercel.com/status
2. Check MongoDB status: https://status.cloud.mongodb.com
3. Review Vercel documentation: https://vercel.com/docs
4. Check browser console errors (F12)
5. Check Vercel build logs

---

**Good luck with your deployment! 🚀**

If all else fails, reset and try again:
```bash
vercel remove -y
vercel --prod
```
