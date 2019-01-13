package si.um.feri.ost.bobovnik.baze;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Artikel {
	private String naziv, cena, crtnaKoda;
	private Calendar datumVnosa;
	private static SimpleDateFormat sdf = new SimpleDateFormat("dd. MM. yyyy HH:mm:ss");
	private int id;

	public Artikel() {
		this("", "", "", 0);
	}
	public Artikel(String naziv, String cena, String crtnaKoda, int id) {
		this.crtnaKoda = crtnaKoda;
		this.naziv = naziv;
		this.cena = cena;
		datumVnosa = new GregorianCalendar();
		this.id=id;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return naziv + " " + cena + " " + crtnaKoda + " " + sdf.format(datumVnosa.getTime())+" ("+id+")";
	}
}