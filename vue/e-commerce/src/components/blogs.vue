<template>
    <div class="heading">
        <hr>
        <h3 class="title">LATEST BLOGS</h3>
        <hr>
    </div>
    <div class="blogs">
        <div class="card">
            <img src="../images/blog1.png" alt="">
            <h2>Headline Here</h2>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Neque repudiandae quibusdam consectetur totam est maiores assumenda consequuntur,
                 exercitationem quod unde hic nulla quos voluptas tempora. Error provident dolor libero tempore.
            </p>
            <RouterLink to="" class="startShopping">Read More</RouterLink>
        </div>
        <div class="card">
            <img src="../images/blog2.png" alt="">
            <h2>Headline Here</h2>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Neque repudiandae quibusdam consectetur totam est maiores assumenda consequuntur,
                 exercitationem quod unde hic nulla quos voluptas tempora. Error provident dolor libero tempore.
            </p>
            <RouterLink to="" class="startShopping">Read More</RouterLink>
        </div>
        <div class="card">
            <img src="../images/blog3.png" alt="">
            <h2>Headline Here</h2>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Neque repudiandae quibusdam consectetur totam est maiores assumenda consequuntur,
                 exercitationem quod unde hic nulla quos voluptas tempora. Error provident dolor libero tempore.
            </p>
            <RouterLink to="" class="startShopping">Read More</RouterLink>
        </div>
    </div>
</template>
<style scoped>
.heading{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 15vh ;
    margin-bottom: 5vh;
}
hr{
    width: 30%;
    height: 0.6vh;
    background-color: black;
    margin: 0 2vh;
}
.title{
    font-family: 'Roboto', sans-serif;
    text-align: center;
    font-weight: 700;
}
.blogs{
    width: 85%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin-bottom: 5vh;
}
.card{
    display: flex;
    flex-direction: column;
    margin: 0 2vh;
    border: none;
    text-align: center;
}
.card h2{
color: #505050;
margin: 1vh 0;
}
.card p{
    color: #767171;
}
.startShopping{
    width: 50%;
    text-decoration: none;
    border: 2px solid #868383;
    color: #505050;
    padding: 1vh 3vh;
    cursor: pointer;
    transition-duration: 0.3s;
    margin: auto;
}
.startShopping:hover{
    color: white;
    background-color: black;
    border: 2px solid black;
}
@media screen and (max-width: 1100px) {
   .startShopping {
    width: 90%;
   }
}
@media screen and (max-width: 900px) {
    .blogs{
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
    }
    .card{
        margin: 2vh;
    }
    .startShopping {
        width: 50%;
       }
}
@media screen and (max-width: 480px) {
    .blogs{
        display: flex;
        flex-direction: column;
    }
    .card{
        margin: 1.5vh auto;
        width: 100%;
    }
    .startShopping {
        width: 50%;
       }
}
</style>