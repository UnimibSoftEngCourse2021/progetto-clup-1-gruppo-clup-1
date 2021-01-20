package main.webapp.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.webapp.DAO.StoreDao;
import main.webapp.model.Store;

/**
 * Servlet implementation class UpdateStoreInfo
 */
public class UpdateStoreInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStoreInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int result = 0;
		HttpSession session = request.getSession();
		int idStoreUser = ((Integer) session.getAttribute("idStore")).intValue();
		String descrizione = request.getParameter("descrizione");
		String telefono = request.getParameter("Telefono");
		String indirizzo = request.getParameter("Indirizzo");
		String city = request.getParameter("city");
		int capienza = Integer.parseInt(request.getParameter("quantity"));
		int capienzaPrenotabile = Integer.parseInt(request.getParameter("postiPrenotabili"));
		Store store = new Store();
		store.setIdStore(idStoreUser);
		store.setDesprition(descrizione);
		store.setTelephoneNumber(telefono);
		store.setAddress(indirizzo);
		store.setCity(city);
		store.setCapacity(capienza);
		store.setBookableCapacity(capienzaPrenotabile);
		StoreDao storeDao = new StoreDao();
		try {
			result = storeDao.updateData(store);
			if (result > 0) {
				request.setAttribute("msg", "OK");
				request.getRequestDispatcher("/homepageManager.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Errore durante l'aggiornamento. Riprovare");
				request.getRequestDispatcher("/storeSetup.jsp").forward(request, response);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
