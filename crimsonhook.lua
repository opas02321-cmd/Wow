--[[ Crimson Lua - Fixed UI build (functional logic preserved) ]]
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
tbl2.Light = {
    TextColor=Color3.fromRGB(40,40,40), Tab=Color3.fromRGB(225,225,225),
    DropdownContent=Color3.fromRGB(235,235,235), EnabledText=Color3.fromRGB(40,40,40),
    BoxFocused=Color3.fromRGB(215,215,215), SliderFill=Color3.fromRGB(206,54,54),
    Box=Color3.fromRGB(225,225,225), ButtonMouseOver=Color3.fromRGB(215,215,215),
    Section=Color3.fromRGB(235,235,235), Button=Color3.fromRGB(225,225,225),
    ToggleDisabledMouseOver=Color3.fromRGB(215,215,215), TabToggleDisabledMouseOver=Color3.fromRGB(235,235,235),
    ColorPicker=Color3.fromRGB(235,235,235), ToggleEnabled=Color3.fromRGB(206,54,54),
    DisabledText=Color3.fromRGB(75,75,75), ToggleDisabled=Color3.fromRGB(225,225,225),
    TabToggleDisabled=Color3.fromRGB(250,250,250), SliderFillSliding=Color3.fromRGB(226,74,74),
    MainFrame=Color3.fromRGB(225,225,225), SliderMouseOver=Color3.fromRGB(215,215,215),
    Dropdown=Color3.fromRGB(225,225,225), DropdownMouseOver=Color3.fromRGB(215,215,215),
    ToggleEnabledMouseOver=Color3.fromRGB(226,74,74), ColorPickerBoxes=Color3.fromRGB(225,225,225),
    TabBackground=Color3.fromRGB(235,235,235), TabToggleEnabled=Color3.fromRGB(225,225,225),
    Slider=Color3.fromRGB(225,225,225), Border=Color3.fromRGB(180,180,180)
}
local tbl3 = {}
for k in pairs(tbl2.Dark) do tbl3[k] = {} end

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
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)
        frame.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end,
    get_center = function(x,y) return UDim2.new(0.5, -(x/2), 0.5, -(y/2)) end,
    hex_to_rgb = function(h)
        return Color3.fromRGB(tonumber("0x"..h:sub(2,3)), tonumber("0x"..h:sub(4,5)), tonumber("0x"..h:sub(6,7)))
    end,
    rgb_to_hex = function(c)
        return string.format("#%02X%02X%02X", math.clamp(c.R*255,0,255), math.clamp(c.G*255,0,255), math.clamp(c.B*255,0,255))
    end,
    format_table = function(t)
        if not t then return {} end
        local store = {}
        for k,v in pairs(t) do store[k:lower()] = v end
        local proxy = {}
        setmetatable(proxy, {
            __newindex = function(_,k,v) rawset(store, k:lower(), v) end,
            __index = function(_,k) return store[k:lower()] end
        })
        return proxy
    end
}
local screenGui = tbl4.create("ScreenGui", {})
if syn and syn.protect_gui then syn.protect_gui(screenGui) end
screenGui.Parent = CoreGui
tbl = tbl4.format_table(tbl)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == tbl.keybind then
        tbl.toggled = not tbl.toggled
        screenGui.Enabled = tbl.toggled
    end
