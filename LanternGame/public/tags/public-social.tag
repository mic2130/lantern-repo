<public-social>
    <div show={introduction} class="lalabg">
        <span class="glyphicon glyphicon-remove" style="color: #C9C9C9;" onclick={ hideIntroduction } ></span>
        <h1>La La Light</h2>
        <h3>Light the way to your long-term goal</h4>
        <p>In eastern culture, sky lanterns resemble beautiful wishes and hopes. As part of some big celebrations, people write their goals for themselves and families, and light up and fly the sky lantern. Do you have any long-term goals that you want to work on, but keep pushing back? This is a space for you to keep track of your personal goals, and find motivations from others.</p>
        <img src="../img/girllantern.png" id="girl">
    </div>
    <div class="container">
        <public-social-lantern-icon each={ publicLanternList }></public-social-lantern-icon>
    </div>



    <script>
        var that = this;
        this.publicLanternList = [];
        this.introduction=true;
        hideIntroduction(){
          this.introduction=false;

        }



        var database = firebase.database() //shortcut to the firebase
        var publicLanternListRef = database.ref('publicLanternList');
        // var lanternListRef = database.ref('userList'); get lanternList data from Firebase
        publicLanternListRef.limitToFirst(8).on('value', function (snapshot) {
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
            color:rgb(255, 255,255);
            margin-left:25%;
            margin-right:25%;
            margin-top:10%;
            background-color:rgba(0, 0,0, 0.2);
            width: 50%;
            height: auto;
            padding: 35px;
            z-index: 3;
            border-radius: 40px;
            font-size: 1.2vw;
            text-align: center;
        }
        .lalabg h1,h3 {
            font-family: 'Calligraffitti', cursive;

            font-weight: bold;
            text-shadow: 1px 1px 1px;
        }
        .lalabg p {
            font-family: 'Raleway', sans-serif;
            line-height: 180%;
            padding-top: 5px;

        }
        .glyphicon-remove {
            position: absolute;
            right: 25px;
            margin-top: 25px;
            font-size: 22px;
        }
        #girl {
          width: 5vw;
        }

    </style>

</public-social>
