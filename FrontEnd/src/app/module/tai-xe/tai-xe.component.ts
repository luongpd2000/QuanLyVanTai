import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
// import {MatPaginator} from '@angular/material/paginator';
import {MatTableDataSource} from '@angular/material/table';

@Component({
  selector: 'app-tai-xe',
  templateUrl: './tai-xe.component.html',
  styleUrls: ['./tai-xe.component.css']
})
export class TaiXeComponent implements OnInit {
  displayedColumns: string[] = ['position', 'name', 'cmt', 'symbol','action'];
  dataSource = new MatTableDataSource<PeriodicElement>(ELEMENT_DATA);

  @ViewChild(MatPaginator)paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }

  constructor() { }


  ngOnInit(): void {

  }
}

export interface PeriodicElement {
  name: string;
  position: number;
  cmt: number;
  symbol: string
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', cmt: 1.0079, symbol: 'H'},
  {position: 2, name: 'Helium', cmt: 4.0026, symbol: 'He'},
  {position: 3, name: 'Lithium', cmt: 6.941, symbol: 'Li'},
  {position: 4, name: 'Beryllium', cmt: 9.0122, symbol: 'Be'},
  {position: 5, name: 'Boron', cmt: 10.811, symbol: 'B'},
  {position: 6, name: 'Carbon', cmt: 12.0107, symbol: 'C'},
  {position: 7, name: 'Nitrogen', cmt: 14.0067, symbol: 'N'},
  {position: 8, name: 'Oxygen', cmt: 15.9994, symbol: 'O'},
  {position: 9, name: 'Fluorine', cmt: 18.9984, symbol: 'F'},
  {position: 10, name: 'Neon', cmt: 20.1797, symbol: 'Ne'},
  {position: 11, name: 'Sodium', cmt: 22.9897, symbol: 'Na'},
  {position: 12, name: 'Magnesium', cmt: 24.305, symbol: 'Mg'},
  {position: 13, name: 'Aluminum', cmt: 26.9815, symbol: 'Al'},
  {position: 14, name: 'Silicon', cmt: 28.0855, symbol: 'Si'},
  {position: 15, name: 'Phosphorus', cmt: 30.9738, symbol: 'P'},
  {position: 16, name: 'Sulfur', cmt: 32.065, symbol: 'S'},
  {position: 17, name: 'Chlorine', cmt: 35.453, symbol: 'Cl'},
  {position: 18, name: 'Argon', cmt: 39.948, symbol: 'Ar'},
  {position: 19, name: 'Potassium', cmt: 39.0983, symbol: 'K'},
  {position: 20, name: 'Calcium', cmt: 40.078, symbol: 'Ca'},
];
