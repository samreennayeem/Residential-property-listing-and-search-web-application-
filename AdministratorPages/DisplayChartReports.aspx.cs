using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class AdministratorPages_DisplayChartReports : System.Web.UI.Page
{
    SqlConnection dbConnection = new SqlConnection("Data Source=mis-sql.uhcl.edu;Initial Catalog=Data;User ID=Isam_Data;Password=*project*");
    protected void Page_Load(object sender, EventArgs e)
    {


        getchartype();
        //PIE CHART

        String command2 = "select count(*) from [House] where property_type = 1 and sold = 'False'";  
        SqlCommand command3 = new SqlCommand(command2, dbConnection);
        String command4 = "select count(*) from [House] where property_type = 2 and sold = 'False'  ";
        SqlCommand command5 = new SqlCommand(command4, dbConnection);
        dbConnection.Open();
        SqlDataReader reader2 = command3.ExecuteReader();
        reader2.Read();
        int a = (int)reader2[0];
        var series = Chart2.Series["Series1"];
        series.Points.AddXY("For Sale", a);
        reader2.Close();
        SqlDataReader reader3 = command5.ExecuteReader();
         reader3.Read();
         a = (int)reader3[0];
        series.Points.AddXY("For Rent",a);
        reader3.Close();


     
        dbConnection.Close();
        

        String command6 = "select count(*) from [House] where sold = 'True' ";
        SqlCommand command7 = new SqlCommand(command6, dbConnection);
        String command8 = "select count(*) from [House] where sold = 'False'  ";
        SqlCommand command9 = new SqlCommand(command8, dbConnection);
        dbConnection.Open();
        SqlDataReader reader4 = command7.ExecuteReader();
        reader4.Read();
        a = (int)reader4[0];
        var series1 = Chart3.Series["Series1"];
        series1.Points.AddXY("Sold", a);
        reader4.Close();
        SqlDataReader reader5 = command9.ExecuteReader();
        reader5.Read();
        a = (int)reader5[0];
        series1.Points.AddXY("Available", a);
        reader5.Close();


       
        dbConnection.Close();

        if (!IsPostBack)
        {
            string query = "select user_name from [User]";
            string q = "select count(*) from [User]";
            SqlCommand query1 = new SqlCommand(query, dbConnection);
            SqlCommand query2 = new SqlCommand(q, dbConnection);
            dbConnection.Open();
            SqlDataReader dr = query2.ExecuteReader();
            dr.Read();
            a = (int)dr[0];
            dr.Close();
            dr = query1.ExecuteReader();
            dr.Read();
            for (var i = 0; i < a; i++)
            {
                string res = (string)dr[0];
                DropDownList1.Items.Add(res);
                dr.Read();
            }
            dr.Close();
            dbConnection.Close();
        }
       
        
        }

    private void getchartype()
    {
        foreach (int charttype in Enum.GetValues(typeof(SeriesChartType)))
        {
            ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), charttype), charttype.ToString());
            DropDownList2.Items.Add(li);
        }
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        dbConnection.Open();
        string id = DropDownList1.SelectedItem.Text;
        string query = "select user_id from [User] where user_name = '" + id + "'";
        SqlCommand query1 = new SqlCommand(query, dbConnection);
        SqlDataReader dr = query1.ExecuteReader();
        dr.Read();
        int userid = (int)dr[0];
        dr.Close();
        query = "select count(*) from [House] where property_type = 1 and added_by = '" + userid + "'";
        query1 = new SqlCommand(query, dbConnection);
        dr = query1.ExecuteReader();
        dr.Read();
        int forsale = (int)dr[0];
        dr.Close();
        query = "select count(*) from [House] where property_type = 2 and added_by = '" + userid + "'";
        query1 = new SqlCommand(query, dbConnection);
        dr = query1.ExecuteReader();
        dr.Read();
        int forrent = (int)dr[0];
        dr.Close();
        Panel1.Visible = true;
        var series = Chart1.Series["Series1"];
        series.Points.AddXY("For Sale", forsale);
        series.Points.AddXY("For Rent", forrent);
        dbConnection.Close();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
        Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
        Chart3.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList2.SelectedValue);
    }
}
