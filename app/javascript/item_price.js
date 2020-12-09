window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = taxPrice

    const addPriceDom = document.getElementById("profit");
    const profitPrice = Math.floor(inputValue - taxPrice);
    addPriceDom.innerHTML = profitPrice
  })
})