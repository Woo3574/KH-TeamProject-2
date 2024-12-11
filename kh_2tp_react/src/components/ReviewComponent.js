import styled from "styled-components";

export const ReviewContainer = styled.div`
    margin: 100px auto;
    width: 90%;
`
export const StyledTable = styled.table`
    width: 90%;
    margin: auto;
    text-align: center;
    border: 1px solid #000;
    border-radius: 10px;
    box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
    border-spacing: 15px;
`
// 공통 컨테이너 스타일
export const Container = styled.div`
    width: 50%;
    margin:100px auto;
    text-align: center;
    border: 1px solid #000;
    border-radius: 10px;
    box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
    border-spacing: 15px;
    font-size: 1rem;
    padding: 20px 0;
    h2 { margin: 20px 0; }
`;
export const ReviewUser = styled.input`
    font-size: 1rem;
    field-sizing: content;
    border: none;
    background-color: #FFFFFF00;
    &:focus {
        outline: none;
    }
`
export const ReviewContent = styled.textarea`
    width: 50%;
    height: 43px;
    margin-top: 10px;
    padding: 10px;
    font-size: 1rem;
    resize: none;
    overflow: hidden;
    background-color: #FFFFFF00;
    &:focus {
        outline: none;
    }
`
export const ReviewForm = styled.form`
    display: flex;
    flex-direction: column;
    align-items: center;
    div {
        
    }
`
export const RatingBox = styled.div`
    min-width: 175px;
    width: 22%;
    display: flex;
    flex-direction: column;
`
export const ReviewRating = styled.div`
    display: flex;
    justify-content: space-between;
`
export const ReviewButton = styled.button`
    margin: 20px 0;
    height: 40px;
    aspect-ratio: 9 / 4;
    border-radius: 5px; 
    border: none;
    background-color: ${(props) => (props.disabled ? "#ccc" : "#000")};
    color: ${(props) => (props.disabled ? "#666" : "#fff")};
    cursor: ${(props) => (props.disabled ? "default" : "pointer")};
`