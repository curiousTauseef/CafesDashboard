<%@ page isELIgnored="false"%>
<div
	id="collapse3"
	class="accordion-body collapse in body"
>
	<div
		class="dl-horizontal"
		style="text-align: left"
	>
		<h4 style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;">{{subtitle}}</h4>
	</div>
	<form
		class="form-signin"
		name="countryForm"
		novalidate
	>
		<div
			class="form-group"
			style="text-align: left"
		>
			<label
				for="text1"
				class="control-label col-lg-1"
			>Country</label>
			<div class="col-lg-11">
				<input
					type="text"
					id="text1"
					placeholder="country"
					class="form-control"
					ng-model="activeCountry.country"
					ng-required="true"
				>
			</div>
		</div>
		<div
			class="form-group"
			style="text-align: left"
		>
			<br />
		</div>
		<div
			class="form-group"
			style="text-align: left"
		>
			<br />
		</div>
		<div
			class="form-actions"
			style="text-align: left;"
		>
			<button
				ng-click="submitCountryCreateUpdate(activeCountry)"
				class="btn btn-primary btn-sm"
				ng-disabled="countryForm.$invalid"
			>{{buttonOperation}}</button>
			<button
				id="cancel-form"
				value="Cancel"
				ng-click="cancel()"
				class="btn btn-danger btn-sm"
			>Cancel</button>
		</div>
	</form>
</div>