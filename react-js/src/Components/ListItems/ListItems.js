import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom';
import './ListItems.css'
import { baseUrl } from '../BaseVariable/BaseVariable';
import { Item } from './Item';


export const ListItems = ( ) => {
  const [bookList,setBookList]=useState([]);
  const {category} = useParams();
  
  console.log("ListBook render");

  console.log("ListBook category",category);
  const callUrl=baseUrl+"/service/ricercalistejson?webfunction=ricercaPergenere&genere="+(category?category:"5050")+"&startRow=1&ricercaPage=4";
  //console.log("call with "+callUrl);  
 
  const listBooksCall= () => {
  
  axios.post(callUrl)
  .then(function (response){
    console.log("response list book response",response.data);
    setBookList(response.data);
  })
  .catch(function (error){

    console.log("error post list book",error)
  })
  .finally(function(){console.log("finally")});


  } ;
 useEffect(()=>{
  listBooksCall();
 },[category])



  return (
    <section className="itemsContainer">{
      bookList.map((item,index)=>
       <Item name={index} book={item} i={index}/>
      )}
    
    </section>

    )
  
}



  



