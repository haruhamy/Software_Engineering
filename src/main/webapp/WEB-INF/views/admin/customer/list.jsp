<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-container">
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
<%--                    <li class="active">Dashboard</li>--%>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Danh sách khách hàng
<%--                        <small>--%>
<%--                            <i class="ace-icon fa fa-angle-double-right"></i>--%>
<%--                            overview &amp; stats--%>
<%--                        </small>--%>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

                            <span class="widget-toolbar">
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>

										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>

										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</span>
                        </div>

                        <div class="widget-body" style="display: block;">
                            <div class="widget-main">
                                <form:form id="listForm" action="/admin/customer-list" method="GET" modelAttribute="customerSearch">
                                    <div class="row">
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label>Tên khách hàng</label>
<%--                                            <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                <form:input path="fullName" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label>Di động</label>
<%--                                            <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                <form:input path="phone" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-6">
                                            <label>Email</label>
<%--                                            <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                <form:input path="email" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label>Trạng thái</label>
<%--                                            <input type="number" class="form-control" name="numberOfBasement" value=${modelSearch.numberOfBasement}>--%>
                                                <form:select path="status" class="form-control">
                                                    <form:option value="">~~ Chọn Tất Cả Trạng Thái ~~</form:option>
                                                    <form:options items="${status}"></form:options>
                                                </form:select>
                                        </div>
                                        <security:authorize access="hasAnyRole('MANAGER')">
                                            <div class="col-xs-2">
                                                <label>Chọn nhân viên</label>
                                                <form:select path="staffId" class="form-control">
                                                    <form:option value="">~~ Chọn Tất Cả Nhân viên ~~</form:option>
                                                    <form:options items="${staffs}"></form:options>
                                                </form:select>
                                            </div>
                                        </security:authorize>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <button class="btn btn-primary" id="btn-search">
                                                <i class="ace-icon glyphicon glyphicon-search"></i>
                                                Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a href="/admin/customer-edit">
                            <button class="btn btn-app btn-success btn-sm" title="Thêm khách hàng">
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="24" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                  <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                            </button>
                        </a>
                        <security:authorize access="hasAnyRole('MANAGER')">
                            <button class="btn btn-app btn-danger btn-sm" title="Xóa khách hàng" id="btn-deleteCustomer">
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="24" fill="currentColor" class="bi bi-person-fill-x" viewBox="0 0 16 16">
                                  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m-.646-4.854.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 0 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 .708-.708"/>
                                </svg>
                            </button>
                        </security:authorize>
                    </div>
                </div>
                <div class="hr hr-18 dotted hr-double"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <display:table name="customerList.listResult" id="tableList" cellspacing="0" cellpadding="0"
                                       requestURI="/admin/customer-list" size="${customerList.totalItems}" partialList="true" sort="external"
                                       pagesize="${customerList.maxPageItems}" defaultsort="2" defaultorder="ascending"
                                       export="false"
                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5em;">
                        <!-- Cột checkbox -->
                            <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                        headerClass="center select-cell">
                                            <fieldset>
                                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                                            </fieldset>
                            </display:column>

                        <!-- Các cột thông tin khác -->
                            <display:column property="fullName" title="Tên khách hàng"/>
                            <display:column property="phone" title="Di động"/>
                            <display:column property="email" title="Email" />
                            <display:column property="demand" title="Nhu cầu" />
                            <display:column property="createdBy" title="Người thêm" />
                            <display:column property="createdDate" title="Ngày thêm" />
                            <display:column property="status" title="Tình trạng" />

                            <!-- Cột thao tác -->
                            <display:column title="Thao tác" escapeXml="false">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <security:authorize access="hasAnyRole('MANAGER')">
                                        <button class="btn btn-xs btn-success" onclick="assignmentCustomer(${tableList.id})" title="Giao tòa nhà">
                                            <i class="ace-icon fa fa-users"></i>
                                        </button>
                                    </security:authorize>
                                    <a class="btn btn-xs btn-info" href="/admin/customer-edit-${tableList.id}">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>
                                    <security:authorize access="hasAnyRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteOneCustomer(${tableList.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </security:authorize>
                                </div>
                            </display:column>
                        </display:table>
                     </div>
                </div>
            </div><!-- /.page-content -->
        </div>

    <div class="modal" id="assigmentcustomerModal" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Danh sách nhân viên</h5>
                </div>
                <div class="modal-body">
                    <table id="staff-list" class="table table-striped table-bordered table-hover">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-assignmentCustomer">Giao khách hàng</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="customerId" value="">
</div><!-- /.main-container -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('#btn-search').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    })

    function assignmentCustomer(id){
        console.log(id);
        $('#customerId').val(id);
        loadStaff(id);
        $('#assigmentcustomerModal').modal();
    }

    function loadStaff(id){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/customers/"+id+"/staffs",
            type:"GET",
            headers: {
                "Authorization": "Bearer " + jwtToken
            },
            // data : JSON.stringify(data), //Convert từ Object trong JS qua JSON
            dataType : "JSON", //Định dạng dữ liệu nhận từ server
            contentType: "application/json",
            success : function(response){
                console.log(response.message);
                var row='';
                $.each(response.data,function (index,item){
                   row+='<tr>';
                   row+='<td class="center"> <input type="checkbox" value=' + item.staffId +' id=checkbox_'+item.staffId+ ' ' + item.checked+'> </td>';
                   row+='<td class="center">' + item.fullName+'</td>';
                   row+='</tr>';
                });
                $('#staff-list tbody').html(row);
            },
            error : function(response){
                console.log('failed');
            }
        })
    }
    //Giao khach hang cho nhan vien
    $('#btn-assignmentCustomer').click(function(e){
        e.preventDefault();
        var json={};
        json['customerId']=$('#customerId').val();
        var staffIds=$('#staff-list').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        json['staffs']=staffIds;
        console.log(json);
        if(json['customerId'] != "" ){
            updateAssignment(json);
        }else {
            alert("Customer ID not null");
        }
    })

    $('#btn-deleteCustomer').click(function(e){
        e.preventDefault();
            var data=[];
            var ids = $('#tableList').find('input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            ids = ids.filter(function (id) {
                return id && id !== "on";
            });
            data['ids']=ids;
            console.log(ids);
            if(data['ids'] != ''){
                const userResponse = confirm("Bạn có chắc chắn muốn xóa những khách hàng đã chọn ?");
                if(userResponse){
                    deleteCustomer(data['ids']);
                }
            }
            else {
                alert("Không có khách hàng được chọn");
            }
    })
    function deleteOneCustomer(id){
        const userResponse = confirm("Bạn có chắc chắn muốn xóa khách hàng này ?");
        if(userResponse){
            deleteCustomer(id);
        }
    }
    /* BEGIN AJAX*/
    function updateAssignment(data){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/assigments/customer",
            type:"POST",
            headers: {
                "Authorization": "Bearer " + jwtToken
            },
            data : JSON.stringify(data), //Convert từ Object trong JS qua JSON
            dataType : "JSON", //Định dạng dữ liệu nhận từ server
            contentType: "application/json",
            success : function(response){
                console.log('success');
                alert(response.message);
            },
            error : function(response){
                console.log('failed');
                alert("Failed");
            }
        });
    }

    function deleteCustomer(data){
        console.log("http://localhost:8080/api/customers/"+data);
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/customers/"+data,
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
                window.location.href="<c:url value="/admin/customer-list"></c:url>";
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