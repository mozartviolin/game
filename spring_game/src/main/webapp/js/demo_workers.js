

var i = 0;

function timedCount() {
    i = i + 1;
    t=(i/100);
    postMessage(t);
    setTimeout("timedCount()",500);
}

timedCount();