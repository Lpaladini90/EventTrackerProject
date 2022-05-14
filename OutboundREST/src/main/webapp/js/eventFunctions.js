  window.addEventListener('load', function(e) {
    console.log('loaded');

    init();

    });

    function init() {
        console.log("in init");

        getHunts();
        }
        document.huntForm.submit.addEventListener('click', createHunt);

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
              console.log("Film not found");
            }
          }
      };
      xhr.send();
    }


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


function displayHuntTrips(hunttrips){
  // let hunt = e.target.hunttrips.value;

  let huntsDiv = document.getElementById('huntDisplay');
  huntsDiv.textContent = "";
  let table = document.createElement('table');
  table.id = 'huntsTable';

  let thead = document.createElement('thead');
  let headRow = document.createElement('tr');
  // let hunt.id. = document.createElement('tr')
  // hunt.id.textContent = "Id";

  for(h in hunttrips[0]){
    if(h ===  "species" || h === "description"){
    let th = document.createElement('th');
    th.textContent = h;
    headRow.appendChild(th);
  }
}
  thead.appendChild(headRow);
  table.appendChild(thead);

  let tbody = document.createElement('tbody');

  hunttrips.forEach(function (item){
    let row = document.createElement('tr');
    let species = document.createElement('td');
    let description = document.createElement('td');

    species.textContent = item.species + "  ";

    description.textContent = item.description + "  "



    row.appendChild(species);
    row.appendChild(description);
    tbody.appendChild(row);

  });

  table.appendChild(tbody);
  huntsDiv.appendChild(table);
  // document.body.appendChild(table);


}
