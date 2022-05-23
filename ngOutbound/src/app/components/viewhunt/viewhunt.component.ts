import { Hunttrip } from './../../models/hunttrip';
import { ActivatedRoute } from '@angular/router';
import { HunttripsService } from './../../services/hunttrips.service';

import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-viewhunt',
  templateUrl: './viewhunt.component.html',
  styleUrls: ['./viewhunt.component.css']
})
export class ViewhuntComponent implements OnInit {
  newHunt: Hunttrip = new Hunttrip();

  selected : Hunttrip | null = null;
  hunts: Hunttrip[] = [];

  editHunt: Hunttrip | null = null;

  constructor(private huntService: HunttripsService, private route : ActivatedRoute) { }

    // refer to this when sending objects to another component
  ngOnInit(): void {
    if (!this.selected && this.route.snapshot.paramMap.get('id')) {
      let id = this.route.snapshot.paramMap.get('id');
      if (id) {
        this.showHunt(parseInt(id));
      }
    }

  }

  showHunt(id: number) {
    console.log(id);

    this.huntService.show(id).subscribe(
      (success) => {
        this.selected = success;
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


  updateHunt(updateHunt: Hunttrip, id : number) {
    this.huntService.update(updateHunt,id).subscribe(
      success=> {
        this.reloadHunt();

        this.newHunt = updateHunt;

      },
      error=> console.log("Updating observable got an error")
    );
      }

      setEditHunt(){
        this.editHunt = Object.assign({}, this.selected);
      }
      displayTable = ()=>{
        this.selected = null;
      }
      deleteHunt(id: number) {
        this.huntService.destory(id).subscribe(
          success=> {
            this.reloadHunt();

          },
          error=> console.log("Deleting observable got an error")
        );
      }

}
