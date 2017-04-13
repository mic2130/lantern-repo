<lantern>

<div>

  <!-- <img class="lanternIcon" src="img/lanternicon.png" alt="lantern icon">   -->
  <!-- <img class="stateIcon" src="img/notdone.png" alt="state icon"> -->

  <p><strong>Goal:</strong> { goal }</p>
  <p><strong>Deadline:</strong> { deadline }</p>
  <hr class="line2">


</div>

<div class="hide">

</div>


  <script>
    console.log('this', this);
    // var goal = this.parent.lanternList;



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
