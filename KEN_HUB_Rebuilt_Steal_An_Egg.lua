--[[
    KEN HUB | Rebuilt Steal An Egg Hub

    Rebuilt from the uploaded legacy Steal An Egg implementation.
    The game-specific feature logic is retained as the source of behavior;
    the visible branding is KEN HUB.

    Note:
    Executor bootstrap / anti-detection portions from the legacy file are
    intentionally not included in this rebuild.
]]

local WindUI_VERSION = "1.6.66"
local okWindUI, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. WindUI_VERSION .. "/main.lua"))()
end)
if not okWindUI or not WindUI then
    error("LSS: Failed to download WindUI " .. WindUI_VERSION)
end
pcall(function() WindUI:SetNotificationLower(true) end)
LSS_BOOT_PANEL("LSS", "WindUI loaded, building UI...")
local LSS_TEXT = {
    ["LSS"] = "LSS",
    ["LSS | KEN HUB"] = "KEN HUB",
    ["Eggs"] = "Eggs",
    ["Steal, hatch & plant"] = "Steal, place and hatch eggs",
    ["Base"] = "Base",
    ["Base / Plot"] = "Base / Plot",
    ["Homestead & training"] = "Base and pets",
    ["Combat"] = "Combat",
    ["Bat, slaps & defense"] = "Bat, aura and defense",
    ["Player"] = "Player",
    ["Movement & teleports"] = "Movement and teleports",
    ["Settings"] = "Settings",
    ["Configs & unloader"] = "Configs and unload script",
    ["Auto Steal"] = "Auto Steal Eggs",
    ["Auto Hatch & Plant"] = "Auto Hatch and Plant",
    ["Egg Tracker ESP"] = "Egg ESP",
    ["Auto Steal Eggs"] = "Auto Steal Eggs",
    ["Tween Glide"] = "Smooth Glide",
    ["Fly Glide"] = "Free Fly",
    ["Safe Walk"] = "Safe Walk",
    ["Rare Egg Hunter (Highest Rarity First)"] = "Prioritize highest value eggs",
    ["Money Hunter (Highest Money First)"] = "Prioritize highest money eggs",
    ["Filter by Rarity (Multi-Select)"] = "Filter by rarity",
    ["Filter by Area (Multi-Select)"] = "Filter by area",
    ["Filter by Mutation (Multi-Select)"] = "Filter by mutation",
    ["Glide / Travel Speed"] = "Glide / travel speed",
    ["Steal Delay Gap"] = "Delay between steals",
    ["Steal Best Available Egg Once"] = "Steal best egg once",
    ["Auto Hatch Ready Eggs"] = "Auto hatch ready eggs",
    ["Auto Place Egg (Base Pen)"] = "Auto place egg at base",
    ["Hatch Check Delay"] = "Hatch check delay",
    ["Hatch All Ready Eggs Now"] = "Hatch all ready eggs now",
    ["Place Carried Eggs in Pen Now"] = "Place carried eggs now",
    ["Egg ESP Enabled"] = "Enable egg ESP",
    ["Show 3D Pet Image Badges"] = "Show 3D pet images",
    ["Trap ESP (Highlights Enemy Traps)"] = "Enemy trap ESP",
    ["Show Mutated / Rare Eggs Only"] = "Show rare / mutated eggs only",
    ["Max ESP Distance"] = "Max ESP distance",
    ["Homestead & Treadmill"] = "Base and Treadmill",
    ["Pets & Satchel"] = "Pets and Satchel",
    ["Auto Sell"] = "Auto Sell",
    ["Events & Bosses"] = "Events and Bosses",
    ["Claim Rewards"] = "Claim Rewards",
    ["Auto Upgrade Base / Plot"] = "Auto upgrade base / plot",
    ["Auto Upgrade Treadmill Tier"] = "Auto upgrade treadmill",
    ["Auto Buy Speed Trails"] = "Auto buy speed trails",
    ["Upgrade Base Now"] = "Upgrade base now",
    ["Upgrade Treadmill Now"] = "Upgrade treadmill now",
    ["Auto Equip Best Pets"] = "Auto equip best pets",
    ["Equip Best Pets Now"] = "Equip best pets now",
    ["Auto Sell Low-Tier Pets"] = "Auto sell low-tier pets",
    ["Filter Pet Sell Rarities"] = "Pet rarities to sell",
    ["Auto Sell Low-Tier Eggs"] = "Auto sell low-tier eggs",
    ["Filter Egg Sell Rarities"] = "Egg rarities to sell",
    ["Sell Selected Pets Now"] = "Sell selected pets now",
    ["Sell Selected Eggs Now"] = "Sell selected eggs now",
    ["FULL AUTO Boss Fight (Join + Fight + Dodge + Claim)"] = "Full auto boss: join, fight, dodge, claim",
    ["Boss Targeting"] = "Boss targeting",
    ["Crystals First"] = "Crystals first",
    ["Boss First"] = "Boss first",
    ["Hazard Immunity (No Black Hole / Trap Damage)"] = "Boss damage immunity",
    ["Auto Join Boss Arena (Every 30 min)"] = "Auto join Boss Arena",
    ["Auto Claim Boss Mastery Rewards"] = "Auto claim Boss Mastery rewards",
    ["Join Boss Arena Now"] = "Join Boss Arena now",
    ["Claim Boss Mastery Now"] = "Claim Boss Mastery now",
    ["Boss Arena Status"] = "Boss Arena status",
    ["Auto Claim Away Earnings & Codex"] = "Auto claim Away Earnings and Codex",
    ["Claim Away Earnings & Codex Now"] = "Claim Away Earnings and Codex now",
    ["Bat & Slap Aura"] = "Bat and slap aura",
    ["Defense & Guards"] = "Defense and guards",
    ["Bat / Slap Aura"] = "Bat / Slap Aura",
    ["Aura Radius"] = "Aura radius",
    ["Swing Delay"] = "Swing delay",
    ["Swing Bat Once (Manual)"] = "Swing bat once",
    ["Anti-Trap (Full Immunity / Destroy Hitboxes)"] = "Anti Trap",
    ["No Knockback / Ragdoll Immunity"] = "Anti knockback / ragdoll",
    ["Anti-Ragdoll (Quick Standup)"] = "Anti ragdoll",
    ["Movement"] = "Movement",
    ["Area Travel"] = "Area travel",
    ["Plot Travel"] = "Plot travel",
    ["Player Travel"] = "Player travel",
    ["Visuals & Performance"] = "Visuals and performance",
    ["Enable WalkSpeed"] = "Enable WalkSpeed",
    ["WalkSpeed Value"] = "WalkSpeed value",
    ["Enable JumpPower"] = "Enable JumpPower",
    ["JumpPower Value"] = "JumpPower value",
    ["Infinite Jump"] = "Infinite jump",
    ["Smooth Fly (WASD + Space/Shift)"] = "Smooth fly",
    ["Fly Speed"] = "Fly speed",
    ["Anti-AFK (Bypass 20min Kick)"] = "Anti AFK",
    ["Select Area"] = "Select area",
    ["Travel to Selected Area"] = "Travel to selected area",
    ["Select Plot"] = "Select plot",
    ["My Plot"] = "My plot",
    ["Travel to Plot"] = "Travel to plot",
    ["Select Player"] = "Select player",
    ["(no other players)"] = "(no other players)",
    ["Refresh Player List"] = "Refresh player list",
    ["Travel to Player"] = "Travel to player",
    ["Fullbright (Daylight Visuals)"] = "Fullbright",
    ["Delete Own Pet Renders (FPS Boost)"] = "Delete own pet renders",
    ["Configuration"] = "Configuration",
    ["Config Name"] = "Config name",
    ["Save Config"] = "Save config",
    ["Load Config"] = "Load config",
    ["Toggle UI Keybind"] = "Toggle UI keybind",
    ["Unload LSS"] = "Unload LSS",
    ["Version 4.2.2 (Production)\nEquipped with UGI / Client AC Neutralizer, BAC Telemetry Spoofer, Evidence Scrubber, Strict Rarity Filtering, clean open walkway travel without wall clipping, automatic return to trigger position, and auto egg placement in pen.\nAutomated egg stealing, hatching, homestead base upgrades, treadmill speed training, rewards collector, bat aura, ESP tracker."] = "Update"
}
for key, value in pairs({
    ["Secret"] = "Secret",
    ["Legendary"] = "Legendary",
    ["Epic"] = "Epic",
    ["Rare"] = "Rare",
    ["Common"] = "Common",
    ["Enabled"] = "Enabled",
    ["Disabled"] = "Disabled",
    ["Info"] = "Info",
    ["Success"] = "Success",
    ["Error"] = "Error",
    ["Tất cả"] = "All",
    ["Đã bỏ lọc"] = "Filter cleared",
    ["Đã chọn: "] = "Selected: ",
    ["Đã bỏ: "] = "Removed: ",
    ["Steal Egg"] = "Steal Egg",
    ["Auto Hatch"] = "Auto Hatch",
    ["Auto Place Egg"] = "Auto Place Egg",
    ["Hatch"] = "Hatch",
    ["Plant Eggs"] = "Plant Eggs",
    ["Egg ESP"] = "Egg ESP",
    ["Base Upgrade"] = "Base Upgrade",
    ["Treadmill Upgrade"] = "Treadmill Upgrade",
    ["Pets"] = "Pets",
    ["Sales"] = "Sales",
    ["Boss Auto"] = "Boss Auto",
    ["Boss Hazards"] = "Boss Hazards",
    ["Boss Arena"] = "Boss Arena",
    ["Boss Mastery"] = "Boss Mastery",
    ["Rewards"] = "Rewards",
    ["Bat Aura"] = "Bat Aura",
    ["Bat"] = "Bat",
    ["Anti-Trap"] = "Anti Trap",
    ["Knockback"] = "Knockback",
    ["WalkSpeed"] = "WalkSpeed",
    ["JumpPower"] = "JumpPower",
    ["Fly"] = "Fly",
    ["Travel"] = "Travel",
    ["Plot"] = "Plot",
    ["Players"] = "Players",
    ["Performance"] = "Performance",
    ["Config"] = "Config",
    ["Stealing target egg"] = "Stealing target egg",
    ["No matching egg found for selected filters"] = "No matching egg found for selected filters",
    ["Requested base upgrade"] = "Requested base upgrade",
    ["Requested treadmill upgrade"] = "Requested treadmill upgrade",
    ["Equipped best pets"] = "Equipped best pets",
    ["Sold matching pets"] = "Sold matching pets",
    ["Sold matching eggs"] = "Sold matching eggs",
    ["Fully automatic: joins, fights the Overlord and claims rewards"] = "Fully automatic: joins, fights the Overlord and claims rewards",
    ["Immune - hazard damage reports blocked"] = "Immune - hazard damage reports blocked",
    ["Normal hazard damage"] = "Normal hazard damage",
    ["Will join whenever the arena opens"] = "Will join whenever the arena opens",
    ["Sent to Abyss Overlord"] = "Sent to Abyss Overlord",
    ["Arena is closed - opens every 30 minutes"] = "Arena is closed - opens every 30 minutes",
    ["Nothing claimable yet"] = "Nothing claimable yet",
    ["Claimed all ready rewards and earnings"] = "Claimed all ready rewards and earnings",
    ["Triggered bat swing"] = "Triggered bat swing",
    ["Immunity Active (Enemy Hitboxes Destroyed)"] = "Immunity active, enemy hitboxes destroyed",
    ["Anti-Trap Disabled"] = "Anti Trap disabled",
    ["Ragdoll Immunity Active"] = "Ragdoll immunity active",
    ["Knockback Enabled"] = "Knockback enabled",
    ["Area position not found"] = "Area position not found",
    ["Plot not found"] = "Plot not found",
    ["Refreshed player list"] = "Refreshed player list",
    ["Player unavailable"] = "Player unavailable",
    ["Hazard immunity is not supported on mobile - the boss can still hit you"] = "Hazard immunity is not supported on mobile - the boss can still hit you",
    ["Auto Treadmill"] = "Auto Treadmill",
    ["Auto Upgrade Treadmill"] = "Auto upgrade treadmill",
    ["Anti Egg Drop "] = "Anti Egg Drop ",
    ["Rare Egg Hunter (Highest Rarity First)"] = "Prioritize highest rarity eggs",
    ["Filter by Rarity (Multi-Select)"] = "Filter by rarity",
    ["Filter by Area (Multi-Select)"] = "Filter by area",
    ["Filter by Mutation (Multi-Select)"] = "Filter by mutation",
    ["Glide / Travel Speed"] = "Glide / travel speed",
    ["Steal Delay Gap"] = "Delay between steals",
    ["Steal Best Available Egg Once"] = "Steal best egg once",
    ["Auto Hatch Ready Eggs"] = "Auto hatch ready eggs",
    ["Auto Place Egg (Base Pen)"] = "Auto place egg in pen",
    ["Hatch Check Delay"] = "Hatch check delay",
    ["Hatch All Ready Eggs Now"] = "Hatch all ready eggs now",
    ["Place Carried Eggs in Pen Now"] = "Place carried eggs in pen",
    ["Egg ESP Enabled"] = "Enable egg ESP",
    ["Show 3D Pet Image Badges"] = "Show 3D pet images",
    ["Trap ESP (Highlights Enemy Traps)"] = "Enemy trap ESP",
    ["Show Mutated / Rare Eggs Only"] = "Show rare / mutated eggs only",
    ["Max ESP Distance"] = "Max ESP distance",
    ["Auto Upgrade Base / Plot"] = "Auto upgrade base / plot",
    ["Auto Upgrade Treadmill Tier"] = "Auto upgrade treadmill tier",
    ["Auto Buy Speed Trails"] = "Auto buy speed trails",
    ["Upgrade Base Now"] = "Upgrade base now",
    ["Upgrade Treadmill Now"] = "Upgrade treadmill now",
    ["Equip Best Pets Now"] = "Equip best pets now",
    ["Auto Sell Low-Tier Pets"] = "Auto sell low-tier pets",
    ["Filter Pet Sell Rarities"] = "Filter pet rarities to sell",
    ["Auto Sell Low-Tier Eggs"] = "Auto sell low-tier eggs",
    ["Filter Egg Sell Rarities"] = "Filter egg rarities to sell",
    ["Sell Selected Pets Now"] = "Sell selected pets now",
    ["Sell Selected Eggs Now"] = "Sell selected eggs now",
    ["FULL AUTO Boss Fight (Join + Fight + Dodge + Claim)"] = "Full auto boss (join + fight + dodge + claim)",
    ["Boss Targeting"] = "Boss targeting",
    ["Hazard Immunity (No Black Hole / Trap Damage)"] = "Hazard immunity",
    ["Auto Join Boss Arena (Every 30 min)"] = "Auto join boss arena every 30 min",
    ["Auto Claim Boss Mastery Rewards"] = "Auto claim boss mastery rewards",
    ["Join Boss Arena Now"] = "Join boss arena now",
    ["Claim Boss Mastery Now"] = "Claim boss mastery now",
    ["Boss Arena Status"] = "Boss arena status",
    ["Auto Claim Away Earnings & Codex"] = "Auto claim away earnings and codex",
    ["Claim Away Earnings & Codex Now"] = "Claim away earnings and codex now",
    ["Bat / Slap Aura"] = "Bat / slap aura",
    ["Aura Radius"] = "Aura radius",
    ["Swing Delay"] = "Swing delay",
    ["Swing Bat Once (Manual)"] = "Swing bat once",
    ["Anti-Trap (Full Immunity / Destroy Hitboxes)"] = "Anti trap (full immunity / destroy hitboxes)",
    ["No Knockback / Ragdoll Immunity"] = "No knockback / ragdoll immunity",
    ["Anti-Ragdoll (Quick Standup)"] = "Anti ragdoll (quick standup)",
    ["Enable WalkSpeed"] = "Enable walkspeed",
    ["WalkSpeed Value"] = "Walkspeed value",
    ["Infinite Jump"] = "Infinite jump",
    ["Anti-AFK (Bypass 20min Kick)"] = "Anti AFK (bypass 20 min kick)",
    ["Select Area"] = "Select area",
    ["Travel to Selected Area"] = "Travel to selected area",
    ["Select Plot"] = "Select plot",
    ["Travel to Plot"] = "Travel to plot",
    ["Select Player"] = "Select player",
    ["Refresh Player List"] = "Refresh player list",
    ["Travel to Player"] = "Travel to player",
    ["Fullbright (Daylight Visuals)"] = "Fullbright",
    ["Ride Light Dark Guard (Real Movement)"] = "Ride Light Dark Guard (real movement)",
    ["Delete Own Pet Renders (FPS Boost)"] = "Delete own pet renders (FPS boost)",
    ["Shop"] = "Shop",
    ["Event"] = "Event",
    ["Settings"] = "Settings",
    ["Auto Steal"] = "Auto Steal",
    ["Auto Hatch & Plant"] = "Auto hatch and plant",
    ["Egg Tracker ESP"] = "Egg tracker ESP",
    ["Homestead & Treadmill"] = "Base and treadmill",
    ["Pets & Satchel"] = "Pets and satchel",
    ["Auto Sell"] = "Auto sell",
    ["Events & Bosses"] = "Events and bosses",
    ["Claim Rewards"] = "Claim rewards",
    ["Bat & Slap Aura"] = "Bat and slap aura",
    ["Defense & Guards"] = "Defense and guards",
    ["Movement"] = "Movement",
    ["Area Travel"] = "Area travel",
    ["Plot Travel"] = "Plot travel",
    ["Player Travel"] = "Player travel",
    ["Visuals & Performance"] = "Visuals and performance",
    ["Trail Shop"] = "Trail shop",
    ["Speed & Trail"] = "Speed and trail",
    ["Drone"] = "Drone",
}) do
    LSS_TEXT[key] = value
