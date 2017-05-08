<home>


    <span class="glyphicon glyphicon-menu-hamburger" onclick={ showSidebar }></span>

    <div show={ sidebarShown } class="sidebar">
        <div onclick={ cancelCreateLantern }>
            <span class="glyphicon glyphicon-remove" onclick={ hideSidebar }></span>
        </div>
        <userprofile lanterns={ lanternList }></userprofile>
    </div>

    <div class="container">
        <lantern-icon class="lanternItem" each={ lanternList }></lantern-icon>
    </div>


    <script>
        var that = this;

        this.sidebarShown = true;

        this.hideSidebar = function () {
            that.sidebarShown = false;
        }

        this.showSidebar = function () {
            that.sidebarShown = true;
            that.update();
        }

        this.user = firebase.auth().currentUser;
        var database = firebase.database() //shortcut to the firebase
        var lanternListRef = database.ref('userLanternList/' + this.user.uid);

        this.lanternList = [];

        // var lanternListRef = database.ref('userList'); get lanternList data from Firebase
        lanternListRef.on('value', function (snapshot) {
            var data = snapshot.val();
            var lanternsArray = [];
            for (var key in data) {
                lanternsArray.push(data[key]);
            }
            that.lanternList = lanternsArray;
            that.update();
        });

        this.cancelCreateLantern = function () {
          if (that.tags.userprofile.profileHome === false) {
            that.tags.userprofile.profileHome = true;
          };
          that.tags.userprofile.setGoal=false;
          that.tags.userprofile.setDeadline = false;
          that.tags.userprofile.setSteps = false;
          that.tags.userprofile.setFirstDeadline = false;
          that.tags.userprofile.refs.goal.value="";
          that.tags.userprofile.refs.deadline.value = "yyyy-MM-dd";
          that.tags.userprofile.refs.firstStepDeadline.value="yyyy-MM-dd";
          that.tags.userprofile.stepObjects = [{}, {}, {}];
        }

    </script>

    <style>

        /*bg has defined in auth page*/
        :scope {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            /*background: url("../img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;*/
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
            color: #C9C9C9;
        }
        .glyphicon-remove:hover {
          font-size: 22px;
          color: #7A7A7A;
        }

        .glyphicon-menu-hamburger {
            position: absolute;
            top: 30px;
            left: 25px;
            font-size: 32px;
            color: #C9C9C9;
        }
        .glyphicon-menu-hamburger:hover {
            position: absolute;
            top: 32px;
            left: 25px;
            font-size: 30px;
            color: #7A7A7A;
        }
        .container {
            display: flex;
            height: 80%;
            margin-left: 450px;
            padding-right: 150px;
            padding-top: 8%;
            z-index: 0;
        }
        .lanternItem {
            flex-grow: 1;
        }

    </style>

</home>
