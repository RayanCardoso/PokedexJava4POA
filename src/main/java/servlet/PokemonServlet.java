package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/pokemon")
public class PokemonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.print("id: " + id);
        
        if (id != null) {
            // Chamada para buscar um Pokémon específico por ID
            getPokemonById(id, request, response);
        } else {
            // Chamada para buscar todos os Pokémon
            getAllPokemons(request, response);
        }
    }
    
    private void getAllPokemons(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urlString = "https://pokeapi.co/api/v2/pokemon?limit=20";
        StringBuilder result = new StringBuilder();

        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        JSONObject jsonObject = new JSONObject(result.toString());
        JSONArray pokemons = jsonObject.getJSONArray("results");

        request.setAttribute("pokemons", pokemons);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pag/pokemonList.jsp");
        dispatcher.forward(request, response);
    }
    
    private void getPokemonById(String id, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Faz a requisição para a API usando o ID fornecido
            String urlString = "https://pokeapi.co/api/v2/pokemon/" + id;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder responseContent = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                responseContent.append(inputLine);
            }
            in.close();

            // Converte a resposta em um JSONObject
            JSONObject pokemon = new JSONObject(responseContent.toString());
            request.setAttribute("pokemon", pokemon);
            System.out.println(pokemon.toString());
            request.setAttribute("id", id);

            // Redireciona para a página de exibição
            request.getRequestDispatcher("/pag/pokemon.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Não foi possível encontrar o Pokémon com ID: " + id);
            request.getRequestDispatcher("/pag/error.jsp").forward(request, response);
        }
    }
}
