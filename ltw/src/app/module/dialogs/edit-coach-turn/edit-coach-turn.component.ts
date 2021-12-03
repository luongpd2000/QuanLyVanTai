import {Component, Inject, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {CoachTurn} from "../../../data/coach-turn";
import {Route} from "../../../data/route";
import {Coach} from "../../../data/coach";

@Component({
  selector: 'app-edit-coach-turn',
  templateUrl: './edit-coach-turn.component.html',
  styleUrls: ['./edit-coach-turn.component.scss']
})
export class EditCoachTurnComponent implements OnInit {
  formControl!: FormGroup;
  constructor(
    public dialogRef: MatDialogRef<EditCoachTurnComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    // @Inject(MAT_DIALOG_DATA) public data: CoachTurn,
    // @Inject(MAT_DIALOG_DATA) public routeData: Route[],
    // @Inject(MAT_DIALOG_DATA) public coachData: Coach[],
    // @Inject(MAT_DIALOG_DATA) public driverData: Driver[]
  ) { }

  ngOnInit(): void {
    this.makeForm();
  }
  makeForm():void{
    this.formControl = new FormGroup({
      "id":  new FormControl('',Validators.required),
      "passengerAmount": new FormControl('', Validators.required),
      "ticketPrice": new FormControl('', Validators.required),
      "startTime": new FormControl('', Validators.required),
      "endTime": new FormControl('', Validators.required),
      "gradeSalary": new FormControl('', Validators.required),
      "coach": new FormControl('', Validators.required),
      "route": new FormControl('', Validators.required),
      "driver": new FormControl('', Validators.required),
      "driverAsistant": new FormControl('', Validators.required),
    })
  }
  edit(): void {
    this.dialogRef.close(Object.assign(new CoachTurn(), this.formControl.value));
  }

}
