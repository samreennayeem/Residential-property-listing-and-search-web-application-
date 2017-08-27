<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DisplayChartReports.aspx.cs" Inherits="AdministratorPages_DisplayChartReports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Style1.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="~/bootstrap/bootstrap.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="../Content/video.css" rel="stylesheet" />
    <style type="text/css">
       
        table {
  border-collapse: separate;
  border-spacing: 50px 0;
}

td {
  padding: 10px 0;
}

        h4,h3 {
            text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
        }

    </style>

    <body>


        <div class="container">
            <video poster="../poster.png" autoplay="true" loop>
                <source src="../Media/Home.mp4" type="video/mp4" />
            </video>

            <div class="text">



                <div>
                    <div style="margin-top:100px;width:29%;height:55%; align-content:center; margin-left:30%; background-color:ghostwhite; filter:alpha(opacity=90); /* IE */
            -moz-opacity:0.9; /* Mozilla */
opacity: 0.9; cssclass="col-md-4 col-sm-4" >
                        
                        <ul class="nav nav-pills">
                            <li role="presentation"><a href="../Report.aspx">Reports</a></li>
                            <li role="presentation" class="active"><a href="#">Chart Report</a></li>
                            <li role="presentation"><a href="RealtorDue.aspx">Manage Realtors</a></li>
                            </ul>
                     

                        <div>
                            <br />

                            <asp:DropDownList ID="DropDownList1" runat="server" class="dropdown-toggle btn-primary" >
                                
                            </asp:DropDownList> &nbsp &nbsp <asp:Button ID="Button1" runat="server" Text="Generate chart" Class="btn-primary"  OnClick="Button1_Click" /> &nbsp &nbsp &nbsp <asp:DropDownList ID="DropDownList2" runat="server" class="dropdown-toggle btn-primary" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                          </div> 
                        </div>     
                      <div>
                              <table> 
                               <tr>
                                   <td>
                                <asp:Panel ID="Panel1" runat="server" Visible="false">
                                <h3 style="color:whitesmoke" >Chart generated based on user. This chart depicts Number of Houses posted by a particular user. </h3>
                                <asp:Chart ID="Chart1" runat="server" EnableTheming ="true" BackGradientStyle="TopBottom" BorderlineDashStyle="Solid" BorderlineWidth="2" BorderSkin-SkinStyle="Emboss" BackSecondaryColor="#99EB47"> 
                                    <Series>
                                        <asp:Series Name="Series1" ChartType="Bar" BackGradientStyle="TopBottom" BorderWidth="2" BorderDashStyle="Solid" ShadowColor="#99CCFF"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" Area3DStyle-Enable3D="True" Area3DStyle-Inclination="10" Area3DStyle-IsClustered="True" Area3DStyle-Perspective="5" Area3DStyle-Rotation="0" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </asp:Panel>
                                   </td>
                                   
                                   <td>
                                 <h3 style="color:whitesmoke">Pie Chart of Total Number of Houses for Sale and Rent</h3>
                            <asp:Chart ID="Chart2" runat="server" EnableTheming ="true" BackGradientStyle="TopBottom" BorderlineDashStyle="Solid" BorderlineWidth="2" BorderSkin-SkinStyle="Emboss" BackSecondaryColor="#99EB47" >
                                <Series>
                                     <asp:Series  Name="Series1">
                                     </asp:Series>
                                </Series>
                                <ChartAreas>
                                          <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" Area3DStyle-Enable3D="True" Area3DStyle-Inclination="10" Area3DStyle-IsClustered="True" Area3DStyle-Perspective="5" Area3DStyle-Rotation="0" Area3DStyle-WallWidth="0">
                                          </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                                   </td>
                                   
                                   <td>
                                       <h3 style="color:whitesmoke">Bar Chart of Total Number of Houses Available and Sold</h3>
                            <asp:Chart ID="Chart3" runat="server" EnableTheming ="true" BackGradientStyle="TopBottom" BorderlineDashStyle="Solid" BorderlineWidth="2" BorderSkin-SkinStyle="Emboss" BackSecondaryColor="#F30C63">
                                <Series>
                                    <asp:Series  Name="Series1"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackGradientStyle="TopBottom" Area3DStyle-Enable3D="True" Area3DStyle-Inclination="10" Area3DStyle-IsClustered="True" Area3DStyle-Perspective="5" Area3DStyle-Rotation="0" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                                   </td>
                               </tr>
                           </table>
                            
                           
                           <%-- <br />
                            

                            <br />
                            --%>


                        </div>





                    </div>
                </div>
                <div>
                </div>
                <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>


            </div>
        </div>
    </body>
</asp:Content>

