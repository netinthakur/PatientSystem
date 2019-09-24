using PatientSystem.BizModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Interfaces
{
    public interface IPatientService
    {
        List<PatientModel> GetPatientList();
        List<PatientModel> PatientListById(Guid ID);
        bool InsertUpdatePatient(PatientModel mdl);
        bool DeletePatient(Guid ID);

    }
}
