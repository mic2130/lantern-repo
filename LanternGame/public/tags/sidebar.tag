<sidebar>

     <div id="nonmargin" class="container">
       <div class="row">
         <div class="col-md-5">
           <div id="sidebar">
               <!--TAG USER PROFILE HERE-->
              <user-profile></user-profile>

           </div>
         </div>
       </div>
     </div>

  <script>
    console.log("test sidebar");

  </script>

  <style>

    body {

    }
    /*need a better solution for the 100% height side bar*/
    #nonmargin {
      margin: 0;
      padding-left: 0;
    }

    /*need a better solution for the 100% height side bar*/
    #sidebar {
      position: relative;
      background: #242D39;
      margin-top: 0;
      padding: 30px;
      min-height: 100%;
      margin-bottom: -101%;
      padding-bottom: 300%;
      box-shadow: 0 0 20px black;
    }

  </style>

</sidebar>
