<public-social>
  <div class="container">
      <public-social-lantern-icon each={ publicLanternList }></public-social-lantern-icon>
  </div>



<script>
var that=this;
this.publicLanternList = [];


var database = firebase.database() //shortcut to the firebase
var publicLanternListRef = database.ref('publicLanternList');
// var lanternListRef = database.ref('userList');
// get lanternList data from Firebase
publicLanternListRef.on('value', function (snapshot) {
    var data = snapshot.val();
    var lanternsArray = [];
    for (var key in data) {
        lanternsArray.push(data[key]);
    }
    that.publicLanternList = lanternsArray;
    that.update();
});
</script>




</public-social>
