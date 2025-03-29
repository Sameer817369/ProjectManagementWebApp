<%@ MasterPageFile="~/Site1.master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>User Management</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <!-- Add additional styles or meta tags here if necessary -->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main Content Area -->
    <div class="container mt-5">
        <div class="card shadow-lg border-0 rounded-3">
            <!-- Card Header -->
            <div class="card-header bg-success text-center py-3">
                <h2 class="text-white fw-bold">Projects Management</h2>
            </div>
            <!-- Card Body -->
            <div class="card-body p-4">
                <!-- Table Container -->
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover">
                        <Columns>
                            <asp:CommandField  ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
                            <asp:CommandField ShowDeleteButton="True"  ControlStyle-CssClass="btn btn-danger" />   
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" />
                            <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" SortExpression="PROJECT_START_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" SortExpression="PROJECT_STATUS" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Form View for Edit/Insert -->
  <div class="container mt-4">
      <div class="card shadow border-0 rounded-3">
          <div class="card-header bg-primary text-white text-center">
              <h4>Project Form</h4>
          </div>
          <div class="card-body">
              <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
    <EditItemTemplate>
        <div class="mb-3">
            <label for="PROJECT_IDLabel1" class="form-label">Project ID:</label>
            <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="form-control-plaintext" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_NAMETextBox" class="form-label">Project Name:</label>
            <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_START_DATETextBox" class="form-label">Start Date:</label>
            <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_DUE_DATETextBox" class="form-label">Due Date:</label>
            <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_STATUSTextBox" class="form-label">Status:</label>
            <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="form-control" />
        </div>
        <div class="text-center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
            &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
        </div>
    </EditItemTemplate>
    <InsertItemTemplate>
        <div class="mb-3">
            <label for="PROJECT_IDTextBox" class="form-label">Project ID:</label>
            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_NAMETextBox" class="form-label">Project Name:</label>
            <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_START_DATETextBox" class="form-label">Start Date:</label>
            <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_DUE_DATETextBox" class="form-label">Due Date:</label>
            <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>' CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="PROJECT_STATUSTextBox" class="form-label">Status:</label>
            <asp:TextBox ID="PROJECT_STATUSTextBox" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="form-control" />
        </div>
        <div class="text-center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
        </div>
    </InsertItemTemplate>

  
    <ItemTemplate>
        <div class="text-center">
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-outline-primary" />
        </div>
    </ItemTemplate>
</asp:FormView>

          </div>
       </div>
  </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM PROJECT WHERE PROJECT_ID = :PROJECT_ID"
        InsertCommand="INSERT INTO PROJECT (PROJECT_ID, PROJECT_NAME, PROJECT_START_DATE, PROJECT_DUE_DATE, PROJECT_STATUS) 
                       VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_START_DATE, :PROJECT_DUE_DATE, :PROJECT_STATUS)"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM PROJECT" 
        UpdateCommand="UPDATE PROJECT SET PROJECT_NAME = :PROJECT_NAME, PROJECT_START_DATE = :PROJECT_START_DATE, 
                       PROJECT_DUE_DATE = :PROJECT_DUE_DATE, PROJECT_STATUS = :PROJECT_STATUS WHERE PROJECT_ID = :PROJECT_ID">
        <DeleteParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_STATUS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PROJECT_NAME" Type="String" />
            <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
            <asp:Parameter Name="PROJECT_STATUS" Type="String" />
            <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
