using PatientSystem.BizModels.Interfaces;
using PatientSystem.BizModels.Models;
using PatientSystem.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;


namespace PatientSystem.BizModels.Services
{
    public class DoctorService : IDoctorService
    {
        //PMSEntities
        PatientSystemEntities _db = new PatientSystemEntities();
        /// <summary>
        /// DoctorModel List 
        /// </summary>
        /// <returns></returns>
        public List<DoctorModel> GetDoctorList()
        {
            try
            {
                var rec = (from a in _db.Doctors
                           where a.IsDeleted == false
                           select new DoctorModel
                           {
                               ID = a.ID,
                               DoctorName =a.DoctorName,
                               RegistrationNumber = a.RegistrationNumber,
                               Qualification = a.Qualification,
                               Address = a.Address,
                               PhoneNumber = a.PhoneNumber,
                               Experience = a.Experience
                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        /// <summary>
        /// Doctor Detail 
        /// </summary>
        /// <returns></returns>
        public List<DoctorModel> DoctorListById(Guid ID)
        {
            try
            {
                var rec = (from a in _db.Doctors
                           where a.IsDeleted == false
                           && a.ID== ID
                           select new DoctorModel
                           {
                               ID = a.ID,
                               DoctorName = a.DoctorName,
                               RegistrationNumber = a.RegistrationNumber,
                               Qualification = a.Qualification,
                               Address = a.Address,
                               PhoneNumber = a.PhoneNumber,
                               Experience = a.Experience
                           }).ToList();
                return rec;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public bool InsertUpdateDoctor(DoctorModel mdl)
        {
            bool isUpdate = false;
            try
            {
                if (mdl.ID == Guid.Empty)
                {
                    Doctor doc = new Doctor();
                    doc.ID = Guid.NewGuid();
                    doc.RegistrationNumber = mdl.RegistrationNumber;
                    doc.DoctorName = mdl.DoctorName;
                    doc.Qualification = mdl.Qualification;
                    doc.Address = mdl.Address;
                    doc.IsDeleted = false;
                    doc.PhoneNumber = mdl.PhoneNumber;
                    doc.Experience = mdl.Experience;
                    doc.CreatedBy = 1;
                    doc.CreatedDateTime = DateTime.Now;
                    _db.Doctors.Add(doc);
                    _db.SaveChanges();
                    isUpdate = true;
                }
                else
                {
                    var doc =  _db.Doctors.Where(x=>x.ID== mdl.ID).FirstOrDefault();
                    if (doc != null)
                    {
                        doc.RegistrationNumber = mdl.RegistrationNumber;
                        doc.DoctorName = mdl.DoctorName;
                        doc.Qualification = mdl.Qualification;
                        doc.Address = mdl.Address;
                        doc.IsDeleted = false;
                        doc.PhoneNumber = mdl.PhoneNumber;
                        doc.Experience = mdl.Experience;
                        doc.UpdatedBy = 1;
                        doc.UpdatedDateTime = DateTime.Now;
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

        public bool DeleteDoctor(Guid ID)
        {
            bool isUpdate = false;
            try
            {

                var doc = (from a in _db.Doctors where a.ID == ID select a).FirstOrDefault();
                if (doc != null)
                {
                    doc.IsDeleted = true;
                    doc.UpdatedBy = 1;
                    doc.UpdatedDateTime = DateTime.Now;
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
