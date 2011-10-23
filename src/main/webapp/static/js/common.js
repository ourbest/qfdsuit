function dateFormatter(val) {
    var d = new Date();
    if (!val) {
        d.setTime(parseInt(val));
    }
    return d.toISOString();
}