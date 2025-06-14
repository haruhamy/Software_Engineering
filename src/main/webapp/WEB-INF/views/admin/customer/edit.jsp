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
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <form:form class="form-horizontal" role="form" id="formEdit" modelAttribute="customerDTO">
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1"> Tên khách hàng</label>
                            <div class="col-xs-9">
                                <form:input path="fullName" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Số điện thoại</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Phường" class="form-control" name="ward">--%>
                                <form:input path="phone" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Email</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Đường" class="form-control" name="street">--%>
                                <form:input path="email" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Tên công ty</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="text" placeholder="Kết cấu" class="form-control">--%>
                                <form:input path="companyName" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Nhu cầu</label>
                            <div class="col-xs-9">
                                    <%--                                <input type="number" placeholder="Số tầng hầm" class="form-control" name="numberOfBasement">--%>
                                <form:input path="demand" class="form-control"></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label" for="form-field-1">Trạng thái xử lý</label>
                            <div class="col-xs-3">
                                <form:select path="status" class="form-control">
                                    <c:if test="${not empty customerDTO.id}">
                                        <form:option value="${customerDTO.status}"></form:option>
                                    </c:if>
                                    <form:options items="${status}"></form:options>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty customerDTO.id}">
                                    <button type="button" class="btn btn-inverse" id="btnAddOrUpdateCustomer">Sửa thông tin khách hàng</button>
                                </c:if>
                                <c:if test="${empty customerDTO.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng</button>
                                </c:if>
                                <button type="button" class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                            </div>
                        </div>
                        <form:hidden path="id"/>
                    </form:form>
                    <c:if test="${not empty customerDTO.id}">
                            <c:forEach var="item" items="${transactionType}">
                                <div class="col-xs-12">
                                    <h2 class="smaller lighter blue">
                                        ${item.value}
                                        <button class="btn btn-md btn-success pull-right" title="Thêm giao dịch"
                                                onclick="addTransaction('${item.key}',${customerDTO.id})">
                                            <i class="ace-icon glyphicon glyphicon-plus small-80">Thêm giao dịch</i>
                                        </button>
                                    </h2>
                                    <div class="hr hr-16 dotted hr-dotted"></div>
                                </div>
                                <c:if test="${item.key =='CSKH'}">
                                    <div class="row">
							            <div class="col-xs-12">
								            <table id="CSKH-list" class="table table-striped table-bordered table-hover">
									        <thead>
										        <tr>
                                                    <th>Ngày tạo</th>
                                                    <th>Người tạo</th>
                                                    <th>Ngày sửa</th>
                                                    <th>Người sửa</th>
                                                    <th>Chi tiết giao dịch</th>
                                                    <th>Thao tác</th>
										        </tr>
									        </thead>

									        <tbody>
                                                <c:forEach var="transaction" items="${CSKH}">
                                                    <tr>
                                                        <td>${transaction.createdDate}</td>
                                                        <td>${transaction.createdBy}</td>
                                                        <td>${transaction.modifiedDate}</td>
                                                        <td>${transaction.modifiedBy}</td>
                                                        <td>${transaction.note}</td>
                                                        <td>
                                                            <a class="btn btn-xs btn-info" onclick="updateTransaction('CSKH',${customerDTO.id},${transaction.id},'${transaction.note}')">
                                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                            </a>
                                                            <security:authorize access="hasAnyRole('MANAGER')">
                                                                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteTransaction(${transaction.id},${customerDTO.id})">
                                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                </button>
                                                            </security:authorize>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
									        </tbody>
								        </table>
							            </div><!-- /.span -->
						            </div>
                                </c:if>
                                <c:if test="${item.key =='DDX'}">
                                    <div class="row">
							            <div class="col-xs-12">
								            <table id="DDX-list" class="table table-striped table-bordered table-hover">
									        <thead>
										        <tr>
                                                    <th>Ngày tạo</th>
                                                    <th>Người tạo</th>
                                                    <th>Ngày sửa</th>
                                                    <th>Người sửa</th>
                                                    <th>Chi tiết giao dịch</th>
                                                    <th>Thao tác</th>
										        </tr>
									        </thead>

									        <tbody>
                                                <c:forEach var="transaction" items="${DDX}">
                                                    <tr>
                                                        <td>${transaction.createdDate}</td>
                                                        <td>${transaction.createdBy}</td>
                                                        <td>${transaction.modifiedDate}</td>
                                                        <td>${transaction.modifiedBy}</td>
                                                        <td>${transaction.note}</td>
                                                        <td>
                                                            <a class="btn btn-xs btn-info" onclick="updateTransaction('DDX',${customerDTO.id},${transaction.id},'${transaction.note}')">
                                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                            </a>
                                                            <security:authorize access="hasAnyRole('MANAGER')">
                                                                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteTransaction(${transaction.id},${customerDTO.id})">
                                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                </button>
                                                            </security:authorize>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
									        </tbody>
								        </table>
							            </div><!-- /.span -->
						            </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                </div>
            </div>
        </div><!-- /.page-content -->

        <!-- Modal để nhập hoặc cập nhật giao dịch -->
        <div class="modal fade" id="addOrUpdateTransactionModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Nhập thông tin giao dịch</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Chi tiết giao dịch</label>
                            <div class="col-sm-9">
                                <input id="note" type="text" class="form-control" placeholder="Nhập chi tiết giao dịch">
                            </div>
                        </div>
                        <input type="hidden" id="customerId" value="">
                        <input type="hidden" id="code" value="">
                        <input type="hidden" id="transactionId" value="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction">Xác nhận</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div><!-- /.main-content -->
