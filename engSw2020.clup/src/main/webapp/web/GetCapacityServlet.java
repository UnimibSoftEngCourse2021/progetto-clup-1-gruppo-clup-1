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

import main.webapp.DAO.StoreDao;

/**
 * Servlet implementation class GetCapacityServlet
 */
public class GetCapacityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(GetCapacityServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetCapacityServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDao storeDao = new StoreDao();
		HttpSession session = request.getSession();
		int capacity = 0;
		int idStore = ((Integer) session.getAttribute("id")).intValue();
		try {
			capacity = storeDao.getCapacity(idStore);
		} catch (Exception e) {
			log.log(Level.FINE, e.toString());
		}
		try {
			String json = new Gson().toJson(capacity);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (IOException e) {
			log.log(Level.FINE, e.toString());
		}
	}

}
