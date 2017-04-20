<step>

	<div class="checkbox" onclick={ disable }>
		<label onchange={ parent.updateSteps }><input type="checkbox" checked={ step.done }>{ step.goal }</label>
	</div>

	<script>
		var that = this;
		console.log('step', this);
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

	</style>

</step>
