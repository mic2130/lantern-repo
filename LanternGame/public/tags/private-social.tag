<private-social>
  <div class="container">
      <private-social-lantern-icon each={ publicLanternList }></private-social-lantern-icon>
      <lantern-icon each={ personalLanternList }></lantern-icon>
  </div>



  <script>
  var that=this;
  this.publicLanternList = [];
  this.personalLanternList=[];


  this.user = firebase.auth().currentUser;


  var database = firebase.database() //shortcut to the firebase
  var publicLanternListRef = database.ref('publicLanternList');
  var personalLanternListRef = database.ref('userList/'+this.user.uid);
  // var lanternListRef = database.ref('userList');
  // get lanternList data from Firebase
  publicLanternListRef.on('value', function (snapshot) {
    var data = snapshot.val();
    var lanternsArray = [];
    for (var key in data) {
        lanternsArray.push(data[key]);
    }
    that.publicLanternList = lanternsArray;
    console.log('this.publicLanternList', that.publicLanternList);
    that.update();
  });
  personalLanternListRef.on('value', function (snapshot) {
    var data = snapshot.val();
    var lanternsArray = [];
    for (var key in data) {
        lanternsArray.push(data[key]);
    }
    that.personalLanternList = lanternsArray;
    console.log('this.publicLanternList', that.personalLanternList);
    that.update();
  });
  </script>

</private-social>
