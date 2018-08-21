import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "GuessServlet", urlPatterns = "/guess")
public class GuessServlet extends HttpServlet {

    private Random random = new Random();
    private int randomNo = random.nextInt(100 - 1) + 1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        int randomNo = 52;
        int guess = Integer.parseInt(request.getParameter("guess"));
        request.setAttribute("guess", guess);
        request.setAttribute("random", randomNo);
        System.out.println(randomNo);
        if (guess == randomNo) {
            request.getRequestDispatcher("guess.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("guess-form.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("guess-form.jsp").forward(request, response);
    }
}
