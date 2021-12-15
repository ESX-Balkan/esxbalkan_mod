var radioOn = false

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "openradio") {
            $("body").css("display", event.data.enable ? "block" : "none");
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://esxbalkan_radio/close', JSON.stringify({}));
        }
    };

    $("#freqform").submit(function(e) {
        e.preventDefault();
        $.post('https://esxbalkan_radio/joinChannel', JSON.stringify({
            channel: $("#channel").val()
        }));
    });
});

function OnOff() {
    if (radioOn) {
        radioOn = false;
        $(".screen").css("display", "none");
        $("#radioimage").attr("src","radiooff.png");
        $.post('https://esxbalkan_radio/leaveChannel', JSON.stringify({}));
    } else {
        radioOn = true;
        $("#radioimage").attr("src","radio.png");
        $.post('https://esxbalkan_radio/radioOn', JSON.stringify({}));
        setTimeout(function() {
            if (radioOn) {
                $(".screen").css("display", "block");
            };
        }, 1000);
    };
};

function VolUp() {
    $.post('https://esxbalkan_radio/VolUp', JSON.stringify({}));
};

function VolDown() {
    $.post('https://esxbalkan_radio/VolDown', JSON.stringify({}));
};

function setTwoNumberDecimal() {
    $("#channel").val(parseFloat($("#channel").val()).toFixed(2));
}