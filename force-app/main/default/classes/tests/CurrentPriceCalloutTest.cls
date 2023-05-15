@isTest
private class CurrentPriceCalloutTest {
    
    @isTest static void getCurrentPriceTest() {

        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new BitcoinHttpMock() );

        // Call method to test.
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        CoindeskResources.BitcoinPriceIndexResource resp = CurrentPriceCallout.getCurrentPrice();

        // Verify response received contains fake values
        System.assertEquals(
            'Mar 10, 2023 20:53:00 UTC', 
            resp.updatetime.updated, 
            'Mar 10, 2023 20:53:00 UTC is expected as updatetime'
        );
        System.assertEquals(
            10, 
            resp.updatetime.updatedISO.day(), 
            '10 is expecteed as updatedISO day'
        );
        System.assertEquals(
            3, 
            resp.updatetime.updatedISO.month(), 
            '3 is expecteed as updatedISO month'
        );
        System.assertEquals(
            2023, 
            resp.updatetime.updatedISO.year(), 
            '2023 is expecteed as updatedISO day'
        );
        System.assertEquals(
            'Bitcoin', 
            resp.chartName, 
            'Bitcoin is expected as chartName'
        );
        System.assertEquals(
            'USD', 
            resp.bpi.USD.code, 
            'USD is expected as code'
        );
        System.assertEquals(
            'United States Dollar', 
            resp.bpi.USD.description, 
            'United States Dollar is expected as description'
        );

    }
}
