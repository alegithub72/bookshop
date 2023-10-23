import React from 'react'
import { context } from '../BaseVariable/BaseVariable';
const Cart = () => {
    const cartStyle = {
      position: "absolute",
      left: "0px",
      top: "10px",
      color: "darkblue",
      paddingRight: "20px",
      fontSize:"small"
    };

    return (
      <div style={{ float: "left", position: "relative" }} >
        <img src={"/"+context+"/img/cart2.png"} width="35px" height="35px" />
        <span id="cartItems" style={cartStyle} >5</span>
      </div>
    )
  
  }

export default Cart