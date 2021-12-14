$(document).ready(function(){

var play = false;
var myAudio = document.getElementById("statusAudio");

myAudio.volume = 0.1;
function onKeyDown(event) {
	switch (event.keyCode) {
		case 32:
			if (play) {
				myAudio.pause();
				play = false;
			} else {
				myAudio.play();
				play = true;
			}
			break;
	}
  return false;
}

window.addEventListener("keydown", onKeyDown, false);

var count = 0;
var thisCount = 0;

 $("#js-rotating").Morphext({
	separator: ";",
	speed: "7000",
	animation: "fadeIn",
 });

 const handlers = {
	startInitFunctionOrder(data) {
		count = data.count;
	},
	initFunctionInvoking(data) {
		document.querySelector('.progress-bar').style.left = '0%';
		document.querySelector('.progress-bar').style.width = ((data.idx / count) * 100) + '%';
	},
	startDataFileEntries(data) {
		count = data.count;
	},
	performMapLoadFunction(data) {
		++thisCount;
		document.querySelector('.progress-bar').style.left = '0%';
		document.querySelector('.progress-bar').style.width = ((thisCount / count) * 100) + '%';
	},
};
	window.addEventListener('message', function (e) {
		(handlers[e.data.eventName] || function () { })(e.data);
	});
});