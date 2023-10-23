
import './App.css';



import React from 'react';
import {Home} from './Components/Home/Home';
import { About } from './Components/About/About';
import { Contact } from './Components/Contact/Contact';
import { NoPage } from './Components/NoPage/NoPage';
import { Layout } from './Components/Layout/Layout';
import {BrowserRouter,Routes,Route} from 'react-router-dom';
import { ListItems } from './Components/ListItems/ListItems';
import ListNoSelection from './Components/ListItems/ListNoSelection';
import {context} from './Components/BaseVariable/BaseVariable'
export default function App(props) {

  return (
    <BrowserRouter basename={context}>  
    <Routes> 
      <Route  path="/" element={<Layout />} >
        <Route index element={<Home />} />
        <Route path="contact" element={<Contact />} />
        <Route path="about" element={<About />} />
        <Route  path="listBook/:category" element={<ListItems />}  />
        <Route path="*" element={<NoPage />} />)
      </Route>
      </Routes> 
    </BrowserRouter> 
  )  
}
 



