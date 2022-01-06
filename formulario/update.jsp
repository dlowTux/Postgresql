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
   


<a href="http://localhost:8080/formulario/">Volver</a>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script  src="./js/fechaven.js"></script>

<div class="container">

<form class="mt-5" style="text-align: center;" method="GET" action="<%=request.getContextPath()%>/updates.jsp" >
    <div class="row">
        <div class="col">
          <label for="NoControl">Numero de control:</label>
        </div>
        <div class="col">
            <input class="form-control " type="text" id="control" name="No_Control" 
            <%= "value='"+request.getParameter("id")+"'" %> 
            >
        </div>
    </div>  

      <div class="row mt-1">
          <div class="col">
          <label for="name">Nombre:</label>
          </div>
          <div class="col">
              <input type="text" class="form-control" id="name" name="user_name"
              <%= "value='"+request.getParameter("nombre")+"'" %>
              >
          </div>
     </div>

      <div class="row mt-1">
          <div class="col">
              <label for="Apellidos">Apellidos:</label>
          </div>
          <div class="col">
              <input type="text" class="form-control" id="apellidos"
                                                      name="Apellido"
                <%= "value='"+request.getParameter("apellido")+"'" %>

              >
          </div>
      </div>
           
      <div class="row mt-1">
          <div class="col">

        <label for="Domicilio">Domicilio:</label>
          </div>
          <div class="col">
          
              <input type="text" id="domicilio" name="domicilio" class="form-control"
              <%= "value='"+request.getParameter("domicilio")+"'" %>
              >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Edad">Edad:</label>
          </div>
          <div class="col">
              <input  class="form-control" id="edad" name="Edad" 
              <%= "value='"+request.getParameter("edad")+"'" %>
              >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Telefono">Telefono:</label>
          </div>
          <div class="col">

              <input type="tel" id="telefono" name="Telefono" class="form-control"

              <%= "value='"+request.getParameter("telefono")+"'" %>
              >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="Padre o tutor">Padre o tutor:</label>
          </div>
          <div class="col">
              <input type="text" id="padre" name="Padre o tutor" class="form-control"
              <%= "value='"+request.getParameter("tutor")+"'" %>
              >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">
        <label for="Carrera">Carrera</label>
          </div>
          <div class="col">
           <select name='Carrera' class='form-select' id='carrera'>
            <option <%="value='"+request.getParameter("carrera")+"'"%>
            >
                <%=
           "*"+request.getParameter("carrera")+"*"%>
            </option>
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
    <input class="form-check-input" type="radio" name="radio" id="flexRadioDefault1" 
    <%="value='"+request.getParameter("sexo")+"'"%> checked
    >
  <label class="form-check-label" for="flexRadioDefault1">
      <%=" "+request.getParameter("sexo")+" "%>
  </label>
</div>
<div class="form-check mt-1">
    <input class="form-check-input" type="radio" name="radio" id="flexRadioDefault2" 
    <%="value='"+request.getParameter("others")+"'" %>
    >
  <label class="form-check-label" for="flexRadioDefault2">
      <%=" "+request.getParameter("others")+" "%>
  </label>
</div>
          </div>
      
      </div>
      <div class="row">
          <div class="col">

        <label for="fechaR">Fecha de registro:</label>
          </div>
<div class="col">

<input  id="fechaR" name="fechaR" class="form-control"
<%="value='"+request.getParameter("fechar")+"'"%> 
>
</div>

      </div>
      <div class="row mt-1">
          <div class="col">
          
        <label for="fechaN">Fecha de nacimiento:</label>
          </div>
          <div class="col">

              <input  id="fechaN" name="fechaN" class="form-control" 
              <%="value='"+request.getParameter("fechan")+"'"%> 
              >
          </div>

      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="estatura">Estatura:</label>
          </div>
          <div class="col">
              <input type="text" id="estatura" name="estatura" class="form-control"
                <%="value='"+request.getParameter("estatura")+"'"%> 
              >
          </div>
      </div>
      <div class="row mt-1">
          <div class="col">

        <label for="peso">Peso:</label>
          </div>
<div class="col">

    <input type="text" id="peso" name="peso" class="form-control"
         <%="value='"+request.getParameter("peso")+"'"%> 
    >
</div>

      </div>
      <div class="row" class="button">
          <button type="submit" class="btn btn-primary mt-5" id="boton">ENVIAR</button>
        </div>

  </form>

</div>      

                    
		      

</body>

</html>
