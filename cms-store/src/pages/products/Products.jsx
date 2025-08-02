import React, { useEffect, useState } from "react";
import AddNewProduct from "../../components/addNewProduct/AddNewProduct";
import ProductsTable from "../../components/productsTable/ProductsTable";
import { useAuthFetch } from "../../hooks/useAuthFetch";
import { API_ENDPOINTS } from "../../config/api";



function Products() {
  // const [allProduct, setAllProducts] = useState([]);
  // const { authFetch } = useAuthFetch();

  // useEffect(() => {
  //   console.log("Running useEffect to get all products");
  //   getAllProduct();
  // }, []);

  // const getAllProduct = async () => {
  //   const { error, data } = await authFetch(
  //     API_ENDPOINTS.PRODUCTS
  //   );

  //   if (error) {
  //     console.error("Fetch error:", error);
  //   } else {
  //     const reverseData = Array.isArray(data) ? [...data].reverse() : [];

  //     // const reverseData = [...data].reverse();
  //     console.log("Calling authFetch for products");
  //     setAllProducts(reverseData);
  //   }

  // };

  return (
    <div>
      <AddNewProduct />
      <ProductsTable />
    </div>
  );
}

export default Products;
