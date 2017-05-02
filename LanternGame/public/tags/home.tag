<home>

    <!-- <button style="float:right; margin-right:150px" type="button" onclick={ hideSidebar }>Hide</button>
    <button style="float:right; margin-right:10px" type="button" onclick={ showSidebar }>Show</button> -->

    <!-- <sidebar show={ sidebarShown } lanterns={ lanternList }></sidebar> -->

    <span class="glyphicon glyphicon-menu-hamburger" style="color: #C9C9C9;" onclick={ showSidebar }></span>

    <div show={ sidebarShown } class="sidebar">
      <div onclick={ cancelCreateLantern }>
        <span class="glyphicon glyphicon-remove" style="color: #C9C9C9;" onclick={ hideSidebar }></span>
      </div>
      <user-profile lanterns={ lanternList }></user-profile>
    </div>

    <div class="container">
        <lantern-icon class="lanternItem" each={ lanternList }></lantern-icon>
    </div>

    <script>
        var that = this;

        // SIDEBAR
        this.sidebarShown = true;
        this.hideSidebar = function () {
            that.sidebarShown = false;
        }
        this.showSidebar = function () {
            that.sidebarShown = true;
            that.update();
            console.log(that.sidebarShown);
        }

        // firebase shortcut
        var database = firebase.database();

        // LANTERNLIST data from Firebase to create lantern icons
        var lanternListRef = database.ref('LanternList');
        this.lanternList = [];
        lanternListRef.on('value', function (snapshot) {
            var data = snapshot.val();
            var lanternsArray = [];
            for (var key in data) {
                lanternsArray.push(data[key]);
            }
            that.lanternList = lanternsArray;
            that.update();
        });

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




        // this.donePercent = 0; this.donePercent = numDone / this.tasks.length;
        //
        // this.lanternSteps = []; var database = firebase.database(); this.lanterListSteps = database.ref(LanternList/key/steps);
    </script>

    <style>

        :scope {
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

        .container {
            display: flex;
            height: 80%;
            margin-right: 0;
            margin-left: 450px;
            padding-top: 8%;
        }

        .lanternItem {
            flex-grow: 1;
        }

    </style>

</home>
