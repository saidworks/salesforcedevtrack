@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":5,"name":"majestic badger","eats":"carrots","says":"cobo"}}');
        response.setStatusCode(200);
        return response;
    }
}