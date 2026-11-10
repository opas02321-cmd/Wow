--[[
    Deobfuscated: "Crimson Lua" (crimsonhook_lua_free)
    Recovered by decoding the layers and lifting the VM bytecode back to Lua.
    Fixed Syntax Error (Duplicate Section) for UI Loading.
]]
local v1 = nil
v1 = hookfunction(getrenv().setmetatable, newcclosure(function(arg1, arg2)
    if not (arg2 and typeof(arg2) == "table" and rawget(arg2, "__mode") == "kv") or not debug.traceback():find("MiscellaneousController") then
        return v1(arg1, arg2)
    else
        return v1({1, 2, 3}, {})
    end
end))
task.spawn(function()
    pcall(function()
        local function fn100(arg1)
            pcall(function()
                if arg1:IsA("LocalScript") or arg1:IsA("ModuleScript") then
                    local v48, v49 = pcall(function() return arg1.Name:lower() end)
                    if not v48 or not v49 then return end
                    local tbl16 = {"anticheat","ac","detection","ban","kick","security","moderation"}
                    for i3 = 1, #tbl16 do
                        if v49:find(tbl16[i3]) then
                            pcall(function() arg1.Disabled = true end)
                            break
                        end
                    end
                end
            end)
        end
        local children = game:GetDescendants()
        for i = 1, #children do fn100(children[i]) end
        game.DescendantAdded:Connect(fn100)
    end)
    pcall(function()
        local NetworkClient = game:GetService("NetworkClient")
        if NetworkClient then
            NetworkClient.ChildAdded:Connect(function(arg1)
                pcall(function()
                    local v50, v51 = pcall(function() return arg1.Name:lower() end)
                    if v50 and v51 and (v51:find("anticheat") or v51:find("detection")) then
                        pcall(function() arg1:Destroy() end)
                    end
                end)
            end)
        end
    end)
end)
local v2 = nil
pcall(function()
    v2 = Instance.new("RemoteEvent")
    v2.Name = "ClientAlert"
    v2.Parent = game.Players.LocalPlayer
end)
task.spawn(function()
    pcall(function()
        local localScript3 = game:GetService("ReplicatedFirst"):FindFirstChild("LocalScript3")
        if localScript3 then
            local v52 = getgc(false)
            for i4 = 1, #v52 do
                local v53 = v52[i4]
                if type(v53) ~= "function" then continue end
                local v54, v55 = pcall(getfenv, v53)
                if not (v54 and type(v55) == "table") then continue end
                local v56, v57 = pcall(function() return rawget(v55, "script") end)
                if not (v56 and v57 and typeof(v57) == "Instance" and (v57 == localScript3 or type(tostring(v57)) == "string" and tostring(v57):find("LoadingScreen"))) then
                    continue
                end
                local v58, v59 = pcall(debug.getconstants, v53)
                if v58 and type(v59) == "table" then
                    for i5 = 1, #v59 do
                        local v60 = v59[i5]
                        if type(v60) == "string" and (v60:find("TakeTheL") or v60:find("ban") or v60:find("kick")) then
                            pcall(function() hookfunction(v53, function() end) end)
                            break
                        end
                    end
                end
            end
        end
    end)
end)
repeat task.wait() until not game:IsLoaded()

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService2 = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

