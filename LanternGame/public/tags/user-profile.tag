<user-profile>

<div id="profileHome">
  <div class="userProfileSection">
    <img src={ userProfileData.picture }/>
    <h2>{ userProfileData.name }</h2>
    <hr class="line1">
  </div>


<div class="lanternListSection">
  <h4>Lanterns</h4>
  <hr class="line2">

  <!--TAG lantern here-->
  <lantern each={ lanternList }></lantern>
  <button class="basic" type="button" name="createLanternButton" onclick={ createLantern }>Create a new lantern</button>
  <div>
  </div>

</div>
</div>

<!-- SECTION create Lanterns  -->

<!-- GOAL -->
<div id="setGoal" class="hide">
  <button type="button" name="cancel" onclick={ cancelCreateLantern}>cancel</button>
  <p>Let's start lighting the way to achieve your goal.</p>
  <img src="http://placehold.it/100x100" alt="Placeholder for lantern image">
  <p>What is your goal?</p>
  <input ref="goal" class="lanternInput" class="input" type="text" placeholder="Enter Goal" onkeypress={ addLantern }>
  <button type="button" name="button" onclick={ goToSetDeadline }>next</button>
</div>

<!-- DEADLINE -->
<div id="setDeadline" class="hide">
  <button type="button" name="cancel" onclick={ cancelCreateLantern}>cancel</button>
  <p>Congratualations for your lanterns! Let's set a deadline for it.</p>
  <img src="http://placehold.it/100x100" alt="Placeholder for lantern image">
  <p>When do you want this goal to come true?</p>
  <input ref="deadline" class="lanternDateInput" type="date" name="deadline" value="yyyy-MM-dd">
  <button type="button" name="back" onclick={ backToSetGoal }>back</button>
  <button type="button" name="next" onclick={ goToSetSteps }>next</button>
</div>

<!-- STEPS -->
<div id="setSteps" class="hide">
  <button type="button" name="cancel" onclick={ cancelCreateLantern}>cancel</button>
  <p>One small steps at a time. Let's break it out!</p>
  <p>What small concrete steps do you want to make this goal come true?</p>
  <div>
    <p>Steps</p>
    <!-- step-input tags -->
      <step-input each={ stepObjects } opts={ data }></step-input>
    <!-- button that creates step-input tags -->
    <img type="button" src="http://placehold.it/30x30" alt="Plus another task" onclick={ makeStepObject }>
  </div>
  <button type="button" name="back" onclick={ backToSetDeadline }>back</button>
  <button type="button" name="next" onclick={ goToSetFirstDeadline }>next</button>
</div>

<div id="setFirstDeadline" class="hide">
  <h2>When do you want to complete your first step by?</h2>
  <h3>Your first step:</h3>
  <p>{ firstStep }</p>
  <input ref="firstStepDeadline" class="firstStepDeadlineInput" type="date" name="deadline" value="yyyy-MM-dd">
  <button type="button" name="cancel" onclick={ cancelCreateLantern}>cancel</button>
  <button type="button" name="back" onclick={ backToSetSteps }>back</button>
  <button type="button" name="button" onclick={ completeLantern }>Complete my Lantern!</button>
</div>

