using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PatientSystem.BizModels.ViewModels
{
    public class LoginModel
    {
        public System.Guid ID { get; set; }
        public string UserID { get; set; }
        public string Password { get; set; }
        public Nullable<bool> IsLocked { get; set; }
        public bool IsDeleted { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedDateTime { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
    }
}