using PatientSystem.BizModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Interfaces
{
    public interface IAppointmentService
    {
        List<AppointmentModel> GetAppointmentList();
        bool InsertUpdateAppointmentMaster(AppointmentModel mdl);
        bool DeleteAppointment(Guid ID);
        List<AppointmentModel> GetAppointmentListByID(Guid ID);

    }
}
