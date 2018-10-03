trigger AccountAddressTrigger on Account (before insert, before update) {
	 
	if(Trigger.isBefore){
		if(Trigger.isInsert || Trigger.isUpdate){
			for(Account newAccount:Trigger.new ){
                System.debug('BillingPostalCode  '+ newAccount.BillingPostalCode);
                System.debug('Match_Billing_Address__c  '+ newAccount.Match_Billing_Address__c);
				//Copy the Shipping Postal Code if Billing Postal and Match Billing Address is TRUE
				if(newAccount.BillingPostalCode != '' && newAccount.Match_Billing_Address__c == TRUE){
                    System.debug('TRUE');
					newAccount.ShippingPostalCode = newAccount.BillingPostalCode;
				}
			}
		}
	}
}