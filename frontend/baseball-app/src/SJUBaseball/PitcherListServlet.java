package SJUBaseball;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PitchListServlet
 */
@WebServlet("/pitchers")
public class PitcherListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        PlayDao dao = new PlayDao();
        
    	try {
    		List<Pitcher> pitcherList = dao.getPitchers();
    	    request.setAttribute("pitcherList", pitcherList);
            
			RequestDispatcher dispatcher = request.getRequestDispatcher("pitcher-stats.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
     
    }

}
