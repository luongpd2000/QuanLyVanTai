import {Component, Inject, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validator, Validators} from "@angular/forms";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {CoachTurn} from "../../../data/coach-turn";

@Component({
  selector: 'app-add-coach-turn',
  templateUrl: './add-coach-turn.component.html',
  styleUrls: ['./add-coach-turn.component.scss']
})
export class AddCoachTurnComponent implements OnInit {

  formControl!: FormGroup;
  constructor(
    public dialogRef: MatDialogRef<AddCoachTurnComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }

  ngOnInit(): void {
    this.makeForm();
  }
  makeForm():void{
    this.formControl = new FormGroup({
      // "id":  new FormControl('',Validators.required),
      "passengerAmount": new FormControl('', Validators.required),
      "ticketPrice": new FormControl('', Validators.required),
      "startTime": new FormControl('', Validators.required),
      "endTime": new FormControl('', Validators.required),
      // "gradeSalary": new FormControl('', Validators.required),
      "coach": new FormControl('', Validators.required),
      "route": new FormControl('', Validators.required),
      "driver": new FormControl('', Validators.required),
      "driverAsistant": new FormControl('', Validators.required),
    })
  }

  getFormattedDate(date: any) {
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear().toString();
    var sDay = day.toString();
    var sMonth = month.toString();
    if (day < 10){
      sDay = '0' +sDay;
    }
    if(month <10){
      sMonth = '0' + sMonth;
    }
    var s = year + '-' + sMonth + '-' + sDay + 'T' + date.toLocaleTimeString();
    s= s.slice(0,-3)
    return s;
  }

  save(): void {
    var editData = new CoachTurn();
    Object.assign(editData, this.formControl.value);
    editData.startTime = this.getFormattedDate(editData.startTime);
    editData.endTime = this.getFormattedDate(editData.endTime);
    this.dialogRef.close(editData);

    // this.dialogRef.close(Object.assign(new CoachTurn(), this.formControl.value));

  }

}
