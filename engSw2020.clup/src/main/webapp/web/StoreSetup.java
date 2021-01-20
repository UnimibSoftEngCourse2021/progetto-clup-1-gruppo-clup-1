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
 * Servlet implementation class StoreSetup
 */
public class StoreSetup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreSetup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	HttpSession session = request.getSession();
    	int idStoreUser = ((Integer) session.getAttribute("idStore")).intValue();
    	Store store = new Store();
    	StoreDao storeDao = new StoreDao();
    	try {
    		store = storeDao.getStoreInfo(idStoreUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	request.setAttribute("Name", store.getName());
    	request.setAttribute("Descrizione", store.getDesprition());
    	request.setAttribute("NumeroDiTelefono", store.getTelephoneNumber());
    	request.setAttribute("Indirizzo", store.getAddress());
    	request.setAttribute("City", store.getCity());
    	request.setAttribute("Capienza", store.getCapacity());
    	request.setAttribute("CapienzaPrenotabile", store.getBookableCapacity());
    	request.getRequestDispatcher("/storeSetup.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
