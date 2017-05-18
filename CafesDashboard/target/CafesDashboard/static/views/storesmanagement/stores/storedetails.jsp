<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@page import="com.websystique.springmvc.pojos.User"%>
<div
	class="inner"
	ng-init="fetchAllStores()"
>
	<div
		ng-show="showStore"
		class="box panel widget light-widget"
	>
		<jsp:include page="/static/views/storesmanagement/stores/addStore.jsp" />
	</div>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<div>
				<h2>
					<span style="float: left; margin-bottom: 10px;">
						{{storeDetails.storeName}}</span>
				</h2>
				<c:choose>
					<c:when
						test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
					>
						<a
							class="btn btn-warning"
							ng-click="addOrEdit('edit',storeDetails)"
							ng-disabled='showStore'
							style="float: right;"
						><i
							class="glyphicon glyphicon-plus"
							style="margin-right: 10px;"
						></i>Edit Store</a>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel widget light-widget">
					<div class="panel-heading no-title"></div>
					<form
						class="form-horizontal"
						action="#"
						role="form"
					>
						<div class="panel-body">
							<br>
							<div class="row">
								<div class="col-sm-3 mgbt-xs-20">
									<div class="form-group">
										<div class="col-xs-12">
											<div class="form-img text-center mgbt-xs-15">
												<img
													ng-src="{{storeDetails.logoURL}}"
													alt="It's a grind"
												/>
											</div>
											<br>
											<div>
												<table class="table table-striped table-hover">
													<tbody>
														<tr>
															<td style="width: 60%;">Store name</td>
															<td><span>{{storeDetails.storeName}}</span></td>
														</tr>
														<tr>
															<td>Unique identifier</td>
															<td>{{storeDetails.uuid}}</td>
														</tr>
														<tr>
															<td>Added at</td>
															<td>{{storeDetails.createdAt|date:'MM/dd/yyyy @
																h:mma'}}</td>
														</tr>
														<tr>
															<td>Last Updated</td>
															<td>{{storeDetails.updatedAt|date:'MM/dd/yyyy @
																h:mma'}}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-9">
									<h3 class="mgbt-xs-15">Description</h3>
									<div
										class="form-group"
										style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
									>{{storeDetails.description}}</div>
									<!-- form-group -->
									<hr>
									<h3 class="mgbt-xs-15">Branches</h3>
									<div class="form-group">
										<table class="table table-striped table-bordered table-hover">
											<thead style="color: white; background-color: #4f5f6f;">
												<tr>
													<th ng-click="sort('country')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Country</th>
													<th ng-click="sort('city')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;City</th>
													<th ng-click="sort('open')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Open</th>
													<th ng-click="sort('close')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Close</th>
													<th ng-click="sort('address')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Address</th>
													<th ng-click="sort('description')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Description</th>
													<th ng-click="sort('branchCode')"><span
														class="glyphicon sort-icon"
														ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
													></span>&nbsp;Branch Code</th>
													<th ng-click="sort('branchCode')"><span
														class="glyphicon sort-icon"
													></span>&nbsp;Latitude</th>
													<th ng-click="sort('branchCode')"><span
														class="glyphicon sort-icon"
													></span>&nbsp;Langitude</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-show="storeDetails.branches.length==0">
													<td colspan="7"><center>No records to display</center></td>
												</tr>
												<tr
													dir-paginate="u in storeDetails.branches|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
												>
													<td>{{u.country.country}}</td>
													<td>{{u.city.city}}</td>
													<td>{{u.open|date:' h:mma'}}</td>
													<td>{{u.close|date:' h:mma'}}</td>
													<td>{{u.address}}</td>
													<td>{{u.description}}</td>
													<td>{{u.branchCode}}</td>
													<td>{{u.latitude}}</td>
													<td>{{u.langitude}}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- form-group -->
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
						</div>
						<!-- panel-body -->
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
