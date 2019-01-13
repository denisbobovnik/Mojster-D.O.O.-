package si.um.feri.ost.bobovnik.zahteve;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetKalkulator
 */
@WebServlet(urlPatterns="/GetKalkulator")
public class GetKalkulator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetKalkulator() {
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
		out.println("<title>GetKalkulator</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>GetKalkulator</h1>");
		out.println("<p>Ta servlet izvede podano operacijo nad podanima številoma!</p>");
		double op1 = Double.parseDouble(request.getParameter("op1")), op2 = Double.parseDouble(request.getParameter("op2"));
		char operacija = request.getParameter("operacija").charAt(0);
		out.println("<p>Število 1: " + op1 + "<br />");
		out.println("Število 2: " + op2 + "<br />");
		out.println("Operacija: " + operacija + "<br />");
		if (operacija == 'p') //ga sploh ne zazna
			out.println("<br />Vsota operandov je: " + (op1 + op2) + "</p>");
		else if (operacija == '-')
			out.println("<br />Razlika operandov je: " + (op1 - op2) + "</p>");
		else if (operacija == '*')
			out.println("<br />Zmnožek operandov je: " + (op1 * op2) + "</p>");
		else if (operacija == '/')
			if (op2 != 0)
				out.println("<br />Količnik operandov je: " + (op1 / op2) + "</p>");
			else
				out.println("<br />OPOZORILO: Neveljavno vnešen drugi operand (deljenje z 0)!</p>");
		else
			out.println("<br />OPOZORILO: Neveljavno vnešena računska operacija!</p>");
		out.println("</body>");
		out.println("</html>");
	}
}