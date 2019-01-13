package si.um.feri.ost.bobovnik.baze;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SeznamArtiklov {

	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/artikli");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Artikel> select() throws Exception {
		List<Artikel> ret=new ArrayList<Artikel>();
		Connection conn=getConnection();
		try {
			if (conn != null) {
				ResultSet rs=conn.createStatement().executeQuery("select * from artikli");
				while (rs.next()) {
					Artikel a = new Artikel(rs.getString("naziv"),rs.getString("cena"),rs.getString("crtnaKoda"), rs.getInt("id"));
					ret.add(a);
				}
				rs.close();
			}
			
		} finally {
			if (conn != null)
				conn.close();
		}
		return ret;
	}

	public Artikel select(int id) throws Exception {
		Artikel ret=null;
		Connection conn=getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from artikli where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Artikel(rs.getString("naziv"),rs.getString("cena"),rs.getString("crtnaKoda"),rs.getInt("id"));
				break;
			}
			rs.close();
		} finally {
			if (conn != null)
				conn.close();
		}
		return ret;
	}

	public void delete(int id) throws Exception {
		Connection conn=getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("delete from artikli where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
		} finally {
			if (conn != null)
				conn.close();
		}
	}

	public void insert(Artikel o) throws Exception {
		Connection conn=getConnection();
		try {
			if (conn != null) {
				PreparedStatement ps=conn.prepareStatement("insert into artikli(naziv , cena, crtnaKoda) values (?,?,?)");
				ps.setString(1, o.getNaziv());
				ps.setString(2, o.getCena());
				ps.setString(3,  o.getCrtnaKoda());
				ps.executeUpdate();
			}
		} finally {
			if (conn != null)
				conn.close();
		}
	}
}