document.addEventListener('DOMContentLoaded', function() {
  new Vue({
    el: '#app',
    data: {
      products: [],
      newProduct: {
        name: '',
        brand: '',
        price: 0,
        category: '',
        color: '',
        stock: 0,
        rating: 0,
        description: '',
        imageURL: ''
      }
    },
    created() {
      this.fetchProducts();
    },
    methods: {
      fetchProducts() {
        axios.get('http://localhost:3000/makeup')
          .then(response => {
            this.products = response.data;
          })
          .catch(error => {
            console.error(error);
          });
      },
      createProduct() {
        axios.post('http://localhost:3000/makeup', this.newProduct)
          .then(() => {
            this.fetchProducts();
          })
          .catch(error => {
            console.error(error);
          });
      },
      deleteProduct(id) {
        axios.delete(`http://localhost:3000/makeup/${id}`)
          .then(() => {
            this.fetchProducts();
          })
          .catch(error => {
            console.error(error);
          });
      }
    }
  });
});
