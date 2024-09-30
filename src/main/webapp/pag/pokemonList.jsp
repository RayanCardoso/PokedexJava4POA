<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Pokémon List</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/pokedex.css">
    <style>

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            font-size: 2.5em;
            color: #ffcc00;
            text-shadow: 1px 1px 2px #000;
        }

        ul {
            list-style-type: none;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 15px;
            width: 100%;
            max-width: 900px;
        }

        li {
            background: #ffffff;
            margin: 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.2s;
        }

        li:hover {
            transform: scale(1.05);
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }

        form {
            display: inline-block; /* Mantém o botão do formulário alinhado corretamente */
        }

        button {
            background-color: transparent; /* Para que o link tenha uma aparência limpa */
            border: none;
            cursor: pointer;
            padding: 0;
            color: #007bff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Lista de Pokémons</h1>
    <ul>
        <%
            JSONArray pokemons = (JSONArray) request.getAttribute("pokemons");
            if (pokemons != null) {
                for (int i = 0; i < pokemons.length(); i++) {
                    JSONObject pokemon = pokemons.getJSONObject(i);
                    String name = pokemon.getString("name");
                    String url = pokemon.getString("url");
                    String id = String.valueOf(i + 1); // Obtém o ID a partir da URL
        %>
                    <li>
                        <form action="pokemon" method="get">
			                <input type="hidden" name="id" value="<%= id %>"/>
			                <button type="submit" class="botao-pokedex"><%= name %></button>
			            </form>
                        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/<%= id %>.png" alt="<%= name %> sprite" />
                    </li>
        <%
                }
            } else {
        %>
                <li>Nenhum Pokémon encontrado.</li>
        <%
            }
        %>
    </ul>
</body>
</html>
