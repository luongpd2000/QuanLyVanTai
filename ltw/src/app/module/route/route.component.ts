import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';
import { RouteService } from 'src/app/service/route.service';
import { ConfirmDialogComponent, ConfirmDialogModel } from '../confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-route',
  templateUrl: './route.component.html',
  styleUrls: ['./route.component.scss'],
})
export class RouteComponent implements OnInit {

  resultComfirm: string = '';

  routeList: Route[] = [];

  displayedColumns: string[] = [
    'no',
    'id',
    'pointOfDeparture',
    'destination',
    'length',
    'complexityId',
    'action'
  ];
  dataSource = new MatTableDataSource<Route>();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }

  constructor(private routeService: RouteService,
    public dialog: MatDialog) {}

  ngOnInit(): void {
    this.getAll();
  }

  getAll() {
    this.routeService.getAll().subscribe((data) => {
      console.log(data)
      this.routeList = data;
      console.log(this.routeList);
      this.dataSource = new MatTableDataSource<Route>(this.routeList);
    });
  }

  // confirm delete

  confirmDialog(): void {
    const message = `Are you sure you want to do this?`;

    const dialogData = new ConfirmDialogModel("Confirm Action", message);

    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      maxWidth: "600px",
      data: dialogData
    });

    dialogRef.afterClosed().subscribe(dialogResult => {
      this.resultComfirm = dialogResult;
    });
  }
}