end)
tbl.Load = function(_, cfg)
    local c = tbl4.format_table(cfg)
    local name = c.name
    local sizeX = c.sizeX or 440
    local sizeY = c.sizeY or 480
    local theme = tbl2[c.theme] or tbl2.Dark
    local overrides = c.colorOverrides or {}
    for k, v in pairs(overrides) do
        if theme[k] then theme[k] = v end
    end
    local holder = tbl4.create("Frame", {
        Size = UDim2.new(0, sizeX, 0, 26),
        BackgroundTransparency = 1,
        Position = tbl4.get_center(sizeX, sizeY),
        BackgroundColor3 = Color3.fromRGB(255,255,255),
        Parent = screenGui
    })
    tbl4.create("TextLabel", {
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 8, 0, 0),
        TextSize = 14,
        TextColor3 = theme.TextColor,
        Text = name,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2,
        Parent = holder
    })
    tbl4.drag(holder)
    local window = tbl4.create("Frame", {
        Size = UDim2.new(1, 0, 0, sizeY),
        BackgroundColor3 = theme.MainFrame,
        BorderSizePixel = 1,
        BorderColor3 = theme.Border,
        Parent = holder
    })
    tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = window})
    local tabBg = tbl4.create("Frame", {
        ZIndex = 2,
        Size = UDim2.new(1, -16, 1, -34),
        Position = UDim2.new(0, 8, 0, 26),
        BackgroundColor3 = theme.TabBackground,
        BorderSizePixel = 1,
        BorderColor3 = theme.Border,
        Parent = window
    })
    tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = tabBg})
    local tabRow = tbl4.create("Frame", {
        Size = UDim2.new(1, -12, 0, 18),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 6, 0, 6),
        Parent = tabBg
    })
    local tabBody = tbl4.create("Frame", {
        ZIndex = 4,
        Size = UDim2.new(1, -12, 1, -29),
        Position = UDim2.new(0, 6, 0, 24),
        BackgroundColor3 = theme.Tab,
        BorderSizePixel = 1,
        BorderColor3 = theme.Border,
        Parent = tabBg
    })
    tbl4.create("UICorner", {Parent = tabBody})
    local pageHolder = tbl4.create("Frame", {
        Size = UDim2.new(1, -12, 1, -12),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 6, 0, 6),
        BackgroundColor3 = Color3.fromRGB(20,20,20),
        Parent = tabBody
    })
    tbl4.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        Parent = tabRow
    })
    local api = tbl4.format_table({count = 0})
    api.Holder = holder
    api.Window = window
    api.Gui = screenGui

    api.Tab = function(_, tabName)
        api.count = api.count + 1
        local isFirst = api.count == 1
        local tabBtn = tbl4.create("TextButton", {
            ZIndex = 4,
            BackgroundColor3 = isFirst and theme.TabToggleEnabled or theme.TabToggleDisabled,
            Size = UDim2.new(0, 52, 1, 0),
            TextSize = 12,
            TextColor3 = isFirst and theme.EnabledText or theme.DisabledText,
            Text = tabName,
            Font = Enum.Font.Gotham,
            BorderSizePixel = 1,
            BorderColor3 = theme.Border,
            Parent = tabRow
        })
        if tabBtn.TextBounds.X + 16 > 52 then
            tabBtn.Size = UDim2.new(0, tabBtn.TextBounds.X + 16, 1, 0)
        end
        local tabUnderline = tbl4.create("Frame", {
            ZIndex = 3,
            Size = UDim2.new(1, 0, 1, 5),
            Position = UDim2.new(0, 0, 1, -10),
            BackgroundColor3 = isFirst and theme.TabToggleEnabled or theme.TabToggleDisabled,
            BorderSizePixel = 1,
            BorderColor3 = theme.Border,
            Parent = tabBtn
        })
        tabBtn:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
            tabUnderline.BackgroundColor3 = tabBtn.BackgroundColor3
        end)
        tbl4.create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = tabBtn})
        local page = tbl4.create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            Visible = isFirst,
            Parent = pageHolder
        })
        tbl4.create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 6),
            Parent = page
        })
        local colL = tbl4.create("ScrollingFrame", {
            Size = UDim2.new(0.5, -3, 1, 0),
            BackgroundTransparency = 1,
            Active = true,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Parent = page
        })
        local layoutL = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = colL})
        layoutL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            colL.CanvasSize = UDim2.new(0, 0, 0, layoutL.AbsoluteContentSize.Y)
        end)
        local colR = tbl4.create("ScrollingFrame", {
            Size = UDim2.new(0.5, -3, 1, 0),
            BackgroundTransparency = 1,
            Active = true,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Parent = page
        })
        local layoutR = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = colR})
        layoutR:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            colR.CanvasSize = UDim2.new(0, 0, 0, layoutR.AbsoluteContentSize.Y)
        end)
        tabBtn.MouseButton1Click:Connect(function()
            for _, child in next, pageHolder:GetChildren() do
                if child ~= page then child.Visible = false end
            end
            page.Visible = true
            for _, child in next, tabRow:GetChildren() do
                if child:IsA("TextButton") and child ~= tabBtn then
                    tbl4.tween(child, {0.2}, {TextColor3 = theme.DisabledText, BackgroundColor3 = theme.TabToggleDisabled})
                end
            end
            tbl4.tween(tabBtn, {0.2}, {TextColor3 = theme.EnabledText, BackgroundColor3 = theme.TabToggleEnabled})
        end)
        tabBtn.MouseEnter:Connect(function()
            if not page.Visible then
                tbl4.tween(tabBtn, {0.2}, {BackgroundColor3 = theme.TabToggleDisabledMouseOver})
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if not page.Visible then
                tbl4.tween(tabBtn, {0.2}, {BackgroundColor3 = theme.TabToggleDisabled})
            end
        end)
        local tabApi = tbl4.format_table({})
        tabApi.Open = function() end
        tabApi.Section = function(_, sectCfg)
            local s = tbl4.format_table(sectCfg)
            local sectName = s.name
            local parent = (s.column == 2) and colR or colL
            local section = tbl4.create("Frame", {
                ZIndex = 5,
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = theme.Section,
                BorderSizePixel = 1,
                BorderColor3 = theme.Border,
                Parent = parent
            })
            tbl4.create("UICorner", {Parent = section})
            tbl4.create("TextLabel", {
                ZIndex = 6,
                Size = UDim2.new(0, 1, 0, 16),
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0, 4),
                TextSize = 12,
                TextColor3 = theme.TextColor,
                Text = sectName,
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = section
            })
            local content = tbl4.create("Frame", {
                Size = UDim2.new(1, -10, 1, -24),
                Position = UDim2.new(0, 5, 0, 22),
                BackgroundColor3 = Color3.fromRGB(255,255,255),
                BackgroundTransparency = 1,
                Parent = section
            })
            local contentLayout = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = content})
            contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                section.Size = UDim2.new(1, 0, 0, contentLayout.AbsoluteContentSize.Y + 27)
            end)

            local sectApi = tbl4.format_table({})
            sectApi.Hide = function() section.Visible = false end
            sectApi.Show = function() section.Visible = true end

            sectApi.Label = function(_, text)
                local lbl = tbl4.create("TextLabel", {
                    ZIndex = 6,
                    Size = UDim2.new(1, 0, 0, 10),
                    BackgroundTransparency = 1,
                    TextSize = 12,
                    Text = text,
                    TextColor3 = theme.TextColor,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = content
                })
                local api = tbl4.format_table({})
                api.Hide = function() lbl.Visible = false end
                api.Show = function() lbl.Visible = true end
                return api
            end

            sectApi.Button = function(_, btnCfg)
                local b = tbl4.format_table(btnCfg)
                local btn = tbl4.create("TextButton", {
                    ZIndex = 6,
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundColor3 = theme.Button,
                    TextSize = 12,
                    Text = b.name,
                    TextColor3 = theme.TextColor,
                    Font = Enum.Font.Gotham,
                    ClipsDescendants = true,
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = content
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = btn})
                btn.MouseButton1Click:Connect(function()
                    if b.callback then b.callback() end
                    tbl4.ripple(btn)
                end)
                btn.MouseEnter:Connect(function()
                    tbl4.tween(btn, {0.2}, {BackgroundColor3 = theme.ButtonMouseOver})
                end)
                btn.MouseLeave:Connect(function()
                    tbl4.tween(btn, {0.2}, {BackgroundColor3 = theme.Button})
                end)
                local api = tbl4.format_table({})
                api.Hide = function() btn.Visible = false end
                api.Show = function() btn.Visible = true end
                return api
            end
            
            sectApi.Toggle = function(_, tglCfg)
                local t = tbl4.format_table(tglCfg)
                local flag = t.flag
                local callback = t.callback or function() end
                local state = false
                local hovered = false

                local btn = tbl4.create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 10),
                    BackgroundTransparency = 1,
                    TextSize = 14,
                    Text = "",
                    Font = Enum.Font.SourceSans,
                    Parent = content
                })
                local box = tbl4.create("Frame", {
                    ZIndex = 6,
                    Size = UDim2.new(0, 10, 0, 10),
                    BackgroundColor3 = theme.ToggleDisabled,
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = btn
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = box})
                local label = tbl4.create("TextLabel", {
                    ZIndex = 6,
                    Size = UDim2.new(0, 1, 0, 10),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 5, 0, 0),
                    TextSize = 12,
                    TextColor3 = theme.DisabledText,
                    Text = t.name,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = box
                })

                local function setState(newState)
                    state = newState
                    tbl4.tween(label, {0.2}, {TextColor3 = state and theme.EnabledText or theme.DisabledText})
                    if hovered then
                        tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabledMouseOver or theme.ToggleDisabledMouseOver})
                    else
                        tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabled or theme.ToggleDisabled})
                    end
                    callback(state)
                    if flag then tbl.flags[flag] = state end
                end

                btn.MouseButton1Click:Connect(function() setState(not state) end)
                btn.MouseEnter:Connect(function()
                    hovered = true
                    tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabledMouseOver or theme.ToggleDisabledMouseOver})
                end)
                btn.MouseLeave:Connect(function()
                    hovered = false
                    tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabled or theme.ToggleDisabled})
                end)

                local api = tbl4.format_table({})
                api.Toggle = function(_, val) if state ~= val then setState(val) end end
                api.Hide = function() btn.Visible = false end
                api.Show = function() btn.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end

            sectApi.Box = function(_, boxCfg)
                local b = tbl4.format_table(boxCfg)
                local flag = b.flag
                local callback = b.callback or function() end
                local hovered = false
                local focused = false

                local textBox = tbl4.create("TextBox", {
                    ZIndex = 6,
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundColor3 = theme.Box,
                    PlaceholderColor3 = Color3.fromRGB(180,180,180),
                    TextSize = 12,
                    TextColor3 = theme.TextColor,
                    Text = "",
                    Font = Enum.Font.Gotham,
                    PlaceholderText = b.name or b.placeholder or "",
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = content
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = textBox})

                local function onLeave()
                    focused = false
                    if not hovered then
                        tbl4.tween(textBox, {0.2}, {BackgroundColor3 = theme.Box})
                    end
                    if flag then tbl.flags[flag] = textBox.Text end
                    callback(textBox.Text)
                end
                textBox.Focused:Connect(function()
                    focused = true
                    tbl4.tween(textBox, {0.2}, {BackgroundColor3 = theme.BoxFocused})
                end)
                textBox.MouseEnter:Connect(function()
                    hovered = true
                    tbl4.tween(textBox, {0.2}, {BackgroundColor3 = theme.BoxFocused})
                end)
                textBox.MouseLeave:Connect(function()
                    hovered = false
                    if not focused then
                        tbl4.tween(textBox, {0.2}, {BackgroundColor3 = theme.Box})
                    end
                end)
                textBox.FocusLost:Connect(onLeave)

                local api = tbl4.format_table({})
                api.Set = function(_, val)
                    textBox.Text = val
                    onLeave()
                end
                api.Hide = function() textBox.Visible = false end
                api.Show = function() textBox.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end

            sectApi.Slider = function(_, sldCfg)
                local s = tbl4.format_table(sldCfg)
                local name = s.name
                local minV = s.min or 1
                local maxV = s.max or 100
                local dec = s.decimals or 0.1
                local def = s.default and math.clamp(s.default, minV, maxV) or minV
                local valType = s.valueType or "/" .. tostring(maxV)
                local flag = s.flag
                local callback = s.callback or function() end
                local hovered = false
                local sliding = false

                local container = tbl4.create("Frame", {
                    ZIndex = 6,
                    Size = UDim2.new(1, 0, 0, 16),
                    ClipsDescendants = true,
                    BackgroundColor3 = theme.Slider,
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = content
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = container})
                local fill = tbl4.create("Frame", {
                    ZIndex = 7,
                    Size = UDim2.new((def - minV) / (maxV - minV), 0, 1, 0),
                    BackgroundColor3 = theme.SliderFill,
                    BorderSizePixel = 0,
                    Parent = container
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = fill})
                local label = tbl4.create("TextLabel", {
                    ZIndex = 8,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    TextSize = 12,
                    TextColor3 = theme.TextColor,
                    Text = name .. ": " .. def .. valType,
                    Font = Enum.Font.Gotham,
                    Parent = container
                })

                local function update(input)
                    local pct = math.clamp((input.Position.X - container.AbsolutePosition.X) / container.AbsoluteSize.X, 0, 1)
                    tbl4.tween(fill, {0.3}, {Size = UDim2.new(pct, 0, 1, 0)})
                    local val = math.floor(((maxV - minV) * pct + minV) * (dec * 10)) / (dec * 10)
                    label.Text = name .. ": " .. val .. valType
                    if flag then tbl.flags[flag] = val end
                    callback(val)
                end

                container.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        sliding = true
                        tbl4.tween(fill, {0.2}, {BackgroundColor3 = theme.SliderFillSliding})
                        update(input)
                    end
                end)
                container.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        tbl4.tween(fill, {0.2}, {BackgroundColor3 = theme.SliderFill})
                        sliding = false
                        if not hovered then
                            tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.Slider})
                        end
                    end
                end)
                container.MouseEnter:Connect(function()
                    hovered = true
                    tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.SliderMouseOver})
                end)
                container.MouseLeave:Connect(function()
                    hovered = false
                    if not sliding then
                        tbl4.tween(container, {0.2}, {BackgroundColor3 = theme.Slider})
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and sliding then
                        update(input)
                    end
                end)

                local api = tbl4.format_table({})
                api.Set = function(_, val)
                    val = math.clamp(math.floor(val * (dec * 10)) / (dec * 10), minV, maxV)
                    fill.Size = UDim2.new((val - minV) / (maxV - minV), 0, 1, 0)
                    label.Text = name .. ": " .. val .. valType
                    if flag then tbl.flags[flag] = val end
                end
                api.Hide = function() container.Visible = false end
                api.Show = function() container.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end
            
            sectApi.Dropdown = function(_, dropCfg)
                local d = tbl4.format_table(dropCfg)
                local default = d.default
                local contentList = d.content or {}
                local multi = d.multiChoice or false
                local flag = d.flag
                local callback = d.callback or function() end

                local selected = default
                local open = false
                local optionButtons = {}
                local selectedMulti = {}
                local isValidDefault = false
                for _, v in pairs(contentList) do
                    if v == default then isValidDefault = true break end
                end
                if not isValidDefault then selected = nil end
                if multi and selected then table.insert(selectedMulti, selected) end

                local mainBtn = tbl4.create("TextButton", {
                    ZIndex = 6,
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundColor3 = theme.Dropdown,
                    Text = "",
                    Font = Enum.Font.Gotham,
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = content
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = mainBtn})
                local label = tbl4.create("TextLabel", {
                    ZIndex = 7,
                    Size = UDim2.new(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 5, 0, 0),
                    TextSize = 12,
                    TextColor3 = selected and theme.EnabledText or theme.DisabledText,
                    Text = selected or "NONE",
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = mainBtn
                })
                local arrow = tbl4.create("ImageLabel", {
                    ZIndex = 7,
                    Size = UDim2.new(0, 10, 0, 11),
                    Rotation = 180,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -16, 0, 3),
                    Image = "rbxassetid://8233647312",
                    Parent = mainBtn
                })
                local listFrame = tbl4.create("Frame", {
                    ZIndex = 10,
                    Visible = false,
                    Size = UDim2.new(1, 0, 0, 0),
                    ClipsDescendants = true,
                    Position = UDim2.new(0, 0, 1, 6),
                    BackgroundColor3 = theme.DropdownContent,
                    BorderSizePixel = 1,
                    BorderColor3 = theme.Border,
                    Parent = mainBtn
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = listFrame})
                local listContainer = tbl4.create("Frame", {
                    Size = UDim2.new(1, -6, 1, 0),
                    Position = UDim2.new(0, 6, 0, 0),
                    BackgroundTransparency = 1,
                    Parent = listFrame
                })
                local listLayout = tbl4.create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Parent = listContainer})

                local function updateText()
                    if multi then
                        if #selectedMulti > 0 then
                            label.TextColor3 = theme.EnabledText
                            label.Text = table.concat(selectedMulti, ", ")
                        else
                            label.TextColor3 = theme.DisabledText
                            label.Text = "NONE"
                        end
                        if flag then tbl.flags[flag] = selectedMulti end
                        callback(selectedMulti)
                    else
                        if selected then
                            label.TextColor3 = theme.EnabledText
                            label.Text = selected
                        else
                            label.TextColor3 = theme.DisabledText
                            label.Text = "NONE"
                        end
                        if flag then tbl.flags[flag] = selected end
                        callback(selected)
                    end
                end

                local function createOption(optName)
                    local optBtn = tbl4.create("TextButton", {
                        ZIndex = 11,
                        Size = UDim2.new(1, 0, 0, 16),
                        BackgroundTransparency = 1,
                        TextSize = 12,
                        TextColor3 = (optName == selected or table.find(selectedMulti, optName)) and theme.EnabledText or theme.DisabledText,
                        Text = optName,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        BorderSizePixel = 0,
                        Parent = listContainer
                    })
                    optionButtons[optName] = optBtn
                    
                    optBtn.MouseButton1Click:Connect(function()
                        if multi then
                            local idx = table.find(selectedMulti, optName)
                            if idx then
                                table.remove(selectedMulti, idx)
                                tbl4.tween(optBtn, {0.2}, {TextColor3 = theme.DisabledText})
                            else
                                table.insert(selectedMulti, optName)
                                tbl4.tween(optBtn, {0.2}, {TextColor3 = theme.EnabledText})
                            end
                            updateText()
                        else
                            if selected == optName then
                                selected = nil
                                tbl4.tween(optBtn, {0.2}, {TextColor3 = theme.DisabledText})
                            else
                                selected = optName
                                for _, child in pairs(listContainer:GetChildren()) do
                                    if child:IsA("TextButton") then
                                        tbl4.tween(child, {0.2}, {TextColor3 = theme.DisabledText})
                                    end
                                end
                                tbl4.tween(optBtn, {0.2}, {TextColor3 = theme.EnabledText})
                            end
                            updateText()
                        end
                    end)
                end

                for _, opt in pairs(contentList) do
                    createOption(opt)
                end
                if multi and selected then updateText() end

                mainBtn.MouseButton1Click:Connect(function()
                    open = not open
                    local targetSize = UDim2.new(1, 0, 0, open and listLayout.AbsoluteContentSize.Y or 0)
                    local targetRot = open and 0 or 180
                    if open then listFrame.Visible = true end
                    tbl4.tween(listFrame, {#contentList * 0.025}, {Size = targetSize}, function()
                        listFrame.Visible = open
                    end)
                    tbl4.tween(arrow, {0.1}, {Rotation = targetRot})
                end)
                mainBtn.MouseEnter:Connect(function()
                    tbl4.tween(mainBtn, {0.2}, {BackgroundColor3 = theme.DropdownMouseOver})
                end)
                mainBtn.MouseLeave:Connect(function()
                    tbl4.tween(mainBtn, {0.2}, {BackgroundColor3 = theme.Dropdown})
                end)

                local api = tbl4.format_table({})
                api.Set = function(_, val)
                    if multi then
                        if type(val) == "table" then
                            selectedMulti = val
                        elseif val == nil then
                            selectedMulti = {}
                        elseif not table.find(selectedMulti, val) then
                            table.insert(selectedMulti, val)
                        end
                        for k, v in pairs(optionButtons) do
                            v.TextColor3 = table.find(selectedMulti, k) and theme.EnabledText or theme.DisabledText
                        end
                    else
                        selected = val
                        for k, v in pairs(optionButtons) do
                            v.TextColor3 = (k == val) and theme.EnabledText or theme.DisabledText
                        end
                    end
                    updateText()
                end
                api.Add = function(_, val)
                    table.insert(contentList, val)
                    createOption(val)
                    if open then
                        tbl4.tween(listFrame, {#contentList * 0.025}, {Size = UDim2.new(1, 0, 0, listLayout.AbsoluteContentSize.Y)})
                    end
                end
                api.Remove = function(_, val)
                    local idx = table.find(contentList, val)
                    if idx then
                        table.remove(contentList, idx)
                        if optionButtons[val] then
                            optionButtons[val]:Destroy()
                            optionButtons[val] = nil
                        end
                        if open then
                            tbl4.tween(listFrame, {#contentList * 0.025}, {Size = UDim2.new(1, 0, 0, listLayout.AbsoluteContentSize.Y)})
                        end
                    end
                end
                api.Refresh = function(_, newContent)
                    contentList = newContent
                    for _, btn in pairs(optionButtons) do btn:Destroy() end
                    optionButtons = {}
                    for _, opt in pairs(contentList) do createOption(opt) end
                    if open then
                        listFrame.Size = UDim2.new(1, 0, 0, listLayout.AbsoluteContentSize.Y)
                    end
                end
                api.Hide = function() mainBtn.Visible = false end
                api.Show = function() mainBtn.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end

            sectApi.Keybind = function(_, kbCfg)
                local k = tbl4.format_table(kbCfg)
                local flag = k.flag
                local callback = k.callback or function() end
                local currentKey = k.default
                if flag then tbl.flags[flag] = currentKey end
                
                local keyNames = {
                    [Enum.KeyCode.LeftShift]="L-SHIFT", [Enum.KeyCode.RightShift]="R-SHIFT",
                    [Enum.KeyCode.LeftControl]="L-CTRL", [Enum.KeyCode.RightControl]="R-CTRL",
                    [Enum.KeyCode.LeftAlt]="L-ALT", [Enum.KeyCode.RightAlt]="R-ALT",
                    [Enum.KeyCode.CapsLock]="CAPSLOCK", [Enum.KeyCode.Space]="SPACE",
                    [Enum.UserInputType.MouseButton1]="MOUSE-1", [Enum.UserInputType.MouseButton2]="MOUSE-2"
                }

                local btn = tbl4.create("TextButton", {
                    ZIndex = 6, Size = UDim2.new(1, 0, 0, 10),
                    BackgroundTransparency = 1, TextSize = 12,
                    TextColor3 = theme.TextColor, Text = k.name,
                    Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = content
                })
                local keyLabel = tbl4.create("TextLabel", {
                    ZIndex = 6, Size = UDim2.new(0, 1, 0, 10),
                    BackgroundTransparency = 1, Position = UDim2.new(1, -1, 0, 0),
                    TextSize = 12, TextColor3 = currentKey and theme.EnabledText or theme.DisabledText,
                    Text = currentKey and (keyNames[currentKey] or tostring(currentKey):gsub("Enum.KeyCode.","")) or "NONE",
                    Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Right,
                    Parent = btn
                })

                btn.MouseButton1Click:Connect(function()
                    keyLabel.Text = "..."
                    tbl4.tween(keyLabel, {0.2}, {TextColor3 = theme.DisabledText})
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        local key = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType
                        keyLabel.Text = keyNames[key] or tostring(key):gsub("Enum.KeyCode.",""):gsub("Enum.UserInputType.","")
                        tbl4.tween(keyLabel, {0.2}, {TextColor3 = theme.EnabledText})
                        currentKey = key
                        if flag then tbl.flags[flag] = key end
                        callback(key)
                        conn:Disconnect()
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == currentKey or input.UserInputType == currentKey then
                        callback(currentKey)
                    end
                end)

                local api = tbl4.format_table({})
                api.Set = function(_, val)
                    currentKey = val
                    keyLabel.Text = keyNames[val] or tostring(val):gsub("Enum.KeyCode.",""):gsub("Enum.UserInputType.","")
                    tbl4.tween(keyLabel, {0.2}, {TextColor3 = theme.EnabledText})
                    if flag then tbl.flags[flag] = val end
                    callback(val)
                end
                api.Hide = function() btn.Visible = false end
                api.Show = function() btn.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end
            
            sectApi.ToggleKeybind = function(_, tkbCfg)
                local t = tbl4.format_table(tkbCfg)
                local keyFlag = t.keybindFlag
                local toggleFlag = t.toggleFlag
                local keyCallback = t.keybindCallback or function() end
                local toggleCallback = t.toggleCallback or function() end
                local currentKey = t.default
                local state = false
                local hovered = false
                if keyFlag then tbl.flags[keyFlag] = currentKey end

                local btn = tbl4.create("TextButton", {Size = UDim2.new(1, 0, 0, 10), BackgroundTransparency = 1, Parent = content})
                local box = tbl4.create("Frame", {
                    ZIndex = 6, Size = UDim2.new(0, 10, 0, 10),
                    BackgroundColor3 = theme.ToggleDisabled, BorderSizePixel = 1,
                    BorderColor3 = theme.Border, Parent = btn
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = box})
                local label = tbl4.create("TextLabel", {
                    ZIndex = 6, Size = UDim2.new(0, 1, 0, 10), BackgroundTransparency = 1,
                    Position = UDim2.new(1, 5, 0, 0), TextSize = 12, TextColor3 = theme.DisabledText,
                    Text = t.name, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = box
                })
                
                local keyBtn = tbl4.create("TextButton", {
                    ZIndex = 6, Size = UDim2.new(0, 1, 0, 10), BackgroundTransparency = 1,
                    Position = UDim2.new(1, -1, 0, 0), TextSize = 12, TextColor3 = theme.DisabledText,
                    Text = currentKey and tostring(currentKey):gsub("Enum.KeyCode.","") or "NONE",
                    Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Right, Parent = btn
                })

                local function setState(newState)
                    state = newState
                    tbl4.tween(label, {0.2}, {TextColor3 = state and theme.EnabledText or theme.DisabledText})
                    tbl4.tween(box, {0.2}, {BackgroundColor3 = (state and (hovered and theme.ToggleEnabledMouseOver or theme.ToggleEnabled)) or (hovered and theme.ToggleDisabledMouseOver or theme.ToggleDisabled)})
                    toggleCallback(state)
                    if toggleFlag then tbl.flags[toggleFlag] = state end
                end

                btn.MouseButton1Click:Connect(function() setState(not state) end)
                btn.MouseEnter:Connect(function() hovered = true; tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabledMouseOver or theme.ToggleDisabledMouseOver}) end)
                btn.MouseLeave:Connect(function() hovered = false; tbl4.tween(box, {0.2}, {BackgroundColor3 = state and theme.ToggleEnabled or theme.ToggleDisabled}) end)
                
                keyBtn.MouseButton1Click:Connect(function()
                    keyBtn.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        local key = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType
                        keyBtn.Text = tostring(key):gsub("Enum.KeyCode.",""):gsub("Enum.UserInputType.","")
                        currentKey = key
                        if keyFlag then tbl.flags[keyFlag] = key end
                        keyCallback(key)
                        conn:Disconnect()
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == currentKey or input.UserInputType == currentKey then
                        setState(not state)
                        keyCallback(currentKey)
                    end
                end)

                local api = tbl4.format_table({})
                api.Toggle = function(_, val) if state ~= val then setState(val) end end
                api.Set = function(_, val)
                    currentKey = val
                    keyBtn.Text = tostring(val):gsub("Enum.KeyCode.",""):gsub("Enum.UserInputType.","")
                    if keyFlag then tbl.flags[keyFlag] = val end
                end
                api.Hide = function() btn.Visible = false end
                api.Show = function() btn.Visible = true end
                if toggleFlag then tbl.controls[toggleFlag] = api end
                if keyFlag then tbl.controls[keyFlag] = api end
                return api
            end

            sectApi.ColorPicker = function(_, cpCfg)
                local c = tbl4.format_table(cpCfg)
                local flag = c.flag
                local callback = c.callback or function() end
                local h, s, v = c.default:ToHSV()
                local currentColor = Color3.fromHSV(h, s, v)
                local open = false
                local draggingSV, draggingHue = false, false

                if flag then tbl.flags[flag] = currentColor end
                
                local btn = tbl4.create("TextButton", {
                    ZIndex = 6, Size = UDim2.new(1, 0, 0, 10), BackgroundTransparency = 1,
                    TextSize = 12, TextColor3 = theme.TextColor, Text = c.name,
                    Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = content
                })
                local colorPreview = tbl4.create("Frame", {
                    ZIndex = 6, Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(1, -10, 0, 0),
                    BackgroundColor3 = currentColor, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = btn
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = colorPreview})
                
                local frame = tbl4.create("Frame", {
                    ZIndex = 12, Size = UDim2.new(0, 180, 0, 0), ClipsDescendants = true,
                    Visible = false, Position = UDim2.new(0, 0, 1, 6), BackgroundColor3 = theme.ColorPicker,
                    BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = btn
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = frame})
                
                local svSquare = tbl4.create("ImageLabel", {
                    ZIndex = 13, Size = UDim2.new(0, 146, 0, 146), Position = UDim2.new(0, 5, 0, 5),
                    BackgroundColor3 = Color3.fromHSV(h, 1, 1), Image = "rbxassetid://8630797271", Parent = frame
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = svSquare})
                
                local svCursor = tbl4.create("Frame", {
                    ZIndex = 15, Size = UDim2.new(0, 4, 0, 4),
                    Position = UDim2.new(0, math.clamp(s * 146, 0, 142), 0, math.clamp((1 - v) * 146, 0, 142)),
                    BackgroundColor3 = Color3.fromRGB(255,255,255), BorderSizePixel = 0, Parent = svSquare
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = svCursor})
                tbl4.create("Frame", {ZIndex = 14, Size = UDim2.new(1, 2, 1, 2), Position = UDim2.new(0, -1, 0, -1), BackgroundColor3 = Color3.fromRGB(0,0,0), BorderSizePixel = 0, Parent = svCursor})

                local hueSlider = tbl4.create("ImageLabel", {
                    ZIndex = 13, Size = UDim2.new(0, 14, 0, 146), Position = UDim2.new(1, -19, 0, 5),
                    BackgroundColor3 = Color3.fromRGB(255, 0, 4), ScaleType = Enum.ScaleType.Crop,
                    Image = "rbxassetid://8630799159", Parent = frame
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = hueSlider})
                
                local hueCursor = tbl4.create("Frame", {
                    ZIndex = 15, Size = UDim2.new(1, 0, 0, 2),
                    Position = UDim2.new(0, 0, 0, math.clamp((1 - h) * 146, 0, 142)),
                    BackgroundColor3 = Color3.fromRGB(255,255,255), BorderSizePixel = 0, Parent = hueSlider
                })
                tbl4.create("Frame", {ZIndex = 14, Size = UDim2.new(1, 2, 1, 2), Position = UDim2.new(0, -1, 0, -1), BackgroundColor3 = Color3.fromRGB(0,0,0), BorderSizePixel = 0, Parent = hueCursor})

                local rgbBox = tbl4.create("TextBox", {
                    ZIndex = 14, Size = UDim2.new(1, -10, 0, 16), Position = UDim2.new(0, 5, 0, 156),
                    BackgroundColor3 = theme.ColorPickerBoxes, TextColor3 = theme.TextColor, TextSize = 12,
                    Text = math.floor(currentColor.R*255)..", "..math.floor(currentColor.G*255)..", "..math.floor(currentColor.B*255),
                    ClearTextOnFocus = false, Font = Enum.Font.Gotham, BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = frame
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = rgbBox})
                
                local hexBox = tbl4.create("TextBox", {
                    ZIndex = 14, Size = UDim2.new(1, -10, 0, 16), Position = UDim2.new(0, 5, 0, 178),
                    BackgroundColor3 = theme.ColorPickerBoxes, TextColor3 = theme.TextColor, TextSize = 12,
                    Text = tbl4.rgb_to_hex(currentColor), ClearTextOnFocus = false, Font = Enum.Font.Gotham,
                    BorderSizePixel = 1, BorderColor3 = theme.Border, Parent = frame
                })
                tbl4.create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = hexBox})
                frame.Size = UDim2.new(0, 180, 0, 202)

                local function updateColor()
                    currentColor = Color3.fromHSV(h, s, v)
                    svSquare.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                    colorPreview.BackgroundColor3 = currentColor
                    rgbBox.Text = math.floor(currentColor.R*255+0.5)..", "..math.floor(currentColor.G*255+0.5)..", "..math.floor(currentColor.B*255+0.5)
                    hexBox.Text = tbl4.rgb_to_hex(currentColor)
                    if flag then tbl.flags[flag] = currentColor end
                    callback(currentColor)
                end

                btn.MouseButton1Click:Connect(function()
                    open = not open
                    if open then
                        frame.Visible = true
                        frame.Position = UDim2.new(0, 0, (btn.AbsolutePosition.Y + frame.AbsoluteSize.Y > 780) and -frame.AbsoluteSize.Y - 6 or 1, 6)
                    end
                    tbl4.tween(frame, {0.3}, {Size = open and UDim2.new(0, 180, 0, 202) or UDim2.new(0, 180, 0, 0)}, function() frame.Visible = open end)
                end)

                local function updateSV(input)
                    s = math.clamp((input.Position.X - svSquare.AbsolutePosition.X) / svSquare.AbsoluteSize.X, 0, 1)
                    v = 1 - math.clamp((input.Position.Y - svSquare.AbsolutePosition.Y) / svSquare.AbsoluteSize.Y, 0, 1)
                    svCursor.Position = UDim2.new(0, math.clamp(s*146, 0, 142), 0, math.clamp((1-v)*146, 0, 142))
                    updateColor()
                end
                local function updateHue(input)
                    h = 1 - math.clamp((input.Position.Y - hueSlider.AbsolutePosition.Y) / hueSlider.AbsoluteSize.Y, 0, 1)
                    hueCursor.Position = UDim2.new(0, 0, 0, math.clamp((1-h)*146, 0, 142))
                    updateColor()
                end

                svSquare.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSV = true; updateSV(i) end end)
                svSquare.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSV = false end end)
                hueSlider.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingHue = true; updateHue(i) end end)
                hueSlider.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingHue = false end end)
                UserInputService.InputChanged:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseMovement then
                        if draggingSV then updateSV(i) end
                        if draggingHue then updateHue(i) end
                    end
                end)

                rgbBox.FocusLost:Connect(function()
                    local r, g, b = rgbBox.Text:match("(%d+),%s*(%d+),%s*(%d+)")
                    if r and g and b then
                        local col = Color3.fromRGB(math.clamp(tonumber(r),0,255), math.clamp(tonumber(g),0,255), math.clamp(tonumber(b),0,255))
                        h, s, v = col:ToHSV()
                        svCursor.Position = UDim2.new(0, math.clamp(s*146,0,142), 0, math.clamp((1-v)*146,0,142))
                        hueCursor.Position = UDim2.new(0, 0, 0, math.clamp((1-h)*146,0,142))
                        updateColor()
                    else
                        updateColor()
                    end
                end)
                hexBox.FocusLost:Connect(function()
                    if hexBox.Text:find("#") and #hexBox.Text == 7 then
                        local col = tbl4.hex_to_rgb(hexBox.Text)
                        h, s, v = col:ToHSV()
                        svCursor.Position = UDim2.new(0, math.clamp(s*146,0,142), 0, math.clamp((1-v)*146,0,142))
                        hueCursor.Position = UDim2.new(0, 0, 0, math.clamp((1-h)*146,0,142))
                        updateColor()
                    else
                        updateColor()
                    end
                end)

                local api = tbl4.format_table({})
                api.SetRGB = function(_, col)
                    h, s, v = col:ToHSV()
                    svCursor.Position = UDim2.new(0, math.clamp(s*146,0,142), 0, math.clamp((1-v)*146,0,142))
                    hueCursor.Position = UDim2.new(0, 0, 0, math.clamp((1-h)*146,0,142))
                    updateColor()
                end
                api.Hide = function() btn.Visible = false end
                api.Show = function() btn.Visible = true end
                if flag then tbl.controls[flag] = api end
                return api
            end
            return sectApi
        end
        return tabApi
    end
    return api
