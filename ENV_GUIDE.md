# Environment Configuration Guide

## Backend Environment Variables (.env)

### Development
```env
MONGO_URI=<your-mongodb-connection-string-from-atlas>
JWT_SECRET=dev_secret_key_change_in_production
PORT=5000
NODE_ENV=development
```

### Production
```env
MONGO_URI=your_production_mongodb_uri
JWT_SECRET=generate_a_strong_random_secret_using_crypto
PORT=5000
NODE_ENV=production
```

## Frontend Environment Variables (.env)

### Development
```env
REACT_APP_API_BASE_URL=http://localhost:5000/api
```

### Production (Vercel/Netlify)
```env
REACT_APP_API_BASE_URL=https://your-deployed-backend-url.com/api
```

## How to Generate JWT_SECRET

### Using Node.js
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

### Using OpenSSL
```bash
openssl rand -hex 32
```

## Setting Environment Variables

### Local Development
1. Create `.env` file in Backend folder
2. Add variables
3. Restart server

### Production (Render)
1. Go to Render Dashboard
2. Select your service
3. Environment → Add Variable
4. Enter key and value
5. Deploy

### Production (Heroku)
```bash
heroku config:set VAR_NAME=value
```

### Production (Netlify/Vercel)
1. Go to Site Settings
2. Build & Deploy → Environment
3. Add variables
4. Redeploy

## Security Best Practices

✅ **DO:**
- Use strong, random secrets
- Store secrets in environment variables
- Use HTTPS in production
- Rotate secrets regularly
- Use different secrets for each environment

❌ **DON'T:**
- Commit .env files to git
- Share secrets in code
- Use simple/predictable secrets
- Hardcode secrets
- Commit secrets to public repositories

## Variable Descriptions

| Variable | Purpose | Where Set |
|----------|---------|-----------|
| MONGO_URI | MongoDB connection | Backend |
| JWT_SECRET | JWT signing key | Backend |
| PORT | Server port | Backend |
| NODE_ENV | Environment type | Backend |
| REACT_APP_API_BASE_URL | Backend API URL | Frontend |

---

For more info, see README.md and DEPLOYMENT.md
