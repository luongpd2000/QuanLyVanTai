<<<<<<< HEAD
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Driver } from 'src/app/data/driver';
=======
import { Component, OnInit } from '@angular/core';
>>>>>>> 9a2d39a40a8f3a40846738516ff4c000a27bfbba

@Component({
  selector: 'app-edit-driver',
  templateUrl: './edit-driver.component.html',
<<<<<<< HEAD
  styleUrls: ['./edit-driver.component.scss'],
})
export class EditDriverComponent implements OnInit {
  formControl!: FormGroup ;
  constructor(
    public dialogRef: MatDialogRef<EditDriverComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Driver
  ) {}

  ngOnInit(): void {

    this.makeForm();
    // this.formControl.setValue(this.data);
  }

makeForm(){
    this.formControl = new FormGroup({
      "id":  new FormControl('',Validators.required),
      "name":  new FormControl('',Validators.required),
      "idCard": new FormControl('',Validators.required),
      "drivingLicenseCode": new FormControl('',Validators.required),
      "typeOfLicense": new FormControl('',Validators.required),
      "address": new FormControl('',Validators.required),
      "birthday": new FormControl('',Validators.required),
      "experience": new FormControl('',Validators.required),
      "fixedSalary": new FormControl(''),
  });
}


  edit(): void {
    // console.log(this.formControl.value);
    this.dialogRef.close(Object.assign(new Driver(), this.formControl.value));
  }
=======
  styleUrls: ['./edit-driver.component.scss']
})
export class EditDriverComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

>>>>>>> 9a2d39a40a8f3a40846738516ff4c000a27bfbba
}
