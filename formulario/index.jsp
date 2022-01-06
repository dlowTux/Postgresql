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
	class Persona {
    private String id;
		public String nombre;
		public String apellidos;
        public String domicilio;
        public int edad ;
        public String telefono;
        public String carrera;
        public String tutor;
        public String sexo;
        public String fechar;
        public String fechan;
        public float estatura;
        public float peso;
        
        public Persona(String id, String nombre, String apellidos,String domicilio,
        int edad,
        String telefono,
        String carrera,
        String sexo,
        String fechar,
        String fechan,
        String tutor,
        float estatura,
        float peso
        ){
			this.id = id;
			this.nombre = nombre;
			this.apellidos = apellidos;
            this.domicilio=domicilio;
            this.edad=edad;
            this.telefono=telefono;
            this.carrera = carrera;
            this.sexo=sexo;
            this.fechar=fechar;
            this.fechan=fechan;
            this.tutor=tutor;
            this.estatura=estatura;
            this.peso=peso;
		}

		public String NombreCompleto() { return nombre + " " + apellidos; }
        public String getCarrera(){return carrera;}
        public String getId(){return id;}

	}
	
    ArrayList<Persona> personas = new ArrayList<Persona>();
	Class.forName("org.postgresql.Driver");
    //	jdbc:postgresql://progweb.postgres.database.azure.com:5432/escuela?user=master@progweb&password=Password0&sslmode=require");

    			String url ="jdbc:postgresql://172.18.0.1:5432/" ;

                Connection conexion = DriverManager.getConnection(url,"root","root");
	Statement st = conexion.createStatement();
    ResultSet rs = st.executeQuery("select * from personas");
	while(rs.next()){
    personas.add(new Persona(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
    rs.getInt(5), rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10), rs.getString(11),
    rs.getFloat(12),rs.getFloat(13)
    ));
	}
	st.close();
	conexion.close();
	request.getSession().setAttribute("personas", personas);
%>
    <nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">18680060 OMAR ELI AGUILAR LOPEZ</a>
  </div>
</nav>
<div class="row">
<div class="col">
<div class="container">

<form class="mt-5" style="text-align: center;" method="post" action="<%=request.getContextPath()%>/altaProfesor" >
    <div class="row">
        <div class="col">
          <label for="NoControl">Numero de control:</label>
        </div>
        <div class="col">
            <input class="form-control " type="text" id="control" name="No_Control">
        </div>
    </div>  

      <div class="row mt-1">
          <div class="col">
          <label for="name">Nombre:</label>
          </div>
          <div class="col">
              <input type="text" class="form-control" id="name" name="user_name">
          </div>
     </div>

      <div class="row mt-1">
          <div class="col">
              <label for="Apellidos">Apellidos:</label>
          </div>
          <div class="col">
              <input type="text" class="form-control" id="apellidos"
              name="Apellido">
          </div>
      </div>
           
      <div class="row mt-1">
          <div class="col">

        <label for="Domicilio">Domicilio:</label>
          </div>
          <div class="col">
          
              <input type="text" id="domicilio" name="domicilio" class="form-control">
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Edad">Edad:</label>
          </div>
          <div class="col">
              <input  class="form-control" id="edad" name="Edad" >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Telefono">Telefono:</label>
          </div>
          <div class="col">

              <input type="tel" id="telefono" name="Telefono" class="form-control">
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Padre o tutor">Padre o tutor:</label>
          </div>
          <div class="col">

              <input type="text" id="padre"  class="form-control" name="padre">
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Carrera">Carrera</label>
          </div>
          <div class="col">
          <select name="Carrera" class="form-select" id="carrera">
          <option value="selecciona">Selecciona una opcion</option>
          <option value="Ingenieria Gestion Empresarial">Ingenieria Gestion Empresarial</option>
          <option value="Ingenieria Mecatronica">Ingenieria Mecatronica</option>
          <option value="Ingenieria Electronica">Ingenieria Electronica</option>
          <option value="Ingenieria Industrial">Ingenieria Industrial</option>
          <option value="Ingenieria Sistemas Computacionales">Ingenieria Sistemas Computacionales</option>
          <option value="Contador Publico">Contador Publico</option>
        </select>
        </div>

      </div>
      <div class="row mt-1">
          <div class="col">
              <label for="sexo">Sexo:</label>
          </div>
          <div class="col">
<div class="form-check mt-1">
    <input class="form-check-input" type="radio" name="radio" id="flexRadioDefault1" value="H">
  <label class="form-check-label" for="flexRadioDefault1">
    H
  </label>
</div>
<div class="form-check mt-1">
    <input class="form-check-input" type="radio" name="radio" id="flexRadioDefault2" value="M">
  <label class="form-check-label" for="flexRadioDefault2">
    M
  </label>
</div>
          </div>
      
      </div>
      <div class="row">
          <div class="col">

        <label for="fechaR">Fecha de registro:</label>
          </div>
<div class="col">

<input  id="fechaR" name="fechaR" class="form-control">
</div>

      </div>
      <div class="row mt-1">
          <div class="col">
          
        <label for="fechaN">Fecha de nacimiento:</label>
          </div>
          <div class="col">

              <input  id="fechaN" name="fechaN" class="form-control">
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="estatura">Estatura:</label>
          </div>
          <div class="col">
              <input type="text" id="estatura" name="estatura" class="form-control">
          </div>
      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="peso">Peso:</label>
          </div>
<div class="col">

    <input type="text" id="peso" name="peso" class="form-control">
</div>

      </div>
      <div class="row" class="button">
          <button type="submit" class="btn btn-primary mt-5" id="boton">ENVIAR</button>
        </div>

  </form>

</div>
</div>
<div class="col">
	<table class="table">
        <thead>
			<tr>
                <th>Matricula</th>
				<th>Nombre</th>
                <th>Carrera</th>
                <th>Acciones</th>
			</tr>
        </thead>
		    <%for(int i=0; i<personas.size();i++){ 
            String others="H";
            if(personas.get(i).sexo.equals("H")){
            others="M";
            }
            %>
            
            
		        <tr>
                    <td><%= personas.get(i).getId() %></td>
		            <td><%= personas.get(i).NombreCompleto() %></td>
                    <td><%= personas.get(i).getCarrera() %></td>  
                    <td><a <%= "href='http://localhost:8080/formulario/update.jsp?id="+personas.get(i).getId()+
           "&&nombre="+ personas.get(i).nombre+
           "&&apellido="+personas.get(i).apellidos+
           "&&domicilio="+personas.get(i).domicilio+
           "&&edad="+personas.get(i).edad+
           "&&telefono="+personas.get(i).telefono+
           "&&tutor="+personas.get(i).tutor+
           "&&carrera="+personas.get(i).carrera+
           "&&sexo="+personas.get(i).sexo+
           "&&fechar="+personas.get(i).fechar+
           "&&fechan="+personas.get(i).fechan+
            "&&others="+others+
            "&&estatura="+personas.get(i).estatura+
            "&&peso="+personas.get(i).peso+
                            "'" %> class="btn btn-success">Actualizar</a>
                        <a <%= "href='http://localhost:8080/formulario/delete.jsp?id="+personas.get(i).getId()+"'" %> class="btn btn-danger">Eliminar</a></td>
		        </tr>
		      <%}%>
		</table>


</div>
</div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script  src="./js/fechaven.js"></script>

  <script src="./js/pagina.js"></script>

</body>

</html>
