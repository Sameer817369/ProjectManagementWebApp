<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="UserProject.aspx.cs" Inherits="ProjectManagement.UserProject" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>User Project</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USERNAME" DataValueField="USER_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass=" ms-3 shadow-sm border border-secondary rounded-3 p-2 bg-light">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USERNAME&quot;) VALUES (:USER_ID, :USERNAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME WHERE &quot;USER_ID&quot; = :USER_ID">
                <DeleteParameters>
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
               <div class="container mt-5">
                    <div class="card shadow-lg border-0 rounded-3">
                    <!-- Header -->
                        <div class="card-header bg-success bg-gradient text-center py-4">
                            <h2 class="text-white fw-bold">Project Details</h2>
                        </div>
                    <!-- Card Body -->
                        <div class="card-body p-4">
                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover text-center"></asp:GridView>
                                <HeaderStyle CssClass="bg-dark text-white" />
                            </div>
                        </div>
                   </div>
               </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select u.USER_ID,u.USERNAME,u.USER_EMAIL,u.USER_CONTACT,p.PROJECT_ID, pr.PROJECT_NAME,pr.PROJECT_START_DATE,pr.PROJECT_DUE_DATE,pr.PROJECT_STATUS  from users u join userproject p on u.USER_ID= p.USER_ID join project pr on p.project_id = pr.project_id where u.user_id = :users">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="users" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>


