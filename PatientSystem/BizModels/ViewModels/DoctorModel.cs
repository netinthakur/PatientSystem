using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Models
{
    public class DoctorModel 
    {

        public System.Guid ID { get; set; }
        public string RegistrationNumber { get; set; }
        public string DoctorName { get; set; }
        public string Qualification { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Experience { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDateTime { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
    }
}
