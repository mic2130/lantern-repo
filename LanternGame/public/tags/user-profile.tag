<user-profile>

  <div class="userProfileSection">
    <img src={ userProfileData.picture }/>
    <h2>{ userProfileData.name }</h2>
    <hr class="line1">
  </div>


<div class="lanternListSection">
  <h4>Lanterns</h4>
  <p class="notes" >NOTE, HI! HI! currently the imput send value to the firebase. Works only with KEY 13 enter, not with the button</p>
  <hr class="line2">

  <!--TAG LANTERN HERE-->
  <lantern each={ lanternListData }></lantern>

</div>


<div class="createLanternForm"> <!--This eventually will be a separete form with many questions-->
  <input type="text" placeholder="Enter Goal" onkeypress={ addLantern }>
  <button class="basic" type="button" name="newLanternButton" onclick={ addLantern }>Create a new lantern</button>
</div>




  <script>
    console.log("test");

    this.userProfileData = {
      name: "Fiore",
      picture: "http://placehold.it/50x50"
    };

    this.lanternListData = [];

  //   this.lanternListData = [{
  //     goal: "Learn to code",
  //     done: true //true = the user finished / false = the user is working
  //   },{
  //     goal: "Make a portfolio",
  //     done: false
  //   },{
  //     goal: "Become a healthy person",
  //     done: true
  //   }
  // ];





  addLantern(event){
    var newLantern = {};
    if (event.which === 13){
      newLantern.goal = event.target.value; //grab the user goal value
      newLantern.done = false;
    //  this.lanternListData.push(newLantern); //pushes newLantern to the LanternListData list (we change this to push to the data base instead of the data list above)


    var database = firebase.database() //shortcut to the firebase
    var xRef = database.ref('LanternList');
    var newKey = xRef.push().key;
    xRef.child(newKey).set(newLantern);
    //another way of write the last line: database.ref('x/' + newKey).set(newLantern);

      event.target.value = ""; //reset input value
      event.target.focus(); //focus back on input
    }
  }

  </script>



  <style>

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
