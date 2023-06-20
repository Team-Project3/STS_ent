<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="shortcut icon" href="img/favicon.png">
        <title>Login - Admin</title>
        <link href="css/a_performance.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                        	<div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Admin Login</h3></div>
                                    <div class="card-body">
                                        <form action="adminlogin" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="a_id" name="a_id" value="${a_id}" type="text" placeholder="ID" />
                                                <label for="a_id">Admin ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="a_password" name="a_password" type="password" placeholder="Password" />
                                                <label for="a_id">Password</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-right justify-content-between mt-4 mb-0">
                                               <!--  <a class="btn btn-primary" onclick="submit()" id="submit">Login</a> -->
                                                <button class="btn btn-primary" onclick="submit()" id="submit">Login</button>
                                                
                                            </div>
                                        </form>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#" id="detail">Privacy Policy</a>
                                &middot; 
                                <a href="index" id="detail">Homepage</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>