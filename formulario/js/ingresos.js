let formulario = document.getElementById("formulario");

//Declare de inputs
let txtfecha = document.getElementById("txtfecha")
let txtcheque_polica = document.getElementById("txtcheque_polica")
let txtimporte = document.getElementById("txtimporte")
let txtconcepto = document.getElementById("txtconcepto")

//Validate inputs
const IsEmpity = (element, name) => {
    if (element.value == "" && element.type == "text") {
        alert("El campo " + name + " Es obligatorio")
        element.focus()
        return false
    }
    return true
}
const ValidateChequePoliza = () => {
    if (IsEmpity(txtcheque_polica, 'Cheque Poliza')) {

        if (!isNaN(parseInt(txtcheque_polica.value))) {
            return true;
        }
        alert('El contenido del campo Cheque Poliza debe ser numerico')
        txtcheque_polica.innerText = ""
        txtcheque_polica.focus()
    }
    return false

}
const ValidateFecha = () => {
    if (IsEmpity(txtfecha, 'Fecha')) {
        fecha = formato = txtfecha.value
        fecha_aux = fecha.split('/')
        console.log(fecha_aux)
        if (fecha_aux.length == 3) {
            if (checkDate(fecha_aux[1] + '/' + fecha_aux[0] + '/' + fecha_aux[2])) {
                return true
            }
        }
        else {
            alert('Incorrecto el formato de la fecha es dd/mm/aaaa')
        }

        txtfecha.focus();
        txtfecha.select();

    }
    return false

}
const ValidateImporte = () => {
    if (IsEmpity(txtimporte, 'Importe')) {

        if ((txtimporte.value).includes(',') || (txtimporte.value).includes('.')) {
            alert("El contenido del campo Importe es invalido")

        } else {
            if (!isNaN(parseInt(txtimporte.value))) {
                return true
            }
            alert('El contenido debe ser numerico')
        }

        txtimporte.innerText = ""
        txtimporte.focus()
    }
    return false
}

formulario.addEventListener('submit', (e) => {
    if (ValidateFecha() == false || ValidateChequePoliza() == false || ValidateImporte() == false || IsEmpity(txtconcepto, 'Concepto') == false) {
        e.preventDefault();
    }
})

function validar() {

    // Array con todos los elementos del formulario



    for (x = 0; x < camposTexto.length; x++) {

        //validar que los campos obligatorios se hayan llenado, con los demas campos, no hacer nada
        if (camposTexto[x].type == "text" && (camposTexto[x].id == "novalid")) {}//no hacer nada en este caso

        else if (camposTexto[x].value == "" && (camposTexto[x].type == "text")) {
            alert("El campo " + camposTexto[x].id + " es obligatorio !");
            form1.elements[x].focus();
            return false;

        }
        if (camposTexto[x].type == "text" && camposTexto[x].id == "Cheque/poliza") {
            var checanum = /(^([0-9]){1,20}|^)$/
            if (!checanum.test(camposTexto[x].value)) {
                alert("El contenido del campo " + camposTexto[x].id + " debe ser numérico entero !");
                form1.elements[x].value = "";
                form1.elements[x].focus();
                return false;
            }
        }

        if (camposTexto[x].type == "text" && camposTexto[x].id == "Importe") {
            var checanum = /(^([0-9,.]){1,20}|^)$/
            if (!checanum.test(camposTexto[x].value)) {
                alert("El contenido del campo " + camposTexto[x].id + " debe ser numérico !");
                form1.elements[x].value = "";
                form1.elements[x].focus();
                return false;
            }
            var campo_importe = camposTexto[x].value;
            var k = 0;
            for (i = 0; i < campo_importe.length; i++) {
                if (campo_importe.charAt(i) == '.') {
                    k++;
                }
            }
            if (k > 1) {
                alert("El contenido del campoo " + camposTexto[x].id + " es inválido !");
                form1.elements[x].value = "";
                form1.elements[x].focus();
                return false;
            }

            k = 0;
            for (i = 0; i < campo_importe.length; i++) {
                if (campo_importe.charAt(i) == ',') {
                    k++;
                }
            }
            if (k > 0) {
                alert("El contenido del campo " + camposTexto[x].id + " es inválido !");
                form1.elements[x].value = "";
                form1.elements[x].focus();
                return false;
            }


        }


        if (camposTexto[x].name == "cuenta" && camposTexto[x].selectedIndex == 0) {

            alert("El campo " + camposTexto[x].id + " es obligatorio !");
            form1.elements[x].focus();
            return false;
        }


        if (camposTexto[x].type == "text" && camposTexto[x].id == "Fecha") {
            if (checkDate(form1.elements[x].value) == false) {
                //        	  form1.elements[x].value="";
                form1.elements[x].focus();
                form1.elements[x].select();
                return false;
            }
        }



    }

}


