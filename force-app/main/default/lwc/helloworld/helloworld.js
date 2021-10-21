/**
 * Created by pbura on 10/21/2021.
 */

import { LightningElement } from 'lwc';

export default class Helloworld extends LightningElement {
searchGoogle(){
    window.open('http://google.com/');
    console.log("successs");
}
}