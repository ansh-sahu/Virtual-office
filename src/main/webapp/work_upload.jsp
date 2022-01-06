<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Work</title>
</head>
<body>
<div class="uploadwork">
<form method="post" action="upload_docs" enctype="multipart/form-data">
<input type="file" name="file">
<input type="submit" class="btn btn-primary">
</form>
</div>
<!-- 
<form action="Insert_Image" method="POST" enctype="multipart/form-data">
<input type="file" name="file">
<button type="submit" class="">Upload</button><br><br><br> 
-->
</body>
</html>