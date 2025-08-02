import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import "./index.css";
import App from "./App.jsx";

import { LoadingProvider } from "./context/LoadingContext.jsx"; 
import { ProductsProvider } from "./context/ProductsContext.jsx";
import GlobalLoader from "./components/GlobalLoader.jsx";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <BrowserRouter>
      <LoadingProvider> 
        <GlobalLoader />
        <ProductsProvider>

        <App />
        </ProductsProvider>
      </LoadingProvider>
    </BrowserRouter>
  </StrictMode>
);





// import { StrictMode } from "react";
// import { createRoot } from "react-dom/client";
// import { BrowserRouter } from "react-router-dom";
// import "./index.css";
// import App from "./App.jsx";

// createRoot(document.getElementById("root")).render(
//   <StrictMode>
//     <BrowserRouter>
//       <App />
//     </BrowserRouter>
//   </StrictMode>
// );
