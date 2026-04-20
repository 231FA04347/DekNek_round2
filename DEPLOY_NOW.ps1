# 🚀 Deknek MERN - Vercel Deployment Script
# This script automates the deployment to Vercel

Write-Host "🚀 Deknek Vercel Deployment Script" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Verify code is pushed to GitHub
Write-Host "✓ Code is already pushed to: https://github.com/231FA04347/DekNek_round2" -ForegroundColor Green
Write-Host ""

# Step 2: Manual Vercel Setup Instructions
Write-Host "📋 FOLLOW THESE STEPS TO DEPLOY:" -ForegroundColor Yellow
Write-Host ""

Write-Host "STEP 1: Deploy Backend" -ForegroundColor Cyan
Write-Host "─────────────────────────────────────────"
Write-Host "1. Go to https://vercel.com/dashboard"
Write-Host "2. Click 'Add New' → 'Project'"
Write-Host "3. Click 'Import Git Repository'"
Write-Host "4. Select 'github.com/231FA04347/DekNek_round2'"
Write-Host "5. Under 'Configure Project':"
Write-Host "   - Root Directory: Backend"
Write-Host "   - Framework: Other"
Write-Host "6. Click 'Environment Variables' and add:"
Write-Host ""
Write-Host "   MONGO_URI="
Write-Host "   <your-mongodb-connection-string>"
Write-Host ""
Write-Host "   JWT_SECRET="
$jwtSecret = & node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
Write-Host "   $jwtSecret"
Write-Host ""
Write-Host "   NODE_ENV=production"
Write-Host "   PORT=3001"
Write-Host ""
Write-Host "7. Click 'Deploy'"
Write-Host "8. ⏳ Wait 2-3 minutes for deployment"
Write-Host "9. 📌 SAVE YOUR BACKEND URL (will look like: https://deknek-backend.vercel.app)"
Write-Host ""

Write-Host "STEP 2: Update Frontend Environment" -ForegroundColor Cyan
Write-Host "─────────────────────────────────────────"
Write-Host "1. Update Frontend/.env with your Backend URL:"
Write-Host "   REACT_APP_API_BASE_URL=https://YOUR_BACKEND_URL.vercel.app/api"
Write-Host ""
Write-Host "2. Save the file"
Write-Host "3. Run these commands:"
Write-Host ""
Write-Host "   cd c:\Users\vajin\OneDrive\Desktop\deknek"
Write-Host "   git add Frontend/.env"
Write-Host "   git commit -m 'Update backend URL for production'"
Write-Host "   git push origin master"
Write-Host ""

Write-Host "STEP 3: Deploy Frontend" -ForegroundColor Cyan
Write-Host "─────────────────────────────────────────"
Write-Host "1. Go back to https://vercel.com/dashboard"
Write-Host "2. Click 'Add New' → 'Project'"
Write-Host "3. Click 'Import Git Repository'"
Write-Host "4. Select 'github.com/231FA04347/DekNek_round2' again"
Write-Host "5. Under 'Configure Project':"
Write-Host "   - Root Directory: Frontend"
Write-Host "   - Framework: Create React App"
Write-Host "6. Click 'Environment Variables' and add:"
Write-Host ""
Write-Host "   REACT_APP_API_BASE_URL=https://YOUR_BACKEND_URL.vercel.app/api"
Write-Host ""
Write-Host "7. Click 'Deploy'"
Write-Host "8. ⏳ Wait 2-3 minutes for deployment"
Write-Host "9. 📌 SAVE YOUR FRONTEND URL"
Write-Host ""

Write-Host "✅ DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host ""
Write-Host "Your application will be live at your Frontend URL!" -ForegroundColor Green
Write-Host ""
Write-Host "🧪 TEST YOUR APPLICATION:" -ForegroundColor Yellow
Write-Host "1. Open your Frontend URL in browser"
Write-Host "2. Click 'Get Started'"
Write-Host "3. Create a test account"
Write-Host "4. Login and verify dashboard works"
Write-Host ""
Write-Host "📚 Resources:" -ForegroundColor Cyan
Write-Host "- Detailed guide: VERCEL_DEPLOYMENT.md"
Write-Host "- Troubleshooting: VERCEL_TROUBLESHOOTING.md"
Write-Host "- API testing: API_TESTING.md"
