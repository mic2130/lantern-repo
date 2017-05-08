<lantern>

    <div class="container2">
        <img class="lanternIcon item1" src="img/lanternicon.png" alt="lantern icon">
        <!-- <img class="stateIcon" src="img/notdone.png" alt="state icon" onclick={ showDetails }> -->
        <p class="item2" onclick={ showDetails }>{ goal }</p>
            <br>
        <img class="progressImg" show={congrat} src="../img/done.png">
        <img class="progressImg" show={!congrat} src="../img/notdone.png">
        <span class="glyphicon glyphicon-collapse-down item3" onclick={ showDetails } show={ !listShown }></span>
        <span class="glyphicon glyphicon-collapse-up item3" show={ listShown } onclick={ hideDetails }></span>
    </div>
    <div show={ listShown }>
        <div show={ lanternDetail}>
            <br>
            <p style="font-weight:600;">Steps:</p>
            <hr class="line3">
          <div><step each={ step, i in steps }></step></div>
          <div show={!congrat}>
            <table>
              <tr>
                <th>
                  <p class="circle">{ daysLeft } days left</p>
                </th>
                <th>
                  <p style="font-weight:500; display: inline;">Deadline:
                      <span style="font-weight:200;">{ deadline }</span>
                  </p>
                </th>
              </tr>
            </table>
          </div>

        </div>
        <div show={congrat} class="congrat">
            <p class="message">Congratulations for completing your goal!</p>
            <!-- <img style="width:20%" src="../img/girllantern.png" id="girl"> -->
        </div>
        <!-- <button type="button" onclick={ deleteLantern }>Delete Lantern</button> -->
        <span class="glyphicon glyphicon-trash" style="margin-top: 7px; margin-left: 370px;" onclick={ deleteLantern}></span>
    </div>
    <div show={ setNextDeadline} class="setNext">
        <p>
            GREAT JOB! When do you want<br>to complete your next step by?</p>
        <input style="margin-bottom: 10px; margin-top:5px; margin-left: 0px; margin-right: 10px; max-width: 250px;" ref="nextStepDeadline" type="date" name="nextStepDeadline" value="yyyy-MM-dd">
        <button type="button" name="button" onclick={ completeNextStep }>Go!</button>
    </div>



    <hr class="line2">

</div>

<script>
    var that = this;
    var daysLeft;
    var nextDeadline;
    var nextStepTitle;
    this.user = firebase.auth().currentUser;
    this.lanternDetail = true;

    //setting each step's deadline
    var currentStepRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/steps');
    currentStepRef.on('value', function (snapshot) {
        var data = snapshot.val();
        var stepsArray = [];
        for (var key in data) {
            stepsArray.push(data[key]);
        }
        that.allSteps = stepsArray.length;
        var nextSteps = stepsArray.filter(function (x) {
            return !x.done;
        });
        var stepsNot = nextSteps.length;
        var nextGo = that.allSteps - stepsNot;
        that.number = nextGo;
        console.log("heieie", that.allSteps);
    });

    completeNextStep(event) {
        var newStepDeadline = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/steps/' + that.number + '/DL');
        var newDDL = that.refs.nextStepDeadline.value;
        newStepDeadline.set(newDDL);
        var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
        openRef.set(true);
        var openNext = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/setNextDeadline');
        openNext.set(false);
    }

    var deadlineRef = firebase.database().ref('userLanternList/' + this.userID + '/' + this.lanternID + '/deadline');
    var deadline;
    var days;
    var daysToday;
    var daysLeft;

    deadlineRef.on('value', function (snapshot) {
        var deadlineFB = snapshot.val();
        that.update();
        that.deadline = deadlineFB;
        that.daysDL = ((Date.parse(that.deadline)) / (1000 * 60 * 60 * 24));
        that.daysToday = ((Date.now()) / (1000 * 60 * 60 * 24));
        that.daysLeft = Math.ceil(that.daysDL - that.daysToday);
    });

    this.showDetails = function () {
        var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
        openRef.set(true);
        var openNext = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/setNextDeadline');
        openNext.set(false);

    }
    this.hideDetails = function () {
        var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
        openRef.set(false);
        var openNext = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/setNextDeadline');
        openNext.set(false);

    }

    updateSteps() {
      console.log("updatesteps called");
        var stepsRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/steps');
        var step = event.item.step;
        step.done = !step.done;
        stepsRef.set(this.steps);
        if (that.number < that.allSteps) {
            var openNext = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/setNextDeadline');
            openNext.set(true);
            var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
            openRef.set(false);
            var openCon = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/congrat');
            openCon.set(false);
        }else if (that.number = that.allSteps) {
            var openCon = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/congrat');
            openCon.set(true);
            var openRef = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/listShown');
            openRef.set(false);
        }
    }

    this.deleteRefThree = function () {
        var lanternRefThree = firebase.database().ref('userPublicLanternList/' + this.lanternID);
        lanternRefThree.set(null);
    }

    deleteLantern() {
        if (confirm("Are you sure you want to delete this lantern?")) {
            var openNext = firebase.database().ref('userLanternList/' + this.user.uid + "/" + this.lanternID + '/setNextDeadline');
            openNext.set(null);
            var lanternRef = firebase.database().ref('userLanternList/' + that.user.uid + "/" + this.lanternID);
            lanternRef.set(null);
            var lanternRefTwo = firebase.database().ref('publicLanternList/' + that.lanternID);
            lanternRefTwo.set(null);
            that.deleteRefThree();
            that.update();
        };
    }
