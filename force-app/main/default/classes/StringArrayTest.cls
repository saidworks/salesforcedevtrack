public with sharing class StringArrayTest {
    public StringArrayTest() {

    }
    // The Apex class must be called StringArrayTest and be in the public scope
    // The Apex class must have a public static method called generateStringArray
    // The generateStringArray method must return a list of strings
    //     The method must accept an incoming Integer as a parameter, which will be used to determine the number of returned strings
    //     The method must return a list of strings. Each element in the list must have the format Test n, where n is the index of the current string in the list. For example, if the input is 3, then the output should be ['Test 0', 'Test 1', 'Test 2']. Remember that in Apex, the index position of the first element in a list is always 0.

    public static List<String> generateStringArray(Integer n){
        List<String> strings = new List<String>();
        for(Integer i = 0;i < n;i++){
            strings.add('Test' + i); 
            System.debug('Test' + i);
        }

        return strings;
    }
}
