import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TaiXeComponent } from './tai-xe.component';

describe('TaiXeComponent', () => {
  let component: TaiXeComponent;
  let fixture: ComponentFixture<TaiXeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TaiXeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TaiXeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
