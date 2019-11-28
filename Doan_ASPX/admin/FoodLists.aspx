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
            <asp:GridView runat="server" ID="gridTable" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True"  OnSelectedIndexChanged="gridTable_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chkDel"/>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:BoundField DataField="price_promo" HeaderText="Price_Promo" />
                    <asp:BoundField DataField="thumb" HeaderText="Thumb_img" />
                    <asp:BoundField DataField="img" HeaderText="Img" />
                    <asp:BoundField DataField="unit" HeaderText="Unit" />
                    <asp:BoundField DataField="percent_promo" HeaderText="Percent_Promo" />
                    <asp:BoundField DataField="rating" HeaderText="Rating" />
                    <asp:BoundField DataField="sold" HeaderText="Sold" />
                    <asp:BoundField DataField="point" HeaderText="Point" />
                    <asp:TemplateField HeaderText="Type"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
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
