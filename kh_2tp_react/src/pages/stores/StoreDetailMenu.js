import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import AxiosApi from "../../api/AxiosApi";

const StoreDetailMenu = () => {
  const { storeNo } = useParams();
  const [menu, setMenu] = useState([]);

  // 메뉴 조회
  useEffect(() => {
    const getMenus = async () => {
      try {
        const response = await AxiosApi.getMenus(storeNo);
        setMenu(response);
      } catch (error) {
        console.error("메뉴 조회 오류 발생 : ", error);
      }
    };
    getMenus();
  }, []);

  return (
    <>
      {menu.map((item, index) => (
        <div key={index}>
          <img
            src={item.menu.menuImg}
            alt={item.menu.menuName}
            style={{
              height: "15vw",
              objectFit: "contain",
              borderRadius: "20px",
            }}
          />
          <br />
          <p style={{ textAlign: "center" }}>{item.menu.menuName}</p>
          <br />
        </div>
      ))}
    </>
  );
};

export default StoreDetailMenu;
