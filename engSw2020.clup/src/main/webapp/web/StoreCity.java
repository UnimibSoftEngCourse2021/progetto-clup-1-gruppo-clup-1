package main.webapp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import main.webapp.DAO.BookingDao;

/**
 * Servlet implementation class StoreCity
 */
public class StoreCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreCity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger log = Logger.getLogger(StoreCity.class.getName());

		try {
		BookingDao bookingDao = new BookingDao();
		ArrayList<String> city = new ArrayList<String>();
		city = bookingDao.getCities();
		String json = new Gson().toJson(city);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		}catch (IOException e) {
			log.log(Level.FINE, e.toString());

		}
	}
}