end
local function VI(text)
    if type(text) ~= "string" then return text end
    if LSS_TEXT[text] then return LSS_TEXT[text] end
    local patterns = {
        { "^Hatched (%d+) egg%(s%)$", "Hatched %1 egg(s)" },
        { "^Planted (%d+) egg%(s%) in pen$", "Planted %1 egg(s) in pen" },
        { "^Claimed (%d+) milestone reward%(s%)$", "Claimed %1 milestone reward(s)" },
        { "^OPEN %- (.+) HP$", "OPEN - %1 HP" },
        { "^Closed %- next in (.+)$", "Closed - next in %1" },
        { "^Traveling to (.+)$", "Traveling to %1" },
        { "^Arrived at (.+)$", "Arrived at %1" },
        { "^Removed (%d+) rendered pet model%(s%)$", "Removed %1 rendered pet model(s)" },
        { "^Saved config '(.+)'$", "Saved config '%1'" },
        { "^Save failed: (.+)$", "Save failed: %1" },
        { "^Loaded config '(.+)'$", "Loaded config '%1'" },
        { "^Load failed: (.+)$", "Load failed: %1" },
    }
    for _, item in ipairs(patterns) do
        local out, n = text:gsub(item[1], item[2])
        if n > 0 then return out end
    end
    return text
