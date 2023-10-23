import React from 'react'
import { context } from '../BaseVariable/BaseVariable';
export const Avatar=()=> {



    const avatarStyle = {
      display: "flex",
      flexDirection: "column",
      paddingRight: "10px"
      //   height:"30px" 
    };
  
    const accediStyle = {
      position: "absolute",
      top: "16px",
      right: "-6px",
      fontSize:"small"
  
    };
    
    return (
  
      <div style={avatarStyle}>
        <div style={{ float: "left", position: "relative", marginLeft: "10px" }} >
          <img id="omino" src={"/"+context+"/img/outomino.png"} style={{ marginRight: "0px", marginTop: "0px", paddingBottom: "0px" }} width="35px" height="30px" />
          <a id="accedi" href="#" style={accediStyle} >Accedi</a>
        </div>
  
      </div>
  
  
    );
  }

