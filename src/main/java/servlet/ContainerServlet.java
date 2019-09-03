package servlet;

import jpa.ModelHibernate;
import model.Container;
import model.ContainerWarehouseEntry;

import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import static servlet.helper.ServletHelper.*;

@WebServlet("/containers/*")
public class ContainerServlet extends HttpServlet {
    private ModelHibernate<Container> containerHibernate;
    private ModelHibernate<ContainerWarehouseEntry> containerWarehouseEntryHibernate;

    public ContainerServlet() {
        containerHibernate = new ModelHibernate<>();
        containerWarehouseEntryHibernate = new ModelHibernate<>();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String[] parameters = req.getRequestURI().split("/");
        String jsonTemplate;
        try {
            if (idExists(parameters, 3)) {
                jsonTemplate = getJsonFromModelWithGivenId(parameters, Container.class, containerHibernate);
            } else {
                jsonTemplate = getJsonFromModels(Container.class, containerHibernate);
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
        Double capacity, price;
        Container.ContainerType containerType;
        try {
            capacity = Double.valueOf(req.getParameter("capacity"));
            price = Double.valueOf(req.getParameter("price"));
            switch (req.getParameter("type").toLowerCase()){
                case "barrel":
                    containerType = Container.ContainerType.BARREL;
                    break;
                case "can":
                    containerType = Container.ContainerType.CAN;
                    break;
                case "bottle":
                    containerType = Container.ContainerType.BOTTLE;
                    break;
                default:
                    throw new IllegalArgumentException();
            }
            Container newContainer = new Container(capacity, price, containerType);
            containerWarehouseEntryHibernate.addModel(new ContainerWarehouseEntry(newContainer, 0));
            sendResponseWithStatus(resp, 200, "Container added to database successfully!");
        } catch (NullPointerException e) {
            sendResponseWithStatus(resp, 400, "Not enough parameters, you must add type, price and capacity!");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Price and capacity should be integer or float/double!!");
        } catch (IllegalArgumentException e) {
            sendResponseWithStatus(resp, 400, "Type should be barrel, can or bottle!");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] uriParts = req.getRequestURI().split("/");
            if(!idExists(uriParts,3) || !uriParts[2].matches("^\\d+$")) {
                throw new IllegalArgumentException();
            }
            containerHibernate.getModel(getIdFromParameters(uriParts, 2), Container.class);
            Map<String, String[]> paramsMap = req.getParameterMap();
            if(paramsMap.size() == 0) {
                sendResponseWithStatus(resp, 400, "You didn't provide any parameters to change!");
            } else {
                if(updateContainer(resp, getIdFromParameters(uriParts, 2), paramsMap)) {
                    resp.getWriter().write("Container information updated successfully!");
                }
            }
        } catch (NoResultException e) {
            sendResponseWithStatus(resp, 404, "There is no container with that id!");
        } catch (NumberFormatException e) {
            sendResponseWithStatus(resp, 400, "Invalid price or capacity! Works only for integer or float/double");
        } catch (IllegalArgumentException e) {
            sendResponseWithStatus(resp, 400, "Invalid URI schema, try localhost:8080/beer/beerID" );
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] parameters = req.getRequestURI().split("/");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        if (idExists(parameters, 3)) {
            containerHibernate.removeModel(getIdFromParameters(parameters, 2), Container.class);
            sendResponseWithStatus(resp, 200, "Entry removed successfully");
        }
    }

    private boolean updateContainer(HttpServletResponse resp, long containerId, Map<String, String[]> paramsMap) throws IllegalArgumentException, IOException, NumberFormatException {
        Map<String, Object> fieldsToUpdate = new HashMap<>();
        for(String key: paramsMap.keySet()) {
            switch (key) {
                case "type":
                    switch (key){
                        case "barrel":
                            fieldsToUpdate.put(key, Container.ContainerType.BARREL);
                            break;
                        case "can":
                            fieldsToUpdate.put(key, Container.ContainerType.CAN);
                            break;
                        case "bottle":
                            fieldsToUpdate.put(key, Container.ContainerType.BOTTLE);
                            break;
                        default:
                            sendResponseWithStatus(resp, 400, "Invalid type! Available only can, barrel or bottle");
                            return false;
                    }
                case "capacity":
                case "price":
                    String price = paramsMap.get(key)[0];
                    fieldsToUpdate.put(key, Double.valueOf(price));
                    break;
                default:
                    sendResponseWithStatus(resp, 400, "Invalid parameter!\n Available only: type(String)," +
                            " price(integer or float/double), capacity(integer of float/double)");
                    return false;
            }
        }
        containerHibernate.updateModel(Container.class, fieldsToUpdate, containerId);
        return true;
    }
}
