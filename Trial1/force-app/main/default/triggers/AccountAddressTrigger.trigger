trigger AccountAddressTrigger on Account (before insert, before update) {
	 
	if(Trigger.isBefore){
		if(Trigger.isInsert || Trigger.isUpdate){
			for(Account newAccount:Trigger.new ){
				//Copy the Shipping Postal Code if Billing Postal and Match Billing Address is TRUE
				if(newAccount.BillingPostalCode != null && newAccount.Match_Billing_Address__c == TRUE){
					newAccount.BillingPostalCode = newAccount.ShippingPostalCode;
				}
			}
		}
	}
}