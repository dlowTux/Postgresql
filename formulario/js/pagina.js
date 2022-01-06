let txtid = document.getElementById("control")
let txtnombre = document.getElementById("name")
let txtapellido = document.getElementById("apellidos")
let txtdomicilio = document.getElementById("domicilio")
let txtedad = document.getElementById("edad")
let txttelefono = document.getElementById("telefono")
let txtpadre = document.getElementById("padre")
let txtcarrera = document.getElementById("carrera")
let txtsexo = document.getElementsByName("radio")
let txtfecha_registro = document.getElementById("fechaR")
let txtfecha_nacimiento = document.getElementById("fechaN")
let txtestatura = document.getElementById("estatura")
let txtpeso = document.getElementById("peso")

let boton = document.getElementById("boton")

const CamposVacios = (elemeto, nombre) => {
    console.log(nombre)
    if (elemeto.value == "") {
        alert('El campo ' + nombre + ' es obligatorio')
        elemeto.focus();
        return false
    }
    console.log('Verdadero')
    return true
}
const validateFloat = (txt, nombre) => {
    if (CamposVacios(txt, nombre)) {
        if (!isNaN(parseFloat(txt.value))) {
            return true
        }
        alert('El contenido del campo ' + nombre + " es incorrecto")
    }

    return false;
}
const ValidateNumber = (txt, nombre) => {
    if (CamposVacios(txt, nombre)) {
        if (!isNaN(parseInt(txt.value))) {
            return true
        }
        alert('El contenido del campo ' + nombre + ' es incorrecto')
        txt.innerText = "";
        txt.focus();
    }
    return false
}
const ValidateTextos = (txt, nombre) => {
    if (CamposVacios(txt, nombre)) {
        return true
    }
    return false
}
const ValidarCarrera = () => {
    carrera = txtcarrera.value
    if (carrera == "selecciona") {
        alert('Selecciona una carrera porfavor')
        return false
    }
    return true
}
const ValidaEdad = () => {
    if (ValidateNumber(txtedad, 'Edad')) {
        edad = parseInt(txtedad.value)
        if (edad > 17 && edad < 50) {
            return true
        }
        alert('La edad dede ser mayor a 17 y menor a 50')
        txtedad.innerText = ""
        txtedad.focus()
    }
    return false
}
const ValidateFecha = (txtfecha, nombre) => {
    if (ValidateTextos(txtfecha, nombre)) {
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
boton.addEventListener('click', (e) => {
    rid = ValidateNumber(txtid, 'Numero de control')
    rnombre = ValidateTextos(txtnombre, 'Nombre')
    rapellido = ValidateTextos(txtapellido, 'Apellido')
    rdomicilio = ValidateTextos(txtdomicilio, 'Domicilio')
    redad = ValidateNumber(txtedad, 'Edad')
    rtelefono = ValidateNumber(txttelefono, 'Telefono')
    rpadre = ValidateTextos(txtpadre, 'Padre o tutor')
    rcarrera = ValidarCarrera(txtcarrera, 'Carrera')
    rfechar = ValidateFecha(txtfecha_registro, 'Fecha de registro')
    rfechan = ValidateFecha(txtfecha_nacimiento, 'Fecha de nacimiento')
    restatura = validateFloat(txtestatura, 'Estatura')
    rpeso = validateFloat(txtpeso, 'Peso')
    if (rid == false || rnombre == false || rapellido == false || rdomicilio == false ||
        redad == false || rtelefono == false || rpadre == false || rcarrera == false ||
        rfechar == false || rfechan == false || restatura == false || rpeso == false
    ) {
        e.preventDefault()
    }
})