end
local function LSS_NOTIFY(title, content, dur)
    return
end
local LSS_CFG = {
    file = "LSS_SETTINGS.json",
    resumeFile = "LSS_RESUME.lua",
    controls = {}, data = {}, restoring = true, queued = false,
    autoResume = true, autoSave = true, pending = false,
}

local function LSS_CFG_Copy(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for k, v in pairs(value) do
        if type(k) == "string" or type(k) == "number" then
            if type(v) == "string" or type(v) == "boolean" or type(v) == "number" then
                copy[k] = v
            end
        end
    end
    return copy
end

function LSS_CFG.Read()
    if type(readfile) ~= "function" then return nil end
    local ok, config = pcall(function()
        local content = readfile(LSS_CFG.file)
        return game:GetService("HttpService"):JSONDecode(content)
    end)
    return ok and type(config) == "table" and config or nil
end

local initialConfig = LSS_CFG.Read()
if initialConfig then
    if type(initialConfig.values) == "table" then LSS_CFG.data = initialConfig.values end
    if type(initialConfig.autoResume) == "boolean" then LSS_CFG.autoResume = initialConfig.autoResume end
    if type(initialConfig.autoSave) == "boolean" then LSS_CFG.autoSave = initialConfig.autoSave end
end

function LSS_CFG.Save(force)
    if not force and not LSS_CFG.autoSave then return false, "Auto save is off" end
    if type(writefile) ~= "function" then return false, "Executor does not support writefile" end
    local payload = {
        version = 1,
        autoResume = LSS_CFG.autoResume,
        autoSave = LSS_CFG.autoSave,
        values = LSS_CFG.data,
    }
    local ok, err = pcall(function()
        local encoded = game:GetService("HttpService"):JSONEncode(payload)
        writefile(LSS_CFG.file, encoded)
    end)
    return ok, err
end

function LSS_CFG.MarkDirty()
    if LSS_CFG.restoring or not LSS_CFG.autoSave or LSS_CFG.pending then return end
    LSS_CFG.pending = true
    task.delay(0.8, function()
        LSS_CFG.pending = false
        if not HUB.dead then LSS_CFG.Save(false) end
    end)
end

function LSS_CFG.Option(opts, kind)
    opts = opts or {}
    local key = opts.Flag or (kind .. ":" .. tostring(opts.Name or opts.Title or opts.Label or ""))
    local saved = LSS_CFG.data[key]
    if kind == "toggle" then
        if type(saved) == "boolean" then opts.Default = saved end
    elseif kind == "slider" then
        if type(saved) == "number" and saved == saved then
            opts.Default = math.clamp(saved, tonumber(opts.Min) or 0, tonumber(opts.Max) or 100)
        end
    elseif kind == "multi" then
        if type(saved) == "table" then
            local available, filtered = {}, {}
            for _, option in ipairs(opts.Options or {}) do available[tostring(option)] = true end
            for _, option in ipairs(saved) do
                if available[tostring(option)] then filtered[#filtered + 1] = option end
            end
            opts.Default = filtered
        end
    elseif kind == "dropdown" then
        if type(saved) == "string" or type(saved) == "number" then
            for _, option in ipairs(opts.Options or opts.Items or {}) do
                if option == saved then opts.Default = saved; break end
            end
        end
    elseif kind == "input" then
        if type(saved) == "string" then opts.Default = saved end
    end
    local userCallback = opts.Callback
    opts.Callback = function(value, ...)
        local safeValue = LSS_CFG_Copy(value)
        if (type(safeValue) == "string" or type(safeValue) == "number"
            or type(safeValue) == "boolean" or type(safeValue) == "table")
            and not LSS_CFG.restoring then
            LSS_CFG.data[key] = safeValue
            LSS_CFG.MarkDirty()
        end
        if userCallback then return userCallback(value, ...) end
    end
    LSS_CFG.controls[key] = { kind = kind, apply = opts.Callback, default = opts.Default }
    return opts, key
end

function LSS_CFG.RegisterHandle(key, handle)
    if LSS_CFG.controls[key] then LSS_CFG.controls[key].handle = handle end
end

function LSS_CFG.RestoreAll()
    LSS_CFG.restoring = true
    for key, control in pairs(LSS_CFG.controls) do
        local value = LSS_CFG.data[key]
        if value == nil then value = control.default end
        if value ~= nil then
            pcall(control.apply, LSS_CFG_Copy(value))
            local handle = control.handle
            if handle and (control.kind == "toggle" or control.kind == "slider") then
                pcall(function()
                    if type(handle.SetValue) == "function" then handle:SetValue(value)
                    elseif type(handle.Set) == "function" then handle:Set(value) end
                end)
            end
        end
    end
    LSS_CFG.restoring = false
end

function LSS_CFG.LoadAndApply()
    local data = LSS_CFG.Read()
    if not data then return false, "Config not found or readfile not supported" end
    if type(data.values) == "table" then LSS_CFG.data = data.values end
    if type(data.autoResume) == "boolean" then LSS_CFG.autoResume = data.autoResume end
    if type(data.autoSave) == "boolean" then LSS_CFG.autoSave = data.autoSave end
    LSS_CFG.data.settings_resume = LSS_CFG.autoResume
    LSS_CFG.data.settings_autosave = LSS_CFG.autoSave
    LSS_CFG.RestoreAll()
    if LSS_CFG.autoResume then LSS_CFG.Queue() end
    return true
end

local LSS_RESUME_CODE = [==[
if not game:IsLoaded() then game.Loaded:Wait() end
local players = game:GetService("Players")
if not players.LocalPlayer then players:GetPropertyChangedSignal("LocalPlayer"):Wait() end
local permitted = false
if type(readfile) == "function" then
    local ok, config = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile("LSS_SETTINGS.json"))
    end)
    permitted = (not ok) or (type(config) == "table" and config.autoResume ~= false)
end
if permitted and type(readfile) == "function" and type(loadstring) == "function" then
    local ok, source = pcall(readfile, "LSS_RESUME.lua")
    if ok and type(source) == "string" then
        local fn = loadstring(source)
        if fn then fn() end
    end
end
]==]