local tbl2 = { Dark = {
    TextColor=Color3.fromRGB(255,255,255), MainFrame=Color3.fromRGB(30,30,30),
    TabBackground=Color3.fromRGB(20,20,20), Tab=Color3.fromRGB(30,30,30),
    EnabledText=Color3.fromRGB(255,255,255), DisabledText=Color3.fromRGB(180,180,180),
    TabToggleEnabled=Color3.fromRGB(30,30,30), TabToggleDisabled=Color3.fromRGB(5,5,5),
    TabToggleDisabledMouseOver=Color3.fromRGB(20,20,20), Section=Color3.fromRGB(20,20,20),
    Button=Color3.fromRGB(30,30,30), ButtonMouseOver=Color3.fromRGB(40,40,40),
    ToggleEnabled=Color3.fromRGB(206,54,54), ToggleEnabledMouseOver=Color3.fromRGB(226,74,74),
    ToggleDisabled=Color3.fromRGB(30,30,30), ToggleDisabledMouseOver=Color3.fromRGB(40,40,40),
    Box=Color3.fromRGB(30,30,30), BoxFocused=Color3.fromRGB(40,40,40),
    Slider=Color3.fromRGB(30,30,30), SliderMouseOver=Color3.fromRGB(40,40,40),
    SliderFill=Color3.fromRGB(206,54,54), SliderFillSliding=Color3.fromRGB(226,74,74),
    Dropdown=Color3.fromRGB(30,30,30), DropdownMouseOver=Color3.fromRGB(40,40,40),
    DropdownContent=Color3.fromRGB(20,20,20), ColorPicker=Color3.fromRGB(20,20,20),
    ColorPickerBoxes=Color3.fromRGB(30,30,30), Border=Color3.fromRGB(50,50,50)
} }
local tbl = {flags = {}, toggled = true, keybind = Enum.KeyCode.RightShift, dragSpeed = 0.1, controls = {}}

local tbl4 = {
    starts_with = function(a,b) return a:sub(1,string.len(b)) == b end,
    create = function(className, props)
        local inst = Instance.new(className)
        inst.Name = ""
        for k = 1, 16 do inst.Name = inst.Name .. string.char(math.random(48,122)) end
        for k,v in pairs(props) do inst[k] = v end
        pcall(function() inst.BorderSizePixel = 0 end)
        pcall(function() inst.AutoButtonColor = false end)
        if className == "Frame" and props.BorderSizePixel == nil then
            inst.BorderSizePixel = 1
            inst.BorderColor3 = tbl2.Dark.Border
        end
        return inst
    end,
    tween = function(obj, params, goal, done)
        local tw = TweenService:Create(obj, TweenInfo.new(unpack(params)), goal)
        tw:Play()
        if done then tw.Completed:Connect(done) end
    end,
    ripple = function(btn)
        local frame = Instance.new("Frame")
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 256)
        frame.ZIndex = btn.ZIndex + 1
        frame.Parent = btn
        frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        frame.BackgroundTransparency = 0.4
        tbl4.tween(frame, {0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, btn.AbsoluteSize.X, 0, btn.AbsoluteSize.X),
            Position = UDim2.new(0.5, -btn.AbsoluteSize.X/2, 0.5, -btn.AbsoluteSize.X/2)
        }, function() frame:Destroy() end)
    end,
    drag = function(frame)
        local dragging, dragStart, startPos = false, nil, nil
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)
        frame.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end,
    get_center = function(x,y) return UDim2.new(0.5, -(x/2), 0.5, -(y/2)) end,
    hex_to_rgb = function(h) return Color3.fromRGB(tonumber("0x"..h:sub(2,3)), tonumber("0x"..h:sub(4,5)), tonumber("0x"..h:sub(6,7))) end,
    rgb_to_hex = function(c) return string.format("#%02X%02X%02X", math.clamp(c.R*255,0,255), math.clamp(c.G*255,0,255), math.clamp(c.B*255,0,255)) end,
    format_table = function(t)
        if not t then return {} end
        local store = {}; for k,v in pairs(t) do store[k:lower()] = v end
        local proxy = {}
        setmetatable(proxy, { __newindex = function(_,k,v) rawset(store, k:lower(), v) end, __index = function(_,k) return store[k:lower()] end })
        return proxy
    end
}
local screenGui = tbl4.create("ScreenGui", {})
if syn and syn.protect_gui then pcall(syn.protect_gui, screenGui) end
screenGui.Parent = CoreGui
tbl = tbl4.format_table(tbl)

