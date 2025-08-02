import React, { useEffect, useState } from "react";
import { toast } from "react-toastify";
import { useAuthFetch } from "../../hooks/useAuthFetch";
import { API_ENDPOINTS } from "../../config/api";
import { useProducts } from "../../context/ProductsContext";

function AddNewProduct() {
  const { getAllProduct } = useProducts();
  const { authFetch } = useAuthFetch();
  const [categories, setCategories] = useState([]);
  const [newProductTitle, setNewProductTitle] = useState("");
  const [newProductPrice, setNewProductPrice] = useState("");
  const [newProductCount, setNewProductCount] = useState("");
  const [newProductImg, setNewProductImg] = useState("");
  const [newProductColors, setNewProductColors] = useState("");
  const [newProductDesc, setNewProductDesc] = useState("");
  const [selectedCategoryID, setSelectedCategoryID] = useState("");

  useEffect(() => {
    getCategories();
  }, []);

  const getCategories = async () => {
    const { error, data } = await authFetch(API_ENDPOINTS.CATEGORIES)
    if(error) {
      console.log("Server Error" + error);
      
    }else {
      setCategories(data)
    }
  };

  const createSlugUrl = (title) => {
    return title
      .trim()
      .replace(/[^a-zA-Z0-9\s-]/g, "") // Remove non-English letters and special characters
      .replace(/\s+/g, "-") // Replace spaces with hyphens
      .toLowerCase();
  };

  const createNewProduct = async (event) => {
    event.preventDefault();

    // Check if all required product fields are provided
    if (
      !newProductTitle ||
      !newProductPrice ||
      !newProductCount ||
      !newProductImg ||
      !newProductColors ||
      !selectedCategoryID
    ) {
      toast.error("Please fill all required fields", {
        position: "bottom-left",
        autoClose: 3000,
      });
      return;
    }

    // Construct new product object
    const newProduct = {
      title: newProductTitle,
      price: newProductPrice,
      count: newProductCount,
      img: newProductImg,
      popularity: 100,
      sale: 0,
      colors: newProductColors,
      url: createSlugUrl(newProductTitle),
      productDesc: newProductDesc,
      categoryID: selectedCategoryID,
    };

    // Send request to backend
    const { error, data } = await authFetch(
      API_ENDPOINTS.PRODUCTS,
      "POST",
      newProduct
    );

    // Handle response
    if (error) {
      toast.error("Error! product not creat", {
        position: "bottom-left",
        autoClose: 3000,
      });
    } else {
      console.log(data);
      getAllProduct();
      emptyInputs();
      toast.success("Success! product created", {
        position: "bottom-left",
        autoClose: 3000,
      });
    }
  };

  const emptyInputs = () => {
    setNewProductTitle("");
    setNewProductPrice("");
    setNewProductCount("");
    setNewProductImg("");
    setNewProductColors("");
    setNewProductDesc("");
  };

  return (
    <div className="mt-8 md:mt-10 lg:mt-14">
      <h3 className="table-title">Add new product</h3>
      <form
        action="#"
        className="flex flex-col mt-3 md:mt-5 bg-white items-center md:items-end p-3 md:p-5 rounded-2xl gap-y-4"
      >
        <div className="wrapper w-full grid grid-cols-1 md:grid-cols-2 gap-x-4 gap-y-2.5">
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <input
              type="text"
              placeholder="Product title"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              value={newProductTitle}
              onChange={(e) => setNewProductTitle(e.target.value)}
            />
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <input
              type="text"
              placeholder="Product price"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              value={newProductPrice}
              onChange={(e) => setNewProductPrice(e.target.value)}
            />
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <input
              type="text"
              placeholder="Product count"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              value={newProductCount}
              onChange={(e) => setNewProductCount(e.target.value)}
            />
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <input
              type="text"
              placeholder="Product image addres"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              value={newProductImg}
              onChange={(e) => setNewProductImg(e.target.value)}
            />
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <input
              type="text"
              placeholder="Product number of colors"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              value={newProductColors}
              onChange={(e) => setNewProductColors(e.target.value)}
            />
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <select
              className="flex justify-between bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              id="category"
              value={selectedCategoryID}
              onChange={(e) => setSelectedCategoryID(e.target.value)}
            >
              <option value="" disabled>
                Select category
              </option>
              {categories.length ? (
                categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>
                    {cat.title}
                  </option>
                ))
              ) : (
                <></>
              )}
            </select>
          </div>
          <div className="input-wrapper w-full flex items-center bg-[#f0f0f0] px-5 rounded-xl">
            <textarea
              type="text"
              className="bg-inherit outline-0  border-0 w-full px-2 py-2.5 text-base"
              placeholder="Product description ..."
              value={newProductDesc}
              onChange={(e) => setNewProductDesc(e.target.value)}
            ></textarea>
          </div>
        </div>
        <button
          className="btn-blue w-3/4 sm:w-3/5 md:w-auto"
          onClick={createNewProduct}
        >
          Create product
        </button>
      </form>
    </div>
  );
}

export default AddNewProduct;
