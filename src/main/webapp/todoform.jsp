<html>
<head>
<title>User Management Application</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">



<body>
	<header>
		<!-- <nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> <h2 style=" color:#008CBA;">Todo</h2>
					</a>
			</div>

		
			
		</nav> -->
		<b><h1 style=" color:#008CBA;margin-left:380px;margin-right:380px;margin-top:40px;text-align:center;">Create Todo <hr></h1></b>
		<br><br>
	</header>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				
				<caption>
					<h2 style=" color:#008CBA;">
					
            		New Todo
            		
					</h2>
				</caption>
				<form action="TodoServlet" method="post">
				<fieldset class="form-group">
					<label>Todo Title</label> <input type="text" class="form-control"
						name="title" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Todo Decription</label> <input type="text"
						 class="form-control"
						name="description" >
				</fieldset>

				<fieldset class="form-group">
					<label>Todo Status</label> <select class="form-control"
						name="isDone">
						<option value="Progress..">In Progress</option>
						<option value="Complete">Complete</option>
					</select>
				</fieldset>

				<fieldset class="form-group">
					<label>Todo Target Date</label> <input type="date"
					class="form-control"
						name="targetDate" required="required">
				</fieldset>

				<button  type="submit" class="btn btn-success">Save</button>
				 
				</form>
			</div>
		</div>
	</div>
<%-- 
	<jsp:include page="../common/footer.jsp"></jsp:include> --%>
</body>
</html>
