import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CoachTurn } from '../../../data/coach-turn';
import { Route } from '../../../data/route';
import { Coach } from '../../../data/coach';

@Component({
  selector: 'app-edit-coach-turn',
  templateUrl: './edit-coach-turn.component.html',
  styleUrls: ['./edit-coach-turn.component.scss'],
})
export class EditCoachTurnComponent implements OnInit {
  formControl!: FormGroup;
  constructor(
    public dialogRef: MatDialogRef<EditCoachTurnComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}

  ngOnInit(): void {
    this.makeForm();
  }
  makeForm(): void {
    this.formControl = new FormGroup({
      id: new FormControl('', Validators.required),
      passengerAmount: new FormControl('', Validators.required),
      ticketPrice: new FormControl('', Validators.required),
      startTime: new FormControl('', Validators.required),
      endTime: new FormControl('', Validators.required),
      gradeSalary: new FormControl('', Validators.required),
      coach: new FormControl('', Validators.required),
      route: new FormControl('', Validators.required),
      driver: new FormControl('', Validators.required),
      driverAsistant: new FormControl('', Validators.required),
    });
  }
  edit(): void {
    var editData = new CoachTurn();
    Object.assign(editData, this.formControl.value);

    editData.coach = {
      id: this.formControl.value.coach,
      plate: '',
      model: '',
      manufacturer: '',
      capacity: 0,
      yearsOfUse: 0,
      lastMaintenanceDay: new Date(),
    };

    editData.driver = {
      id: this.formControl.value.driver,
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
      id: this.formControl.value.route,
      pointOfDeparture: '',
      destination: '',
      length: 0,
      complexity: 0,
    };

    editData.driverAsistant = {
      id: this.formControl.value.driverAsistant,
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
