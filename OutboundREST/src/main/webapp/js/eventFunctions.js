  window.addEventListener('load', function(e) {
    console.log('loaded');

    init();

    });

    function init() {

        getHunts();

        document.huntForm.submit.addEventListener('click', createHunt);

        }



// --------------------    FIND A SINGLE HUNT ----------------------------


    function getSingleHunt(huntId){
      let xhr = new XMLHttpRequest();
      xhr.open("GET", 'api/hunttrips/' + huntId);
      xhr.onreadystatechange = function(){
          if(xhr.readyState == 4){
              if(xhr.status === 200){
              let hunt = JSON.parse(xhr.responseText);
              console.log(hunt);
              displayHunt(hunt);
            }
            else {
              console.log("hunt not found");
            }
          }
      };
      xhr.send();
    }


    function displayHunt(hunt) {
      let huntDiv = document.getElementById('huntData');
      huntDiv.textContent = "";

      let h1 = document.createElement('h1');
      h1.textContent = "Hunt Info";
      huntDiv.appendChild(h1);

      let list = document.createElement('ul');
      let id = document.createElement('li');
      let species = document.createElement('li');
      let description = document.createElement('li');
      let type = document.createElement('li');
      let sex = document.createElement('li');
      let startDate = document.createElement('li');
      let endDate = document.createElement('li');

      id.textContent = hunt.id;
      species.textContent = hunt.species;
      description.textContent = hunt.description;
      type.textContent = hunt.type;
      sex.textContent = hunt.sex;
      startDate.textContent = hunt.startDate;
      endDate.textContent = hunt.endDate;

      list.appendChild(id);
      list.appendChild(species);
      list.appendChild(description);
      list.appendChild(type);
      list.appendChild(sex);
      list.appendChild(startDate);
      list.appendChild(endDate);

      huntDiv.appendChild(list);



      let updateBtn = document.createElement('button');
      updateBtn.id = hunt.id;
      updateBtn.type = 'submit';
      updateBtn.textContent = 'Update Hunt';
      updateBtn.addEventListener('click', function(e){
      console.log(updateBtn.id);

      });

      let deleteBtn = document.createElement('button');
      deleteBtn.id = hunt.id;
      deleteBtn.type = 'submit';
      deleteBtn.textContent = 'Delete Hunt';
      deleteBtn.addEventListener('click', function(e){
          let xhr = new XMLHttpRequest();
          xhr.open("DELETE", 'api/hunttrips/' + hunt.id);

          xhr.setRequestHeader("Content-type", "application/json");

          xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 ){
            if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
                getHunts()
                }
                else {
                  console.error("DELETE request failed.");
        				  console.error(xhr.status + ': ' + xhr.responseText);
                }
              }
        };

          xhr.send(JSON.stringify(hunt));
        });




      huntDiv.appendChild(updateBtn);
      huntDiv.appendChild(deleteBtn);
    }
// ------------------------ FIND ALL HUNTS --------------------------------

    function getHunts() {
      let xhr = new XMLHttpRequest();
      xhr.open("GET", 'api/hunttrips');
      xhr.onreadystatechange = function(){
          if(xhr.readyState == 4){
              if(xhr.status === 200){
              let hunttrips = JSON.parse(xhr.responseText);
              console.log(hunttrips);
              displayHuntTrips(hunttrips);


            }
            else {
              console.log("hunt not found");
            }
          }
      };
      xhr.send();
    }

    function displayHuntTrips(hunttrips){
      // let hunt = e.target.hunttrips.value;

      let huntsDiv = document.getElementById('huntDisplay');
      huntsDiv.textContent = "";
      let table = document.createElement('table');
      table.id = 'huntsTable';
      table.border =1;

      table.cellpadding = 10;

      let thead = document.createElement('thead');
      let tr = document.createElement('tr');
      // let hunt.id. = document.createElement('tr')
      // hunt.id.textContent = "Id";

      for(h in hunttrips[0]){
        if(h ===  "species" || h === "description"){
        let th = document.createElement('th');
        th.textContent = h;
        tr.appendChild(th);
      }
    }

      thead.appendChild(tr);
      table.appendChild(thead);

      let tbody = document.createElement('tbody');

      hunttrips.forEach(function (item){
        let row = document.createElement('tr');
        row.addEventListener('click', function(e){
            displayHunt(item);

        });

        let id =document.createElement('td');
        let species = document.createElement('td');
        let description = document.createElement('td');

        id.textContent = item.id;
        species.textContent = item.species;
        description.textContent = item.description;

        row.appendChild(species);
        row.appendChild(description);
        tbody.appendChild(row);

      });

      table.appendChild(tbody);
      huntsDiv.appendChild(table);

    }


// ------------------------ CREATE A HUNT -----------------------------


function createHunt(e){
  e.preventDefault();

  let xhr = new XMLHttpRequest();
  xhr.open("POST", 'api/hunttrips');

  xhr.setRequestHeader("Content-type", "application/json");

  xhr.onreadystatechange = function(){
    if(xhr.readyState === 4 ){
    if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
          let huntData = JSON.parse(xhr.responseText);
            getHunts();
        }
        else {
          console.error("POST request failed.");
				  console.error(xhr.status + ': ' + xhr.responseText);
        }
      }
};
  let hunt = {
    species: document.huntForm.species.value,
    sex: document.huntForm.sex.value,
    type: document.huntForm.type.value,
    description: document.huntForm.description.value,
    startDate: document.huntForm.startDate.value,
    endDate: document.huntForm.endDate.value

  }
  xhr.send(JSON.stringify(hunt));
};


// ---------------------------- UPDATE A HUNT -----------------------------


function updateHunt(hunt){
  e.preventDefault();

  let xhr = new XMLHttpRequest();
  xhr.open("PUT", 'api/hunttrips/' + hunt.id);

  xhr.setRequestHeader("Content-type", "application/json");

  xhr.onreadystatechange = function(){
    if(xhr.readyState === 4 ){
    if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
          let data = JSON.parse(xhr.responseText);
            updateHunt(data);
        }
        else {
          console.error("PUT request failed.");
				  console.error(xhr.status + ': ' + xhr.responseText);
        }
      }
};
  hunt = {
    id: hunt.id
    // species: document.huntForm.species.value,
    // sex: document.huntForm.sex.value,
    // type: document.huntForm.type.value,
    // description: document.huntForm.description.value,
    // startDate: document.huntForm.startDate.value,
    // endDate: document.huntForm.endDate.value

  }
  xhr.send(JSON.stringify(data));
};


function updateHunt(hunt){
preventDefault();

let updateDiv = document.createElement('')


let h1 = document.createElement('h1');




}














// for (let i = 0; i < hunttrips.length; i++) {
//   let showHideRow = document.createElement('tr');
//   showHideRow.onlclick = "showHideRow('hidden_row[i]');"
//
//   let hiddenRow = document.createElement('tr');
//   hiddenRow.id ="hidden_row".hunttrips[i];
//   hiddenRow.class = "hidden_row"
//
//   let species = document.createElement('td');
//   let description = document.createElement('td');
//   species.textContent = hunttrips[i].species + "  ";
//   description.textContent = hunttrips[i].description + "  "
//
// showHideRow.appendChild(species);
// showHideRow.appendChild(description);
//
// hiddenRow.appendChild(sex);
// hiddenRow.appendChild(type);
// hiddenRow.appendChild(startDate);
// hiddenRow.appendChild(endDate);
//
//
//
//
// tbody.appendChild(hiddenRow);
// tbody.appendChild(showHide);
// };
//
// table.appendChild(tbody);
// huntsDiv.appendChild(table);
