import React from 'react'
import { useParams } from 'react-router-dom';
export const About = () => {
  const {category} = useParams();
  console.log("category",category);
  return (
    <div>About {category}</div>
  )
}
