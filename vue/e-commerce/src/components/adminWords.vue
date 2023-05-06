<template>
    <div class="commentt d-none d-lg-flex">
        <img src="../images/admin words.png" alt="">
        <div class="doubleqoutes"><i class="fa-solid fa-quote-left qoutess"></i></div>
        <div class="absolutee">
            <p>"Nunc vulputate odio vitae sapien euismod rhoncus. Vestibulum ante orci, elemet molestie sed, 
                efficitur a augue. Quisque placerat laoreet lorem"
            </p>
            <h4>Kareem Ayman</h4>
            <h5>CEO OF TTCM</h5>
        </div>
    </div>
</template>
<style scoped>
.commentt{
    position: relative;
    width: 100%;
    overflow-y: hidden;
    max-width: 100%;
    margin: 10vh auto;
    background-color: black;
}
.commentt img{
    opacity: 0.5;
}
.doubleqoutes{
    position: absolute;
    top: 25%;
    left: 50%;
}
.absolutee{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.qoutess{
    color: #e13ed7;
    margin-bottom: 2vh;
    font-size: 24px;
}
.absolutee p{
    margin: 2vh auto;
    text-align: center;
    color: white;
    margin-bottom: 3vh;
    text-shadow: 2px 2px 15px black;
}
.absolutee h4,h5{
    margin: 1vh auto;
    text-align: center;
    color: white; 
    text-shadow: 2px 2px 15px black;

}
.absolutee h5{
    color: #dcdbdb;
    font-size: 16px;
}
</style>