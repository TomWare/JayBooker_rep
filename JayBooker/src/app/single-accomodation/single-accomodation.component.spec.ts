import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SingleAccomodationComponent } from './single-accomodation.component';

describe('SingleAccomodationComponent', () => {
  let component: SingleAccomodationComponent;
  let fixture: ComponentFixture<SingleAccomodationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SingleAccomodationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SingleAccomodationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
