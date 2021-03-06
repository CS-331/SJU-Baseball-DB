package SJUBaseball;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;
import java.lang.Integer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PitchListServlet
 */
@WebServlet("/pitcher")
public class PitcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String pitcherID = request.getParameter("playerId");
        request.setAttribute("playerId", pitcherID);
        
        PlayDao dao = new PlayDao();
        
    	try {
    		// if theres a date but no other options
    		/*
    		if(date != "" && option == "None" && inning == "None")
    		{
                List<Play> playList = dao.getGamePlays(opposingTeam, date);
                request.setAttribute("playList", playList);
     
                RequestDispatcher dispatcher = request.getRequestDispatcher("plays.jsp");
                dispatcher.forward(request, response);
    		}
    		
    		// if theres a date, and an inning but no options just show that inning rather than all of them
    		else if(date != "" && inning != "None" && option =="None")
    		{
    			List<Play> playList = dao.getGamePlaysFromInning(opposingTeam, date, inning);
                request.setAttribute("playList", playList);
                
    			RequestDispatcher dispatcher = request.getRequestDispatcher("inningPlays.jsp");
                dispatcher.forward(request, response);
    		}
    		
    		// if there's option selected at all, disregard all other input other than game and date
    		else if(option != "None" )
    		{

    		}
    		
    		// otherise there is no date so don't go to any new page
    		else
    		{
    			
    		}
    		*/
    		List<Play> playList = dao.getPlaysForPitcher(pitcherID);
            request.setAttribute("playList", playList);
            
			RequestDispatcher dispatcher = request.getRequestDispatcher("pitcherPlays.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
     
    }

}
