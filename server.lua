-- Exotic's Weapons Version 1.0 Beta
--
-- Copyright (c) 2021 Exotic804.  All rights reserved.
--
-- This project is licensed under the following:
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to use, copy, modify, and merge the software, under the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. THE SOFTWARE MAY NOT BE SOLD.
--

local Flashlights = {}

AddEventHandler('playerDropped', function ()
    if Flashlights[source] then Flashlights[source] = nil end
end)

RegisterServerEvent('Weapons:Server:Toggle')
AddEventHandler('Weapons:Server:Toggle', function(bool, flashlight, weapon)
    if bool then
        Flashlights[source] = {flashlight, weapon}
    else
        Flashlights[source] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        TriggerClientEvent('Weapons:Client:Return', -1, Flashlights)
    end
end)