function LSS_CFG.Queue()
    if LSS_CFG.queued or not LSS_CFG.autoResume then return LSS_CFG.queued end
    if type(readfile) ~= "function" or type(writefile) ~= "function" then return false end
    local executorQueue = queue_on_teleport or queueonteleport
    if type(executorQueue) ~= "function" then
        local synTable = (type(syn) == "table") and syn or nil
        executorQueue = synTable and synTable.queue_on_teleport
    end
    if type(executorQueue) ~= "function" then return false end
    local ok = pcall(executorQueue, LSS_RESUME_CODE)
    if ok then LSS_CFG.queued = true end
    return ok
end

LSS_CFG.Queue()

local function LSS_WRAP_TAB(rawTab)
    local tab = {}
    local function addElement(method, opts)
        opts = opts or {}
        local ok, handle = pcall(function() return rawTab[method](rawTab, opts) end)
        if not ok then
            LSS_NOTIFY("LSS", tostring(opts.Title or opts.Name or method) .. " UI error", 4)
            return {}
        end
        return handle or {}
    end

    function tab:AddSubTab(name)
        local ok, section = pcall(function()
            return rawTab:Section({Title = VI(name), Opened = true})
        end)
        if ok and section then return LSS_WRAP_TAB(section) end
        return tab
    end

    function tab:AddToggle(opts)
        opts = opts or {}
        local prefKey
        opts, prefKey = LSS_CFG.Option(opts, "toggle")
        local callback = opts.Callback
        local title = opts.Name
        local handle = addElement("Toggle", {
            Title = title, Desc = opts.Desc and VI(opts.Desc) or nil,
            Value = opts.Default == true, Flag = opts.Flag,
            Type = opts.Type or "Toggle",
            Callback = function(v) if callback then callback(v == true) end end,
        })
        handle.Get = handle.Get or function() return opts.Default == true end
        LSS_CFG.RegisterHandle(prefKey, handle)
        return handle
    end

    function tab:AddButton(opts)
        opts = opts or {}
        local callback = opts.Callback
        return addElement("Button", {
            Title = VI(opts.Name or opts.Title or "Button"),
            Desc = opts.Desc and VI(opts.Desc) or nil,
            Icon = opts.Icon, Color = opts.Color, Flag = opts.Flag,
            Callback = function() if callback then callback() end end,
        })
    end

    function tab:AddSlider(opts)
        opts = opts or {}
        local prefKey
        opts, prefKey = LSS_CFG.Option(opts, "slider")
        local callback = opts.Callback
        local title = VI(opts.Name or opts.Title or "Slider")
        local min = tonumber(opts.Min or (opts.Value and opts.Value.Min)) or 0
        local max = tonumber(opts.Max or (opts.Value and opts.Value.Max)) or 100
        local value = tonumber(opts.Default or (opts.Value and opts.Value.Default)) or min
        local handle = addElement("Slider", {
            Title = title, Desc = opts.Desc and VI(opts.Desc) or nil,
            Value = {Min = min, Max = max, Default = math.clamp(value, min, max)},
            Step = tonumber(opts.Step) or 1, Flag = opts.Flag,
            Callback = function(v) if callback then callback(tonumber(v) or value) end end,
        })
        LSS_CFG.RegisterHandle(prefKey, handle)
        return handle
    end

    local function makeDropdown(opts, multi)
        opts = opts or {}
        local kind = multi and "multi" or "dropdown"
        local prefKey
        opts, prefKey = LSS_CFG.Option(opts, kind)
        local callback = opts.Callback
        local title = VI(opts.Name or opts.Label or opts.Title or "Dropdown")
        local options = opts.Options or opts.Items or opts.Values or {}
        local current = multi and {} or (opts.Default or options[1])
        if multi then
            for _, v in ipairs(opts.Default or {}) do current[tostring(v)] = true end
        end
        local handle
        local wrapper = {}
        local function values()
            local result = {}
            for _, v in ipairs(options) do result[#result + 1] = tostring(v) end
            return result
        end
        local function emit(v)
            if multi then
                local selected = {}
                for _, x in ipairs(v or {}) do current[tostring(x)] = true; selected[#selected + 1] = x end
                if callback then callback(selected) end
            else
                current = v
                for _, x in ipairs(options) do if tostring(x) == tostring(v) then current = x; break end end
                if callback then callback(current) end
            end
        end
        local function build()
            local config = {
                Title = title, Values = values(), Multi = multi,
                AllowNone = multi or opts.AllowNone == true,
                SearchBarEnabled = opts.SearchBarEnabled == true, Flag = opts.Flag,
                Callback = emit,
            }
            if not multi and current ~= nil then config.Value = tostring(current) end
            handle = addElement("Dropdown", config)
        end
        build()
        wrapper.Get = function()
            if not multi then return current end
            local result = {}
            for _, v in ipairs(options) do if current[tostring(v)] then result[#result + 1] = v end end
            return result
        end
        wrapper.SetOptions = function(_, newOptions)
            options = newOptions or {}
            current = multi and {} or options[1]
            if handle and handle.Destroy then pcall(function() handle:Destroy() end) end
            build()
        end
        wrapper.Select = function(_, v)
            if handle and handle.Select then pcall(function() handle:Select(v) end) end
        end
        LSS_CFG.RegisterHandle(prefKey, wrapper)
        return wrapper
    end
    function tab:AddDropdown(opts) return makeDropdown(opts, false) end
    function tab:AddMultiDropdown(opts) return makeDropdown(opts, true) end

    function tab:AddInput(opts)
        opts = opts or {}
        local prefKey
        opts, prefKey = LSS_CFG.Option(opts, "input")
        local callback = opts.Callback
        local handle = addElement("Input", {
            Title = VI(opts.Name or opts.Title or "Input"),
            Placeholder = VI(tostring(opts.Placeholder or opts.Default or "")),
            Value = opts.Default, Callback = function(v) if callback then callback(v) end end,
        })
        LSS_CFG.RegisterHandle(prefKey, handle)
        return handle
    end
    function tab:AddKeybind(opts)
        opts = opts or {}
        return tab:AddButton({Name = opts.Name or "Toggle UI Keybind", Callback = opts.OnPress or opts.Callback})
    end
    function tab:AddDivider() pcall(function() rawTab:Divider() end) end
    function tab:AddParagraph(opts)
        opts = opts or {}
        pcall(function() rawTab:Paragraph({Title = VI(opts.Title or "LSS"), Desc = VI(opts.Content or "")}) end)
    end
    return tab
end

local okWindUIWindow, WindUIWindow = pcall(function()
    return WindUI:CreateWindow({
        Title = "KEN HUB",
        Icon = "egg",
        Author = "KEN",
        Background = "rbxassetid://76540510203010",
        BackgroundImageTransparency = 0.65,
        Theme = "Dark",
        ToggleKey = Enum.KeyCode.RightControl,
        Resizable = true,
        Size = UDim2.fromOffset(580, 460),
        MinSize = Vector2.new(560, 350),
        MaxSize = Vector2.new(850, 560),
        Transparent = true,
        SideBarWidth = 200,
        HideSearchBar = true,
        ScrollBarEnabled = false,
        User = {
            Enabled = true,
            Anonymous = false,
            Callback = function()
                print("clicked")
            end,
        },
    })
end)
if not okWindUIWindow or not WindUIWindow then
    error("LSS: WindUI CreateWindow error: " .. tostring(WindUIWindow))
end

task.spawn(function()
    local backgroundAsset = "rbxassetid://76540510203010"
    for _ = 1, 24 do
        pcall(function()
            local roots = {
                game:GetService("CoreGui"),
                game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui"),
            }
            for _, root in ipairs(roots) do
                if root then
                    for _, obj in ipairs(root:GetDescendants()) do
                        if obj:IsA("ImageLabel") then
                            local name = tostring(obj.Name):lower()
                            local image = tostring(obj.Image or "")
                            if image:find("76540510203010", 1, true)
                                or name:find("background", 1, true)
                                or name:find("backdrop", 1, true)
                            then
                                obj.Image = backgroundAsset
                                obj.Visible = true
                                obj.BackgroundTransparency = 1
                                obj.ImageTransparency = 0.35
                            end
                        end
                    end
                end
            end
        end)
        task.wait(0.35)
    end
end)
LSS_BOOT_PANEL("LSS", "WindUI built, loading tabs...")
local Library = {}
local LSS_CREATED_TABS = 0
function Library:CreateWindow()
    local win = {}
    function win:AddTab(opts)
        opts = opts or {}
        local okTab, rawTab = pcall(function()
            return WindUIWindow:Tab({Title = VI(opts.Name or "Tab"), Desc = opts.Subtitle, Icon = opts.Icon})
        end)
        if not okTab or not rawTab then
            LSS_NOTIFY("LSS", "Failed to create tab " .. tostring(opts.Name), 4)
            rawTab = {}
        else
            LSS_CREATED_TABS = LSS_CREATED_TABS + 1
        end
        return LSS_WRAP_TAB(rawTab)
    end
    function win:Notify(opts)
        opts = opts or {}
        pcall(function() WindUI:Notify({Title = opts.Title or "LSS", Content = opts.Content or "", Duration = opts.Duration or 3}) end)
    end
    function win:Toggle() pcall(function() WindUIWindow:Toggle() end) end
    function win:Destroy() pcall(function() WindUIWindow:Destroy() end) end
    return win
end

local Window = Library:CreateWindow()

local function LSS_BRANDED_ROOT(root)
    if not root then return false end
    local ok, descendants = pcall(function()
        return root:GetDescendants()
    end)
    if not ok or type(descendants) ~= "table" then return false end
    for _, d in ipairs(descendants) do
        if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
            local text = tostring(d.Text or "")
            if text:find("LSS", 1, true) or text:find("Steal", 1, true) then
                return true
            end
        end
    end
    return false
end

local function LSS_STROKE(frame, thickness)
    local stroke = frame:FindFirstChild("LSS_Stroke")
    if not stroke then
        stroke = Instance.new("UIStroke")
        stroke.Name = "LSS_Stroke"
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = frame
    end
    stroke.Thickness = thickness or 1.4
    stroke.Transparency = 0.08
    stroke.Color = Color3.fromRGB(150, 193, 255)
    local gradient = stroke:FindFirstChild("LSS_Gradient")
    if not gradient then
        gradient = Instance.new("UIGradient")
        gradient.Name = "LSS_Gradient"
        gradient.Parent = stroke
    end
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(245, 250, 255)),
        ColorSequenceKeypoint.new(0.34, Color3.fromRGB(92, 170, 255)),
        ColorSequenceKeypoint.new(0.68, Color3.fromRGB(138, 112, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(245, 250, 255)),
    })
    gradient.Rotation = (os.clock() * 36) % 360
end

local function LSS_STYLE_UI()
    local roots = {}
    local viewport = nil
    pcall(function()
        local cam = game:GetService("Workspace").CurrentCamera
        viewport = cam and cam.ViewportSize
    end)
    local function isOuterFrame(size)
        if not viewport then return false end
        return (size.X >= viewport.X * 0.82 and size.Y >= viewport.Y * 0.72) or size.Y >= viewport.Y * 0.92
    end
    local function collect(parent)
        if not parent then return end
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("ScreenGui") and LSS_BRANDED_ROOT(child) then
                table.insert(roots, child)
            end
        end
    end
    pcall(function() collect(game:GetService("CoreGui")) end)
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        collect(player and player:FindFirstChildOfClass("PlayerGui"))
    end)
    for _, root in ipairs(roots) do
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                local text = tostring(obj.Text or "")
                obj.TextColor3 = Color3.fromRGB(238, 244, 255)
                if obj:IsA("TextButton") and obj.AbsoluteSize.X >= 85 and obj.AbsoluteSize.Y >= 26 then
                    obj.BackgroundColor3 = Color3.fromRGB(19, 29, 51)
                    if obj.BackgroundTransparency < 0.92 then
                        LSS_STROKE(obj, 0.85)
                        obj.BackgroundTransparency = math.max(obj.BackgroundTransparency, 0.14)
                    end
                    if not obj:FindFirstChildOfClass("UICorner") then
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(0, 9)
                        corner.Parent = obj
                    end
                end
                if obj:IsA("TextBox") then
                    obj.PlaceholderColor3 = Color3.fromRGB(144, 157, 184)
                end
            elseif obj:IsA("ImageButton") then
                local label = string.lower(obj.Name or "")
                local asset = tostring(obj.Image or "")
                local size = obj.AbsoluteSize
                local isFloatingToggle = (label:find("toggle", 1, true) or label:find("mobile", 1, true))
                    and size.X >= 24 and size.X <= 105 and size.Y >= 24 and size.Y <= 105
                    and (asset:find("120164064781939", 1, true))
                if isFloatingToggle then
                    obj.Visible = false
                    obj.Active = false
                end
            elseif obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                local size = obj.AbsoluteSize
                local outerFrame = isOuterFrame(size)
                if outerFrame then
                    local stroke = obj:FindFirstChild("LSS_Stroke")
                    if stroke then stroke:Destroy() end
                end
                if obj.BackgroundTransparency < 1 then
                    if size.X >= 430 and size.Y >= 280 and not outerFrame then
                        obj.BackgroundColor3 = Color3.fromRGB(4, 8, 18)
                        obj.BackgroundTransparency = math.min(obj.BackgroundTransparency, 0.06)
                        LSS_STROKE(obj, 2)
                    elseif size.X >= 110 and size.Y >= 28 and not outerFrame then
                        obj.BackgroundColor3 = Color3.fromRGB(11, 18, 34)
                        obj.BackgroundTransparency = math.max(obj.BackgroundTransparency, 0.11)
                    end
                end
                if obj:IsA("ScrollingFrame") then
                    obj.ScrollBarImageColor3 = Color3.fromRGB(92, 170, 255)
                end
                if not outerFrame and not obj:FindFirstChildOfClass("UICorner") and size.X >= 70 and size.Y >= 24 then
                    local corner = Instance.new("UICorner")
                    corner.CornerRadius = UDim.new(0, size.X >= 430 and 12 or 8)
                    corner.Parent = obj
                end
            end
        end
    end
