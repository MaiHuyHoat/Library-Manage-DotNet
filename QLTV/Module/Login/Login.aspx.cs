using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLTV.Data.Model;
namespace QLTV.Module.Login
{
    public partial class Login : System.Web.UI.Page
    {
        private DBContext dBContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            dBContext = new DBContext();    
        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.TextBoxUserName.Text) ||
               string.IsNullOrEmpty(this.TextBoxPassword.Text)
               )
            {


          
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tên đăng nhập hoặc mật khẩu không được trống !')", true);
            }
            else
            {
                string userName = this.TextBoxUserName.Text;
                string password = this.TextBoxPassword.Text;
                var query =  dBContext.User.FirstOrDefault(u => u.Username == userName && u.Password == password);
                if (query != null)
                {
                    Response.Redirect("/Module/Dashboard/Dashboard.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tồn tại tên đăng nhập hoặc mật khẩu !')", true);
                }

            }
        }
    }
}