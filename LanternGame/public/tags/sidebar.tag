<sidebar>

     <div id="nonmargin" class="container">
       <div class="row">
         <div class="col-md-5">
           <div id="sidebar">
               <!--TAG USER PROFILE HERE-->
              <user-profile lanterns={ lanterns }></user-profile>
           </div>
         </div>
       </div>
     </div>

  <script>
    console.log("test sidebar", this, this.lanterns);
		this.lanterns = this.opts.lanterns;

		this.on('update', function(args){
		  this.lanterns = this.opts.lanterns;
		});
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
