import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';
import { RouteService } from 'src/app/service/route.service';
import { AddRouteComponent } from '../dialogs/add-route/add-route.component';
import {
  ConfirmDialogComponent,
  ConfirmDialogModel,
} from '../dialogs/confirm-dialog/confirm-dialog.component';
import { EditRouteComponent } from '../dialogs/edit-route/edit-route.component';

@Component({
  selector: 'app-route',
  templateUrl: './route.component.html',
  styleUrls: ['./route.component.scss'],
})
export class RouteComponent implements OnInit {
  resultComfirm: string = '';
  formSearch!: FormGroup;

  routeList: Route[] = [];

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

  constructor(
    private routeService: RouteService,
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
      pointOfDeparture: new FormControl(''),
      destination: new FormControl(''),
      length: new FormControl(''),
      complexity: new FormControl(''),
    });
  }

  getAll(): void {
    this.routeService.getAll().subscribe((data) => {
      console.log(data);
      this.routeList = data;
      console.log(this.routeList);
      this.dataSource = new MatTableDataSource<Route>(this.routeList);
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
      pointOfDeparture: this.formSearch.value.pointOfDeparture,
      destination: this.formSearch.value.destination,
      length: this.formSearch.value.length,
      complexity: this.formSearch.value.complexity,
    };

    console.log(param);

    this.routeService.searchRoute(param).subscribe((data) => {
      // console.log(data);
      this.routeList = data;
      // console.log(this.routeList);
      this.dataSource = new MatTableDataSource<Route>(this.routeList);
      this.dataSource.paginator = this.paginator;
      this.openSnackBar('Tìm kiếm thành công');
    });
  }
  // confirm delete

  confirmDialog(route: Route): void {
    const message = `Are you sure you want to do this?`;

    const dialogData = new ConfirmDialogModel('Confirm Action', message);

    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      maxWidth: '600px',
      data: dialogData,
    });

    dialogRef.afterClosed().subscribe((dialogResult) => {
      if (dialogResult == true) {
        console.log('delete');
        this.routeService.deleteRoute(route.id).subscribe(
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
    const dialogRef = this.dialog.open(AddRouteComponent, {});

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        console.log(result);
        this.routeService.createRoute(result).subscribe(
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

  openEditDialog(data?: Route) {
    // console.log(data)
    const dialogRef = this.dialog.open(EditRouteComponent, {
      data: data,
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        console.log(result);
        this.routeService.update(result).subscribe(
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
