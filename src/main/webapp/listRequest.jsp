<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@page import="com.bean.UserBean" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="com.bean.RequestBean"%>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="ISO-8859-1">
        <title>StudentDashboard</title>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="assets/plugins/fontawesome-free/css/all.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="assets/dist/css/adminlte.min.css">
      </head>

      <body class="sidebar-mini">
        <%
	ArrayList<RequestBean> requests = (ArrayList<RequestBean>) request.getAttribute("requests");
	
%>
            <div class="wrapper">
              <jsp:include page="StudentHeader.jsp"></jsp:include>
              <jsp:include page="StudentLeftSideBar.jsp"></jsp:include>

              <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                  <div class="container-fluid">
                    <div class="row mb-2">
                      <div class="col-sm-6">
                        <h1>DataTables</h1>
                      </div>
                      <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                          <li class="breadcrumb-item"><a href="#">Home</a></li>
                          <li class="breadcrumb-item active">DataTables</li>
                        </ol>
                      </div>
                    </div>
                  </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-12">
                        <div class="card">
                          <div class="card-header">
                            <h3 class="card-title">DataTable with default features</h3>
                          </div>

                          <div class="card-body">
                            <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
                              <div class="row">
                                <div class="col-sm-12">
                                  <table id="example1" class="table table-bordered table-striped dataTable dtr-inline"
                                    aria-describedby="example1_info">
                                    <thead>
                                      <tr>
                                        <th>Request_id</th>
                                        <th>Student</th>
                                        <th>Leaves Left</th>
                                        <th>Enrollment</th>
                                        <th>Pass Date</th>
                                        <th>Ask Time</th>
                                        <th>Reason</th>
                                        <th>Approval</th>                                      </tr>
                                    </thead>
                                    <tbody>
                                    <%
													for(RequestBean req : requests){
										   %>
												<tr>
													<td><%=req.getRequestId()%></td>
													<td><%=req.getName()%></td>
													<td><%=req.getLeavesLeft() %></td>
										            <td><%=req.getEnrollmentNumber() %></td>
										            <td><%=req.getPassDate() %></td>
										            <td><%=req.getAskTime() %></td>
										            <td><%=req.getReason() %></td>
										            <td><%=req.getApprove() %></td>
													<%
														}
													%>
                                        </tbody>
                                  </table>
                                </div>
                                <!-- <col-sm-12> -->
                              </div>
                              <!-- row -->
                            </div>
                            <!-- example1_wrapper -->
                          </div>
                          <!-- card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                      <!-- /.col -->
                    </div>
                    <!-- /.row -->
                  </div>
                  <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
              </div>
              <!-- /.content-wrapper -->
            </div>
            <!-- wrapper -->
            <script src="assets/plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap 4 -->
            <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- DataTables  & Plugins -->
            <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
            <script src="assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
            <script src="assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
            <script src="assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
            <script src="assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
            <script src="assets/plugins/jszip/jszip.min.js"></script>
            <script src="assets/plugins/pdfmake/pdfmake.min.js"></script>
            <script src="assets/plugins/pdfmake/vfs_fonts.js"></script>
            <script src="assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
            <script src="assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>
            <script src="assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
            <!-- AdminLTE App -->
            <script src="assets/dist/js/adminlte.min.js"></script>
            <!-- AdminLTE for demo purposes -->
            <!-- Page specific script -->
            <script>
              $(document).ready(function () {
                $("#example1").DataTable({
                  "responsive": true, "lengthChange": false, "autoWidth": false,
                  "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
              })
            </script>
            <script>
              function changeStatus(userId, currentStatus) {
                location.href = "ChangeStudentStatus?userId=" + userId + "&currentStatus=" + currentStatus;
              }
            </script>

      </body>

      </html>