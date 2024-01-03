import { useState } from 'react';
import axios from 'axios';
import './App.css';


export default function App() {
  const [message, setMessage] = useState('Click the button to load data!')
  function fetchData(path) {
    axios.get(path)
    .then((response) => {
      // handle success
      console.log(response.data)
      console.log(response.data.message)
      setMessage(response.data.message);})
    .catch((error) => {
      console.log(error)
      setMessage(error.response.data)
    });
  }

  return (
    <div className="App">
      <h1>{ message }</h1>
      <div className="row">
      <div>
        <button onClick={() => {fetchData('/api/data')}} >
          Fetch Public Data
        </button>
      </div>
      <div>
        <button onClick={() => {fetchData('/api/private_data')}} >
          Fetch Private Data
        </button>
      </div>
      </div>

    </div>
  );
}