end

task.spawn(function()
    for _ = 1, 28 do
        pcall(LSS_STYLE_UI)
        task.wait(0.35)
    end
end)

local HAS_CONFIG = type(Library.SaveConfig) == "function"
    and type(Library.LoadConfig) == "function"
    and type(Library.ListConfigs) == "function"
local CONFIG_NAME = "LSS"

local dropdownResync = {}
local function registerResync(handle, applyFn)
    if handle and applyFn then
        table.insert(dropdownResync, function() applyFn(handle:Get()) end)
    end
end
local function ResyncAll()
    for _, fn in ipairs(dropdownResync) do pcall(fn) end
end

local Players             = game:GetService("Players")
local RS                  = game:GetService("ReplicatedStorage")
local ReplicatedStorage   = RS
local RunService          = game:GetService("RunService")
local UserInputService    = game:GetService("UserInputService")
local Workspace           = game:GetService("Workspace")
local Lighting            = game:GetService("Lighting")
local TeleportService     = game:GetService("TeleportService")
local VirtualUser         = game:GetService("VirtualUser")

local LP          = Players.LocalPlayer
local LocalPlayer = LP
local function GetCamera()
    return Workspace.CurrentCamera or Workspace:FindFirstChildOfClass("Camera")
end

pcall(function()
    local pps = game:GetService("ProximityPromptService")
    track(pps.PromptButtonHoldBegan:Connect(function(prompt, player)
        if player == LP and tostring(prompt) == "CarryAreaEgg" then
            prompt.HoldDuration = 0
        end
    end))
end)

pcall(function()
    local coreGui = game:GetService("CoreGui")
    track(coreGui.ChildAdded:Connect(function(child)
        if child.Name == "PurchasePrompt" then
            task.wait(0.04)
            pcall(function()
                local cancel = child:FindFirstChild("CancelButton", true)
                if cancel and typeof(cancel) == "Instance" and cancel:IsA("GuiButton") then
                    pcall(function() cancel.MouseButton1Click:Fire() end)
                end
            end)
        end
    end))
end)

local function Notify(title, content, kind, dur)
    return
end

local function safeCallback(fn)
    return function(...)
        local ok, err = pcall(fn, ...)
        if not ok then
            pcall(Notify, "LSS", "Error: " .. tostring(err), "Error", 4)
        end
    end
end


-- Legacy anti-detection section omitted from KEN HUB rebuild.
