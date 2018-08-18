<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ebus_project.ProductDetails" %>
    <asp:Content runat="server" ID="DashBoardPanel" ContentPlaceHolderID="Dashboard">
        
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
        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" CssClass="btn btn-primary " /><br />
        <br />
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="ebus_project.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1 class="bcolor"><%#:Item.PBrand %></h1>
                <h3 class="bcolor">Model:<%#:Item.PModel %></h3>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img src="/Images/<%#:Item.PImagePath%>" style="border:#337ab7 solid ; height:300px" alt="<%#:Item.PId %>"/>
                        
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;"><br/><br/><br/><br/>
                        <div class="col-md-1"></div>
                        <div class="col-md-8">
                        <h3 class="bcolor">Description:</h3><p class="bcolor"><%#:Item.PDescr %></p>
                        
                        <br />
                        <span><h3 class="bcolor">Product Rating:&nbsp;<%#:Item.PRating %></h3></span>
                        <br />
                            </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
