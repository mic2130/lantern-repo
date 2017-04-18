<step-input>

  <input ref="stepInput" placeholder="Step" onchange={ makeData }>
  <br>


  <script>
    var that = this;

    console.log(this);

    // var data;

    makeData(event) {
      console.log(event.item);
      event.item.step = this.refs.stepInput.value;
      console.log(this.parent.stepObjects);
      // that.parent.saveSteps();
    }

  </script>

  <style>

  body {

  }



  img.bg {
    /* Set rules to fill background */
    min-height: 100%;
    min-width: 1024px;

    /* Set up proportionate scaling */
    width: 100%;
    height: auto;

    /* Set up positioning */
    position: fixed;
    top: 0;
    left: 0;
  }

  @media screen and (max-width: 1024px) { /* Specific to this particular image */
    img.bg {
      left: 50%;
      margin-left: -512px;   /* 50% */
    }
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


</step-input>
