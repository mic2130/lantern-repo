<user-profile>


<div class="userProfileSection">
  <img src={ userProfileData.picture }/>
  <h2>{ userProfileData.name }</h2>
  <hr class="line1">
</div>

<div class="lanternListSection">
  <h4>Lanterns</h4>
  <hr class="line2">

  <!--TAG LANTERN HERE-->
  <lantern each={ lanternListData }></lantern>

  <button class="basic" type="button" name="newLanternButton">Create a new lantern</button>
</div>



  <script>
    console.log("test");

    this.userProfileData = {
      name: "Zoe Lander",
      picture: "http://placehold.it/50x50"
    };

    this.lanternListData = [{
      goal: "Learn to code",
      done: true //true = the user finished / false = the user is working
    },{
      goal: "Make a portfolio",
      done: false
    },{
      goal: "Become a healthy person",
      done: true
    }
  ];



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
    Font light gray:
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





</user-profile>
