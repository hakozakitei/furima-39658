window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price"); // 金額入力フィールドを取得
  const addTaxDom = document.getElementById("add-tax-price"); // 手数料表示要素を取得
  const profitOutput = document.getElementById("profit"); // 利益表示要素を取得

  priceInput.addEventListener("input", () => {
    const price = priceInput.value; // 入力された金額を取得
    if(price.length == 0) {
      addTaxDom.innerHTML = '';
      profitOutput.innerHTML = '';
      return;
    }
    const fee = Math.floor(price * 0.1); // 手数料（10%として計算）
    const profit = Math.floor(price - fee); // 利益計算

    addTaxDom.innerHTML = fee; // 手数料を表示
    profitOutput.innerHTML = profit; // 利益を表示
  });
});