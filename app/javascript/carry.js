document.addEventListener('DOMContentLoaded', function() {
  var fields = document.querySelectorAll('.carry-field.mt-2 input[type="text"]');

  fields.forEach(function(field, index) {
    field.addEventListener('keydown', function(event) {
      if (event.key === 'Enter') {
        event.preventDefault();
        var nextField = fields[index + 1];

        if (field.classList.contains('odds-field-carry')) {
          nextField = document.querySelector('.twod-num-field-carry');
        }else {
          nextField = fields[index + 1];
        }

        if (nextField) {
          nextField.focus();
        }
      }
    });
  });

});

///////////////////////////////////////////////////////////////////////////////////////////////////////
// Get references to the input fields and table body
const carrytwodNumberInput = document.getElementById('carryTwodNumber');
const carrytwodPriceInput = document.getElementById('carryTwodPrice');
const carryTableBody = document.getElementById('carryTableBody');
let carryrowCount = 0;

function handleCarrySubmit(event) {
  event.preventDefault();

  let hiddenCarryInput, hiddenCarryInput2;

  // Remove empty input fields
  const inputs = document.querySelectorAll('.num-input-carry-field.mt-2.carry input[type="text"]');
  inputs.forEach(function (input) {
    if (input.value.trim() === '') {
      input.parentNode.remove();
    }
  });

  // Get the entered values
  const carrytwodNumber = carrytwodNumberInput.value;
  const carrytwodPrice = carrytwodPriceInput.value;

  // Check if twodNumber is not empty
  if (carrytwodNumber.trim() !== '') {
    // Create a new hidden input field with the entered twodNumber
    hiddenCarryInput = document.createElement('input');
    hiddenCarryInput.setAttribute('type', 'hidden');
    hiddenCarryInput.setAttribute('name', 'carry[carry_2ds_attributes][][carry_2number]');
    hiddenCarryInput.setAttribute('value', carrytwodNumber);
    carryTableBody.appendChild(hiddenCarryInput);
  }

  // Check if twodPrice is not empty
  if (carrytwodPrice.trim() !== '') {
    // Create a new hidden input field with the entered twodPrice
    hiddenCarryInput2 = document.createElement('input');
    hiddenCarryInput2.setAttribute('type', 'hidden');
    hiddenCarryInput2.setAttribute('name', 'carry[carry_2ds_attributes][][carry_2amount]');
    hiddenCarryInput2.setAttribute('value', carrytwodPrice);
    carryTableBody.appendChild(hiddenCarryInput2);
  }

  // Create a new row in the table if at least one valid input is present
  if (carrytwodNumber.trim() !== '' || carrytwodPrice.trim() !== '') {
    const newCarryRow = document.createElement('tr');
    carryrowCount++;
    newCarryRow.innerHTML = `
      <td>${carryrowCount}</td>
      <td>${carrytwodNumber}</td>
      <td>${carrytwodPrice}</td>
      <td class="text-center"><button type="button" class="delete-carry-row-btn text-center w-100 border-0 bg-primary hover"><i class="bi bi-trash3-fill style="width: 100%; height: 100%; display: block;"></i></button></td>
    `;

    // Attach a click event listener to the delete button
    const deleteCarryButton = newCarryRow.querySelector('.delete-carry-row-btn');
    deleteCarryButton.addEventListener('click', function () {
      // Remove the corresponding hidden inputs when deleting the row
      if (hiddenCarryInput) {
        hiddenCarryInput.remove();
      }
      if (hiddenCarryInput2) {
        hiddenCarryInput2.remove();
      }
      newCarryRow.remove();
    });

    // Append the new row to the table body
    carryTableBody.appendChild(newCarryRow);
  }

  // Function to validate and add a new row
  function addCarryRowIfValid() {
    const carrytwodNumberInput = document.getElementById('carrytwodNumber');
    const carrytwodPriceInput = document.getElementById('carrytwodPrice');
    const carrytwodNumber = carrytwodNumberInput.value.trim();
    const carrytwodPrice = carrytwodPriceInput.value.trim();

    // Check if the input is valid (you can add your validation logic here)
    if (carrytwodNumber && carrytwodPrice) {
      addTableRow(carrytwodNumber, carrytwodPrice);

      // Clear the input fields
      carrytwodNumberInput.value = '';
      carrytwodPriceInput.value = '';
    } else {
      alert('Please enter valid data.');
    }
  }

  // Clear the input fields
  carrytwodNumberInput.value = '';
  carrytwodPriceInput.value = '';

  // Attach a click event listener to autton that adds rows
  const addCarryButton = document.getElementById('addCarryRowButton');
  addCarryButton.addEventListener('click', addCarryRowIfValid);

  // Save the input values to local storage
  saveCarryInputValues();
}

// Function to save input values to local storage
function saveCarryInputValues() {
  const carrytwodNumber = carrytwodNumberInput.value;
  const carrytwodPrice = carrytwodPriceInput.value;

  localStorage.setItem('carrytwodNumber', carrytwodNumber);
  localStorage.setItem('carrytwodPrice', carrytwodPrice);
}

// Function to load input values from local storage
function loadCarryInputValues() {
  const savedCarryTwodNumber = localStorage.getItem('carrytwodNumber');
  const savedCarryTwodPrice = localStorage.getItem('carrytwodPrice');

  if (savedCarryTwodNumber && savedCarryTwodPrice) {
    carrytwodNumberInput.value = savedCarryTwodNumber;
    carrytwodPriceInput.value = savedCarryTwodPrice;
  }
}

// Add event listeners to the input fields for "keydown" event
carrytwodNumberInput.addEventListener('keydown', handleCarryNext);
carrytwodPriceInput.addEventListener('keydown', handleCarryKeyDown);

//Function to handle the "enter keydown" to next field
function handleCarryNext(event) {
  var fields = document.querySelectorAll('.num-input-carry-field.mt-2.carry input[type="text"]');
  fields.forEach(function(field, index) {
    field.addEventListener('keydown', function(event) {
      if (event.key === 'Enter') {
        event.preventDefault();
        var nextField = fields[index + 1];
        console.log(index);
        if (index === 0) {
          nextField = document.querySelector('.twod-price-field-carry');
        } else {
          nextField = document.querySelector('.twod-num-field-carry');
        }
        if (nextField) {
          nextField.focus();
        }
      }
    });
  });
}

// Function to handle the "keydown" event
function handleCarryKeyDown(event) {
  if (event.key === 'Enter') {
    handleCarrySubmit(event);
  }
}

// Load input values from local storage when the page loads
window.addEventListener('load', loadCarryInputValues);