</script>

<style>

    :scope {
        overflow: hidden;
    }
    .congrat {
        text-align: center;
        margin-top: 20px;
    }
    .setNext {
        /*text-align: center;*/
        background-color: rgba(0, 0,0, 0.1);
        padding-top: 15px;
        padding-bottom: 15px;
        padding-left: 35px;
        margin-top: 10px;
        margin-bottom: 10px;
        font-size: 6px;
        font-weight: 250;
    }
    .item2 span {
        font-size: 1.8vw;
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

    p,
    span {
        font-family: work sans;
        font-weight: 350;
        color: #C9C9C9;
        letter-spacing: 0.5px;
        font-size: 16px;
        margin-top: 0px;
    }

    hr.line1 {
        border-top: 1px solid #C9C9C9;
    }

    hr.line2 {
        border-top: 2px solid #495362;
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

    .glyphicon {
        font-size: 20px;
        color: #C9C9C9;
    }
    .glyphicon:hover {
      font-size: 20px;
      color: #7A7A7A;
    }

    .container2 {
        display: flex;
        justify-content: space-between;
    }

    .item1 {
        flex-grow: 1;
        max-width: 25px;
        max-height: 32px;
        min-width: 25px;
        min-height: 32px;
        width: 100%;
        height: 100%;
    }

    .item2 {
        margin-left: 17px;
        margin-right: 17px;
        flex-grow: 2;
        min-width: 295px;
        color: #65c6c5;
    }

    .item3 {
        flex-grow: 1;
    }
    .message {
        color: #485860;
        font-family: work sans;
        background-color: #3AC8C6;
        font-weight: 500;
        font-size: 22px;
        text-align: center;
        max-width: 375px;
        padding: 15px;
    }

    .submessage {
        color: #C9C9C9;
        font-family: work sans;
        font-size: 22px;
        text-align: center;
        font-weight: 300;
        padding: 10px;
    }

    button.basic {
        font-family: work sans;
        font-weight: 400;
        color: #2C3440;
        background: #C9C9C9;
        border-radius: 10px;
        border: none;
    }

    .circle {
        width: 190px;
        height: 30px;
        /*border-radius: 50%;*/
        color: #FD5800;
        font-family: work sans;
        font-weight: 400;
        letter-spacing: 0.5px;
        font-size: 18px;
        padding-top: 8px;
        margin-left: 25px;
    }

    .progressImg {
      max-height: 23px;
      margin-right: 10px;
    }
    .line3 {
			border-top: 0.5px solid #C9C9C9;
			margin: 3px;
		}

    .message {
      color: #485860;
      font-family: work sans;
      background-color: #3AC8C6;
      font-weight: 500;
      font-size: 22px;
      text-align: center;
      max-width: 375px;
      padding: 15px;
    }

</style>

</lantern>
