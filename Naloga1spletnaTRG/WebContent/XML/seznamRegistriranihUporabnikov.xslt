<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="mojaTrgovina.com">
	<xsl:output method="html"></xsl:output>
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Mojster D.O.O. | Seznam registriranih uporabnikov</title>
				<link rel="stylesheet" type="text/css" href="../CSS/style.css" />
				<script src="../JS/script.js"></script>
			</head>
			<body background="../Slike/sayagata-400px.png">
				<div align="center">
					<div class="uraInDatum">
						<span id="uraInDatum"></span>
					</div>
					<script>
						window.onload = date_time('uraInDatum');
					</script>
					<div class="header-main"></div>
					<h1 align="center">Mojster D.O.O.</h1>
					<hr />
					<h2 class="meni">Meni</h2>
					<div class="kontejner">
						<div class="kontejner">
							<a href="../index.html" class="buttonMeni">
								<strong>Prva
									stran</strong>
							</a>
						</div>
						<div class="kontejner">
							<a href="../podatki.html" class="buttonMeni">
								<strong>Podatki
									o trgovini</strong>
							</a>
						</div>
						<div class="kontejner">
							<a href="../dodatki.html" class="opened">
								<strong>Kategorije
									izdelkov</strong>
							</a>
						</div>
						<div class="kontejner">
							<a href="#" class="buttonMeni">
								<strong>Kolekcija
									najbolje prodajanih izdelkov</strong>
							</a>
						</div>
						<div class="kontejner">
							<a href="../akcijske.html" class="buttonMeni">
								<strong>Akcijske
									ponudbe</strong>
							</a>
						</div>
					</div>
					<br />
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