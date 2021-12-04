import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';

@Component({
  selector: 'app-revenue-stats-coach',
  templateUrl: './revenue-stats-coach.component.html',
  styleUrls: ['./revenue-stats-coach.component.scss']
})
export class RevenueStatsCoachComponent implements OnInit {

  formSearch!: FormGroup;


  displayedColumns: string[] = [
    'no',
    'id',
    'pointOfDeparture',
    'destination',
    'length',
    'complexityId'
  ];
  dataSource = new MatTableDataSource<Route>();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
  constructor() { }

  ngOnInit(): void {
    this.makeSearchForm();
  }

  makeSearchForm() {
    this.formSearch = new FormGroup({
      startTime: new FormControl(''),
      endTime: new FormControl('')
    });
  }

  onSearch(){}

}
