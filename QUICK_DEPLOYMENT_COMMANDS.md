# 🚀 Quick Vercel Deployment Commands

Copy and paste these commands to deploy your application quickly!

---

## Step 1: Install Vercel CLI (One time only)

```bash
npm i -g vercel
```

---

## Step 2: Setup Git Repository

### Initialize Git (if not already done)
```bash
git init
git add .
git commit -m "Initial commit"
```

### Add GitHub Remote (Replace USERNAME and REPO)
```bash
git remote add origin https://github.com/YOUR_USERNAME/deknek.git
git branch -M main
git push -u origin main
```

---

## Step 3: Backend Deployment

### 3A: Prepare Backend
```bash
cd Backend
```

### 3B: Update Backend Environment Variables
Edit `Backend/.env`:
```env
MONGO_URI=mongodb+srv://<REDACTED>@cluster0.hucssvr.mongodb.net/?appName=Cluster0
JWT_SECRET=<run command below to generate>
NODE_ENV=production
PORT=3001
```

Generate JWT_SECRET:
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### 3C: Commit and Push Backend
```bash
git add .
git commit -m "Backend ready for deployment"
git push origin main
```

### 3D: Deploy with Vercel CLI
```bash
vercel
```

Follow prompts:
- Confirm project name
- Confirm settings
- Production deployment: Y

### 3E: Set Environment Variables in Vercel
After deployment, go to Vercel dashboard → Project Settings → Environment Variables

Add these variables:
```
MONGO_URI=<your_mongodb_uri>
JWT_SECRET=<generated_secret>
NODE_ENV=production
PORT=3001
```

Redeploy after adding variables:
```bash
vercel --prod
```

### 3F: Get Backend URL
Your backend URL will be shown after deployment, like:
```
https://deknek-backend.vercel.app
```

---

## Step 4: Frontend Deployment

### 4A: Update Frontend Environment
Edit `Frontend/.env`:
```env
REACT_APP_API_BASE_URL=https://deknek-backend.vercel.app/api
```

Replace `deknek-backend` with your actual backend URL!

### 4B: Commit and Push Frontend
```bash
cd ../Frontend
git add .
git commit -m "Update backend URL and ready for deployment"
git push origin main
```

### 4C: Deploy with Vercel CLI
```bash
vercel
```

Follow prompts and select framework (Create React App)

### 4D: Set Environment Variables
Go to Vercel dashboard → Frontend Project → Settings → Environment Variables

Add:
```
REACT_APP_API_BASE_URL=https://your-backend-url.vercel.app/api
```

Redeploy:
```bash
vercel --prod
```

### 4E: Get Frontend URL
Your frontend URL will be like:
```
https://deknek-frontend.vercel.app
```

---

## Step 5: Verify Deployment

### Test Backend Health
```bash
curl https://YOUR_BACKEND_URL/api/health
```

### Test Frontend
Open in browser:
```
https://YOUR_FRONTEND_URL
```

Test the complete flow:
1. Click "Get Started"
2. Sign up
3. Login
4. View dashboard
5. Edit profile
6. Logout

---

## Common Commands

### View Deployment Logs
```bash
vercel logs <URL>
```

### Redeploy Production
```bash
vercel --prod
```

### List All Deployments
```bash
vercel list
```

### Rollback to Previous Version
```bash
vercel rollback
```

### Set Environment Variable via CLI
```bash
vercel env add VARIABLE_NAME
```

### Remove Environment Variable
```bash
vercel env rm VARIABLE_NAME
```

---

## Alternative: GitHub Integration (Recommended)

Instead of using CLI, connect GitHub for automatic deployments:

### For Backend:
1. Go to https://vercel.com/new
2. Click "Import Git Repository"
3. Paste: `https://github.com/YOUR_USERNAME/deknek-backend.git`
4. Click "Import"
5. Add environment variables
6. Click "Deploy"

### For Frontend:
1. Go to https://vercel.com/new
2. Click "Import Git Repository"
3. Paste: `https://github.com/YOUR_USERNAME/deknek-frontend.git`
4. Select "Create React App" framework
5. Add `REACT_APP_API_BASE_URL` environment variable
6. Click "Deploy"

---

## Environment Variables Quick Reference

### Backend Variables
```
MONGO_URI=mongodb+srv://<REDACTED>@cluster0.hucssvr.mongodb.net/?appName=Cluster0
JWT_SECRET=generate_with_crypto.randomBytes
NODE_ENV=production
PORT=3001
```

### Frontend Variables
```
REACT_APP_API_BASE_URL=https://your-backend-url.vercel.app/api
```

---

## Generate Secrets

### Generate JWT Secret (32 bytes)
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### Generate JWT Secret (Windows PowerShell)
```powershell
[System.Convert]::ToHexString([System.Security.Cryptography.RandomNumberGenerator]::GetBytes(32))
```

---

## Troubleshooting Commands

### Clear Vercel Cache
```bash
vercel --prod --force
```

### Check Current Project Config
```bash
vercel projects ls
```

### Remove Vercel Configuration (if needed)
```bash
rm -rf .vercel
```

Then redeploy:
```bash
vercel
```

---

## Full Deployment Sequence (Copy & Paste)

### For Backend:
```bash
cd Backend
# Edit .env with MongoDB URI and JWT_SECRET
git add .
git commit -m "Backend deployment ready"
git push origin main
vercel --prod
# Add environment variables in Vercel dashboard
# Redeploy: vercel --prod
```

### For Frontend:
```bash
cd ../Frontend
# Edit .env with backend URL
git add .
git commit -m "Frontend deployment ready"
git push origin main
vercel --prod
# Add environment variables in Vercel dashboard
# Redeploy: vercel --prod
```

---

## Save Your Deployment URLs

After deployment, save these:

**Backend URL:** ___________________________________

**Frontend URL:** ___________________________________

**GitHub Backend:** ___________________________________

**GitHub Frontend:** ___________________________________

---

## Next Steps After Deployment

1. ✅ Test signup/login on frontend
2. ✅ Monitor Vercel logs
3. ✅ Check MongoDB for new data
4. ✅ Share frontend URL with others
5. ✅ Setup automatic deployments via GitHub
6. ✅ Monitor performance

---

## Quick Links

- Vercel Dashboard: https://vercel.com/dashboard
- MongoDB Atlas: https://cloud.mongodb.com
- Vercel CLI Docs: https://vercel.com/docs/cli
- GitHub: https://github.com

---

**Estimated Total Time: 10-15 minutes**

Good luck! 🚀
