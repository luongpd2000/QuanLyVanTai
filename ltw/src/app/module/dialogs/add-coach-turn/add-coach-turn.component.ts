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
    @Inject(MAT_DIALOG_DATA) public data: CoachTurn
  ) { }

  ngOnInit(): void {
    this.makeForm();
  }
  makeForm():void{
    this.formControl = new FormGroup({
      "passengerAmount": new FormControl('', Validators.required),
      "ticketPrice": new FormControl('', Validators.required),
      "startTime": new FormControl('', Validators.required),
      "endTime": new FormControl('', Validators.required),
      "gradeSalary": new FormControl('', Validators.required),
      "coachId": new FormControl('', Validators.required),
      "routeId": new FormControl('', Validators.required),
      "driverId": new FormControl('', Validators.required),
      "driverAsistantId": new FormControl('', Validators.required),
    })
  }
  save(): void {
    this.dialogRef.close(Object.assign(new CoachTurn(), this.formControl.value));
  }

}
