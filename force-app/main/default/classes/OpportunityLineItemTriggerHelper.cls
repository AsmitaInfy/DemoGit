public class OpportunityLineItemTriggerHelper {

    public static void updateRelatedOpportunity(List<OpportunityLineItem> newOppLineItems){
        List<String> oppIds = new List<String>();
        List<String> productIds = new List<String>();
        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        
        for(OpportunityLineItem lineItem : newOppLineItems){
            oppIds.add(lineItem.OpportunityId);
            productIds.add(lineItem.Product2Id);
        }
        Map<Id,Opportunity> idVsRelatedOpp = new Map<Id,Opportunity>([Select id, Type from Opportunity where Id IN: oppIds]);
        Map<Id,Product2> idVsRelatedProduct = new Map<Id,Product2>([SELECT id,Family from product2 where ID IN: productIds]);
        for(OpportunityLineItem lineItem : newOppLineItems){
            if(idVsRelatedProduct.containsKey(lineItem.Product2Id) &&  idVsRelatedProduct.get(lineItem.Product2Id).Family == 'Sponsor'){
                if(idVsRelatedOpp.containsKey(lineItem.OpportunityId)){
                    System.debug('Inside my condition ');
                    idVsRelatedOpp.get(lineItem.OpportunityId).Type = 'Sponsor';
                    oppsToUpdate.add(idVsRelatedOpp.get(lineItem.OpportunityId));
                }
            }
        }
        
        if(oppsToUpdate.size()>0){
            update oppsToUpdate;
        }
    }
}