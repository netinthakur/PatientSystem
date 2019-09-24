using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PatientSystem.BizModels.Interfaces;
using PatientSystem.DataModels;
using PatientSystem.BizModels.Models;

namespace PatientSystem.BizModels.Services
{
    public class AppointmentService : IAppointmentService
    {
        //PMSEntitiess
        PatientSystemEntities _db = new PatientSystemEntities();
        /// <summary>
        /// Appointment  List 
        /// </summary>
        /// <returns></returns>
        public List<AppointmentModel> GetAppointmentList()
        {
            try
            {
                var rec = (from a in _db.PatientTimings
                           join b in _db.Doctors on a.DoctorID equals b.ID
                           join c in _db.Patients on a.PatientID equals c.ID
                           where a.IsDeleted == false
                           select new AppointmentModel
                           {
                               ID = a.ID,
                               DoctorName = b.DoctorName,
                               PatientName = c.PatientName,
                               Timing = a.Timing,
                               AppointmentDate = a.AppointmentDate,
                               PatientID = a.PatientID,
                               DoctorID = a.DoctorID,
                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public List<AppointmentModel> GetAppointmentListByID(Guid ID)
        {
            try
            {
                var rec = (from a in _db.PatientTimings
                           join b in _db.Doctors on a.DoctorID equals b.ID
                           join c in _db.Patients on a.PatientID equals c.ID
                           where a.IsDeleted == false
                           select new AppointmentModel
                           {
                               ID = a.ID,
                               DoctorName = b.DoctorName,
                               PatientName = c.PatientName,
                               Timing = a.Timing,
                               AppointmentDate = a.AppointmentDate,
                               PatientID = a.PatientID,
                               DoctorID = a.DoctorID,
                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public bool InsertUpdateAppointmentMaster(AppointmentModel mdl)
        {
            bool isUpdate = false;
            try
            {
                if (mdl.ID == Guid.Empty)
                {
                    PatientTiming _test = new PatientTiming();
                    _test.ID = Guid.NewGuid();
                    _test.PatientID = mdl.PatientID;
                    _test.DoctorID = mdl.DoctorID;
                    _test.Timing = mdl.Timing;
                    _test.AppointmentDate = mdl.AppointmentDate;
                    _test.IsDeleted = false;
                    _test.CreatedBy = 1;
                    _test.CreatedDateTime = DateTime.Now;
                    _db.PatientTimings.Add(_test);
                    _db.SaveChanges();
                    isUpdate = true;
                }
                else
                {
                    var _test = (from a in _db.PatientTimings where a.ID == mdl.ID select a).FirstOrDefault();
                    if (_test != null)
                    {
                        _test.PatientID = mdl.PatientID;
                        _test.DoctorID = mdl.DoctorID;
                        _test.Timing = mdl.Timing;
                        _test.AppointmentDate = mdl.AppointmentDate;
                        _test.IsDeleted = false;
                        _test.UpdatedBy = 1;
                        _test.UpdatedDateTime = DateTime.Now;
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

        public bool DeleteAppointment(Guid ID)
        {
            bool isUpdate = false;
            try
            {

                var _batch = (from a in _db.PatientTimings where a.ID == ID select a).FirstOrDefault();
                if (_batch != null)
                {
                    _batch.IsDeleted = true;
                    _batch.UpdatedBy = 1;
                    _batch.UpdatedDateTime = DateTime.Now;
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
