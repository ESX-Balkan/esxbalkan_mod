var notifs = {}

window.addEventListener('message', function (event) {
    ShowNotif(event.data);
});

function CreateNotification(data) {
    let $notification = $(document.createElement('div'));
    $notification.addClass('notification').addClass(data.type);
    $notification.html(data.text);
    $notification.fadeIn();
    if (data.style !== undefined) {
        Object.keys(data.style).forEach(function(css) {
            $notification.css(css, data.style[css])
        });
    }

    return $notification;
}

function UpdateNotification(data) {
    let $notification = $(notifs[data.id])
    $notification.addClass('notification').addClass(data.type);
    $notification.html(data.text);

    if (data.style !== undefined) {
        Object.keys(data.style).forEach(function(css) {
            $notification.css(css, data.style[css])
        });
    }
}

function ShowNotif(data) {
    if (data.persist != null) {
        if (data.persist.toUpperCase() == 'START') {
            if (notifs[data.id] === undefined) {
                let $notification = CreateNotification(data);
                $('.notif-container').append($notification);
                notifs[data.id] = {
                    notif: $notification  
                };
            } else {
                UpdateNotification(data);
            }
        } else if (data.persist.toUpperCase() == 'END') {
            if (notifs[data.id] != null) {
                let $notification = $(notifs[data.id].notif);
                $.when($notification.fadeOut()).done(function() {
                    $notification.remove();
                    delete notifs[data.id];
                });
            }
        }
    } else {
        if (data.id != null) {
            if (notifs[data.id] === undefined) {
                let $notification = CreateNotification(data);
                $('.notif-container').append($notification);
                notifs[data.id] = {
                    notif: $notification,
                    timer: setTimeout(function() {
                        let $notification = notifs[data.id].notif;
                        $.when($notification.fadeOut()).done(function() {
                            $notification.remove();
                            clearTimeout(notifs[data.id].timer);
                            delete notifs[data.id];
                        });
                    }, data.length != null ? data.length : 2500)
                };
            } else {
                clearTimeout(notifs[data.id].timer);
                UpdateNotification(data);

                notifs[data.id].timer = setTimeout(function() {
                    let $notification = notifs[data.id].notif;
                    $.when($notification.fadeOut()).done(function() {
                        $notification.remove();
                        clearTimeout(notifs[data.id].timer);
                        delete notifs[data.id];
                    });
                }, data.length != null ? data.length : 2500)
            }
        } else {
            let $notification = CreateNotification(data);
            $('.notif-container').append($notification);
            setTimeout(function() {
                $.when($notification.fadeOut()).done(function() {
                    $notification.remove()
                });
            }, data.length != null ? data.length : 2500);
        }
    }
}