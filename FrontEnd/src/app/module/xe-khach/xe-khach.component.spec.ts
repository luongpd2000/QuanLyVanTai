import { ComponentFixture, TestBed } from '@angular/core/testing';

import { XeKhachComponent } from './xe-khach.component';

describe('XeKhachComponent', () => {
  let component: XeKhachComponent;
  let fixture: ComponentFixture<XeKhachComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ XeKhachComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(XeKhachComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
