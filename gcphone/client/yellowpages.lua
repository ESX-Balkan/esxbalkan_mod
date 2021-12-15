RegisterNetEvent("gcPhone:yellow_getPosts")
AddEventHandler("gcPhone:yellow_getPosts", function(posts)
  SendNUIMessage({event = 'yellow_posts', posts = posts})
end)

RegisterNetEvent("gcPhone:yellow_getMyPosts")
AddEventHandler("gcPhone:yellow_getMyPosts", function(posts)
  SendNUIMessage({event = 'yellow_getMyPosts', posts = posts})
end)

RegisterNUICallback('yellow_getPosts', function(cb)
    TriggerServerEvent('gcPhone:yellow_getPosts')
end)

RegisterNUICallback('yellow_getMyPosts', function(cb)
  TriggerServerEvent('gcPhone:yellow_getMyPosts')
end)

RegisterNUICallback('yellow_toggleDeletePost', function(data, cb) 
  TriggerServerEvent('gcPhone:yellow_toggleDeletePost', data.id)
end)

RegisterNUICallback('yellow_postIlan', function(data, cb)
    TriggerServerEvent('gcPhone:yellow_postIlan', data.message, data.image)
end)

RegisterNetEvent("gcPhone:yellow_newPost")
AddEventHandler("gcPhone:yellow_newPost", function(post)
  SendNUIMessage({event = 'yellow_newPost', post = post})
end)