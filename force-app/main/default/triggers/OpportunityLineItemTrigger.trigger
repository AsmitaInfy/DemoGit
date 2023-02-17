trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert) {
	OpportunityLineItemTriggerHelper.updateRelatedOpportunity(Trigger.new);
}