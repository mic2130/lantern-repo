<lantern-icon>

<<<<<<< HEAD
<!-- <button type="button" name="button" onclick={ flyLantern } style="position:absolute; left:90%">Complete a Task</button> -->
<div class="lanternDiv">
  <div class="x" onclick={ parent.showSidebar } style=" bottom:{ bottomVal }%; transition: bottom 1s;">
    <img onclick={ showDetails } src="../img/tr.png" class="lantern">
  </div>

</div>

<!-- <div class="lantern" onclick={ showSidebar } style=" bottom:{ bottomVal }%; transition: bottom 1s;"> -->
<!-- left:{leftVal}%; -->
  <!-- <img  src="../img/lanternA.png" alt=""> -->
</div>


  <script>
    var that = this;
    var database = firebase.database();

    this.leftVal = Math.floor(Math.random() * 50 + 40);;
    // this.bottomVal = 40;

    this.showDetails = function() {
      var openRef = firebase.database().ref('LanternList/' + this.id + '/listShown');
      openRef.set(true);
      console.log("this.showDetails");
    }



    // get steps array from FB
      var stepsRef = database.ref('LanternList/' + this.id + '/steps');
      var allSteps;
      var stepsDone;
      var decimal;
      var bottomVal;


      stepsRef.on('value', function (snapshot) {
        var data = snapshot.val();
        var stepsArray = [];
        for (var key in data) {
          stepsArray.push(data[key]);
        }
        that.allSteps = stepsArray.length;
        console.log("all steps:", that.allSteps);

        var doneSteps = stepsArray.filter(function(x){
          return x.done;
        })
        that.stepsDone = doneSteps.length;
        console.log("done steps:", that.stepsDone);
        that.decimal = that.stepsDone/that.allSteps;
        that.bottomVal = that.decimal*100;
        console.log("bottom Val =", that.bottomVal);
      });




    // flyLantern(){
    //   console.log(this.tasks.length);
    //   this.eachDistance = 70 / this.tasks.length;
    //   this.bottomVal = this.bottomVal + this.eachDistance
    //   if (this.bottomVal > 85) {
    //     this.bottomVal = 85;
    //   }
    // }

  </script>


  <style>
		:scope {
      display: block;
      height: 100%;
		}

    h2 {
      font-family: work sans;
      font-weight: 500;
      color: #C9C9C9;
    }

    h4 {
      font-family: work sans;
      font-weight: 400;
      color: #C9C9C9;
    }

    p {
      font-family: work sans;
      font-weight: 300;
      color: #C9C9C9;
      letter-spacing: 0.5px;
      font-size: 18px;
    }

    .x {
      position: absolute;
    }

    .lantern {
      -webkit-animation-name:lantern;
      -webkit-animation-duration: 2.5s;
      animation-name: lantern;
      animation-iteration-count: infinite;
      max-width:120px;
      max-height:120px;
      margin: auto;
      align-self: flex-end;
    }

    @-webkit-keyframes lantern {
      0%   {background: url("../img/lanternA.png");}
      25%  {background: url("../img/lanternB.png");}
      50%  {background: url("../img/lanternC.png");}
      100% {background: url("../img/lanternB.png");}
    }

    .lanternDiv {
      display: flex;
      align-items: flex-end;
      min-height: 100%;
      position: relative;
    }


/*COLORS:
=======
    <div class="lantern" style="width:150px; height:150px; position: absolute; left:{leftVal}%; bottom:{ bottomVal }%; transition: bottom 1s" onclick={ showSidebar }></div>

    </div>

    <script>
        this.leftVal = Math.floor(Math.random() * 50 + 40);
        this.bottomVal = 15;
        this.tasks = [{}, {}, {}, {}, {}];
        this.showSidebar = function () {
            parent.sidebarShown = true;
            console.log("sidebar show called");
        }

        // lantern height control
        flyLantern() {
            console.log(this.tasks.length);
            this.eachDistance = 70 / this.tasks.length;
            this.bottomVal = this.bottomVal + this.eachDistance
            if (this.bottomVal > 85) {
                this.bottomVal = 85;
            }
        }

        this.on('update', function () {
            console.log('CHECKINGLANTERN:', this);
        });

        this.on('mount', function () {
            console.log('MOUNT:', this);
        })
    </script>

    <style>
        :scope {
            display: block;
        }

        h2 {
            font-family: work sans;
            font-weight: 500;
            color: #C9C9C9;
        }

        h4 {
            font-family: work sans;
            font-weight: 400;
            color: #C9C9C9;
        }

        p {
            font-family: work sans;
            font-weight: 300;
            color: #C9C9C9;
            letter-spacing: 0.5px;
            font-size: 18px;
        }

        hr.line1 {
            border-top: 1px solid #C9C9C9;
        }

        hr.line2 {
            border-top: 0.5px solid #2C3440;
        }

        button.basic {
            font-family: work sans;
            font-weight: 400;
            color: #2C3440;
            background: #C9C9C9;
            border-radius: 10px;
            border: none;
        }

        img.lanternIcon {
            display: inline;
            width: 18px;
        }

        img.stateIcon {
            display: inline;
            width: 28px;
            position: absolute;
            right: 30px;
        }

        .hide {
            display: none;
        }

        .lantern {
            background: url("../img/lanternA.png");
            -webkit-animation-name: lantern;
            -webkit-animation-duration: 2.5s;
            animation-name: lantern;
            animation-iteration-count: infinite;
            -webkit-transform: perspective(1px) translateZ(0);
            transform: perspective(1px) translateZ(0);
            box-shadow: 0 0 1px transparent;
            -webkit-transition-duration: 0.5s;
            transition-duration: 0.5s;
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

        /*COLORS:
>>>>>>> yr2314
Font Gray: #C9C9C9
Font Dark Gray: #2C3440
Sidebar Gray: #242D39
Cyan Highlighted boxes: #3AC8C6
Highlighted orange: #FD5800
*/

        /*FONT WEIGHT:
Semibold: 500
Medium: 400 (Subtitle like lantern, texts in boxes, buttons)
Regular: 300 (lists and texts )
Light: 200 (inside input boxes)
*/

    </style>

</lantern-icon>
