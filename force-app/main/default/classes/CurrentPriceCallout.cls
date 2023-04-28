public class CurrentPriceCallout {

    private static final String INTEGRATION_CONFIG = 'BTC_Price';
    
    public static CoindeskResources.BitcoinPriceIndexResource getCurrentPrice() {
        IntegrationConfig config = IntegrationConfig.forName(INTEGRATION_CONFIG);

        HttpRequest req = new HttpRequest();
        req.setEndpoint( getEndpoint(config.host, config.namedCredentials, config.path) );
        req.setMethod( config.method );
        req.setTimeout(config.timeout);
        Http h = new Http();
        HttpResponse res = h.send(req);

        if (res.getStatusCode() == 200) {
            String body = normalize( res.getBody() );
            CoindeskResources.BitcoinPriceIndexResource bpi = (CoindeskResources.BitcoinPriceIndexResource) JSON.deserialize(body, CoindeskResources.BitcoinPriceIndexResource.class);
            return bpi;
        } else {
            return null;
        }
    }

    private static String normalize(String body) {
        return body.replaceAll('"time"', '"updatetime"');
    }

    private static String getEndpoint(String host, String namedCredentials, String path) {
        return ((namedCredentials != null )? 'callout:' + namedCredentials : host) +  path;
    }

}