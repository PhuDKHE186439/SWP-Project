package dto;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountDAO;
import dto.Constants;
import dto.UserGoogleDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.account;
import org.apache.http.client;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

@WebServlet("/loginGoogle")
public class LoginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDTO user = getUserInfo(accessToken);
        
        UserDAO dao = new UserDAO();
        String email = user.getEmail();
        
        if (dao.emailExists(email)) {
            User userObj = dao.getUserByEmail(email); 
            HttpSession session = request.getSession();
            session.setAttribute("role", userObj.getRole());
            session.setAttribute("loggedInUser", userObj.getUsername());
            session.setAttribute("user", userObj);

            response.sendRedirect(" hom1.jsp");
        } else {
            request.setAttribute("error", "Email chưa được đăng ký.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);
        return jsonObject.get("access_token").getAsString();
    }

    private UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String response = Request.Get(Constants.GOOGLE_LINK_GET_USER_INFO + accessToken)
                .execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDTO.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles Google OAuth login";
    }
}
