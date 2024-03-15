<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>History</title>
</head>
<body style="background-color: blue; color:white;">
    <h1 Class="text-center">History</h1>
    <table class="table table-hover text-center">
        <tr class="table-info">
            <th>Date</th>
            <th>Time</th>
            <th>City</th>
            <th>Temperature</th>
            <th>Weather Condition</th>
            <th>Humidity</th>
            <th>Wind Speed</th>
        </tr>
        <% 
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish Database Connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Weather", "root", "");
            
            // Create SQL Statement
            Statement stmt = conn.createStatement();
            
            // Execute Query
            ResultSet rs = stmt.executeQuery("SELECT * FROM Weather_Data2");
            
            // Process Result Set
            while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("_Date_") %></td>
                    <td><%= rs.getString("_Time_") %></td>
                    <td><%= rs.getString("city_name") %></td>
                    <td><%= rs.getInt("temperature_in_celcius") %></td>
                    <td><%= rs.getString("Weather_condition") %></td>
                    <td><%= rs.getInt("humidity_percent") %></td>
                    <td><%= rs.getDouble("wind_speed") %></td>
                </tr>
                <%
            }
            
            // Close connections
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
    <button onclick="document.location='index.html'" class="btn btn-primary m-4">Back to Home</button>
</body>
</html>
