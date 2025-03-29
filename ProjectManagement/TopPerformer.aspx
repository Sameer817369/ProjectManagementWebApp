<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="TopPerformer.aspx.cs" Inherits="ProjectManagement.TopPerformer" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Top Performes</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <p>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM 
    (SELECT u.USER_ID, 
            u.username, 
            p.PROJECT_ID, 
            p.PROJECT_NAME, 
            COUNT(t.TASK_ID) AS COMPLETED_TASKS 
     FROM PROJECT p 
     JOIN userprojcettasks upt ON p.PROJECT_ID = upt.PROJECT_ID
     JOIN users u ON upt.USER_ID = u.USER_ID 
     JOIN TASK t ON upt.TASK_ID = t.TASK_ID 
     WHERE p.PROJECT_ID = :PROJECT_ID 
     AND t.STATUS = 'Completed' 
     GROUP BY p.PROJECT_ID, 
              p.PROJECT_NAME, 
              u.USER_ID, 
              u.username 
     ORDER BY COMPLETED_TASKS DESC) 
WHERE ROWNUM &lt;= 3">
               <SelectParameters>
                   <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
               </SelectParameters>
           </asp:SqlDataSource>
           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" CssClass="ms-3 shadow-sm border border-secondary rounded-3 p-2 bg-light">
           </asp:DropDownList>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
       </p>
    <div class="container mt-5">
         <div class="card shadow-lg border-0 rounded-3">
         <!-- Header -->
             <div class="card-header bg-success bg-gradient text-center py-4">
                 <h2 class="text-white fw-bold">🏆Top Three Performers🏆</h2>
             </div>
         <!-- Card Body -->
             <div class="card-body p-4">
                 <div class="table-responsive">              
                     <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover">
                     </asp:GridView>
                     </div>
                 </div>
             </div>
</asp:Content>
