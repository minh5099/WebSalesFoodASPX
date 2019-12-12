<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Doan_ASPX.admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Css" runat="server">
<style>
    .pagination {
      display: inline-block;
    }

    .pagination a {
      color: black;
      padding: 8px 16px;
    }

    .pagination a.active {
      background-color: #4CAF50;
      color: white;
    }
    .pagination a:hover:not(.active) {background-color: #ddd;}
</style>
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
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="UserName"
                        placeholder="Username"></asp:TextBox>
                      <asp:Label CssClass="text-danger" Visible="false" runat="server" ID="lblUs">User Name Had Exist</asp:Label>
                      <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="UserName Can Not Empty" ControlToValidate="UserName" ValidationGroup="checkRegister"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Name"
                       placeholder="Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Name" runat="server" ErrorMessage="Name Can Not Empty"  ControlToValidate="Name" ValidationGroup="checkRegister"></asp:RequiredFieldValidator>
                  </div>
                   <div class="col-lg-4 col-sm-6">
                       <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Email"
                         TextMode="Email" placeholder="Email"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ErrorMessage="Email Can Not Empty" ControlToValidate="Email" ValidationGroup="checkRegister"></asp:RequiredFieldValidator>
                   </div>
                </div>
                <div class="form-group row">
                  <div class="col-lg-4 col-sm-6 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Password"
                         TextMode="Password" placeholder="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Pass" runat="server" ErrorMessage="Password Can Not Empty" ControlToValidate="Password" ValidationGroup="checkRegister" ></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="RePassword" TextMode="Password" placeholder="RePassword"></asp:TextBox>
                      <asp:CompareValidator ID="cpr_Pass" runat="server" ErrorMessage="RePassword Not Same Password" ControlToValidate="RePassword" ControlToCompare="Password" ValidationGroup="checkRegister"></asp:CompareValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6">   
                      <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Phone"
                        placeholder="Phone Number"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="rev_Phone" runat="server" ErrorMessage="Number Only Access From 0-9 and Only 10 Number" ValidationExpression="[0-9]{10}" ControlToValidate="Phone" ValidationGroup="checkRegister"></asp:RegularExpressionValidator >
                  </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-6 col-sm-6 mb-3">
                        <asp:DropDownList ID="Status" runat="server" CssClass=" form-control form-control-user">
                            <asp:ListItem Value="1" Selected="True">Active</asp:ListItem>
                            <asp:ListItem Value="0">Not Active</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-6 col-sm-6 ">
                        <asp:DropDownList ID="Role" runat="server" CssClass="form-control form-control-user">
                            <asp:ListItem Value="1" Selected="True">Admin</asp:ListItem>
                            <asp:ListItem Value="0">Client</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <%--<a href="login.html" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>--%>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnRegister" Text="Thêm Tài Khoản" OnClick="btnRegister_Click" ValidationGroup="checkRegister"/>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnUpdate" Text="Cập Nhật" OnClick="Update_Click" Visible="false"/>
            </div>
          </div>
    </div>
    <div class="row mt-5">
        <div class="col-lg-12 p-3">
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
    <!-- Đối Với GridView -->
    <%-- Sử dụng GridView
    <div class="row">
        <div class="col-lg-12 ">
            <div class="pr-5 pl-5">
                <div class="duv-gridview">
                <asp:GridView runat="server" ID="gridTable" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True"  OnSelectedIndexChanged="gridTable_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkDel"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="username" HeaderText="UserName" ItemStyle-Width="150px">
                            <ItemStyle Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="150px">
                             <ItemStyle Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="pass" HeaderText="Password" ItemStyle-Width="150px" >
                             <ItemStyle Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150px">
                            <ItemStyle Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="phone" HeaderText="Phone" ItemStyle-Width="150px">
                             <ItemStyle Width="150px"/>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Role">
                            <EditItemTemplate>
                                <asp:DropDownList ID="drdRole" runat="server">
                                    <asp:ListItem Value="1">Admin</asp:ListItem>
                                    <asp:ListItem Value="0">Client</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# DisplayRole(Eval("role")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="drdStatus" runat="server" style="margin-top: 8px">
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">Not Active</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                       <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# DisplayStatus(Eval("status")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:CommandField ShowSelectButton="True" HeaderText="Action" />                   
                        <asp:HyperLinkField DataNavigateUrlFields="username" DataNavigateUrlFormatString="Member.aspx? username={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" Wrap="True" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                </div>
            </div>
        </div>
    </div> --%>

     <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>UserName</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <asp:Repeater runat="server" ID="rptListMember">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("username")%></td>
                                <td><%#Eval("email")%></td>
                                <td><%#Eval("pass")%></td>
                                <td><%#Eval("name")%></td>
                                <td><%#Eval("phone")%></td>
                                <td><%#Eval("role").ToString()=="1"?"Admin":"Client"%></td>                                 
                                <td><%#(Eval("status").ToString()=="1"?"Active":"Disabled")%></td>
                                <td>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/admin/Member.aspx?chucnang=update&username={0}", Eval("username")) %>' CssClass="fas fa-pen"></asp:HyperLink>
                                    <%--<asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/admin/Member.aspx?chucnang=del&username={0}", Eval("username")) %>' CssClass="fas fa-trash-alt" onclick="delData();"></asp:HyperLink>--%>
                                    <asp:HyperLink runat="server" CssClass="fas fa-trash-alt" onclick="delData();"></asp:HyperLink>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
              </table>
               <div class="pagination">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <a href="?page=<%#Eval("index") %><% if (Request["key"] != null) Response.Write("&key=" + Request["key"]); %><% if (Request["username"] != null) Response.Write("&username=" + Request["username"]); %>" style="text-align:center;background-color:<%#(Eval("active").ToString()=="1"?"aquamarine":"white")%>"><%#Eval("index")%></a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <script type="text/javascript">
        function delData(customer) {
            var customer = ($(this).parents().find('span.username').html());
            $.ajax({
                url: '~/admin/Member.aspx/delData_onclick',
                type: "POST",
                data: '{username: ' + customer + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    alert(r.d)
                },
                error: function (r) {
                    alert("Lỗi Rồi");
                }
            });
        }
    </script>
</asp:Content>
