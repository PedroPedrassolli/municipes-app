$(document).ready(function () {
    Inputmask({ "mask": "999.999.999-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#municipe_cpf');
    Inputmask({ "mask": "999 9999 9999 9999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#municipe_cns');
    Inputmask({ "mask": "(99)99999-9999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('#municipe_phone');
});