<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>

<%      
            String numero_contro = request.getParameter("No_Control");
			String nombre = request.getParameter("user_name");
			String apellido = request.getParameter("Apellido");
			String domicilio = request.getParameter("domicilio");	
			int edad = Integer.parseInt(request.getParameter("Edad")); 
			String telefono = request.getParameter("Telefono");
            String carrera = request.getParameter("Carrera");
			String sexo = request.getParameter("radio");
			String fechareg = request.getParameter("fechaR");
            String fechanac = request.getParameter("fechaN");
            String padre = request.getParameter("padre");

			float estatura = Float.parseFloat(request.getParameter("estatura"));
			float peso = Float.parseFloat(request.getParameter("peso"));
        
           
            out.println("Driver registrado<br>"+numero_contro);
            Class.forName("org.postgresql.Driver");
			String url="jdbc:postgresql://172.18.0.1:5432/root";
            Connection conexion = DriverManager.getConnection(url, "root", "root");
            out.println("<br>Conexión lista<br>");
	        

			PreparedStatement pst =
            conexion.prepareStatement
            ("update personas set  nombre=? , apellido=?, domicilio=?, edad=?, telefono=?, carrera=?,sexo=?, fechar=?, fechan=?, tutor=?, estatura=?, peso=? where numero_control=?");
        pst.setString(1, nombre);
        pst.setString(2, apellido);
        pst.setString(3, domicilio);
        pst.setInt(4, edad);
        pst.setString(5, telefono);
        pst.setString(6, carrera);
        pst.setString(7, sexo);
        pst.setString(8, fechareg);
        pst.setString(9, fechanac);
        pst.setString(10, padre);
        pst.setFloat(11, estatura);
        pst.setFloat(12, peso);
        pst.setString(13,numero_contro);
        pst.executeUpdate();
        out.println("Update de alumno exitosa");

        pst.close();
        conexion.close();
        out.println("<br><a href=" + request.getContextPath() + ">Volver</a>");
%>
