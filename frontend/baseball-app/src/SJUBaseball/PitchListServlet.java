package SJUBaseball;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PitchListServlet
 */
@WebServlet("/pitches")
public class PitchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamId = request.getParameter("game");
     
        request.setAttribute("selectedTeam", teamId);
        
        GameDAO dao = new GameDAO();
    	try {
            List<Play> playList = dao.getGamePlays(999);
            request.setAttribute("playList", playList);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("Pitches.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
     
    }

}
