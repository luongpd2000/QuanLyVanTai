import { Component, Inject, NgModule, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CoachTurn } from '../../../data/coach-turn';

@Component({
  selector: 'app-edit-coach-turn',
  templateUrl: './edit-coach-turn.component.html',
  styleUrls: ['./edit-coach-turn.component.scss'],
  providers: [
  ],
})
export class EditCoachTurnComponent implements OnInit {
  @ViewChild('picker') picker: any;

  // dateEnd : any;

  formControl1!: FormGroup;
  constructor(
    public dialogRef: MatDialogRef<EditCoachTurnComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}

  ngOnInit(): void {
    this.makeForm();
    // this.dateEnd = new Date(this.data.coachTurn.endTime);
  }
  makeForm(): void {
    this.formControl1 = new FormGroup({
      id: new FormControl('', Validators.required),
      passengerAmount: new FormControl('', Validators.required),
      ticketPrice: new FormControl('', Validators.required),
      startTime: new FormControl('', Validators.required),
      endTime: new FormControl('', Validators.required),
      // gradeSalary: new FormControl('', Validators.required),
      coach: new FormControl('', Validators.required),
      route: new FormControl('', Validators.required),
      driver: new FormControl('', Validators.required),
      driverAsistant: new FormControl('', Validators.required),
    });
  }

  edit(): void {
    var editData = new CoachTurn();
    Object.assign(editData, this.formControl1.value);

    editData.endTime = editData.endTime + '';
    const words = editData.endTime.split(' (');
    var time = '';
    var date = new Date(words[0]);
    var d = words[0].split(' ');
    time = `${date.getFullYear()}-${
      date.getMonth() + 1 < 10 ? `0${date.getMonth() + 1}` : date.getMonth() + 1
    }-${date.getDate() < 10 ? `0${date.getDate() + 1}` : date.getDate() + 1}T${
      d[4]
    }`;
    console.log(time);
    editData.endTime = time;

    editData.coach = {
      id: this.formControl1.value.coach,
      plate: '',
      model: '',
      manufacturer: '',
      capacity: 0,
      yearsOfUse: 0,
      lastMaintenanceDay: new Date(),
    };

    editData.driver = {
      id: this.formControl1.value.driver,
      name: '',
      idCard: '',
      drivingLicenseCode: '',
      typeOfLicense: '',
      address: '',
      birthday: new Date(),
      experience: 0,
      fixedSalary: 0,
    };

    editData.route = {
      id: this.formControl1.value.route,
      pointOfDeparture: '',
      destination: '',
      length: 0,
      complexity: 0,
    };

    editData.driverAsistant = {
      id: this.formControl1.value.driverAsistant,
      name: '',
      idCard: '',
      drivingLicenseCode: '',
      typeOfLicense: '',
      address: '',
      birthday: new Date(),
      experience: 0,
      fixedSalary: 0,
    };

    this.dialogRef.close(editData);
  }
}
