<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Signup</title>

    <!-- Bootstrap 5 CDN -->
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
        rel="stylesheet" />

    <style>
        body {
            background: #f8f9fa;
        }
        .signup-card {
            max-width: 450px;
            margin: 50px auto;
            padding: 25px;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="card shadow signup-card">

            <h3 class="text-center mb-4">Create Account</h3>

            <form action="register" method="post" >

                <div class="mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Mobile Number</label>
                    <input type="text" name="mobile" class="form-control" maxlength="10" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required />
                </div>

                <button type="submit" class="btn btn-primary w-100">
                    Sign Up
                </button>

                <p class="text-center mt-3">
                    Already have an account?
                    <a href="login">Login</a>
                </p>

            </form>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script 
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
    </script>

</body>
</html>