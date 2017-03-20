$( document ).ready(function() {
  $('.title').on('mouseenter', function({currentTarget}){
    $(this).next().toggle(1000)
  })

  $('.password-field').on('keyup', function({currentTarget}){
    const passwordVal = currentTarget.value;
    let passwordStrength = calculatePassStrength(passwordVal)
    $($('#form-message')[0]).html(passwordStrength);
  })

})

let numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
let alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
'Q','R','S','T','U','V','W','X','Y','Z']

function calculatePassStrength (password) {
  let strength = 0
  let containsCap = false;
  let containsNum = false;

  if (password.length >= 8) {
    strength = 1;
  }

  for (let letter of alphabet) {
    if (password.includes(letter) && password.length >= 8) {
      containsCap = true;
    }
  }

  for (let number of numbers) {
    if (password.includes(number) && password.length >= 8) {
      containsNum = true;
    }
  }


  if (containsCap) {
    strength += 1;
  }

  if (containsNum) {
    strength += 1;
  }

  return strength;
}
