﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Doan_ASPX.client.index" %>
<asp:Content ID="ContentCss" ContentPlaceHolderID="Css" runat="server">
</asp:Content>
<asp:Content ID="ContentSlide" ContentPlaceHolderID="SlideContent" runat="server">
    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/bg_1.jpg');">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/bg_2.jpg');">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">
	              <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    </section>
</asp:Content>
<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <!--List Fruit-->
    <%--<div class="form-group">
        <div class="col-lg-12 p-5">
            <asp:DataList runat="server" ID="dtl_TypeFood">

            </asp:DataList>
        </div>
    </div>--%>
    <section class="ftco-section ftco-category ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 order-md-last align-items-stretch d-flex">
								<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/category.jpg);">
									<div class="text text-center">
										<h2>Vegetables</h2>
										<p>Protect the health of every home</p>
										<p><a href="#" class="btn btn-primary">Shop now</a></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/category-1.jpg');">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="index.aspx?category=1">Fruits</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/category-2.jpg');">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="#">Vegetables</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/category-3.jpg');">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Juices</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url('<%= Page.ResolveUrl("~/admin/")%>img/category-4.jpg');">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="#">Dried</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</asp:Content>
<asp:Content ID="ContentJs" ContentPlaceHolderID="JsContent" runat="server">
</asp:Content>
