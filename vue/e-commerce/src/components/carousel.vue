<template>
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" style="position: relative;">
            <img src="../images/thumb-1920-984897.jpg" class="d-block w-100" alt="...">
            <div class="kimo" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
              <h3 class="logo">FASHION</h3>
              <p>JEANS AND CASUAL WEAR UP TO 30% SALE</p>
            </div>
          </div>
          <div class="carousel-item" style="position: relative;">
            <img src="../images/wp6130531.webp" class="d-block w-100" alt="...">
            <div class="kimo" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
              <h5>EVERYTHING WOMEN NEED IS HERE!</h5>
              <p>fashionable outfits</p>
            </div>
          </div>
          <div class="carousel-item" style="position: relative;">
            <img src="../images/woman.png" class="d-block w-100" alt="...">
            <div class="kimo" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
              <h4>Modern Fashion Dresses </h4>
              <p>WITH SALE UP TO 25%</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev buttonn" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon buttonn" aria-hidden="true"></span>
          <span class="visually-hidden buttonn">Previous</span>
        </button>
        <button class="carousel-control-next buttonn" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon buttonn" aria-hidden="true"></span>
          <span class="visually-hidden buttonn">Next</span>
        </button>
      </div>
</template>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
.kimo{
  color: white;
  text-align: center;
    background-color: rgba(137, 43, 226, 0.588);
    padding: 3vh;
    width: 30%;
    margin: auto;
}
.logo{
    font-family: 'Kaushan Script', cursive;
}
.buttonn{
    color: black !important;
    background-color: rgba(0, 0, 0, 0.034) !important;
}
@media screen and (max-width:900px) {
  .kimo{
    width: 77%;
    padding: 2vh;
    font-size: 18px;
  }
}
</style>
