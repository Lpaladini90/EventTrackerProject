import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewhuntComponent } from './viewhunt.component';

describe('ViewhuntComponent', () => {
  let component: ViewhuntComponent;
  let fixture: ComponentFixture<ViewhuntComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewhuntComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewhuntComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
