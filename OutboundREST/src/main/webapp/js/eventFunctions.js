  window.addEventListener('load', function(e) {
    console.log('loaded');

    init();

    });

    function init() {

        getHunts();

        document.huntForm.submit.addEventListener('click', createHunt);

        }


        //create a function to add the amount of hunts i have and display.


// --------------------    FIND A SINGLE HUNT ----------------------------


    function getSingleHunt(huntId){
      let xhr = new XMLHttpRequest();
      xhr.open("GET", 'api/outbound/hunttrips' + huntId);
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
      let name = document.createElement('li');
      let description = document.createElement('li');
      let startDate = document.createElement('li');
      let endDate = document.createElement('li');

      id.textContent = hunt.id;
      name.textContent = hunt.name;
      description.textContent = hunt.description;

      startDate.textContent = hunt.startDate;
      endDate.textContent = hunt.endDate;


      list.appendChild(id);
      list.appendChild(name);
      list.appendChild(description);

      list.appendChild(startDate);
      list.appendChild(endDate);

      huntDiv.appendChild(list);




      let updateBtn = document.createElement('button');
      let updateDiv = document.createElement('div');
      updateBtn.id = hunt.id;
      updateBtn.type = 'submit';
      updateBtn.textContent = 'Update Hunt';
      updateBtn.addEventListener('click', function(e){

        updateDiv.textContent = "";


      let br2 = document.createElement('br');

      let updateForm = document.createElement('form');
      updateForm.id = 'updateform'


      let nameLabel =document.createElement('label');
      nameLabel.name = "name"
      nameLabel.textContent = "name: "

      let updateName = document.createElement('input');
      updateName.id = 'name';
      updateName.placeholder = 'name';
      updateName.value = hunt.name;

      let descriptionLabel = document.createElement('label');
      descriptionLabel.name = "description"
      descriptionLabel.textContent = "Description: "

      let updateDescription = document.createElement('input');
      updateDescription.id = 'description';
      updateDescription.placeholder = 'Description';
      updateDescription.value = hunt.description;



      let startDateLabel = document.createElement('label');
      startDateLabel.name = 'startDate';
      startDateLabel.textContent = "Start Date: "

      let updateStartDate = document.createElement('input');
      updateStartDate.id = 'startDate';
      updateStartDate.placeholder = 'Start Date';
      updateStartDate.type = "date";
      updateStartDate.value = hunt.startDate;

      let endDateLabel = document.createElement('label');
      endDateLabel.name = 'startDate';
      endDateLabel.textContent = "End Date: "

      let updateEndDate = document.createElement('input');
      updateEndDate.id = 'endDate';
      updateEndDate.placeholder = 'End Date';
      updateEndDate.type = "date";
      updateEndDate.value = hunt.endDate;


      let br = document.createElement('br');
      let br1 = document.createElement('br');
      let br3 = document.createElement('br');
      let br4 = document.createElement('br');
      let br5 = document.createElement('br');
      let br6 = document.createElement('br');
      let br7 = document.createElement('br');
      let br8 = document.createElement('br');


      let updateButton = document.createElement('button');
      updateButton.id = updateButton;
      updateButton.type = 'button'
      updateButton.textContent = "Submit Update";

      updateForm.appendChild(br2);
      updateForm.appendChild(nameLabel);
      updateForm.appendChild(updateName);
      updateForm.appendChild(br3)

      updateForm.appendChild(descriptionLabel);
      updateForm.appendChild(updateDescription);
      updateForm.appendChild(br4);

      updateForm.appendChild(startDateLabel);
      updateForm.appendChild(updateStartDate);
      updateForm.appendChild(br7)
      updateForm.appendChild(endDateLabel)
      updateForm.appendChild(updateEndDate)
      updateForm.appendChild(br);
      // updateForm.appendChild(br1);
      updateForm.appendChild(updateButton);


      updateDiv.appendChild(updateForm);
      huntDiv.appendChild(updateDiv);

      updateButton.addEventListener('click',function(e){

        e.preventDefault();

        hunt = {
          id: hunt.id,
          name: updateForm.name.value,

          description: updateForm.description.value,
          startDate: updateForm.startDate.value,
          endDate: updateForm.endDate.value
        };


        let xhr = new XMLHttpRequest();
        xhr.open("PUT", 'api/outbound/hunttrips/' + hunt.id);

        console.log("after put: " + hunt.id); //
        xhr.setRequestHeader("Content-type", "application/json");

        xhr.onreadystatechange = function(){
          console.log("inside xhr hunt id:" + hunt.id);
          if(xhr.readyState === 4 ){
          if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
                let dataHunt = JSON.parse(xhr.responseText)
                console.log("data: " + dataHunt.id);
                getHunts();

              }
              else {
                console.error("PUT request failed.");
      				  console.error(xhr.status + ': ' + xhr.responseText);
              }
            }
    };

    huntDiv.textContent = "";
    xhr.send(JSON.stringify(hunt));

    });

    });


      let deleteBtn = document.createElement('button');
      deleteBtn.id = hunt.id;
      deleteBtn.type = 'submit';
      deleteBtn.textContent = 'Delete Hunt';
      deleteBtn.addEventListener('click', function(e){
          let xhr = new XMLHttpRequest();
          xhr.open("DELETE", 'api/outbound/hunttrips/' + hunt.id);

          xhr.setRequestHeader("Content-type", "application/json");

          xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 ){
            if (xhr.status == 200 || xhr.status == 201) { // Ok or Created
                huntDiv.textContent= "";
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
      xhr.open("GET", 'api/outbound/hunttrips');
      xhr.onreadystatechange = function(){
          if(xhr.readyState == 4){
              if(xhr.status === 200){
              let hunttrips = JSON.parse(xhr.responseText);
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
        let name = document.createElement('td');
        let description = document.createElement('td');

        id.textContent = item.id;
        name.textContent = item.name;
        description.textContent = item.description;

        row.appendChild(name);
        row.appendChild(description);
        tbody.appendChild(row);

      });


      table.appendChild(tbody);
      huntsDiv.appendChild(table);

      let amountOfHunts = hunttrips.length;
      let h1 = document.createElement('h1');
      h1.textContent = "The total number of hunting events is: " + amountOfHunts;
      huntsDiv.appendChild(h1);


    }


// ------------------------ CREATE A HUNT -----------------------------


function createHunt(e){
  e.preventDefault();

  let xhr = new XMLHttpRequest();
  xhr.open("POST", 'api/outbound/hunttrips');

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
    name: document.huntForm.name.value,
    description: document.huntForm.description.value,
    startDate: document.huntForm.startDate.value,
    endDate: document.huntForm.endDate.value

  }

  xhr.send(JSON.stringify(hunt));
};




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
