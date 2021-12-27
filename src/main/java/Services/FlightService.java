package Services;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

//import Dao.FlightSearchDao;
import Dao.SourceDao;
import Dao.WalletDao;
import Models.Flight_list;
import Models.Source;

public class FlightService {
	
		public List<Source> getsource() throws ClassNotFoundException, SQLException
		{
		
		List<Source> sourcefilght = new ArrayList<>();
		
		SourceDao objsource  = new SourceDao ();
		 sourcefilght = objsource.ListSource();
		
		return sourcefilght;
		
		
	}
		
		public int getclosingbalance(String username) throws Exception
		{
		
		System.out.println(username);
		int Closing_balance = 0;
		WalletDao objwallet  = new WalletDao ();
		Closing_balance  = objwallet.getclosingbalance(username);
		
		return Closing_balance;
		
		
	}
//		 public int getBookedTickets(String   strDate, int flightId, String coach) {
//			 FlightSearchDao objflightsearch = new FlightSearchDao();
//			 int bookedTickets=objflightsearch.getBookedTickets(flightId, coach,strDate);
//			return bookedTickets;
//		 }

}
