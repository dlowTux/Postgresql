import javax.servlet.http.*;
import java.io.*;
import java.rmi.*;
import java.sql.*;
import java.time.*;
import java.time.format.*;

public class alta extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException
	{
		PrintWriter out = response.getWriter();

		try
		{
			response.setContentType("text/html");
			request.setCharacterEncoding("UTF-8");
			HttpSession sesion = request.getSession(true);

			String fecha=request.getParameter("fecha");
            int cheque = Integer.parseInt(request.getParameter("cheque"));
			float importe = Float.parseFloat(request.getParameter("importe"));
            String concepto=request.getParameter("concepto");
			out.println("inicio<br>");
			Class.forName("org.postgresql.Driver");
			out.println("Driver registrado<br>");

			//string url = "jdbc:postgresql://127.0.0.1/escuela";
			String url ="jdbc:postgresql://172.18.0.1:5432/root" ;

			out.println("Conectando a... " + url);

			//Connection conexion = DriverManager.getConnection(url, user, pass);
			Connection conexion = DriverManager.getConnection(url,"root","root");
			out.println("<br>Conexión lista<br>");
			PreparedStatement pst = conexion.prepareStatement("insert into ingre values (?,?,?,?)");
			pst.setString(1, fecha);
			pst.setInt(2, cheque);
			pst.setFloat(3, importe);
			pst.setString(4,concepto);

		
			pst.executeUpdate();
			out.println("Inserción de alumno exitosa");

			pst.close();
			conexion.close();

		}
		catch(SQLException e)
		{
			out.println("Ocurrio un error en alta de registro: " + e);
		}
		catch (Exception ex) {
			out.println("Se ha lanzado una excepción que no es una SQLException: "+ ex.getMessage());
	        } 
	}
}
