<template>
  <div class="cart">
    <div class="title">
      {{cart.title}}
    </div>

    <div class="image">
      <img :src="cart.src" />
      <div class="img-cover" />
    </div>

    <div class="price">
      Price: {{cart.price}}$
    </div>

    <counter :value="amount" :max="cart.limit" @decrease="decrease" @increase="increase" />

    <div class="price-total">
      <span>Total:</span>
      <span>{{totalPrice}} $</span>
    </div>

    <div class="reset-wrapper">
      <button class="reset" @click.stop="reset">Reset</button>
    </div>
  </div>
</template>

<script>

import {mapState, mapGetters, mapMutations} from 'vuex'
import counter from './counter'

export default {
  name: 'cart',

  components: {
    counter
  },
  
  props: {
    cart: {
      type: Object,
      default: () => {}
    }
  },

  data() {
    return {
      amount: 0,
    }
  },

  computed: {
    ...mapState(['products']),

    totalPrice() {
      return this.cart.price * this.amount;
    }      
  },

  methods: {
    ...mapMutations(['decreaseTotal', 'increaseTotal', 'decreaseAmount']),

    setAmoun(amount) {

      this.amount > amount ?
        this.decrease(this.cart.price):
        this.increase(this.cart.price);

      this.amount = amount;
    },

    decrease() {
      this.amount--;
      this.decreaseTotal(this.cart.price);
    },

    increase() {
      this.amount++;
      this.increaseTotal(this.cart.price);
    },

    reset() {
      this.decreaseAmount({amount: this.amount, price: this.cart.price})
      this.amount = 0;
    }
  }  
}
</script>


<style lang="scss" scoped>

.cart {
  background: #fff;
  box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  width: 288px;
  margin: 0 auto 1rem;
  padding: 8px;

  .title {
    font-family: georgia;
    font-size: 1.25rem;    
    color: #000;
    background: #f0f0f0;
    letter-spacing: 1px;
    text-align: center;
    height: 64px;
    line-height: 24px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0.5rem;
  }

  .image {
    position: relative;
    padding: .5rem;

    img {
      width: 100%;
      height: 240px;
      object-fit: scale-down;
    }  

    .img-cover {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
    }
  }
  
  .price {
    font-size: 1.25rem;
    color: #fff;
    background: #000;
    text-align: center;
    padding: 0.5rem 0;
  }
  
  .price-total {
    font-size: 1rem;
    color: #404040;
    background: #fff;
    border: 1px solid #a0a0a0;
    border-radius: .25rem;
    text-align: center;
    display: flex;
    justify-content: space-between;
    margin: .5rem 0;
    padding: .5rem .5rem;
  }
    
  .reset-wrapper {
    background: #FFCDD2;
    padding: 0.5rem;
    text-align: center;
    .reset {
      font-size: 1rem;
      color: #fff;
      background: #E53935;
      box-shadow: 0 2px 4px rgba(0,0,0,0.4);
      border: none;
      border-radius: 8px;
      outline: none;
      height: 32px;
      line-height: 32px;
      padding: 0 1.5rem;
      cursor: pointer
    }
  }
}
</style>
