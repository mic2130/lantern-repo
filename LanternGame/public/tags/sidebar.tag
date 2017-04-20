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
    
    button.basic {
      font-family: work sans;
      font-weight: 400;
      color: #2C3440;
      background: #C9C9C9;
      border-radius: 10px;
      border: none;
      padding: 3px;
      padding-left: 10px;
      padding-right: 10px;
    }

  </style>

</sidebar>
