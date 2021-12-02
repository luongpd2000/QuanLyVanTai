import { Component, OnInit, ViewChild } from '@angular/core';
<<<<<<< HEAD
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Driver } from 'src/app/data/driver';
import { DriverService } from 'src/app/service/driver.service';
import { AddDriverComponent } from '../dialogs/add-driver/add-driver.component';
import {
  ConfirmDialogComponent,
  ConfirmDialogModel,
} from '../dialogs/confirm-dialog/confirm-dialog.component';
import { EditDriverComponent } from '../dialogs/edit-driver/edit-driver.component';
=======
import { FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';
>>>>>>> 9a2d39a40a8f3a40846738516ff4c000a27bfbba

@Component({
  selector: 'app-driver',
  templateUrl: './driver.component.html',
  styleUrls: ['./driver.component.scss'],
})
export class DriverComponent implements OnInit {
  resultComfirm: string = '';
  formSearch!: FormGroup;
<<<<<<< HEAD
=======

  displayedColumns: string[] = [
    'no',
    'id',
    'pointOfDeparture',
    'destination',
    'length',
    'complexityId',
    'action',
  ];
  dataSource = new MatTableDataSource<Route>();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
>>>>>>> 9a2d39a40a8f3a40846738516ff4c000a27bfbba

  driverList: Driver[] = [];

  displayedColumns: string[] = [
    'no',
    'id',
    'name',
    'idCard',
    'drivingLicenseCode',
    'typeOfLicense',
    'address',
    'birthday',
    'experience',
    'fixedSalaryId',
    'action',
  ];
  dataSource = new MatTableDataSource<Driver>();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }

  constructor(
    private driverService: DriverService,
    public dialog: MatDialog,
    private _snackBar: MatSnackBar,
    private formBuilder: FormBuilder
  ) {}

  ngOnInit(): void {
    this.getAll();
    this.makeSearchForm();
  }

  makeSearchForm() {
    this.formSearch = new FormGroup({
      id: new FormControl(''),
      name: new FormControl(''),
      idCard: new FormControl(''),
      drivingLicenseCode: new FormControl(''),
      typeOfLicense: new FormControl(''),
      address: new FormControl(''),
      birthday: new FormControl(''),
      experience: new FormControl(''),
      fixedSalary: new FormControl(''),
    });
  }

  getAll(): void {
    this.driverService.getAll().subscribe((data) => {
      console.log(data);
      this.driverList = data;
      console.log(this.driverList);
      this.dataSource = new MatTableDataSource<Driver>(this.driverList);
      this.dataSource.paginator = this.paginator;
    });
  }
  all() {
    this.getAll();
    this.makeSearchForm();
  }

  onSearch() {
    var param = {
      id: this.formSearch.value.id,
      name: this.formSearch.value.name,
      idCard: this.formSearch.value.idCard,
      drivingLicenseCode: this.formSearch.value.drivingLicenseCode,
      typeOfLicense: this.formSearch.value.typeOfLicense,
      address: this.formSearch.value.address,
      birthday: this.formSearch.value.birthday,
      experience: this.formSearch.value.experience,
      fixedSalary: this.formSearch.value.fixedSalary,
    };

    console.log(param);

    this.driverService.searchDriver(param).subscribe((data) => {
      console.log(data);
      this.driverList = data;
      console.log(this.driverList);
      this.dataSource = new MatTableDataSource<Driver>(this.driverList);
      this.openSnackBar('Tìm kiếm thành công');
    });
  }
  // confirm delete

  confirmDialog(driver: Driver): void {
    const message = `Are you sure you want to do this?`;

    const dialogData = new ConfirmDialogModel('Confirm Action', message);

    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      maxWidth: '600px',
      data: dialogData,
    });

    dialogRef.afterClosed().subscribe((dialogResult) => {
      if (dialogResult == true) {
        console.log('delete');
        this.driverService.deleteDriver(driver.id).subscribe(
          (data) => {
            this.openSnackBar('Xóa thành công');
            this.getAll();
          },
          (error) => {
            this.openSnackBar('Xóa thất bại');
          }
        );
      }
    });
  }

  openAddDialog() {
    const dialogRef = this.dialog.open(AddDriverComponent, {});

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        console.log(result);
        this.driverService.createDriver(result).subscribe(
          (data) => {
            this.openSnackBar('Thêm thành công');
            this.getAll();
          },
          (error) => {
            this.openSnackBar('Thêm thất bại');
            // this.getAll();
          }
        );
      }
    });
  }

  openEditDialog(data?: Driver) {
    // console.log(data)
    const dialogRef = this.dialog.open(EditDriverComponent, {
      data: data,
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        console.log(result);
        this.driverService.update(result).subscribe(
          (data) => {
            this.openSnackBar('cập nhật thành công');
            this.getAll();
          },
          (error) => {
            this.openSnackBar('Cập nhật thất bại');
            this.getAll();
          }
        );
      }
    });
  }

  openSnackBar(content: any) {
    this._snackBar.open(content, 'OK', {
      horizontalPosition: 'right',
      verticalPosition: 'top',
    });
  }
}
