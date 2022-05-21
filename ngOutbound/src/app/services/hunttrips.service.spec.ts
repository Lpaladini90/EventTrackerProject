import { TestBed } from '@angular/core/testing';

import { HunttripsService } from './hunttrips.service';

describe('HunttripsService', () => {
  let service: HunttripsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(HunttripsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
