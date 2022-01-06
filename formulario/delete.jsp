<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
form{
    width :50%;
}
  </style>
</head>

<body>
    <%
    String numero_control=request.getParameter("id");
    out.println("Borrando<br>");
			Class.forName("org.postgresql.Driver");
			out.println("Driver registrado<br>");

			//string url = "jdbc:postgresql://127.0.0.1/escuela";
			String url ="jdbc:postgresql://172.18.0.1:5432/root" ;

			out.println("Conectando a... " + url);

			//Connection conexion = DriverManager.getConnection(url, user, pass);
			Connection conexion = DriverManager.getConnection(url,"root","root");
			out.println("<br>Conexión lista<br>");
            PreparedStatement pst = conexion.prepareStatement("delete from personas where numero_control=?");
            pst.setString(1, numero_control);
			pst.executeUpdate();
            out.println("Eliminacion exitosa");

			pst.close();
			conexion.close();

	
%>

<a href="http://localhost:8080/formulario/">Volver</a>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script  src="./js/fechaven.js"></script>


</body>

</html>
