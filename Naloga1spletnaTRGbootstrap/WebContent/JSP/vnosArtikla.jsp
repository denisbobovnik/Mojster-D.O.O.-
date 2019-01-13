<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="si.um.feri.ost.bobovnik.artikli.Artikel"%>
<%@page import="si.um.feri.ost.bobovnik.artikli.SeznamArtiklov"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Mojster D.O.O. | vnosArtikla</title>
		<!-- <link rel="stylesheet" type="text/css" href="../CSS/style.css">-->
		<script src="../JS/script.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
				<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Mojster D.O.O.!</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="index.html">Prva stran</a></li>
					<li><a href="podatki.html">Podatki o trgovini</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Kategorije izdelkov<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="dodatki.html">Dodatki za mobilne naprave</a></li>
							<li><a href="#">Mobilni telefoni</a></li>
							<li><a href="#">Računalniki</a></li>
							<li><a href="#">Računalniške komponente</a></li>
						</ul></li>
					<li><a href="#">Kolekcija najbolje prodajanih izdelkov</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Akcijske ponudbe<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="akcijske.html">Naročniški
									paketi</a></li>
							<li><a href="ugibanje.html">Ugibanje števil</a></li>
							<li><a href="kalkulator.html">Kalkulator</a></li>
						</ul></li>
				</ul>
				<p id="uraInDatum" class="navbar-text navbar-right"
					style="margin-right: 0px;"></p>
			</div>
		</div>
	</nav>
	<script>
		window.onload = date_time('uraInDatum');
	</script>
		<div class="container-fluid">
			<div class="row">
		<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-sm-offset-4 col-lg-offset-4 col-md-offset-4">
			<h2>vnosArtikla</h2>
			<a href="izpisArtiklov.jsp"><button type="button" class="btn btn-link">Izpis artiklov</button></a>
			<a href="vnosArtikla.jsp"><button type="button" class="btn btn-link">Vnos artikla</button></a> 
			</div>
			</div>
			<br />
			<br />
			<%
				response.setContentType("text/html");
				response.setCharacterEncoding("utf-8");
				SeznamArtiklov seznamArtiklov = (SeznamArtiklov) session.getAttribute("seznamArtiklov");
				if (seznamArtiklov == null) {
					seznamArtiklov = new SeznamArtiklov();
					session.setAttribute("seznamArtiklov", seznamArtiklov);
				}
				if (request.getParameter("shrani") != null) {
					Artikel a = new Artikel();
					a.setNaziv(request.getParameter("naziv"));
					a.setCena(request.getParameter("cena"));
					a.setCrtnaKoda(request.getParameter("crtnaKoda"));
					if (request.getParameter("spremeni") != null)
						seznamArtiklov.spremeni(a);
					else
						seznamArtiklov.shrani(a);
					response.sendRedirect("izpisArtiklov.jsp");
				}
				Artikel obstojeci = seznamArtiklov.najdi(request.getParameter("spremeni"));			
			%>
			<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4 col-sm-offset-4">
			<form action="vnosArtikla.jsp" method="post">
				<table>
					<tr>
						<td>Naziv:</td>
						<td><input type="text" name="naziv" <% if (obstojeci != null) { %> value="<%=obstojeci.getNaziv()%>" <% } %> /></td>
					</tr>
					<tr>
						<td>Cena:</td>
						<td><input type="text" name="cena" <% if (obstojeci != null) { %> value="<%=obstojeci.getCena()%>" <% } %> /></td>
					</tr>
					<tr>
						<td>Črtna koda:</td>
						<td><input type="text" name="crtnaKoda" <% if (obstojeci != null) { %> value="<%=obstojeci.getCrtnaKoda()%>" style="background-color: lightgray;" readonly <% } %> /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="submit" name="shrani" class="btn-success" value="Vnesi" />
							<% if (obstojeci != null) { %> 
								<input type="hidden" name="spremeni" value="<%=obstojeci.getCrtnaKoda()%>" />
							<% } %>
						</td>
					</tr>
				</table>
			</form>
			</div>
			</div>
		<br>

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<p align="center">
					Z vami in za vas že 15 let!<br> Copyright © 2017 Mojster
					D.O.O. Vse pravice pridržane
				</p>
			</div>
		</div>
	</div>	
	</body>
</html>