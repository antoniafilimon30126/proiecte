const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const fs = require('fs');

const app = express();
const port = 3000;
const makeupFilePath = './src/makeup.json';

app.use(bodyParser.json());
app.use(cors());

app.get('/makeup', (req, res) => {
  res.json(getMakeupProducts());
});

app.get('/makeup/:id', (req, res) => {
  const product = getMakeupProductById(req.params.id);
  if (product) {
    res.json(product);
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

app.post('/makeup', (req, res) => {
  const newProduct = req.body;
  const saved = saveMakeupProduct(newProduct);
  if (saved) {
    res.status(201).json({ message: 'Product was saved successfully' });
  } else {
    res.status(500).json({ message: 'Error saving product' });
  }
});

app.put('/makeup/:id', (req, res) => {
  const updatedProduct = req.body;
  const updated = updateMakeupProduct(req.params.id, updatedProduct);
  if (updated) {
    res.json({ message: 'Product was updated successfully' });
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

app.delete('/makeup/:id', (req, res) => {
  const deleted = deleteMakeupProduct(req.params.id);
  if (deleted) {
    res.json({ message: 'Product was deleted successfully' });
  } else {
    res.status(404).json({ message: 'Product not found' });
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

function getMakeupProducts() {
  try {
    const data = fs.readFileSync(makeupFilePath, 'utf8');
    return JSON.parse(data);
  } catch (err) {
    console.error(err);
    return [];
  }
}

function getMakeupProductById(id) {
  const products = getMakeupProducts();
  return products.find(product => product.id == id);
}

function saveMakeupProduct(product) {
  try {
    const products = getMakeupProducts();
    product.id = getMaxId(products) + 1;
    products.push(product);
    fs.writeFileSync(makeupFilePath, JSON.stringify(products, null, 2)); // Formatting JSON with indentation
    return true;
  } catch (err) {
    console.error(err);
    return false;
  }
}

function updateMakeupProduct(id, updatedProduct) {
  try {
    const products = getMakeupProducts();
    const index = products.findIndex(product => product.id == id);
    if (index !== -1) {
      products[index] = { ...updatedProduct, id: parseInt(id) };
      fs.writeFileSync(makeupFilePath, JSON.stringify(products, null, 2)); // Formatting JSON with indentation
      return true;
    } else {
      return false;
    }
  } catch (err) {
    console.error(err);
    return false;
  }
}

function deleteMakeupProduct(id) {
  try {
    let products = getMakeupProducts();
    const initialLength = products.length;
    products = products.filter(product => product.id != id);
    if (products.length < initialLength) {
      fs.writeFileSync(makeupFilePath, JSON.stringify(products, null, 2)); // Formatting JSON with indentation
      return true;
    } else {
      return false;
    }
  } catch (err) {
    console.error(err);
    return false;
  }
}

function getMaxId(products) {
  return products.reduce((max, product) => (product.id > max ? product.id : max), 0);
}