</div>



  <script>
    console.log('x', this);
    var that = this;

    // `this.steps = [{...},{...},{...}];` // Start with three step objects. Each time the button is pushed, create a `stepObject` and `push()` it to the `this.steps` array. Your template will use the `each` special attribute.  `<step-input each={ steps }></step-input>`.

    this.stepObjects = [
      {done:false, order:1, step:""},
      {done:false, order:2, step:""},
      {done:false, order:3, step:""}
    ];

    makeStepObject = function() {
      var x = {done:false, order: that.stepObjects.length + 1, step:""};
      that.stepObjects.push(x);
    };



    console.log("test");

    this.userProfileData = {
      name: "Fiore",
      picture: "http://placehold.it/50x50"
    };

    this.createLantern = function() {
      document.querySelector('#profileHome').classList.add('hide');
      document.querySelector('#setGoal').classList.remove('hide');
    }

    this.goToSetDeadline = function() {
      document.querySelector('#setGoal').classList.add('hide');
      document.querySelector('#setDeadline').classList.remove('hide');
    }

    this.goToSetSteps = function() {
      document.querySelector('#setDeadline').classList.add('hide');
      document.querySelector('#setSteps').classList.remove('hide');
    }

    var firstStep;

    this.goToSetFirstDeadline = function() {
      document.querySelector('#setSteps').classList.add('hide');
      document.querySelector('#setFirstDeadline').classList.remove('hide');
      that.firstStep = that.stepObjects[0].step;
    }

    this.backToSetGoal = function() {
      document.querySelector('#setGoal').classList.remove('hide');
      document.querySelector('#setDeadline').classList.add('hide');
    }

    this.backToSetDeadline = function() {
      document.querySelector('#setDeadline').classList.remove('hide');
      document.querySelector('#setSteps').classList.add('hide');
    }

    this.backToSetSteps = function() {
      document.querySelector('#setSteps').classList.remove('hide');
      document.querySelector('#setFirstDeadline').classList.add('hide');
    }

    this.cancelCreateLantern = function(){
      document.querySelector('#profileHome').classList.remove('hide');
      document.querySelector('#setGoal').classList.add('hide');
      document.querySelector('#setDeadline').classList.add('hide');
      document.querySelector('#setSteps').classList.add('hide');
      document.querySelector('#setFirstDeadline').classList.add('hide');
      document.querySelector('.lanternInput').value = "";
      document.querySelector('.lanternDateInput').value = "yyyy-MM-dd";
      document.querySelector('.firstStepDeadlineInput').value = "yyyy-MM-dd";
      that.stepObjects = [{},{},{}];
    }

    // database.ref(). = userProfileData

    this.lanternListData = [];
    this.stepList = [];
    this.lanternList = [];


// IN CASE WE WANT TO SAVE STEPS BEFORE SAVING LANTERN
    // saveSteps() {
    //   ref('lantern/-key/steps').set(stepObjects);
    // }


  completeLantern(){
    // that.stepList.push(that.opts.data);
    // that.update();
    var newLantern = {};
      newLantern.goal = that.refs.goal.value; //grab the user goal value
      newLantern.done = false;
      newLantern.deadline = that.refs.deadline.value;
      newLantern.steps = that.stepObjects;
      newLantern.nextStep = that.refs.firstStepDeadline.value;
      console.log(newLantern);

      var database = firebase.database() //shortcut to the firebase
      var lanternListRef = database.ref('LanternList');
      var newKey = lanternListRef.push().key;
      newLantern.id = this.newKey;
      lanternListRef.child(newKey).set(newLantern);
      that.lanternList.push(newLantern);
    //another way of write the last line: database.ref('x/' + newKey).set(newLantern);

      document.querySelector('#profileHome').classList.remove('hide');
      document.querySelector('#setFirstDeadline').classList.add('hide');


  }

  // Object.values(x) <-- throw in the object

  </script>



  <style>

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

    button.basic {
      font-family: work sans;
      font-weight: 400;
      color: #2C3440;
      background: #C9C9C9;
      border-radius: 10px;
      border: none;
      padding: 3px;
      padding-left: 10px;
      padding-right: 10px;
    }

    button.basic:hover {
      font-family: work sans;
      font-weight: 400;
      color: #2C3440;
      background: #2C3440;
      border-radius: 10px;
      border: none;
      padding: 3px;
      padding-left: 10px;
      padding-right: 10px;
    }

    .hide {
      display: none;
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

    /*notes styles */
    p.notes {
      color: magenta;
      font-size: 10px;
      font-family: courier;
    }


  </style>





</user-profile>
