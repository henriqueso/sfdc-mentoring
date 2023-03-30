public class CurrentPriceCallout {

    private static final String HOST     = 'https://api.coindesk.com';
    private static final String VERSION  = 'v1';
    private static final String PATH     = 'bpi/currentprice.json';
    private static final String METHOD   = 'GET';
    
    public static CoindeskResources.BitcoinPriceIndexResource getCurrentPrice() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint( getEndpoint() );
        req.setMethod( METHOD );
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

    private static String getEndpoint() {
        return HOST + '/' 
             + VERSION + '/' 
             + PATH;
    }

}