package main.webapp.web;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.webapp.DAO.BookingDao;
import main.webapp.DAO.StoreDao;

/**
 * Servlet implementation class GetPeopleStoreServlet
 */
public class GetPeopleStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(GetPeopleStoreServlet.class.getName());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPeopleStoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingDao bookingDao = new BookingDao();
		HttpSession session = request.getSession();
		int people=0;
		int idStore = ((Integer) session.getAttribute("id")).intValue();
		try {
			people=bookingDao.getPeopleAtStore(idStore);
		}
		catch(Exception e){
			log.log(Level.FINE, e.toString());
		}
		 String json = new Gson().toJson(people);

		 response.setContentType("application/json");
		 response.setCharacterEncoding("UTF-8");
		 response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
