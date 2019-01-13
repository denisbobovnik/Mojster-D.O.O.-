package si.um.feri.ost.bobovnik.zahteve;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetZahteva
 */
@WebServlet(urlPatterns="/GetZahteva")
public class GetZahteva extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetZahteva() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>GetZahteva</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Odziv na metodo GET</h1>");
		out.println("<p>Metoda: " + request.getMethod() + "<br />");
		out.println("Protokol: " + request.getProtocol() + "<br />");
		out.println("Glava: " + request.getHeader("User-Agent") + "<br />");
		out.println("Izvorna vrata: " + request.getRemotePort() + "<br />");
		out.println("Ciljna vrata: " + request.getServerPort() + "<br />");
		out.println("Ime strežnika: " + request.getServerName() + "<br /><br />");
		out.println("Parameter ime: " + request.getParameter("ime") + "<br />");
		out.println("Parameter priimek: " + request.getParameter("priimek") + "</p>");
		out.println("</body>");
		out.println("</html>");
	}
}