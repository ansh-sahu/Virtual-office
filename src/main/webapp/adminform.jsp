<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-Form</title>
</head>
<body>
 <form method="POST" action="Org_setup_1"  >
                            
                        <div class="form-group">
                                <label for="org_name">Name of organization</label>
                                <input type="text" required name="org _name" id="email" placeholder="org_name"/>
                            </div>
                            <div class="form-group">
                                <label for="no_of_depts">no_of_depts</label>
                                <input type="number"  required name="no_of_depts" id="pass" placeholder="no_of_depts"/>
                            </div>
                           
                            <div class="form-group">
                                <label for="no_of_employees">no_of_employees</label>
                                <input type="number"  required name="no_of_employees" id="pass" placeholder="no_of_employees"/>
                            </div>
                             <div class="form-group">
                                <label for="creation_date">creation_date</label>
                                <input type="date"  required name="creation_date" id="pass" placeholder="creation_date"/>
                            </div>
                            <div class="form-group">
                                <label for="org_email">org_email</label>
                                <input type="email"  required name="org_email" id="pass" placeholder="org_email"/>
                            </div>

							 <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="submit"/>
                            </div>
   </form>
</body>
</html>