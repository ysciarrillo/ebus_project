<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ebus_project.ProductList" %>

<asp:Content runat="server" ID="DashBoard" ContentPlaceHolderID="Dashboard">
    

          <asp:Label ID="BrowseLabel"  CssClass="col-md-2 control-label " runat="server"><b>Browse: </b></asp:Label>
       
        <div id="CategoryMenu" class="col-md-8 btn-lg " style="text-align: center" >
            <asp:ListView ID="categoryList" 
                ItemType="ebus_project.Models.Category"
                runat="server"
                SelectMethod="GetCategories">
                <ItemTemplate>
                    <div class="bg-success">
                        <a href="/ProductList.aspx?id=<%#: Item.CId %>">
                            <%#: Item.CName %>
                        </a>
                   </div>
                </ItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
            </asp:ListView>
        </div>
        <div class="col-md-2"></div>
       
       <br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <asp:Label ID="SearchLabel"  AssociatedControlID="SearchText" CssClass="col-md-2 control-label" runat="server">Search:</asp:Label>
        <asp:TextBox ID="SearchText" runat="server"  CssClass="form-control"></asp:TextBox><br />
        <div class="col-md-2"></div>
        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" CssClass="btn btn-primary" /><br />
        <br />
    </asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
            <div class="col-lg-12">
            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="PId" GroupItemCount="5"
                ItemType="ebus_project.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Item.PId%>">
                                        <img src="/Images/<%#:Item.PImagePath%>"
                                            width="280" style="border: solid" /></a>
                                </td>
                            </tr>
                            <tr >
                                <td>
                                    <a href="ProductDetails.aspx?productID=<%#:Item.PId%>">
                                        <span>
                                           <h4><b>Brand: </b><%#:Item.PBrand%> </h4>
                                        </span>

                                        <span>
                                            <b>Model: </b><%#:Item.PModel%>
                                        </span>
                                        
                                        <br />
                                        <span>
                                            <b>Description: </b><%#:Item.PDescr.Substring(0, 40)+"..."%>
                                        </span>
                                        <br />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
             <div class="col-lg-9">
      
             <b> <asp:Label runat="server" ID="SearchNumber" ></asp:Label></b>    
        </div>
   


</asp:Content>