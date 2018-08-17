import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PageCountServlet", urlPatterns = "/count")
public class PageCountServlet extends HttpServlet {
        private int totalViews = 0;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

        totalViews++;
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        if (req.getParameter("views") != null) {
            totalViews = Integer.parseInt(req.getParameter("views"));
            out.printf("<h3>Total page hits: %d</h3>", totalViews);
        } else {
            out.printf("<h3>Total page hits: %d</h3>", totalViews);
        }

    }
}

//   2. Create a page that displays a number that goes up by 1 everytime the /count page is viewed.
//
//    Bonus
//
//      Allow the user to pass a parameter in the query string to reset the counter.