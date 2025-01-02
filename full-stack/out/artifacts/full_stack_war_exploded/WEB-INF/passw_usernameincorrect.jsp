<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Error</title>
  <link rel="stylesheet" href="css/can_succ.css"> <!-- Link to your CSS -->
</head>
<body>
<div class="status-container">
  <form method="get" action="inco"> <!-- Action to go back to loginpageServlet -->
    <h1 class="status-title canceled">Wrong Password or Username</h1>
    <p class="status-message">The username or password you entered is incorrect. Please try again.</p>
    <button class="back-btn" type="submit">Back</button>
  </form>
</div>
</body>
</html>
