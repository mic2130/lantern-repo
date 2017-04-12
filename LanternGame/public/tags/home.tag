<home>

    <sidebar></sidebar>

    <div class="alllanterns" >
      <img class="lantern" src="../img/lanternicon.png" style="position: absolute; left:{leftVal}%; bottom:{ bottomVal }%; transition: bottom 1s" >
      <button type="button" name="button" onclick={ flyLantern } style="position:absolute; left:90%">Complete a Task</button>
    </div>

    <script>
        var that = this;
        console.log("test home");
        this.leftVal = Math.floor(Math.random() * 50 + 40);;
        this.bottomVal = 15;
        this.tasks = [{},{},{},{},{}];

        flyLantern(){
          console.log(this.tasks.length);
          this.eachDistance = 85 / this.tasks.length;
          this.bottomVal = this.bottomVal + this.eachDistance
          if (this.bottomVal > 90) {
            this.bottomVal = 90;
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


    </style>

</home>
