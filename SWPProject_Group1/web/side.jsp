<!DOCTYPE html>
<html>
<head>
  <title>Side Images</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    .side-image {
      position: fixed;
      top: 0;
      height: 100vh;
      width: 200px;
      background-size: cover;
      background-position: center;
    }

    .side-image-left {
      left: 0;
      background-image: url('https://images.pexels.com/photos/1548693/pexels-photo-1548693.jpeg?cs=srgb&dl=pexels-david-bartus-43782-1548693.jpg&fm=jpg');
    }

    .side-image-right {
      right: 0;
      background-image: url('https://via.placeholder.com/200x800/e6e6e6');
    }

    .content {
      margin-left: 200px;
      margin-right: 200px;
      padding: 20px;
    }
  </style>
</head>
<body>
  <div class="side-image side-image-left"></div>
  <div class="side-image side-image-right"></div>
  <div class="content">
    <h1>Welcome to the Page</h1>
    <p>This page has two static images on the left and right sides of the screen.</p>
  </div>
</body>
</html>