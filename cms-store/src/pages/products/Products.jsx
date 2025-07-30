import React, { useEffect, useState } from "react";
import AddNewProduct from "../../components/addNewProduct/AddNewProduct";
import ProductsTable from "../../components/productsTable/ProductsTable";
import { useAuthFetch } from "../../hooks/useAuthFetch";
import { API_ENDPOINTS } from "../../config/api";



function Products() {
  const [allProduct, setAllProducts] = useState([]);
  const { authFetch } = useAuthFetch();

  useEffect(() => {
    getAllProduct();
  }, []);

  const getAllProduct = async () => {
    const { error, data } = await authFetch(
      API_ENDPOINTS.PRODUCTS
    );

    if (error) {
      console.error("Fetch error:", error);
    } else {
      const reverseData = [...data].reverse();
      setAllProducts(reverseData);
    }

  };

  return (
    <div>
      <AddNewProduct getAllProduct={getAllProduct} />
      <ProductsTable allProduct={allProduct} getAllProduct={getAllProduct} />
    </div>
  );
}

export default Products;
