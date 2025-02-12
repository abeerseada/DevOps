const express = require('express');
const app = express();

// Define a route for '/'
app.get('/', (req, res) => {
  res.send('Hello, Docker with Node.js!');
});

// Start the server
const port = 8080;
app.listen(port, '0.0.0.0', () => {
  console.log(`App running on http://0.0.0.0:${port}`);
});