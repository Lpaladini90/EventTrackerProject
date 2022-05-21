export class Hunttrip {


id:number;
name: string;
description: string;
startDate: string;
endDate: string;
success: boolean;

constructor(
  id:number = 0,
name: string = "",
description: string = "",
startDate: string = "",
endDate: string = "",
success: boolean = false
){

this.id = id;
this.name = name;
this.description = description;
this.startDate = startDate;
this.endDate = endDate;
this.success = success;
}


}
