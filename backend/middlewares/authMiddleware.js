// middlewares/authMiddleware.js
const jwt = require('jsonwebtoken');

const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith("Bearer ")) {
    console.warn("No or invalid token format:", authHeader);
    return res.status(401).json({ message: 'No or invalid token format' });
  }

  const token = authHeader.split(' ')[1];

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // contains id, username, role
    next();
  } catch (err) {
    console.error("JWT verification error:", err);
    return res.status(401).json({ message: 'Invalid token' });
  }
};

function authorizeRole(allowedRoles) {
  return (req, res, next) => {
    if (!req.user || !allowedRoles.includes(req.user.role)) {
      console.warn("Access denied for role:", req.user?.role);
      return res.status(403).json({ message: "Access denied: insufficient permissions" });
    }
    next();
  };
}

module.exports = { authenticate, authorizeRole };
