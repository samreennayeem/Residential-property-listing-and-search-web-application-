using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdministratorPages_RealtorDue : System.Web.UI.Page
{
    decimal amountDue;
    String realtorName;
    SqlConnection dbConnection = new SqlConnection("Data Source=mis-sql.uhcl.edu;Initial Catalog=Data;User ID=Isam_Data;Password=*project*");// new SqlConnection("Data Source=.\\SQLEXPRESS;Integrated Security=true");

    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void btnBlock_Click(object sender, EventArgs e)
    {
        // bool atLeastOneRowDeleted = false;
        List<int> realtorId = new List<int>();

        foreach (GridViewRow row in GridView1.Rows)
        {
            // Access the CheckBox
            CheckBox cb = (CheckBox)row.FindControl("cbSelectGrid1");
            if (cb.Checked)
            {
                // str = str + cb.Checked.ToString();
                //// Delete row! (Well, not really...)
                //atLeastOneRowDeleted = true;
                //// First, get the ProductID for the selected row
                realtorId.Add(Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value));
                // DeleteResults.Text += string.Format(
                //"This would have deleted ProductID {0}<br />", productID);
            }

        }
        try
        {
            dbConnection.Open();
            foreach (var li in realtorId)
            {
                String command = "INSERT INTO Block VALUES (" + li + ", 'Block')";
                SqlCommand cmd = new SqlCommand(command, dbConnection);

                cmd.ExecuteNonQuery();


            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            dbConnection.Close();
        }

        //  DeleteResults.Visible = atLeastOneRowDeleted;


        GridView1.DataBind();
        GridView2.DataBind();


    }
    protected void btnUnblock_Click(object sender, EventArgs e)
    {
        List<int> realtorId = new List<int>();

        foreach (GridViewRow row in GridView2.Rows)
        {
            // Access the CheckBox
            CheckBox cb = (CheckBox)row.FindControl("cbSelectGrid1");
            if (cb.Checked)
            {
                // str = str + cb.Checked.ToString();
                //// Delete row! (Well, not really...)
                //atLeastOneRowDeleted = true;
                //// First, get the ProductID for the selected row
                realtorId.Add(Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value));
                // DeleteResults.Text += string.Format(
                //"This would have deleted ProductID {0}<br />", productID);
            }

        }
        try
        {
            dbConnection.Open();
            foreach (var li in realtorId)
            {
                String command = "DELETE FROM Block WHERE Id=" + li;
                SqlCommand cmd = new SqlCommand(command, dbConnection);

                cmd.ExecuteNonQuery();


            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            dbConnection.Close();
        }

        GridView1.DataBind();
        GridView2.DataBind();


    }
    protected void btnSendWarning_Click(object sender, EventArgs e)
    {
        List<int> realtorId = new List<int>();

        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbSelectGrid1");
            if (cb.Checked)
            {
                realtorId.Add(Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value));
            }
        }


        DateTime today = DateTime.Now;
        MailMessage mail = new MailMessage();
       mail.From = new MailAddress("uhcl5678@gmail.com", "Houston Housing");
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;


        smtp.Credentials = new System.Net.NetworkCredential("uhcl5678@gmail.com", "$ultan1234");
        mail.Attachments.Add(new Attachment(Server.MapPath("~") + "Images/Logo1.png"));
     

        try
        {
            dbConnection.Open();
            foreach (var li in realtorId)
            {
                String command = "select * FROM [User] WHERE user_id='" + li + "'";
                //String command = "select * from Block";
                SqlCommand cmd = new SqlCommand(command, dbConnection);
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();


                //************
                string body = string.Empty;
                using (StreamReader reader1 = new StreamReader(Server.MapPath("..") + "\\WarningEmail.html"))
                {
                    body = reader1.ReadToEnd();
                }


                body = body.Replace("{date}", today.Date.ToString("dd MMM yyyy"));
                body = body.Replace("{deadline}", today.AddDays(14).Date.ToString("dd MMM yyyy"));
                amountDue = Convert.ToDecimal(reader["amount_due"].ToString());
                realtorName = reader["user_name"].ToString();

                body = body.Replace("{UserName}", realtorName);
                body = body.Replace("{amountdue}", amountDue.ToString());
                body = body.Replace("{home}", HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/Default.aspx");


                AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
                LinkedResource image1 = new LinkedResource(Server.MapPath("..") + "\\Images\\Logo1.png", MediaTypeNames.Image.Jpeg);
                image1.ContentId = "\\Images\\Logo1.png";
                alternate.LinkedResources.Add(image1);
                mail.AlternateViews.Add(alternate);
                //**********


                mail.To.Add(reader["email"].ToString());


                
                reader.Close();
                mail.Body = body;
                smtp.Send(mail);
                

            }

            smtp.Dispose();
            mail.Dispose();
           

        }
        catch (Exception ex)
        {

        }
        finally
        {
            dbConnection.Close();


        }








    }
    protected void btnBlockNotification_Click(object sender, EventArgs e)
    {

        List<int> realtorId = new List<int>();

        foreach (GridViewRow row in GridView2.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbSelectGrid1");
            if (cb.Checked)
            {
                realtorId.Add(Convert.ToInt32(GridView2.DataKeys[row.RowIndex].Value));
            }
        }


        DateTime today = DateTime.Now;
        MailMessage mail = new MailMessage();
       //********************* mail.From = new MailAddress("Email ID", "Houston Housing");
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
       //********************** smtp.Credentials = new System.Net.NetworkCredential("Email Id", "Password");
        mail.Attachments.Add(new Attachment(Server.MapPath("~") + "Images/Logo1.png"));
       

        try
        {
            dbConnection.Open();
            foreach (var li in realtorId)
            {
                String command = "select * FROM [User] WHERE user_id='" + li + "'";
                SqlCommand cmd = new SqlCommand(command, dbConnection);
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();

                string body = string.Empty;
                using (StreamReader reader1 = new StreamReader(Server.MapPath("~") + "\\AdministratorPages\\BlockEmail.html"))
                {
                    body = reader1.ReadToEnd();
                }
                body = body.Replace("{date}", today.Date.ToString("dd MMM yyyy"));
                body = body.Replace("{deadline}", today.AddDays(14).Date.ToString("dd MMM yyyy"));
                body = body.Replace("{UserName}", reader["user_name"].ToString());
                body = body.Replace("{amountdue}", reader["amount_due"].ToString());
                body = body.Replace("{home}", HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/Default.aspx");

                AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
                LinkedResource image1 = new LinkedResource(Server.MapPath("..") + "\\Images\\Logo1.png", MediaTypeNames.Image.Jpeg);
                image1.ContentId = "\\Images\\Logo1.png";
                alternate.LinkedResources.Add(image1);
                mail.AlternateViews.Add(alternate);

                mail.To.Add(reader["email"].ToString());
               
                mail.Body = body;
                smtp.Send(mail);
                reader.Close();


            }

            smtp.Dispose();
            mail.Dispose();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            dbConnection.Close();
        }




    }
}