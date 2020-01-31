import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SingleShipComponent } from './single-ship.component';

describe('SingleShipComponent', () => {
  let component: SingleShipComponent;
  let fixture: ComponentFixture<SingleShipComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SingleShipComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SingleShipComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