tbl.Load = function(_, cfg)
    local c = tbl4.format_table(cfg)
    local sizeX, sizeY = 440, 480
    local theme = tbl2[c.theme] or tbl2.Dark
    
    local holder = tbl4.create("Frame", { Size = UDim2.new(0, sizeX, 0, 26), BackgroundTransparency = 1, Position = tbl4.get_center(sizeX, sizeY), BackgroundColor3 = Color3.fromRGB(255,255,255), Parent = screenGui })
    tbl4.create("TextLabel", { Size = UDim2.new(0, 1, 1, 0), BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), TextSize = 14, TextColor3 = theme.TextColor, Text = c.name, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 2, Parent = holder })
    tbl4.drag(holder)
    
    local window = tbl4.create("Frame", { Size = UDim2.new(1, 0, 0, sizeY), BackgroundColor3 = theme.MainFrame, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = holder })
    tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = window})
    local tabBg = tbl4.create("Frame", { ZIndex = 2, Size = UDim2.new(1, -16, 1, -34), Position = UDim2.new(0, 8, 0, 26), BackgroundColor3 = theme.TabBackground, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = window })
    tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = tabBg})
    
    local tabRow = tbl4.create("Frame", { Size = UDim2.new(1, -12, 0, 18), BackgroundTransparency = 1, Position = UDim2.new(0, 6, 0, 6), Parent = tabBg })
    tbl4.create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = tabRow })
    
    local tabBody = tbl4.create("Frame", { ZIndex = 4, Size = UDim2.new(1, -12, 1, -29), Position = UDim2.new(0, 6, 0, 24), BackgroundColor3 = theme.Tab, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = tabBg })
    tbl4.create("UICorner", {Parent = tabBody})
    local pageHolder = tbl4.create("Frame", { Size = UDim2.new(1, -12, 1, -12), BackgroundTransparency = 1, Position = UDim2.new(0, 6, 0, 6), BackgroundColor3 = Color3.fromRGB(20,20,20), Parent = tabBody })
    
    local api = tbl4.format_table({count = 0})
    api.Holder = holder; api.Window = window; api.Gui = screenGui

    api.Tab = function(_, tabName)
        api.count = api.count + 1
        local isFirst = api.count == 1
        local tabBtn = tbl4.create("TextButton", { ZIndex = 4, BackgroundColor3 = isFirst and theme.TabToggleEnabled or theme.TabToggleDisabled, Size = UDim2.new(0, 50, 1, 0), TextSize = 11, TextColor3 = isFirst and theme.EnabledText or theme.DisabledText, Text = tabName, Font = Enum.Font.Gotham, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = tabRow })
        tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = tabBtn})
        
        local page = tbl4.create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(255,255,255), Visible = isFirst, Parent = pageHolder })
        tbl4.create("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = page })
        
        local colL = tbl4.create("ScrollingFrame", { Size = UDim2.new(0.5, -2, 1, 0), BackgroundTransparency = 1, Active = true, ScrollBarThickness = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Parent = page })
        local layoutL = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = colL})
        layoutL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() colL.CanvasSize = UDim2.new(0, 0, 0, layoutL.AbsoluteContentSize.Y) end)
        
        local colR = tbl4.create("ScrollingFrame", { Size = UDim2.new(0.5, -2, 1, 0), BackgroundTransparency = 1, Active = true, ScrollBarThickness = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Parent = page })
        local layoutR = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = colR})
        layoutR:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() colR.CanvasSize = UDim2.new(0, 0, 0, layoutR.AbsoluteContentSize.Y) end)

        tabBtn.MouseButton1Click:Connect(function()
            for _, child in next, pageHolder:GetChildren() do if child ~= page then child.Visible = false end end
            page.Visible = true
            for _, child in next, tabRow:GetChildren() do if child:IsA("TextButton") and child ~= tabBtn then tbl4.tween(child, {0.2}, {TextColor3 = theme.DisabledText, BackgroundColor3 = theme.TabToggleDisabled}) end end
            tbl4.tween(tabBtn, {0.2}, {TextColor3 = theme.EnabledText, BackgroundColor3 = theme.TabToggleEnabled})
        end)

        local tabApi = tbl4.format_table({})
        tabApi.Section = function(_, sectCfg)
            local s = tbl4.format_table(sectCfg)
            local parent = (s.column == 2) and colR or colL
            local section = tbl4.create("Frame", { ZIndex = 5, Size = UDim2.new(1, 0, 0, 20), BackgroundColor3 = theme.Section, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = parent })
            tbl4.create("UICorner", {Parent = section})
            tbl4.create("TextLabel", { ZIndex = 6, Size = UDim2.new(0, 1, 0, 14), BackgroundTransparency = 1, Position = UDim2.new(0, 4, 0, 3), TextSize = 11, TextColor3 = theme.TextColor, Text = s.name, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = section })
            local content = tbl4.create("Frame", { Size = UDim2.new(1, -8, 1, -20), Position = UDim2.new(0, 4, 0, 20), BackgroundTransparency = 1, Parent = section })
            local contentLayout = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = content})
            contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() section.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y + 24) end)

            local sectApi = tbl4.format_table({})
            sectApi.Hide = function() section.Visible = false end
            sectApi.Show = function() section.Visible = true end

            sectApi.Button = function(_, btnCfg)
                local b = tbl4.format_table(btnCfg)
                local btn = tbl4.create("TextButton", { ZIndex = 6, Size = UDim2.new(1, 0, 0, 16), BackgroundColor3 = theme.Button, TextSize = 11, Text = b.name, TextColor3 = theme.TextColor, Font = Enum.Font.Gotham, ClipsDescendants = true, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = content })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = btn})
                btn.MouseButton1Click:Connect(function() if b.callback then b.callback() end; tbl4.ripple(btn) end)
                return tbl4.format_table({Hide = function() btn.Visible = false end, Show = function() btn.Visible = true end})
            end
            
            sectApi.Toggle = function(_, tglCfg)
                local t = tbl4.format_table(tglCfg)
                local flag, callback = t.flag, t.callback or function() end
                local state, hovered = false, false
                local btn = tbl4.create("TextButton", { Size = UDim2.new(1, 0, 0, 12), BackgroundTransparency = 1, Parent = content })
                local box = tbl4.create("Frame", { ZIndex = 6, Size = UDim2.new(0, 10, 0, 10), BackgroundColor3 = theme.ToggleDisabled, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = btn })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = box})
                local label = tbl4.create("TextLabel", { ZIndex = 6, Size = UDim2.new(0, 1, 0, 10), BackgroundTransparency = 1, Position = UDim2.new(1, 5, 0, 0), TextSize = 11, TextColor3 = theme.DisabledText, Text = t.name, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = box })
                local function setState(newState)
                    state = newState
                    tbl4.tween(label, {0.2}, {TextColor3 = state and theme.EnabledText or theme.DisabledText})
                    tbl4.tween(box, {0.2}, {BackgroundColor3 = state and (hovered and theme.ToggleEnabledMouseOver or theme.ToggleEnabled) or (hovered and theme.ToggleDisabledMouseOver or theme.ToggleDisabled)})
                    callback(state)
                    if flag then tbl.flags[flag] = state end
                end
                btn.MouseButton1Click:Connect(function() setState(not state) end)
                btn.MouseEnter:Connect(function() hovered = true; tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabledMouseOver or theme.ToggleDisabledMouseOver}) end)
                btn.MouseLeave:Connect(function() hovered = false; tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabled or theme.ToggleDisabled}) end)
                local api = tbl4.format_table({})
                api.Toggle = function(_, val) if state ~= val then setState(val) end end
                if flag then tbl.controls[flag] = api end
                return api
            end

            sectApi.Slider = function(_, sldCfg)
                local s = tbl4.format_table(sldCfg)
                local name, minV, maxV = s.name, s.min or 1, s.max or 100
                local dec, def = s.decimals or 0.1, s.default and math.clamp(s.default, s.min or 1, s.max or 100) or (s.min or 1)
                local valType, flag, callback = s.valueType or "/" .. tostring(maxV), s.flag, s.callback or function() end
                local hovered, sliding = false, false
                local container = tbl4.create("Frame", { ZIndex = 6, Size = UDim2.new(1, 0, 0, 16), ClipsDescendants = true, BackgroundColor3 = theme.Slider, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = content })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = container})
                local fill = tbl4.create("Frame", { ZIndex = 7, Size = UDim2.new((def - minV) / (maxV - minV), 0, 1, 0), BackgroundColor3 = theme.SliderFill, BorderSizePixel = 0, Parent = container })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = fill})
                local label = tbl4.create("TextLabel", { ZIndex = 8, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, TextSize = 11, TextColor3 = theme.TextColor, Text = name .. ": " .. def .. valType, Font = Enum.Font.Gotham, Parent = container })
                local function update(input)
                    local pct = math.clamp((input.Position.X - container.AbsolutePosition.X) / container.AbsoluteSize.X, 0, 1)
                    tbl4.tween(fill, {0.2}, {Size = UDim2.new(pct, 0, 1, 0)})
                    local val = math.floor(((maxV - minV) * pct + minV) * (dec * 10)) / (dec * 10)
                    label.Text = name .. ": " .. val .. valType
                    if flag then tbl.flags[flag] = val end
                    callback(val)
                end
                container.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then sliding = true; tbl4.tween(fill, {0.2}, {BackgroundColor3 = theme.SliderFillSliding}); update(input) end end)
                container.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then tbl4.tween(fill, {0.2}, {BackgroundColor3 = theme.SliderFill}); sliding = false; if not hovered then tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.Slider}) end end end)
                container.MouseEnter:Connect(function() hovered = true; tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.SliderMouseOver}) end)
                container.MouseLeave:Connect(function() hovered = false; if not sliding then tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.Slider}) end end)
                UserInputService.InputChanged:Connect(function(input) if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and sliding then update(input) end end)
                local api = tbl4.format_table({})
                api.Set = function(_, val) val = math.clamp(math.floor(val * (dec * 10)) / (dec * 10), minV, maxV); fill.Size = UDim2.new((val - minV) / (maxV - minV), 0, 1, 0); label.Text = name .. ": " .. val .. valType; if flag then tbl.flags[flag] = val end end
                if flag then tbl.controls[flag] = api end
                return api
            end

            sectApi.Dropdown = function(_, dropCfg)
                local d = tbl4.format_table(dropCfg)
                local default, contentList = d.default, d.content or {}
                local multi, flag, callback = d.multiChoice or false, d.flag, d.callback or function() end
                local selected, open, optionButtons, selectedMulti = default, false, {}, {}
                local isValidDefault = false
                for _, v in pairs(contentList) do if v == default then isValidDefault = true break end end
                if not isValidDefault then selected = nil end
                if multi and selected then table.insert(selectedMulti, selected) end
                
                local mainBtn = tbl4.create("TextButton", { ZIndex = 6, Size = UDim2.new(1, 0, 0, 16), BackgroundColor3 = theme.Dropdown, Text = "", Font = Enum.Font.Gotham, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = content })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = mainBtn})
                local label = tbl4.create("TextLabel", { ZIndex = 7, Size = UDim2.new(0, 0, 1, 0), BackgroundTransparency = 1, Position = UDim2.new(0, 4, 0, 0), TextSize = 11, TextColor3 = selected and theme.EnabledText or theme.DisabledText, Text = selected or "NONE", Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = mainBtn })
                local arrow = tbl4.create("ImageLabel", { ZIndex = 7, Size = UDim2.new(0, 10, 0, 11), Rotation = 180, BackgroundTransparency = 1, Position = UDim2.new(1, -16, 0, 2), Image = "rbxassetid://8233647312", Parent = mainBtn })
                local listFrame = tbl4.create("Frame", { ZIndex = 10, Visible = false, Size = UDim2.new(1, 0, 0, 0), ClipsDescendants = true, Position = UDim2.new(0, 0, 1, 4), BackgroundColor3 = theme.DropdownContent, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = mainBtn })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = listFrame})
                local listContainer = tbl4.create("Frame", { Size = UDim2.new(1, -6, 1, 0), Position = UDim2.new(0, 6, 0, 0), BackgroundTransparency = 1, Parent = listFrame })
                local listLayout = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Parent = listContainer})

                local function updateText()
                    if multi then label.Text = #selectedMulti > 0 and table.concat(selectedMulti, ", ") or "NONE"; if flag then tbl.flags[flag] = selectedMulti end; callback(selectedMulti)
                    else label.Text = selected or "NONE"; if flag then tbl.flags[flag] = selected end; callback(selected) end
                end

                local function createOption(optName)
                    local optBtn = tbl4.create("TextButton", { ZIndex = 11, Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, TextSize = 11, TextColor3 = theme.DisabledText, Text = optName, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, BorderSizePixel = 0, Parent = listContainer })
                    optionButtons[optName] = optBtn
                    optBtn.MouseButton1Click:Connect(function()
                        if multi then
                            local idx = table.find(selectedMulti, optName)
                            if idx then table.remove(selectedMulti, idx); optBtn.TextColor3 = theme.DisabledText
                            else table.insert(selectedMulti, optName); optBtn.TextColor3 = theme.EnabledText end
                            updateText()
                        else
                            if selected == optName then selected = nil; optBtn.TextColor3 = theme.DisabledText
                            else selected = optName; for _, c in pairs(listContainer:GetChildren()) do if c:IsA("TextButton") then c.TextColor3 = theme.DisabledText end end; optBtn.TextColor3 = theme.EnabledText end
                            updateText()
                        end
                    end)
                end
                for _, opt in pairs(contentList) do createOption(opt) end
                if multi and selected then updateText() end
                mainBtn.MouseButton1Click:Connect(function()
                    open = not open
                    if open then listFrame.Visible = true end
                    tbl4.tween(listFrame, {#contentList * 0.02}, {Size = UDim2.new(1, 0, 0, open and listLayout.AbsoluteContentSize.Y or 0)}, function() listFrame.Visible = open end)
                    tbl4.tween(arrow, {0.1}, {Rotation = open and 0 or 180})
                end)
                local api = tbl4.format_table({})
                api.Set = function(_, val)
                    if multi then
                        if type(val) == "table" then selectedMulti = val elseif val == nil then selectedMulti = {} elseif not table.find(selectedMulti, val) then table.insert(selectedMulti, val) end
                        for k, v in pairs(optionButtons) do v.TextColor3 = table.find(selectedMulti, k) and theme.EnabledText or theme.DisabledText end
                    else
                        selected = val
                        for k, v in pairs(optionButtons) do v.TextColor3 = (k == val) and theme.EnabledText or theme.DisabledText end
                    end
                    updateText()
                end
                api.Refresh = function(_, newContent) contentList = newContent; for _, btn in pairs(optionButtons) do btn:Destroy() end; optionButtons = {}; for _, opt in pairs(contentList) do createOption(opt) end end
                if flag then tbl.controls[flag] = api end
                return api
            end
            return sectApi
        end
        return tabApi
    end
    return api
end

local v3 = tbl:Load({Name = "Crimson Lua", Theme = "Dark"})
local v4 = nil
local v5 = nil

repeat task.wait() until not game:IsLoaded()

local tbl5 = {
    running = false, riotRunning = false, returnHomeEnabled = false, orientationOffsetEnabled = false,
    offsetDesyncEnabled = false, burstDesyncEnabled = false, anchorStutterEnabled = false,
    desyncOffsetAmount = 40, desyncBurstPower = 1500, desyncPulseDelay = 0.03, desyncStutterDelay = 0.08,
    customJumpEnabled = false, jumpPowerValue = 50, freezeCharacterEnabled = false,
    customGravityEnabled = false, originalGravity = workspace.Gravity, gravityValue = workspace.Gravity,
    currentDistance = 500, teleportMode = "VOID_SPAM", voidSpamMode = "Random Far",
    teleportInterval = 0.035, jitterStrength = 14, distPlusX = 200000, distMinusX = 200000,
    distPlusY = 200000, distMinusY = 200000, distPlusZ = 200000, distMinusZ = 200000,
    spinSpeed = 720, riotXJitter = 30, riotYJitter = 8, riotDistance = 300,
    voidX = math.random(-100000000, 100000000), voidZ = math.random(-100000000, 100000000),
    voidYOffset = 0, voidYDir = 1, voidDirX = math.random() * 2 - 1, voidDirZ = math.random() * 2 - 1,
    voidElapsed = 0, voidYBase = 10000000000 + math.random(-5000000000, 5000000000),
    voidDriftSpeed = 9000000, voidYDriftSpeed = 4000000, voidYDriftRange = 2000000000, voidChaos = 0.98,
    flyEnabled = false, flySpeed = 50, noclip = false,
    fakePositionEnabled = false, velocityDesyncEnabled = false, glideEnabled = false, glideSpeed = 280, glideAccel = 18,
    antiAimEnabled = false, pitchAngle = 0, yawAngle = 0, spinEnabled = false,
    underMapEnabled = false, underMapY = -500, riotAbuserEnabled = false, riotAbuserDistance = 300, riotAbuserX = 30, riotAbuserY = 8, riotAbuserZ = 30, riotAbuserSpin = 720,
    antiProjEnabled = false, riotBypassEnabled = false, riotBypassDistance = 3, riotBypassHeight = 0, riotBypassUpdate = 0.02, riotBypassPosition = "Front",
    evasionEnabled = false, evasionIntensity = 3, blinkEnabled = false, blinkRadius = 80, blinkRate = 60,
    ghostEnabled = false, ghostDistance = 150, autoCollectEnabled = false, autoCollectRadius = 60,
    safeZoneEnabled = false, safeZoneY = -10, undergroundEnabled = false, undergroundDepth = 15,
    autoHealthEnabled = false, autoHealthThreshold = 20, undergroundLocked = false, undergroundLockedY = 0
}

local function fn2(arg1) pcall(function() StarterGui:SetCore("SendNotification", {Title = "Crimson Lua", Text = tostring(arg1), Duration = 3}) end) end
local function fn4(arg1) v4 = arg1; v5 = nil; if v4 then v5 = v4:WaitForChild("HumanoidRootPart", 5) end end
if localPlayer.Character then fn4(localPlayer.Character) end
localPlayer.CharacterAdded:Connect(fn4)
localPlayer.CharacterRemoving:Connect(function() fn4(nil) end)

local function fn24() return v4 and v4:FindFirstChildOfClass("Humanoid") end
local function fn28(arg1) tbl5.freezeCharacterEnabled = arg1; if v5 then if arg1 then v5.AssemblyLinearVelocity = Vector3.zero; v5.AssemblyAngularVelocity = Vector3.zero; v5.Anchored = true else v5.Anchored = false end end end
local function fn29(arg1) tbl5.customGravityEnabled = arg1; workspace.Gravity = arg1 and tbl5.gravityValue or tbl5.originalGravity end

local v10 = v3:Tab("Void")
local v11 = v3:Tab("Systems")
local v12 = v3:Tab("Anim")
local v13 = v3:Tab("Combat")
local v14 = v3:Tab("Movement")
local v15 = v3:Tab("Utilities")
local v16 = v3:Tab("Under")

local v18 = v10:Section({Name = "Void", column = 1})
v18:Toggle({Name = "Void Move", Flag = "VoidMove", Callback = function(on)
    tbl5.running = on
    if on then
        tbl5.teleportConn = RunService.Heartbeat:Connect(function()
            if tbl5.running and v5 and tick() - (tbl5.lastTP or 0) >= tbl5.teleportInterval then
                tbl5.lastTP = tick()
                v5.CFrame = CFrame.new(math.random(-100000, 100000), math.random(10000, 50000), math.random(-100000, 100000))
            end
        end)
    else if tbl5.teleportConn then tbl5.teleportConn:Disconnect() end end
end})
v18:Dropdown({Name = "Mode", Default = "VOID_SPAM", Content = {"VOID_SPAM", "RANDOM", "CAMERA"}, Flag = "TeleportMode"})
v18:Slider({Name = "Distance", Min = 50, Max = 50000000, Default = 500, Flag = "Distance", Callback = function(v) tbl5.currentDistance = v end})
v18:Slider({Name = "Interval", Min = 0.01, Max = 2, Default = 0.035, Flag = "TPInterval", Callback = function(v) tbl5.teleportInterval = v end})

local v22 = v10:Section({Name = "Player", column = 2})
v22:Toggle({Name = "Jump", Flag = "CustomJump", Callback = function(on)
    tbl5.customJumpEnabled = on
    local hum = fn24()
    if hum then if on then hum.UseJumpPower = true; hum.JumpPower = tbl5.jumpPowerValue else hum.JumpPower = 50 end end
end})
v22:Slider({Name = "Jump Power", Min = 0, Max = 10000, Default = 50, Flag = "JumpPower", Callback = function(v) tbl5.jumpPowerValue = v; local hum = fn24(); if hum and tbl5.customJumpEnabled then hum.JumpPower = v end end})
v22:Toggle({Name = "Freeze", Flag = "Freeze", Callback = fn28})
v22:Toggle({Name = "Gravity", Flag = "CustomGravity", Callback = fn29})

local v35 = v14:Section({Name = "Fly", column = 1})
v35:Toggle({Name = "Fly", Flag = "Fly", Callback = function(on)
    tbl5.flyEnabled = on
    if on then
        local v274 = fn24(); if v274 then v274:ChangeState(Enum.HumanoidStateType.Physics) end
        tbl5.flyConn = RunService.Heartbeat:Connect(function(arg1)
            if tbl5.flyEnabled and v5 then
                local v275 = fn24(); if v275 then v275:ChangeState(Enum.HumanoidStateType.Physics) end
                local cam = workspace.CurrentCamera; local dir = Vector3.zero
                if v275 and v275.MoveDirection.Magnitude > 0 then dir = Vector3.new(v275.MoveDirection.X, cam.CFrame.LookVector.Y * v275.MoveDirection:Dot(Vector3.new(cam.CFrame.LookVector.X,0,cam.CFrame.LookVector.Z).Unit), v275.MoveDirection.Z) end
                if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
                if UserInputService2:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0, 1, 0) end
                v5.AssemblyLinearVelocity = Vector3.zero; v5.AssemblyAngularVelocity = Vector3.zero
                if dir.Magnitude > 0 then v5.CFrame = v5.CFrame + dir.Unit * (tbl5.flySpeed * arg1) end
            end
        end)
    else
        if tbl5.flyConn then tbl5.flyConn:Disconnect() end
        if v5 then v5.AssemblyLinearVelocity = Vector3.zero end
        local v278 = fn24(); if v278 then v278:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end
end})
v35:Slider({Name = "Fly Speed", Min = 1, Max = 2000, Default = 50, Flag = "FlySpeed", Callback = function(v) tbl5.flySpeed = v end})
v14:Section({Name = "Noclip", column = 1}):Toggle({Name = "Noclip", Flag = "Noclip", Callback = function(on) tbl5.noclip = on; if on and v4 then for _, v in ipairs(v4:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end})

local v40 = v15:Section({Name = "Auto Collect", column = 1})
v40:Toggle({Name = "Auto Heal", Flag = "AutoCollect", Callback = function(on)
    tbl5.autoCollectEnabled = on
    if on then
        tbl5.autoCollectConn = RunService.Heartbeat:Connect(function()
            if tbl5.autoCollectEnabled and v5 then
                for _, v in ipairs(workspace:GetDescendants()) do
                    local n = v.Name:lower()
                    if (n:find("heal") or n:find("health")) and v:IsA("BasePart") then
                        if (v.Position - v5.Position).Magnitude < tbl5.autoCollectRadius then v5.CFrame = CFrame.new(v.Position) end
                    end
                end
            end
        end)
    else if tbl5.autoCollectConn then tbl5.autoCollectConn:Disconnect() end end
end})

local v42 = v16:Section({Name = "Underground", column = 1})
v42:Toggle({Name = "Enable", Flag = "UnderEnable", Callback = function(on)
    if on then
        if v5 then v5.CFrame = CFrame.new(v5.Position.X, -100, v5.Position.Z); tbl5.undergroundLocked = true
            tbl5.underConn = RunService.Heartbeat:Connect(function() if tbl5.undergroundLocked and v5 then v5.CFrame = CFrame.new(v5.Position.X, -100, v5.Position.Z) end end)
        end
    else
        tbl5.undergroundLocked = false; if tbl5.underConn then tbl5.underConn:Disconnect() end
        if v5 then v5.CFrame = CFrame.new(v5.Position.X, 50, v5.Position.Z) end
    end
end})

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "CrimsonToggleGui"
toggleGui.ResetOnSpawn = false
toggleGui.Parent = CoreGui
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 80, 0, 30)
toggleBtn.Position = UDim2.new(1, -90, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(206, 54, 54)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 12
toggleBtn.Text = "Toggle UI"
toggleBtn.Parent = toggleGui
local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 6); corner.Parent = toggleBtn
toggleBtn.MouseButton1Click:Connect(function() v3.Gui.Enabled = not v3.Gui.Enabled end)

fn2("Crimson Lua Loaded (Full Restored)")
