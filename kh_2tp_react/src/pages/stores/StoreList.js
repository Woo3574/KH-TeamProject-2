import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import AxiosApi from "../../api/AxiosApi";

const StoreList = () => {
  const [stores, setStores] = useState([]);

  // 전체 매장 조회
  useEffect(() => {
    const getStoreList = async () => {
      try {
        const response = await AxiosApi.getStoreList();
        setStores(response);
      } catch (error) {
        console.error("전체 매장 조회 오류 : ", error);
      }
    };
    getStoreList();
  }, []);

  return (
    <>
      <h1>Store List</h1>
      <ul>
        {stores.map((store) => (
          <li key={store.storeNo}>
            <Link to={`/stores/${store.storeNo}`}>{store.storeName}</Link>
          </li>
        ))}
      </ul>
    </>
  );
};

export default StoreList;
