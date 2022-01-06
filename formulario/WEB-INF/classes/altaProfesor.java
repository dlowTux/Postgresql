import javax.servlet.http.*;
import java.io.*;
import java.rmi.*;
import java.sql.*;
import java.time.*;
import java.time.format.*;

public class altaProfesor extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException
	{
		PrintWriter out = response.getWriter();

		try
		{
			response.setContentType("text/html");
			request.setCharacterEncoding("UTF-8");
			HttpSession sesion = request.getSession(true);
            String numero_contro=request.getParameter("No_Control");
			String nombre = request.getParameter("user_name");
			String apellido = request.getParameter("Apellido");
			String domicilio = request.getParameter("domicilio");	
			int edad = Integer.parseInt(request.getParameter("Edad")); 
			String telefono = request.getParameter("Telefono");
            String carrera = request.getParameter("Carrera");
			String sexo = request.getParameter("radio");
            out.println("Sexo");
            out.println(sexo);
			String fechareg = request.getParameter("fechaR");
            String fechanac = request.getParameter("fechaN");
            String padre=request.getParameter("padre");

			float estatura = Float.parseFloat(request.getParameter("estatura"));
			float peso = Float.parseFloat(request.getParameter("peso"));
out.println("inicio<br>");
			Class.forName("org.postgresql.Driver");
			out.println("Driver registrado<br>");

			//String url = "jdbc:postgresql://127.0.0.1/escuela";
			String url ="jdbc:postgresql://172.18.0.1:5432/root" ;

			out.println("Conectando a... " + url);

			//Connection conexion = DriverManager.getConnection(url, user, pass);
			Connection conexion = DriverManager.getConnection(url,"root","root");
			out.println("<br>Conexión lista<br>");
	


			PreparedStatement pst = 
                conexion.prepareStatement
                ("insert into personas values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, numero_contro);
			pst.setString(2, nombre);
			pst.setString(3, apellido);
			pst.setString(4, domicilio);
			pst.setInt(5, edad);
            pst.setString(6,telefono);
            pst.setString(7,carrera);
            pst.setString(8,sexo);
            pst.setString(9,fechareg);
            pst.setString(10,fechanac);
            pst.setString(11,padre);
            pst.setFloat(12,estatura);
            pst.setFloat(13,peso);
			
			pst.executeUpdate();
			out.println("Inserción de profesor exitosa");

			pst.close();
			conexion.close();
			out.println("<br><a href="+ request.getContextPath() +">Volver</a>");
		}
		catch(SQLException e)
		{
			out.println("Ocurrio un error en alta de profesor: " + e);
		}
		catch (Exception ex) {
			out.println("Se ha lanzado una excepción que no es una SQLException: "+ ex.getMessage());
	        } 
	}
}
