<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Update Profile</title>
</head>
<body>

<b><h1 style=" color:#008CBA;margin-left:380px;margin-right:380px;margin-top:40px;text-align:center;">Update Profile<hr></h1></b>
		<br><br>
	</header>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				
				<caption>
					<h2 style=" color:#008CBA;">
					
            		Details
            		
					</h2>
				</caption>
				<form action="update_profile" method="post">
				

				<fieldset class="form-group">
					<label>Mobile No.</label> <input type="text"
						 class="form-control"
						name="mob" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Address</label> <input type="text" class="form-control"
						name="add"  required="required" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>City</label> <input type="text" class="form-control"
						name="city"  required="required" >
				</fieldset>

				

				<button  type="submit" class="btn btn-success">Save</button>
				 
				</form>
			</div>
		</div>
	</div>

</body>
</html>