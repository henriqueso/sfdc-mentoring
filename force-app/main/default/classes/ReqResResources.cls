public class ReqResResources {

    public class ListUserEntity {
        public Integer page {get; set;}
        public Integer per_page {get; set;}
        public Integer total {get; set;}
        public Integer total_pages {get; set;}
        public List<UserDataEntity> data {get; set;}
        public SupportEntity support {get; set;}
    }

    public class UserEntity {
        public UserDataEntity data {get; set;}
        public SupportEntity support {get; set;}
    }
    
    public class UserDataEntity {
        public Integer id {get; set;}
        public String email {get; set;}
        public String first_name {get; set;}
        public String last_name {get; set;}
        public String avatar {get; set;}
    }

    public class SupportEntity {
        public String url {get; set;}
        public String text {get; set;}
    }
}