import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SingleDepartureComponent } from './single-departure.component';

describe('SingleDepartureComponent', () => {
  let component: SingleDepartureComponent;
  let fixture: ComponentFixture<SingleDepartureComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SingleDepartureComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SingleDepartureComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
