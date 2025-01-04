<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("index.html"); 
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Managment System</title>
    <link rel="stylesheet" href="css/shared.css">
    <link rel="stylesheet" href="css/borrow.css">
    <link rel="icon" href="img/logo.png" />
<script>
        function validateInput(event) {
            const input = event.target;
            input.value = input.value.replace(/[^0-9() -]/g, '');
        }
    </script>

</head>
<body>
    <header class="main-header">
        <nav class="main-nav">
            <div class="logo">
                <a href="howe">
                    <img src="img/logo.png" alt="" width="40" height="40">
                </a>
            </div>
            <a href="howe" class="astu">A.S.T.U</a>
            <ul class="main-nav-items">
                <li class="main-nav-item"><a href="borrow">Borrowed</a></li>
                <li class="main-nav-item"><a href="return">Return</a></li>
                <li class="main-nav-item"><a href="about">About</a></li>
                <li class="main-nav-item"><a href="logout">Logout</a></li>
            </ul>
            </nav>
        </header>
        <main>
            <section class="borrow-form">
             <h1 class="title">Borrow a book</h1>
                <form method="get" action="borrowm" id="borrow-form">
                <div>
              <label >Full Name:
              <input type="text" name="name" placeholder="Abebe Kebede Bekele" class="name">
              </label>
                </div>
                <div>
              <label >ID Number:
              <input type="text" name="student id" placeholder="UGR/308000/15" class="id">
              </label>
            </div>
            <div>
              <label >Phone NUmber:
                  <input type="tel" name="phone number" placeholder="09-32-43-54-65" class="phone" maxlength="10" minlength="10" pattern="[0-9]{10}" oninput="validateInput(event)">
              </label>
            </div>
            <div>
              <label >Book Title:
              <input type="text" name="book" placeholder="Applied Maths" class="book">
              </label>
            </div>
            <div>
            <label >Return Date:
                <input type="text" name="Return Date" placeholder="dd-mm-yyyy" class="name">
            </label>
            </div>
             <button type="submit" class="borrow-btn">Borrow</button>
             </form>
            </section>
         </main>
   </body>
</html>
