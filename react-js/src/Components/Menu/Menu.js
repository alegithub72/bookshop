
import { useEffect, useState } from 'react';

import React from 'react'
import { Link } from 'react-router-dom';
import Cart from './Cart';
import { Avatar } from './Avatar';
import SubMenu from './SubMenu';
import './Menu.css' ;
import { context } from '../BaseVariable/BaseVariable';


export const Menu = (props) => {
  console.log("props.listItems", props.listItems);
  const [subMenuState, setSubMenuState] = useState('close')
  const { bkColor, fColor, bannerW, bannerH, bannerImg, bannerImgMobile, fSize } = props;
  //let dropdown=-1;


  const closeStateMenu = function () {

    setCodeSubMenu("close");
    console.log("closeStateMenu", subMenuState)
  }


  let latestClick = "-1";
  const [codeSubMenu, setCodeSubMenu] = useState("-1");
  const dropDownMenu = (e) => {
    e.preventDefault();
    console.log("e", e.target.href);
    console.log("e.target.name", e.target.name);
    console.log("latestClick", latestClick);

    //setCodeSubMenu(e.target.name);
    setCodeSubMenu(previousState => {
      let newState = "-1";
      if (previousState !== e.target.name) {
        newState = e.target.name
      }
      setSubMenuState('open');
      return newState;
    });

  }

  useEffect(() => {
    console.log("rerender Menu")
  }, [codeSubMenu])

// backgroundImage: `url(/${context}/img/banner.png)`
  return (
    <div id="menuId" style={{ backgroundColor: bkColor, height: "215px", fontSize: fSize ,width:"100%"}} >
      <div id="banner" class="bannerStyle" style={{backgroundImage: `url(/${context}/img/banner.png)`}} >
{/*         <img src="im banner.png" width="100%" style={{ height: '175px', margin: '0 0 0 0' }} /> */}
      </div>


      <div class="menusIconStyle">
        <ul class="menusStyle">
          {props.listItems.map((item, index) =>
            <li key={"mainLi" + index} class="menusItemStyle">
              <a style={{ color: fColor }} href="#" onClick={dropDownMenu} name={index} >{item.label}</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
              <SubMenu dropdown={codeSubMenu == index} subMenuState={subMenuState} closeStateMenu={closeStateMenu} fColor={fColor} bkColor={bkColor} listItems={item.subMenuItems} code={index} />
            </li>
          )}
        </ul>

        <Cart />
        <Avatar />
      </div>

    </div>

  );
}



