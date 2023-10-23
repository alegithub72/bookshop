import React from 'react'
import { useState,useEffect } from 'react'
import { Link } from 'react-router-dom'
const SubMenu=(props) =>{
    console.log("MenuList dropdown",props)

    let menuon='none';
    console.log("MenuList subMenuState",props.subMenuState)
      if(props.dropdown && props.subMenuState==='open' ){
        console.log("opens submenu");
         menuon='inline'
      }
       else {

        menuon='none';
      }

    console.log("menuon",menuon)
    const subMainMenusStyle = {
      //position:"relative",
      marginBlockEnd: "0",
      marginBlockStart: "0",
      backgroundColor: "trasparent",
      // flexWrap: "nowrap",
      display: "flex",
      flexDirection: "column",
      listStyleType: "none",
      padding: "0 0 0 0",
      // width: "90%",
      //display:menuon
    };
  
  
    let subMenuStyle = {
      display: "flex",
      flexDirection: "column",
      backgroundColor: props.bkColor,
      justifyContent: "center",
      display: menuon,
      margin: "4px 0px 2px 0",
      alignText: "center",
      fontSize:"1em",
      zIndex:"100"
    }
  




    return (
      <div style={subMainMenusStyle}>  
        <ul style={subMainMenusStyle}>
        {props.listItems.map(
          (item, index) => <li key={"subMenuLi"+index} style={subMenuStyle}>
            <Link style={{color:props.fColor}} to={item.link+"/"+item.id}  menuon={menuon} onClick={props.closeStateMenu} name={index} >{item.tipologia}</Link>
           
            </li>
        )}
  
      </ul>
      </div>
    
    )
  
  
  
  
  }


  

export default SubMenu
