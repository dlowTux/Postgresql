
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<title>Demo</title>
<link rel = "stylesheet" href = "./css/stilos.css" type = "text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body >
<% 
try {
/* Create string of connection url within specified format with machine name, 
port number and database name. Here machine name id localhost and 
database name is usermaster. */ 
String connectionURL = "jdbc:postgresql://172.18.0.1:5432/root"; 

// declare a connection by using Connection interface 
Connection connection = null; 

// Load JBBC driver "com.mysql.jdbc.Driver" 
Class.forName("org.postgresql.Driver").newInstance(); 

/* Create a connection by using getConnection() method that takes parameters of 
string type connection url, user name and password to connect to database. */ 
connection = DriverManager.getConnection(connectionURL, "root", "root");

// check weather connection is established or not by isClosed() method 
if(!connection.isClosed())
%>
<font size="+3" color="green"></b>
<% 
out.println("Successfully connected to ");
connection.close();
}
catch(Exception ex){
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database."+ex);
}
%>
    <div class="cuadro">
         <div class="barra">
            <h3> Captura de nuevo ingreso </h3>
        </div>
        <div class="container mt-5">
            <form id="formulario" method="post" action="<%=request.getContextPath()%>/alta">
                <div class="row">
                    <div class="col">
                      <div class="mb-3">
                          <label  class="form-label">Fecha (dd-mm-aaaa) <span class="asterisco">*</span></label>
                          <input type="text" class="form-control" id="txtfecha" name="fecha">
                      </div>
                    </div>
                    <div class="col">
                     <div class="mb-3">
                         <label  class="form-label">No. cheque/poliza <span class="asterisco">*</span></label>
                         <input type="text" class="form-control" id="txtcheque_polica" name="cheque">
                     </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col">
                      <div class="mb-3">
                          <label  class="form-label">Importe de Ingreso <span class="asterisco">*</span></label>
                          <input type="text" class="form-control" id="txtimporte" name="importe">
                      </div>
                    </div>
                    <div class="col">
                     <div class="mb-3">
                         <label  class="form-label">Concepto <span class="asterisco">*</span></label>
                         <input type="text" class="form-control" id="txtconcepto" name="concepto">
                     </div>
                    </div>

                </div>
                <div class="container test">
                    <button type="submit" class="btn btn-success boton mb-5" id="boton">Registrar Ingreso</button>
                </div>
                </form>
        </div>
    </div>
    <script  src="./js/ingresos.js"></script>
    <script  src="./js/fechaven.js"></script>

</body>
</html>