end

local v3 = tbl:Load({Name = "Crimson Lua", Theme = "Dark", SizeX = 580, SizeY = 780, ColorOverrides = {}})
localPlayer = Players.LocalPlayer
v4 = nil
v5 = nil
local tbl5 = {
    running = false, riotRunning = false, returnHomeEnabled = false,
    orientationOffsetEnabled = false, orientationOffsetPitch = 0, orientationOffsetYaw = 0, orientationOffsetRoll = 0,
    orientationOffsetConnection = nil, velocityPulseEnabled = false, velocityPulseConnection = nil,
    offsetDesyncEnabled = false, burstDesyncEnabled = false, anchorStutterEnabled = false, desyncConnection = nil,
    desyncOffsetAmount = 40, desyncBurstPower = 1500, desyncPulseDelay = 0.03, desyncStutterDelay = 0.08,
    desyncPulseClock = 0, desyncBurstClock = 0, desyncStutterClock = 0, desyncStutterAnchored = false,
    desyncOriginalAnchored = nil, desyncPreset = "Strong", customJumpEnabled = false, jumpPowerValue = 50,
    originalJumpPower = nil, originalJumpHeight = nil, freezeCharacterEnabled = false, previousRootAnchored = nil,
    customGravityEnabled = false, originalGravity = workspace.Gravity, gravityValue = workspace.Gravity,
    currentDistance = 500, teleportMode = "VOID_SPAM", voidSpamMode = "Random Far", voidProfile = "Manual",
    teleportInterval = 0.035, jitterStrength = 14, distPlusX = 200000, distMinusX = 200000,
    distPlusY = 200000, distMinusY = 200000, distPlusZ = 200000, distMinusZ = 200000,
    spinSpeed = 720, riotXJitter = 30, riotYJitter = 8, riotDistance = 300,
    homePosition = nil, homeCFrame = nil, homeReturnDelay = 3, homeReturnDistance = 10,
    teleportConnection = nil, riotConnection = nil, homeConnection = nil, originalCFrame = nil,
    riotOriginalCFrame = nil, voidHideLastCFrame = nil, lastTeleport = 0, lastVelocityClear = 0,
    voidX = math.random(-100000000, 100000000), voidZ = math.random(-100000000, 100000000),
    voidYOffset = 0, voidYDir = 1, voidDirX = math.random() * 2 - 1, voidDirZ = math.random() * 2 - 1,
    voidElapsed = 0, voidYBase = 10000000000 + math.random(-5000000000, 5000000000),
    voidDriftSpeed = 9000000, voidYDriftSpeed = 4000000, voidYDriftRange = 2000000000, voidChaos = 0.98,
    flyEnabled = false, flySpeed = 50, flyConnection = nil, noclip = false,
    fakePositionEnabled = false, fakePositionConnection = nil, fakePositionRender = nil, fakeRealCF = nil,
    velocityDesyncEnabled = false, velocityDesyncHeartbeat = nil, velocityDesyncRender = nil, velocityRealVel = nil,
    glideEnabled = false, glideConnection = nil, glideSpeed = 280, glideAccel = 18,
    antiAimEnabled = false, pitchAngle = 0, yawAngle = 0, spinEnabled = false,
    underMapEnabled = false, underMapY = -500, underMapConnection = nil,
    riotAbuserEnabled = false, riotAbuserConnection = nil, riotAbuserOriginal = nil,
    riotAbuserDistance = 300, riotAbuserX = 30, riotAbuserY = 8, riotAbuserZ = 30, riotAbuserSpin = 720,
    antiProjEnabled = false, antiProjConnection = nil, antiProjA = nil, antiProjB = nil,
    antiProjTarget = CFrame.new(999999, 999999, 999999), antiProjList = {},
    riotBypassEnabled = false, riotBypassConnection = nil, riotBypassTarget = nil, riotBypassLastSnap = 0,
    riotBypassDistance = 3, riotBypassHeight = 0, riotBypassUpdate = 0.02, riotBypassPosition = "Front",
    evasionEnabled = false, evasionConnection = nil, evasionIntensity = 3,
    blinkEnabled = false, blinkConnection = nil, blinkRadius = 80, blinkRate = 60, blinkAnchor = nil,
    ghostEnabled = false, ghostConnection = nil, ghostDistance = 150,
    autoCollectEnabled = false, autoCollectConnection = nil, autoCollectRadius = 60,
    safeZoneEnabled = false, safeZoneConnection = nil, safeZoneY = -10, safeZoneSavedPos = nil,
    homeAutoSaveOnSpawn = false, undergroundEnabled = false, undergroundDepth = 15,
    autoHealthEnabled = false, autoHealthThreshold = 20, undergroundLocked = false, undergroundLockedY = 0,
    undergroundConnection = nil, autoHealthConnection = nil
}

local function fn()
    tbl5.voidX = math.random(-100000000, 100000000); tbl5.voidZ = math.random(-100000000, 100000000)
    tbl5.voidYOffset = 0; tbl5.voidYDir = 1; tbl5.voidDirX = math.random() * 2 - 1; tbl5.voidDirZ = math.random() * 2 - 1
    tbl5.voidElapsed = 0; tbl5.voidYBase = 10000000000 + math.random(-5000000000, 5000000000)
end
local function fn2(arg1) pcall(function() StarterGui:SetCore("SendNotification", {Title = "Crimson Lua", Text = tostring(arg1), Duration = 4}) end) end
local function fn3(arg1) if arg1 then arg1:Disconnect() end return nil end
local function fn4(arg1)
    v4 = arg1; v5 = nil
    tbl5.originalJumpPower = nil; tbl5.originalJumpHeight = nil; tbl5.previousRootAnchored = nil
    tbl5.desyncOriginalAnchored = nil; tbl5.desyncStutterAnchored = false
    if v4 then v5 = v4:WaitForChild("HumanoidRootPart", 5) end
end
if localPlayer.Character then fn4(localPlayer.Character) end
localPlayer.CharacterAdded:Connect(fn4)
localPlayer.CharacterRemoving:Connect(function() fn4(nil) end)
local num = 2; local num2 = 800

local function fn5(arg1)
    if v5 then
        local x2, z2 = arg1.X, arg1.Z
        local v206 = math.clamp(arg1.Y, num, v5.Position.Y + num2)
        local v207 = RaycastParams.new()
        v207.FilterType, v207.FilterDescendantsInstances = Enum.RaycastFilterType.Exclude, v4 and {v4} or {}
        local v208 = workspace:Raycast(Vector3.new(x2, v206 + 500, z2), Vector3.new(0, -1000, 0), v207)
        if v208 then v206 = math.max(v208.Position.Y + 3, num) end
        v5.AssemblyLinearVelocity = Vector3.zero; v5.AssemblyAngularVelocity = Vector3.zero
        v5.CFrame = CFrame.new(x2, v206, z2)
    end
end
local function fn6(arg1)
    if v5 then
        if 0.2 < tick() - tbl5.lastVelocityClear then
            tbl5.lastVelocityClear = tick(); v5.AssemblyLinearVelocity = Vector3.zero; v5.AssemblyAngularVelocity = Vector3.zero
        end
        v5.CFrame = CFrame.new(arg1)
    end
end
local function fn7() return v5 and Vector3.new(v5.Position.X + 2e15, 999999, v5.Position.Z + 2e15) or nil end
local function fn8()
    local v212 = Vector3.new(math.random(-tbl5.distMinusX, tbl5.distPlusX), math.random(-tbl5.distMinusY, tbl5.distPlusY), math.random(-tbl5.distMinusZ, tbl5.distPlusZ))
    return v212.Magnitude <= 0 and Vector3.zero or v212.Unit * math.min(v212.Magnitude, tbl5.currentDistance)
end
local function fn9(arg1)
    local num16, num17, num18, num19 = 0, 0, 1, 0.0001
    for i7 = 1, 4 do
        num16 = num16 + math.noise(arg1 * num19, 0) * num18; num17 = num17 + math.noise(0, arg1 * num19) * num18
        num19, num18 = num19 * 2.37, num18 * 0.5
    end
    num16 = num16 + math.sin(arg1 * 0.00213) * math.cos(arg1 * 0.00344) * 0.2
    num17 = num17 + math.cos(arg1 * 0.00131) * math.sin(arg1 * 0.00579) * 0.2
    local v214 = math.sqrt(num16 * num16 + num17 * num17)
    if v214 < 0.001 then return math.cos(arg1 * 0.1), math.sin(arg1 * 0.1) end
    return num16 / v214, num17 / v214
end
local function fn10(arg1)
    local v222 = tbl5; v222.voidElapsed = v222.voidElapsed + arg1
    if v222.voidSpamMode == "Still Point" then return Vector3.new(v222.voidX, v222.voidYBase + v222.voidYOffset, v222.voidZ) end
    local v223, v224
    if v222.voidSpamMode == "Slow Drift" then
        v223, v224 = fn9(v222.voidElapsed)
        v222.voidDirX = v222.voidDirX + (v223 - v222.voidDirX) * v222.voidChaos * arg1 * 10
        v222.voidDirZ = v222.voidDirZ + (v224 - v222.voidDirZ) * v222.voidChaos * arg1 * 10
        v222.voidX = v222.voidX + v222.voidDirX * v222.voidDriftSpeed * arg1
        v222.voidZ = v222.voidZ + v222.voidDirZ * v222.voidDriftSpeed * arg1
        v222.voidYOffset = v222.voidYOffset + v222.voidYDir * v222.voidYDriftSpeed * arg1
        if v222.voidYDriftRange <= math.abs(v222.voidYOffset) then v222.voidYDir = -v222.voidYDir end
        return Vector3.new(v222.voidX, v222.voidYBase + v222.voidYOffset, v222.voidZ)
    elseif v222.voidSpamMode == "Circle" then
        v223 = math.max(v222.currentDistance * 1000, 1e9) * (1 + math.sin(v222.voidElapsed))
        return Vector3.new(v222.voidX + math.cos(v222.voidElapsed * 3) * v223, v222.voidYBase + v222.voidYOffset, v222.voidZ + math.sin(v222.voidElapsed * 3) * v223)
    elseif v222.voidSpamMode == "Figure Eight" then
        v223 = math.max(v222.currentDistance * 2000, 2e9)
        return Vector3.new(v222.voidX + math.sin(v222.voidElapsed * 2) * v223, v222.voidYBase + math.sin(v222.voidElapsed * 4) * v223 * 0.1, v222.voidZ + math.sin(v222.voidElapsed * 3) * v223)
    elseif v222.voidSpamMode == "Wide Sweep" then
        v223 = v222.voidElapsed * 15; v224 = math.max(v222.currentDistance * 10000, 1e10)
        return Vector3.new(v222.voidX + math.sin(v223) * v224, v222.voidYBase + math.cos(v223 * 1.5) * v224 * 0.1, v222.voidZ + math.cos(v223) * v224)
    elseif v222.voidSpamMode == "Fast Bounce" then
        v223 = v222.voidElapsed * 50; v224 = math.max(v222.currentDistance * 10000, 1e10) * math.sin(v223)
        return Vector3.new(v222.voidX + v224, v222.voidYBase + math.cos(v223) * 1e10, v222.voidZ + v224)
    elseif v222.voidSpamMode == "Blink" then
        return (tick() % 0.1 < 0.05) and Vector3.new(v222.voidX * 2, v222.voidYBase + 1e11, v222.voidZ * 2) or Vector3.new(v222.voidX, v222.voidYBase, v222.voidZ)
    elseif v222.voidSpamMode == "Grid Hop" then
        v223 = math.max(v222.currentDistance * 5000, 5e8); v224 = math.floor(v222.voidElapsed * 8)
        return Vector3.new(v222.voidX + (v224 % 5 - 2) * v223, v222.voidYBase + (v224 % 2 == 0 and 0 or v223 * 0.18), v222.voidZ + (math.floor(v224 / 5) % 5 - 2) * v223)
    elseif v222.voidSpamMode == "Height Wave" then
        v223 = v222.voidElapsed * 6; v224 = math.max(v222.currentDistance * 3000, 2e9)
        return Vector3.new(v222.voidX + math.cos(v223 * 0.4) * v224, v222.voidYBase + math.sin(v223) * v224 * 0.35, v222.voidZ + math.sin(v223 * 0.4) * v224)
    elseif v222.voidSpamMode == "Square Loop" then
        v223 = math.max(v222.currentDistance * 4000, 3e9); v224 = v222.voidElapsed * 1.8 % 4
        local v225, v226, v227, v228 = math.floor(v224), v224 - math.floor(v224), 0, 0
        if v225 == 0 then v227, v228 = -v223 + v226 * 2 * v223, -v223
        elseif v225 == 1 then v227, v228 = v223, -v223 + v226 * 2 * v223
        elseif v225 == 2 then v227, v228 = v223 - v226 * 2 * v223, v223
        else v227, v228 = -v223, v223 - v226 * 2 * v223 end
        return Vector3.new(v222.voidX + v227, v222.voidYBase + math.sin(v222.voidElapsed * 8) * v223 * 0.05, v222.voidZ + v228)
    elseif v222.voidSpamMode == "Cross Sweep" then
        v223 = math.max(v222.currentDistance * 6000, 4e9); v224 = v222.voidElapsed * 4
        local v225, v226 = math.floor(v224) % 4, math.sin(v224 * math.pi) * v223
        if v225 == 0 then return Vector3.new(v222.voidX + v226, v222.voidYBase, v222.voidZ)
        elseif v225 == 1 then return Vector3.new(v222.voidX, v222.voidYBase + math.sin(v224) * v223 * 0.08, v222.voidZ + v226)
        elseif v225 == 2 then return Vector3.new(v222.voidX - v226, v222.voidYBase, v222.voidZ)
        else return Vector3.new(v222.voidX, v222.voidYBase - math.sin(v224) * v223 * 0.08, v222.voidZ - v226) end
    elseif v222.voidSpamMode == "Stacked Steps" then
        v223 = math.max(v222.currentDistance * 3500, 2e9); v224 = math.floor(v222.voidElapsed * 7)
        return Vector3.new(v222.voidX + (v224 % 7 - 3) * v223, v222.voidYBase + v224 % 5 * v223 * 0.12, v222.voidZ + (math.floor(v224 / 7) % 7 - 3) * v223)
    elseif v222.voidSpamMode == "Noise Cloud" then
        v223 = math.max(v222.currentDistance * 5000, 4e9); v224 = v222.voidElapsed * 1.5
        return Vector3.new(v222.voidX + math.noise(v224, 0, 0) * v223, v222.voidYBase + math.noise(0, v224, 0) * v223 * 0.25, v222.voidZ + math.noise(0, 0, v224) * v223)
    else
        v223 = math.max(v222.currentDistance * 10000, 1e11); v224 = 0.5 < math.random() and 1 or -1
        local v225 = Vector3.new(math.random(-1e9, 1e9), math.random(-1e8, 1e8), math.random(-1e9, 1e9))
        return Vector3.new(v222.voidX + v223 * v224, v222.voidYBase + v225.Y, v222.voidZ + v223 * v224) + v225
    end
