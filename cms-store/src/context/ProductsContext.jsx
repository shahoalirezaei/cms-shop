import React, { useState, createContext, useEffect, useContext } from "react";
import API_ENDPOINTS from "../config/api";
import { useAuthFetch } from "../hooks/useAuthFetch";

const ProductsContext = createContext();

export const ProductsProvider = ({ children }) => {
  const [allProduct, setAllProducts] = useState([]);
  const { authFetch } = useAuthFetch();

  const getAllProduct = async () => {
    const { error, data } = await authFetch(API_ENDPOINTS.PRODUCTS);

    if (error) {
      console.error("Fetch error:", error);
    } else {
      const reverseData = Array.isArray(data) ? [...data].reverse() : [];

      // const reverseData = [...data].reverse();
      console.log("Calling authFetch for products");
      setAllProducts(reverseData);
    }
  };

  useEffect(() => {
    getAllProduct();
  }, []);

  return (
    <ProductsContext.Provider
      value={{ allProduct, setAllProducts, getAllProduct }}
    >
      {Children}
    </ProductsContext.Provider>
  );
};
// Custom hook
export const useProducts = () => useContext(ProductsContext);
