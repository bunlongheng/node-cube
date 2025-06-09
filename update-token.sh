(
  cd /Users/bheng/Sites/recharts-cube \
  && TOKEN=$(node -e "console.log(require('jsonwebtoken').sign({ appId: 'default' }, 'rc-secret', { expiresIn: '7d' }))") \
  && grep -q '^REACT_APP_CUBEJS_API_TOKEN=' .env \
      && sed -i '' "s|^REACT_APP_CUBEJS_API_TOKEN=.*|REACT_APP_CUBEJS_API_TOKEN=$TOKEN|" .env \
      || echo "REACT_APP_CUBEJS_API_TOKEN=$TOKEN" >> .env \
  && npm run start
)