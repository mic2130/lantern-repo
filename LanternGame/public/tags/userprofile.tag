<userprofile>

<div class="userProfile">

  <div show={profileHome} id="profileHome">
      <div class="userProfileSection">

        <h2>  <img style="width:20%; border-radius: 50%" src={ user.photoURL }/> {user.displayName}</h2>
          <hr class="line2">
      </div>


      <div>
          <h4>Lanterns</h4>
          <hr class="line1">

          <!--TAG lantern here-->
          <lantern each={ lanternList }></lantern>
          <button type="button" name="createLanternButton" onclick={ createLantern }>Create a new lantern</button>

      </div>
      </div>

<!-- SECTION create Lanterns  -->

<!-- GOAL -->
<div show={setGoal}>
  <p class="message">Let's start lighting the way to achieve your goal.</p>
  <img class="formLantern" src="../img/formLantern.png">
  <p class="submessage">What is your long-term goal?</p>
  <input ref="goal" class="lanternInput" class="input" type="text" placeholder="You Goal Here" onkeypress={ addLantern }>
  <br>
  <button type="button" name="cancel" onclick={ parent.cancelCreateLantern}>back</button>
  <button class="nextBtn" type="button" name="button" class="nextBtn" onclick={ goToSetDeadline }>next</button>
</div>

<!-- DEADLINE -->
<div show={setDeadline}>
  <p class="message">That sounds like a great goal! Let's set a deadline for it.</p>
  <img class="formLantern" src="../img/formLantern.png">
  <p class="submessage">What will be the deadline?</p>
  <input ref="deadline" class="lanternDateInput" type="date" name="deadline" value="yyyy-MM-dd">
  <button type="button" name="back" onclick={ backToSetGoal }>back</button>
  <button class="nextBtn" type="button" name="next" onclick={ goToSetSteps }>next</button>
</div>

<!-- STEPS -->
<div show={setSteps}>
  <p class="message">One small step at a time. Let's break it out!</p>
  <p class="submessage">What small concrete steps do you want to make this goal come true?</p>
  <div>
    <p class="submessage" style="text-align: left; font-size: 18px; margin-left: 5px;">Steps:</p>
    <!-- step-input tags -->
      <step-input each={ stepObjects } opts={ data }></step-input>
    <!-- button that creates step-input tags -->
    <img type="button" src="../img/plus.png" class="plusBtn" onclick={ makeStepObject }>
  </div>
  <button type="button" name="back" onclick={ backToSetDeadline }>back</button>
  <button type="button" name="next" class="nextBtn" onclick={ goToSetFirstDeadline }>next</button>
</div>

<div show={setFirstDeadline}>
  <p class="message">When do you want to complete your first step by?</p>
  <p class="submessage" style="margin-top: 50px;">Your first step:</p>
  <p class="submessage" style="color: #FFD700;">{ firstStep }</p>
  <input style="margin-bottom: 60px; margin-top: 30px;" ref="firstStepDeadline" class="firstStepDeadlineInput" type="date" name="deadline" value="yyyy-MM-dd">
  <button type="button" name="back" onclick={ backToSetSteps }>back</button>
  <button type="button" name="button" onclick={ completeLantern } style="margin-left: 115px;">Complete my Lantern!</button>
</div>




