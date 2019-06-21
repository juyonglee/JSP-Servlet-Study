

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DatabaseTest
 */
@WebServlet(name = "databaseConnect", urlPatterns = { "/databaseConnect" })
public class DatabaseTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatabaseTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
		String url = "jdbc:mysql://localhost:3306/world?useSSL=false";
		String userID = "juyonglee";
		String userPW = "1234";
		Connection con = null;
		try {
			// 1단계. 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2단계. Database 연결
			con = DriverManager.getConnection(url, userID, userPW);
			System.out.println("연결 성공!");
			response.getWriter().append("연결 성공!");
			// 3단계. 연결 종료
			con.close();
			System.out.println("연결 종료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().append("연결 실패!");
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
