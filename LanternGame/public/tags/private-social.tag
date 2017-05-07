<private-social>
  <div class="container">
    <div class="row">
    <div style="col-sm-6">
      <private-social-lantern-icon each={ userPublicLanternList }></private-social-lantern-icon>
    </div>
    <%-- <div style="width:50%; float:right">
      <lantern-icon each={ personalLanternList }></lantern-icon>

    </div> --%>
  </div>
  </div>



  <script>
  var that=this;
  this.userPublicLanternList=[];

  this.user = firebase.auth().currentUser;


  var database = firebase.database() //shortcut to the firebase
  var userPublicLanternListRef = database.ref('userPublicLanternList');
  // var lanternListRef = database.ref('userList');
  // get lanternList data from Firebase

  userPublicLanternListRef.on('value', function (snapshot) {
    var data = snapshot.val();
    var lanternsArray = [];
    for (var key in data) {
        lanternsArray.push(data[key]);
    }
    that.userPublicLanternList = lanternsArray;
    that.update();
  });


  </script>

</private-social>
