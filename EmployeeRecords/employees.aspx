<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="EmployeeRecords.employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="col-sm-10 text-left">
        <div class="grid-container">
          <%--First Row--%>
          <div>
              <h1>Employees</h1>
          </div>
         
           <%--Second row BUTTONS--%>
          <div>        
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New Employee</button>
              <button type="button" class="btn btn-primary">Import Excel</button>
          </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">
                        <label>Show
                            <select name="myTable_length" aria-controls="myTable" class="">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                        </select> entries
                        </label>  </th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col">
                            <label>Search:
                                <input type="search" class="" placeholder="" aria-controls="myTable">
                            </label>
                        </th>        
                    </tr>
                </thead>
            </table>
        <table class="table table-hover" id="tbl">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Profile Picture</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="tbody">
<%--                <tr>
                    <td><img src="pic-placeholder.png" alt="profile-pic" class="profile-pic"/></td>
                    <td>Karlo Marco S. Magno</td>
                    <td>kmsmagno@mymail.mapua.edu.ph</td>
                    <td>09451058906</td>
                    <td>Blk 6, Lt 7, Brgy. Putatan, Camella Homes 1, Muntinlupa City</td>
                    <td>Male</td>
                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">View Employee</button></td>
                </tr>
                <tr>
                    <td><img src="pic-placeholder.png" alt="profile-pic" class="profile-pic"/></td>
                    <td>Maria Santos</td>
                    <td>maria@gmail.com</td>
                    <td>09451058906</td>
                    <td>Blk 8, Lt 2, Brgy. Poblacion, Camella Homes 4, Muntinlupa City</td>
                    <td>Female</td>
                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">View Employee</button></td>
                </tr>--%>
            </tbody>
        </table>
    </div>
            <%--Showing of entries--%>
            <div class="dataTables_info" id="myTable_info" role="status" aria-live="polite">Showing 0 to 0 of 0 entries</div>
            <%--Pagination--%>
            <div class="pagination">
              <a href="#">&laquo;</a>
              <a href="#">1</a>
              <a class="active" href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">6</a>
              <a href="#">&raquo;</a>
            </div>
 
 
         <!--Add Employee Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form id="addForm">
                <div class="modal-content">                   
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add New Employees</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <label>First Name:</label>
                                <input class="form-control" id="first-name" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Last Name:</label>
                                <input class="form-control" id="last-name:" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Middle Initial:</label>
                                <input class="form-control" id="middle-initial" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Contact Number:</label>
                                <input class="form-control" id="contact-number" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email:</label>
                                <input class="form-control" id="email" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Password:</label>
                                <input class="form-control" id="password" type="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Address:</label>
                                <input class="form-control" id="address" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Birthday:</label>
                                <input class="form-control" id="birthday" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Gender:</label>
                                <input class="form-control" id="gender" type="text">
                                <%--<select class="form-control" id="gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>--%>
                            </div>
                            <div class="col-md-6">
                                <label>Religion:</label>
                                <input class="form-control" id="religion" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Nationality:</label>
                                <input class="form-control" id="nationality" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Birthplace:</label>
                                <input class="form-control" id="birthplace" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Civil Status:</label>
                                <input class="form-control" id="civil-status" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Employees Status:</label>
                                <input class="form-control" id="employee-status" type="text">
                            </div>
                            <div class="col-md-6">
                                <label>Role:</label>
                                <input class="form-control" id="role" type="text">
                            </div>
                        </div>
                      </div>
                          <div class="modal-footer">
                              <button type="button" id="saveBtn" value="Submit" onclick="SubmitData()" class="btn btn-default" data-dismiss="modal">Add</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                      </div>
                   </form>
                </div>
            </div>
        </div>
        <%--End of modal--%>

        <script src="Scripts/jquery-3.4.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="Scripts/helpers.js"></script>
        <script src="Scripts/WebForms/employee.js"></script>

        <%--View Employee Modal--%>
            <%--<div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Employee</h4>
                        </div>
                        <div class="modal-body">

                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>  
            </div>--%>
        <%--End of Modal--%>

</asp:Content>
