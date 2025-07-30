// API Configuration
const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8001';

export const API_ENDPOINTS = {
  // Auth
  LOGIN: `${API_BASE_URL}/api/auth/login`,
  
  // Products
  PRODUCTS: `${API_BASE_URL}/api/products`,
  PRODUCT_BY_ID: (id) => `${API_BASE_URL}/api/products/${id}`,
  
  // Orders
  ORDERS: `${API_BASE_URL}/api/orders`,
  ORDER_BY_ID: (id) => `${API_BASE_URL}/api/orders/${id}`,
  ORDER_STATUS: (id, status) => `${API_BASE_URL}/api/orders/active-order/${id}/${status}`,
  
  // Comments
  COMMENTS: `${API_BASE_URL}/api/comments`,
  COMMENT_BY_ID: (id) => `${API_BASE_URL}/api/comments/${id}`,
  ACCEPT_COMMENT: (id) => `${API_BASE_URL}/api/comments/accept/${id}`,
  REJECT_COMMENT: (id) => `${API_BASE_URL}/api/comments/reject/${id}`,
  
  // Users
  USERS: `${API_BASE_URL}/api/users`,
  USER_BY_ID: (id) => `${API_BASE_URL}/api/users/${id}`,
  
  // Offs (Discounts)
  OFFS: `${API_BASE_URL}/api/offs`,
  OFF_BY_ID: (id) => `${API_BASE_URL}/api/offs/${id}`,
  OFF_STATUS: (id, status) => `${API_BASE_URL}/api/offs/active-off/${id}/${status}`,
  
  // Categories
  CATEGORIES: `${API_BASE_URL}/api/categories`,
  
  // Monthly Sales
  MONTHLY_SALES: `${API_BASE_URL}/api/monthly-sales`,
};

export default API_ENDPOINTS;