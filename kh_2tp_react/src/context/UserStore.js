import { createContext, useState } from "react";
export const UserContext = createContext(null);

const UserStore = (props) => {
  const [userId, setUserId] = useState("");
  const [userPw, setUserPw] = useState("");

  return (
    <UserContext.Provider
      value={{
        userId,
        userPw,
      }}
    >
      {props.children}
    </UserContext.Provider>
  );
};
export default UserStore;
