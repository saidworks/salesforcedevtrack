@isTest 
private class AnimalLocatorTest {
    @isTest
     static void testgetAnimalNameById(){
        Test.setMock( HttpCalloutMock.class, new AnimalLocatorMock());
        String response =  AnimalLocator.getAnimalNameById(5);
        System.debug(response);
        System.assertEquals(response, 'majestic badger');

    }



}