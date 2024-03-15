<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Weather Application </title>
    </head>

    <body style="background-color: blue;">
        <div>
            <div style="margin-left:40%">
                <img src="https://static.vecteezy.com/system/resources/previews/020/716/723/original/3d-minimal-weather-forecast-concept-partly-cloudy-in-the-morning-weather-icon-3d-illustration-png.png"
                    class="img-fluid" Style="height:300px; width: 300px;filter: drop-shadow(10px 10px 10px black);">
            </div>
        </div>
        <div class=" container bg-light rounded-4 mt-2" style="width:27%;">
            <form action="MyServlet" method="post" class="text-center p-3">
                <input name="city" placeholder="Enter city">
                <button><i class="bi bi-search"></i></button>
            </form>
            <div>
                <div>
                    <h2 class="text-center">${cityInput}</h2>
                    <div class="text-center">
                        <h2>${temperature}°</h2>
                    </div>
                    <div class=" text-center" style="margin-top: 0px;">

                        <p style="padding-top: -20px;">${date}</p>
                    </div>
                    <div class="container text-center">
                        <div class="row">
                            <div class="col">
                                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png"
                                    alt="Humidity" style="width:75px; height:75px;">
                                <div class="text-center">
                                    <span>Humidity </span>
                                    <p><b>${humidity}% </b></p>
                                </div>
                            </div>
                            <div class="col">
                                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png"
                                    style="width:75px; height:75px;">
                                <div class="text-center">
                                    <span>Wind Speed</span>
                                    <p> <b>${windSpeed} km/h</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<button onclick="document.location='History.jsp'" class="btn btn-success m-4">History</button>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
        </script>

    </html>