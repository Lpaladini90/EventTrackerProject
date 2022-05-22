import { HunttripsService } from './../../services/hunttrips.service';
import { Hunttrip } from './../../models/hunttrip';
import { Component, OnInit, SecurityContext } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-hunttrips',
  templateUrl: './hunttrips.component.html',
  styleUrls: ['./hunttrips.component.css'],
})
export class HunttripsComponent implements OnInit {

  newHunt: Hunttrip = new Hunttrip();

  editHunt: Hunttrip | null = null;

  selected : Hunttrip | null = null;

  hunts: Hunttrip[] = [];

  displayDetails : boolean = false;



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

  updateHunt(updateHunt: Hunttrip, id : number) {
this.huntService.update(updateHunt,id).subscribe(
  success=> {
    this.reloadHunt();

    this.newHunt = updateHunt;

  },
  error=> console.log("Updating observable got an error")
);
  }



  deleteHunt(id: number) {
    this.huntService.destory(id).subscribe(
      success=> {
        this.reloadHunt();

      },
      error=> console.log("Deleting observable got an error")
    );
  }

  getNumOfHunts(){
    return this.hunts.length;
  }

  setEditHunt(){
    this.editHunt = Object.assign({}, this.selected);
  }


  displayInfo =(hunt: Hunttrip)=>{
    this.selected = hunt;

  }

displayTable = ()=>{
  this.selected = null;
}

}
