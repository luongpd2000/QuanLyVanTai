import {Component, Inject, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {CoachTurn} from "../../../data/coach-turn";

@Component({
  selector: 'app-edit-coach-turn',
  templateUrl: './edit-coach-turn.component.html',
  styleUrls: ['./edit-coach-turn.component.scss']
})
export class EditCoachTurnComponent implements OnInit {
  formControl!: FormGroup;
  constructor(
    public dialogRef: MatDialogRef<EditCoachTurnComponent>,
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
  edit(): void {
    this.dialogRef.close(Object.assign(new CoachTurn(), this.formControl.value));
  }

}
