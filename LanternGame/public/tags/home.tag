<home>

    <sidebar></sidebar>

    <div class="alllanterns" >
      <div class="lantern" style="position: absolute; left:{leftVal}%; bottom:{ bottomVal }%; transition: bottom 1s">
        <img src="../img/lanternA.png" alt="">
      </div>
      <button type="button" name="button" onclick={ flyLantern } style="position:absolute; left:90%">Complete a Task</button>
    </div>

    <div class="avatar" >
      <img src="" alt="">
    </div>

    <script>
        var that = this;
        console.log("test home");
        this.leftVal = Math.floor(Math.random() * 50 + 40);;
        this.bottomVal = 15;
        this.tasks = [{},{},{},{},{}];

        flyLantern(){
          console.log(this.tasks.length);
          this.eachDistance = 70 / this.tasks.length;
          this.bottomVal = this.bottomVal + this.eachDistance
          if (this.bottomVal > 85) {
            this.bottomVal = 85;
          }
        }

    </script>

    <style>

        .alllanterns {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            z-index: 0;
            background: url("../img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        sidebar {
            height: 100%;
            position: fixed;
            top:0;
            left:0;
            z-index: 999;

        }

        .lantern {
          background: url("../img/lanternA.png");
          -webkit-animation-name:lantern;
          -webkit-animation-duration: 2.5s;
          animation-name: lantern;
          animation-iteration-count: infinite;
        }

        @-webkit-keyframes lantern {
          0%   {background: url("../img/lanternA.png");}
          25%  {background: url("../img/lanternB.png");}
          50%  {background: url("../img/lanternC.png");}
          100% {background: url("../img/lanternB.png");}
        }


    </style>

</home>
