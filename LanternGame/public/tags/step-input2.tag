<step-input2>

  <input ref="stepInput" placeholder="Step" onkeypress={ makeData}>
  <br>


  <script>
    var that = this;

    makeData(event) {
      if (event.which === 13) {
        var data = {
        step: this.refs.stepInput.value,
        done: false,
        };
      this.parent.stepList.push(data);
      this.parent.update();
      }
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


</step-input2>