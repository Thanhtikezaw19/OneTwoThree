document.addEventListener('DOMContentLoaded', function() {
    var fields = document.querySelectorAll('.field.mt-2 input[type="text"]');

    fields.forEach(function(field, index) {
      field.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
          event.preventDefault();
          var nextField = fields[index + 1];

          if (field.classList.contains('odds-field')) {
            nextField = document.querySelector('.twod-num-field');
          } else {
            nextField = fields[index + 1];
          }

          if (nextField) {
            nextField.focus();
          }
        }
      });
    });

  });

  // Get references to the input fields and table body
  const twodNumberInput = document.getElementById('twodNumber');
  const twodPriceInput = document.getElementById('twodPrice');
  const tableBody = document.getElementById('tableBody');
  let rowCount = 0;

  function handleSubmit(event) {
    event.preventDefault();

    // Remove empty input fields
    const inputs = document.querySelectorAll('.num-input-field.mt-2 input[type="text"]');
    inputs.forEach(function (input) {
      if (input.value.trim() === '') {
        input.parentNode.remove();
      }
    });

    // Get the entered values
    const twodNumber = twodNumberInput.value;
    const twodPrice = twodPriceInput.value;

    // Check if twodNumber is not empty
    if (twodNumber.trim() !== '') {
      // Create a new hidden input field with the entered twodNumber
      const hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'customer[bet_2ds_attributes][][twod_number]');
      hiddenInput.setAttribute('value', twodNumber);
      tableBody.appendChild(hiddenInput);
    }

    // Check if twodPrice is not empty
    if (twodPrice.trim() !== '') {
      // Create a new hidden input field with the entered twodPrice
      const hiddenInput2 = document.createElement('input');
      hiddenInput2.setAttribute('type', 'hidden');
      hiddenInput2.setAttribute('name', 'customer[bet_2ds_attributes][][twod_amount]');
      hiddenInput2.setAttribute('value', twodPrice);
      tableBody.appendChild(hiddenInput2);
    }

    // Create a new row in the table if at least one valid input is present
    if (twodNumber.trim() !== '' || twodPrice.trim() !== '') {
      const newRow = document.createElement('tr');
      rowCount++;
      newRow.innerHTML = `
        <td>${rowCount}</td>
        <td>${twodNumber}</td>
        <td>${twodPrice}</td>
      `;

      // Append the new row to the table body
      tableBody.appendChild(newRow);
    }

    // Clear the input fields
    twodNumberInput.value = '';
    twodPriceInput.value = '';

    // Save the input values to local storage
    saveInputValues();
  }






  // Function to save input values to local storage
  function saveInputValues() {
    const twodNumber = twodNumberInput.value;
    const twodPrice = twodPriceInput.value;

    localStorage.setItem('twodNumber', twodNumber);
    localStorage.setItem('twodPrice', twodPrice);
  }

  // Function to load input values from local storage
  function loadInputValues() {
    const savedTwodNumber = localStorage.getItem('twodNumber');
    const savedTwodPrice = localStorage.getItem('twodPrice');

    if (savedTwodNumber && savedTwodPrice) {
      twodNumberInput.value = savedTwodNumber;
      twodPriceInput.value = savedTwodPrice;
    }
  }

  // Add event listeners to the input fields for "keydown" event
  twodNumberInput.addEventListener('keydown', handleNext);
  twodPriceInput.addEventListener('keydown', handleKeyDown);

  //Function to handle the "enter keydown" to next field
  function handleNext(event) {
    var fields = document.querySelectorAll('.num-input-field.mt-2 input[type="text"]');
    fields.forEach(function(field, index) {
      field.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
          event.preventDefault();
          var nextField = fields[index + 1];
          if (index === 0) {
            nextField = document.querySelector('.twod-price-field');
          } else {
            nextField = document.querySelector('.twod-num-field');
          }
          if (nextField) {
            nextField.focus();
          }
        }
      });
    });
  }

  // Function to handle the "keydown" event
  function handleKeyDown(event) {
    if (event.key === 'Enter') {
      handleSubmit(event);
    }
  }

  // Load input values from local storage when the page loads
  window.addEventListener('load', loadInputValues);

