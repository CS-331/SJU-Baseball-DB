package SJUBaseball;

import java.util.List;
import java.sql.SQLException;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GameListServlet
 */
@WebServlet("/menu")
public class GameListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	GameDAO dao = new GameDAO();
    	try {
            List<Game> gameList = dao.getGames();
            request.setAttribute("gameList", gameList);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("game-selection.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
