<step>

	<div class="checkbox" onclick={ disable } >
		<label onchange={ parent.updateSteps } class={ completed: step.done }><input type="checkbox" checked={ step.done }>{ step.step }<br><p class="deadline">deadline:{step.DL}<p></label>
	</div>


	<script>
		var that = this;


	</script>

	<style>


		.checkbox {
			font-family: work sans;
			font-weight: 300;
			color: #C9C9C9;
			letter-spacing: 0.5px;
			font-size: 18px;
			margin-left: 30px;
		}
		p.deadline{
			font-size: 1vw;
		}
		.completed p {
			text-decoration: line-through;
			color: #727171;
		}
		.completed  {
			text-decoration: line-through;
			color: #727171;
		}

	</style>

</step>
