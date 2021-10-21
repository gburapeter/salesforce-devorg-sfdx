/**
 * Created by pbura on 10/20/2021.
 */

import { LightningElement, wire, api, track} from 'lwc';
import {createRecord, getRecord} from 'lightning/uiRecordApi'
import age from '@salesforce/schema/Questionare__c.Age__c'
import comments from '@salesforce/schema/Questionare__c.Comments__c'
import score from '@salesforce/schema/Questionare__c.Score__c'
import tellUsWhy from '@salesforce/schema/Questionare__c.Tell_Us_Why__c'
import wasUserParticipant from '@salesforce/schema/Questionare__c.Was_User_Participant__c'
import webinar from '@salesforce/schema/Questionare__.Webinar__c.id'
import recommend from '@salesforce/schema/Questionare__c.Would_you_recommend_this_Webinar__c'

import USER_ID from '@salesforce/user/Id'
import NAME_FIELD from '@salesforce/schema/User.Name'
export default class CreateQuestionare extends LightningElement {

    age='';
    comments='';
    score='';
    tellUsWhy='';
    wasUserParticipant='';
    recommend='';
    webinar='';


    /*@wire(getRecord, {recordId: userId, fields: "Name"})
    title;*/

    @track title;
    @wire(getRecord, {
        recordId: USER_ID,
        fields: [NAME_FIELD]
    }) wireuser({
        data
    }) {
        if (data) {
            this.title ="Hi " + data.fields.Name.value + "! Share your feedback with us!";
        }
    }


    webinarChangeVal(event){
        if(event.target.label ='Attended Webinar'){
            this.wasUserParticipant=event.target.value;
        }
        if(event.target.label ='Age'){
                    this.wasUserParticipant=event.target.value;
                }
                if(event.target.label ='Score'){
                            this.score=event.target.value;
                        }
                        if(event.target.label ='Feedback'){
                                    this.comments=event.target.value;
                                }
                                if(event.target.label ='Would you recommend'){
                                            this.recommend=event.target.value;
                                        }
                                        if(event.target.label ='Tell us why'){
                                                    this.tellUsWhy=event.target.value;
                                                }
                                                if(event.target.label ='webinar'){
                                                            this.webinar=event.target.value;
                                                        }


    }

    handleNameChange(){

    }

    insertQuestionareAction(){
        const fields={};

    }



}