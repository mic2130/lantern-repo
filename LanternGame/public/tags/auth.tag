<auth>

  <button if={!user} class="btn btn-warning">Log In</button>
  <button if={user} class="btn btn-success">Log Out</button>





  <script>

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
  .btn{
    float:right;
    margin-right:2vw;
    margin-top:2vh;
  }


  </style>




</auth>
