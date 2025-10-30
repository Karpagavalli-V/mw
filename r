import React, { useState } from "react";

function App() {

  const products = [
    { id: 1, name: "Pen", price: 10 },
    { id: 2, name: "Book", price: 50 },
    { id: 3, name: "Bag", price: 100 }
  ];

  const [search, setSearch] = useState("");

  const [cart, setCart] = useState([]);

  function addToCart(item) {
    setCart([...cart, item]); 
  }

  function removeFromCart(id) {
    setCart(cart.filter((c) => c.id !== id)); 
  }

  const filtered = products.filter((p) =>
    p.name.toLowerCase().includes(search.toLowerCase())
  );

  const total = cart.reduce((sum, item) => sum + item.price, 0);

  return (
    <div>
      <h2>Simple E-Commerce App</h2>

      <input
        placeholder="Search..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      <h3>Products</h3>
      {filtered.map((p) => (
        <div key={p.id}>
          {p.name} - ₹{p.price}
          <button onClick={() => addToCart(p)}>Add</button>
        </div>
      ))}

      <h3>Cart</h3>
      {cart.length === 0 ? (
        <p>No items in cart</p>
      ) : (
        cart.map((c) => (
          <div key={c.id}>
            {c.name} - ₹{c.price}
            <button onClick={() => removeFromCart(c.id)}>Remove</button>
          </div>
        ))
      )}
      
      <h4>Total: ₹{total}</h4>
    </div>
  );
}
export default App;
