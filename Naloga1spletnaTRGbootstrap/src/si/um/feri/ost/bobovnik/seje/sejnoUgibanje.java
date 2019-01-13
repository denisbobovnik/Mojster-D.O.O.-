package si.um.feri.ost.bobovnik.seje;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sejnoUgibanje
 */
@WebServlet(urlPatterns="/sejnoUgibanje")
public class sejnoUgibanje extends HttpServlet {
	private static final long serialVersionUID = 2880684690475097185L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sejnoUgibanje() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>sejnoUgibanje</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>sejnoUgibanje</h1>");
		out.println("Identifikator seje:");
		out.println(session.getId()+"<br/>");
		out.println("Ugibaj število med 1 in 100 (ugib vpiši kot parameter metode get)!<br />");
		
		Random rand = new Random();	
		int generirana = rand.nextInt(100) + 1;
		if(session.getAttribute("generirana") == null)
			session.setAttribute("generirana", generirana);
		int generiranaSession = Integer.parseInt(session.getAttribute("generirana").toString());
		int ugib = Integer.parseInt(request.getParameter("ugib"));
		if (ugib < 1)
			out.println("Ugib mora biti večji od 1!");
		else if (ugib > 100)
			out.println("Ugib mora biti manjši od 10!");
		else if (ugib > generiranaSession)
			out.println("NAROBE! Število je manjše.");
		else if (ugib < generiranaSession)
			out.println("NAROBE! Število je večje.");
		else
			out.println("Čestitke! Uganili ste število.");	
		out.println("</body>");
		out.println("</html>");
	}
}