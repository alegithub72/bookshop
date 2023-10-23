
import { Outlet } from 'react-router-dom';
import { Menu } from '../Menu/Menu';
import axios from 'axios';
import { baseUrl } from '../BaseVariable/BaseVariable';
import { useState, useEffect } from 'react';
import './Layout.css'
import React, { Component } from 'react';

export const Layout = () => {
  const [menuListItems, setMenuListItems] = useState([]);
  console.log("Render Layout");
  console.log("baseUrl", baseUrl);
  const loadMenu = () => {
    axios.post(baseUrl + '/service/ricercalistejson?webfunction=generi')
      .then(function (response) {
       let subMenusAddBase = response.data.map((item) => {
          return { link: "/listBook", ...item }

        });

        let list = [{ label: "Home", link: "/", subMenuItems: [] },
        {
          label: "Book List", link: "/listBook",
          subMenuItems: subMenusAddBase
        },
        { label: "About us", link: "/about", subMenuItems: [] },
        { label: "Contact", link: "/contact", subMenuItems: [] }];        
        console.log("subMenusAddBase:", subMenusAddBase);
        setMenuListItems(list);
        console.log("build call menu", list);
      })
      .catch(function (error) {
        // handle error
        console.log(error);
      })
      .finally(function () {
        console.log("Layout call finnaly");
      });

  };



  useEffect(() => {
    loadMenu();
  }, [])


  return (<div className="totalContainer">
    <Menu listItems={menuListItems} bkColor="#cce6ff" fColor="blue" fSize="3vh" />
    <div className="bodyContainer">
      <Outlet></Outlet>
    </div>
  </div>
  )
}
