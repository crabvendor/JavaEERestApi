package servlet;

import jpa.ModelHibernate;
import model.BeerWarehouseEntry;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static servlet.helper.ServletHelper.*;

@WebServlet("/warehouse/beer/*")
public class BeerWarehouseServlet extends HttpServlet {
    private ModelHibernate<BeerWarehouseEntry> warehouseEntryHibernate;

    public BeerWarehouseServlet() {
        this.warehouseEntryHibernate = new ModelHibernate<>();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String[] parameters = req.getRequestURI().split("/");
        String jsonTemplate;
        try {
            if (idExists(parameters, 3)) {
                jsonTemplate = getJsonFromModelWithGivenId(parameters, BeerWarehouseEntry.class, warehouseEntryHibernate);
            } else {
                jsonTemplate = getJsonFromModels(BeerWarehouseEntry.class, warehouseEntryHibernate);
            }
            resp.getWriter().write(jsonTemplate);
        } catch (NoResultException e) {
            sendResponseWithStatus(resp, 404, "No entry with such ID");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Ivalid URI schema: ID not a number");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] uriParts = req.getRequestURI().split("/");
            if(!idExists(uriParts, 3) || !uriParts[2].matches("^\\d+$")) {
                throw new IllegalArgumentException();
            }
            warehouseEntryHibernate.getModel(getIdFromParameters(uriParts, 2), BeerWarehouseEntry.class);
            Map<String, String[]> paramsMap = req.getParameterMap();
            if(paramsMap.size() == 0) {
                sendResponseWithStatus(resp, 400, "You didn't provide any parameters to change!");
            } else {
                if(updateBeerWarehouseEntry(resp, getIdFromParameters(uriParts, 2), paramsMap)) {
                    sendResponseWithStatus(resp, 200, "Beer information updated successfully!");
                }
            }
        } catch (NoResultException e) {
            sendResponseWithStatus(resp, 404, "There is no beer warehouse entry with that id!");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Invalid liters count! Works only for integer or float/double");
        } catch (IllegalArgumentException e) {
            sendResponseWithStatus(resp, 400, "Invalid URI schema, try localhost:8080/warehouse/beer/beerWarehouseEntryID" );
        }
    }

    private boolean updateBeerWarehouseEntry(HttpServletResponse resp, long beerId, Map<String, String[]> paramsMap) throws IOException, NumberFormatException {
        Map<String, Object> fieldsToUpdate = new HashMap<>();
        double liters = 0;
        for(String key: paramsMap.keySet()) {
            switch (key) {
                case "liters":
                    liters = Double.valueOf(paramsMap.get(0)[0]);
                    break;
                default:
                    sendResponseWithStatus(resp, 400, "Invalid parameter!\n Available only: liters(double)");
                    return false;
            }
        }
        fieldsToUpdate.put("liters", liters);
        warehouseEntryHibernate.updateModel(BeerWarehouseEntry.class, fieldsToUpdate, beerId);
        return true;
    }
}
