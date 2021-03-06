<lantern-icon>

    <div class="lanternDiv">
        <div class="x" onclick={ parent.showSidebar } style="bottom:{ bottomVal }%; transition: bottom 1s;">
            <img show={!congrat} onclick={ showDetails } src="../img/tr.png" class="lantern">
            <img class="lanternTwo" show={ congrat } src="../img/deco.png">
        </div>
    </div>


    <script>
        var that = this;
        this.user = firebase.auth().currentUser;
        var database = firebase.database() //shortcut to the firebase
        console.log("i'm here");
        //
        this.leftVal = Math.floor(Math.random() * 50 + 40);
        this.bottomVal = 40;
        this.showDetails = function () {
            var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
            openRef.set(true);
            console.log("this.showDetails");
        };


        // get steps array from FB
        var stepsRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/steps');
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

            var doneSteps = stepsArray.filter(function (x) {
                return x.done;
            })
            that.stepsDone = doneSteps.length;
            console.log("done steps:", that.stepsDone);
            that.decimal = that.stepsDone / that.allSteps;
            that.bottomVal = that.decimal * 100;
            console.log("bottom Val =", that.bottomVal);
        });

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
            -webkit-animation-name: lantern;
            -webkit-animation-duration: 2.5s;
            animation-name: lantern;
            animation-iteration-count: infinite;
            max-width: 120px;
            max-height: 120px;
            margin: auto;
            align-self: flex-end;
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

        .lanternDiv {
            display: flex;
            align-items: flex-end;
            min-height: 100%;
            position: relative;
        }
        .lanternTwo {
          /*margin-top: 50%;*/
          /*margin-bottom: -65px;*/
          max-width: 110px;
        }

        /*COLORS:
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
