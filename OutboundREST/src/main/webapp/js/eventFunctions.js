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
    if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
          let huntData = JSON.parse(xhr.responseText);
          createHunt(huntData);
        }
        else {
          console.error("POST request failed.");
				  console.error(xhr.status + ': ' + xhr.responseText);
        }
      }

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
  let table = document.createElement('table');
  table.id = 'huntsTable';

  let thead = document.createElement('thead');
  let headRow = document.createElement('tr');
  // let hunt.id. = document.createElement('tr')
  // hunt.id.textContent = "Id";

  for(h in hunttrips[0]){
    let th = document.createElement('th');
    th.textContent = h;
    headRow.appendChild(th);

  }

  thead.appendChild(headRow);
  table.appendChild(thead);

  let tbody = document.createElement('tbody');

  hunttrips.forEach(function (item){
    let row = document.createElement('tr');
    let id = document.createElement('td');
    let species = document.createElement('td');
    let sex = document.createElement('td');
    let type = document.createElement('td');
    let description = document.createElement('td');
    let startDate = document.createElement('td');
    let endDate = document.createElement('td');

    id.textContent = item.id + "  ";
    species.textContent = item.species + "  ";
    sex.textContent = item.sex + "  ";
    type.textContent = item.type + "  ";
    description.textContent = item.description + "  "
    startDate.textContent = item.startDate + "  ";
    endDate.textContent = item.endDate + "  ";

    row.appendChild(id);
    row.appendChild(species);
    row.appendChild(sex);
    row.appendChild(type);
    row.appendChild(description);
    row.appendChild(startDate);
    row.appendChild(endDate);
    tbody.appendChild(row);

  });

  table.appendChild(tbody);
  huntsDiv.appendChild(table);
  // document.body.appendChild(table);


}
