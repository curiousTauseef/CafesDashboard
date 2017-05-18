<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
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
		<h2>{{title}}</h2>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
		<div
			ng-show="showCategory"
			class="box"
		>
			<jsp:include
				page="/static/views/storesmanagement/menu/addCategory.jsp"
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
					class="btn btn-warning"
					ng-click="addOrEdit('add',null)"
					ng-disabled='showCategory'
					style="background-color: #eab123; border: #eab123;"
				><i
					class="glyphicon glyphicon-plus"
					style="margin-right: 10px;"
				></i>Add Category</a>
			</div>
		</form>
		<table class="table table-striped table-bordered table-hover">
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th ng-click="sort('categoryName')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Category</th>
					<th ng-click="sort('createdAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Creation Date</th>
					<th ng-click="sort('updatedAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Last Updated</th>
					<th
						ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
					></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="categories.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in categories|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
					ng-hide="u.isDeleted==1"
				>
					<td>{{u.categoryName}}</td>
					<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td
						class="center"
						ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
					><a
						class="btn btn-warning"
						ng-click="addOrEdit('edit',u)"
						ng-disabled='showCategory'
					><i class="glyphicon glyphicon-edit"></i></a> <a
						class="btn btn-danger"
						data-toggle="modal"
						data-target="#DeleteCategory"
						ng-disabled='showCategory'
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
	<jsp:include
		page="/static/views/storesmanagement/menu/categorydelete.jsp"
	></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>