package	si.um.feri.ost.bobovnik.artikli;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Artikel {
	private String naziv, cena, crtnaKoda;
	private Calendar datumVnosa;
	private static SimpleDateFormat sdf = new SimpleDateFormat("dd. MM. yyyy HH:mm:ss");

	public Artikel() {
		this("", "", "");
	}
	public Artikel(String naziv, String cena, String crtnaKoda) {
		this.crtnaKoda = crtnaKoda;
		this.naziv = naziv;
		this.cena = cena;
		datumVnosa = new GregorianCalendar();
	}

	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	public String getCena() {
		return cena;
	}
	public void setCena(String cena) {
		this.cena = cena;
	}
	public String getCrtnaKoda() {
		return crtnaKoda;
	}
	public void setCrtnaKoda(String crtnaKoda) {
		this.crtnaKoda = crtnaKoda;
	}
	public String getDatumVnosa() {
		return sdf.format(datumVnosa.getTime());
	}

	@Override
	public String toString() {
		return naziv + " " + cena + " " + crtnaKoda + " " + sdf.format(datumVnosa.getTime());
	}
}