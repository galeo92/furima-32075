window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    // addTaxDom.innerHTML = $(function(){
    //   $("item-price").on('keyup', function(){
    //     var price = $("item-price").val();
    //     if( 300 <= price && price <= 9999999) {
    //     var fee = Math.floor(price / 10);
    //     var profit = (price - fee);
    //     $(".fee-span").text(fee);
    //     $(".profit-span").text(profit);
    //     }else{
    //     $(".fee-span").text('');
    //     $(".profit-span").text('');
    //     }
    const taxPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = taxPrice

    const addPriceDom = document.getElementById("profit");
    const profitPrice = Math.floor(inputValue - taxPrice);
    addPriceDom.innerHTML = profitPrice
  })
})