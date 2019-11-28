<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Doan_ASPX.admin.Default" %>
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
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="UserName"
                        placeholder="Username"></asp:TextBox>
                      <asp:Label CssClass="text-danger" Visible="false" runat="server" ID="lblUs">User Name Had Exist</asp:Label>
                      <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="UserName Can Not Empty" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Name"
                       placeholder="Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Name" runat="server" ErrorMessage="Name Can Not Empty"  ControlToValidate="Name"></asp:RequiredFieldValidator>
                  </div>
                   <div class="col-lg-4 col-sm-6">
                       <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Email"
                         TextMode="Email" placeholder="Email"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ErrorMessage="Email Can Not Empty" ControlToValidate="Email"></asp:RequiredFieldValidator>
                   </div>
                </div>
                <div class="form-group row">
                  <div class="col-lg-4 col-sm-6 mb-sm-0">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Password"
                         TextMode="Password" placeholder="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_Pass" runat="server" ErrorMessage="Password Can Not Empty" ControlToValidate="Password" ></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6">
                    <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="RePassword" TextMode="Password" placeholder="RePassword"></asp:TextBox>
                      <asp:CompareValidator ID="cpr_Pass" runat="server" ErrorMessage="RePassword Not Same Password" ControlToValidate="RePassword" ControlToCompare="Password"></asp:CompareValidator>
                  </div>
                  <div class="col-lg-4 col-sm-6">   
                      <asp:TextBox runat="server" CssClass="form-control form-control-user" ID="Phone"
                        placeholder="Phone Number"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="rev_Phone" runat="server" ErrorMessage="Number Only Access From 0-9 and Only 10 Number" ValidationExpression="[0-9]{10}" ControlToValidate="Phone"></asp:RegularExpressionValidator>
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
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnRegister" Text="Thêm Tài Khoản" OnClick="btnRegister_Click"/>
                <asp:Button runat="server" CssClass="btn btn-primary btn-user btn-block" ID="btnUpdate" Text="Cập Nhật" OnClick="Update_Click" Visible="false"/>
            </div>
          </div>
    </div>
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
    <div class="row">
        <div class="col-lg-12 pl-5">
            <div class="col-lg-4">
                <asp:Button runat="server" Text="Deleted" ID="btnDeleteRecord" CssClass="btn btn-danger form-control form-control-user" Width="80px" OnClick="btnDeleteRecord_Click"/>
            </div>
        </div>
    </div>
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
