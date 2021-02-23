function commission (){
  const clickPriceForm = document.getElementById("item-price")
  clickPriceForm.addEventListener("keyup", () => {
    const commissionPrice = clickPriceForm.value;
    const addTaxPrice = document.getElementById("add-tax-price")
    const addProfitPrice = document.getElementById("profit")
    addTaxPrice.innerHTML = Math.floor(commissionPrice * 0.1);
    addProfitPrice.innerHTML = Math.floor(commissionPrice * 0.9);
  });
}
window.addEventListener('load', commission);