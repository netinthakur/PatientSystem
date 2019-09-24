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
    public partial class Doctors : System.Web.UI.Page
    {
        IDoctorService _service = new DoctorService();
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
            var lst = _service.GetDoctorList();
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
            DoctorModel mdl = new DoctorModel();
            mdl.DoctorName = txtDoctorName.Text.Trim();
            mdl.RegistrationNumber = txtRegistrationNumber.Text.Trim();
            mdl.Qualification = txtQualification.Text.Trim();
            mdl.Address = txtAddress.Text.Trim();
            mdl.PhoneNumber = txtPhoneNumber.Text.Trim();
            mdl.Experience = txtExperience.Text.Trim();
            if (hdndocId.Value != "")
                mdl.ID = Guid.Parse(hdndocId.Value);
            bool result = _service.InsertUpdateDoctor(mdl);
            if (result)
            {
                Response.Write("<script>alert('Record saved successfully')</script>");
            }
            bindGrid();

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctors.aspx");
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());
            string batchid = this.grd.DataKeys[rowIndex]["ID"].ToString();

            if (e.CommandName == "updates")
            {
                ListToDataTable lsttodt = new ListToDataTable();
                var lst = _service.DoctorListById(Guid.Parse(batchid));
                DataTable dt = lsttodt.ToDataTable(lst);
                if (dt != null && dt.Rows.Count > 0)
                {
                    hdndocId.Value = dt.Rows[0]["ID"].ToString();
                    txtRegistrationNumber.Text = dt.Rows[0]["RegistrationNumber"].ToString();
                    txtDoctorName.Text = dt.Rows[0]["DoctorName"].ToString();
                    txtQualification.Text = dt.Rows[0]["Qualification"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();
                    txtPhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();
                    txtExperience.Text = dt.Rows[0]["Experience"].ToString();
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
                bool result = _service.DeleteDoctor(Guid.Parse(batchid));
                if (result)
                {
                    bindGrid();

                }
            }

        }

    }
}