<template>
    <div class="colections">
        <div class="left">
            <div class="firstImage abs">
                <img src="../images/coll.png" alt="collections">
                <RouterLink to="/Women" class="viewColl" @click="scrollTop">VIEW COLLECTION</RouterLink>
            </div>
            <div class="pag">
                <h5>HOT COLLECTION</h5>
                <h3>NEW TREND FOR WOMEN</h3>
                <p>Wholesaler of clothing, footwear and accessories for men, women and children since 2009. We change with fashion! WoW clothing wholesale warehouse. Explore Collections.</p>
                <RouterLink to="/all" class="startShopping" @click="scrollTop">Shop Now</RouterLink>
            </div>
        </div>
        <div class="right">
            <div class="firstImage abs">
                <img src="../images/coll2.png" alt="">
                <RouterLink to="/Women" class="viewColl" @click="scrollTop">VIEW COLLECTION</RouterLink>
            </div>
            <div class="firstImage abs">
                <img src="../images/coll3.png" alt="">
                <RouterLink to="/Men" class="viewColl" @click="scrollTop">VIEW COLLECTION</RouterLink>
            </div>
        </div>
    </div>
</template>
<style scoped>
    .colections{
        display: flex;
        width: 85% !important;
        max-width: 100%;
        justify-content: center;
        margin: auto;
        padding: 5vh 0;
    }
    .left{
        margin-right: 5vh;
    }
    .firstImage{
        background: black;
        overflow: hidden;
        margin-bottom: 3vh;
    }
    .firstImage img{
        z-index: 1;
        -webkit-transition: all 0.3s linear;
        -moz-transition: all 0.2s linear;
         -ms-transition: all 0.2s linear;
          -o-transition: all 0.2s linear;
             transition: all 0.2s linear;
    }
    .firstImage img:hover{
        opacity: 0.5;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.563);
    }
    .left h5{
        font-weight: 400;
        letter-spacing: 10px;
        color: #e13ed7;
    }
    .left h3,p{
        letter-spacing: 1px;
        color: #505050;
    }
    .left p{
        margin-bottom: 3.5vh;
    }
    .startShopping{
        text-decoration: none;
        border: 2px solid #868383;
        color: #505050;
        padding: 1vh 3.5vh;
        cursor: pointer;
        transition-duration: 0.3s;
    }
    .startShopping:hover{
        color: white;
        background-color: black;
        border: 2px solid black;
    }
    .right .firstImage{
        margin-bottom: 5vh;
    }
    .abs{
        position: relative;
        text-align: center;
    }
    .viewColl{
        text-decoration: none;
        color: white;
        padding: 1.5vh 2.5vh;
        border: 2px solid white;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0;
        transition: 0.3s;
    }
    .viewColl:hover{
        background-color: white;
        color: black;
    }
    .abs:hover .viewColl{
        opacity: 1;
    }
    @media screen and (max-width: 1200px){
        .colections{
            flex-direction: column;
        }
        .left{
            display: flex;
            flex-direction: column-reverse;
            margin-right: 0vh;
            margin: auto;
            width: 100%;
            text-align: center;
        }
        .firstImage img{
            width: 100%;
        }
        .startShopping{
            margin-bottom: 10vh;
        }
        .viewColl{
            width: 55%;
        }
        .pag{
            padding-bottom: 5vh;
        }
    }
    @media screen and (max-width: 800px){
        .colections{
            flex-direction: column;
        }
        .left{
            display: flex;
            flex-direction: column-reverse;
            margin-right: 0vh;
            margin: auto;
            width: 100%;
            text-align: center;
        }
        .firstImage img{
            width: 100%;
        }
        .startShopping{
            margin-bottom: 10vh;
        }
        .viewColl{
            width: 55%;
        }
        .pag{
            padding-bottom: 5vh;
        }
    }
    @media screen and (max-width: 480px){
        .colections{
            flex-direction: column;
        }
        .left{
            display: flex;
            flex-direction: column-reverse;
            margin-right: 0vh;
            margin: auto;
            width: 100%;
            text-align: center;
        }
        .firstImage img{
            width: 100%;
        }
        .startShopping{
            margin-bottom: 10vh;
        }
        .viewColl{
            width: 55%;
        }
        .pag{
            padding-bottom: 5vh;
        }
    }
   /* @media screen and (max-width: 1200px){
        .colections{
            flex-direction: column;
        }
        .left{
            display: flex;
            margin-right: 0vh;
            margin: auto;
            width: 100%;
            justify-content: center;
            text-align: center;
        }
        .firstImage img{
            width: 100%;
        }
        .startShopping{
            margin-bottom: 10vh;
        }
        .viewColl{
            width: 55%;
        }
        .pag{
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 45%;
            padding-left: 5vh;
        }
    }*/
    
</style>
<script>
export default {
    methods : {
        scrollTop(){
            window.scrollTo(0, 60);
        }
    }
}
</script>