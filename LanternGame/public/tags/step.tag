<step>

<!-- <div class="container">
	<div class="box" onclick={ disable } >
		<input type="checkbox" checked={ step.done }>
		<label onchange={ parent.updateSteps } class={ completed: step.done }>{ step.step }</label>
	</div>
	<div class="deadline">
		<p class="deadline">{step.DL}<p>
	</div>
</div> -->

<table>
	<tr>
		<th class="stepText">
			<div class="box" onclick={ disable } >
				<input onchange={ parent.updateSteps } type="checkbox" checked={ step.done }>
				<label  class={ completed: step.done }>{ step.step }</label>
			</div>
		</th>
		<th class="border">
			<p class={ completed:step.done } class="deadline" style="font-weight:200">{step.DL}<p>
		</th>
	</tr>
</table>


	<hr class="line3">



	<script>
		var that = this;

	</script>

	<style>

		/*.container {
			display: flex;
			align-content: flex-start;
			position: relative;
		}

		.box {
			position: absolute;
		}*/

		/*.deadline {
			position: absolute;
		}*/

		input {
			width: 20px;
			margin-left: 10px;
			margin-right: 5px;
		}

		label {
			font-family: work sans;
			font-weight: 300;
			color: #C9C9C9;
			letter-spacing: 0.5px;
			font-size: 15px;
			margin: 5px;
		}

		.stepText {
			min-width: 297px;
		}

		.border {
			border-left: 0.5px solid #C9C9C9;
			padding-left: 3px;
		}

		.deadline{
			font-size: 15px;
			font-weight: 200;
			margin-left: 3px;
			text-align: right;
		}

		th {
			padding: 0px;
		}

		/*.completed p {
			text-decoration: line-through;
			color: #727171;
		}*/
		.completed  {
			text-decoration: line-through;
			color: #727171;
		}
		.line3 {
			border-top: 0.5px solid #C9C9C9;
			margin: 3px;
		}

	</style>

</step>
