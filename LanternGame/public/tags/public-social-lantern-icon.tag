<public-social-lantern-icon>

  <div class="lanternDiv">

    <div class="lantern hvr-bounce-in " style="left:{leftVal}%; bottom:{ bottomVal }%">
      <div class="tooltiptext" >
          {goal}
      </div>
    </div>
  </div>


    <script>
    this.user = firebase.auth().currentUser;
        console.log("public-lantern-icon.tag");
        this.leftVal = Math.floor(Math.random() * 90);
        this.bottomVal = Math.floor(Math.random() * 70);
        // this.leftVal = Math.floor(Math.random() * 50 + 40);; this.bottomVal = 15; this.tasks = [{}, {}, {}, {}, {}]; this.showSidebar = function () {     parent.sidebarShown = true;     console.log("sidebar show called"); }
        //
        // // lantern height control flyLantern() {     console.log(this.tasks.length);     this.eachDistance = 70 / this.tasks.length;     this.bottomVal = this.bottomVal + this.eachDistance     if (this.bottomVal > 85) {         this.bottomVal = 85;     }
        // }
        //
        // this.on('update', function () {     console.log('CHECKINGLANTERN:', this); });
        //
        // this.on('mount', function () {     console.log('MOUNT:', this); })
    </script>

    <style>

        .lantern {
            background: url("../img/lanternA.png");
            width: 150px;
            height: 150px;
            position: absolute;
            -webkit-animation-name: lantern;
            -webkit-animation-duration: 2.5s;
            animation-name: lantern;
            animation-iteration-count: infinite;
            -webkit-transform: perspective(1px) translateZ(0);
            transform: perspective(1px) translateZ(0);
            box-shadow: 0 0 1px transparent;
            -webkit-transition-duration: 0.5s;
            transition-duration: 0.5s;
            display:flex;
            align-items:flex-end;
            min-height: 100%;
            position: relative;

        }
        @-webkit-keyframes lantern {
            0% {
                background: url("../img/lanternA.png");
            }
            25% {
                background: url("../img/lanternB.png");
            }
            50% {
                background: url("../img/lanternC.png");
            }
            100% {
                background: url("../img/lanternB.png");
            }
        }
        /*.lantern .tooltiptext{
          display:none;
        }*/
        /*.lantern:hover .tooltiptext{
          display:block;
          position:fixed;
          overflow:hidden;
          background: url("../img/bggg.png");
          color:white;
          margin: 4vw;
          margin-top:15vh;

        }*/
        .lantern:hover .tooltiptext {
            visibility: visible;
            width:6vw;
            height:50vh;
            background: url("../img/shiningLight.png");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            color: white;
            font-size:0.1vw;
            text-align: center;
            border-radius: 6px;
            position: fixed;
            display: block;
            margin: 3vw;
            margin-top:21vh;
            z-index: 1;

        }
        .lantern .tooltiptext {
            visibility: hidden;
        }
        .lanternDiv{

        }

    </style>

</public-social-lantern-icon>
