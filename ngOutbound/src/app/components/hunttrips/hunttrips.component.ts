import { HunttripsService } from './../../services/hunttrips.service';
import { Hunttrip } from './../../models/hunttrip';
import { Component, OnInit, SecurityContext } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-hunttrips',
  templateUrl: './hunttrips.component.html',
  styleUrls: ['./hunttrips.component.css'],
})
export class HunttripsComponent implements OnInit {

  newHunt: Hunttrip = new Hunttrip();

  selected : Hunttrip | null = null;

  hunts: Hunttrip[] = [];

  displayDetails : boolean = false;

  showComplete : boolean = false;

  constructor(
    private huntService: HunttripsService,
    private router: Router,
    private currentRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.reloadHunt();
  }

  showHunt(id: number) {
    this.huntService.show(id).subscribe(
      (success) => {
        this.newHunt = success;
        console.log(success);
      },
      (error) => {
        console.log('Observable got an error: ' + error);
      }
    );
  }

  reloadHunt() {
    this.huntService.index().subscribe(
      (success) => {
        this.hunts = success;
        console.log(this.hunts);
      },
      (error) => console.log('Obersable got an error' + error)
    );
  }

  addHunt(newHunt: Hunttrip) {
    this.huntService.create(newHunt).subscribe(
      success => {
        this.reloadHunt();
        this.newHunt = new Hunttrip ();
      },
      error=> console.log("Adding Oberservable got an error")

    );
  }







  getNumOfHunts(){
    return this.hunts.length;
  }


  // refer to this when sending objects to another component
  displayInfo =(hunt: Hunttrip)=>{
    this.selected = hunt;
    this.router.navigateByUrl("/huntview/" + hunt.id)

  }
}
