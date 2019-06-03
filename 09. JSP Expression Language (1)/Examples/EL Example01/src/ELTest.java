

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ELTest
 */
@WebServlet(name = "EL", urlPatterns = { "/EL" })
public class ELTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Step01. 요청이 들어온다.
		try {
			// Step02. 요청에서 Parameter를 추출한다.
			String num01Str = request.getParameter("num01");
			String num02Str = request.getParameter("num02");
			// Step03. 추출된 Parameter를 가공하여 데이터를 추가한다.
			int num01 = Integer.parseInt(num01Str);
			int num02 = Integer.parseInt(num02Str);
			int sum = num01 + num02;
			// Step04. 최종 결과 화면에 데이터를 실어 보낸다.
			// page, request, session, application
			request.setAttribute("NUM01", num01);
			request.setAttribute("NUM02", num02);
			request.setAttribute("SUM", sum);
			RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e){
			response.getWriter().print(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
