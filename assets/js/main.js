function goatCounterBlocked() {
    div = document.getElementById("counterBlocked");
    div.style.display = "block";
}
window.goatcounter = {
    error_callback: goatCounterBlocked,
}
