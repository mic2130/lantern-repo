<home>

    <!-- <button style="float:right; margin-right:150px" type="button" onclick={ hideSidebar }>Hide</button>
    <button style="float:right; margin-right:10px" type="button" onclick={ showSidebar }>Show</button> -->

    <!-- <sidebar show={ sidebarShown } lanterns={ lanternList }></sidebar> -->

    <span class="glyphicon glyphicon-menu-hamburger" style="color: #C9C9C9;" onclick={ showSidebar }></span>

    <div show={ sidebarShown } class="sidebar">
        <span class="glyphicon glyphicon-remove" style="color: #C9C9C9;" onclick={ hideSidebar }></span>
        <user-profile lanterns={ lanternList }></user-profile>
    </div>

    <div class="container">
        <lantern-icon each={ lanternList }></lantern-icon>
    </div>

    <script>
        var that = this;
        this.user = firebase.auth().currentUser;

        console.log("test home", this);

        this.sidebarShown = true;

        this.hideSidebar = function () {
            this.sidebarShown = false;
        }

        this.showSidebar = function () {
            this.sidebarShown = true;
        }

        this.lanternList = [];

        var database = firebase.database();
        var lanternListRef = database.ref('LanternList');

        // get lanternList data from Firebase
        lanternListRef.on('value', function (snapshot) {
            var data = snapshot.val();
            var lanternsArray = [];
            for (var key in data) {
                lanternsArray.push(data[key]);
            }
            that.lanternList = lanternsArray;
            console.log('this.lanternList', that.lanternList);
            that.update();
        });

        // this.donePercent = 0; this.donePercent = numDone / this.tasks.length;
        //
        // this.lanternSteps = []; var database = firebase.database(); this.lanterListSteps = database.ref(LanternList/key/steps);
    </script>

    <style>

    /*bg has defined in auth page*/

        /*:scope {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            z-index: 0;
            background: url("../img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }*/

        .container {
            display: flex;
            height: 1000px;
            margin-right: 0;
        }

        .sidebar {
            height: 100%;
            width: 450px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #242D39;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 30px;
            box-shadow: 0 0 20px black;
        }

        .glyphicon-remove {
            position: absolute;
            right: 25px;
            margin-top: 25px;
            font-size: 22px;
        }

        .glyphicon-menu-hamburger {
            position: absolute;
            top: 30px;
            left: 25px;
            font-size: 32px;
        }

    </style>

</home>
