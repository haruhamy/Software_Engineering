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
                        Danh sách tòa nhà
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
                                <form:form id="listForm" action="/admin/building-list" method="GET" modelAttribute="modelSearch">
                                    <div class="row">
                                    <div class="col-xs-12">
                                        <div class="col-xs-6">
                                            <label>Tên tòa nhà</label>
<%--                                            <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                <form:input path="name" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-6">
                                            <label>Diện tích sàn</label>
<%--                                            <input type="number" class="form-control" name="floorArea" value=${modelSearch.floorArea}>--%>
                                                <form:input path="floorArea" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-2">
                                            <label>Quận</label>
                                            <form:select path="district" class="form-control">
                                                <form:option value="">~~ Chọn Quận ~~</form:option>
                                                <form:options items="${district}"></form:options>
                                            </form:select>
                                        </div>
                                        <div class="col-xs-5">
                                            <label>Phường</label>
<%--                                            <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                <form:input path="ward" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-5">
                                            <label>Đường</label>
<%--                                            <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                <form:input path="street" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-4">
                                            <label>Số tầng hầm</label>
<%--                                            <input type="number" class="form-control" name="numberOfBasement" value=${modelSearch.numberOfBasement}>--%>
                                                <form:input path="numberOfBasement" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-4">
                                            <label>Hướng</label>
<%--                                            <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                <form:input path="direction" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-4">
                                            <label>Hạng</label>
<%--                                            <input type="number" class="form-control" name="level" value=${modelSearch.level}>--%>
                                                <form:input path="level" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-3">
                                            <label>Diện tích từ</label>
<%--                                            <input type="number" class="form-control" name="areaFrom" value=${modelSearch.areaFrom}>--%>
                                                <form:input path="areaFrom" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-3">
                                            <label>Diện tích đến</label>
<%--                                            <input type="number" class="form-control" name="areaTo" value=${modelSearch.areaTo}>--%>
                                                <form:input path="areaTo" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-3">
                                            <label>Giá thuê từ</label>
<%--                                            <input type="number" class="form-control" name="rentPriceFrom" value=${modelSearch.rentPriceFrom}>--%>
                                                <form:input path="rentPriceFrom" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-3">
                                            <label>Giá thuê đến</label>
<%--                                            <input type="number" class="form-control" name="rentPriceTo" value=${modelSearch.areaTo}>--%>
                                                <form:input path="rentPriceTo" class="form-control"></form:input>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="col-xs-5">
                                            <label>Tên quản lý</label>
<%--                                            <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">--%>
                                                <form:input path="managerName" class="form-control"></form:input>
                                        </div>
                                        <div class="col-xs-5">
                                            <label>SĐT quản lý</label>
<%--                                            <input type="tel" class="form-control" name="managerPhone" value=${modelSearch.managerPhone}>--%>
                                                <form:input path="managerPhone" class="form-control"></form:input>
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
                                            <form:checkboxes path="typeCode" items="${typeCode}"></form:checkboxes>
                                        </div>
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
                        <a href="/admin/building-edit">
                            <button class="btn btn-app btn-success btn-sm" title="Thêm tòa nhà">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </a>
                        <security:authorize access="hasAnyRole('MANAGER')">
                            <button class="btn btn-app btn-danger btn-sm" title="Xóa tòa nhà" id="btn-deleteBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </security:authorize>
                    </div>
                </div>
                <div class="hr hr-18 dotted hr-double"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <display:table name="buildingList.listResult" id="tableList" cellspacing="0" cellpadding="0"
                                       requestURI="/admin/building-list" size="${buildingList.totalItems}" partialList="true" sort="external"
                                       pagesize="${buildingList.maxPageItems}" defaultsort="2" defaultorder="ascending"
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
                            <display:column property="name" title="Tên tòa nhà"/>
                            <display:column property="address" title="Địa chỉ"/>
                            <display:column property="numberOfBasement" title="Số tầng hầm" />
                            <display:column property="managerName" title="Tên quản lý" />
                            <display:column property="managerPhone" title="SĐT quản lý" />
                            <display:column property="floorArea" title="Diện tích sàn" />
                            <display:column property="rentArea" title="Diện tích thuê" />
                            <display:column property="emptyArea" title="Diện tích trống" />
                            <display:column property="rentPrice" title="Giá thuê" />
                            <display:column property="serviceFee" title="Phí dịch vụ" />
                            <display:column property="brokerageFee" title="Phí môi giới" />

                            <!-- Cột thao tác -->
                            <display:column title="Thao tác" escapeXml="false">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <security:authorize access="hasAnyRole('MANAGER')">
                                        <button class="btn btn-xs btn-success" onclick="assignmentBuilding(${tableList.id})" title="Giao tòa nhà">
                                            <i class="ace-icon fa fa-users"></i>
                                        </button>
                                    </security:authorize>
                                    <a class="btn btn-xs btn-info" href="/admin/building-edit-${tableList.id}">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>
                                    <security:authorize access="hasAnyRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteOneBuilding(${tableList.id})">
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

    <div class="modal" id="assigmentbuildingModal" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
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
                    <button type="button" class="btn btn-primary" id="btn-assignmentBuilding">Giao tòa nhà</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="buildingId" value="">
</div><!-- /.main-container -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('#btn-search').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    })

    function assignmentBuilding(id){
        console.log(id);
        $('#buildingId').val(id);
        loadStaff(id);
        $('#assigmentbuildingModal').modal();
    }

    function loadStaff(id){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/buildings/"+id+"/staffs",
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
    //Giao toa nha cho nhan vien
    $('#btn-assignmentBuilding').click(function(e){
        e.preventDefault();
        var json={};
        json['buildingId']=$('#buildingId').val();
        var staffIds=$('#staff-list').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        json['staffs']=staffIds;
        console.log(json);
        if(json['buildingId'] != "" ){
            updateAssignment(json);
        }else {
            alert("Building ID not null");
        }
    })

    $('#btn-deleteBuilding').click(function(e){
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
                const userResponse = confirm("Bạn có chắc chắn muốn xóa những tòa nhà đã chọn ?");
                if(userResponse){
                    deleteBuilding(data['ids']);
                }
            }
            else {
                alert("Không có tòa nhà được chọn.");
            }
    })
    function deleteOneBuilding(id){
        const userResponse = confirm("Bạn có chắc chắn muốn xóa tòa nhà này ?");
        if(userResponse){
            deleteBuilding(id);
        }
    }
    /* BEGIN AJAX*/
    function updateAssignment(data){
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/assigments/building",
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

    function deleteBuilding(data){
        console.log("http://localhost:8080/api/buildings/"+data);
        var jwtToken = localStorage.getItem("jwtToken");
        $.ajax({
            url: "/api/buildings/"+data,
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
                window.location.href="<c:url value="/admin/building-list"></c:url>";
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