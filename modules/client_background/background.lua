-- private variables
local background
local clientVersionLabel

-- public functions
function init()
    background = g_ui.displayUI('background')
    background:lower()

    clientVersionLabel = background:getChildById('clientVersionLabel')
    clientVersionLabel:setText(g_app.getName() .. '\n' .. 'Vers�o: 5.0.1\n' .. 'Built on ' ..
   g_app.getBuildDate() .. '\n By L3K0T.')

   if not g_game.isOnline() then
        addEvent(function()
            g_effects.fadeIn(clientVersionLabel, 1500)
       end)
    end

    connect(g_game, {
        onGameStart = hide
    })
    connect(g_game, {
        onGameEnd = show
    })
end

function terminate()
    disconnect(g_game, {
        onGameStart = hide
    })
    disconnect(g_game, {
        onGameEnd = show
    })

    g_effects.cancelFade(background:getChildById('clientVersionLabel'))
    background:destroy()

    background = nil
    clientVersionLabel = nil
end

function hide()
    background:hide()
end

function show()
    background:show()
end

function hideVersionLabel()
    background:getChildById('clientVersionLabel'):hide()
end

function setVersionText(text)
    clientVersionLabel:setText(text)
end

function getBackground()
    return background
end
