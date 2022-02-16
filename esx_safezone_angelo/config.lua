Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {}

Config.Coords = { --Coords
    { ['x'] = -254.27, ['y'] = -981.31, ['z'] = 31.22 }, --JobCenter Area

}

Config.CoordsBlips = { --Coords BLIPS
    { ['x'] = -254.27, ['y'] = -981.31, ['z'] = 31.22 }, --Jobcenter BLIP
}

Config.BlipColour = 25
Config.BlipSprite = 367

Strings = {
    ['blip_text'] = 'Safe zone', --Blip
    ['screen_text'] = 'SafeZone', --Screen Text 
    ['notification_text'] = 'You are in a safe zone', --notification_text text
    ['notification_text2'] = 'You left the safe zone', --notification_text text
}

Config.ESX = 'esx:getSharedObject' --Modify this if required - ESX ONLY
Config.ESXJOB = 'esx:setJob' --Modify this if required - ESX ONLY

--jobs that ignore the safe zone
Config.AllowedJobs1 = 'insertyourjob' --Example 'police'
Config.AllowedJobs2 = 'insertyourjob'
Config.AllowedJobs3 = 'insertyourjob'
Config.AllowedJobs4 = 'insertyourjob'
Config.AllowedJobs5 = 'insertyourjob'
--jobs that ignore the safe zone


--Color configuration (RGB AND OPACITY)
Config.R = 222
Config.G = 222
Config.B = 222
Config.Opacity = 500
--Color configuration (RGB AND OPACITY)


--Position of text 
Config.width = 0.976
Config.height = 0.500
--Position of text 


--DONT TOUCH
Config.Weapon = 'WEAPON_UNARMED'
--DONT TOUCH