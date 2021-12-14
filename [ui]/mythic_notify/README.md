# Mythic Notifications
A simple notification system inspired by NoPixel's

![Image of Notification](https://i.imgur.com/shT1XWc.png)

## Use
To display a notification simply make a call like below (Client-Side) :

```lua
exports['mythic_notify']:SendAlert('type', 'message')
```

### Notification Styles
* Inform - 'inform'
* Error - 'error'
* Success - 'success'

### Client-Side Functions (All Exported)
* SendAlert ( type, text, length, style ) | Displays Standard Alert For Provided Time. Length & Style are both optional, if no length is passed it defaults to 2500ms or 2.5s. If no style is passed it will use the style of the passed alert type
* SendUniqueAlert ( id, type, text, length, style ) | Displays Standard Alert For Provided Time. Requires a unique ID to be passed, if an alert already exists with that ID it will simply update the existing alert and refresh the timer for the passed time. Allows you to prevent a massive amount of alerts being spammed.
* PersistentAlert ( action, id, type, text, style ) | Displays an alert that will persist on the screen until function is called again with end action.

### Client Events (Trigger Notification From Server)
* mythic_notify:client:SendAlert OBJECT { type, text, duration } - If no duration is given, will default to 2500ms
* mythic_notify:client:PersistentAlert OBJECT { action, id, type, text } - Note: If using end action, type & text can be excluded)

### Persistent Notifications Actions -
* start - ( id, type, text, style ) - Additionally, you can call PersistentAlert with the start action and pass an already existing ID to update the notification on the screen.
* end - ( id )

> Note About ID: This is expected to be an entirely unique value that your resource is responsible for tracking. I’d suggest using something related to your resource name so there’s no chance of interferring with any other persistent notifications that may exist.

### Custom Style Format -
The custom style is a simple array in key, value format where the key is the CSS style attribute and the value is whatever you want to set that CSS attribute to.

#### Examples -
##### Client:
```LUA
exports['mythic_notify']:SendAlert('inform', 'Hype! Custom Styling!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
```

##### Server:
```LUA
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Hype! Custom Styling!', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
```

> Note: When calling through the event, you can omit the length parameter and the alert will default to 2500 ms or ~2.5 seconds

##### Result:
![Custom Styling](https://i.imgur.com/FClWCqm.png)