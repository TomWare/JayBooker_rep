import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SingleRateComponent } from './single-rate.component';

describe('SingleRateComponent', () => {
  let component: SingleRateComponent;
  let fixture: ComponentFixture<SingleRateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SingleRateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SingleRateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
