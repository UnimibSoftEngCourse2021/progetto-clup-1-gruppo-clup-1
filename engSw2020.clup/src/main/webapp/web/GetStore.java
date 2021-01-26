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
import main.webapp.model.Store;

/**
 * Servlet implementation class GetStore
 */
public class GetStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(GetStore.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetStore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookingDao bookingDao = new BookingDao();
		ArrayList<Store> stores = new ArrayList<Store>();
		stores = bookingDao.getStores(request.getParameter("city"));
		try {
			String json = new Gson().toJson(stores);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
