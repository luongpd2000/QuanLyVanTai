import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Route } from 'src/app/data/route';
import { RouteService } from 'src/app/service/route.service';

@Component({
  selector: 'app-add-route',
  templateUrl: './add-route.component.html',
  styleUrls: ['./add-route.component.scss'],
})
export class AddRouteComponent implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<AddRouteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Route
  ) {}

  ngOnInit(): void {}
  formControl = new FormGroup({
    "id":  new FormControl('', Validators.required),
      "firstName": new FormControl('', Validators.required),
      "age": new FormControl('', Validators.required),
      "job": new FormControl('', Validators.required),
  });

  getErrorMessage() {
    return this.formControl.hasError('required')
      ? 'Required field'
      : this.formControl.hasError('email')
      ? 'Not a valid email'
      : '';
  }

  submit() {
    // emppty stuff
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  public confirmAdd(): void {
    this.dialogRef.close(Object.assign(new Route(), this.formControl.value));
  }

  public save(): void {
    // this.dialogRef.close(Object.assign(new Route(), this.formControl.value));
  }
}
