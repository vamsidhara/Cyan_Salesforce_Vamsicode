@isTest
private class CurrencyToWords_test {
    @isTest static void currencyToWrds () {
        List<Project__c> prlist = new List<Project__c >();
        Project__c p = new Project__c(name='test1',LoanAmount__c=0);
        prlist.add(p);
        Project__c p1 = new Project__c(name='test2',LoanAmount__c=1);
        prlist.add(p1);
        Project__c p2 = new Project__c(name='test3',LoanAmount__c=1200.1);
        prlist.add(p2);
        Project__c p3 = new Project__c(name='test4',LoanAmount__c=1200.20);
        prlist.add(p3);
        Project__c p4 = new Project__c(name='test5');
        prlist.add(p4);
        Test.startTest();
        insert prlist;
        Test.stopTest();
        for(Project__c pr : [Select Id,name,LoanAmount__c,CurrencyInWords__c  from Project__c]){
            if(pr.name=='test1')
            System.assertEquals(p.CurrencyInWords__c,'Zero');
            if(pr.name=='test5')
            System.assertEquals(p.CurrencyInWords__c,null);
        }
     }
    
}