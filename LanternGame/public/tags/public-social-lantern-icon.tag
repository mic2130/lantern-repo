<public-social-lantern-icon>

    <div class="lantern hvr-bounce-in " style="left:{leftVal}%; bottom:{ bottomVal }%">
        <span class="tooltiptext" >
            <strong>Goal:</strong><br> {goal}
        </span>

    </div>

    <script>
    this.user = firebase.auth().currentUser;
        console.log("public-lantern-icon.tag");
        this.leftVal = Math.floor(Math.random() * 50 + 40);
        this.bottomVal = Math.floor(Math.random() * 50 + 40);
        // this.leftVal = Math.floor(Math.random() * 50 + 40);; this.bottomVal = 15; this.tasks = [{}, {}, {}, {}, {}]; this.showSidebar = function () {     parent.sidebarShown = true;     console.log("sidebar show called"); }
        //
        // // lantern height control flyLantern() {     console.log(this.tasks.length);     this.eachDistance = 70 / this.tasks.length;     this.bottomVal = this.bottomVal + this.eachDistance     if (this.bottomVal > 85) {         this.bottomVal = 85;     }
        // }
        //
        // this.on('update', function () {     console.log('CHECKINGLANTERN:', this); });
        //
        // this.on('mount', function () {     console.log('MOUNT:', this); })
    </script>

    <style>

        .lantern {
            background: url("../img/lanternA.png");
            width: 150px;
            height: 150px;
            position: absolute;
            -webkit-animation-name: lantern;
            -webkit-animation-duration: 2.5s;
            animation-name: lantern;
            animation-iteration-count: infinite;
            -webkit-transform: perspective(1px) translateZ(0);
            transform: perspective(1px) translateZ(0);
            box-shadow: 0 0 1px transparent;
            -webkit-transition-duration: 0.5s;
            transition-duration: 0.5s;
        }
        @-webkit-keyframes lantern {
            0% {
                background: url("../img/lanternA.png");
            }
            25% {
                background: url("../img/lanternB.png");
            }
            50% {
                background: url("../img/lanternC.png");
            }
            100% {
                background: url("../img/lanternB.png");
            }
        }
        .lantern .tooltiptext {
            visibility: hidden;
            opacity:0.7;
            height:200vw;
            background: -webkit-linear-gradient(top, #ffd170, rgba(255,0,0,1)); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(bottom, #ffd170, rgba(255,0,0,1)); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(bottom, #ffd170, rgba(255,0,0,1)); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to bottom, #ffd170, rgba(255,0,0,1)); /* Standard syntax (must be last) */
            background-size: 100% 100%;
            background-repeat: no-repeat;
            color: white;
            font-size:0.1vw;
            text-align: center;
            border-radius: 6px;
            position: absolute;
            display: inline;
            margin: 4vw;
            margin-top:15vh;



            /* Position the tooltip */
            position: absolute;
            z-index: 1;
        }
        div{
          padding:0;
        }
        .lantern:hover .tooltiptext {
            visibility: visible;
        }

    </style>

</public-social-lantern-icon>
