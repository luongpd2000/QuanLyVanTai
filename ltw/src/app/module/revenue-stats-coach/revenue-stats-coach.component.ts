import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';
import { RouteService } from 'src/app/service/route.service';
import { ViewStatsComponent } from '../dialogs/view-stats/view-stats.component';

@Component({
  selector: 'app-revenue-stats-coach',
  templateUrl: './revenue-stats-coach.component.html',
  styleUrls: ['./revenue-stats-coach.component.scss']
})
export class RevenueStatsCoachComponent implements OnInit {

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
  constructor(private routeService: RouteService,
    private _snackBar: MatSnackBar,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.getAll();
    this.makeSearchForm();
  }

  makeSearchForm() {
    this.formSearch = new FormGroup({
      startTime: new FormControl(''),
      endTime: new FormControl('')
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

  onSearch(){
    var st = this.formSearch.controls['startTime'].value;
    var et = this.formSearch.controls['endTime'].value;

    var dateSt = new Date(st);
    var dateEt = new Date(et);

    st = this.formatTime(st);
    et = this.formatTime(et);

    if(dateSt<=dateEt){
      this.openSnackBar(`Check thời gian đúng ${st} và ${et}`);
    }else{
      this.openSnackBar(`False ${st} và ${et}`);
    }
  }

  formatTime(timeFormat: any){
    timeFormat = timeFormat + '';
    const words = timeFormat.split(' (');
    var time = '';
    var date = new Date(words[0]);
    var d = words[0].split(' ');
    time = `${date.getFullYear()}-${
      date.getMonth() + 1 < 10 ? `0${date.getMonth() + 1}` : date.getMonth() + 1
    }-${date.getDate() < 10 ? `0${date.getDate() + 1}` : date.getDate() + 1} ${
      d[4]
    }`;
    return time;
  }

  openSnackBar(content: any) {
    this._snackBar.open(content, 'OK', {
      horizontalPosition: 'right',
      verticalPosition: 'top',
    });
  }

  openView(id: any){
    const dialogRef = this.dialog.open(ViewStatsComponent, {});
  }

}
