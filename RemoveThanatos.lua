ModUtil.RegisterMod("RemoveThanatos")

local config = {
    -- If RemoveThanatos is true, Thanatos will never appear
    RemoveThanatos = true,
}

ModUtil.LoadOnce( function()
    if config.RemoveThanatos then
        ModUtil.MapSetTable(EncounterData.BaseThanatos, {
            MaxThanatosSpawnsThisRun = 0,
        })
    end    
end)

-- Scripts/RoomManager.lua : 1874
ModUtil.WrapBaseFunction("StartRoom", function ( baseFunc, currentRun, currentRoom )
    PrintUtil.showModdedWarning()

    baseFunc(currentRun, currentRoom)
end, MinibossControl)

-- Scripts/UIScripts.lua : 145
ModUtil.WrapBaseFunction("ShowCombatUI", function ( baseFunc, flag )
    PrintUtil.showModdedWarning()

    baseFunc(flag)
end, MinibossControl)
