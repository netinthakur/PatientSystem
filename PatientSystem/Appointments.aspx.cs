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
    public partial class Appointments : System.Web.UI.Page
    {
        IAppointmentService _service = new AppointmentService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindPatientList();
                bindDoctorList();
                bindGrid();
            }
        }
        protected void bindDoctorList()
        {
            ListToDataTable lsttodt = new ListToDataTable();
            DoctorService service = new DoctorService();
            var lst = service.GetDoctorList().Select(x => new { x.DoctorName, x.ID }).ToList();
            DataTable dt = lsttodt.ToDataTable(lst);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlDoctor.DataSource = dt;
                ddlDoctor.DataTextField = "DoctorName";
                ddlDoctor.DataValueField = "ID";
                ddlDoctor.DataBind();

            }
            else
            {
                ddlDoctor.DataBind();
            }
        }
        protected void bindPatientList()
        {
            ListToDataTable lsttodt = new ListToDataTable();
            IPatientService service = new PatientService();
            var lst = service.GetPatientList().Select(x => new { x.PatientName, x.ID }).ToList();
            DataTable dt = lsttodt.ToDataTable(lst);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlPatient.DataSource = dt;
                ddlPatient.DataTextField = "PatientName";
                ddlPatient.DataValueField = "ID";
                ddlPatient.DataBind();

            }
            else
            {
                ddlPatient.DataBind();
            }
        }
        protected void bindGrid()
        {
            ListToDataTable lsttodt = new ListToDataTable();
            var lst = _service.GetAppointmentList();
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
            AppointmentModel mdl = new AppointmentModel();
            mdl.DoctorID = Guid.Parse(ddlDoctor.SelectedValue);
            mdl.PatientID = Guid.Parse(ddlPatient.SelectedValue);
            mdl.Timing = txtTiming.Text.Trim();
            mdl.AppointmentDate = Convert.ToDateTime(txtAppointment.Text.Trim());
            if (hdnValue.Value != "")
                mdl.ID = Guid.Parse(hdnValue.Value);
            bool result = _service.InsertUpdateAppointmentMaster(mdl);
            bindGrid();
            if (result)
            {
                Response.Write("<script>alert('Record saved successfully')</script>");
            }

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointments.aspx");
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());
            string Id = this.grd.DataKeys[rowIndex]["ID"].ToString();

            if (e.CommandName == "updates")
            {
                ListToDataTable lsttodt = new ListToDataTable();
                var lst = _service.GetAppointmentListByID(Guid.Parse(Id));
                DataTable dt = lsttodt.ToDataTable(lst);
                if (dt != null && dt.Rows.Count > 0)
                {
                    hdnValue.Value = dt.Rows[0]["ID"].ToString();
                    txtTiming.Text = dt.Rows[0]["Timing"].ToString();
                    txtAppointment.Text = dt.Rows[0]["AppointmentDate"].ToString();
                    ddlDoctor.SelectedValue = dt.Rows[0]["DoctorID"].ToString();
                    ddlPatient.SelectedValue = dt.Rows[0]["PatientID"].ToString();

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
                bool result = _service.DeleteAppointment(Guid.Parse(Id));
                if (result)
                {
                    bindGrid();

                }
            }
        }

    }
}