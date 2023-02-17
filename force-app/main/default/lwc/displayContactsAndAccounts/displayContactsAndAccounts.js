import { LightningElement } from 'lwc';
import getAccountContactDataJs from '@salesforce/apex/GetAccountContactDataController.getAccountContactData';

const columns = [
    {label : 'Account Name', fieldName: 'accountName'},{label : 'Contact Name', fieldName: 'contactName'}];

export default class DisplayContactsAndAccounts extends LightningElement {

   columns = columns;
   data = [];
   isDataPresent = false;
   connectedCallback(){
    getAccountContactDataJs().then( data => {
        console.log(' === '+ data);
        if(data.length<0){
            this.isDataPresent = true;
            this.data = data;
            console.log('hahah');
        }else{
            this.false = true;
        }
    }).catch(error =>{
        console.log('An error occurred :' + JSON.stringify(error));
        console.log('hello world');
    });
   }
}