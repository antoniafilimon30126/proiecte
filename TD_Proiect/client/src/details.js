document.addEventListener('DOMContentLoaded', function() {
  new Vue({
    el: '#details',
    data: {
      id: null,
      product: {},
      totalProducts: 0 // to store the total number of products
    },
    created() {
      const urlParams = new URLSearchParams(window.location.search);
      this.id = parseInt(urlParams.get('id'));
      this.fetchProduct();
      this.fetchTotalProducts(); // get the total number of products
    },
    methods: {
      fetchProduct() {
        axios.get(`http://localhost:3000/makeup/${this.id}`)
          .then(response => {
            this.product = response.data;
          })
          .catch(error => {
            console.error(error);
          });
      },
      fetchTotalProducts() {
        axios.get('http://localhost:3000/makeup')
          .then(response => {
            this.totalProducts = response.data.length;
          })
          .catch(error => {
            console.error(error);
          });
      },
      previousProduct() {
        if (this.id > 1) {
          this.id -= 1;
          this.updateUrl();
          this.fetchProduct();
        }
      },
      nextProduct() {
        if (this.id < this.totalProducts) {
          this.id += 1;
          this.updateUrl();
          this.fetchProduct();
        }
      },
      updateUrl() {
        const newUrl = `${window.location.pathname}?id=${this.id}`;
        window.history.pushState({ path: newUrl }, '', newUrl);
      },
      exitToMainPage() {
        window.location.href = 'index.html';
      }
    }
  });
});
