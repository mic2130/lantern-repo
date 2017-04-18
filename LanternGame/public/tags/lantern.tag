<lantern>


<div ref="preview">
  <img class="lanternIcon" src="img/lanternicon.png" alt="lantern icon">
  <!-- <img class="stateIcon" src="img/notdone.png" alt="state icon" onclick={ showDetails }> -->
  <span id="plus" class="glyphicon glyphicon-plus" style="color: blue;" onclick={ showDetails }></span>
  <span id="minus" class="glyphicon glyphicon-minus hide" style="color: blue;" onclick={ hideDetails }></span>
  <p onclick={ showDetails }><strong>Goal:</strong> { goal }</p>
  <p onclick={ showDetails }><strong>Deadline:</strong> { deadline }</p>

  <div id="details" class="hide">
    <!-- <p>{ steps[0].step }</p> -->
    <p><strong>Steps:</strong></p>
    <step each={ steps }></step>
  </div>

  <hr class="line2">
</div>


  <script>
    console.log('this', this);
    // var goal = this.parent.lanternList;

    this.toggle = function() {

    }

    this.showDetails = function() {
      document.querySelector('#details').classList.remove('hide');
      document.querySelector('#plus').classList.add('hide');
      document.querySelector('#minus').classList.remove('hide');
    }

    this.hideDetails = function() {
      document.querySelector('#details').classList.add('hide');
      document.querySelector('#plus').classList.remove('hide');
      document.querySelector('#minus').classList.add('hide');
    }




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
