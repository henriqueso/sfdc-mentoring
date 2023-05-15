@isTest
public class ReqResHttpMock implements HttpCalloutMock {

    public HTTPResponse respond(HTTPRequest req) {
        
        // Optionally, only send a mock response for a specific endpoint and method.
        System.assertEquals('GET', req.getMethod(), 'HTTP method is not correct');
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody( RESPONSE_BODY );
        res.setStatusCode(200);

        return res;
    }

    private static final String RESPONSE_BODY = 
    '{' +
    '   "data": {' +
    '       "id": 2,' +
    '       "email": "janet.weaver@reqres.in",' +
    '       "first_name": "Janet",' +
    '       "last_name": "Weaver",' +
    '       "avatar": "https://reqres.in/img/faces/2-image.jpg"' +
    '   },' +
    '   "support": {' +
    '       "url": "https://reqres.in/#support-heading",' +
    '       "text": "To keep ReqRes free, contributions towards server costs are appreciated!"' +
    '   }' +
    '}';

}