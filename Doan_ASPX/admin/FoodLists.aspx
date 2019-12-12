<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="FoodLists.aspx.cs" Inherits="Doan_ASPX.admin.FoodLists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Code" runat="server">
<div class="row mt-5">
    <div class="col-lg-12 p-5">
        <div class="form-group row ml-2">
            <div class="col-lg-6 col-sm-6">
                <asp:TextBox runat="server" ID="searchName" placeholder="SearchName" CssClass="form-control form-control-user"></asp:TextBox>
            </div>
            <div class="col-lg-4 col-sm-6">
                <asp:Button runat="server" Text="Search" CssClass="btn btn-primary form-control form-control-user" Width="80px" ID="Search" OnClick="Search_Click" />
            </div>
        </div>
    </div>
</div>
    <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Price_Promo</th>
                            <th>Thumb</th>
                            <th>Image</th>
                            <th>Unit</th>
                            <th>Percent_Promo</th>
                            <th>Rating</th>
                            <th>Sold</th>
                            <th>Point</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%#Eval("id") %></td>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("description") %></td>
                            <td><%#Eval("price") %></td>
                            <td><%#Eval("price_promo") %></td>
                            <td>
                                <asp:Image runat="server" ImageUrl='<%#Eval("thumb") %>' AlternateText="Ảnh Bị Lỗi" Width="100px" Height="100px"/>
                            </td>
                            <td>                               
                                <asp:Image runat="server" ImageUrl='<%#Eval("img") %>' AlternateText="Ảnh Bị Lỗi"  Width="100px" Height="100px"/>
                            </td>
                            <td><%#Eval("unit") %></td>
                            <td><%#Eval("percent_promo") %></td>
                            <td><%#Eval("rating") %></td>
                            <td><%#Eval("sold") %></td>
                            <td><%#Eval("point") %></td>
                            <td><%#Eval("type") %></td>
                            <td><%#Eval("status").ToString()=="1"?"Active":"NotActive"%></td>
                            <td>
                                <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/admin/Food.aspx?chucnang=update&id={0}", Eval("id")) %>' CssClass="fas fa-pen"></asp:HyperLink>
                                <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/admin/Food.aspx?chucnang=del&id={0}", Eval("id")) %>' CssClass="fas fa-trash-alt"></asp:HyperLink>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script type="text/javascript">
        function Del()
        {
            var ans = confirm("Bạn Có Muốn Xóa Không?");
            if(ans){return true;}
            else {return false;}
        }
    </script>
</asp:Content>
