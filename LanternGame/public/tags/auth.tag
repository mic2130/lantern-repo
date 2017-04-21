<auth>

    <button if={ !user } class="btn btn-warning" onClick={ logIn }>Log In</button>
    <button if={ user } class="btn btn-success" onClick={ logOut }>Log Out</button>

    <social if={!user}></social>
    <home if={user}></home>

    <script>
        var that = this;
        this.user = firebase.auth().currentUser;
        firebase.auth().onAuthStateChanged(function (userObj) {
            that.user = firebase.auth().currentUser;
            that.update();
        });

        logIn(event) {
            var provider = new firebase.auth.GoogleAuthProvider();
            firebase.auth().signInWithPopup(provider);
            // var database = firebase.database() //shortcut to the firebase
            // var lanternListRef = database.ref('userList');
            // // var newKey = lanternListRef.push().key;
            // // lanternListRef.child(newKey).set(this.user.uid);
            // set['userList/' + this.user.uid] = this.user.uid ;





        }

        logOut(event) {
            firebase.auth().signOut();
            that.update;
        }
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
        .btn {
            float: right;
            margin-right: 2vw;
            margin-top: 2vh;
        }

    </style>

</auth>