<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>
    function addTransaction(code,customerId){
        $('#addOrUpdateTransactionModal').modal();
        $('#note').val('');
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function updateTransaction(code,customerId,transactionId,note){
        $('#addOrUpdateTransactionModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
        $('#transactionId').val(transactionId);
        $('#note').val(note);
    }
    $('#btnCancel').click(function (e){
        e.preventDefault();
        const userResponse = confirm("Bạn có chắc chắn muốn thực hiện hành động này?");
        if (userResponse) {
            // alert("Bạn đã hủy thao tác sửa thông tin tòa nhà");
            window.location.href="<c:url value="/admin/customer-list"></c:url>";
        }
    })
    $('#btnAddOrUpdateTransaction').click(function(e){
        e.preventDefault();
        var data ={};
        data['id']=$('#transactionId').val();
        data['code']=$('#code').val();
        data['note']=$('#note').val();
        data['customerId']=$('#customerId').val();
        if(data['note'] != ''){
            AddOrUpdateTransaction(data);
        }else {
            $('#note').attr('placeholder','Vui lòng điền chi tiết giao dịch');
        }
    })
    $('#btnAddOrUpdateCustomer').click(function(e) {
        e.preventDefault();
        var formData = $('#formEdit').serializeArray();
        var json = {};

        $.each(formData, function(i, it) {
            json[it.name] = it.value;
        });
        var isValid = true;

        if (!json['fullName'] || json['fullName'].trim() === '') {
            $('[name="fullName"]').after('<span class="error-message" style="color: red">Tên khách hàng không được để trống</span>');
            isValid = false;
        }

        if (!json['phone'] || json['phone'].trim() === '') {
            $('[name="phone"]').after('<span class="error-message" style="color: red">Số điện thoại không được để trống</span>');
            isValid = false;
        } else if (!/^\d{10,11}$/.test(json['phone'])) {
            $('[name="phone"]').after('<span class="error-message" style="color: red">Số điện thoại không hợp lệ</span>');
            isValid = false;
        }

        if (!json['demand'] || json['demand'].trim() === '') {
            $('[name="demand"]').after('<span class="error-message" style="color: red">Nhu cầu không được để trống</span>');
            isValid = false;
        }

        if (!json['status'] || json['status'].trim() === '') {
            $('[name="status"]').after('<span class="error-message" style="color: red">Vui lòng chọn trạng thái</span>');
            isValid = false;
        }
        if (isValid) {
            AddOrUpdateCustomer(json);
        }
    });
    function deleteTransaction(id,customerId){
        const userResponse = confirm("Bạn có chắc chắn muốn xóa giao dịch này ?");
        if(userResponse){
            deleteTransactions(id,customerId);
        }
    }
    function AddOrUpdateTransaction(data){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/transactions",
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
                window.location.href = "/admin/customer-edit-" + data.customerId;
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
    function AddOrUpdateCustomer(data){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/customers",
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
                if(!data.id){
                    window.location.href="<c:url value="/admin/customer-list"></c:url>";
                }
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
    function deleteTransactions(data,customerId){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/transactions/"+data,
            type:"DELETE",
            headers: {
                "Authorization": "Bearer " + jwtToken
            },
            dataType : "JSON", //Định dạng dữ liệu nhận từ server
            // data : JSON.stringify(data), //Convert từ Object trong JS qua JSON
            // contentType: "application/json",
            success : function(response){
                console.log('success');
                alert(response.message);
                window.location.href = "/admin/customer-edit-" + customerId;
            },
            error : function(response){
                console.log('failed');
                alert(response.message);
            }
        });
    }
</script>
</body>
</html>
