<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="FoodType.aspx.cs" Inherits="Doan_ASPX.admin.FoodType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Code" runat="server">
     <div class="row" >
        <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
                <div class="form-group row">
                  <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="typeName"
                       placeholder="Loại Sản Phẩm"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Type" runat="server" ErrorMessage="Loại Sản Phẩm Không Được Để Trống"  ControlToValidate="typeName"></asp:RequiredFieldValidator>
                  </div>
                   <div class="col-lg-4 col-sm-6">
                      <asp:Label runat="server">Loại Bài Post</asp:Label>
                      <asp:DropDownList runat="server" ID="typePost"  CssClass="form-control form-control-user">
                          <asp:ListItem Selected="True" Value="1" Text="1"></asp:ListItem>
                          <asp:ListItem Value="2" Text="2"></asp:ListItem>
                          <asp:ListItem Value="3" Text="3"></asp:ListItem>
                          <asp:ListItem Value="4" Text="4"></asp:ListItem>
                      </asp:DropDownList>
                    </div>
                    <div class="col-lg-4 col-sm-6">   
                      <asp:Label runat="server">Ảnh Hiện Thị</asp:Label>
                    <asp:FileUpload ID="imgUpload" runat="server" />
                  </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="userName"
                       placeholder="UserName"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_userName" runat="server" ErrorMessage="UserName Không Được Để Trống"  ControlToValidate="userName"></asp:RequiredFieldValidator>
                  </div>
                    <div class="col-lg-4 col-sm-6 mb-3">
                        <asp:DropDownList ID="Status" runat="server" CssClass=" form-control form-control-user">
                            <asp:ListItem Value="1" Selected="True">Active</asp:ListItem>
                            <asp:ListItem Value="0">Not Active</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <%--<a href="login.html" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>--%>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnLoai" Text="Thêm Loại Sản Phẩm" OnClick="btnLoai_Click" />
            </div>
          </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
