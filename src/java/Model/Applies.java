 public class Applies {

        private String tilte;
        private String nameEmployee;
        private String cv;
        private String ApplyId;
        private String status;

        public Applies() {
        }

        public Applies(String tilte, String nameEmployee, String cv, String ApplyId, String status) {
            this.tilte = tilte;
            this.nameEmployee = nameEmployee;
            this.cv = cv;
            this.ApplyId = ApplyId;
            this.status = status;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getApplyId() {
            return ApplyId;
        }

        public void setApplyId(String ApplyId) {
            this.ApplyId = ApplyId;
        }

        public String getTilte() {
            return tilte;
        }

        public void setTilte(String tilte) {
            this.tilte = tilte;
        }

        public String getNameEmployee() {
            return nameEmployee;
        }

        public void setNameEmployee(String nameEmployee) {
            this.nameEmployee = nameEmployee;
        }

        public String getCv() {
            return cv;
        }

        public void setCv(String cv) {
            this.cv = cv;
        }

    }