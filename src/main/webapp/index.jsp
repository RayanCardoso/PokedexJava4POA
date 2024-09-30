<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Página Inicial</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/pokedex.css">
    <style>
    	.hello-world-pokedex{
    		display: flex;
    		justify-content: center;
    		align-items: center
    	}
    	
    	.page-content{
			margin: 5rem;
    	}
    	
    	.tenor-gif-embed{
    		height: 500px;
    	}
    	
    	.image_container{
    		display:flex;
    		justify-content: center;
    		align-itens: center;
    		
    	}
    </style>
</head>
<body >
	<div class="page-content">
		<div class="image_container">
			<img src="./assets/images/pika-pikachu.gif" alt="Descrição do GIF" width="300" height="300">
		</div>
	    <h1 class="hello-world-pokedex">Bem-vindo à Pokédex!</h1>
	    <div class="container-botao-pokedex">
		    <a href="pokemon" class="botao-pokedex">Ver Lista de Pokémon</a>
		</div>
	</div>
</body>
</html>
