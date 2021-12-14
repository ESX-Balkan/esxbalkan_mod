-- Anti AFK

RegisterServerEvent("mina_glavna:afk")
AddEventHandler("mina_glavna:afk", function()
  DropPlayer(source, "Izbačeni ste jer se niste pomerali.")
end)