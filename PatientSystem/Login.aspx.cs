using PatientSystem.BizModels.Services;
using PatientSystem.BizModels.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatientSystem
{
    public partial class Login : System.Web.UI.Page
    {
        LoginService _service = new LoginService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            LoginModel mdl = new LoginModel();
            Response.Cookies["UserName"].Value = Email.Text.Trim();
            Response.Cookies["Password"].Value = Password.Text.Trim();
            mdl.UserID = Email.Text.Trim();
            mdl.Password = Password.Text.Trim();
            bool msg = _service.ValidateCredentials(mdl);
            if (msg)
            {

                Response.Redirect("Doctors.aspx");
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Login ID and Password is invalid.";
            }
        }

    }
}