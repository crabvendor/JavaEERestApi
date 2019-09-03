package servlet;

import jpa.ModelHibernate;
import model.Beer;
import model.BeerWarehouseEntry;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import static servlet.helper.ServletHelper.*;

@WebServlet("/beers/*")
public class BeerServlet extends HttpServlet {
    private ModelHibernate<Beer> beerHibernate;
    private ModelHibernate<BeerWarehouseEntry> beerWarehouseEntryHibernate;

    public BeerServlet() {
        beerHibernate = new ModelHibernate<>();
        beerWarehouseEntryHibernate = new ModelHibernate<>();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String[] parameters = req.getRequestURI().split("/");
        String jsonTemplate;
        try {
            if (idExists(parameters, 3)) {
                jsonTemplate = getJsonFromModelWithGivenId(parameters, Beer.class, beerHibernate);
            } else {
                jsonTemplate = getJsonFromModels(Beer.class, beerHibernate);
            }
            resp.getWriter().write(jsonTemplate);
        } catch (NoResultException e) {
            sendResponseWithStatus(resp, 404, "No entry with such ID");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Ivalid URI schema: ID not a number");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name, type;
        Double price, percent;
        try {
            name = req.getParameter("name");
            type = req.getParameter("type");
            price = Double.valueOf(req.getParameter("price"));
            percent = Double.valueOf(req.getParameter("alcPercent"));
            Beer newBeer = new Beer(name, new Date(), type, price, percent + "%");
            beerWarehouseEntryHibernate.addModel(new BeerWarehouseEntry(newBeer, 0));
            sendResponseWithStatus(resp, 200, "Beer added to database successfully!");
        } catch (NullPointerException e) {
            sendResponseWithStatus(resp, 400, "Not enough parameters, you must add name, type, price and alcPercent!");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Price and alcPercent should be integer or float/double!!");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] uriParts = req.getRequestURI().split("/");
            if (!idExists(uriParts, 3) || !uriParts[2].matches("^\\d+$")) {
                throw new IllegalArgumentException();
            }
            beerHibernate.getModel(getIdFromParameters(uriParts, 2), Beer.class);
            Map<String, String[]> paramsMap = req.getParameterMap();
            if (paramsMap.size() == 0) {
                sendResponseWithStatus(resp, 400, "You didn't provide any parameters to change!");
            } else {
                if (updateBeer(resp, getIdFromParameters(uriParts, 2), paramsMap)) {
                    sendResponseWithStatus(resp, 200, "Beer information updated successfully!");
                }
            }

        } catch (NoResultException e) {
            sendResponseWithStatus(resp, 404, "There is no beer with that id!");
        } catch (ParseException e) {
            sendResponseWithStatus(resp, 400, "Illegal date schema, try dd-mm-yyyy");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Invalid price or percent! Works only for integer or float/double");
        } catch (IllegalArgumentException e) {
            sendResponseWithStatus(resp, 400, "Invalid URI schema, try localhost:8080/beer/beerID");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] parameters = req.getRequestURI().split("/");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        if (idExists(parameters, 3)) {
            beerHibernate.removeModel(getIdFromParameters(parameters, 2), Beer.class);
            sendResponseWithStatus(resp, 200, "Entry removed successfully");
        }
    }

    private boolean updateBeer(HttpServletResponse resp, long beerId, Map<String, String[]> paramsMap) throws IOException, ParseException, NumberFormatException {
        Map<String, Object> fieldsToUpdate = new HashMap<>();
        for (String key : paramsMap.keySet()) {
            switch (key) {
                case "type":
                case "name":
                    fieldsToUpdate.put(key, paramsMap.get(key)[0]);
                    break;
                case "marketIntroductionDate":
                    String dateString = paramsMap.get(key)[0];
                    DateFormat format = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
                    Date date = format.parse(dateString);
                    fieldsToUpdate.put(key, date);
                    break;
                case "alcPercent":
                case "price":
                    String price = paramsMap.get(key)[0];
                    fieldsToUpdate.put(key, Double.valueOf(price));
                    break;
                default:
                    sendResponseWithStatus(resp, 400, "Invalid parameter!\n Available only: name(String), type(String)," +
                            " marketIntroductionDate(dd-MM-yyyy), price(integer or float/double), alcPercent(integer of float/double)");
                    return false;
            }
        }
        beerHibernate.updateModel(Beer.class, fieldsToUpdate, beerId);
        return true;
    }
}
