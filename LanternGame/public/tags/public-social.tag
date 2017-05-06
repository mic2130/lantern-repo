<public-social>
    <div show={lalalantern} class="lalabg">
        <h2>LA LA LIGHT</h2>
        <h4>Light your way to your long-term goal</h4>
        <p>In eastern culture, sky lanterns resemble beautiful wishes and hopes. As part of some big celebrations, people write their goals for themselves and families, and light up and fly the sky lantern. Do you have any long-term goals that you want to
            work on, but keep pushing back? This is a space for you to keep track of your personal goals, and find motivations from others.</p>
    </div>
    <div class="container">
        <public-social-lantern-icon each={ publicLanternList }></public-social-lantern-icon>
    </div>

    <script>
        var that = this;
        this.lalalantern = true;
        this.publicLanternList = [];

        var database = firebase.database() //shortcut to the firebase
        var publicLanternListRef = database.ref('publicLanternList');
        // var lanternListRef = database.ref('userList'); get lanternList data from Firebase
        publicLanternListRef.limitToFirst(15).on('value', function (snapshot) {
            var data = snapshot.val();
            var lanternsArray = [];
            for (var key in data) {
                lanternsArray.push(data[key]);
            }
            that.publicLanternList = lanternsArray;
            console.log('this.publicLanternList', that.publicLanternList);
            that.update();
        });
    </script>

    <style>
        .lalabg {
          position:absolute;
          color:white;
          margin-left:25%;
          margin-right:25%;
          margin-top:10%;
          background-color:rgba(255, 255,255, 0.5);;
          width: 50%;
          height: 50%;
          padding: 10px;
          z-index: 3;
            }

    </style>

</public-social>
