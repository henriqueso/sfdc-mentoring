@isTest
public class BitcoinHttpMock implements HttpCalloutMock {

    public HTTPResponse respond(HTTPRequest req) {
        
        // Optionally, only send a mock response for a specific endpoint and method.
        System.assertEquals('https://api.coindesk.com/v1/bpi/currentprice.json', req.getEndpoint(), 'Endpoint is not correct');
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
        '    "time": {' +
        '       "updated"   : "Mar 10, 2023 20:53:00 UTC",' +
        '       "updatedISO": "2023-03-10T20:53:00+00:00",' +
        '       "updateduk" : "Mar 10, 2023 at 20:53 GMT"' +
        '    },' +
        '    "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",' +
        '    "chartName": "Bitcoin",' +
        '    "bpi": {' +
        '       "USD": {' +
        '           "code": "USD",' +
        '           "symbol": "&#36;",' +
        '           "rate": "19,999.2762",' +
        '           "description": "United States Dollar",' +
        '           "rate_float": 19999.2762' +
        '      },' +
        '      "GBP": {' +
        '           "code": "GBP",' +
        '           "symbol": "&pound;",' +
        '           "rate": "16,711.2352",' +
        '           "description": "British Pound Sterling",' +
        '           "rate_float": 16711.2352' +
        '      },' +
        '      "EUR": {' +
        '           "code": "EUR",' +
        '           "symbol": "&euro;",' +
        '           "rate": "19,482.2149",' +
        '           "description": "Euro",' +
        '           "rate_float": 19482.2149'+
        '      }' +
        '    }' +
        '}';
    
}