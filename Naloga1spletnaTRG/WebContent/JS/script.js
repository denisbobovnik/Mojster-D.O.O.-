//za datum in čas
function date_time(id) {
	date = new Date;
	year = date.getFullYear();
	month = date.getMonth();
	months = new Array('Januar', 'Februar', 'Marec', 'April', 'Maj', 'Junij',
			'Julij', 'Avgust', 'September', 'Oktober', 'November', 'December');
	d = date.getDate();
	day = date.getDay();
	days = new Array('Nedelja,', 'Ponedeljek,', 'Torek,', 'Sreda,', 'Četrtek,',
			'Petek,', 'Sobota,');
	h = date.getHours();
	if (h < 10) {
		h = "0" + h;
	}
	m = date.getMinutes();
	if (m < 10) {
		m = "0" + m;
	}
	s = date.getSeconds();
	if (s < 10) {
		s = "0" + s;
	}
	result = '' + days[day] + ' ' + d + '. ' + months[month] + ' ' + year + ' '
			+ h + ':' + m + ':' + s;
	document.getElementById(id).innerHTML = result;
	setTimeout('date_time("' + id + '");', '1000');
	return true;
}

// za akcije
CountDownTimer('2017-03-24T12:00:00+01:00', 'akcija'); // recimo da je dovolj
														// dober približek...

function CountDownTimer(dt, id) {
	var end = new Date(dt);

	var _second = 1000;
	var _minute = _second * 60;
	var _hour = _minute * 60;
	var timer;

	function showRemaining() {
		var now = new Date();
		var distance = end - now;
		if (distance < 0) {

			clearInterval(timer);
			document.getElementById(id).innerHTML = 'AKCIJA JE POTEKLA!';

			return;
		}
		var hours = Math.floor((distance / _hour));
		var minutes = Math.floor((distance % _hour) / _minute);
		var seconds = Math.floor((distance % _minute) / _second);

		document.getElementById(id).innerHTML = hours + 'ur ';
		document.getElementById(id).innerHTML += minutes + 'minut ';
		document.getElementById(id).innerHTML += seconds + 'sekund';
	}

	timer = setInterval(showRemaining, 1000);
}

// za preverjanje prijave
function preveriPrijava() {
	var email = document.forms["prijava"]["email"].value;
	var geslo = document.forms["prijava"]["geslo"].value;
	if (email == "") {
		alert("E-naslov ste pustili prazno!");
		return false;
	} else if (email.length < 6) {
		alert("E-naslov ne more biti krajši od 6 znakov!");
		return false;
	} else if (email.length > 35) {
		alert("E-naslov ne more biti daljši od 35 znakov!");
		return false;
	} else if (geslo == "") {
		alert("Geslo ste pustili prazno!");
		return false;
	} else if (geslo.length < 8) {
		alert("Geslo ne more biti krajše od 8 znakov!");
		return false;
	} else if (geslo.length > 20) {
		alert("Geslo ne more biti daljše od 20 znakov!");
		return false;
	}
}

// za preverjanje registracije
function preveriRegistracija() {
	var ime = document.forms["registracija"]["ime"].value;
	var priimek = document.forms["registracija"]["priimek"].value;
	var email = document.forms["registracija"]["email"].value;
	var geslo = document.forms["registracija"]["geslo"].value;
	var pogoji = document.forms["registracija"]["pogoji"].checked;
	if (ime == "") {
		alert("Ime ste pustili prazno!");
		return false;
	} else if (ime.length < 2) {
		alert("Ime ne more biti krajše od 2 znakov!");
		return false;
	} else if (ime.length > 100) {
		alert("Ime ne more biti daljše od 100 znakov!");
		return false;
	} else if (priimek == "") {
		alert("Priimek ste pustili prazno!");
		return false;
	} else if (priimek.length < 2) {
		alert("Priimek ne more biti krajši od 2 znakov!");
		return false;
	} else if (priimek.length > 200) {
		alert("Priimek ne more biti daljši od 200 znakov!");
		return false;
	} else if (email == "") {
		alert("E-naslov ste pustili prazno!");
		return false;
	} else if (email.length < 6) {
		alert("E-naslov ne more biti krajši od 6 znakov!");
		return false;
	} else if (email.length > 35) {
		alert("E-naslov ne more biti daljši od 35 znakov!");
		return false;
	} else if (geslo == "") {
		alert("Geslo ste pustili prazno!");
		return false;
	} else if (geslo.length < 8) {
		alert("Geslo ne more biti krajše od 8 znakov!");
		return false;
	} else if (geslo.length > 20) {
		alert("Geslo ne more biti daljše od 20 znakov!");
		return false;
	} else if (!pogoji) {
		alert("Za uporabo se morate strinjati s splošnimi pogoji!");
		return false;
	}
}

