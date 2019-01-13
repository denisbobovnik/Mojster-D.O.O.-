<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="mojaTrgovina.com">
	<xsl:output method="html"></xsl:output>
	<xsl:template match="/">
		<html lang="en">
			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<title>Mojster D.O.O. | Seznam registriranih uporabnikov</title>
				<!-- <link rel="stylesheet" type="text/css" href="CSS/style.css"> -->
				<script src="../JS/script.js"></script>
				<link rel="stylesheet"
					href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body background="../Slike/sayagata-400px.png">
				<nav class="navbar navbar-inverse navbar-fixed-top">
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
								<li class="active">
									<a href="../dodatki.html">Kategorije izdelkov</a>
								</li>
								<li>
									<a href="#">Kolekcija najbolje prodajanih izdelkov</a>
								</li>
								<li>
									<a href="../akcijske.html">Akcijske ponudbe</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				<br />
				<br />
				<br />

























				<div align="center">
					<div class="uraInDatum">
						<span id="uraInDatum"></span>
					</div>
					<script>
						window.onload = date_time('uraInDatum');
					</script>
					<div class="header-main"></div>

					<h2 class="trenutna">Urejen seznam registriranih uporabnikov</h2>
					<p>
						V spodnji tabeli je prikazan celoten seznam registriranih
						<br />
						uporabnikov, urejen po priimkih.
					</p>
					<table class="seznam" border="1">
						<tr align="left" class="seznam-header">
							<th>#</th>
							<th>Ime</th>
							<th>Priimek</th>
							<th>Spol</th>
							<th>E-naslov</th>
						</tr>
						<xsl:for-each select="seznamRegistriranihUporabnikov/uporabnik">
							<xsl:sort select="priimek"></xsl:sort>
							<tr>
								<td>
									<xsl:value-of select="idu" />
								</td>
								<td>
									<xsl:value-of select="ime" />
								</td>
								<td>
									<xsl:value-of select="priimek" />
								</td>
								<td>
									<xsl:value-of select="spol" />
								</td>
								<td>
									<xsl:value-of select="enaslov" />
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