<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RealtorDue.aspx.cs" Inherits="AdministratorPages_RealtorDue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Style1.css" rel="stylesheet" />
    <link href="../Content/video.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.css" rel="stylesheet" />
  <%--  <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 1px solid #FFFFFF;
        }
    </style>--%>

    <body style="overflow-y:scroll">


        <div class="container">
            <video poster="../poster.png" autoplay="true" loop>
                <source src="../Media/Home.mp4" type="video/mp4" />
            </video>

            <div class="text">



                <div>
                    <div class="flex col-md-6">
                        <br />

                        <br />
                        <br />


                        <ul class="nav nav-pills">
                            <li role="presentation"><a href="../Report.aspx">Reports</a></li>
                            <li role="presentation"><a href="DisplayChartReports.aspx">Chart Report</a></li>
                            <li role="presentation" class="active"><a href="#">Manage Realtors</a></li>
                            
                            
                        </ul>
                        <br />
                        <br />
                        <h3>
                            <asp:Label CssClass="label label-default" ForeColor="#ff9900" ID="lblToBlock" runat="server">Realtors Who are due :</asp:Label></h3>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" Width="1080px"
                            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                            AutoGenerateColumns="False" DataKeyNames="user_id" AllowSorting="True" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="Realtor Id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                <asp:BoundField DataField="user_name" HeaderText="Realtor Name" SortExpression="user_name" />
                                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                <asp:BoundField DataField="mobile_no" HeaderText="Mobile No" SortExpression="mobile_no" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="amount_due" HeaderText="Amount Due" SortExpression="amount_due" />
                                <asp:TemplateField HeaderText="Select User to Block" SortExpression="user_id">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelectGrid1" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle CssClass="header"></HeaderStyle>

                            <PagerStyle CssClass="pager"></PagerStyle>

                            <RowStyle CssClass="rows"></RowStyle>
                        </asp:GridView>

                        <br />
                        <br />
                        <asp:Button ID="btnBlock" class="btn btn-primary btn-lg btn-block" BackColor="#3399ff" runat="server" Text="Block Selected Realtors" OnClick="btnBlock_Click" />
                        <asp:Button ID="btnSendWarning" class="btn btn-primary btn-lg btn-block" BackColor="#3399ff" runat="server" Text="Send Payment Notification" OnClick="btnSendWarning_Click" />
                        <br />
                        <br />
                        <h3>
                            <asp:Label CssClass="label label-default" ForeColor="#ff9900" ID="lblBlocked" runat="server">Realtors Who are Blocked :</asp:Label></h3>
                        <br />
                        <br />

                        <asp:GridView ID="GridView2" runat="server" Width="1080px"
                            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                            AutoGenerateColumns="False" DataKeyNames="user_id" AllowSorting="True" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="Realtor Id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                <asp:BoundField DataField="user_name" HeaderText="Realtor Name" SortExpression="user_name" />
                                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                <asp:BoundField DataField="mobile_no" HeaderText="Mobile No" SortExpression="mobile_no" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="amount_due" HeaderText="Amount Due" SortExpression="amount_due" />
                                <asp:TemplateField HeaderText="Select User to Block" SortExpression="user_id">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelectGrid1" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle CssClass="header"></HeaderStyle>

                            <PagerStyle CssClass="pager"></PagerStyle>

                            <RowStyle CssClass="rows"></RowStyle>
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Button ID="btnUnblock" class="btn btn-primary btn-lg btn-block" BackColor="#3399ff" runat="server" Text="UnBlock Selected Realtors" OnClick="btnUnblock_Click" />
                        <asp:Button ID="btnBlockNotification" class="btn btn-primary btn-lg btn-block" BackColor="#3399ff" runat="server" Text="Send Block Notification" OnClick="btnBlockNotification_Click" />






                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT user_id, user_name, password, mobile_no, email, amount_due FROM [User] WHERE (amount_due &gt; 0) AND (user_id IN (SELECT Id FROM Block AS Block_1))"></asp:SqlDataSource>







                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DataConnectionString %>" SelectCommand="SELECT user_id, user_name, password, mobile_no, email, amount_due FROM [User] WHERE (amount_due &gt; 0) AND (user_id NOT IN (SELECT Id FROM Block AS Block_1))"></asp:SqlDataSource>







                    </div>
                </div>
                <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
            </div>
        </div>
    </body>
</asp:Content>

