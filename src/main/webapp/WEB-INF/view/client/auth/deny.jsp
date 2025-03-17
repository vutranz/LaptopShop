<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 - Forbidden</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #ffffff;
            color: #333;
            text-align: center;
        }
        .container {
            max-width: 600px;
            padding: 20px;
            background: #f8f8f8;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 80px;
            margin-bottom: 10px;
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            color: #ff7e5f;
            background: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
            border: 2px solid #ff7e5f;
        }
        a:hover {
            background: #ff7e5f;
            color: #fff;
        }
        .image-container {
            margin-bottom: 20px;
        }
        .image-container img {
            width: 150px;
            height: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="image-container">
        <img src="https://cdn-icons-png.flaticon.com/512/4638/4638121.png" alt="Sad character">
    </div>
    <h1>403</h1>
    <p>Xin lỗi! Bạn không có quyền truy cập vào trang này.</p>
    <a href="/">Quay lại trang chủ</a>
</div>
</body>
</html>
