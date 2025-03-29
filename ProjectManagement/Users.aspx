<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="Users.aspx.cs" Inherits="ProjectManagement.Users" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Users Management</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="card shadow-lg border-0 rounded-3">
            <div class="card-header bg-success text-center py-3">
                <h2 class="text-white fw-bold">User Management</h2>
            </div>
            <div class="card-body p-4">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover"
                        AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField  ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
                            <asp:CommandField ShowDeleteButton="True"  ControlStyle-CssClass="btn btn-danger" />  
                            <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                            <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Form for Insert/Edit -->
    <div class="container mt-4">
        <div class="card shadow border-0 rounded-3">
            <div class="card-header bg-primary text-white text-center">
                <h4>User Form</h4>
            </div>
            <div class="card-body">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        <div class="mb-3">
                            <label class="form-label">User ID:</label>
                            <asp:Label ID="USER_IDLabel1" runat="server" CssClass="form-control" Text='<%# Eval("USER_ID") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Username:</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("USERNAME") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <asp:TextBox ID="USER_EMAILTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_EMAIL") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contact:</label>
                            <asp:TextBox ID="USER_CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_CONTACT") %>' />
                        </div>
                        <div class="text-center">
                            <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-success me-2" CommandName="Update" Text="Update" />
                            <asp:Button ID="UpdateCancelButton" runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </EditItemTemplate>

                    <InsertItemTemplate>
                        <div class="mb-3">
                            <label class="form-label">User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_ID") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Username:</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("USERNAME") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <asp:TextBox ID="USER_EMAILTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_EMAIL") %>' />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contact:</label>
                            <asp:TextBox ID="USER_CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("USER_CONTACT") %>' />
                        </div>
                        <div class="text-center">
                            <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success me-2" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="InsertCancelButton" runat="server" CssClass="btn btn-danger" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </InsertItemTemplate>

                    <ItemTemplate>
                        <div class="text-center">
                            <asp:Button ID="NewButton" runat="server" CssClass="btn btn-outline-primary " CommandName="New" Text="Add New User"  />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM &quot;USERS&quot;"
        InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USERNAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;) VALUES (:USER_ID, :USERNAME, :USER_EMAIL, :USER_CONTACT)"
        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USER_EMAIL&quot; = :USER_EMAIL, &quot;USER_CONTACT&quot; = :USER_CONTACT WHERE &quot;USER_ID&quot; = :USER_ID"
        DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID">
        
        <DeleteParameters>
            <asp:Parameter Name="USER_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USER_ID" Type="Decimal" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="USER_EMAIL" Type="String" />
            <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="USER_EMAIL" Type="String" />
            <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
            <asp:Parameter Name="USER_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
