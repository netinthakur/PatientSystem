<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="PatientSystem.Doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <!-- ============================================================== -->
        <!-- pageheader  -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header" id="top">
                    <h2 class="pageheader-title">Doctor</h2>
                    <p class="pageheader-text">Add doctor information</p>
                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Doctor</a></li>
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
                    <h5 class="card-header">Add/Update Doctor</h5>
                    <div class="card-body">

                        <div class="form-group">
                            <label for="inputText3" class="col-form-label">Registration Number <span style="color: red">*</span></label>
                            <asp:TextBox ID="txtRegistrationNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="save" ControlToValidate="txtRegistrationNumber" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Doctor Name<span style="color: red">*</span></label>
                            <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" ControlToValidate="txtDoctorName" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputText4" class="col-form-label">Qualification<span style="color: red">*</span></label>
                            <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="save" ControlToValidate="txtQualification" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">Address<span style="color: red">*</span></label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="save" ControlToValidate="txtAddress" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputText4" class="col-form-label">Phone Number<span style="color: red">*</span></label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="save" ControlToValidate="txtPhoneNumber" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputText4" class="col-form-label">Experience<span style="color: red">*</span></label>
                            <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="save" ControlToValidate="txtExperience" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                        <asp:HiddenField ID="hdndocId" runat="server" />
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
                    <h5 class="card-header">Doctor List </h5>
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
                                                Doctor Id
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="butType" runat="server" CommandName="updates" Text='<%# Eval("DoctorName") %>' CommandArgument="<%#((GridViewRow)Container).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RegistrationNumber" HeaderText="Registration Number" />
                                        <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" />
                                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                        <asp:BoundField DataField="Experience" HeaderText="Experience" />
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="butEnable" runat="server" class="btn btn-warning btn-xs" CommandName="enable" CommandArgument="<%#((GridViewRow)Container).RowIndex%>" Text="Delete"></asp:LinkButton>
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

    
</asp:Content>
