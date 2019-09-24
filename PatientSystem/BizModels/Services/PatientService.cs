using PatientSystem.BizModels.Interfaces;
using PatientSystem.BizModels.Models;
using PatientSystem.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PatientSystem.BizModels.Services
{
    public class PatientService : IPatientService
    {
        //PatientSystem
        PatientSystemEntities _db = new PatientSystemEntities();
        /// <summary>
        /// Patient List 
        /// </summary>
        /// <returns></returns>
        public List<PatientModel> GetPatientList()
        {
            try
            {
                var rec = (from x in _db.Patients
                           where x.IsDeleted == false
                           select new PatientModel
                           {
                               ID = x.ID,
                               PatientName = x.PatientName,
                               FatherName = x.FatherName,
                               RegistrationNumber = x.RegistrationNumber,
                               Age = x.Age,
                               Address = x.Address,
                               HealthIssue = x.HealthIssue,
                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        /// <summary>
        /// Patient Details 
        /// </summary>
        /// <returns></returns>
        public List<PatientModel> PatientListById(Guid ID)
        {
            try
            {
                var rec = (from x in _db.Patients
                           where x.IsDeleted == false
                           && x.ID == ID
                           select new PatientModel
                           {
                               ID = x.ID,
                               PatientName = x.PatientName,
                               FatherName = x.FatherName,
                               RegistrationNumber = x.RegistrationNumber,
                               Age = x.Age,
                               Address = x.Address,
                               HealthIssue = x.HealthIssue,

                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public bool InsertUpdatePatient(PatientModel mdl)
        {
            bool isUpdate = false;
            try
            {
                if (mdl.ID == Guid.Empty)
                {
                    Patient patient = new Patient();
                    patient.ID = Guid.NewGuid();
                    patient.PatientName = mdl.PatientName;
                    patient.RegistrationNumber = mdl.RegistrationNumber;
                    patient.FatherName = mdl.FatherName;
                    patient.Age = mdl.Age;
                    patient.IsDeleted = false;
                    patient.Address = mdl.Address;
                    patient.HealthIssue = mdl.HealthIssue;
                    patient.CreatedBy = 1;
                    patient.CreatedDateTime = DateTime.Now;
                    _db.Patients.Add(patient);
                    _db.SaveChanges();
                    isUpdate = true;
                }
                else
                {
                    var patient = (from a in _db.Patients where a.ID == mdl.ID select a).FirstOrDefault();
                    if (patient != null)
                    {
                        patient.PatientName = mdl.PatientName;
                        patient.RegistrationNumber = mdl.RegistrationNumber;
                        patient.FatherName = mdl.FatherName;
                        patient.Age = mdl.Age;
                        patient.IsDeleted = false;
                        patient.Address = mdl.Address;
                        patient.HealthIssue = mdl.HealthIssue;
                        patient.CreatedBy = 1;
                        patient.CreatedDateTime = DateTime.Now;
                        _db.SaveChanges();
                        isUpdate = true;
                    }

                }
            }
            catch (Exception ex)
            {

            }
            return isUpdate;

        }

        public bool DeletePatient(Guid ID)
        {
            bool isUpdate = false;
            try
            {

                var patient = (from a in _db.Patients where a.ID == ID select a).FirstOrDefault();
                if (patient != null)
                {
                    patient.IsDeleted = true;
                    patient.UpdatedBy = 1;
                    patient.UpdatedDateTime = DateTime.Now;
                    _db.SaveChanges();
                    isUpdate = true;
                }

            }

            catch (Exception ex)
            {

            }
            return isUpdate;

        }


    }
}
