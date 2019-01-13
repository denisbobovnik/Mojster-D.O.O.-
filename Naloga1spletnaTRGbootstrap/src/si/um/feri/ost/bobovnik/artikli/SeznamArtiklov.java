package	si.um.feri.ost.bobovnik.artikli;

import java.util.ArrayList;
import java.util.List;

public class SeznamArtiklov {
	private List<Artikel> seznamArtiklov = new ArrayList<>();

	public void izbrisi(String crtnaKoda) {
		Artikel a = najdi(crtnaKoda);
		if (a != null)
			seznamArtiklov.remove(a);
	}
	public Artikel najdi(String crtnaKoda) {
		if (crtnaKoda == null)
			return null;
		Artikel najden = null;
		for (Artikel a:seznamArtiklov)
			if (crtnaKoda.equals(a.getCrtnaKoda()))
				return a;
		return najden;
	}
	public void spremeni(Artikel novi) {
		if (novi == null)
			return;
		Artikel stari = najdi(novi.getCrtnaKoda());
		if (stari == null)
			return;
		stari.setNaziv(novi.getNaziv());
		stari.setCena(novi.getCena());
		stari.setCrtnaKoda(novi.getCrtnaKoda());
	}
	public void shrani(Artikel a) {
		seznamArtiklov.add(a);
	}
	public List<Artikel> vrniVse() {
		return seznamArtiklov;
	}
}