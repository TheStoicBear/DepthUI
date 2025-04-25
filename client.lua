local hologramsData = {
    -- {
    --     coords = vector3(-545.6287, -212.2639, 37.6498),
    --     displayRange = 10.0,
    --     textLines = {
    --         "FivePD: Basic Controls",
    --         "F11 - Open duty menu",
    --         "Y - Accept callout or backup request",
    --         "Z - Open callout menu",
    --         "G - Open dispatch & scene management menu",
    --         "Press and hold E - Stop ped",
    --         "LSHIFT + E - Place spike strips near vehicle trunk"
    --     }
    -- },

    {
        coords = vector3(-545.6287, -212.2639, 37.6498),
        displayRange = 10.0,
        textLines = {
            "🎯 DepthUI Showcase",
            "👋 Welcome to the DepthUI system!",
            "",
            "🔹 Dynamic 3D text that only appears when you're nearby.",
            "🔹 Fully customizable lines, locations, and distance.",
            "🔹 Perfect for tutorials, guides, or interaction zones.",
            "",
            "📍 You’re within 10 meters of this UI trigger zone.",
            "🚶‍♂️ Move out of range to hide this text automatically."
        }
    },
    {
        coords = vector3(-540.73, -221.47, 37.65),
        displayRange = 10.0,
        textLines = {
            "🛠️ DepthUI: How It Works",
            "",
            "📌 Triggers based on player position (coords + range).",
            "🧠 Runs client-side for performance and flexibility.",
            "🎨 All lines fully customizable — emojis, colors, spacing.",
            "🔄 Supports updates and reloading without restarts.",
            "",
            "📍 You are inside a DepthUI activation zone."
        }
    },
    {
        coords = vector3(-532.3254, -216.6996, 37.6497),
        displayRange = 10.0,
        textLines = {
            "🔧 DepthUI Configuration Tips",
            "",
            "🗺️ Use vector3 coords to place UI where you want.",
            "📏 'displayRange' controls how close players must be.",
            "💬 'textLines' accepts multiple strings — line by line.",
            "📁 Can be used with multiple zones at once.",
            "",
            "✅ Easy to implement in any server-side script."
        }
    },
    {
        coords = vector3(-537.6885, -207.8412, 37.6498),
        displayRange = 10.0,
        textLines = {
            "🌐 Super EASY TO USE!",
            "",
            "📍 Use for in-world guides and interactive zones.",
            "🎮 Great for tutorials, roleplay jobs, or shops.",
            "🔒 Can show different UIs per player or permission.",
            "🧩 Integrates with menus, events, or jobs easily.",
            "",
            "👀 Visual, immersive, and user-friendly by design."
        }
    }
    
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local activeHolograms = {}

        for i, holo in ipairs(hologramsData) do
            local distance = #(playerCoords - holo.coords)
            if distance < holo.displayRange then
                local onScreen, screenX, screenY = World3dToScreen2d(holo.coords.x, holo.coords.y, holo.coords.z)
                if onScreen then
                    table.insert(activeHolograms, {
                        x = screenX,
                        y = screenY,
                        textLines = holo.textLines
                    })
                end
            end
        end

        SendNUIMessage({
            action = "update",
            holograms = activeHolograms
        })
    end
end)



local isPlayingAnim = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, 47) then -- G Key
            if not isPlayingAnim then
                isPlayingAnim = true
                local playerPed = PlayerPedId()
                RequestAnimDict("random@arrests")
                while not HasAnimDictLoaded("random@arrests") do
                    Citizen.Wait(100)
                end
                TaskPlayAnim(playerPed, "random@arrests", "generic_radio_chatter", 8.0, -8.0, -1, 49, 0, false, false, false)
            end
        else
            if isPlayingAnim then
                isPlayingAnim = false
                ClearPedTasks(PlayerPedId())
            end
        end
    end
end)