end
local function fn11(arg1, arg2)
    if not v5 then return false end
    arg1, arg2 = arg1 or tbl5.teleportInterval, arg2 or tbl5.voidElapsed + (arg1 or tbl5.teleportInterval) * 28
    local v236
    if tbl5.teleportMode == "VOID_HIDE" then
        if not tbl5.voidHideLastCFrame then tbl5.voidHideLastCFrame = v5.CFrame end
        v236 = fn7(); if v236 then fn6(v236) end; return true
    elseif tbl5.teleportMode == "VOID_SPAM" then fn6(fn10(arg1)); return true
    else
        if tbl5.teleportMode == "FORWARD" then v236 = v5.CFrame.LookVector * tbl5.currentDistance
        elseif tbl5.teleportMode == "CAMERA" and workspace.CurrentCamera then v236 = workspace.CurrentCamera.CFrame.LookVector * tbl5.currentDistance
        elseif tbl5.teleportMode == "DIRECTIONAL" then v236 = fn8()
        else
            local v237 = tbl5.currentDistance * (0.6 + 0.4 * math.sin(arg2 * 2.3))
            local v238 = tbl5.currentDistance * (0.25 + 0.15 * math.sin(arg2 * 5.7))
            local v239 = tbl5.currentDistance * (0.1 + 0.1 * math.sin(arg2 * 11.3))
            local v240 = math.cos(arg2 * 7.1) * v237 + math.cos(arg2 * 13.4) * v238 + math.cos(arg2 * 21.9) * v239
            local v241 = math.sin(arg2 * 7.1) * v237 + math.sin(arg2 * 13.4) * v238 + math.sin(arg2 * 21.9) * v239
            local v242 = math.sin(arg2 * 9) * v237 * 0.4 + math.sin(arg2 * 17) * v238 * 0.3
            v236 = Vector3.new(v240 + (math.noise(arg2 * 6, 0, 0) * tbl5.jitterStrength * 3 + (math.random() - 0.5) * tbl5.jitterStrength * 2.5), v242 + (math.noise(0, arg2 * 6, 0) * tbl5.jitterStrength * 1.5 + (math.random() - 0.5) * tbl5.jitterStrength * 1.2), v241 + (math.noise(0, 0, arg2 * 6) * tbl5.jitterStrength * 3 + (math.random() - 0.5) * tbl5.jitterStrength * 2.5))
        end
        fn5(v5.Position + v236); return true
    end
end
local function fn12()
    tbl5.teleportConnection = fn3(tbl5.teleportConnection)
    if v5 then tbl5.originalCFrame = v5.CFrame end
    local num21 = 0
    tbl5.teleportConnection = RunService.Heartbeat:Connect(function(arg1)
        if not tbl5.running or not v5 or tick() - tbl5.lastTeleport < tbl5.teleportInterval then return end
        tbl5.lastTeleport = tick(); num21 = num21 + arg1 * 28; fn11(arg1, num21)
    end)
end
local function fn13()
    tbl5.teleportConnection = fn3(tbl5.teleportConnection)
    if tbl5.teleportMode == "VOID_HIDE" and v5 and tbl5.voidHideLastCFrame then
        v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity, v5.CFrame = Vector3.zero, Vector3.zero, tbl5.voidHideLastCFrame; tbl5.voidHideLastCFrame = nil
    elseif v5 and tbl5.originalCFrame then
        v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity, v5.CFrame = Vector3.zero, Vector3.zero, tbl5.originalCFrame
    end
    tbl5.originalCFrame = nil
end
local function fn14()
    tbl5.riotConnection = fn3(tbl5.riotConnection); if v5 then tbl5.riotOriginalCFrame = v5.CFrame end
    local v252, v253 = tick(), math.random(1000, 9999)
    tbl5.riotConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.riotRunning and v5 then
            local v254 = tick() - v252; local v255 = tbl5.riotDistance / 300; local v256 = math.rad(tbl5.spinSpeed * arg1)
            local v257 = v5.CFrame * CFrame.Angles(math.rad(tbl5.spinSpeed * 0.37 * arg1 * math.sin(v254 * 3.1)), v256, math.rad(tbl5.spinSpeed * 0.19 * arg1 * math.cos(v254 * 5.7 + v253)))
            local v258 = (math.random() - 0.5) * tbl5.riotXJitter * v255 * 2 + math.noise(v254 * 9, v253, 0) * tbl5.riotXJitter * v255
            local v259 = (math.random() - 0.5) * tbl5.riotYJitter * v255 + math.noise(0, v254 * 9, v253) * tbl5.riotYJitter * v255 * 0.3
            local v260 = (math.random() - 0.5) * tbl5.riotXJitter * v255 * 2 + math.noise(0, 0, v254 * 9 + v253) * tbl5.riotXJitter * v255
            v5.CFrame = v257 + Vector3.new(v258, math.max(v257.Position.Y + v259, num) - v257.Position.Y, v260)
        end
    end)
end
local function fn15()
    tbl5.riotConnection = fn3(tbl5.riotConnection)
    if v5 and tbl5.riotOriginalCFrame then v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity, v5.CFrame = Vector3.zero, Vector3.zero, tbl5.riotOriginalCFrame end
    tbl5.riotOriginalCFrame = nil
end
local function fn16()
    tbl5.velocityPulseConnection = fn3(tbl5.velocityPulseConnection); local num23 = 0
    tbl5.velocityPulseConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.velocityPulseEnabled and v5 then
            num23 = num23 + arg1 * math.max(tbl5.spinSpeed / 180, 0.1)
            local v263, v264 = math.clamp(tbl5.riotDistance * 0.35, 0, 220), math.clamp(tbl5.riotYJitter * 4, 0, 120)
            v5.AssemblyLinearVelocity = Vector3.new(math.cos(num23) * v263, v264, math.sin(num23) * v263)
            v5.AssemblyAngularVelocity = Vector3.new(0, math.rad(math.clamp(tbl5.spinSpeed, 0, 1440)), 0)
        end
    end)
end
local function fn17() tbl5.velocityPulseConnection = fn3(tbl5.velocityPulseConnection); if v5 then v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = Vector3.zero, Vector3.zero end end
local function fn18() return tbl5.offsetDesyncEnabled or tbl5.burstDesyncEnabled or tbl5.anchorStutterEnabled end
local function fn19()
    if v5 and tbl5.desyncOriginalAnchored ~= nil then v5.Anchored = tbl5.desyncOriginalAnchored end
    tbl5.desyncOriginalAnchored = nil; tbl5.desyncStutterAnchored = false; tbl5.desyncStutterClock = 0
end
local function fn20() if v5 then v5.AssemblyLinearVelocity = Vector3.zero end end
local function fn21() tbl5.desyncConnection = fn3(tbl5.desyncConnection); tbl5.desyncPulseClock, tbl5.desyncBurstClock = 0, 0; fn20(); fn19() end
local function fn22()
    if not tbl5.desyncConnection then
        tbl5.desyncConnection = RunService.Heartbeat:Connect(function(arg1)
            if not fn18() then fn21(); return end
            if v5 then
                if tbl5.offsetDesyncEnabled then
                    tbl5.desyncPulseClock = tbl5.desyncPulseClock + arg1
                    if tbl5.desyncPulseDelay <= tbl5.desyncPulseClock then
                        tbl5.desyncPulseClock = 0; local unit2 = tick() * 3
                        local v266 = Vector3.new(math.sin(unit2) * tbl5.desyncOffsetAmount, math.sin(unit2 * 1.7) * tbl5.desyncOffsetAmount * 0.35, math.cos(unit2) * tbl5.desyncOffsetAmount) * 40
                        v5.AssemblyLinearVelocity = Vector3.new(v266.X, v5.AssemblyLinearVelocity.Y + v266.Y, v266.Z)
                        task.delay(0.05, function() if v5 and v5.Parent and tbl5.offsetDesyncEnabled then fn20() end end)
                    end
                end
                if tbl5.burstDesyncEnabled then
                    tbl5.desyncBurstClock = tbl5.desyncBurstClock + arg1
                    if 0.025 <= tbl5.desyncBurstClock then
                        tbl5.desyncBurstClock = 0; local unit2 = Vector3.new(math.random() - 0.5, 0, math.random() - 0.5)
                        unit2 = unit2.Magnitude < 0.01 and Vector3.new(1, 0, 0) or unit2.Unit
                        v5.AssemblyLinearVelocity = Vector3.new(unit2.X * tbl5.desyncBurstPower, v5.AssemblyLinearVelocity.Y + (math.random() - 0.5) * tbl5.desyncBurstPower * 0.2, unit2.Z * tbl5.desyncBurstPower)
                        task.delay(0.05, function() if v5 and v5.Parent and tbl5.burstDesyncEnabled then fn20() end end)
                    end
                end
                if tbl5.anchorStutterEnabled and not tbl5.freezeCharacterEnabled then
                    if tbl5.desyncOriginalAnchored == nil then tbl5.desyncOriginalAnchored = v5.Anchored end
                    tbl5.desyncStutterClock = tbl5.desyncStutterClock + arg1
                    if tbl5.desyncStutterDelay <= tbl5.desyncStutterClock then
                        tbl5.desyncStutterClock = 0; tbl5.desyncStutterAnchored = not tbl5.desyncStutterAnchored; v5.Anchored = tbl5.desyncStutterAnchored
                    end
                elseif tbl5.desyncOriginalAnchored ~= nil then fn19() end
            end
        end)
    end
end
local function fn23() if not tbl5.anchorStutterEnabled and tbl5.desyncOriginalAnchored ~= nil then fn19() end; if fn18() then fn22() else fn21() end end
local function fn24() return v4 and v4:FindFirstChildOfClass("Humanoid") end
local function fn25(arg1) if arg1 then tbl5.originalJumpPower = tbl5.originalJumpPower or arg1.JumpPower; tbl5.originalJumpHeight = tbl5.originalJumpHeight or arg1.JumpHeight end end
local function fn26() local v268 = fn24(); if v268 then fn25(v268); if tbl5.customJumpEnabled then pcall(function() v268.UseJumpPower = true end); v268.JumpPower = tbl5.jumpPowerValue end end end
local function fn27() local v270 = fn24(); if v270 then if tbl5.originalJumpPower then v270.JumpPower = tbl5.originalJumpPower end; if tbl5.originalJumpHeight then v270.JumpHeight = tbl5.originalJumpHeight end end end
local function fn28(arg1)
    tbl5.freezeCharacterEnabled = arg1
    if v5 then
        if arg1 then
            tbl5.previousRootAnchored = tbl5.previousRootAnchored == nil and v5.Anchored or tbl5.previousRootAnchored
            v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity, v5.Anchored = Vector3.zero, Vector3.zero, true
        else v5.Anchored = tbl5.previousRootAnchored == true; tbl5.previousRootAnchored = nil end
    elseif not arg1 then tbl5.previousRootAnchored = nil end
end
local function fn29(arg1) tbl5.customGravityEnabled = arg1; workspace.Gravity = arg1 and tbl5.gravityValue or tbl5.originalGravity end
local function fn30() if v5 then tbl5.homeCFrame = v5.CFrame; tbl5.homePosition = v5.Position end end
local function fn31() if v5 and tbl5.homeCFrame then v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity, v5.CFrame = Vector3.zero, Vector3.zero, tbl5.homeCFrame end end
local function fn32()
    tbl5.homeConnection = fn3(tbl5.homeConnection); if not tbl5.homeCFrame and v5 then fn30() end
    local num26, num27 = 0, 0
    tbl5.homeConnection = RunService.Heartbeat:Connect(function()
        if tick() - num27 < 0.1 then return end; num27 = tick()
        if tbl5.returnHomeEnabled and v5 and tbl5.homePosition and tbl5.homeCFrame and tbl5.homeReturnDistance < (v5.Position - tbl5.homePosition).Magnitude and tbl5.homeReturnDelay <= tick() - num26 then num26 = tick(); fn31() end
    end)
end
local function fn33() tbl5.homeConnection = fn3(tbl5.homeConnection) end
local function fn34()
    tbl5.orientationOffsetConnection = fn3(tbl5.orientationOffsetConnection); local unit4 = nil
    if v5 then unit4 = Vector3.new(v5.CFrame.LookVector.X, 0, v5.CFrame.LookVector.Z); unit4 = unit4.Magnitude < 0.01 and Vector3.new(0, 0, -1) or unit4.Unit end
    tbl5.orientationOffsetConnection = RunService.Heartbeat:Connect(function()
        if tbl5.orientationOffsetEnabled and v5 then v5.CFrame = CFrame.lookAt(v5.Position, v5.Position + (unit4 or Vector3.new(0, 0, -1))) * CFrame.Angles(math.rad(tbl5.orientationOffsetPitch), math.rad(tbl5.orientationOffsetYaw), math.rad(tbl5.orientationOffsetRoll)) end
    end)
end
local function fn35() tbl5.orientationOffsetConnection = fn3(tbl5.orientationOffsetConnection) end
local function fn36()
    if tbl5.flyConnection then tbl5.flyConnection:Disconnect() end
    local v274 = fn24(); if v274 then v274:ChangeState(Enum.HumanoidStateType.Physics) end
    tbl5.flyConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.flyEnabled and v5 then
            local v275 = fn24(); if v275 then v275:ChangeState(Enum.HumanoidStateType.Physics) end
            local currentCamera2 = workspace.CurrentCamera; local zero2 = Vector3.zero
            if v275 and 0 < v275.MoveDirection.Magnitude then
                local v276 = Vector3.new(currentCamera2.CFrame.LookVector.X, 0, currentCamera2.CFrame.LookVector.Z)
                zero2 = v276.Magnitude > 0.001 and Vector3.new(v275.MoveDirection.X, currentCamera2.CFrame.LookVector.Y * v275.MoveDirection:Dot(v276.Unit), v275.MoveDirection.Z) or Vector3.new(v275.MoveDirection.X, currentCamera2.CFrame.LookVector.Y, v275.MoveDirection.Z)
            end
            if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then zero2 = zero2 + Vector3.new(0, 1, 0) end
            if UserInputService2:IsKeyDown(Enum.KeyCode.LeftShift) then zero2 = zero2 - Vector3.new(0, 1, 0) end
            v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
            if 0 < zero2.Magnitude then v5.CFrame = v5.CFrame + zero2.Unit * (tbl5.flySpeed * arg1) end
        end
    end)
end
local function fn37() tbl5.flyConnection = fn3(tbl5.flyConnection); if v5 then v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = Vector3.zero, Vector3.zero end; local v278 = fn24(); if v278 then v278:ChangeState(Enum.HumanoidStateType.GettingUp) end end
local function fn38() if tbl5.noclip and v4 then for k13, v280 in ipairs(v4:GetDescendants()) do if v280:IsA("BasePart") then v280.CanCollide = false end end end end
local function fn39()
    if tbl5.fakePositionConnection then tbl5.fakePositionConnection:Disconnect() end
    if tbl5.fakePositionRender then tbl5.fakePositionRender:Disconnect() end
    tbl5.fakePositionConnection = RunService.Heartbeat:Connect(function() if tbl5.fakePositionEnabled and v5 then tbl5.fakeRealCF = v5.CFrame; v5.CFrame = tbl5.fakeRealCF + Vector3.new(math.random(-150, 150), math.random(10, 100), math.random(-150, 150)) end end)
    tbl5.fakePositionRender = RunService.RenderStepped:Connect(function() if tbl5.fakePositionEnabled and v5 and tbl5.fakeRealCF then v5.CFrame = tbl5.fakeRealCF end end)
end
local function fn40() tbl5.fakePositionConnection = fn3(tbl5.fakePositionConnection); tbl5.fakePositionRender = fn3(tbl5.fakePositionRender); tbl5.fakeRealCF = nil end
local function fn41()
    if tbl5.velocityDesyncHeartbeat then tbl5.velocityDesyncHeartbeat:Disconnect() end
    if tbl5.velocityDesyncRender then tbl5.velocityDesyncRender:Disconnect() end
    tbl5.velocityDesyncHeartbeat = RunService.Heartbeat:Connect(function() if tbl5.velocityDesyncEnabled and v5 then tbl5.velocityRealVel = v5.AssemblyLinearVelocity; v5.AssemblyLinearVelocity = Vector3.new(math.random(-5000, 5000), math.random(-5000, 5000), math.random(-5000, 5000)) end end)
    tbl5.velocityDesyncRender = RunService.RenderStepped:Connect(function() if tbl5.velocityDesyncEnabled and v5 and tbl5.velocityRealVel then v5.AssemblyLinearVelocity = tbl5.velocityRealVel end end)
end
local function fn42() tbl5.velocityDesyncHeartbeat = fn3(tbl5.velocityDesyncHeartbeat); tbl5.velocityDesyncRender = fn3(tbl5.velocityDesyncRender); tbl5.velocityRealVel = nil end
local function fn43()
    if tbl5.glideConnection then tbl5.glideConnection:Disconnect() end
    local v285 = fn24(); if v285 then v285:ChangeState(Enum.HumanoidStateType.Physics) end
    local zero5 = Vector3.zero
    tbl5.glideConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.glideEnabled and v5 then
            local currentCamera4 = workspace.CurrentCamera; local v286 = currentCamera4 and currentCamera4.CFrame or v5.CFrame
            local unit7 = Vector3.new(v286.LookVector.X, 0, v286.LookVector.Z).Unit; local unit8 = Vector3.new(v286.RightVector.X, 0, v286.RightVector.Z).Unit
            local v287 = fn24(); local v288 = v287 and v287.MoveDirection or Vector3.zero; local zero6 = Vector3.zero
            if 0.001 < v288.Magnitude then zero6 = unit7 * v288:Dot(unit7) + unit8 * v288:Dot(unit8); if 0.001 < zero6.Magnitude then zero6 = zero6.Unit end end
            zero5 = zero5:Lerp(zero6 * tbl5.glideSpeed, 1 - math.exp(-math.clamp(tbl5.glideAccel, 1, 100) * arg1))
            v5.AssemblyLinearVelocity = Vector3.new(zero5.X, v5.AssemblyLinearVelocity.Y, zero5.Z)
        end
    end)
