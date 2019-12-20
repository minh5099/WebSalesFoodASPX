<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Doan_ASPX.client.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideContent" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Products</span></p>
                    <h1 class="mb-0 bread">Products</h1>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-5 text-center">
                    <ul class="product-category">
                        <li>
                            <asp:HyperLink runat="server" ID="hplAll" Text="All" NavigateUrl="~/client/shop.aspx"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink runat="server" ID="hplVegetables" Text="Vegetables" NavigateUrl="~/client/shop.aspx?category=25"></asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink runat="server" ID="hplFruits" Text="Fruits" NavigateUrl="~/client/shop.aspx?category=5"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink runat="server" ID="hplJuice" Text="Juice" NavigateUrl="~/client/shop.aspx?category=8"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink runat="server" ID="hpltDried" Text="Dried" NavigateUrl="~/client/shop.aspx?category=7"></asp:HyperLink></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <asp:Repeater runat="server" ID="rptProduct">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="#" class="img-prod">
                                    <img class="img-fluid" src='<%= Page.ResolveUrl("~/admin/")%><%#Eval("img") %>' alt="Colorlib Template">
                                    <%--<span class="status">30%</span>
                                    <div class="overlay"></div>--%>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#"><%#Eval("name") %></a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span><%#Eval("price") %></span></p>
                                        </div>
                                    </div>
                                    a                 
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                <span><i class="ion-ios-cart"></i></span>
                                            </a>
                                            <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                <span><i class="ion-ios-heart"></i></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <asp:Repeater runat="server" ID="pageRpt">
            <ItemTemplate>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li><a href="#">&lt;</a></li>
                                <li class="active"><span>1</span></li>
                                <li><a href="#">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="JsContent" runat="server">
</asp:Content>
