var submit = document.getElementById('submit');
var matchError = document.getElementById('matchError');
var numberError = document.getElementById('numberError');

function checkPassword(input) {
    if(checkNumber(input.value) &&
    checkMatch(input.value, document.getElementById('confirm').value) &&
    input.value != null){
        submit.disabled = false;
    } else {
        submit.disabled = true;
    }
}

function checkConfirm(input){
    if (checkNumber(input.value) &&
    checkMatch(document.getElementById('password').value, input.value) &&
    input.value != null){
        submit.disabled = false;
    } else {
        submit.disabled = true;
    }
}

function checkMatch(password, password2){
    if(password == password2){
        matchError.style.display = 'none';
        return true;
    } else {
        matchError.style.display = 'block';
        return false;
    }
}

function checkNumber(password){
    if(/^[0-9]+$/.test(password)){
        numberError.style.display = 'none';
        return true;
    } else {
        numberError.style.display = 'block';
        return false;
    }
}