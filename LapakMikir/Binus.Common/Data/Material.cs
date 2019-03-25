using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Binus.Common.Data
{
    public class Material
    {
        private string _materialID;
        private string _materialName;
        private string _materialDescription;
        private string _dataUploaded;
        private byte[] _materialFile;

        public string materialID
        {
            get { return _materialID; }
            set { _materialID = value; }
        }
        public string materialName
        {
            get { return _materialName; }
            set { _materialName = value; }
        }
        public string materialDescription
        {
            get { return _materialDescription; }
            set { _materialDescription = value; }
        }
        public string dataUploaded
        {
            get { return _dataUploaded; }
            set { _dataUploaded = value; }
        }
        public byte[] materialFile
        {
            get { return _materialFile; }
            set { _materialFile = value; }
        }
    }
}
