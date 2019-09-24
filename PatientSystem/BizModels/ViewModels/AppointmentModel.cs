using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Models
{
    public class AppointmentModel
    {
        public System.Guid ID { get; set; }
        public System.Guid PatientID { get; set; }
        public System.Guid DoctorID { get; set; }
        public string Timing { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDateTime { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public System.DateTime AppointmentDate { get; set; }
        public string DoctorName { get; set; }
        public string PatientName { get; set; }

    }
}
