<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
    <div class="container">
        <div class="login-form">
            <div class="main-div">
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                        Username or password incorrect
                    </div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                        You Not authorize
                    </div>
                </c:if>
                <c:if test="${param.sessionTimeout != null}">
                    <div class="alert alert-danger">
                        Session Timeout
                    </div>
                </c:if>
                <div class="container-fluid">
                    <section class="gradient-custom">
                        <div class="page-wrapper">
                            <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                    <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
                                        <div class="card-body p-5">
                                            <div class="mb-md-5 mt-md-4 pb-5 text-center">
                                                <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                                <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                                <form id="formLogin" method="post" action="j_spring_security_check">
                                                    <div class="form-outline form-white mb-4">
                                                        <label class="form-label" for="userName">Email</label>
                                                        <input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập">
                                                    </div>

                                                    <div class="form-outline form-white mb-4">
                                                        <label class="form-label" for="password">Password</label>
                                                        <input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu">
                                                    </div>

                                                    <div class="form-check d-flex justify-content-center mb-5">
                                                        <div><input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" /></div>
                                                        <div><label class="form-check-label">
                                                            Remember Password
                                                        </label></div>
                                                    </div>

                                                    <p class="small mb-2 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>

                                                    <button type="submit" class="btn btn-primary" id="loginBtn">Đăng nhập</button>
                                                </form>
                                            </div>
                                            <div class="text-center">
                                                <p class="mb-0 tex-center account">Don't have an account? <a href="<c:url value='/register'/>" class="text-white-50 fw-bold">Sign Up</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Khi form đăng nhập được submit
            $("#formLogin").submit(function(event) {
                event.preventDefault();  // Ngừng gửi form mặc định để xử lý thông qua AJAX

                var username = $("#userName").val();
                var password = $("#password").val();

                // Gửi thông tin đăng nhập qua AJAX (để tạo phiên đăng nhập)
                $.ajax({
                    url: "/j_spring_security_check",  // Đảm bảo URL này chính xác để Spring Security xử lý đăng nhập
                    type: "POST",
                    data: {
                        j_username: username,
                        j_password: password
                    },
                    success: function(response) {
                        // Sau khi đăng nhập thành công, gửi yêu cầu lấy JWT token
                        $.ajax({
                            url: "/api/user/login",  // URL của API để lấy JWT token
                            type: "POST",  // Nếu API lấy token theo GET
							contentType: "application/json",
							data: JSON.stringify({
								"userName": username,
								"password":  password
							}),
							dataType : "JSON",
                            success: function(response) {
                                // Lưu JWT token vào localStorage
                                localStorage.setItem("jwtToken", response.data);
                                console.log("JWT Token:", response.data);
                                // Điều hướng đến trang admin sau khi lấy token
								window.location.href="<c:url value="/admin/building-list"></c:url>"  // Điều hướng đến trang admin
                            },
                            error: function(xhr, status, error) {
                                alert("Lỗi khi lấy JWT token!");
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        // Nếu đăng nhập không thành công
                        alert("Đăng nhập thất bại! Vui lòng kiểm tra lại thông tin.");
                    }
                });
            });
        });
    </script>
</body>
</html>