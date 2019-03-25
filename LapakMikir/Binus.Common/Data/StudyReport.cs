using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Binus.Common.Data
{
    public class StudyReport
    {
        private string _historyID;
        private string _courseID;
        private string _courseName;
        private int _score;
        private string _exerciseDate;
        private string _status;

        public string Report_HistoryID
        {
            get { return _historyID; }
            set { _historyID = value; }
        }
    }
}