</div>



  <script>
    var that = this;
    this.user = firebase.auth().currentUser;

    this.profileHome=true;
    this.setGoal=false;
    this.setDeadline=false;
    this.setDeadline=false;
    this.setFirstDeadline=false;

		this.lanternList = this.opts.lanterns;

    // `this.steps = [{...},{...},{...}];` // Start with three step objects. Each time the button is pushed, create a `stepObject` and `push()` it to the `this.steps` array. Your template will use the `each` special attribute.  `<step-input each={ steps }></step-input>`.

    this.stepObjects = [
      {DL:"", done:false, order:1, step:""},
      {DL:"", done:false, order:2, step:""},
      {DL:"", done:false, order:3, step:""}
    ];

    makeStepObject = function() {
      var x = {done:false, order: that.stepObjects.length + 1, step:""};
      that.stepObjects.push(x);
    };

    this.createLantern = function () {
        this.profileHome=false;
        this.setGoal=true;
    }

    this.goToSetDeadline = function () {
      this.setGoal=false;
      this.setDeadline=true;
    }

    this.goToSetSteps = function () {
      this.setDeadline=false;
      this.setSteps=true;
    }

    var firstStep;

    this.goToSetFirstDeadline = function () {
      this.setSteps=false;
      this.setFirstDeadline=true;
        that.firstStep = that.stepObjects[0].step;
    }

    this.backToSetGoal = function () {
      this.setGoal=true;
      this.setDeadline=false;
    }

    this.backToSetDeadline = function () {
      this.setDeadline=true;
      this.setSteps=false;
    }

    this.backToSetSteps = function () {
      this.setSteps=true;
      this.setFirstDeadline=false;
    }


    this.lanternListData = [];
    this.stepList = [];




    completeLantern() {
        // that.stepList.push(that.opts.data); that.update();
        var newLantern = {};
        newLantern.goal = that.refs.goal.value; //grab the user goal value
        newLantern.done = false;
        newLantern.deadline = that.refs.deadline.value;
        newLantern.steps = that.stepObjects;
        newLantern.steps[0].DL = that.refs.firstStepDeadline.value;
        newLantern.setNextDeadline=false;
        newLantern.listShown=false;
        newLantern.congrat=false;
        newLantern.userID=this.user.uid;
        var database = firebase.database() //shortcut to the firebase
        var userLanternListRef = database.ref('userLanternList/'+ this.user.uid);
        var newKey = userLanternListRef.push().key;
        newLantern.lanternID = newKey;
        userLanternListRef.child(newKey).set(newLantern);
        //read only goal/lantern id to publicLanternList
        var newPublicLantern={};
        newPublicLantern.goal=that.refs.goal.value;
        newPublicLantern.lanternID=newKey;
        var publicLanternListRef=database.ref('publicLanternList');
        publicLanternListRef.child(newKey).set(newPublicLantern);
        //read goal/deadline/userName
        var newUserPublicLantern={};
        newUserPublicLantern.goal=that.refs.goal.value;
        newUserPublicLantern.deadline=that.refs.deadline.value;
        newUserPublicLantern.userID=this.user.uid;
        newUserPublicLantern.userName=this.user.displayName;
        newUserPublicLantern.lanternID=newKey;
        var userPublicLanternListRef=database.ref('userPublicLanternList');
        userPublicLanternListRef.child(newKey).set(newUserPublicLantern);
        //another way of write the last line: database.ref('x/' + newKey).set(newLantern);
        this.profileHome=true;
        this.setFirstDeadline=false;
        this.profileHome=true;
        this.setGoal=false;
        this.setDeadline=false;
        this.setSteps=false;
        this.setFirstDeadline=false;
        this.refs.goal.value="";
        this.refs.deadline.value="yyyy-MM-dd";
        this.refs.firstStepDeadline.value="yyyy-MM-dd";
        that.stepObjects = [{}, {}, {}];
    }

	this.on('update', function(event){
	  this.lanternList = this.opts.lanterns;
	});

  </script>



  <style>

    .userProfile {
      padding-left: 30px;
      padding-right: 30px;
      padding-bottom: 30px;
      overflow:hidden;
    }

    p {
      color: #C9C9C9;
    }

    ol {
      color: #C9C9C9;
    }

    h2 {
      font-family: work sans;
      font-weight: 500;
      color: #C9C9C9;
    }

    h3 {
      font-family: work sans;
      font-weight: 450;
      color: #C9C9C9;
    }

    h4 {
      font-family: work sans;
      font-weight: 400;
      color: #C9C9C9;
    }

    hr.line1 {
      border-top: 1px solid #C9C9C9;
    }

    hr.line2 {
      border-top: 0.5px solid #2C3440;
    }

    button {
      font-family: work sans;
      font-weight: 500;
      color: #2C3440;
      background: #C9C9C9;
      border-radius: 18px;
      border: none;
      padding-left: 13px;
      padding-right: 13px;
      padding-top: 8px;
      padding-bottom: 8px;
      font-size: 15px;
    }

    button:hover {
      font-family: work sans;
      font-weight: 500;
      color: #2C3440;
      background: #7A7A7A;
      border-radius: 18px;
      border: none;
      padding-left: 13px;
      padding-right: 13px;
      padding-top: 8px;
      padding-bottom: 8px;
      font-size: 15px;
    }



    .plusBtn {
      max-width: 30px;
      margin-bottom: 10px;
      margin-left:310px;
    }

    .nextBtn {
      margin-left: 250px;
    }


    .hide {
      display: none;
    }

    .formLantern {
      width: 200px;
      margin-left: 80px;
      margin-top: 20px;
      margin-bottom: 20px;
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

    input {
      color: #C9C9C9;
      background-color: transparent;
      border: #C9C9C9 3px solid;
      padding: 10px;
      margin-bottom: 25px;
      font-size: 16px;
      font-family: work sans;
      text-align: center;
      margin-left: 40px;
      width: 300px;
    }

    /*COLORS:
    Font Creme: #C9C9C9
    Font light gray: #C9C9C9
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

</userprofile>
