#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Deknek MERN Setup${NC}"
echo "================================"

# Install Backend Dependencies
echo -e "${YELLOW}Installing Backend dependencies...${NC}"
cd Backend
npm install
echo -e "${GREEN}✅ Backend dependencies installed${NC}"

# Install Frontend Dependencies
echo -e "${YELLOW}Installing Frontend dependencies...${NC}"
cd ../Frontend
npm install
echo -e "${GREEN}✅ Frontend dependencies installed${NC}"

# Go back to root
cd ..

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "Next steps:"
echo "1. Open Terminal 1: cd Backend && npm run dev"
echo "2. Open Terminal 2: cd Frontend && npm run dev"
echo "3. Open Browser: http://localhost:3000"
echo ""
echo "Happy Coding! 🎉"
