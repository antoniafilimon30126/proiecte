new Vue({
  el: '#update',
  data: {
    id: null,
    product: {
      name: '',
      brand: '',
      price: 0,
      category: '',
      color: '',
      stock: 0,
      rating: 0,
      description: '',
      imageURL: ''
    },
    message: ''
  },
  created() {
    const urlParams = new URLSearchParams(window.location.search);
    this.id = urlParams.get('id');
    this.fetchProduct();
  },
  methods: {
    fetchProduct() {
      axios.get(`http://localhost:3000/makeup/${this.id}`)
        .then(response => {
          this.product = response.data;
        })
        .catch(error => {
          console.error(error);
          this.message = 'Error fetching product';
        });
    },
    updateProduct() {
      axios.put(`http://localhost:3000/makeup/${this.id}`, this.product)
        .then(() => {
          this.message = 'Product updated successfully';
        })
        .catch(error => {
          console.error(error);
          this.message = 'Error updating product';
        });
    }
  }
});
