<lantern>


<div ref="preview">
  <img class="lanternIcon" src="img/lanternicon.png" alt="lantern icon">
  <!-- <img class="stateIcon" src="img/notdone.png" alt="state icon" onclick={ showDetails }> -->
  <span class="glyphicon glyphicon-plus" style="color: blue;" onclick={ showDetails } show={ !listShown }></span>
  <span class="glyphicon glyphicon-minus" show={ listShown } style="color: blue;" onclick={ hideDetails }></span>
  <p onclick={ showDetails }><strong>Goal:</strong> { goal }</p>
  <p onclick={ showDetails }><strong>Deadline:</strong> { deadline }</p>

  <div show={ listShown }>
    <p><strong>Steps:</strong></p>
    <step each={ step, i in steps }></step>
    <button type="button" onclick={ deleteLantern }>Delete Lantern</button>
  </div>

  <hr class="line2">
</div>


  <script>
    var that = this;
    console.log('this', this);
    // var goal = this.parent.lanternList;

    this.showDetails = function() {
			var openRef = firebase.database().ref('LanternList/' + this.id + '/listShown');
			openRef.set(true);
    }
    this.hideDetails = function(){
			var openRef = firebase.database().ref('LanternList/' + this.id + '/listShown');
			openRef.set(false);
    }

		updateSteps(event){
			var stepsRef = firebase.database().ref('LanternList/' + this.id + '/steps');
			var step = event.item.step;
			step.done = !step.done;
			console.log('stepsAry', this.steps);
			stepsRef.set(this.steps);
		}

    // var txt;
    // var r = confirm("Press a button!");
    // if (r == true) {
    //     txt = "You pressed OK!";
    // } else {
    //     txt = "You pressed Cancel!";
    // }

    deleteLantern() {
      if (confirm("Are you sure you want to delete this lantern?")) {
        var lanternRef = firebase.database().ref('LanternList/' +this.id);
        lanternRef.set(null);
        that.update();
    }}



  </script>


  <style>

    h2 {
      font-family: work sans;
      font-weight: 500;
      color: #C9C9C9;
    }

    h4 {
      font-family: work sans;
      font-weight: 400;
      color: #C9C9C9;
    }

    p {
      font-family: work sans;
      font-weight: 300;
      color: #C9C9C9;
      letter-spacing: 0.5px;
      font-size: 18px;
    }

    hr.line1 {
      border-top: 1px solid #C9C9C9;
    }

    hr.line2 {
      border-top: 0.5px solid #2C3440;
    }

    button.basic {
      font-family: work sans;
      font-weight: 400;
      color: #2C3440;
      background:#C9C9C9;
      border-radius: 10px;
      border: none;
    }

    img.lanternIcon {
      display: inline;
      width: 18px;
    }

    img.stateIcon {
      display: inline;
      width: 28px;
      position: absolute;
      right: 30px;
    }

    .hide {
      display: none;
    }

/*COLORS:
Font Gray: #C9C9C9
Font Dark Gray: #2C3440
Sidebar Gray: #242D39
Cyan Highlighted boxes: #3AC8C6
Highlighted orange: #FD5800
*/

/*FONT WEIGHT:
Semibold: 500
Medium: 400 (Subtitle like lantern, texts in boxes, buttons)
Regular: 300 (lists and texts )
Light: 200 (inside input boxes)
*/

  </style>

</lantern>


<!-- <tagName>


	<script>
		var that = this;
		console.log('tagName.tag');
	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</tagName> -->
