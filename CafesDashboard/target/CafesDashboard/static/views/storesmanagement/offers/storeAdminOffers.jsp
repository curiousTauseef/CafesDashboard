<%@ page isELIgnored="false"%>
<style>
.sort-icon {
	font-size: 9px;
	margin-left: 5px;
}

th {
	cursor: pointer;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h2>
			{{title}}
		</h2>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
		<div ng-show="showOffer">
			<jsp:include
				page="/static/views/storesmanagement/offers/addOffer.jsp"
			/>
		</div>
		<form class="form-inline">
			<div class="form-group">
				<input
					type="text"
					ng-model="search"
					class="form-control"
					placeholder="Search"
				> <span
					style="margin-right: 4px; margin-top: -26px; color: #1eb7e9; float: right;"
				> <i
					class="glyphicon glyphicon-search"
					style="margin-right: 10px; margin-top: -26px; color: #1eb7e9;"
				> </i></span>
			</div>
			<div
				class="form-group"
				style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
			>
				<a
					id="add-add"
					style="background-color: #eab123; border: #eab123;"
					class="btn btn-warning"
					ng-click="addOrEdit('add',null)"
					ng-disabled='showOffer'
					style="background-color:#eab123;border:#eab123;"
				><i
					class="glyphicon glyphicon-plus"
					style="margin-right: 10px;"
				></i>Add Offer</a>
			</div>
		</form>
		<table
			class="table table-striped table-bordered table-hover"
			ng-init="fetchOffersByStore()"
			ng-controller="OffersController"
		>
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th ng-click="sort('offerType')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Offer Type</th>
					<th>&nbsp;Description</th>
					<th ng-click="sort('from')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;from</th>
					<th ng-click="sort('to')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;to</th>
					<th ng-click="sort('createdAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Creation Date</th>
					<th ng-click="sort('updatedAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Last Updated</th>
					<th ng-click="sort('isDeleted')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;IsDeleted</th>
					<th>Branchs</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="offerz.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in offerz|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
				>
					<td>{{u.offerType.type}}</td>
					<td>{{u.description}}</td>
					<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.isDeleted}}</td>
					<td>
						<div
							ng-repeat="branch in u.branches"
							style="margin-left: 0"
						>
							<div>{{branch.description}}</div>
							<strong>in</strong>
							<div>{{branch.store.storeName}}</div>
						</div>
						<div
							ng-show="u.branches.length==0"
							style="margin-left: 0"
						>
							<a>Assign Branches To Offer</a>
						</div>
					</td>
					<td class="center"><a
						class="btn btn-warning"
						ng-click="addOrEdit('edit', u)"
						ng-disabled='showOffer'
					><i class="glyphicon glyphicon-edit"></i></a> <a
						class="btn btn-danger"
						data-toggle="modal"
						data-target="#DeleteOffer"
						ng-disabled='showOffer'
						ng-hide="u.isDeleted==1"
						ng-click="showDelete(u)"
					><i class="glyphicon glyphicon-trash"></i></a></td>
				</tr>
			</tbody>
		</table>
		<dir-pagination-controls
			max-size="10"
			direction-links="true"
			boundary-links="true"
		> </dir-pagination-controls>
	</div>
</div>
<div>
	<jsp:include page="/static/views/storesmanagement/offers/delete.jsp"></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>