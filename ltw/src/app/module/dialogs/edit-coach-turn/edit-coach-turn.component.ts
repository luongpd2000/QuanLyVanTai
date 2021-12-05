import {Component, Inject, NgModule, OnInit, ViewChild} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CoachTurn } from '../../../data/coach-turn';
import {MatDatepickerModule} from "@angular/material/datepicker";
import {MAT_MOMENT_DATE_ADAPTER_OPTIONS, MatMomentDateModule} from "@angular/material-moment-adapter";
import {NgxMatDatetimePicker} from "@angular-material-components/datetime-picker";

@Component({
  selector: 'app-edit-coach-turn',
  templateUrl: './edit-coach-turn.component.html',
  styleUrls: ['./edit-coach-turn.component.scss'],
})
export class EditCoachTurnComponent implements OnInit {
  @ViewChild('picker') picker: any;

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
      // gradeSalary: new FormControl('', Validators.required),
      coach: new FormControl('', Validators.required),
      route: new FormControl('', Validators.required),
      driver: new FormControl('', Validators.required),
      driverAsistant: new FormControl('', Validators.required),
    });
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
    var sTime = date.toLocaleTimeString();
    if(date.getHours() < 10){
      sTime ='0'+sTime;
    }
    var s = year + '-' + sMonth + '-' + sDay + 'T' + sTime;
    s= s.slice(0,-3)
    return s;
  }
  edit(): void {
    var editData = new CoachTurn();
    Object.assign(editData, this.formControl.value);

    editData.startTime = this.getFormattedDate(editData.startTime);
    editData.endTime = this.getFormattedDate(editData.endTime);

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
