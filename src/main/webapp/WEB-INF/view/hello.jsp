<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="/css/demo.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <form class="custom-form">
        <h2 class="form-title">🚀 Register Now</h2>
        <p class="form-subtitle">Join us today! Fill in the details below.</p>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
            <input type="text" class="form-control" id="fullName" placeholder="Full Name">
        </div>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
            <input type="email" class="form-control" id="email" placeholder="Email Address">
        </div>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
            <input type="password" class="form-control" id="password" placeholder="Password">
        </div>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="fas fa-phone"></i></span>
            <input type="tel" class="form-control" id="phone" placeholder="Phone Number">
        </div>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
            <textarea class="form-control" id="address" rows="2" placeholder="Address"></textarea>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="terms">
            <label class="form-check-label" for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
        </div>

        <button type="submit" class="btn btn-primary w-100">Sign Up</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>