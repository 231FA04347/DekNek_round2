// Vercel Serverless Function entrypoint
// Rewrites in vercel.json route all /api/* requests to this handler.

const app = require('../server');

module.exports = (req, res) => {
  return app(req, res);
};
