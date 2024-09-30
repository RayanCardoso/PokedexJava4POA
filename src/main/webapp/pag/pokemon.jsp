<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/pokedex.css">
    <title>Detalhes do Pokémon</title>
</head>
<body>
    <%
        JSONObject pokemon = (JSONObject) request.getAttribute("pokemon");
    	String id = (String) request.getAttribute("id");
        if (pokemon != null) {
            String name = pokemon.getString("name");
            int height = pokemon.getInt("height");
            int weight = pokemon.getInt("weight");
            JSONArray typesArray = pokemon.getJSONArray("types");
            JSONArray statsArray = pokemon.getJSONArray("stats");
    %>
   			<div class="container-botao-pokedex">
			    <a href="pokemon" class="botao-pokedex">Voltar à lista</a>
			</div>
    		<div id="pokedex">
			  <div id="left">
			    <div id="logo"></div>
			    <div id="bg_curve1_left"></div>
			    <div id="bg_curve2_left"></div>
			    <div id="curve1_left">
			      <div id="buttonGlass">
			        <div id="reflect"> </div>
			      </div>
			      <div id="miniButtonGlass1"></div>
			      <div id="miniButtonGlass2"></div>
			      <div id="miniButtonGlass3"></div>
			    </div>
			    <div id="curve2_left">
			      <div id="junction">
			        <div id="junction1"></div>
			        <div id="junction2"></div>
			      </div>
			    </div>
			    <div id="screen">
			      <div id="topPicture">
			        <div id="buttontopPicture1"></div>
			        <div id="buttontopPicture2"></div>
			      </div>
			      <div id="picture">
			        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/<%= id %>.png" height="170" />
			      </div>
			      <div id="buttonbottomPicture"></div>
			      <div id="speakers">
			        <div class="sp"></div>
			        <div class="sp"></div>
			        <div class="sp"></div>
			        <div class="sp"></div>
			      </div>
			    </div>
			    <div id="bigbluebutton"></div>
			    <div id="barbutton1"></div>
			    <div id="barbutton2"></div>
			    <div id="cross">
			      <div id="leftcross">
			        <div id="leftT"></div>
			      </div>
			      <div id="topcross">
			        <div id="upT"></div>
			      </div>
			      <div id="rightcross">
			        <div id="rightT"></div>
			      </div>
			      <div id="midcross">
			        <div id="midCircle"></div>
			      </div>
			      <div id="botcross">
			        <div id="downT"></div>
			      </div>
			    </div>
			  </div>
			  <div id="right">
			    <div id="stats">
				    <strong>Name:</strong> <%= name %><br/>
				    <div class="stats-container">
				        <div class="left-column">
				            <strong>Altura:</strong> <%= height %><br/>
				            <strong>Peso:</strong> <%= weight %><br/>
				            <strong>Tipos:</strong>
				            <div class="container-types-pokedex">
				                <%
				                    // Iterar sobre o array de tipos
				                    for (int i = 0; i < typesArray.length(); i++) {
				                        JSONObject typeObject = typesArray.getJSONObject(i);
				                        int slot = typeObject.getInt("slot");
				                        JSONObject typeDetails = typeObject.getJSONObject("type");
				                        String typeName = typeDetails.getString("name");
				                %>
				                        <div>Tipo <%= slot %>: <%= typeName %></div>
				                <%
				                    }
				                %>
				            </div>
				        </div>
				        <div class="right-column">
				            <%
				                // Iterar sobre o array de stats
				                for (int i = 0; i < statsArray.length(); i++) {
				                    JSONObject statObject = statsArray.getJSONObject(i);
				                    int baseStat = statObject.getInt("base_stat");
				                    int effort = statObject.getInt("effort");
				                    JSONObject statDetails = statObject.getJSONObject("stat");
				                    String statName = statDetails.getString("name");
				            %>
				                    <div><strong><%= statName %>:</strong> <%= baseStat %></div>
				            <%
				                }
				            %>
				        </div>
				    </div>
				</div>
			    <div id="blueButtons1">
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			    </div>
			    <div id="blueButtons2">
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			      <div class="blueButton"></div>
			    </div>
			    <div id="miniButtonGlass4"></div>
			    <div id="miniButtonGlass5"></div>
			    <div id="barbutton3"></div>
			    <div id="barbutton4"></div>
			    <div id="yellowBox1"></div>
			    <div id="yellowBox2"></div>
			    <div id="bg_curve1_right"></div>
			    <div id="bg_curve2_right"></div>
			    <div id="curve1_right"></div>
			    <div id="curve2_right"></div>
			  </div>
			</div>

    <%
        } else {
    %>
            <p>Não foi possível encontrar os detalhes do Pokémon.</p>
            <a href="index.jsp">Voltar à lista</a>
    <%
        }
    %>
</body>
</html>
