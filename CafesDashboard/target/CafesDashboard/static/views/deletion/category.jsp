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
		<h2><a href="#/deletion">Deletion Pages > </a>{{title}}</h2>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
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
		</form>
		<table class="table table-striped table-bordered table-hover">
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th ng-click="sort('categoryName')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Category</th>
					<th ng-click="sort('store.storeName')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Store</th>
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
				</tr>
			</thead>
			<tbody>
				<tr ng-show="categories.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<c:choose>
					<c:when
						test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'STORE_ADMIN'}"
					>
						<tr
							dir-paginate="u in categories|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							ng-show="u.isDeleted==1 && (u.store.storeName=='${sessionScope.ACTIVE_LOGGED_USER.store.storeName}')"
							ng-hide="u.isDeleted==1 && !(u.store.storeName=='${sessionScope.ACTIVE_LOGGED_USER.store.storeName}')"
						>
							<td>{{u.categoryName}}</td>
							<td>{{u.store.storeName}}</td>
							<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.isDeleted}}</td>
						</tr>
					</c:when>
					<c:when
						test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMINN'}"
					>
						<tr
							dir-paginate="u in categories|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							ng-show="u.isDeleted==1"
						>
							<td>{{u.categoryName}}</td>
							<td>{{u.store.storeName}}</td>
							<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.isDeleted}}</td>							
						</tr>
					</c:when>
				</c:choose>
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