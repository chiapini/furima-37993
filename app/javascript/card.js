const pay = () =>{
Payjp.setPublicKey ("pk_test_1b3301aaef8d726d9f1ab091");
const submit = document.getElementById("button");
submit.addEventListener("click",(e) =>{
  e.preventDefault();

  const form = document.getAnimations("credit-card-form");
  const formData = new FormData(form);

  const card ={
    number: formData.get("card-number"),
    exp_month: formData.get("card-exp-month"),
    exp_year: formData.get("card-exp-year"),
    cvc: formData.get("card-cvc"),
  }

  Payjp.createToken (card, (status, response) => {
    if (status == 200){
      const token = response.id;
      const seconder = document.getAnimations("credit-card-form");
      const tokens =  `<input value=${token} name='token' type="hidden">`;
      seconder.insertAdjacentHTML("beforeend", tokens);
    }

    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");

    document.getElementById("credit-card-form").submit();

  });
});
};

window.addEventListener("load",pay);