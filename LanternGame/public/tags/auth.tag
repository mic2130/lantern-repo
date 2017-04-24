<auth>

    <button if={ !user } class="btn btn-warning" onClick={ logIn }>Log In</button>
    <button if={ user } class="btn btn-success" onClick={ logOut }>Log Out</button>
    <button if={ user } show={!showSocial} class="btn btn-info" onClick={ goToSocial }>See Others Lantern</button>
    <button if={ user } show={showSocial} class="btn btn-info" onClick={ goToPrivate }>Back to Private</button>

    <public-social if={!user}></public-social>
    <home if={user} show={!showSocial}></home>
    <private-social if={user} show={showSocial}></private-social>

    <script>
        var that = this;
        this.showSocial=false;
        // this.user = firebase.auth().currentUser;
        firebase.auth().onAuthStateChanged(function (userObj) {
            if (userObj) {
                that.user = userObj;
            } else {
                that.user = null;
            }
            // that.user = firebase.auth().currentUser;
            that.update();
        });

        logIn(event) {
            var provider = new firebase.auth.GoogleAuthProvider();
            firebase.auth().signInWithPopup(provider).then(function(result) {
                user = result.user;
            }).catch(function (error) {
                console.log('Error:', error.code, error.message);
                console.log('Email of account used:', error.email);
                console.log('Credential type used;', error.credential);
            });
        }

        logOut(event) {
            firebase.auth().signOut();
            that.update;
        }

        this.on('update', function(event) {
            console.log('auth.tag upadte');
        });

        goToSocial(event){
          this.showSocial=true;
        }
        goToPrivate(event){
          this.showSocial=false;
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
