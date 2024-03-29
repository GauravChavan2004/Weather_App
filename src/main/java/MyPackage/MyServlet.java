package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.sql.Date;
import java.util.Scanner;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				String cityInput=request.getParameter("city");
				//API setup
				String apikey ="3069b57405d1fcb106612fe91470b052";
				//create URL for the openWeatherMap API request
				String apiUrl ="https://api.openweathermap.org/data/2.5/weather?q="+cityInput+"&appid="+apikey;
				//API integration.
				URL url =new URL(apiUrl);
				HttpURLConnection connection=(HttpURLConnection)url.openConnection();
				connection.setRequestMethod("GET");
				//Reading the Data from network
				InputStream inputStream=connection.getInputStream();
				InputStreamReader reader=new InputStreamReader(inputStream);
				//we want to store data in string
				StringBuilder responseContent=new StringBuilder();
				//TO get input from reader, will create scanner object
				Scanner scanner=new Scanner(reader);
				while(scanner.hasNext()) {
					responseContent.append(scanner.nextLine());
				}
				scanner.close();
				Gson gson=new Gson();
				JsonObject jsonObject=gson.fromJson(responseContent.toString(),JsonObject.class);
				//fetch Date & Time from JSON file
		        long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
		        String date = new Date(dateTimestamp).toString();
		        String Time = new Time(dateTimestamp).toString();
		        //Temperature
		        double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
		        int temperatureCelsius = (int) (temperatureKelvin - 273.15);
		       
		        //Humidity
		        int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
		        
		        //Wind Speed
		        double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
		        
		        //Weather Condition
		        String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
				//set the data as request Attributes(for sending to JSP page)
		        request.setAttribute("cityInput",cityInput);
		        request.setAttribute("date",date);
		        request.setAttribute("temperature", temperatureCelsius);
		        request.setAttribute("weatherCondition", weatherCondition);
		        request.setAttribute("humidity", humidity);
		        request.setAttribute("windSpeed", windSpeed);
		        request.setAttribute("weatherData", responseContent.toString());
		        connection.disconnect();
		     // Forward the request to the weather.jsp page for rendering
		        request.getRequestDispatcher("index.jsp").forward(request, response);
		        //DataBase to store all details of Weather
		        Connection con=null;
	            try {
	                Class.forName("com.mysql.cj.jdbc.Driver");
	                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Weather", "root", "");
	                String sql = "insert into Weather_Data2 values('"+date+"','"+Time+"','"+cityInput+"',"+temperatureCelsius+",'"+weatherCondition+"',"+humidity+","+windSpeed+")";
	                Statement ps = con.createStatement();
	                ps.executeUpdate(sql);
	                con.close();
	            } catch (Exception se) {
	                System.out.print("exception"+se.toString());
	            }
			}

}
