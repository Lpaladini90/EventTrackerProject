import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HunttripsComponent } from './hunttrips.component';

describe('HunttripsComponent', () => {
  let component: HunttripsComponent;
  let fixture: ComponentFixture<HunttripsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HunttripsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HunttripsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
