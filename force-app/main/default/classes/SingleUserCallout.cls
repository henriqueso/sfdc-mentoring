public class SingleUserCallout {

    private static final String INTEGRATION_CONFIG = 'ReqRes_Single_User';

    public static ReqResResources.UserEntity getSingleUser(String usrId) {
        IntegrationConfig config = IntegrationConfig.forName(INTEGRATION_CONFIG);

        HttpRequest req = new HttpRequest();
        req.setEndpoint( getEndpoint(config.host, config.namedCredentials, config.path) + usrId );
        req.setMethod( config.method );
        req.setTimeout(config.timeout);
        Http h = new Http();
        HttpResponse res = h.send(req);

        if (res.getStatusCode() == 200) {
            String body = res.getBody();
            ReqResResources.UserEntity usr = (ReqResResources.UserEntity) JSON.deserialize(body, ReqResResources.UserEntity.class);
            return usr;
        } else {
            return null;
        }
    }

    private static String getEndpoint(String host, String namedCredentials, String path) {
        return ((namedCredentials != null )? 'callout:' + namedCredentials : host) + path;
    }
}