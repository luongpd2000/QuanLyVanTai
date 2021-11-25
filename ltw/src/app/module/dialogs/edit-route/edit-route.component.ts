import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Route } from 'src/app/data/route';

@Component({
  selector: 'app-edit-route',
  templateUrl: './edit-route.component.html',
  styleUrls: ['./edit-route.component.scss'],
})
export class EditRouteComponent implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<EditRouteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Route
  ) {}

  ngOnInit(): void {

  }

  formControl = new FormControl('', [
    Validators.required,
    // Validators.email,
  ]);

  getErrorMessage() {
    return this.formControl.hasError('required')
      ? 'Required field'
      : this.formControl.hasError('email')
      ? 'Not a valid email'
      : '';
  }


  edit(): void {
    this.dialogRef.close(Object.assign(new Route(), this.formControl.value));
  }
}
