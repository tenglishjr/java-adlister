import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "OrderPizzaServlet", urlPatterns = "/order")
public class OrderPizzaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        Variables from pizza form:
//            name, address, size, sauce, toppings
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String size = request.getParameter("size");
        String sauce = request.getParameter("sauce");
        String[] toppingsArr = request.getParameterValues("toppings[]");
        String toppings = "";

        for (String topping: toppingsArr) {
            toppings += topping + ", ";
        }

        request.setAttribute("name", name);
        request.setAttribute("address", address);
        request.setAttribute("size", size);
        request.setAttribute("sauce", sauce);
        request.setAttribute("toppings", toppings);

        request.getRequestDispatcher("pizza-confirm.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("pizza-form.jsp").forward(request, response);
    }
}
