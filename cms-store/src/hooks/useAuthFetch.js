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

    let response = null;
    let data = null;

    try {
      response = await fetch(url, {
        method,
        headers,
        body: body ? JSON.stringify(body) : null,
      });

      const contentType = response.headers.get("content-type") || "";

      if (contentType.includes("application/json") && response.status !== 204) {
        try {
          data = await response.json();
        } catch (parseError) {
          console.warn("JSON parse failed:", parseError);
          data = null;
        }
      }

      if (!response.ok) {
        throw new Error(data?.message || `HTTP error: ${response.status}`);
      }

      return { error: null, data };
    } catch (error) {
      console.error("authFetch error:", error);
      return { error, data: null };
    } finally {
      setLoading(false);
    }
  };

  return { authFetch };
};
