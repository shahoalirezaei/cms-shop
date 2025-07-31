import { useContext } from "react";
import LoadingContext from "../context/LoadingContext";

export const useAuthFetch = () => {
  const { setLoading } = useContext(LoadingContext);

  const authFetch = async (url, method = "GET", body = null) => {
    setLoading(true);
    const headers = {
      "Content-Type": "application/json",
      Authorization: `Bearer ${localStorage.getItem("token")}`,
    };

    try {
      const response = await fetch(url, {
        method,
        headers,
        body: body ? JSON.stringify(body) : null,
      });

      let data = null;

      // فقط در صورتی که بدنه داشته باشه بخون
      const contentType = response.headers.get("content-type");
      if (contentType && contentType.includes("application/json")) {
        data = await response.json();
      }

      if (!response.ok) {
        throw new Error(data?.message || "Something went wrong");
      }

      return { error: null, data };
    } catch (error) {
      return { error, data: null };
    } finally {
      console.log("Request finished, setting loading false");
      setLoading(false);
    }
  };

  return { authFetch };
};

// export const useAuthFetch = () => {
//   const { setLoading } = useContext(LoadingContext);

//   const authFetch = async (url, method = "GET", body = null) => {
//     setLoading(true);
//     const headers = {
//       "Content-Type": "application/json",
//       Authorization: `Bearer ${localStorage.getItem("token")}`,
//     };

//     try {
//       const response = await fetch(url, {
//         method,
//         headers,
//         body: body ? JSON.stringify(body) : null,
//       });

//       const data = await response.json();

//       if (!response.ok) {
//         throw new Error(data.message || "Something went wrong");
//       }

//       return { error: null, data };
//     } catch (error) {
//       return { error, data: null };
//     } finally {
//       setLoading(false); // در پایان، چه موفق چه خطا
//     }
//   };

//   return { authFetch };
// };
