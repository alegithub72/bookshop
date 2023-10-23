
import React from 'react'

import './item.css'
import { context } from '../BaseVariable/BaseVariable'

 export const Item = ({book,i}) => {
    return (
      <div className='item'>
        <img src={"/"+context+"/img/book"+(i+1)+".jpg"} ></img>
        {book.titolo}

        <p style={{fontSize: "small"}}>Autore:{book.autore.nome} {book.autore.cognome}</p>    
        <p style={{fontSize: "small"}}>Editore:{book.edizione.editore} ,{book.dataPublicazione}</p>    
    </div>
    )
  }