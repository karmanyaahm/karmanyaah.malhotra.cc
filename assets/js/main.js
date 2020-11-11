function goatCounterBlocked() {
    console.log('blocked called');
    div = document.getElementById("counterBlocked");
    div.style.display = "block";
}
window.goatcounter = {
    error_callback: goatCounterBlocked,
}
