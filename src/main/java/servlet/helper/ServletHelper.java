package servlet.helper;

import com.google.gson.Gson;
import jpa.ModelHibernate;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ServletHelper {
    public static void sendResponseWithStatus(HttpServletResponse resp, int status, String message) throws IOException {
        resp.setStatus(status);
        resp.getWriter().write(message);
    }

    public static long getIdFromParameters(String[] parameters, int idLocationInURI) throws NumberFormatException{
        return Long.parseLong(parameters[idLocationInURI]);
    }

    public static boolean idExists(String[] parameters, int idLocationInURI) {
        return parameters.length >= idLocationInURI;
    }

    public static <E> String getJsonFromModelWithGivenId(String[] parameters, Class<E> modelClass,
                                                                    ModelHibernate<E> modelHibernate) throws NoResultException, NumberFormatException {
        long ID = getIdFromParameters(parameters, 3);
        E warehouseEntry = modelHibernate.getModel(ID, modelClass);
        return new Gson().toJson(warehouseEntry);
    }

    public static <E> String getJsonFromModels(Class<E> modelClass, ModelHibernate<E> modelHibernate) {
        List<E> beerList = modelHibernate.getAllModels(modelClass);
        return new Gson().toJson(beerList);
    }
}
