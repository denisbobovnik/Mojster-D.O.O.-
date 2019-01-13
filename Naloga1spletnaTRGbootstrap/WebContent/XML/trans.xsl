<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="mojaTrgovina.com">
	<xsl:output method="html"></xsl:output>
	<xsl:template match="/">
		<html lang="en">
			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<title>Mojster D.O.O. | Uporabniki</title>
				<!-- <link rel="stylesheet" type="text/css" href="CSS/style.css" /> -->
				<script src="../JS/script.js"></script>
				<link rel="stylesheet"
					href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body>
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse"
								data-target="#myNavbar">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#">Mojster D.O.O.!</a>
						</div>
						<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav">
								<li>
									<a href="../index.html">Prva stran</a>
								</li>
								<li>
									<a href="../podatki.html">Podatki o trgovini</a>
								</li>
								<li class="dropdown active">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
										Kategorije izdelkov
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li>
											<a href="../dodatki.html">Dodatki za
												mobilne naprave</a>
										</li>
										<li>
											<a href="#">Mobilni telefoni</a>
										</li>
										<li>
											<a href="#">Računalniki</a>
										</li>
										<li>
											<a href="#">Računalniške komponente</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#">Kolekcija najbolje prodajanih izdelkov</a>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
										Akcijske ponudbe
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li>
											<a href="../akcijske.html">Naročniški
												paketi</a>
										</li>
										<li>
											<a href="../ugibanje.html">Ugibanje števil</a>
										</li>
										<li>
											<a href="../kalkulator.html">Kalkulator</a>
										</li>
									</ul>
								</li>
							</ul>
							<p id="uraInDatum" class="navbar-text navbar-right" style="margin-right: 0px;"></p>
						</div>
					</div>
				</nav>
				<script>
					window.onload = date_time('uraInDatum');
				</script>
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-12 col-lg-12 col-sm-offset-5">
							<h2 class="trenutna">Uporabniki</h2>
						</div>
					</div>




					<table align="center" class="table-hover">
						<tr align="left">
							<th>Ime</th>
							<th>Priimek</th>
							<th>Spol</th>
							<th>E-naslov</th>
							<th>Naj produkt</th>
						</tr>
						<xsl:for-each select="*/*">
							<xsl:sort select="a:priimek"></xsl:sort>
							<tr>
								<td>
									<xsl:value-of select="a:ime" />
								</td>
								<td>
									<xsl:value-of select="a:priimek" />
								</td>
								<td>
									<xsl:value-of select="a:spol" />
								</td>
								<td>
									<xsl:value-of select="a:enaslov" />
								</td>
								<td>
									<xsl:value-of select="@najProdukt" />
									<xsl:variable name="mojaSpremenljivka" select="@najProdukt" />
									<xsl:for-each select="document('Produkt.xml')/seznamProduktov/produkt">
										<xsl:if test="@najProdukt != ''"> <!-- preverja praznino -->
											<xsl:if test="@id = $mojaSpremenljivka"> <!-- preverja id in najprodukt -->
												<xsl:value-of select="naziv" />
											</xsl:if> <!-- koren/element[@id=X] -->
										</xsl:if> <!-- choose when otherwise -->
										<xsl:else>
											ni podatka <!-- drugače -->
										</xsl:else>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<hr />
					<p align="center">
						Z vami in za vas že 15 let!
						<br />
						Copyright © 2017 Mojster D.O.O.
						Vse pravice pridržane
					</p>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>