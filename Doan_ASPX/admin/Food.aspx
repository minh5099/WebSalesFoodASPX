<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="Doan_ASPX.admin.Food" %>
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
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="TenSP"
                        placeholder="Tên Sản Phẩm"></asp:TextBox>
                      <asp:Label CssClass="text-danger" Visible="false" runat="server" ID="lblUs">Tên Sản Phẩm</asp:Label>
                      <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Tên Sản Phẩm Ko Được Để Trống" ControlToValidate="TenSP"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control form-control-user" ID="MTa"
                       placeholder="Mô Tả Sản Phẩm"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Name" runat="server" ErrorMessage="Phần Mô Tả Không Được Để Trống"  ControlToValidate="MTa"></asp:RequiredFieldValidator>
                  </div>
                   <div class="col-lg-4 col-sm-6">
                       <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Price"
                         TextMode="Number" placeholder="Price"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ErrorMessage="Email Can Not Empty" ControlToValidate="Price"></asp:RequiredFieldValidator>
                   </div>
                </div>
                <div class="form-group row">
                  <div class="col-lg-4 col-sm-6 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Price_promo" placeholder="Khuyến Mãi"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Pass" runat="server" ErrorMessage="Khuyến Mãi" ControlToValidate="Price_promo" ></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6">
                    <asp:Label runat="server">Ảnh Hiện Thị Trong Danh Sách</asp:Label>
                    <asp:FileUpload ID="fulThumb" runat="server" />
                  </div>
                  <div class="col-lg-4 col-sm-6">   
                      <asp:Label runat="server">Ảnh Hiện Thị</asp:Label>
                    <asp:FileUpload ID="fulImg" runat="server" />
                  </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-4 col-sm-6">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Unit" placeholder="Đơn Vị Tính"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Unit" runat="server" ErrorMessage="Đơn Vị Tính Ko Được Để Trống" ControlToValidate="Unit" ></asp:RequiredFieldValidator>
                        </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Percent_Promo" placeholder="Phần Trăm Khuyến Mãi"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Percent" runat="server" ErrorMessage="Not Null" ControlToValidate="Percent_Promo" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                      <asp:Label runat="server">Đánh Giá Sản Phẩm</asp:Label>
                      <asp:DropDownList runat="server" ID="DanhGia">
                          <asp:ListItem Value="1" Text="1 Sao"></asp:ListItem>
                          <asp:ListItem Value="2" Text="2 Sao"></asp:ListItem>
                          <asp:ListItem Value="3" Text="3 Sao"></asp:ListItem>
                          <asp:ListItem Value="4" Text="4 Sao"></asp:ListItem>
                          <asp:ListItem Selected="True" Value="5" Text="5 Sao"></asp:ListItem>
                      </asp:DropDownList>
                    </div>
                </div>
                <div class ="form-group row">
                    <div class="col-lg-4 col-sm-6">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Sold" placeholder="Sold" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Sold" runat="server" ErrorMessage="Not Null" ControlToValidate="Sold" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Point" placeholder="Điểm Sản Phẩm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Point" runat="server" ErrorMessage="Not Null" ControlToValidate="Point" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <asp:DropDownList runat="server" ID="drl_loai">
                            <asp:ListItem Selected="True" Text="Loại 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Loại 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Loại 3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Loại 4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Loại 5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class ="form-group row">
                    <div class="col-lg-4 col-sm-6">
                        <asp:DropDownList runat="server" ID="drl_Active">
                            <asp:ListItem Selected="True" Text="Hoạt Động" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Không Hoạt Động" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <%--<a href="login.html" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>--%>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnTaoSP" Text="Thêm Tài Khoản" OnClick="btnTaoSP_Click" />
            </div>
          </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
