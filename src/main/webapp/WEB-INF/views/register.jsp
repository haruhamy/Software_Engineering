<%--
  Created by IntelliJ IDEA.
  User: dovut
  Date: 12/2/2024
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
  <title>Đăng kí</title>
</head>
<body>
<div class="container">
  <!-- <h1 class="form-heading">login Form</h1> -->
  <div class="login-form">
    <div class="main-div">
      <div class="container-fluid" >
        <section class="gradient-custom">
          <div class="page-wrapper">
            <div class="row d-flex justify-content-center align-items-center">
              <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
                  <div class="card-body p-5">
                    <div class="mb-md-5 mt-md-4 pb-5 text-center">
                      <h2 class="fw-bold mb-2 text-uppercase">Đăng kí</h2>
                      <p class="text-white-50 mb-5">Please enter your login and password!</p>
                      <form id="formRegister">
                        <div class="form-outline form-white mb-4">
                          <label class="form-label" for="fullName">FullName</label>
                          <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Họ và tên">
                        </div>
                        <div class="form-outline form-white mb-4">
                          <label class="form-label" for="userName">UserName</label>
                          <input type="text" class="form-control" id="userName" name="userName" placeholder="Tên đăng nhập">
                        </div>

                        <div class="form-outline form-white mb-4">
                          <label class="form-label" for="password">Password</label>
                          <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu">
                        </div>

                        <div class="form-outline form-white mb-4">
                          <label class="form-label" for="retypePassword">RetypePassword</label>
                          <input type="password" class="form-control" id="retypePassword" name="retypePassword" placeholder="Nhập lại mật khẩu">
                        </div>

                        <div class="form-outline form-white mb-4">
                          <input type="checkbox" id="terms" name="terms">
                          <label for="terms" class="form-label">Tôi đồng ý với các điều khoản và điều kiện</label>
                        </div>

                        <button type="button" class="btn btn-primary" id="btnRegister">Đăng kí</button>
                      </form>
                      <div class="d-flex justify-content-center text-center mt-2 pt-1">
                        <a href="#!" class="login-extension text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                        <a href="#!" class="login-extension text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                        <a href="#!" class="login-extension text-white"><i class="fab fa-google fa-lg"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <%--<script src="./assets/dist/js/boostrap-v5/bootstrap.js"></script>--%>
      <%--<script src="./assets/dist/js/fontawsome-v5/all.js"></script>--%>
    </div>
  </div>
</div>
<%--<script src="assets/js/jquery.2.1.1.min.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--  window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");--%>
<%--</script>--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $('#btnRegister').click(function(e){
    e.preventDefault();
    var formData=$('#formRegister').serializeArray();
    var json={};
    var typeCode=[];
    $.each(formData, function(i,it){
      json["" + it.name+""]=it.value;
    });
    // json['roleId']=3;
    let isValid = true;
    if (!json['fullName']) {
      $('#fullName').next('span').remove();
      $('#fullName').after('<span style="color: red">Họ và tên không được để trống</span>');
      isValid = false;
    }
    if (!json['userName']) {
      $('#userName').next('span').remove();
      $('#userName').after('<span style="color: red">Tên đăng nhập không được để trống</span>');
      isValid = false;
    }
    if (!json['password']) {
      $('#password').next('span').remove();
      $('#password').after('<span style="color: red">Mật khẩu không được để trống</span>');
      isValid = false;
    } else if (json['password'].length < 6) {
      $('#password').next('span').remove();
      $('#password').after('<span style="color: red">Mật khẩu cần ít nhất 6 ký tự</span>');
      isValid = false;
    }

    if (!json['retypePassword']) {
      $('#retypePassword').next('span').remove();
      $('#retypePassword').after('<span style="color: red">Cần nhập lại mật khẩu</span>');
      isValid = false;
    } else if (json['password'] !== json['retypePassword']) {
      $('#retypePassword').next('span').remove();
      $('#retypePassword').after('<span style="color: red">Mật khẩu nhập lại không khớp</span>');
      isValid = false;
    }

    if (!$('#terms').is(':checked')) {
      alert("Bạn cần đồng ý với các điều khoản và điều kiện.");
      isValid = false;
    }
    if (isValid) {
      createUser(json);
    }
  })

  function createUser(data){
    $.ajax({
      url: "/api/user/register",
      type:"POST",
      contentType: "application/json",
      data : JSON.stringify(data), //Convert từ Object trong JS qua JSON
      dataType : "JSON", //Định dạng dữ liệu nhận từ server
      success : function(response){
        console.log('success');
        alert(response.message);
        window.location.href="<c:url value="/login"></c:url>"
      },
      error : function(response){
        console.log('failed');
        if (Array.isArray(response.responseJSON.message)) {
          alert(response.responseJSON.message.join("\n"));
        }else{
          alert(response.responseJSON.message);
        }
      }
    });
  }
</script>
</body>
</html>
