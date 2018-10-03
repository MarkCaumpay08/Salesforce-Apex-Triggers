trigger AccountAddressTrigger on Account (before insert, before update) {
	System.debug('trigger');
	if(Trigger.isBefore){
		if(Trigger.isInsert || Trigger.isUpdate){
			for(Account newAccount:Trigger.new ){
                System.debug(newAccount.BillingPostalCode);
                System.debug(newAccount.Match_Billing_Address__c);
				//Copy the Shipping Postal Code if Billing Postal and Match Billing Address is TRUE
				if(newAccount.BillingPostalCode != '' && newAccount.Match_Billing_Address__c == TRUE){
                    System.debug('TRUE');
					newAccount.ShippingPostalCode = newAccount.BillingPostalCode;
				}
			}
		}
	}
}