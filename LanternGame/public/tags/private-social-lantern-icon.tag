<private-social-lantern-icon>
    <div class="lantern hvr-bounce-in " style="left:{leftVal}%; bottom:{ bottomVal }%">
        <span class="tooltiptext">
          <strong>{userName}'s Lantern:</strong><br>
            {goal}<br>
            {deadline}
        </span>

    </div>

    <script>
        console.log("private-social-lantern-icon.tag");
        this.leftVal = Math.floor(Math.random() * 81 + 10);
        this.bottomVal = Math.floor(Math.random() * 61 + 20);
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
        .lantern:hover .tooltiptext {
            visibility: visible;
            width:6vw;
            height:50vh;
            background: url("../img/shiningLight.png");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            color: white;
            font-size:1vw;
            text-align: center;
            border-radius: 6px;
            position: fixed;
            display: block;
            margin: 3vw;
            margin-top:21vh;
            z-index: 1;
        }
        .lantern .tooltiptext {
            visibility: hidden;
        }

    </style>

</private-social-lantern-icon>