// za izracun clanarine
function vrniClanarino() {
	var e = document.getElementById("bonitete");
	var indeks = e.selectedIndex;
	if (indeks == 0) {
		alert("Paket ste pustili prazno!");
	}
	if (indeks == 1) {
		document.getElementById("clanarina").innerHTML = "Mesečna članarina paketa Osnovni znaša: 5,99 €<br> Bonitete prejmete tedensko";
	} else if (indeks == 2) {
		document.getElementById("clanarina").innerHTML = "Mesečna članarina paketa Naprednejši znaša: 10,99 €<br> Bonitete prejmete mesečno.";
	} else if (indeks == 3) {
		document.getElementById("clanarina").innerHTML = "Mesečna članarina paketa Mojstrski znaša: 13,99 €<br> Bonitete prejmete letno.";
	}
}

// za izbris P
function pobrisiObrazec() { // lahko bi kr refresh strani naredo...
	document.getElementById("paketi").reset();
	document.getElementById("clanarina").innerHTML = "";
}

// za zemljevid
function initMap() {
	var uluru = {
		lat : 46.529193,
		lng : 15.646286
	};
	var map = new google.maps.Map(document.getElementById('map'), { // očitno
																	// lahko
																	// getbyid
																	// maš tut
																	// za div
		zoom : 14,
		center : uluru
	});
	var marker = new google.maps.Marker({
		position : uluru,
		map : map
	});
}

// validacija obrazca Dodaj artikel in kreiranje objekta za dodan artikel
function dodajArtikel() { // imena spremenljivk nemoraj vsebovati '-'
	var nazivVrednost = document.forms["dodaj"]["naziv"].value;
	var kratekOpisVrednost = document.forms["dodaj"]["kratek-opis"].value;
	// var opisVrednost = document.forms["dodaj"]["opis"].value;
	var cenaVrednost = document.forms["dodaj"]["cena"].value;
	var kategorijaVrednost = document.getElementById("opacity").value;
	var zalogaVrednost;

	var e = document.getElementById("opacity");
	var indeks = e.selectedIndex;

	var radios = document.forms["dodaj"].elements["zaloga"];
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			zalogaVrednost = radios[i].value;
			break;
		}
	}

	var temp = 5;
	if ((!(radios[0].checked)) && (!(radios[1].checked))) {
		temp++;
	}

	if (nazivVrednost == "") {
		alert("Naziv ste pustili prazen!");
		return false;
	} else if (nazivVrednost.length < 3) {
		alert("Naziv ne more biti krajši od 3 znakov!");
		return false;
	} else if (nazivVrednost.length > 15) {
		alert("Naziv ne more biti daljši od 15 znakov!");
		return false;
	} else if (kratekOpisVrednost == "") {
		alert("Kratek opis ste pustili prazen!");
		return false;
	} else if (kratekOpisVrednost.length < 10) {
		alert("Kratek opis ne more biti krajši od 10 znakov!");
		return false;
	} else if (kratekOpisVrednost.length > 100) {
		alert("Kratek opis ne more biti daljši od 100 znakov!");
		return false;
	}
	// else if(opisVrednost.value=="") {
	// alert("Opis ste pustili prazen!");
	// return false;
	// }
	// else if(opisVrednost.value.length<200) {
	// alert("Opis ne more biti krajši od 200 znakov!");
	// return false;
	// }
	// else if(opisVrednost.value.length>1000) {
	// alert("Opis ne more biti daljši od 1000 znakov!");
	// return false;
	// }
	else if (cenaVrednost == "") {
		alert("Ceno ste pustili prazno!");
		return false;
	} else if (cenaVrednost.length < 9) {
		alert("Cena ne more biti krajša od 9 znakov!");
		return false;
	} else if (cenaVrednost.length > 13) {
		alert("Cena ne more biti daljša od 13 znakov!");
		return false;
	} else if (indeks == 0) {
		alert("Kategorijo ste pustili prazno!");
		return false;
	} else if (temp == 6) {
		alert("Zalogo ste pustili prazno!");
		return false;
	}

	var artikel = {};

	artikel.naziv = nazivVrednost;
	artikel.kratekOpis = kratekOpisVrednost;