end
local function fn44() tbl5.glideConnection = fn3(tbl5.glideConnection) end
local function fn45()
    if tbl5.underMapConnection then tbl5.underMapConnection:Disconnect() end
    tbl5.underMapConnection = RunService.Heartbeat:Connect(function()
        if tbl5.underMapEnabled and v5 then
            if v4 then for k15, v290 in ipairs(v4:GetDescendants()) do if v290:IsA("BasePart") then v290.CanCollide = false end end end
            v5.CFrame = CFrame.new(v5.Position.X, tbl5.underMapY, v5.Position.Z)
        end
    end)
end
local function fn46() tbl5.underMapConnection = fn3(tbl5.underMapConnection) end
local function fn47()
    if tbl5.riotAbuserConnection then tbl5.riotAbuserConnection:Disconnect() end
    local v300, v301 = tick(), math.random(1000, 9999); if v5 then tbl5.riotAbuserOriginal = v5.CFrame end
    tbl5.riotAbuserConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.riotAbuserEnabled and v5 then
            local v302 = tick() - v300; local v303 = math.rad(tbl5.riotAbuserSpin * arg1)
            local v304 = v5.CFrame * CFrame.Angles(math.rad(tbl5.riotAbuserSpin * 0.37 * arg1 * math.sin(v302 * 3.1)), v303, math.rad(tbl5.riotAbuserSpin * 0.19 * arg1 * math.cos(v302 * 5.7 + v301)))
            local v305 = tbl5.riotAbuserDistance / 300
            local v306 = (math.random() - 0.5) * tbl5.riotAbuserX * v305 * 2 + math.noise(v302 * 9, v301, 0) * tbl5.riotAbuserX * v305
            local v307 = (math.random() - 0.5) * tbl5.riotAbuserY * v305 + math.noise(0, v302 * 9, v301) * tbl5.riotAbuserY * v305 * 0.3
            local v308 = (math.random() - 0.5) * tbl5.riotAbuserZ * v305 * 2 + math.noise(0, 0, v302 * 9 + v301) * tbl5.riotAbuserZ * v305
            v5.CFrame = v304 + Vector3.new(v306, math.max(v304.Position.Y + v307, num) - v304.Position.Y, v308)
        end
    end)
end
local function fn48() tbl5.riotAbuserConnection = fn3(tbl5.riotAbuserConnection); if v5 and tbl5.riotAbuserOriginal then v5.CFrame = tbl5.riotAbuserOriginal end; tbl5.riotAbuserOriginal = nil end
local function fn49()
    if tbl5.antiProjConnection then tbl5.antiProjConnection:Disconnect() end
    if tbl5.antiProjA then tbl5.antiProjA:Disconnect() end; if tbl5.antiProjB then tbl5.antiProjB:Disconnect() end
    tbl5.antiProjList = {}
    tbl5.antiProjA = workspace.ChildAdded:Connect(function(arg1) if arg1:IsA("BasePart") then if arg1.Name == "CoreProjectile" then tbl5.antiProjList[arg1] = true elseif arg1.Name == "Part" then task.defer(function() if arg1 and arg1.Parent and 50 < arg1.AssemblyLinearVelocity.Magnitude then tbl5.antiProjList[arg1] = true end end) end end end)
    tbl5.antiProjB = workspace.ChildRemoved:Connect(function(arg1) tbl5.antiProjList[arg1] = nil end)
    tbl5.antiProjConnection = RunService.Heartbeat:Connect(function()
        if tbl5.antiProjEnabled then
            pcall(function()
                for k17, v310 in pairs(Players:GetPlayers()) do if v310 ~= localPlayer and v310.Character then local humanoidRootPart2 = v310.Character:FindFirstChild("HumanoidRootPart"); if humanoidRootPart2 then humanoidRootPart2.CFrame, humanoidRootPart2.AssemblyLinearVelocity, humanoidRootPart2.AssemblyAngularVelocity = tbl5.antiProjTarget, Vector3.zero, Vector3.zero end end end
                for k17, v310 in pairs(workspace:GetChildren()) do if v310.Name == "CoreProjectile" and v310:IsA("BasePart") then v310.CFrame, v310.AssemblyLinearVelocity = tbl5.antiProjTarget, Vector3.zero end end
                for k17 in pairs(tbl5.antiProjList) do if k17 and k17.Parent then k17.CFrame, k17.AssemblyLinearVelocity = tbl5.antiProjTarget, Vector3.zero else tbl5.antiProjList[k17] = nil end end
            end)
        end
    end)
end
local function fn50() tbl5.antiProjConnection = fn3(tbl5.antiProjConnection); if tbl5.antiProjA then tbl5.antiProjA:Disconnect(); tbl5.antiProjA = nil end; if tbl5.antiProjB then tbl5.antiProjB:Disconnect(); tbl5.antiProjB = nil end; tbl5.antiProjList = {} end
local function fn51()
    local v313, huge2 = nil, math.huge
    if v5 then
        for k19, v314 in pairs(Players:GetPlayers()) do
            if v314 ~= localPlayer and v314.Character and v314.Character:FindFirstChild("HumanoidRootPart") then
                local humanoid2 = v314.Character:FindFirstChildOfClass("Humanoid")
                if humanoid2 and 0 < humanoid2.Health then
                    local magnitude2 = (v5.Position - v314.Character.HumanoidRootPart.Position).Magnitude
                    if magnitude2 < huge2 then huge2, v313 = magnitude2, v314 end
                end
            end
        end
        return v313
    end
    return nil
end
local function fn52()
    if tbl5.riotBypassConnection then tbl5.riotBypassConnection:Disconnect() end
    tbl5.riotBypassLastSnap = 0
    tbl5.riotBypassConnection = RunService.Heartbeat:Connect(function()
        if not tbl5.riotBypassEnabled or not v5 then return end
        if not tbl5.riotBypassTarget or not tbl5.riotBypassTarget.Character or not tbl5.riotBypassTarget.Character:FindFirstChild("Humanoid") or tbl5.riotBypassTarget.Character.Humanoid.Health <= 0 then tbl5.riotBypassTarget = fn51(); return end
        local humanoidRootPart4 = tbl5.riotBypassTarget.Character:FindFirstChild("HumanoidRootPart"); if not humanoidRootPart4 then return end
        local v317 = tick()
        if v317 - tbl5.riotBypassLastSnap >= tbl5.riotBypassUpdate then
            tbl5.riotBypassLastSnap = v317; local position2, lookVector2 = humanoidRootPart4.Position, humanoidRootPart4.CFrame.LookVector
            local riotBypassDistance2, riotBypassHeight2, riotBypassPosition2 = tbl5.riotBypassDistance, tbl5.riotBypassHeight, tbl5.riotBypassPosition
            local v318
            if riotBypassPosition2 == "Front" then v318 = CFrame.lookAt(position2 + lookVector2 * riotBypassDistance2 + Vector3.new(0, riotBypassHeight2, 0), position2 + Vector3.new(0, riotBypassHeight2, 0))
            elseif riotBypassPosition2 == "Back" then v318 = CFrame.lookAt(position2 - lookVector2 * riotBypassDistance2 + Vector3.new(0, riotBypassHeight2, 0), position2 + Vector3.new(0, riotBypassHeight2, 0))
            elseif riotBypassPosition2 == "Above" then v318 = CFrame.lookAt(position2 + Vector3.new(0, riotBypassDistance2 + riotBypassHeight2, 0), position2 + Vector3.new(0, riotBypassHeight2, 0))
            elseif riotBypassPosition2 == "Below" then v318 = CFrame.lookAt(position2 + Vector3.new(0, -riotBypassDistance2 + riotBypassHeight2, 0), position2 + Vector3.new(0, riotBypassHeight2, 0))
            else v318 = CFrame.lookAt(position2 + lookVector2 * riotBypassDistance2 + Vector3.new(0, riotBypassHeight2, 0), position2 + Vector3.new(0, riotBypassHeight2, 0)) end
            v5.CFrame, v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = v318, Vector3.zero, Vector3.zero
        end
    end)
end
local function fn53() tbl5.riotBypassConnection = fn3(tbl5.riotBypassConnection); tbl5.riotBypassTarget, tbl5.riotBypassLastSnap = nil, 0 end
local function fn54()
    if tbl5.evasionConnection then tbl5.evasionConnection:Disconnect() end
    local v330, v331, v332, v333 = tick(), math.random(1000, 9000), math.random(1000, 9000), math.random(1000, 9000)
    tbl5.evasionConnection = RunService.Heartbeat:Connect(function()
        if tbl5.evasionEnabled and v5 then
            local v334 = tick() - v330; local evasionIntensity2 = tbl5.evasionIntensity
            local v335, v336, v337 = 500 * 0.18 * evasionIntensity2, 500 * 0.35 * evasionIntensity2, 500 * 0.55 * evasionIntensity2
            local v338 = math.cos(v334 * 18.7) * v335 + math.cos(v334 * 7.3 + v331) * v336 + math.cos(v334 * 2.1 + v332) * v337
            local v339 = math.sin(v334 * 18.7) * v335 + math.sin(v334 * 7.3 + v331) * v336 + math.sin(v334 * 2.1 + v332) * v337
            local v340 = math.sin(v334 * 11.3 + v333) * 500 * 0.12 * evasionIntensity2 + math.sin(v334 * 5.7) * 500 * 0.08 * evasionIntensity2
            fn5(v5.Position + Vector3.new(v338 + math.noise(v334 * 8, v331, 0) * 40 * evasionIntensity2, v340 + math.noise(0, v334 * 8, v332) * 20 * evasionIntensity2, v339 + math.noise(0, 0, v334 * 8 + v333) * 40 * evasionIntensity2))
        end
    end)
end
local function fn55() tbl5.evasionConnection = fn3(tbl5.evasionConnection) end
local function fn56()
    if tbl5.blinkConnection then tbl5.blinkConnection:Disconnect() end
    if v5 then tbl5.blinkAnchor = v5.Position end
    local num30, num31, v345 = 0, 0, math.random(1000, 9000)
    tbl5.blinkConnection = RunService.Heartbeat:Connect(function(arg1)
        if tbl5.blinkEnabled and v5 then
            num31 = num31 + arg1; tbl5.blinkAnchor = (tbl5.blinkAnchor or v5.Position) + Vector3.new(math.sin(num31 * 1.3 + v345) * 12, math.sin(num31 * 2.1) * 3, math.cos(num31 * 1.7 + v345) * 12) * arg1
            local v346 = tick()
            if 1 / tbl5.blinkRate <= v346 - num30 then
                num30 = v346; local v347, v348 = math.random() * math.pi * 2, math.random() * tbl5.blinkRadius
                fn5(Vector3.new(tbl5.blinkAnchor.X + math.cos(v347) * v348, tbl5.blinkAnchor.Y + (math.random() - 0.5) * tbl5.blinkRadius * 0.3, tbl5.blinkAnchor.Z + math.sin(v347) * v348))
            end
        end
    end)
end
local function fn57() tbl5.blinkConnection = fn3(tbl5.blinkConnection) end
local function fn58()
    if tbl5.ghostConnection then tbl5.ghostConnection:Disconnect() end
    local flag20, v352, v353 = false, tick(), math.random(1000, 9000)
    tbl5.ghostConnection = RunService.Heartbeat:Connect(function()
        if tbl5.ghostEnabled and v5 then
            flag20 = not flag20
            if flag20 then local v354 = (tick() - v352) * 4.3 + v353; fn5(Vector3.new(v5.Position.X + math.cos(v354) * tbl5.ghostDistance, v5.Position.Y, v5.Position.Z + math.sin(v354) * tbl5.ghostDistance)) end
        end
    end)
end
local function fn59() tbl5.ghostConnection = fn3(tbl5.ghostConnection) end
local function fn60()
    if tbl5.autoCollectConnection then tbl5.autoCollectConnection:Disconnect() end
    tbl5.autoCollectConnection = RunService.Heartbeat:Connect(function()
        if tbl5.autoCollectEnabled and v5 then
            local position4, huge4 = nil, math.huge
            for k21, v358 in ipairs(workspace:GetDescendants()) do
                local v359 = v358.Name:lower()
                if v359:find("heal") or v359:find("health") or v359:find("medkit") or v359:find("bandage") then
                    local v360 = v358:IsA("Model") and (v358.PrimaryPart or v358:FindFirstChildWhichIsA("BasePart")) or (v358:IsA("BasePart") and v358 or nil)
                    if v360 then
                        local magnitude4 = (v360.Position - v5.Position).Magnitude
                        if magnitude4 < huge4 and magnitude4 <= tbl5.autoCollectRadius then huge4, position4 = magnitude4, v360.Position end
                    end
                end
            end
            if position4 then fn5(position4) end
        end
    end)
end
local function fn61() tbl5.autoCollectConnection = fn3(tbl5.autoCollectConnection) end
local function fn62()
    if tbl5.safeZoneConnection then tbl5.safeZoneConnection:Disconnect() end
    tbl5.safeZoneConnection = RunService.Heartbeat:Connect(function()
        if v5 then
            if tbl5.safeZoneY < v5.Position.Y then tbl5.safeZoneSavedPos = v5.Position
            elseif tbl5.safeZoneEnabled and tbl5.safeZoneSavedPos then v5.CFrame = CFrame.new(tbl5.safeZoneSavedPos) end
        end
    end)
end
local function fn63() tbl5.safeZoneConnection = fn3(tbl5.safeZoneConnection) end
local function fn64()
    if v5 then
        local v364 = v5.Position.Y - tbl5.undergroundDepth
        tbl5.undergroundLockedY, tbl5.undergroundLocked, tbl5.undergroundEnabled = v364, true, true
        v5.CFrame, v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = CFrame.new(v5.Position.X, v364, v5.Position.Z), Vector3.zero, Vector3.zero
        local v365 = fn24(); if v365 then v365.PlatformStand, v365.AutoRotate = true, false end
        if tbl5.undergroundConnection then tbl5.undergroundConnection:Disconnect() end
        tbl5.undergroundConnection = RunService.Heartbeat:Connect(function()
            if not tbl5.undergroundLocked or not v5 then if tbl5.undergroundConnection then tbl5.undergroundConnection:Disconnect(); tbl5.undergroundConnection = nil end
            else
                if 0.5 < math.abs(v5.Position.Y - tbl5.undergroundLockedY) then v5.CFrame = CFrame.new(v5.Position.X, tbl5.undergroundLockedY, v5.Position.Z) end
                v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
                local v366 = fn24(); if v366 then v366.PlatformStand, v366.AutoRotate = true, false end
            end
        end)
    end
end
local function fn65()
    tbl5.undergroundLocked, tbl5.undergroundEnabled = false, false
    if tbl5.undergroundConnection then tbl5.undergroundConnection:Disconnect(); tbl5.undergroundConnection = nil end
    if v5 then
        v5.CFrame = CFrame.new(v5.Position.X, v5.Position.Y + tbl5.undergroundDepth + 3, v5.Position.Z)
        v5.AssemblyLinearVelocity, v5.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
        local v368 = fn24(); if v368 then v368.PlatformStand, v368.AutoRotate = false, true end
    end
end
local function fn66()
    if tbl5.autoHealthConnection then tbl5.autoHealthConnection:Disconnect(); tbl5.autoHealthConnection = nil end
    if tbl5.autoHealthEnabled then
        local v370 = fn24()
        if v370 then tbl5.autoHealthConnection = v370.HealthChanged:Connect(function(arg1) if arg1 < tbl5.autoHealthThreshold and not tbl5.undergroundLocked then fn64() end end) end
    end
end

local flag = false
local str = "Cyber"
local tbl6 = {}
local v6 = nil
local tbl7 = {
    bloomIntensity = 0.45, bloomSize = 36, bloomThreshold = 1,
    sunRaysIntensity = 0.08, blurSize = 0, brightness = 2.4,
    contrast = 0.35, saturation = 0.2, tintColor = Color3.fromRGB(206, 54, 54)
}
local tbl8 = {
    Cyber = { Brightness = 2.4, Contrast = 0.35, Saturation = 0.2, TintColor = Color3.fromRGB(206, 54, 54), BloomIntensity = 0.45, BloomSize = 36, SunRaysIntensity = 0.08, BlurSize = 0 },
    Void = { Brightness = 1.6, Contrast = 0.55, Saturation = -0.1, TintColor = Color3.fromRGB(170, 145, 255), BloomIntensity = 0.7, BloomSize = 48, SunRaysIntensity = 0.03, BlurSize = 0 },
    Warm = { Brightness = 2.1, Contrast = 0.25, Saturation = 0.25, TintColor = Color3.fromRGB(255, 215, 180), BloomIntensity = 0.35, BloomSize = 30, SunRaysIntensity = 0.1, BlurSize = 0 },
    Cold = { Brightness = 1.9, Contrast = 0.3, Saturation = 0.05, TintColor = Color3.fromRGB(170, 220, 255), BloomIntensity = 0.4, BloomSize = 34, SunRaysIntensity = 0.05, BlurSize = 0 },
    Cinematic = { Brightness = 1.7, Contrast = 0.45, Saturation = -0.05, TintColor = Color3.fromRGB(235, 225, 210), BloomIntensity = 0.25, BloomSize = 24, SunRaysIntensity = 0.12, BlurSize = 1 },
    Neon = { Brightness = 2.8, Contrast = 0.5, Saturation = 0.45, TintColor = Color3.fromRGB(190, 255, 245), BloomIntensity = 0.9, BloomSize = 56, SunRaysIntensity = 0.06, BlurSize = 0 },
    Moonlight = { Brightness = 1.45, Contrast = 0.38, Saturation = -0.18, TintColor = Color3.fromRGB(165, 185, 255), BloomIntensity = 0.28, BloomSize = 28, SunRaysIntensity = 0.02, BlurSize = 0 },
    GoldenHour = { Brightness = 2.25, Contrast = 0.32, Saturation = 0.3, TintColor = Color3.fromRGB(255, 198, 130), BloomIntensity = 0.5, BloomSize = 42, SunRaysIntensity = 0.18, BlurSize = 0 },
    DeepFried = { Brightness = 3.1, Contrast = 0.75, Saturation = 0.85, TintColor = Color3.fromRGB(255, 235, 185), BloomIntensity = 1.1, BloomSize = 64, SunRaysIntensity = 0.16, BlurSize = 0 },
    Soft = { Brightness = 1.9, Contrast = 0.12, Saturation = 0.08, TintColor = Color3.fromRGB(235, 238, 255), BloomIntensity = 0.18, BloomSize = 22, SunRaysIntensity = 0.04, BlurSize = 1 }
}
local function fn67()
    if not v6 then
        local Lighting2 = game:GetService("Lighting")
        v6 = { Brightness = Lighting2.Brightness, ClockTime = Lighting2.ClockTime, Ambient = Lighting2.Ambient, OutdoorAmbient = Lighting2.OutdoorAmbient, FogEnd = Lighting2.FogEnd, FogStart = Lighting2.FogStart, FogColor = Lighting2.FogColor, ExposureCompensation = Lighting2.ExposureCompensation }
    end
