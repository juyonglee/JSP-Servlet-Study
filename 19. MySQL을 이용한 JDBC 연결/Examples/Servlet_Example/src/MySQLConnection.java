

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MySQLConnection")
public class MySQLConnection extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	Connection con;
       
    public MySQLConnection() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	String serverUrl = "jdbc:mysql://localhost:3306/world?useSSL=false";
		String userID = "juyonglee";
		String userPW = "1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(serverUrl, userID, userPW);
			System.out.println("연결 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패!");
		}
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		response.getWriter().append("Servlet을 이용한 MySQL 연결 예제");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		super.destroy();
		if(con != null) {
			try {
				con.close();
				System.out.println("연결 종료 성공!");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("연결 종료 실패!");
			}
		}
	}

}
