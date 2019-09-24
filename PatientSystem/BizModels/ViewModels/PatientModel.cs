using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Models
{
   public class PatientModel
    {
        public System.Guid ID { get; set; }
        public string RegistrationNumber { get; set; }
        public string PatientName { get; set; }
        public string FatherName { get; set; }
        public int Age { get; set; }
        public string Address { get; set; }
        public string HealthIssue { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDateTime { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
    }
}