end
local function fn68()
    for k24, k25 in pairs(tbl6) do if k25 then k25:Destroy() end end
    table.clear(tbl6)
    if v6 then
        local Lighting4 = game:GetService("Lighting")
        for k25, v372 in pairs(v6) do pcall(function() Lighting4[k25] = v372 end) end
    end
end
local function fn69()
    local v374 = tbl8[str] or tbl8.Cyber
    local Lighting6 = game:GetService("Lighting")
    fn67(); fn68()
    Lighting6.Brightness = tbl7.brightness or v374.Brightness
    Lighting6.ExposureCompensation = 0.15; Lighting6.ClockTime = 17.5; Lighting6.FogEnd = 100000; Lighting6.FogStart = 0
    local colorCorrectionEffect2 = Instance.new("ColorCorrectionEffect")
    colorCorrectionEffect2.Name = "CrimsonLua_CC"; colorCorrectionEffect2.Contrast = tbl7.contrast or v374.Contrast
    colorCorrectionEffect2.Saturation = tbl7.saturation or v374.Saturation; colorCorrectionEffect2.TintColor = tbl7.tintColor or v374.TintColor
    colorCorrectionEffect2.Parent = Lighting6; table.insert(tbl6, colorCorrectionEffect2)
    local bloomEffect2 = Instance.new("BloomEffect")
    bloomEffect2.Name = "CrimsonLua_Bloom"; bloomEffect2.Intensity = tbl7.bloomIntensity or v374.BloomIntensity
    bloomEffect2.Size = tbl7.bloomSize or v374.BloomSize; bloomEffect2.Threshold = tbl7.bloomThreshold or v374.BloomThreshold or 1
    bloomEffect2.Parent = Lighting6; table.insert(tbl6, bloomEffect2)
    local sunRaysEffect2 = Instance.new("SunRaysEffect")
    sunRaysEffect2.Name = "CrimsonLua_SunRays"; sunRaysEffect2.Intensity = tbl7.sunRaysIntensity or v374.SunRaysIntensity
    sunRaysEffect2.Spread = 0.75; sunRaysEffect2.Parent = Lighting6; table.insert(tbl6, sunRaysEffect2)
    if 0 < (tbl7.blurSize or v374.BlurSize or 0) then
        local blurEffect2 = Instance.new("BlurEffect")
        blurEffect2.Name = "CrimsonLua_Blur"; blurEffect2.Size = tbl7.blurSize or v374.BlurSize
        blurEffect2.Parent = Lighting6; table.insert(tbl6, blurEffect2)
    end
end
local function fn70(arg1) flag = arg1; if arg1 then fn69() else fn68() end end

local tbl10 = {
    Meditate = "96579993895076", Orbit = "133811691098518", ["Orbit V2"] = "73208745607037", ["Orbit V3"] = "137869087140582",
    Floss = "72174079036035", OJ = "110064349530772", ["Kicking Feet"] = "131879764029003", Tweaking = "114353590132838",
    Crazy = "120819498172771", ["Crazy V2"] = "105670906411750", ["Take the L"] = "112884830175040", Hype = "80055417516516",
    ["Small / Hide"] = "91194251426204", ["Sea Lion"] = "117932365044349", Gangnam = "104142334418357", NLE = "125783279336153",
    ["The Man"] = "88737074755910", ["Spider Shit"] = "74716792202343", ["Low Cortisol"] = "125822752810863",
    Rampage = "120605439830304", Tornado = "118314972618293"
}
local tbl9 = { enabled = false, primaryId = "96579993895076", jitterId = "120819498172771", jitterMode = false, serverVisible = true, loop = true, speed = 2, jitterInterval = 0.1 }
local tbl11 = {}
for num4 in pairs(tbl10) do table.insert(tbl11, num4) end
table.sort(tbl11)
local tbl12 = {}
local tbl13 = {primary = "", jitter = "", jitterOn = false, serverVisible = false}
local num3 = 0
num4 = 1
local tbl14 = {}
local num5 = 0
local v7 = nil

local function fn71(arg1) return tostring(arg1 or ""):gsub("rbxassetid://", ""):match("%d+") or "" end
local function fn72(arg1) if arg1 then pcall(function() local animate2 = arg1:FindFirstChild("Animate"); if animate2 then animate2.Disabled = true; animate2:Destroy() end end) end end
local function fn73() local v377, v378 = pcall(function() return require(localPlayer.PlayerScripts.Controllers.FighterController) end); if v377 and v378 and v378.LocalFighter and v378.LocalFighter.Entity then return v378.LocalFighter.Entity else return nil end end
local function fn74(arg1) return typeof(arg1) == "Instance" and arg1:IsA("Model") end
local function fn75()
    local v382 = tick()
    if v382 - num5 < 0.35 and 0 < #tbl14 then return tbl14 end
    num5 = v382; tbl14 = {}
    local live2 = workspace:FindFirstChild("Live"); local v383 = live2 and live2:FindFirstChild(localPlayer.Name)
    local tbl60, fn108
    if v383 and typeof(v383) == "Instance" then
        tbl60 = {}; fn108 = function(arg1) if fn74(arg1) and arg1.Parent and not tbl60[arg1] then tbl60[arg1] = true; table.insert(tbl14, arg1) end end
        if fn74(v383) then fn108(v383) end
        for k27, v384 in v383:GetChildren() do if fn74(v384) and (v384:FindFirstChild("HumanoidRootPart") or v384:FindFirstChild("RootPart")) then fn108(v384) end end
        if #tbl14 == 0 and fn74(v383) then fn108(v383) end
    end
    tbl60 = fn73()
    if fn74(tbl60) then
        fn108 = false
        for k27, v384 in tbl14 do if v384 == tbl60 then fn108 = true; break end end
        if not fn108 then table.insert(tbl14, tbl60) end
    end
    return tbl14
end
local function fn76(arg1)
    arg1 = fn71(arg1); if arg1 == "" then return nil end
    local v390, v391 = pcall(game.GetObjects, "rbxassetid://" .. arg1)
    if not v390 or not v391 or #v391 == 0 then return nil end
    local v392 = nil
    for k30, v393 in pairs(v391) do
        if typeof(v393) == "Instance" and v393:IsA("Animation") then v392 = v393; break end
        if typeof(v393) == "Instance" then for k31, v394 in pairs(v393:GetDescendants()) do if v394:IsA("Animation") and v394.AnimationId ~= "" then v392 = v394; break end end end
        if v392 then break end
    end
    if v392 then return v392 else local animation2 = Instance.new("Animation"); animation2.AnimationId = "rbxassetid://" .. arg1; return animation2 end
end
local function fn77(arg1, arg2)
    if not arg1 or not arg1.Parent then return nil, nil end
    local humanoid4 = arg1:FindFirstChildOfClass("Humanoid")
    local animator2, v397
    if not humanoid4 then animator2, v397 = pcall(function() return arg1:WaitForChild(arg1, "Humanoid", arg2 or 8) end); humanoid4 = animator2 and v397 or nil end
    if humanoid4 then
        animator2 = humanoid4:FindFirstChildOfClass("Animator")
        if not animator2 then local v398; v397, v398 = pcall(function() return humanoid4:WaitForChild(humanoid4, "Animator", arg2 or 8) end); animator2 = v397 and v398 or nil end
        if not animator2 then animator2 = Instance.new("Animator"); animator2.Parent = humanoid4 end
        return animator2, humanoid4
    else return nil, nil end
end
local function fn78(arg1, arg2, arg3, arg4, arg5)
    if not arg1 or not arg2 then return nil end
    local v401, v402 = pcall(arg1.LoadAnimation, arg1, arg2)
    if not v401 or not v402 then return nil else v402.Priority = arg3 or Enum.AnimationPriority.Action4; v402.Looped = arg5; v402:Play(0.1, 1, arg4); return v402 end
end
local function fn79()
    for k35, v406 in ipairs(tbl12) do
        for k36, v407 in pairs(v406.tracks) do pcall(function() v407:Stop(0); v407:Destroy() end) end
        if v406.hum then pcall(function() for k37, v408 in pairs(v406.hum:GetPlayingAnimationTracks()) do v408:Stop(0) end end) end
    end
    tbl12 = {}
end
local function fn80(arg1, arg2, arg3, arg4, arg5, arg6)
    if not arg1 or not arg1.Parent or not arg2 then return nil end
    fn72(arg1); local v411, v412 = fn77(arg1, 8)
    if not v411 or not v412 then return nil end
    local tbl62 = {fn78(v411, arg2, Enum.AnimationPriority.Action4, arg5, arg6)}
    if tbl62[1] then
        if arg4 and arg3 then tbl62[2] = fn78(v411, arg3, Enum.AnimationPriority.Action3, arg5, arg6); if tbl62[2] then pcall(function() tbl62[2]:AdjustWeight(0) end) end end
        return {rig = arg1, hum = v412, animator = v411, tracks = tbl62}
    else return nil end
end
local function fn81(arg1, arg2, arg3, arg4, arg5, arg6)
    if not tbl9.enabled then return false end
    fn79(); local v418 = fn76(arg1); if not v418 then return false end
    local v419 = nil; if arg3 and arg2 ~= "" and arg2 ~= arg1 then v419 = fn76(arg2) end
    local character2 = localPlayer.Character
    if character2 then
        fn72(character2); local v420 = fn80(character2, v418, v419, arg3, arg5, arg6); if v420 then table.insert(tbl12, v420) end
        if arg4 then for k39, v421 in fn75() do local v422 = fn80(v421, v418, v419, arg3, arg5, arg6); if v422 then table.insert(tbl12, v422) end end end
        return 0 < #tbl12
    else return false end
end
local function fn82(arg1, arg2, arg3, arg4)
    if arg1 and arg1.animator then
        local tracks2 = arg1.tracks; local tbl64 = {}
        if tracks2[1] then tbl64[tracks2[1]] = true end; if tracks2[2] then tbl64[tracks2[2]] = true end
        pcall(function() for k41, v424 in pairs(arg1.animator:GetPlayingAnimationTracks()) do if not tbl64[v424] then v424:Stop(0) end end end)
        if tracks2[1] then pcall(function() if arg3 then if not tracks2[1].IsPlaying then tracks2[1]:Play(0, 1, arg2) end; tracks2[1]:AdjustSpeed(arg2); tracks2[1]:AdjustWeight(1) else tracks2[1]:AdjustWeight(0) end end) end
        if tracks2[2] then pcall(function() if arg4 then if not tracks2[2].IsPlaying then tracks2[2]:Play(0, 1, arg2) end; tracks2[2]:AdjustSpeed(arg2); tracks2[2]:AdjustWeight(1) else tracks2[2]:AdjustWeight(0) end end) end
    end
end
local function fn83() fn79(); tbl13.primary = ""; tbl13.jitter = ""; tbl13.jitterOn = false; tbl13.serverVisible = false; num3 = 0; num4 = 1; tbl14 = {}; num5 = 0 end
local function fn84()
    if v7 then v7:Disconnect() end
    v7 = RunService.Heartbeat:Connect(function()
        if not tbl9.enabled then if 0 < #tbl12 then fn79() end; return end
        local v430 = fn71(tbl9.primaryId); local v431 = fn71(tbl9.jitterId); local jitterMode2 = tbl9.jitterMode; local serverVisible2 = tbl9.serverVisible
        local v432 = tbl9.speed or 2; local loop2 = tbl9.loop
        if v430 ~= "" then
            if #tbl12 == 0 or (tbl12[1] and tbl12[1].tracks[1] and not tbl12[1].tracks[1].IsPlaying) or (tbl13.primary == "" and tbl13.jitter == "") or (v430 ~= tbl13.primary or v431 ~= tbl13.jitter or jitterMode2 ~= tbl13.jitterOn or serverVisible2 ~= tbl13.serverVisible) then
                tbl13.primary = v430; tbl13.jitter = v431; tbl13.jitterOn = jitterMode2; tbl13.serverVisible = serverVisible2; num4 = 1; num3 = tick()
                if not fn81(v430, v431, jitterMode2, serverVisible2, v432, loop2) then return end
            end
            local flag23 = true; local flag24 = false
            if jitterMode2 and tbl12[1] and tbl12[1].tracks[1] then
                if (tbl9.jitterInterval or 0.1) <= tick() - num3 then
                    num3 = tick()
                    if tbl12[1].tracks[2] then num4 = num4 == 1 and 2 or 1
                    else for v433, v434 in ipairs(tbl12) do if v434.tracks[1] then pcall(function() v434.tracks[1]:Stop(0); v434.tracks[1]:Play(0, 1, v432) end) end end end
                end
                if tbl12[1].tracks[2] then flag23 = num4 == 1; flag24 = num4 == 2 end
            end
            for k43, v433 in ipairs(tbl12) do if v433.rig and v433.rig.Parent then fn82(v433, v432, flag23, flag24) end end
        end
    end)
end
local function fn85() tbl9.enabled = false; fn83(); if v7 then v7:Disconnect(); v7 = nil end; tbl13.primary = ""; tbl13.jitter = ""; tbl13.jitterOn = false; tbl13.serverVisible = false end
local function fn86() if tbl9.enabled and v7 and v7.Connected then fn83() else tbl9.enabled = true; fn84() end end

local flag2 = false
local v8 = nil
local num6 = 0
local v9 = nil
local str2 = "Circle"
local flag3 = true
local num7 = 8
local num8 = 4
local num9 = 1.8
local function fn87()
    if v9 == "Random" then
        local tbl66 = {}
        for k45, v438 in ipairs(Players:GetPlayers()) do if v438 ~= localPlayer and v438.Character and v438.Character:FindFirstChild("HumanoidRootPart") then table.insert(tbl66, v438) end end
        return #tbl66 > 0 and tbl66[math.random(1, #tbl66)] or nil
    elseif v9 == "Closest" then
        if v5 then
            local v437 = nil; local closestMag = math.huge
            for k45, v438 in ipairs(Players:GetPlayers()) do
                if v438 ~= localPlayer and v438.Character then
                    local humanoidRootPart6 = v438.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart6 then
                        local magnitude6 = (v5.Position - humanoidRootPart6.Position).Magnitude
                        if magnitude6 < closestMag then closestMag = magnitude6; v437 = v438 end
                    end
                end
            end
            return v437
        end
    else
        if typeof(v9) == "Instance" and v9:IsA("Player") and v9 ~= localPlayer and v9.Character then return v9 end
    end
    return nil
end
local function fn88(arg1)
    if str2 == "Figure Eight" then return Vector3.new(math.sin(arg1) * num7, num8, math.sin(arg1 * 2) * num7 * 0.5) end
    if str2 == "Vertical Wave" then return Vector3.new(math.cos(arg1) * num7, num8 + math.sin(arg1 * 2) * num7 * 0.5, math.sin(arg1) * num7) end
    if str2 ~= "Square" then return Vector3.new(math.cos(arg1) * num7, num8, math.sin(arg1) * num7) end
    local v443 = arg1 / math.pi % 4; local v444 = math.floor(v443); local v445 = v443 - v444; local v446 = num7
    if v444 == 0 then return Vector3.new(-v446 + v445 * 2 * v446, num8, -v446)
    elseif v444 == 1 then return Vector3.new(v446, num8, -v446 + v445 * 2 * v446)
    elseif v444 == 2 then return Vector3.new(v446 - v445 * 2 * v446, num8, v446)
    else return Vector3.new(-v446, num8, v446 - v445 * 2 * v446) end
end
local function fn89()
    v8 = fn3(v8)
    v8 = RunService.Heartbeat:Connect(function(arg1)
        if flag2 and v5 then
            local v450 = fn87(); local v451 = v450 and v450.Character and v450.Character:FindFirstChild("HumanoidRootPart")
            if v451 then
                num6 = num6 + arg1 * num9; local v452 = v451.Position + fn88(num6)
                if flag3 then v5.CFrame = CFrame.new(v452, v451.Position) else v5.CFrame = CFrame.new(v452) * (v5.CFrame - v5.Position) end
            end
        end
    end)
end
local function fn90() v8 = fn3(v8) end
local function fn91(arg1)
    local tbl68 = {"Random", "Closest"}
    for k47, v454 in ipairs(Players:GetPlayers()) do if v454 ~= localPlayer then table.insert(tbl68, v454.Name) end end
    arg1:Refresh(tbl68)
    local orbitTarget2 = tbl.flags.OrbitTarget
    if orbitTarget2 and table.find(tbl68, orbitTarget2) then arg1:Set(orbitTarget2) else arg1:Set("Closest"); tbl.flags.OrbitTarget = "Closest" end
end

local flag4 = false
local function fn92()
    local num33 = 0
    while not (v5 or num33 >= 3) do task.wait(0.1); num33 = num33 + 0.1 end
    if v5 then
        fn26(); if tbl5.freezeCharacterEnabled then fn28(true) end
        if tbl5.customGravityEnabled then fn29(true) end
        if tbl5.running then fn12() end
        if tbl5.riotRunning then fn14() end
        if tbl5.velocityPulseEnabled then fn16() end
        if fn18() then fn22() end
        if tbl5.orientationOffsetEnabled then fn34() end
        if flag2 then fn89() end
        if tbl5.flyEnabled then fn36() end
        if tbl5.fakePositionEnabled then fn39() end
        if tbl5.velocityDesyncEnabled then fn41() end
        if tbl5.glideEnabled then fn43() end
        if tbl5.underMapEnabled then fn45() end
        if tbl5.riotAbuserEnabled then fn47() end
        if tbl5.antiProjEnabled then fn49() end
        if tbl5.riotBypassEnabled then fn52() end
        if tbl5.evasionEnabled then fn54() end
        if tbl5.blinkEnabled then fn56() end
        if tbl5.ghostEnabled then fn58() end
        if tbl5.autoCollectEnabled then fn60() end
        if tbl5.safeZoneEnabled then fn62() end
        if tbl5.returnHomeEnabled then fn32() end
        fn66(); if tbl5.undergroundEnabled then fn64() end
        if tbl9.enabled then fn83(); fn86() end
    end
