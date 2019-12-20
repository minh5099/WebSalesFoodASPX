<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="FoodType.aspx.cs" Inherits="Doan_ASPX.admin.FoodType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Css" runat="server">
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js' type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Code" runat="server">
     <div class="row" >
        <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Tạo Loại Sản Phẩm!</h1>
              </div>
                <div class="form-group row">
                      <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="typeName"
                           placeholder="Loại Sản Phẩm"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rfv_Type" runat="server" ErrorMessage="Loại Sản Phẩm Không Được Để Trống"  ControlToValidate="typeName" ValidationGroup="vdg1"></asp:RequiredFieldValidator>
                      </div>
                      <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                        <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="userName"
                           placeholder="UserName"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rfv_userName" runat="server" ErrorMessage="UserName Không Được Để Trống"  ControlToValidate="userName" ValidationGroup="vdg1"></asp:RequiredFieldValidator>
                      </div>
                        <div class="col-lg-4 col-sm-6 mb-3">
                            <asp:DropDownList ID="Status" runat="server" CssClass=" form-control form-control-user">
                                <asp:ListItem Value="1" Selected="True">Active</asp:ListItem>
                                <asp:ListItem Value="0">Not Active</asp:ListItem>
                            </asp:DropDownList>
                        </div>                  
                </div>
                <div class="form-group row">
                        <div class="col-lg-4 col-sm-6">
                          <asp:DropDownList runat="server" ID="typePost"  CssClass="form-control form-control-user">
                              <asp:ListItem Selected="True" Text="Chọn Loại Bài Post">Chọn Loại Bài Post</asp:ListItem>
                              <asp:ListItem Value="1" Text="1"></asp:ListItem>
                              <asp:ListItem Value="2" Text="2"></asp:ListItem>
                              <asp:ListItem Value="3" Text="3"></asp:ListItem>
                              <asp:ListItem Value="4" Text="4"></asp:ListItem>
                          </asp:DropDownList>
                          <asp:RequiredFieldValidator runat="server" ID="rfvLoaiBaiPost" ErrorMessage="Chưa Chọn Loại Bài Post" ControlToValidate="typePost" InitialValue="Chọn Loại Bài Post"></asp:RequiredFieldValidator>
                        </div>                   
                        <div class="col-lg-8 col-sm-6">   
                            <asp:Image runat="server" ID="fulIg" AlternateText="Image"/>
                            <asp:FileUpload ID="imgUpload" runat="server" onchange="ImagePreview(this)" />
                      </div>
                </div>
                <%--<a href="login.html" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>--%>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnLoai" Text="Thêm Loại Sản Phẩm" OnClick="btnLoai_Click" ValidationGroup="vdg1" />
            </div>
          </div>
    </div>
    <%--<div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Thông Báo</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <asp:Label ID="lblmodal" runat="server" Text=""></asp:Label>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <%--<button type="button" id="myButton" class="btn btn-danger" data-dismiss="modal">OK</button>
                    <asp:Button ID="myButton" runat="server" CssClass="btn btn-danger" Text="OK" data-dismiss="modal" />
                    <asp:Button ID="Button" runat="server" CssClass="btn btn-danger" Visible="false" Text="OK" data-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=fulIg.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        };
        <%--function openModal() {
            $('document').ready(function () {
                jQuery('#myModal').modal('show');
            });
        }
        $(document).ready(function () {
            $("#myButton").click(function () {
                window.location.href = "FoodLists.aspx";
            });
        });
        $(document).ready(function () {
            $("#Button").click(function () {
                window.location.href = "Food.aspx";
            });
        });--%>
    </script>
</asp:Content>
