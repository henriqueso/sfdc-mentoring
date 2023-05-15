@isTest
public class SingleUserCalloutTest {
    @isTest static void getSingleUserTest() {

        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ReqResHttpMock() );

        // Call method to test.
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        ReqResResources.UserEntity usr = SingleUserCallout.getSingleUser('2');

        // Verify response received contains fake values
        System.assertEquals(
            2, 
            usr.data.id, 
            'Id is expected as 2'
        );
        System.assertEquals(
            'janet.weaver@reqres.in', 
            usr.data.email, 
            'janet.weaver@reqres.in is expected as email'
        );
        System.assertEquals(
            'Janet', 
            usr.data.first_name, 
            'Janet is expected as first_name'
        );
        System.assertEquals(
            'Weaver', 
            usr.data.last_name, 
            'Weaver is expected as last_name'
        );
        System.assertEquals(
            'https://reqres.in/img/faces/2-image.jpg', 
            usr.data.avatar, 
            'https://reqres.in/img/faces/2-image.jpg is expected as avatar'
        );
        System.assertEquals(
            'https://reqres.in/#support-heading', 
            usr.support.url, 
            'https://reqres.in/#support-heading is expected as url'
        );
        System.assertEquals(
            'To keep ReqRes free, contributions towards server costs are appreciated!', 
            usr.support.text, 
            'To keep ReqRes free, contributions towards server costs are appreciated! is expected as text'
        );

    }
}