end
local function fn93(arg1)
    fn13(); fn15(); fn17(); fn21(); fn35(); fn33(); fn90(); fn37(); fn40(); fn42(); fn44(); fn46(); fn48(); fn50(); fn53(); fn55(); fn57(); fn59(); fn61(); fn63(); fn83(); fn4(arg1)
    if flag4 then fn30() end
    tbl5.undergroundLocked = false
    if tbl5.undergroundConnection then tbl5.undergroundConnection:Disconnect(); tbl5.undergroundConnection = nil end
    if tbl5.autoHealthConnection then tbl5.autoHealthConnection:Disconnect(); tbl5.autoHealthConnection = nil end
    fn92()
end
localPlayer.CharacterAdded:Connect(fn93)
if localPlayer.Character then fn93(localPlayer.Character) end
RunService.Heartbeat:Connect(function() if tbl9.enabled and v5 and (not v7 or not v7.Connected or #tbl12 == 0) then fn83(); fn84() end end)

local str3 = "CrimsonLua/configs"
;(function() if not isfolder(str3) then pcall(makefolder, str3) end end)()
local function fn94()
    local tbl70 = {}; local v459, v460 = pcall(listfiles, str3)
    if v459 and v460 then
        for k49, v461 in ipairs(v460) do local v462 = v461:match("([^/\\]+)%.json$"); if v462 then table.insert(tbl70, v462) end end
        table.sort(tbl70)
    end
    return tbl70
end
local function fn95()
    for k51, v465 in pairs(tbl.flags) do
        local v466 = tbl.controls[k51]
        if v466 then
            if v466.Toggle then v466:Toggle(v465)
            elseif v466.Set then v466:Set(v465)
            elseif v466.SetRGB then v466:SetRGB(v465)
            elseif v466.SetHex then v466:SetHex(v465) end
        end
    end
end
local refreshConfigDropdown = function() end 
local function fn96(arg1)
    if not arg1 or arg1 == "" then fn2("Enter a config name."); return false end
    arg1 = arg1:gsub("[^%w%-%_ ]", ""):sub(1, 48)
    if arg1 == "" then fn2("Invalid name."); return false end
    local tbl72 = {}
    for k53, v470 in pairs(tbl5) do if type(v470) ~= "function" and type(v470) ~= "thread" and type(v470) ~= "userdata" then tbl72[k53] = v470 end end
    tbl72.flags = tbl.flags
    local v469, k53 = pcall(writefile, str3 .. "/" .. arg1 .. ".json", HttpService:JSONEncode(tbl72))
    if v469 then fn2("Config saved: " .. arg1); refreshConfigDropdown() else fn2("Save failed: " .. tostring(k53)) end
    return v469
end
local function fn97(arg1)
    if not arg1 or arg1 == "" then fn2("No config name provided."); return end
    local v476 = str3 .. "/" .. arg1 .. ".json"
    local v477 = pcall(readfile, v476) and readfile(v476) or nil
    if not v477 then fn2("Config not found: " .. arg1); return end
    local v478, v479 = pcall(HttpService.JSONDecode, HttpService, v477)
    if not v478 or not v479 then fn2("Invalid config.")
    else
        for k55, v480 in pairs(v479) do if tbl5[k55] ~= nil and type(tbl5[k55]) == type(v480) then tbl5[k55] = v480 end end
        if v479.flags then for k55, v480 in pairs(v479.flags) do tbl.flags[k55] = v480 end end
        fn95(); fn92(); fn2("Config loaded: " .. arg1); refreshConfigDropdown()
    end
end
local function fn98(arg1)
    if not arg1 or arg1 == "" then fn2("No name.")
    elseif pcall(delfile, str3 .. "/" .. arg1 .. ".json") then fn2("Config deleted: " .. arg1); refreshConfigDropdown()
    else fn2("Delete failed.") end
end
local v10 = v3:Tab("Void")
local v11 = v3:Tab("Systems")
local v12 = v3:Tab("Anim")
local v13 = v3:Tab("Combat")
local v14 = v3:Tab("Movement")
local v15 = v3:Tab("Utilities")
local v16 = v3:Tab("Underground")
local v17 = v3:Tab("Config")

-- ==================== VOID TAB ====================
local v18 = v10:Section({Name = "Void Movement", column = 1})
v18:Toggle({Name = "Void Movement", Flag = "VoidMovement", Callback = function(arg1)
    tbl5.running = arg1
    if arg1 then fn12(); fn2("Void started.") else fn13(); fn2("Void stopped.") end
end})
v18:Dropdown({Name = "Movement Mode", Default = "VOID_SPAM", Content = {"VOID_SPAM", "VOID_HIDE", "RANDOM", "CAMERA", "FORWARD", "DIRECTIONAL"}, Flag = "TeleportMode", Callback = function(arg1) tbl5.teleportMode = arg1 end})
v18:Dropdown({Name = "Void Pattern", Default = "Random Far", Content = {"Random Far", "Still Point", "Slow Drift", "Circle", "Figure Eight", "Wide Sweep", "Fast Bounce", "Blink", "Grid Hop", "Height Wave", "Square Loop", "Cross Sweep", "Stacked Steps", "Noise Cloud"}, Flag = "VoidSpamMode", Callback = function(arg1) tbl5.voidSpamMode = arg1 end})
v18:Button({Name = "Reset Pattern", Callback = function() fn(); fn2("Pattern reset.") end})
v18:Slider({Name = "Distance", Min = 50, Max = 50000000, Default = 500, Flag = "Distance", Callback = function(arg1) tbl5.currentDistance = arg1 end})
v18:Slider({Name = "Step Interval", Min = 0.01, Max = 2, Default = 0.035, Flag = "TeleportInterval", Callback = function(arg1) tbl5.teleportInterval = arg1 end})
v18:Slider({Name = "Jitter Strength", Min = 0, Max = 60, Default = 14, Flag = "JitterStrength", Callback = function(arg1) tbl5.jitterStrength = arg1 end})
v18:Dropdown({Name = "Movement Preset", Default = "Manual", Content = {"Manual", "Steady Scan", "Fast Sweep", "Deep Void", "Stress Test"}, Flag = "VoidProfile", Callback = function(arg1)
    if arg1 == "Steady Scan" then
        tbl5.teleportMode, tbl5.voidSpamMode, tbl5.currentDistance = "VOID_SPAM", "Slow Drift", 2500000
        tbl5.teleportInterval, tbl5.jitterStrength, tbl5.voidDriftSpeed, tbl5.voidYDriftSpeed, tbl5.voidYDriftRange, tbl5.voidChaos = 0.08, 4, 3500000, 1600000, 900000000, 0.55
    elseif arg1 == "Fast Sweep" then
        tbl5.teleportMode, tbl5.voidSpamMode, tbl5.currentDistance = "VOID_SPAM", "Cross Sweep", 12000000
        tbl5.teleportInterval, tbl5.jitterStrength, tbl5.voidDriftSpeed, tbl5.voidYDriftSpeed, tbl5.voidYDriftRange, tbl5.voidChaos = 0.025, 18, 12000000, 6000000, 3500000000, 0.9
    elseif arg1 == "Deep Void" then
        tbl5.teleportMode, tbl5.voidSpamMode, tbl5.currentDistance = "VOID_SPAM", "Noise Cloud", 50000000
        tbl5.teleportInterval, tbl5.jitterStrength, tbl5.voidDriftSpeed, tbl5.voidYDriftSpeed, tbl5.voidYDriftRange, tbl5.voidChaos = 0.04, 8, 18000000, 9000000, 7000000000, 0.75
    elseif arg1 == "Stress Test" then
        tbl5.teleportMode, tbl5.voidSpamMode, tbl5.currentDistance = "VOID_SPAM", "Fast Bounce", 50000000
        tbl5.teleportInterval, tbl5.jitterStrength, tbl5.voidDriftSpeed, tbl5.voidYDriftSpeed, tbl5.voidYDriftRange, tbl5.voidChaos = 0.01, 45, 30000000, 16000000, 12000000000, 0.98
    end
    fn()
    tbl.flags.TeleportMode, tbl.flags.VoidSpamMode, tbl.flags.Distance = tbl5.teleportMode, tbl5.voidSpamMode, tbl5.currentDistance
    tbl.flags.TeleportInterval, tbl.flags.JitterStrength = tbl5.teleportInterval, tbl5.jitterStrength
end})

local v19 = v10:Section({Name = "Limits X/Y", column = 2})
v19:Slider({Name = "+X", Min = 50, Max = 50000000, Default = 200000, Flag = "DistPlusX", Callback = function(arg1) tbl5.distPlusX = arg1 end})
v19:Slider({Name = "-X", Min = 50, Max = 50000000, Default = 200000, Flag = "DistMinusX", Callback = function(arg1) tbl5.distMinusX = arg1 end})
v19:Slider({Name = "+Y", Min = 50, Max = 50000000, Default = 200000, Flag = "DistPlusY", Callback = function(arg1) tbl5.distPlusY = arg1 end})
v19:Slider({Name = "-Y", Min = 50, Max = 50000000, Default = 200000, Flag = "DistMinusY", Callback = function(arg1) tbl5.distMinusY = arg1 end})

local v20 = v10:Section({Name = "Limits Z & Reset", column = 1})
v20:Slider({Name = "+Z", Min = 50, Max = 50000000, Default = 200000, Flag = "DistPlusZ", Callback = function(arg1) tbl5.distPlusZ = arg1 end})
v20:Slider({Name = "-Z", Min = 50, Max = 50000000, Default = 200000, Flag = "DistMinusZ", Callback = function(arg1) tbl5.distMinusZ = arg1 end})
v20:Button({Name = "Mirror", Callback = function()
    local maxX, maxY, maxZ = math.max(tbl5.distPlusX, tbl5.distMinusX), math.max(tbl5.distPlusY, tbl5.distMinusY), math.max(tbl5.distPlusZ, tbl5.distMinusZ)
    tbl5.distPlusX, tbl5.distMinusX, tbl5.distPlusY, tbl5.distMinusY, tbl5.distPlusZ, tbl5.distMinusZ = maxX, maxX, maxY, maxY, maxZ, maxZ
    tbl.flags.DistPlusX, tbl.flags.DistMinusX, tbl.flags.DistPlusY, tbl.flags.DistMinusY, tbl.flags.DistPlusZ, tbl.flags.DistMinusZ = maxX, maxX, maxY, maxY, maxZ, maxZ
    fn2("Limits mirrored.")
end})
v20:Button({Name = "Reset", Callback = function()
    tbl5.distPlusX, tbl5.distMinusX, tbl5.distPlusY, tbl5.distMinusY, tbl5.distPlusZ, tbl5.distMinusZ = 200000, 200000, 200000, 200000, 200000, 200000
    tbl.flags.DistPlusX, tbl.flags.DistMinusX, tbl.flags.DistPlusY, tbl.flags.DistMinusY, tbl.flags.DistPlusZ, tbl.flags.DistMinusZ = 200000, 200000, 200000, 200000, 200000, 200000
    fn2("Limits reset.")
end})

local v21 = v10:Section({Name = "Motion", column = 1})
v21:Toggle({Name = "Spin Motion", Flag = "SpinMotion", Callback = function(arg1) tbl5.riotRunning = arg1; if arg1 then fn14(); fn2("Spin started.") else fn15(); fn2("Spin stopped.") end end})
v21:Toggle({Name = "Velocity Pulse", Flag = "VelocityPulse", Callback = function(arg1) tbl5.velocityPulseEnabled = arg1; if arg1 then fn16() else fn17() end end})
v21:Slider({Name = "Spin Speed", Min = 0, Max = 3000000, Default = 720, Flag = "SpinSpeed", Callback = function(arg1) tbl5.spinSpeed = arg1 end})
v21:Slider({Name = "Horizontal Jitter", Min = 0, Max = 120, Default = 30, Flag = "RiotXJitter", Callback = function(arg1) tbl5.riotXJitter = arg1 end})
v21:Slider({Name = "Vertical Jitter", Min = 0, Max = 60, Default = 8, Flag = "RiotYJitter", Callback = function(arg1) tbl5.riotYJitter = arg1 end})
v21:Slider({Name = "Spread Distance", Min = 1, Max = 5000, Default = 300, Flag = "RiotDistance", Callback = function(arg1) tbl5.riotDistance = arg1 end})

local v22 = v10:Section({Name = "Player", column = 2})
v22:Toggle({Name = "Custom Jump", Flag = "CustomJump", Callback = function(arg1) tbl5.customJumpEnabled = arg1; if not arg1 then fn27() end; fn26() end})
v22:Slider({Name = "Jump Power", Min = 0, Max = 10000, Default = 50, Flag = "JumpPower", Callback = function(arg1) tbl5.jumpPowerValue = arg1; fn26() end})
v22:Toggle({Name = "Freeze Character", Flag = "FreezeCharacter", Callback = function(arg1) fn28(arg1) end})
v22:Toggle({Name = "Custom Gravity", Flag = "CustomGravity", Callback = function(arg1) fn29(arg1) end})
v22:Slider({Name = "Gravity", Min = 0, Max = 100000, Default = workspace.Gravity, Flag = "GravityValue", Callback = function(arg1) tbl5.gravityValue = arg1; if tbl5.customGravityEnabled then workspace.Gravity = arg1 end end})
v22:Button({Name = "Reset Player", Callback = function()
    tbl5.customJumpEnabled, tbl5.freezeCharacterEnabled, tbl5.customGravityEnabled = false, false, false
    tbl5.jumpPowerValue, tbl5.gravityValue = tbl5.originalJumpPower or 50, tbl5.originalGravity
    fn27(); fn28(false); fn29(false)
    tbl.flags.CustomJump, tbl.flags.FreezeCharacter, tbl.flags.CustomGravity = false, false, false
    fn2("Player reset.")
end})

-- ==================== SYSTEMS TAB ====================
local v23 = v11:Section({Name = "Desync", column = 1})
v23:Toggle({Name = "Offset Pulse", Flag = "OffsetDesync", Callback = function(arg1) tbl5.offsetDesyncEnabled = arg1; fn23() end})
v23:Toggle({Name = "Velocity Burst", Flag = "BurstDesync", Callback = function(arg1) tbl5.burstDesyncEnabled = arg1; fn23() end})
v23:Toggle({Name = "Anchor Stutter", Flag = "AnchorStutter", Callback = function(arg1) tbl5.anchorStutterEnabled = arg1; fn23() end})
v23:Slider({Name = "Offset Amount", Min = 2, Max = 500, Default = 40, Flag = "DesyncOffsetAmount", Callback = function(arg1) tbl5.desyncOffsetAmount = arg1 end})
v23:Slider({Name = "Burst Power", Min = 50, Max = 15000, Default = 1500, Flag = "DesyncBurstPower", Callback = function(arg1) tbl5.desyncBurstPower = arg1 end})
v23:Slider({Name = "Pulse Delay", Min = 0.005, Max = 0.25, Default = 0.03, Flag = "DesyncPulseDelay", Callback = function(arg1) tbl5.desyncPulseDelay = arg1 end})
v23:Slider({Name = "Stutter Delay", Min = 0.02, Max = 0.25, Default = 0.08, Flag = "DesyncStutterDelay", Callback = function(arg1) tbl5.desyncStutterDelay = arg1 end})
v23:Button({Name = "Enable Preset", Callback = function()
    tbl.flags.OffsetDesync, tbl.flags.BurstDesync, tbl.flags.AnchorStutter = true, true, true
    tbl5.offsetDesyncEnabled, tbl5.burstDesyncEnabled, tbl5.anchorStutterEnabled = true, true, true
    fn23(); fn2("Desync preset enabled.")
end})
v23:Button({Name = "Stop Desync", Callback = function()
    tbl.flags.OffsetDesync, tbl.flags.BurstDesync, tbl.flags.AnchorStutter = false, false, false
    tbl5.offsetDesyncEnabled, tbl5.burstDesyncEnabled, tbl5.anchorStutterEnabled = false, false, false
    fn21(); fn2("Desync stopped.")
end})

local v24 = v11:Section({Name = "Home Anchor", column = 1})
v24:Button({Name = "Save Home Position", Callback = function() fn30(); if v5 then fn2(string.format("Home saved: %.0f, %.0f, %.0f", v5.Position.X, v5.Position.Y, v5.Position.Z)) else fn2("No character root.") end end})
v24:Button({Name = "Return Once", Callback = function() fn31() end})
v24:Toggle({Name = "Anchor On Spawn", Flag = "AnchorOnSpawn", Callback = function(arg1) tbl5.homeAutoSaveOnSpawn = arg1; if arg1 and v5 then fn30(); fn2("Anchor on spawn enabled.") end end})
v24:Toggle({Name = "Auto Return Home", Flag = "ReturnHome", Callback = function(arg1) tbl5.returnHomeEnabled = arg1; if arg1 then fn32() else fn33() end end})
v24:Slider({Name = "Return Delay", Min = 0.5, Max = 15, Default = 3, Flag = "HomeReturnDelay", Callback = function(arg1) tbl5.homeReturnDelay = arg1 end})
v24:Slider({Name = "Return Distance", Min = 1, Max = 100, Default = 10, Flag = "HomeReturnDistance", Callback = function(arg1) tbl5.homeReturnDistance = arg1 end})

local v25 = v11:Section({Name = "Orientation Offset", column = 2})
v25:Toggle({Name = "Orientation Offset", Flag = "OrientationOffsetEnabled", Callback = function(arg1) tbl5.orientationOffsetEnabled = arg1; if arg1 then fn34() else fn35() end end})
v25:Slider({Name = "Pitch Offset", Min = -180, Max = 180, Default = 0, Flag = "OrientationOffsetPitch", Callback = function(arg1) tbl5.orientationOffsetPitch = arg1 end})
v25:Slider({Name = "Yaw Offset", Min = -180, Max = 180, Default = 0, Flag = "OrientationOffsetYaw", Callback = function(arg1) tbl5.orientationOffsetYaw = arg1 end})
v25:Slider({Name = "Roll Offset", Min = -180, Max = 180, Default = 0, Flag = "OrientationOffsetRoll", Callback = function(arg1) tbl5.orientationOffsetRoll = arg1 end})

local v26 = v11:Section({Name = "Subject Orbit", column = 2})
local v27 = v26:Dropdown({Name = "Orbit Target", Default = "Closest", Content = {"Random", "Closest"}, Flag = "OrbitTarget", Callback = function(arg1)
    if arg1 == "Random" or arg1 == "Closest" then v9 = arg1
    else local v486 = Players:FindFirstChild(arg1); if v486 and v486 ~= localPlayer then v9 = v486 else v9 = nil end end
end})
local function fn99() fn91(v27) end
Players.PlayerAdded:Connect(fn99); Players.PlayerRemoving:Connect(fn99); task.delay(1, fn99)
v26:Toggle({Name = "Orbit Subject", Flag = "OrbitSubject", Callback = function(arg1) flag2 = arg1; if arg1 then fn89() else fn90() end end})
v26:Dropdown({Name = "Orbit Mode", Default = "Circle", Content = {"Circle", "Figure Eight", "Vertical Wave", "Square"}, Flag = "OrbitMode", Callback = function(arg1) str2 = arg1 end})
v26:Toggle({Name = "Face Target", Flag = "OrbitFaceTarget", Default = true, Callback = function(arg1) flag3 = arg1 end})
v26:Slider({Name = "Orbit Radius", Min = 2, Max = 60, Default = 8, Flag = "OrbitRadius", Callback = function(arg1) num7 = arg1 end})
v26:Slider({Name = "Orbit Height", Min = -20, Max = 40, Default = 4, Flag = "OrbitHeight", Callback = function(arg1) num8 = arg1 end})
v26:Slider({Name = "Orbit Speed", Min = 0.1, Max = 12, Default = 1.8, Flag = "OrbitSpeed", Callback = function(arg1) num9 = arg1 end})

local v28 = v11:Section({Name = "Shader Core", column = 1})
v28:Toggle({Name = "Lighting Shader", Flag = "LightingShader", Callback = function(arg1) fn70(arg1) end})
v28:Dropdown({Name = "Preset", Default = "Cyber", Content = {"Cyber", "Void", "Warm", "Cold", "Cinematic", "Neon", "Moonlight", "GoldenHour", "DeepFried", "Soft"}, Flag = "ShaderPreset", Callback = function(arg1) str = arg1; if flag then fn69() end end})
v28:Slider({Name = "Brightness", Min = 0.5, Max = 5, Default = 2.4, Flag = "ShaderBrightness", Callback = function(arg1) tbl7.brightness = arg1; if flag then fn69() end end})
v28:Slider({Name = "Contrast", Min = -1, Max = 1, Default = 0.35, Flag = "ShaderContrast", Callback = function(arg1) tbl7.contrast = arg1; if flag then fn69() end end})
v28:Slider({Name = "Saturation", Min = -1, Max = 1, Default = 0.2, Flag = "ShaderSaturation", Callback = function(arg1) tbl7.saturation = arg1; if flag then fn69() end end})
v28:ColorPicker({Name = "Tint Color", Default = Color3.fromRGB(206,54,54), Flag = "ShaderTint", Callback = function(arg1) tbl7.tintColor = arg1; if flag then fn69() end end})

local v29 = v11:Section({Name = "Bloom & Sun", column = 2})
v29:Slider({Name = "Bloom Intensity", Min = 0, Max = 2, Default = 0.45, Flag = "BloomIntensity", Callback = function(arg1) tbl7.bloomIntensity = arg1; if flag then fn69() end end})
v29:Slider({Name = "Bloom Size", Min = 4, Max = 80, Default = 36, Flag = "BloomSize", Callback = function(arg1) tbl7.bloomSize = arg1; if flag then fn69() end end})
v29:Slider({Name = "SunRays Intensity", Min = 0, Max = 0.5, Default = 0.08, Flag = "SunRaysIntensity", Callback = function(arg1) tbl7.sunRaysIntensity = arg1; if flag then fn69() end end})
v29:Button({Name = "Reapply", Callback = function() if flag then fn69(); fn2("Lighting reapplied.") else fn2("Shader is off.") end end})
v29:Button({Name = "Reset", Callback = function() fn70(false); tbl.flags.LightingShader = false; fn2("Lighting reset.") end})

-- ==================== ANIM TAB ====================
local v30 = v12:Section({Name = "Controls", column = 1})
v30:Toggle({Name = "Enable", Flag = "AnimEnable", Callback = function(arg1) tbl9.enabled = arg1; if arg1 then fn86() else fn85() end end})
v30:Box({Name = "Primary ID", Default = "96579993895076", Flag = "AnimPrimaryId", Callback = function(arg1) tbl9.primaryId = arg1; if tbl9.enabled then fn86() end end})
v30:Box({Name = "Jitter ID", Default = "120819498172771", Flag = "AnimJitterId", Callback = function(arg1) tbl9.jitterId = arg1; if tbl9.enabled then fn86() end end})
v30:Toggle({Name = "Jitter Mode", Flag = "AnimJitterMode", Callback = function(arg1) tbl9.jitterMode = arg1; if tbl9.enabled then fn86() end end})
v30:Toggle({Name = "Server Visible", Flag = "AnimServerVisible", Default = true, Callback = function(arg1) tbl9.serverVisible = arg1; if tbl9.enabled then fn86() end end})
v30:Toggle({Name = "Loop", Flag = "AnimLoop", Default = true, Callback = function(arg1) tbl9.loop = arg1; if tbl9.enabled then fn86() end end})
v30:Slider({Name = "Speed", Min = 0.1, Max = 200, Default = 2, Flag = "AnimSpeed", Callback = function(arg1) tbl9.speed = arg1; if tbl9.enabled then fn86() end end})
v30:Slider({Name = "Jitter Interval", Min = 0.01, Max = 2, Default = 0.1, Flag = "AnimJitterInterval", Callback = function(arg1) tbl9.jitterInterval = arg1 end})
v30:Button({Name = "Play", Callback = function() if not tbl9.enabled then tbl9.enabled = true end; fn86() end})
v30:Button({Name = "Stop", Callback = function() if tbl9.enabled then fn85() end end})

local v31 = v12:Section({Name = "Presets", column = 2})
v31:Label("Primary Presets")
v31:Dropdown({Name = "", Default = tbl11[1], Content = tbl11, Flag = "AnimPrimaryPreset", Callback = function(arg1) local v490 = tbl10[arg1]; if v490 then tbl9.primaryId = v490; tbl.flags.AnimPrimaryId = v490; if tbl9.enabled then fn86() end end end})
v31:Label("Jitter Presets")
v31:Dropdown({Name = "", Default = tbl11[1], Content = tbl11, Flag = "AnimJitterPreset", Callback = function(arg1) local v491 = tbl10[arg1]; if v491 then tbl9.jitterId = v491; tbl.flags.AnimJitterId = v491; if tbl9.enabled then fn86() end end end})

-- ==================== COMBAT TAB ====================
local v32 = v13:Section({Name = "Anti-Aim", column = 1})
v32:Toggle({Name = "Anti Aim", Flag = "AntiAim", Callback = function(arg1) tbl5.antiAimEnabled = arg1 end})
v32:Slider({Name = "Pitch Offset", Min = -180, Max = 180, Default = 0, Flag = "PitchAngle", Callback = function(arg1) tbl5.pitchAngle = arg1 end})
v32:Slider({Name = "Yaw Offset", Min = -180, Max = 180, Default = 0, Flag = "YawAngle", Callback = function(arg1) tbl5.yawAngle = arg1 end})
v32:Toggle({Name = "Spin Bypass", Flag = "SpinBypass", Callback = function(arg1) tbl5.spinEnabled = arg1 end})
v32:Toggle({Name = "Underground", Flag = "UnderMap", Callback = function(arg1) tbl5.underMapEnabled = arg1; if arg1 then fn45() else fn46() end end})
v32:Slider({Name = "Underground Y", Min = -5000, Max = -50, Default = -500, Flag = "UnderMapY", Callback = function(arg1) tbl5.underMapY = arg1 end})

local v33 = v13:Section({Name = "Riot Abuser", column = 1})
v33:Toggle({Name = "Riot Abuser", Flag = "RiotAbuser", Callback = function(arg1) tbl5.riotAbuserEnabled = arg1; if arg1 then fn47() else fn48() end end})
v33:Slider({Name = "Spread Distance", Min = 10, Max = 1000, Default = 300, Flag = "RiotAbuserDist", Callback = function(arg1) tbl5.riotAbuserDistance = arg1 end})
v33:Slider({Name = "X Jitter", Min = 0, Max = 200, Default = 30, Flag = "RiotAbuserX", Callback = function(arg1) tbl5.riotAbuserX = arg1 end})
v33:Slider({Name = "Y Jitter", Min = 0, Max = 100, Default = 8, Flag = "RiotAbuserY", Callback = function(arg1) tbl5.riotAbuserY = arg1 end})
v33:Slider({Name = "Z Jitter", Min = 0, Max = 200, Default = 30, Flag = "RiotAbuserZ", Callback = function(arg1) tbl5.riotAbuserZ = arg1 end})

local v34 = v13:Section({Name = "Riot Bypass", column = 2})
v34:Toggle({Name = "Riot Bypass", Flag = "RiotBypass", Callback = function(arg1) tbl5.riotBypassEnabled = arg1; if arg1 then fn52() else fn53() end end})
v34:Slider({Name = "Distance", Min = 0, Max = 20, Default = 3, Flag = "RiotBypassDist", Callback = function(arg1) tbl5.riotBypassDistance = arg1 end})
v34:Dropdown({Name = "Position", Default = "Front", Content = {"Front", "Back", "Above", "Below"}, Flag = "RiotBypassPos", Callback = function(arg1) tbl5.riotBypassPosition = arg1 end})

-- ==================== MOVEMENT TAB ====================
local v35 = v14:Section({Name = "Fly", column = 1})
v35:Toggle({Name = "Fly", Flag = "Fly", Callback = function(arg1) tbl5.flyEnabled = arg1; if arg1 then fn36() else fn37() end end})
v35:Slider({Name = "Fly Speed", Min = 1, Max = 2000, Default = 50, Flag = "FlySpeed", Callback = function(arg1) tbl5.flySpeed = arg1 end})
v14:Section({Name = "Noclip", column = 1}):Toggle({Name = "Noclip", Flag = "Noclip", Callback = function(arg1) tbl5.noclip = arg1; if arg1 then fn38() end end})
v14:Section({Name = "Fake Position", column = 1}):Toggle({Name = "Fake Position", Flag = "FakePos", Callback = function(arg1) tbl5.fakePositionEnabled = arg1; if arg1 then fn39() else fn40() end end})
v14:Section({Name = "Velocity Desync", column = 1}):Toggle({Name = "Velocity Desync", Flag = "VelDesync", Callback = function(arg1) tbl5.velocityDesyncEnabled = arg1; if arg1 then fn41() else fn42() end end})

local v36 = v14:Section({Name = "Glide", column = 2})
v36:Toggle({Name = "Glide", Flag = "Glide", Callback = function(arg1) tbl5.glideEnabled = arg1; if arg1 then fn43() else fn44() end end})
v36:Slider({Name = "Glide Speed", Min = 10, Max = 5000, Default = 280, Flag = "GlideSpeed", Callback = function(arg1) tbl5.glideSpeed = arg1 end})
v36:Slider({Name = "Glide Accel", Min = 1, Max = 100, Default = 18, Flag = "GlideAccel", Callback = function(arg1) tbl5.glideAccel = arg1 end})

local v37 = v14:Section({Name = "Evasion", column = 2})
v37:Toggle({Name = "Evasion", Flag = "Evasion", Callback = function(arg1) tbl5.evasionEnabled = arg1; if arg1 then fn54() else fn55() end end})
v37:Slider({Name = "Intensity", Min = 1, Max = 10, Default = 3, Flag = "EvasionIntensity", Callback = function(arg1) tbl5.evasionIntensity = arg1 end})

local v38 = v14:Section({Name = "Blink", column = 2})
v38:Toggle({Name = "Blink", Flag = "Blink", Callback = function(arg1) tbl5.blinkEnabled = arg1; if arg1 then fn56() else fn57() end end})
v38:Slider({Name = "Radius", Min = 10, Max = 300, Default = 80, Flag = "BlinkRadius", Callback = function(arg1) tbl5.blinkRadius = arg1 end})
v38:Slider({Name = "Rate (snaps/s)", Min = 10, Max = 120, Default = 60, Flag = "BlinkRate", Callback = function(arg1) tbl5.blinkRate = arg1 end})

local v39 = v14:Section({Name = "Ghost", column = 1})
v39:Toggle({Name = "Ghost", Flag = "Ghost", Callback = function(arg1) tbl5.ghostEnabled = arg1; if arg1 then fn58() else fn59() end end})
v39:Slider({Name = "Distance", Min = 20, Max = 500, Default = 150, Flag = "GhostDistance", Callback = function(arg1) tbl5.ghostDistance = arg1 end})

-- ==================== UTILITIES TAB ====================
local v40 = v15:Section({Name = "Auto Collect Heals", column = 1})
v40:Toggle({Name = "Auto Collect Heals", Flag = "AutoCollect", Callback = function(arg1) tbl5.autoCollectEnabled = arg1; if arg1 then fn60() else fn61() end end})
v40:Slider({Name = "Radius", Min = 10, Max = 300, Default = 60, Flag = "AutoCollectRadius", Callback = function(arg1) tbl5.autoCollectRadius = arg1 end})
local v41 = v15:Section({Name = "Safe Zone Rescue", column = 1})
v41:Toggle({Name = "Safe Zone", Flag = "SafeZone", Callback = function(arg1) tbl5.safeZoneEnabled = arg1; if arg1 then fn62() else fn63() end end})
v41:Slider({Name = "Y Threshold", Min = -200, Max = 50, Default = -10, Flag = "SafeZoneY", Callback = function(arg1) tbl5.safeZoneY = arg1 end})

-- ==================== UNDERGROUND TAB ====================
local v42 = v16:Section({Name = "Underground Teleport", column = 1})
v42:Toggle({Name = "Enable Underground", Flag = "UndergroundEnable", Callback = function(arg1) if arg1 then fn64() else fn65() end end})
v42:Slider({Name = "Depth (studs)", Min = 5, Max = 50, Default = 15, Flag = "UndergroundDepth", Callback = function(arg1) tbl5.undergroundDepth = arg1; if tbl5.undergroundLocked and v5 then tbl5.undergroundLockedY = v5.Position.Y - arg1 end end})
local v43 = v16:Section({Name = "Auto-Health", column = 2})
v43:Toggle({Name = "Auto-Health", Flag = "AutoHealthEnable", Callback = function(arg1) tbl5.autoHealthEnabled = arg1; fn66(); if arg1 then fn2("Auto-health enabled.") else fn2("Auto-health disabled.") end end})
v43:Slider({Name = "Health Threshold", Min = 5, Max = 50, Default = 20, Flag = "AutoHealthThreshold", Callback = function(arg1) tbl5.autoHealthThreshold = arg1 end})

-- ==================== CONFIG TAB ====================
local v44 = v17:Section({Name = "Config Management", column = 1})
v44:Box({Name = "Config Name", Default = "MyConfig", Flag = "ConfigName", Callback = function() end})
v44:Button({Name = "Save Config", Callback = function() fn96(tbl.flags.ConfigName or "MyConfig") end})
v44:Button({Name = "Load Config", Callback = function() fn97(tbl.flags.ConfigName or "MyConfig") end})
v44:Button({Name = "Delete Config", Callback = function() fn98(tbl.flags.ConfigName or "MyConfig") end})
v44:Button({Name = "List Configs", Callback = function()
    local v492 = fn94()
    if #v492 == 0 then fn2("No configs found.") else fn2("Configs: " .. table.concat(v492, ", ")) end
end})

local v45 = v44:Dropdown({Name = "Select Config", Default = "", Content = fn94(), Flag = "ConfigSelect", Callback = function(arg1) if arg1 and arg1 ~= "" then tbl.flags.ConfigName = arg1 end end})
refreshConfigDropdown = function()
    local v493 = fn94()
    v45:Refresh(v493)
    if 0 < #v493 then v45:Set(v493[1]); tbl.flags.ConfigName = v493[1] else v45:Set(""); tbl.flags.ConfigName = "" end
end
task.defer(refreshConfigDropdown)

-- ==================== HEARTBEAT LOOP ====================
RunService.Heartbeat:Connect(function()
    if tbl5.antiAimEnabled and v5 then v5.CFrame = v5.CFrame * CFrame.Angles(math.rad(tbl5.pitchAngle), math.rad(tbl5.yawAngle), 0) end
    if tbl5.spinEnabled and v5 then
        v5.CFrame = v5.CFrame * CFrame.Angles(0, math.rad(math.random(-180, 180)), 0)
        v5.AssemblyLinearVelocity = Vector3.new(math.random(-200, 200), 250, math.random(-200, 200)) * 45
    end
    if tbl5.noclip and v4 then for k56, v494 in ipairs(v4:GetDescendants()) do if v494:IsA("BasePart") then v494.CanCollide = false end end end
end)

-- ==================== FLOATING BUTTON ====================
;(function()
    local screenGui2 = Instance.new("ScreenGui")
    screenGui2.Name = "CrimsonLuaToggle"
    screenGui2.ResetOnSpawn = false
    screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui2.Parent = game:GetService("CoreGui")
    
    local textButton10 = Instance.new("TextButton")
    textButton10.Name = "ToggleButton"
    textButton10.Size = UDim2.new(0, 110, 0, 38)
    textButton10.Position = UDim2.new(0, 10, 0, 10)
    textButton10.AnchorPoint = Vector2.new(0, 0)
    textButton10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textButton10.BackgroundTransparency = 0.25
    textButton10.BorderSizePixel = 1
    textButton10.BorderColor3 = Color3.fromRGB(80, 80, 80)
    textButton10.Text = v3.Gui.Enabled and "Untoggle Gui" or "Toggle Gui"
    textButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton10.TextSize = 14
    textButton10.Font = Enum.Font.SourceSans
    textButton10.ZIndex = 9999
    textButton10.Parent = screenGui2
    
    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 6)
    uICorner.Parent = textButton10

    textButton10.MouseButton1Click:Connect(function()
        if v3.Gui then
            v3.Gui.Enabled = not v3.Gui.Enabled
            textButton10.Text = v3.Gui.Enabled and "Untoggle Gui" or "Toggle Gui"
        end
    end)
end)()

fn2("Crimson Lua loaded.")
print("Join our dc today at https://discord.gg/bw6phQrGAk")