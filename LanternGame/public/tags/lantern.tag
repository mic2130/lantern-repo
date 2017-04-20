<lantern>


<div>

  <div class="container2">
    <img class="lanternIcon item1" src="img/lanternicon.png" alt="lantern icon">
    <!-- <img class="stateIcon" src="img/notdone.png" alt="state icon" onclick={ showDetails }> -->
    <p class="item2" onclick={ showDetails }>{ goal }</p>
    <span class="glyphicon glyphicon-collapse-down item3" onclick={ showDetails } show={ !listShown }></span>
    <span class="glyphicon glyphicon-collapse-up item3" show={ listShown } onclick={ hideDetails }></span>
  </div>

  <div show={ listShown }>
    <br>
    <p><strong>Deadline:</strong> { deadline }</p>
    <p><strong>Steps:</strong></p>
    <step each={ step, i in steps }></step>
    <button type="button" onclick={ deleteLantern }>Delete Lantern</button>
  </div>

  <hr class="line2">
</div>


  <script>
    var that = this;
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

    p, span {
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

    .glyphicon {
      font-size: 20px;
      color: #C9C9C9;
    }

    .container2 {
      display: flex;
      justify-content: space-between;
    }

    .item1 {
      flex-grow: 1;
      max-width: 25px;
      max-height: 32px;
      min-width: 25px;
      min-height: 32px;
      width: 100%;
      height: 100%;
    }

    .item2 {
      margin-left: 17px;
      margin-right: 17px;
      flex-grow: 2;
      min-width: 312px;
    }

    .item3 {
      flex-grow: 1;
    }

    button.basic {
      font-family: work sans;
      font-weight: 400;
      color: #2C3440;
      background:#C9C9C9;
      border-radius: 10px;
      border: none;
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
