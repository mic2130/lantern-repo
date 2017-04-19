<home>

    <button style="float:right; margin-right:150px" type="button" onclick={ hideSidebar }>Hide</button>
    <button style="float:right; margin-right:10px" type="button" onclick={ showSidebar }>Show</button>

    <sidebar show={ sidebarShown } lanterns={ lanternList }></sidebar>
    <div class="container">
      <lantern-icon each={ lanternList }></lantern-icon>
    </div>


    <script>
        var that = this;
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

        sidebar {
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
        }

        .container {
            /*display: flex;
            height: 1000px;
            margin-right:0px;*/
        }

    </style>

</home>
