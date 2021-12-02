import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Route } from 'src/app/data/route';

@Component({
  selector: 'app-coach-turn',
  templateUrl: './coach-turn.component.html',
  styleUrls: ['./coach-turn.component.scss']
})
export class CoachTurnComponent implements OnInit {
  resultComfirm: string = '';
  formSearch!: FormGroup;

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

  constructor() { }

  ngOnInit(): void {
  }

}
