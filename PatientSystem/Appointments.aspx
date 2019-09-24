<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="PatientSystem.Appointments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <!-- ============================================================== -->
        <!-- pageheader  -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header" id="top">
                    <h2 class="pageheader-title">Appointment</h2>
                    <p class="pageheader-text">Add appointment</p>
                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Appointment</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end pageheader  -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- basic form  -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                <div class="card">
                    <h5 class="card-header">Add/Update Appointment</h5>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="inputText3" class="col-form-label">Doctor Name  <span style="color: red">*</span></label>
                            <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="save" ControlToValidate="ddlDoctor" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Patient Name<span style="color: red">*</span></label>
                            <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" ControlToValidate="ddlPatient" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputText4" class="col-form-label">Appointment Date <span style="color: red">*</span></label>
                              <asp:TextBox ID="txtAppointment" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="save" ControlToValidate="txtAppointment" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Timing<span style="color: red">*</span></label>
                              <asp:TextBox ID="txtTiming" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="save" ControlToValidate="txtTiming" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                         
                        </div>
                        <asp:HiddenField ID="hdnValue" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col-sm-12 pl-0">
                            <p class="text-right">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-space btn-primary" Text="Save" ValidationGroup="save" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnback" runat="server" class="btn btn-space btn-danger" Text="Reset" OnClick="btnback_Click" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end basic form  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- select options  -->
        <!-- ============================================================== -->
        <div class="row">
            <!-- ============================================================== -->
            <!-- basic table  -->
            <!-- ============================================================== -->
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header">Appointments List </h5>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered first">
                                <asp:GridView ID="grd" runat="server" CssClass="table table-striped table-bordered table-hover"
                                    AutoGenerateColumns="false" EmptyDataText="No Record Found" DataKeyNames="ID"
                                    AllowPaging="false" PageSize="10" OnRowCommand="grd_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Doctor Name
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="butType" runat="server" CommandName="updates" Text='<%# Eval("DoctorName") %>' CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                                        <asp:BoundField DataField="Timing" HeaderText="Timing" />
                                        <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" />
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton Text="Delete" ID="butEnable" runat="server" class="btn btn-warning btn-xs" CommandName="enable" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end basic table  -->
            <!-- ============================================================== -->
        </div>


    </div>

    <%--<section class="content-header">
        <h1>Appointments
       
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Appointments</li>
        </ol>
    </section>
    <div class="col-md-12">
        <!-- Horizontal Form -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Add / Update Appointments</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->

            <div class="box-body">
              <div class="form-group col-md-6">
                    <label class="col-sm-4 control-label" for="inputEmail3">Doctor Name <span style="color: red">*</span></label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="save" ControlToValidate="ddlDoctor" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-4 control-label" for="inputEmail3">Patient Name <span style="color: red">*</span></label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddlPatient" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" ControlToValidate="ddlPatient" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-4 control-label" for="inputEmail3">Appointment Date <span style="color: red">*</span></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtAppointment" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="save" ControlToValidate="txtAppointment" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-4 control-label" for="inputEmail3">Timing <span style="color: red">*</span></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtTiming" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="save" ControlToValidate="txtTiming" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnValue" runat="server" />
            <!-- /.box-body -->
            <div class="box-footer">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Save" ValidationGroup="save" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnback" runat="server" class="btn btn-danger" Text="Reset" OnClick="btnback_Click" />
            </div>
            <!-- /.box-footer -->
        </div>
        <!-- /.box -->
    </div>
    <div class="box-body">
        <div id="datatable-responsive_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

            <asp:GridView ID="grd" runat="server" CssClass="table table-striped table-bordered table-hover"
                AutoGenerateColumns="false" EmptyDataText="No Record Found" DataKeyNames="ID"
                AllowPaging="false" PageSize="10" OnRowCommand="grd_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Doctor Name
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="butType" runat="server" CommandName="updates" Text='<%# Eval("DoctorName") %>' CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                    <asp:BoundField DataField="Timing" HeaderText="Timing" />
                      <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton Text="Delete" ID="butEnable" runat="server" class="btn btn-warning btn-xs" CommandName="enable" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>--%>
</asp:Content>
