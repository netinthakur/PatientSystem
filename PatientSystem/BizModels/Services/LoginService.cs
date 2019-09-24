using PatientSystem.BizModels.ViewModels;
using PatientSystem.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PatientSystem.BizModels.Services
{
    public class LoginService
    {
        //PMSEntitiess
        PatientSystemEntities _db = new PatientSystemEntities();
        public bool ValidateCredentials(LoginModel model)
        {
            var rec = (from a in _db.Logins
                       where a.UserID == model.UserID
                       && a.Password == model.Password
                       select a).Count() > 0 ? true : false;
            if (rec)
                return true;
            else
                return false;
        }
    }
}