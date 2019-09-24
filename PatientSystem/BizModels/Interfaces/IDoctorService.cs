using PatientSystem.BizModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Interfaces
{
    public interface IDoctorService
    {
        List<DoctorModel> GetDoctorList();
        bool InsertUpdateDoctor(DoctorModel mdl);
        bool DeleteDoctor(Guid ID);
        List<DoctorModel> DoctorListById(Guid ID);

    }
}
