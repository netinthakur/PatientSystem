using PatientSystem.BizModels.Interfaces;
using PatientSystem.BizModels.Models;
using PatientSystem.BizModels.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PatientSystem
{
    public partial class Patients : System.Web.UI.Page
    {
        IPatientService _service = new PatientService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }
        protected void bindGrid()
        {
            ListToDataTable lsttodt = new ListToDataTable();
            var lst = _service.GetPatientList();
            DataTable dt = lsttodt.ToDataTable(lst);
            if (dt != null && dt.Rows.Count > 0)
            {
                grd.DataSource = dt;
                grd.DataBind();
            }
            else
            {
                grd.DataBind();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            PatientModel mdl = new PatientModel();
            mdl.PatientName = txtPatientName.Text.Trim();
            mdl.RegistrationNumber = txtRegistrationNumber.Text.Trim();
            mdl.FatherName = txtFatherName.Text.Trim();
            mdl.Age = Convert.ToInt32(txtAge.Text.Trim());
            mdl.Address = txtAddress.Text.Trim();
            mdl.HealthIssue = txtHealthIssue.Text.Trim();
            if (hdndocId.Value != "")
                mdl.ID = Guid.Parse(hdndocId.Value);
            bool result = _service.InsertUpdatePatient(mdl);
            if (result)
            {
                Response.Write("<script>alert('Record saved successfully')</script>");
            }
            bindGrid();

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Patients.aspx");
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());
            string batchid = this.grd.DataKeys[rowIndex]["ID"].ToString();

            if (e.CommandName == "updates")
            {
                ListToDataTable lsttodt = new ListToDataTable();
                var lst = _service.PatientListById(Guid.Parse(batchid));
                DataTable dt = lsttodt.ToDataTable(lst);
                if (dt != null && dt.Rows.Count > 0)
                {
                    hdndocId.Value = dt.Rows[0]["ID"].ToString();
                    txtRegistrationNumber.Text = dt.Rows[0]["RegistrationNumber"].ToString();
                    txtPatientName.Text = dt.Rows[0]["PatientName"].ToString();
                    txtFatherName.Text = dt.Rows[0]["FatherName"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();
                    txtAge.Text = dt.Rows[0]["Age"].ToString();
                    txtHealthIssue.Text = dt.Rows[0]["HealthIssue"].ToString();
                    btnSubmit.Text = "Update";
                }
                else
                {
                    //do nothing
                    btnSubmit.Text = "Save";
                }
            }
            else
            {
                DataTable dt = new DataTable();
                bool result = _service.DeletePatient(Guid.Parse(batchid));
                if (result)
                {
                    bindGrid();

                }
            }

        }
    }
}