//
	artikel.cena = cenaVrednost;
	artikel.kategorija = kategorijaVrednost;
	artikel.zaloga = zalogaVrednost;

	alert("Artikel ste uspešno dodali!");
	return true;
}

// za preverjanje ugiba
function preveriUgib() {
	var stPoskusov = 3;
	var generirana = Math.floor((Math.random() * 10) + 1);
	var ugib = '';
	var sporocilo = 'Ugibaj število med 1 in 10: ';

	while (stPoskusov > 0) {
		ugib = prompt(sporocilo, ugib);
		if (ugib == null) {
			alert('Ugib ste pustili prazen! Končujem igro.');
			break;
		} else if (isFinite(ugib) && ugib != '') {
			ugib = +ugib;

			if (ugib < 1) {
				alert('Ugib mora biti večji od 1!');
			} else if (ugib > 10) {
				alert('Ugib mora biti manjši od 10!');
			} else if (ugib > generirana) {
				alert('NAROBE! Število je manjše.');
			} else if (ugib < generirana) {
				alert('NAROBE! Število je večje.');
			} else {
				alert('Čestitke! Prejeli ste popust.');
				break;
			}
		} else {
			alert('Vnos mora biti število!');
		}
		stPoskusov--;
	}

	if (stPoskusov == 0) {
		alert('Žal vam je zmanjkalo poskusov! Iskali smo število ' + generirana
				+ '.');
	}
}

// za izbris obrazca
function pobrisiObrazecGeneral() { // lahko bi kr refresh strani naredo...
	document.getElementById("ugib").reset();
}

function ddv() {
	cena = document.getElementById("cena").value;
	ddv = document.getElementById("DDV").value;
	var zac;
	var r = 0;
	zac = parseFloat(cena) * (parseFloat(ddv) / 100);
	r = parseFloat(cena) + parseFloat(zac);
	alert("cena z ddv je " + r);

}
function addv() {
	cena = document.getElementById("cena1").value;
	ddv = document.getElementById("DDV1").value;
	var zac;
	var r = 0;
	zac = parseFloat("100") + parseFloat(ddv);
	r = parseFloat(cena) * (parseFloat("100") / parseFloat(zac));
	alert("cena z ddv je " + r)

}

function popust() {
	cena = document.getElementById("cena2").value;
	popust = document.getElementById("popust").value;
	var zac;
	var r = 0;
	zac = parseFloat("100") - parseFloat(popust);
	r = parseFloat(cena) * (parseFloat(zac) / parseFloat("100"));
	alert("cena z ddv je " + r)

}

function obrok() {
	cena = document.getElementById("cena3").value;
	obrok = document.getElementById("obrok").value;
	var zac;
	var r = 0;
	var obrest = 10;
	zac = parseFloat(cena) * (parseFloat(obrest) / 100);
	r = parseFloat(cena) + parseFloat(zac);
	alert("Cena na " + obrok + " obrokov je " + r);
}