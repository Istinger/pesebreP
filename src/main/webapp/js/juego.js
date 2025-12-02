/* ============================================================
   🎮 SISTEMA HÍBRIDO: DRAG & DROP (PC) + TAP (MÓVIL)
============================================================ */

/* === VARIABLES === */
let puntaje = 0;
let piezasCorrectas = 0;
let totalCorrectas = window.totalCorrectasJuego || 8;

let posicionIndex = 0;
const maqueta = document.getElementById("maqueta");

/* Detectar móvil */
const esMovil = /Android|iPhone|iPad|iPod/i.test(navigator.userAgent);

/* ============================================================
   📌 POSICIÓN AUTOMÁTICA PARA TAP
============================================================ */
function obtenerPosicionAutomatica() {
    const columnas = 4;
    const px = 120;
    const py = 120;

    let fila = Math.floor(posicionIndex / columnas);
    let col = posicionIndex % columnas;

    posicionIndex++;

    return { left: col * px + 30, top: fila * py + 30 };
}

/* ============================================================
   📌 COLAR PIEZA (USADO EN TAP Y DRAG)
============================================================ */
function colocarPiezaFinal(id, correcta, posX = null, posY = null) {

    let original = document.getElementById(id);
    if (!original || original.dataset.used === "true") return;

    original.dataset.used = "true";

    let copia = original.cloneNode(true);
    copia.classList.remove("pieza-img");
    copia.classList.add("pieza-colocada");
    copia.draggable = false;

    let pos;

    if (posX !== null && posY !== null) {
        pos = { left: posX, top: posY };
    } else {
        pos = obtenerPosicionAutomatica();
    }

    copia.style.position = "absolute";
    copia.style.left = pos.left + "px";
    copia.style.top = pos.top + "px";

    maqueta.appendChild(copia);

    /* === PUNTAJE === */
    if (correcta === true || correcta === "true") {
        puntaje += 20;
        piezasCorrectas++;
    } else {
        puntaje -= 15;
        if (puntaje < 0) puntaje = 0;   // nunca negativo
    }

    document.getElementById("score").innerText = puntaje;

    if (piezasCorrectas === totalCorrectas) terminarJuego();
}

/* ============================================================
   📱 TAP EN MÓVIL
============================================================ */
document.querySelectorAll(".pieza-img").forEach(pieza => {

    if (esMovil) { // solo activar tap en móviles
        pieza.addEventListener("touchstart", e => {
            e.preventDefault();
            colocarPiezaFinal(
                pieza.id,
                pieza.dataset.correcta
            );
        });
    }

    // Tap en desktop (opcional)
    pieza.addEventListener("click", () => {
        if (esMovil) return; // evitar doble función
        colocarPiezaFinal(
            pieza.id,
            pieza.dataset.correcta
        );
    });
});


/* ============================================================
   🖱 DRAG & DROP - SOLO PC
============================================================ */
function allowDrop(ev) {
    if (!esMovil) ev.preventDefault();
}

function drag(ev) {
    if (!esMovil) {
        ev.dataTransfer.setData("pieza", ev.target.id);
        ev.dataTransfer.setData("correcta", ev.target.dataset.correcta);
    }
}

function drop(ev) {
    if (esMovil) return;
    ev.preventDefault();

    let id = ev.dataTransfer.getData("pieza");
    let correcta = ev.dataTransfer.getData("correcta");

    colocarPiezaFinal(
        id,
        correcta,
        ev.offsetX - 60,
        ev.offsetY - 60
    );
}

/* ============================================================
   TIEMPO
============================================================ */
let tiempo = 30;
let timer = setInterval(() => {
    tiempo--;
    document.getElementById("tiempo").innerText = tiempo;
    if (tiempo <= 0) terminarJuego();
}, 1000);

/* ============================================================
   FINAL DEL JUEGO
============================================================ */
function terminarJuego() {
    clearInterval(timer);
    document.getElementById("puntajeFinal").innerText = puntaje;
    document.getElementById("panelFinal").style.display = "flex";
}

/* ============================================================
   GUARDAR PUNTAJE
============================================================ */
function guardarPuntaje(idUser) {
    window.location.href = "guardarPuntaje.jsp?puntaje=" + puntaje + "&id_us=" + idUser;
}
