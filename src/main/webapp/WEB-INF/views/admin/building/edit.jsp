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
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
<%--                <li class="active">Dashboard</li>--%>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Thông tin tòa nhà
<%--                    <small>--%>
<%--                        <i class="ace-icon fa fa-angle-double-right"></i>--%>
<%--                        overview &amp; stats--%>
<%--                    </small>--%>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <form:form class="form-horizontal" role="form" id="formEdit" modelAttribute="buildingDTO">
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1"> Tên tòa nhà</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Tên tòa nhà" class="form-control" name="name">--%>
                                <form:input path="name" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1"> Quận</label>
                            <div class="col-xs-2">
                                <form:select path="district" class="form-control">
                                    <form:option value="">~~ Chọn Quận ~~</form:option>
                                    <form:options items="${district}"></form:options>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phường</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Phường" class="form-control" name="ward">--%>
                                <form:input path="ward" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Đường</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Đường" class="form-control" name="street">--%>
                                <form:input path="street" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Kết cấu</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Kết cấu" class="form-control">--%>
                                <form:input path="structure" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Số tầng hầm</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Số tầng hầm" class="form-control" name="numberOfBasement">--%>
                                <form:input path="numberOfBasement" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Diện tích sàn</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Diện tích sàn" class="form-control" name="floorArea">--%>
                                <form:input path="floorArea" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Hướng</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Hướng" class="form-control">--%>
                                <form:input path="direction" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Hạng</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Hạng" class="form-control">--%>
                                <form:input path="level" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Diện tích thuê</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Diện tích thuê" class="form-control" name="rentArea">--%>
                                <form:input path="rentArea" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Giá thuê</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Giá thuê" class="form-control" name="rentPrice">--%>
                                <form:input path="rentPrice" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Mô tả giá</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Mô tả giá" class="form-control">--%>
                                <form:input path="rentPriceDescription" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Phí dịch vụ" class="form-control">--%>
                                <form:input path="serviceFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phí ô tô</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Phí ô tô" class="form-control">--%>
                                <form:input path="carFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phí mô tô</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Phí mô tô" class="form-control">--%>
                                <form:input path="motoFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Phí ngoài giờ" class="form-control">--%>
                                <form:input path="overtimeFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Tiền điện</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Tiền điện" class="form-control">--%>
                                <form:input path="electricityFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Tiền nước</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Tiền nước" class="form-control">--%>
                                <form:input path="waterFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Đặt cọc</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Đặt cọc" class="form-control">--%>
                                <form:input path="deposit" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Thanh toán</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Thanh toán" class="form-control">--%>
                                <form:input path="payment" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Thời hạn thuê" class="form-control">--%>
                                <form:input path="rentTime" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Thời gian trang trí" class="form-control">--%>
                                <form:input path="decorationTime" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Tên quản lý</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Tên quản lý" class="form-control" name="mangagerName">--%>
                                <form:input path="managerName" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">SĐT quản lý</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="tel" placeholder="Số điện thoại quản lý" class="form-control" name="mangagerPhoneNumber">--%>
                                <form:input path="managerPhone" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Loại tòa nhà</label>
                            <div class="col-xs-9">
                                <form:checkboxes path="typeCode" items="${typeCode}"></form:checkboxes>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Phí môi giới</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Phí môi giới" class="form-control">--%>
                                <form:input path="brokerageFee" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Ghi chú</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Ghi chú" class="form-control">--%>
                                <form:input path="note" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">Hình đại diện</label>
                            <input class="col-xs-3" type="file" id="uploadImage"/>
                            <div class="col-xs-6">
                                <c:if test="${not empty buildingDTO.image}">
                                    <c:set var="imagePath" value="/repository${buildingDTO.image}"/>
                                    <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                </c:if>
                                <c:if test="${empty buildingDTO.image}">
                                    <img src="download.jpg" id="viewImage" width="300px" height="300px">
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty buildingDTO.id}">
                                    <button type="button" class="btn btn-inverse" id="btnAddOrUpdateBuilding">Sửa tòa nhà</button>
                                </c:if>
                                <c:if test="${empty buildingDTO.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                </c:if>
                                <button type="button" class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                            </div>
                        </div>
                        <form:hidden path="id"/>
                    </form:form>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>
    var imageBase64 = '';
    var imageName = '';
    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });
    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#btnCancel').click(function (e){
        e.preventDefault();
        const userResponse = confirm("Bạn có chắc chắn muốn thực hiện hành động này?");
        if (userResponse) {
            // alert("Bạn đã hủy thao tác sửa thông tin tòa nhà");
            window.location.href="<c:url value="/admin/building-list"></c:url>";
        }
    })
    $('#btnAddOrUpdateBuilding').click(function(e){
        e.preventDefault();
        var formData=$('#formEdit').serializeArray();
        var json={};
        var typeCode=[];
        $.each(formData, function(i,it){
            if(it.name != 'typeCode'){
                json["" + it.name+""]=it.value;
            }else typeCode.push(it.value)
        });
        json['typeCode']=typeCode;
        if(imageBase64 != ''){
            json['imageBase64']=imageBase64;
            json['imageName']= imageName;
        }
        $('#name').next('span').remove();
        if(json['name'] == ''){
            $('#name').after('<span style="color: red">Name not null</span>')
        } else{
            AddBuilding(json);
        }
    })

    function AddBuilding(data){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/buildings",
            type:"POST",
            headers: {
                "Authorization": "Bearer " + jwtToken
            },
            contentType: "application/json",
            data : JSON.stringify(data), //Convert từ Object trong JS qua JSON
            dataType : "JSON", //Định dạng dữ liệu nhận từ server
            success : function(response){
                console.log('success');
                alert(response.message);
                window.location.href="<c:url value="/admin/building-list"></c:url>"
            },
            error : function(response){
                console.log('failed');
                if (Array.isArray(response.responseJSON.message)) {
                    alert(response.responseJSON.message.join("\n"));
                }else{
                    alert(response.responseJSON.message);
                }
            }
        })
    }
</script>
</body>
</html>
