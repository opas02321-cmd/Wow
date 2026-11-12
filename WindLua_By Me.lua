-- ============================================================
-- WIND ANTI-CHEAT BYPASS v3 (Rivals - Very Strong)
-- ============================================================

pcall(function()
    local env = getrenv()
    local oldSetMeta = env.setmetatable
    env.setmetatable = newcclosure(function(t, mt)
        if type(mt) == "table" and mt.__mode == "kv" then
            local trace = debug.traceback()
            if trace:find("MiscellaneousController") or trace:find("AntiCheat") or trace:find("Detection") or trace:find("Analytics") or trace:find("Exploit") or trace:find("Violation") then
                return oldSetMeta({1,2,3}, {})
            end
        end
        return oldSetMeta(t, mt)
    end)
end)

task.spawn(function()
    pcall(function()
        local killed = 0
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" then
                local ok, name = pcall(debug.info, v, "s")
                if ok and name then
                    local lower = name:lower()
                    if lower:find("analyticspipeline") or lower:find("anticheatcontroller") or lower:find("exploitdetection") or lower:find("cheatdetection") or lower:find("violationhandler") or lower:find("suspiciousactivity") or lower:find("automatedreport") or lower:find("kickhandler") then
                        pcall(hookfunction, v, function() end)
                        killed = killed + 1
                    end
                end
            end
        end
        if killed > 0 then warn("[Wind AC] Killed " .. killed .. " detection functions") end
    end)
end)

task.spawn(function()
    pcall(function()
        hookfunction(game:GetService("Players").LocalPlayer.Kick, newcclosure(function() return nil end))
    end)
end)

local windOldNC
windOldNC = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" then return nil end
    if method == "FireServer" or method == "InvokeServer" then
        local ok, name = pcall(function() return tostring(self.Name) end)
        if ok and name then
            local lower = name:lower()
            if lower:find("anticheat") or lower:find("detection") or lower:find("exploit") or lower:find("analytics") or lower:find("report") or lower:find("violation") or lower:find("suspicious") or lower:find("monitor") or lower:find("security") then
                return nil
            end
        end
    end
    return windOldNC(self, ...)
end))

task.spawn(function()
    pcall(function()
        local function scan(container)
            for _, v in ipairs(container:GetChildren()) do
                local n = v.Name:lower()
                if n:find("anticheat") or n:find("detection") or n:find("analytics") or n:find("exploit") or n:find("security") or n:find("monitor") then
                    pcall(function() v.Disabled = true end)
                    pcall(function() v:Destroy() end)
                end
                pcall(scan, v)
            end
        end
        scan(game:GetService("Players").LocalPlayer.PlayerScripts)
        scan(game:GetService("ReplicatedStorage"))
    end)
end)

task.spawn(function()
    pcall(function()
        local env = getrenv()
        local oldRaycast = env.workspace.Raycast
        env.workspace.Raycast = newcclosure(function(self, origin, direction, params, ...)
            local trace = debug.traceback()
            if trace:find("AntiCheat") or trace:find("Detection") or trace:find("Monitor") then return nil end
            return oldRaycast(self, origin, direction, params, ...)
        end)
    end)
end)

pcall(function()
    local env = getrenv()
    local oldWarn = env.warn
    env.warn = newcclosure(function(...)
        local msg = tostring(...):lower()
        if msg:find("exploit") or msg:find("cheat") or msg:find("detected") then return end
        return oldWarn(...)
    end)
end)

warn("[Wind AC] Anti-cheat bypass v3 installed — 7 layers active")

if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().wind_loaded then return end
getgenv().wind_loaded = true

-- ==================== SERVICES ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- ==================== CONFIG ====================
getgenv().windCfg = {
    nc = false, flyEnabled = false, flySpeed = 50, doubleJumpEnabled = false,
    fakePositionEnabled = false, desyncEnabled = false,
    evasionEnabled = false, evasionIntensity = 3.0,
    blinkEnabled = false, blinkRadius = 80, blinkRate = 60,
    ghostEnabled = false, ghostDistance = 150,
    glideEnabled = false, glideSpeed = 280, glideAccel = 18,
    VoidEnabled = false, voidX = 1e8, voidY = 1e8, voidZ = 1e8,
    voidSpamEnabled = false, voidSpamInterval = 0.016, voidSpamBurst = 5,
    voidSmooth = false, voidSmoothAlpha = 0.5, voidPattern = "random",
    voidAxisX = true, voidAxisY = true, voidAxisZ = true,
    voidXPos = 2500, voidXNeg = 2500, voidYPos = 1500, voidYNeg = 1500, voidZPos = 2500, voidZNeg = 2500,
    orbit = false, orbitSpeed = 90, orbitDistance = 8, orbitHeight = 0,
    wallbangEnabled = false, rapidFire = false, teleportEnemyEnabled = false,
    sling = false, daggerBypass = false, AntiEnemy = false,
    slingRage = false, antiProj = false, fastReload = false, antiClose = false,
    antiAimEnabled = false, pitchAngle = 0, yawAngle = 0, spinEnabled = false,
    underMapEnabled = false, underMapY = -500,
    riotAbuserEnabled = false, riotAbuserDistance = 300, riotAbuserX = 30,
    riotAbuserY = 8, riotAbuserZ = 30, riotAbuserSpin = 720,
    riotBypassEnabled = false, riotBypassDistance = 3, riotBypassHeight = 0,
    riotBypassUpdate = 0.02, riotBypassPosition = "Front",
    antiAfkEnabled = false, autocollectEnabled = false, autocollectRadius = 60,
    returnHomeEnabled = false, homeReturnDelay = 3.0,
    safeZoneEnabled = false, safeZoneY = -10,
    teleportLoopEnabled = false, teleportLoopDelay = 1.5,
    speed = false, speedValue = 40,
    jumpPower = false, jumpPowerValue = 80,
    infJump = false,
    ragebot = false, ragebotMode = "Orbit",
    aimbot = false, aimbotSmooth = 0.18,
    silentAim = false,
    fovEnabled = false, fovSize = 250,
    kiciaCounter = false, elisiumCounter = false, ueCounter = false,
    antiFlashbang = false, antiKatana = false, antiSubspace = false,
    autoLoadConfig = true,
}
local cfg = getgenv().windCfg

-- ==================== HELPERS ====================
local function getHrp()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end
local function getHum()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end
local function isAlive(plr)
    local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
    return h and h.Health > 0
end
local function getClosest()
    local hrp = getHrp(); if not hrp then return nil end
    local closest, minD = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isAlive(p) then
            local oHrp = p.Character:FindFirstChild("HumanoidRootPart")
            if oHrp then
                local d = (hrp.Position - oHrp.Position).Magnitude
                if d < minD then minD = d; closest = p end
            end
        end
    end
    return closest
end
local function getClosestFOV()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local maxR = cfg.fovEnabled and cfg.fovSize or math.huge
    local closest, minD = nil, maxR
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isAlive(p) then
            local head = p.Character:FindFirstChild("Head")
            if head then
                local sp, on = Camera:WorldToViewportPoint(head.Position)
                if on then
                    local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if d < minD then minD = d; closest = p end
                end
            end
        end
    end
    return closest
end
local function getPlayerGui(namePattern)
    for _, g in ipairs(CoreGui:GetChildren()) do
        if g:IsA("ScreenGui") and g.Name:lower():find(namePattern) then return g end
    end
    for _, g in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
        if g:IsA("ScreenGui") and g.Name:lower():find(namePattern) then return g end
    end
end
local function safeTeleport(pos)
    local hrp = getHrp(); if not hrp then return end
    local x, y, z = pos.X, pos.Y, pos.Z
    y = math.clamp(y, 2, hrp.Position.Y + 800)
    local p = RaycastParams.new()
    p.FilterType = Enum.RaycastFilterType.Exclude
    p.FilterDescendantsInstances = { LocalPlayer.Character }
    local hit = Workspace:Raycast(Vector3.new(x, y + 60, z), Vector3.new(0, -220, 0), p)
    if hit then y = math.max(hit.Position.Y + 3, 2) end
    hrp.CFrame = CFrame.new(x, y, z)
end

-- ==================== FOV ====================
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1; fovCircle.NumSides = 64; fovCircle.Radius = 250
fovCircle.Filled = false; fovCircle.Visible = false
fovCircle.Color = Color3.fromRGB(255, 162, 167); fovCircle.Transparency = 0.5

-- ==================== SILENT AIM ====================
local oldIndex
oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if cfg.silentAim and self == Camera and key == "CFrame" then
        local target = getClosestFOV()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                local camCF = oldIndex(self, "CFrame")
                return CFrame.lookAt(camCF.Position, head.Position)
            end
        end
    end
    return oldIndex(self, key)
end))

-- ==================== DAGGER BYPASS ====================
local oldFireServer
oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
    if not checkcaller() and cfg.daggerBypass then
        local n, a = self.Name:lower(), table.concat({ ... }, " "):lower()
        if (n:find("dagger") or n:find("knife") or n:find("throw") or n:find("blade")) and not (a:find(LocalPlayer.Name:lower()) or a:find("owner")) then return end
    end
    return oldFireServer(self, ...)
end))

-- ==================== FLY / SPEED / JUMP ====================
local flyConn = RunService.Heartbeat:Connect(function(dt)
    local hrp, hum = getHrp(), getHum()
    if not hrp or not cfg.flyEnabled then return end
    if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
    local cam = Camera.CFrame
    local flatLook = Vector3.new(cam.LookVector.X, 0, cam.LookVector.Z)
    local flatRight = Vector3.new(cam.RightVector.X, 0, cam.RightVector.Z)
    if flatLook.Magnitude > 0 then flatLook = flatLook.Unit end
    if flatRight.Magnitude > 0 then flatRight = flatRight.Unit end
    local md = hum and hum.MoveDirection or Vector3.zero
    local dir = Vector3.zero
    if md.Magnitude > 0.01 then
        dir = cam.LookVector * md:Dot(flatLook) + cam.RightVector * md:Dot(flatRight)
    end
    if not isMobile then
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0,1,0) end
    end
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    if dir.Magnitude > 0.01 then hrp.CFrame += dir.Unit * (cfg.flySpeed * dt) end
end)

local speedConn = RunService.Heartbeat:Connect(function(dt)
    local hrp, hum = getHrp(), getHum()
    if not hrp or not hum or not cfg.speed or cfg.flyEnabled then return end
    local md = hum.MoveDirection
    if md.Magnitude > 0.01 and cfg.speedValue > 16 then
        hrp.CFrame += md.Unit * ((cfg.speedValue - 16) * dt * 0.6)
    end
end)

local jpConn = RunService.Heartbeat:Connect(function()
    local hum = getHum()
    if hum and cfg.jumpPower and hum.JumpPower ~= cfg.jumpPowerValue then
        hum.JumpPower = cfg.jumpPowerValue
        hum.UseJumpPower = true
    end
end)

-- ==================== RAGEBOT ====================
local rageAngle = 0
RunService.Heartbeat:Connect(function(dt)
    if not cfg.ragebot then return end
    local hrp = getHrp(); if not hrp then return end
    local target = getClosest(); if not target then return end
    local tHrp = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not tHrp then return end
    if cfg.ragebotMode == "Orbit" then
        rageAngle = rageAngle + dt * 8
        local r = 6
        local pos = tHrp.Position + Vector3.new(math.cos(rageAngle)*r, 2, math.sin(rageAngle)*r)
        hrp.CFrame = CFrame.lookAt(pos, tHrp.Position)
    elseif cfg.ragebotMode == "Overlap" then
        hrp.CFrame = tHrp.CFrame
    elseif cfg.ragebotMode == "Teleport" then
        hrp.CFrame = CFrame.lookAt(tHrp.Position + tHrp.CFrame.LookVector * 3, tHrp.Position)
    end
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
end)

-- ==================== AIMBOT + FOV ====================
RunService.RenderStepped:Connect(function(dt)
    if cfg.fovEnabled then
        fovCircle.Visible = true
        fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        fovCircle.Radius = cfg.fovSize
    else
        fovCircle.Visible = false
    end
    if cfg.aimbot then
        local target = getClosestFOV()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                local camCF = Camera.CFrame
                local newCF = CFrame.lookAt(camCF.Position, head.Position)
                Camera.CFrame = camCF:Lerp(newCF, math.clamp(cfg.aimbotSmooth, 0.01, 1))
            end
        end
    end
end)

-- ==================== ANTI LOOP ====================
RunService.Heartbeat:Connect(function(dt)
    if cfg.kiciaCounter then
        pcall(function()
            if getgenv().KiciaRebuild then
                if getgenv().KiciaRebuild.Unload then getgenv().KiciaRebuild.Unload() end
                getgenv().KiciaRebuild = nil
            end
            local g = getPlayerGui("kicia"); if g then g:Destroy() end
        end)
    end
    if cfg.elisiumCounter then
        pcall(function()
            if getgenv().Library and getgenv().Library.ScreenGui then
                pcall(function() getgenv().Library.ScreenGui:Destroy() end)
            end
            local g = getPlayerGui("elisium"); if g then g:Destroy() end
            local blur = Lighting:FindFirstChild("ElisiumMenuBlur"); if blur then blur:Destroy() end
        end)
    end
    if cfg.ueCounter then
        pcall(function()
            if getgenv().UE then getgenv().UE = nil end
            if getgenv().Universal then getgenv().Universal = nil end
            local g1 = getPlayerGui("ue"); if g1 then g1:Destroy() end
            local g2 = getPlayerGui("universal"); if g2 then g2:Destroy() end
        end)
    end
    if cfg.antiFlashbang then
        pcall(function()
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("ColorCorrectionEffect") then
                    v.Brightness = 0; v.Contrast = 0; v.Saturation = 0
                elseif v:IsA("BlurEffect") then v.Size = 0
                elseif v:IsA("SunRaysEffect") then v.Intensity = 0 end
            end
            for _, g in ipairs(CoreGui:GetChildren()) do
                if g:IsA("ScreenGui") then
                    local n = g.Name:lower()
                    if n:find("flash") or n:find("blind") or n:find("bang") then g:Destroy() end
                end
            end
        end)
    end
    if cfg.antiKatana then
        local hrp = getHrp()
        if hrp then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and isAlive(p) then
                    local oHrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if oHrp then
                        local d = (hrp.Position - oHrp.Position).Magnitude
                        if d < 12 then
                            local toThem = (oHrp.Position - hrp.Position).Unit
                            local myLook = hrp.CFrame.LookVector
                            if myLook:Dot(toThem) < -0.3 then
                                hrp.CFrame = CFrame.lookAt(oHrp.Position - oHrp.CFrame.LookVector * 3, oHrp.Position)
                            end
                        end
                    end
                end
            end
        end
    end
    if cfg.antiSubspace then
        local hrp = getHrp()
        if hrp then
            for _, obj in ipairs(Workspace:GetDescendants()) do
                local n = obj.Name:lower()
                if n:find("subspace") or n:find("trapmine") or n:find("tripmine") or n:find("trap") then
                    local pos
                    if obj:IsA("BasePart") then pos = obj.Position
                    elseif obj:IsA("Model") then
                        local pp = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                        if pp then pos = pp.Position end
                    end
                    if pos and (pos - hrp.Position).Magnitude < 25 then
                        hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(math.random(-40,40), 25, math.random(-40,40)))
                        break
                    end
                end
            end
        end
    end
    if cfg.antiAimEnabled and getHrp() then
        getHrp().CFrame = getHrp().CFrame * CFrame.Angles(math.rad(cfg.pitchAngle), math.rad(cfg.yawAngle), 0)
    end
    if cfg.spinEnabled and getHrp() then
        getHrp().CFrame = getHrp().CFrame * CFrame.Angles(0, math.rad(math.random(-180, 180)), 0)
        getHrp().AssemblyLinearVelocity = Vector3.new(math.random(-200, 200), 250, math.random(-200, 200)) * 45
    end
    if cfg.nc and LocalPlayer.Character then
        for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- ==================== INF JUMP ====================
UserInputService.JumpRequest:Connect(function()
    if cfg.infJump then
        local hum = getHum()
        if hum and hum:GetState() ~= Enum.HumanoidStateType.Dead then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- ==================== VOID ====================
local voidConns = {}
local voidToggle = false
local function startVoid()
    for _, c in ipairs(voidConns) do c:Disconnect() end
    table.clear(voidConns)
    table.insert(voidConns, RunService.Heartbeat:Connect(function()
        if not cfg.VoidEnabled or not getHrp() then return end
        voidToggle = not voidToggle
        local hrp = getHrp()
        local vx, vy, vz = cfg.voidX, cfg.voidY, cfg.voidZ
        if voidToggle then hrp.CFrame = CFrame.new(math.random(-vx, vx), vy, math.random(-vz, vz))
        else hrp.CFrame = CFrame.new(math.random(vx, vx*2), -vy, math.random(vz, vz*2)) end
        hrp.AssemblyLinearVelocity = Vector3.new(math.random(-1e5,1e5), math.random(-1e5,1e5), math.random(-1e5,1e5))
        hrp.AssemblyAngularVelocity = Vector3.new(math.random(-1e5,1e5), math.random(-1e5,1e5), math.random(-1e5,1e5))
    end))
    table.insert(voidConns, RunService.RenderStepped:Connect(function()
        if not cfg.VoidEnabled or not getHrp() then return end
        getHrp().CFrame = getHrp().CFrame * CFrame.new(math.random(-50,50), math.random(-50,50), math.random(-50,50))
    end))
end
local function stopVoid()
    for _, c in ipairs(voidConns) do c:Disconnect() end
    table.clear(voidConns)
end

-- ==================== VOID SPAM ====================
local voidSpamConn = nil
local vspiral, vwave, vbounce, vchaos, vhelix, vstrobe = 0, 0, {X=1,Y=1,Z=1}, {math.random(),math.random(),math.random()}, 0, false
local function getVoidSpamDelta(dt)
    local xp,xn = cfg.voidXPos,cfg.voidXNeg
    local yp,yn = cfg.voidYPos,cfg.voidYNeg
    local zp,zn = cfg.voidZPos,cfg.voidZNeg
    local ax,ay,az = cfg.voidAxisX,cfg.voidAxisY,cfg.voidAxisZ
    local p = cfg.voidPattern
    if p == "spiral" then vspiral = vspiral + 0.35
        return Vector3.new(ax and math.cos(vspiral)*(xp+xn)/2 or 0, ay and math.sin(vspiral*0.6)*(yp+yn)/2 or 0, az and math.sin(vspiral)*(zp+zn)/2 or 0)
    elseif p == "wave" then vwave = vwave + dt*8
        return Vector3.new(ax and math.sin(vwave)*(xp+xn)/2 or 0, ay and math.sin(vwave*1.7)*(yp+yn)/2 or 0, az and math.cos(vwave*0.9)*(zp+zn)/2 or 0)
    elseif p == "bounce" then
        local s = Vector3.new(ax and vbounce.X*(xp+xn)/3 or 0, ay and vbounce.Y*(yp+yn)/3 or 0, az and vbounce.Z*(zp+zn)/3 or 0)
        if math.random()<0.25 then vbounce.X = -vbounce.X end
        if math.random()<0.25 then vbounce.Y = -vbounce.Y end
        if math.random()<0.25 then vbounce.Z = -vbounce.Z end
        return s
    elseif p == "chaos" then
        vchaos[1] = (vchaos[1]*1664525 + 1013904223) % 1
        vchaos[2] = (vchaos[2]*22695477 + 1) % 1
        vchaos[3] = (vchaos[3]*214013 + 2531011) % 1
        return Vector3.new(ax and (vchaos[1]*(xp+xn)-xn) or 0, ay and (vchaos[2]*(yp+yn)-yn) or 0, az and (vchaos[3]*(zp+zn)-zn) or 0)
    elseif p == "cross" then
        local t = (math.floor(tick()*10))%2==0
        return Vector3.new(ax and (t and (math.random()*(xp+xn)-xn) or 0) or 0, ay and (not t and (math.random()*(yp+yn)-yn) or 0) or 0, az and (t and (math.random()*(zp+zn)-zn) or 0) or 0)
    elseif p == "helix" then vhelix = vhelix + dt*6
        return Vector3.new(ax and math.cos(vhelix*2)*(xp+xn)/2 or 0, ay and math.sin(vhelix)*(yp+yn)/8 or 0, az and math.sin(vhelix*2)*(zp+zn)/2 or 0)
    elseif p == "strobe" then vstrobe = not vstrobe; local s = vstrobe and 1 or -1
        return Vector3.new(ax and s*xp or 0, ay and s*yp or 0, az and s*zp or 0)
    else
        return Vector3.new(ax and (math.random()*(xp+xn)-xn) or 0, ay and (math.random()*(yp+yn)-yn) or 0, az and (math.random()*(zp+zn)-zn) or 0)
    end
end
local function startVoidSpam()
    if voidSpamConn then return end
    local acc, dtBuf = 0, 0
    voidSpamConn = RunService.Heartbeat:Connect(function(dt)
        if not cfg.voidSpamEnabled then return end
        local hrp = getHrp(); if not hrp then return end
        dtBuf = dtBuf + dt; acc = acc + dt
        local interval = math.max(cfg.voidSpamInterval, 0.005)
        if acc < interval then return end
        acc = acc % interval
        local burst = math.clamp(cfg.voidSpamBurst, 1, 20)
        for _ = 1, burst do
            local pos = hrp.Position; local look = hrp.CFrame.LookVector
            local delta = getVoidSpamDelta(dtBuf / burst)
            local newPos = cfg.voidSmooth and pos:Lerp(pos+delta, math.clamp(cfg.voidSmoothAlpha, 0.01, 1)) or pos+delta
            hrp.CFrame = CFrame.new(newPos, newPos + look)
        end
        dtBuf = 0
    end)
end
local function stopVoidSpam()
    if voidSpamConn then voidSpamConn:Disconnect(); voidSpamConn = nil end
end

-- ==================== ORBIT ====================
local orbConn, orbAngle = nil, 0
local function startOrbit()
    if orbConn then orbConn:Disconnect() end
    local hum = getHum(); if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
    orbAngle = 0
    orbConn = RunService.Heartbeat:Connect(function(dt)
        if not cfg.orbit then return end
        local hrp = getHrp(); if not hrp then return end
        local cl = getClosest()
        if cl and cl.Character then
            local tHrp = cl.Character:FindFirstChild("HumanoidRootPart")
            if tHrp then
                local speedMod = (cfg.orbitSpeed or 90) / 500
                orbAngle = orbAngle + speedMod
                local radius = cfg.orbitDistance or 8
                local height = cfg.orbitHeight or 0
                local offset = Vector3.new(math.cos(orbAngle)*radius, height, math.sin(orbAngle)*radius)
                hrp.CFrame = CFrame.new(tHrp.Position + offset, tHrp.Position)
                pcall(function()
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                end)
            end
        end
    end)
end
local function stopOrbit() if orbConn then orbConn:Disconnect(); orbConn = nil end end

-- ==================== TP ENEMY ====================
local tpConn
local function startTp()
    if tpConn then tpConn:Disconnect() end
    tpConn = RunService.Heartbeat:Connect(function()
        if not cfg.teleportEnemyEnabled then return end
        local t = getClosest()
        local hrp = getHrp()
        if t and t.Character then
            local tHrp = t.Character:FindFirstChild("HumanoidRootPart")
            if tHrp and hrp then hrp.CFrame = CFrame.new(tHrp.Position + Vector3.new(0, 3.5, 0)) end
        end
    end)
end
local function stopTp() if tpConn then tpConn:Disconnect(); tpConn = nil end end

-- ==================== FAKE POSITION ====================
local fakeConn, renderPosConn, realCF = nil, nil, nil
local function startFakePosition()
    if fakeConn then fakeConn:Disconnect() end
    if renderPosConn then renderPosConn:Disconnect() end
    fakeConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if cfg.fakePositionEnabled and hrp then
            realCF = hrp.CFrame
            hrp.CFrame = realCF + Vector3.new(math.random(-150,150), math.random(10,100), math.random(-150,150))
        end
    end)
    renderPosConn = RunService.RenderStepped:Connect(function()
        local hrp = getHrp()
        if cfg.fakePositionEnabled and hrp and realCF then hrp.CFrame = realCF end
    end)
end
local function stopFakePosition()
    if fakeConn then fakeConn:Disconnect(); fakeConn = nil end
    if renderPosConn then renderPosConn:Disconnect(); renderPosConn = nil end
end

-- ==================== DESYNC ====================
local desyncH, desyncR, realVel = nil, nil, nil
local function startDesync()
    if desyncH then desyncH:Disconnect() end
    if desyncR then desyncR:Disconnect() end
    desyncH = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if cfg.desyncEnabled and hrp then
            realVel = hrp.AssemblyLinearVelocity
            hrp.AssemblyLinearVelocity = Vector3.new(math.random(-5000,5000), math.random(-5000,5000), math.random(-5000,5000))
        end
    end)
    desyncR = RunService.RenderStepped:Connect(function()
        local hrp = getHrp()
        if cfg.desyncEnabled and hrp and realVel then hrp.AssemblyLinearVelocity = realVel end
    end)
end
local function stopDesync()
    if desyncH then desyncH:Disconnect(); desyncH = nil end
    if desyncR then desyncR:Disconnect(); desyncR = nil end
end

-- ==================== EVASION ====================
local evasionConn = nil
local function startEvasion()
    if evasionConn then evasionConn:Disconnect() end
    local t0, s1, s2, s3 = tick(), math.random(1e3,9e3), math.random(1e3,9e3), math.random(1e3,9e3)
    evasionConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if not cfg.evasionEnabled or not hrp then return end
        local t, i = tick()-t0, cfg.evasionIntensity
        local r1, r2, r3 = 500*0.18*i, 500*0.35*i, 500*0.55*i
        local oX = math.cos(t*18.7)*r1 + math.cos(t*7.3+s1)*r2 + math.cos(t*2.1+s2)*r3
        local oZ = math.sin(t*18.7)*r1 + math.sin(t*7.3+s1)*r2 + math.sin(t*2.1+s2)*r3
        local oY = math.sin(t*11.3+s3)*500*0.12*i + math.sin(t*5.7)*500*0.08*i
        local jX = math.noise(t*8, s1, 0)*40*i
        local jY = math.noise(0, t*8, s2)*20*i
        local jZ = math.noise(0, 0, t*8+s3)*40*i
        safeTeleport(hrp.Position + Vector3.new(oX+jX, oY+jY, oZ+jZ))
    end)
end
local function stopEvasion() if evasionConn then evasionConn:Disconnect(); evasionConn = nil end end

-- ==================== BLINK ====================
local blinkConn, blinkAnchor = nil, nil
local function startBlink()
    if blinkConn then blinkConn:Disconnect() end
    if getHrp() then blinkAnchor = getHrp().Position end
    local last, at, seed = 0, 0, math.random(1e3,9e3)
    blinkConn = RunService.Heartbeat:Connect(function(dt)
        local hrp = getHrp()
        if not cfg.blinkEnabled or not hrp then return end
        at = at + dt
        blinkAnchor = (blinkAnchor or hrp.Position) + Vector3.new(math.sin(at*1.3+seed)*12, math.sin(at*2.1)*3, math.cos(at*1.7+seed)*12)*dt
        local now = tick()
        if (now-last) >= (1/cfg.blinkRate) then
            last = now
            local a, d = math.random()*math.pi*2, math.random()*cfg.blinkRadius
            safeTeleport(Vector3.new(blinkAnchor.X+math.cos(a)*d, blinkAnchor.Y+(math.random()-0.5)*cfg.blinkRadius*0.3, blinkAnchor.Z+math.sin(a)*d))
        end
    end)
end
local function stopBlink() if blinkConn then blinkConn:Disconnect(); blinkConn = nil end end

-- ==================== GHOST ====================
local ghostConn = nil
local function startGhost()
    if ghostConn then ghostConn:Disconnect() end
    local flip, t0, seed = false, tick(), math.random(1e3,9e3)
    ghostConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if not cfg.ghostEnabled or not hrp then return end
        flip = not flip
        if flip then
            local a = (tick()-t0)*4.3 + seed
            safeTeleport(Vector3.new(hrp.Position.X+math.cos(a)*cfg.ghostDistance, hrp.Position.Y, hrp.Position.Z+math.sin(a)*cfg.ghostDistance))
        end
    end)
end
local function stopGhost() if ghostConn then ghostConn:Disconnect(); ghostConn = nil end end

-- ==================== GLIDE ====================
local glideConn = nil
local function startGlide()
    if glideConn then glideConn:Disconnect() end
    local hum = getHum(); if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
    local vel = Vector3.zero
    glideConn = RunService.Heartbeat:Connect(function(dt)
        local hrp = getHrp()
        if not cfg.glideEnabled or not hrp then return end
        local cam = Camera
        local cf = cam and cam.CFrame or hrp.CFrame
        local f = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit
        local r = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z).Unit
        local hc = getHum()
        local md = hc and hc.MoveDirection or Vector3.zero
        local wish = Vector3.zero
        if md.Magnitude > 0.001 then
            wish = f * md:Dot(f) + r * md:Dot(r)
            if wish.Magnitude > 0.001 then wish = wish.Unit end
        end
        local accel = math.clamp(cfg.glideAccel, 1, 100)
        vel = vel:Lerp(wish*cfg.glideSpeed, 1-math.exp(-accel*dt))
        hrp.AssemblyLinearVelocity = Vector3.new(vel.X, hrp.AssemblyLinearVelocity.Y, vel.Z)
    end)
end
local function stopGlide() if glideConn then glideConn:Disconnect(); glideConn = nil end; cfg.glideEnabled = false end

-- ==================== RIOT ABUSER ====================
local riotAbuserConn = nil
local function startRiotAbuser()
    if riotAbuserConn then riotAbuserConn:Disconnect() end
    local t0, seed = tick(), math.random(1e3,9e3)
    local hrp = getHrp(); if hrp then getgenv().riotAbuserOrig = hrp.CFrame end
    riotAbuserConn = RunService.Heartbeat:Connect(function(dt)
        local hrp = getHrp()
        if not cfg.riotAbuserEnabled or not hrp then return end
        local t = tick()-t0
        local yaw = math.rad(cfg.riotAbuserSpin*dt)
        local pitch = math.rad(cfg.riotAbuserSpin*0.37*dt*math.sin(t*3.1))
        local roll = math.rad(cfg.riotAbuserSpin*0.19*dt*math.cos(t*5.7+seed))
        local spinCF = hrp.CFrame * CFrame.Angles(pitch, yaw, roll)
        local spread = cfg.riotAbuserDistance/300
        local jX = (math.random()-0.5)*cfg.riotAbuserX*spread*2 + math.noise(t*9,seed,0)*cfg.riotAbuserX*spread
        local jY = (math.random()-0.5)*cfg.riotAbuserY*spread + math.noise(0,t*9,seed)*cfg.riotAbuserY*spread*0.3
        local jZ = (math.random()-0.5)*cfg.riotAbuserZ*spread*2 + math.noise(0,0,t*9+seed)*cfg.riotAbuserZ*spread
        local newY = math.max(spinCF.Position.Y+jY, 2)
        hrp.CFrame = spinCF + Vector3.new(jX, newY-spinCF.Position.Y, jZ)
    end)
end
local function stopRiotAbuser()
    if riotAbuserConn then riotAbuserConn:Disconnect(); riotAbuserConn = nil end
    if getHrp() and getgenv().riotAbuserOrig then getHrp().CFrame = getgenv().riotAbuserOrig end
end

-- ==================== RIOT BYPASS ====================
local riotBypassConn, riotBypassTarget, riotBypassLast = nil, nil, 0
local function startRiotBypass()
    if riotBypassConn then riotBypassConn:Disconnect() end
    riotBypassConn = RunService.Heartbeat:Connect(function()
        if not cfg.riotBypassEnabled then return end
        if not riotBypassTarget or not riotBypassTarget.Character or not isAlive(riotBypassTarget) then
            riotBypassTarget = getClosest(); return
        end
        local tr = riotBypassTarget.Character:FindFirstChild("HumanoidRootPart")
        if not tr then return end
        local now = tick()
        if (now-riotBypassLast) < cfg.riotBypassUpdate then return end
        riotBypassLast = now
        local hrp = getHrp(); if not hrp then return end
        local tp, tl = tr.Position, tr.CFrame.LookVector
        local d = cfg.riotBypassDistance or 3
        local h = cfg.riotBypassHeight or 0
        local cf
        if cfg.riotBypassPosition == "Front" then cf = CFrame.lookAt(tp+tl*d+Vector3.new(0,h,0), tp+Vector3.new(0,h,0))
        elseif cfg.riotBypassPosition == "Back" then cf = CFrame.lookAt(tp-tl*d+Vector3.new(0,h,0), tp+Vector3.new(0,h,0))
        elseif cfg.riotBypassPosition == "Above" then cf = CFrame.lookAt(tp+Vector3.new(0,d+h,0), tp+Vector3.new(0,h,0))
        elseif cfg.riotBypassPosition == "Below" then cf = CFrame.lookAt(tp+Vector3.new(0,-d+h,0), tp+Vector3.new(0,h,0))
        else cf = hrp.CFrame end
        hrp.CFrame = cf
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)
end
local function stopRiotBypass()
    if riotBypassConn then riotBypassConn:Disconnect(); riotBypassConn = nil end
    riotBypassTarget = nil; riotBypassLast = 0
end

-- ==================== SLING RAGE ====================
local slingRageConn, slingProjA, slingProjB, slingProjs = nil, nil, nil, {}
local slingTarget = CFrame.new(9000,9000,9000)
local function startSlingRage()
    if slingRageConn then slingRageConn:Disconnect() end
    slingProjA = Workspace.ChildAdded:Connect(function(o)
        if not o:IsA("BasePart") then return end
        if o.Name == "CoreProjectile" then slingProjs[o] = true
        elseif o.Name == "Part" then task.defer(function()
            if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then slingProjs[o] = true end
        end) end
    end)
    slingProjB = Workspace.ChildRemoved:Connect(function(o) slingProjs[o] = nil end)
    slingRageConn = RunService.Heartbeat:Connect(function()
        if not cfg.slingRage then return end
        pcall(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local h = p.Character:FindFirstChild("HumanoidRootPart")
                    if h then h.CFrame = slingTarget; h.AssemblyLinearVelocity = Vector3.zero; h.AssemblyAngularVelocity = Vector3.zero end
                end
            end
            for _, o in ipairs(Workspace:GetChildren()) do
                if o.Name == "CoreProjectile" and o:IsA("BasePart") then
                    o.CFrame = slingTarget; o.AssemblyLinearVelocity = Vector3.zero
                end
            end
            for p in pairs(slingProjs) do
                if p and p.Parent then p.CFrame = slingTarget; p.AssemblyLinearVelocity = Vector3.zero
                else slingProjs[p] = nil end
            end
        end)
    end)
end
local function stopSlingRage()
    if slingRageConn then slingRageConn:Disconnect(); slingRageConn = nil end
    if slingProjA then slingProjA:Disconnect(); slingProjA = nil end
    if slingProjB then slingProjB:Disconnect(); slingProjB = nil end
    slingProjs = {}
end

-- ==================== ANTI PROJ ====================
local apConn, apProjA, apProjB, apProjs = nil, nil, nil, {}
local apTarget = CFrame.new(999999,999999,999999)
local function startAntiProj()
    if apConn then apConn:Disconnect() end
    apProjA = Workspace.ChildAdded:Connect(function(o)
        if not o:IsA("BasePart") then return end
        if o.Name == "CoreProjectile" then apProjs[o] = true
        elseif o.Name == "Part" then task.defer(function()
            if o and o.Parent and o.AssemblyLinearVelocity.Magnitude > 50 then apProjs[o] = true end
        end) end
    end)
    apProjB = Workspace.ChildRemoved:Connect(function(o) apProjs[o] = nil end)
    apConn = RunService.Heartbeat:Connect(function()
        if not cfg.antiProj then return end
        pcall(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local h = p.Character:FindFirstChild("HumanoidRootPart")
                    if h then h.CFrame = apTarget; h.AssemblyLinearVelocity = Vector3.zero; h.AssemblyAngularVelocity = Vector3.zero end
                end
            end
            for _, o in ipairs(Workspace:GetChildren()) do
                if o.Name == "CoreProjectile" and o:IsA("BasePart") then
                    o.CFrame = apTarget; o.AssemblyLinearVelocity = Vector3.zero
                end
            end
            for p in pairs(apProjs) do
                if p and p.Parent then p.CFrame = apTarget; p.AssemblyLinearVelocity = Vector3.zero
                else apProjs[p] = nil end
            end
        end)
    end)
end
local function stopAntiProj()
    if apConn then apConn:Disconnect(); apConn = nil end
    if apProjA then apProjA:Disconnect(); apProjA = nil end
    if apProjB then apProjB:Disconnect(); apProjB = nil end
    apProjs = {}
end

-- ==================== ANTI CLOSE ====================
local antiCloseConn = nil
local function startAntiClose()
    if antiCloseConn then antiCloseConn:Disconnect() end
    antiCloseConn = RunService.Heartbeat:Connect(function()
        if not cfg.antiClose then return end
        local hrp = getHrp(); if not hrp then return end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local tHrp = p.Character:FindFirstChild("HumanoidRootPart")
                if tHrp and (hrp.Position - tHrp.Position).Magnitude < 20 then
                    hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
                    break
                end
            end
        end
    end)
end
local function stopAntiClose() if antiCloseConn then antiCloseConn:Disconnect(); antiCloseConn = nil end end

-- ==================== FAST RELOAD ====================
local function startFastReload()
    local ok, ItemLibrary = pcall(function() return require(game:GetService("ReplicatedStorage").Modules.ItemLibrary) end)
    if not ok or not ItemLibrary then return end
    local Items = rawget(ItemLibrary, "Items"); if not Items then return end
    task.spawn(function()
        while cfg.fastReload do
            for _, Item in pairs(Items) do
                pcall(function()
                    local speed = Item.Name == "Daggers" and 0.09 or 0
                    rawset(Item, "ReloadLength", speed); rawset(Item, "FireRate", 0)
                    rawset(Item, "Cooldown", 0); rawset(Item, "AttackCooldown", 0)
                    rawset(Item, "SwingCooldown", 0); rawset(Item, "ThrowCooldown", 0)
                    rawset(Item, "RecoverTime", 0); rawset(Item, "WindupTime", 0)
                end)
            end
            task.wait(0.1)
        end
    end)
end

-- ==================== WALLBANG ====================
local lastShoot = 0
local function handleWallbang()
    if not cfg.wallbangEnabled then return end
    local cl = getClosest(); local hrp = getHrp(); local char = LocalPlayer.Character
    if cl and cl.Character and cl.Character:FindFirstChild("Head") and hrp and char then
        local hd = cl.Character.Head
        local cam = Camera
        cam.CFrame = CFrame.lookAt(cam.CFrame.Position, hd.Position)
        local t = char:FindFirstChildOfClass("Tool")
        if t then t:Activate() end
        if tick()-lastShoot > 0.05 then
            lastShoot = tick()
            pcall(function()
                if isMobile then
                    local center = cam.ViewportSize/2
                    if firetouchtap then firetouchtap(center) elseif touchtap then touchtap(center) end
                else
                    if mouse1click then mouse1click() else VirtualUser:ClickButton1(Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)) end
                end
            end)
        end
    end
end
local function startWallbang() RunService:BindToRenderStep("WindWb", Enum.RenderPriority.Camera.Value+1, handleWallbang) end
local function stopWallbang() RunService:UnbindFromRenderStep("WindWb") end

-- ==================== RAPID FIRE ====================
local rfConn = nil
local function startRapidFire()
    if rfConn then rfConn:Disconnect() end
    rfConn = RunService.Heartbeat:Connect(function()
        if cfg.rapidFire then
            local t = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if t then t:Activate() end
        end
    end)
end
local function stopRapidFire() if rfConn then rfConn:Disconnect(); rfConn = nil end end

-- ==================== AUTOCOLLECT ====================
local acConn = nil
local function startAutocollect()
    if acConn then acConn:Disconnect() end
    acConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if not cfg.autocollectEnabled or not hrp then return end
        local best, minD = nil, math.huge
        for _, o in ipairs(Workspace:GetDescendants()) do
            local n = o.Name:lower()
            if n:find("heal") or n:find("health") or n:find("medkit") or n:find("bandage") then
                local p = o:IsA("Model") and (o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")) or (o:IsA("BasePart") and o or nil)
                if p then
                    local d = (p.Position - hrp.Position).Magnitude
                    if d < minD and d <= cfg.autocollectRadius then minD = d; best = p.Position end
                end
            end
        end
        if best then safeTeleport(best) end
    end)
end
local function stopAutocollect() if acConn then acConn:Disconnect(); acConn = nil end end

-- ==================== SAFE ZONE ====================
local szConn = nil
local function startSafeZone()
    if szConn then szConn:Disconnect() end
    szConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp(); if not hrp then return end
        if hrp.Position.Y > cfg.safeZoneY then getgenv().szSavedPos = hrp.Position
        elseif cfg.safeZoneEnabled and getgenv().szSavedPos then hrp.CFrame = CFrame.new(getgenv().szSavedPos) end
    end)
end
local function stopSafeZone() if szConn then szConn:Disconnect(); szConn = nil end end

-- ==================== RETURN HOME ====================
local homeConn = nil
local function startReturnHome()
    if homeConn then homeConn:Disconnect() end
    if not getgenv().homePosition and getHrp() then getgenv().homePosition = getHrp().Position end
    local last = 0
    homeConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if not cfg.returnHomeEnabled or not hrp or not getgenv().homePosition then return end
        if (hrp.Position - getgenv().homePosition).Magnitude > 50 and (tick()-last) >= cfg.homeReturnDelay then
            last = tick(); safeTeleport(getgenv().homePosition)
        end
    end)
end
local function stopReturnHome() if homeConn then homeConn:Disconnect(); homeConn = nil end end

-- ==================== TELEPORT LOOP ====================
local loopConn = nil
local function startTeleportLoop()
    if loopConn then pcall(task.cancel, loopConn) end
    cfg.teleportLoopEnabled = true
    loopConn = task.spawn(function()
        while cfg.teleportLoopEnabled do
            if #(getgenv().loopWaypoints or {}) > 0 and getHrp() then
                local t = getgenv().loopWaypoints[getgenv().loopIndex]
                if t then safeTeleport(t) end
                getgenv().loopIndex = (getgenv().loopIndex % #getgenv().loopWaypoints) + 1
            end
            task.wait(cfg.teleportLoopDelay)
        end
    end)
end
local function stopTeleportLoop()
    cfg.teleportLoopEnabled = false
    if loopConn then pcall(task.cancel, loopConn); loopConn = nil end
end

-- ==================== ANTI AFK ====================
local afkConn = nil
local function startAntiAfk()
    if afkConn then afkConn:Disconnect() end
    afkConn = LocalPlayer.Idled:Connect(function()
        if cfg.antiAfkEnabled then
            VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
        end
    end)
end
local function stopAntiAfk() if afkConn then afkConn:Disconnect(); afkConn = nil end end

-- ==================== UNDER MAP ====================
local umConn = nil
local function startUnderMap()
    if umConn then umConn:Disconnect() end
    umConn = RunService.Heartbeat:Connect(function()
        local hrp = getHrp()
        if not cfg.underMapEnabled or not hrp then return end
        for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
        hrp.CFrame = CFrame.new(hrp.Position.X, cfg.underMapY, hrp.Position.Z)
    end)
end
local function stopUnderMap() if umConn then umConn:Disconnect(); umConn = nil end end

-- ==================== UI LIBRARY (Sanity.hit) ====================
local Library = {
    Registry = {}; RegistryMap = {}; HudRegistry = {}; FontColor = Color3.fromRGB(255, 255, 255);
    MainColor = Color3.fromRGB(21, 21, 21); BackgroundColor = Color3.fromRGB(20, 20, 20);
    AccentColor = Color3.fromRGB(255, 162, 167); OutlineColor = Color3.fromRGB(50, 50, 50);
    RiskColor = Color3.fromRGB(255, 50, 50); Black = Color3.new(0, 0, 0);
    Font = Enum.Font.Code; OpenedFrames = {}; DependencyBoxes = {}; Signals = {};
}
local RainbowStep = 0
local Hue = 0
local ScreenGui = Instance.new('ScreenGui')
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = CoreGui
if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end
if protect_gui then protect_gui(ScreenGui) end
Library.ScreenGui = ScreenGui

table.insert(Library.Signals, RunService.RenderStepped:Connect(function(Delta)
    RainbowStep = RainbowStep + Delta
    if RainbowStep >= (1 / 60) then
        RainbowStep = 0
        Hue = Hue + (1 / 400)
        if Hue > 1 then Hue = 0 end
        Library.CurrentRainbowHue = Hue
        Library.CurrentRainbowColor = Color3.fromHSV(Hue, 0.8, 1)
    end
end))

function Library:SafeCallback(f, ...)
    if not f then return end
    local success, event = pcall(f, ...)
    if not success then
        local _, i = event:find(":%d+: ")
        if not i then return warn(event) end
        return warn(event:sub(i + 1))
    end
end

function Library:Create(Class, Properties)
    local _Instance = Class
    if type(Class) == 'string' then _Instance = Instance.new(Class) end
    for Property, Value in next, Properties do _Instance[Property] = Value end
    return _Instance
end

function Library:ApplyTextStroke(Inst)
    Inst.TextStrokeTransparency = 1
    Library:Create('UIStroke', { Color = Color3.new(0, 0, 0); Thickness = 1; LineJoinMode = Enum.LineJoinMode.Miter; Parent = Inst })
end

function Library:CreateLabel(Properties, IsHud)
    local _Instance = Library:Create('TextLabel', {
        BackgroundTransparency = 1; Font = Library.Font; TextColor3 = Library.FontColor;
        TextSize = 16; TextStrokeTransparency = 0;
    })
    Library:ApplyTextStroke(_Instance)
    Library:AddToRegistry(_Instance, { TextColor3 = 'FontColor' }, IsHud)
    return Library:Create(_Instance, Properties)
end

function Library:MakeDraggable(Instance, Cutoff)
    Instance.Active = true
    Instance.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            local ObjPos = Vector2.new(
                LocalPlayer:GetMouse().X - Instance.AbsolutePosition.X,
                LocalPlayer:GetMouse().Y - Instance.AbsolutePosition.Y)
            if ObjPos.Y > (Cutoff or 40) then return end
            while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                Instance.Position = UDim2.new(
                    0, LocalPlayer:GetMouse().X - ObjPos.X + (Instance.Size.X.Offset * Instance.AnchorPoint.X),
                    0, LocalPlayer:GetMouse().Y - ObjPos.Y + (Instance.Size.Y.Offset * Instance.AnchorPoint.Y))
                RunService.RenderStepped:Wait()
            end
        end
    end)
end

function Library:AddToolTip(InfoStr, HoverInstance)
    local X, Y = Library:GetTextBounds(InfoStr, Library.Font, 14)
    local Tooltip = Library:Create('Frame', {
        BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor;
        Size = UDim2.fromOffset(X + 5, Y + 4); ZIndex = 100; Parent = Library.ScreenGui; Visible = false;
    })
    local Label = Library:CreateLabel({
        Position = UDim2.fromOffset(3, 1); Size = UDim2.fromOffset(X, Y); TextSize = 14;
        Text = InfoStr; TextColor3 = Library.FontColor; TextXAlignment = Enum.TextXAlignment.Left;
        ZIndex = Tooltip.ZIndex + 1; Parent = Tooltip;
    })
    Library:AddToRegistry(Tooltip, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
    Library:AddToRegistry(Label, { TextColor3 = 'FontColor' })
    local IsHovering = false
    HoverInstance.MouseEnter:Connect(function()
        IsHovering = true
        Tooltip.Position = UDim2.fromOffset(LocalPlayer:GetMouse().X + 15, LocalPlayer:GetMouse().Y + 12)
        Tooltip.Visible = true
        while IsHovering do
            RunService.Heartbeat:Wait()
            Tooltip.Position = UDim2.fromOffset(LocalPlayer:GetMouse().X + 15, LocalPlayer:GetMouse().Y + 12)
        end
    end)
    HoverInstance.MouseLeave:Connect(function() IsHovering = false; Tooltip.Visible = false end)
end

function Library:OnHighlight(HighlightInstance, Instance, Properties, PropertiesDefault)
    HighlightInstance.MouseEnter:Connect(function()
        local Reg = Library.RegistryMap[Instance]
        for Property, ColorIdx in next, Properties do
            Instance[Property] = Library[ColorIdx] or ColorIdx
            if Reg and Reg.Properties[Property] then Reg.Properties[Property] = ColorIdx end
        end
    end)
    HighlightInstance.MouseLeave:Connect(function()
        local Reg = Library.RegistryMap[Instance]
        for Property, ColorIdx in next, PropertiesDefault do
            Instance[Property] = Library[ColorIdx] or ColorIdx
            if Reg and Reg.Properties[Property] then Reg.Properties[Property] = ColorIdx end
        end
    end)
end

function Library:MouseIsOverOpenedFrame()
    for Frame, _ in next, Library.OpenedFrames do
        local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize
        if LocalPlayer:GetMouse().X >= AbsPos.X and LocalPlayer:GetMouse().X <= AbsPos.X + AbsSize.X
            and LocalPlayer:GetMouse().Y >= AbsPos.Y and LocalPlayer:GetMouse().Y <= AbsPos.Y + AbsSize.Y then
            return true
        end
    end
end

function Library:IsMouseOverFrame(Frame)
    local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize
    if LocalPlayer:GetMouse().X >= AbsPos.X and LocalPlayer:GetMouse().X <= AbsPos.X + AbsSize.X
        and LocalPlayer:GetMouse().Y >= AbsPos.Y and LocalPlayer:GetMouse().Y <= AbsPos.Y + AbsSize.Y then
        return true
    end
end

function Library:UpdateDependencyBoxes()
    for _, Depbox in next, Library.DependencyBoxes do Depbox:Update() end
end

function Library:MapValue(Value, MinA, MaxA, MinB, MaxB)
    return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB
end

function Library:GetTextBounds(Text, Font, Size, Resolution)
    local Bounds = game:GetService('TextService'):GetTextSize(Text, Size, Font, Resolution or Vector2.new(1920, 1080))
    return Bounds.X, Bounds.Y
end

function Library:GetDarkerColor(Color)
    local H, S, V = Color3.toHSV(Color)
    return Color3.fromHSV(H, S, V / 1.5)
end
Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor)

function Library:AddToRegistry(Instance, Properties, IsHud)
    local Idx = #Library.Registry + 1
    local Data = { Instance = Instance; Properties = Properties; Idx = Idx }
    table.insert(Library.Registry, Data)
    Library.RegistryMap[Instance] = Data
    if IsHud then table.insert(Library.HudRegistry, Data) end
end

function Library:RemoveFromRegistry(Instance)
    local Data = Library.RegistryMap[Instance]
    if Data then
        for Idx = #Library.Registry, 1, -1 do if Library.Registry[Idx] == Data then table.remove(Library.Registry, Idx) end end
        for Idx = #Library.HudRegistry, 1, -1 do if Library.HudRegistry[Idx] == Data then table.remove(Library.HudRegistry, Idx) end end
        Library.RegistryMap[Instance] = nil
    end
end

function Library:UpdateColorsUsingRegistry()
    for Idx, Object in next, Library.Registry do
        for Property, ColorIdx in next, Object.Properties do
            if type(ColorIdx) == 'string' then Object.Instance[Property] = Library[ColorIdx]
            elseif type(ColorIdx) == 'function' then Object.Instance[Property] = ColorIdx() end
        end
    end
end

function Library:GiveSignal(Signal) table.insert(Library.Signals, Signal) end

function Library:Unload()
    for Idx = #Library.Signals, 1, -1 do local Connection = table.remove(Library.Signals, Idx); Connection:Disconnect() end
    if Library.OnUnload then Library.OnUnload() end
    ScreenGui:Destroy()
end

function Library:OnUnload(Callback) Library.OnUnload = Callback end

Library:GiveSignal(ScreenGui.DescendantRemoving:Connect(function(Instance)
    if Library.RegistryMap[Instance] then Library:RemoveFromRegistry(Instance) end
end))

-- ==================== BASE ADDONS ====================
local BaseAddons = {}
do
    local Funcs = {}
    function Funcs:AddColorPicker(Idx, Info)
        local ToggleLabel = self.TextLabel
        assert(Info.Default, 'AddColorPicker: Missing default value.')
        local ColorPicker = { Value = Info.Default; Transparency = Info.Transparency or 0; Type = 'ColorPicker'; Title = type(Info.Title) == 'string' and Info.Title or 'Color picker'; Callback = Info.Callback or function(Color) end }
        function ColorPicker:SetHSVFromRGB(Color) local H, S, V = Color3.toHSV(Color); ColorPicker.Hue = H; ColorPicker.Sat = S; ColorPicker.Vib = V end
        ColorPicker:SetHSVFromRGB(ColorPicker.Value)
        local DisplayFrame = Library:Create('Frame', { BackgroundColor3 = ColorPicker.Value; BorderColor3 = Library:GetDarkerColor(ColorPicker.Value); BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(0, 28, 0, 14); ZIndex = 6; Parent = ToggleLabel })
        local PickerFrameOuter = Library:Create('Frame', { Name = 'Color'; BackgroundColor3 = Color3.new(1,1,1); BorderColor3 = Color3.new(0,0,0); Position = UDim2.fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18); Size = UDim2.fromOffset(230, Info.Transparency and 271 or 253); Visible = false; ZIndex = 15; Parent = ScreenGui })
        DisplayFrame:GetPropertyChangedSignal('AbsolutePosition'):Connect(function() PickerFrameOuter.Position = UDim2.fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18) end)
        local PickerFrameInner = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 16; Parent = PickerFrameOuter })
        local Highlight = Library:Create('Frame', { BackgroundColor3 = Library.AccentColor; BorderSizePixel = 0; Size = UDim2.new(1,0,0,2); ZIndex = 17; Parent = PickerFrameInner })
        local SatVibMapOuter = Library:Create('Frame', { BorderColor3 = Color3.new(0,0,0); Position = UDim2.new(0,4,0,25); Size = UDim2.new(0,200,0,200); ZIndex = 17; Parent = PickerFrameInner })
        local SatVibMapInner = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 18; Parent = SatVibMapOuter })
        local SatVibMap = Library:Create('ImageLabel', { BorderSizePixel = 0; Size = UDim2.new(1,0,1,0); ZIndex = 18; Image = 'rbxassetid://4155801252'; Parent = SatVibMapInner })
        local CursorOuter = Library:Create('ImageLabel', { AnchorPoint = Vector2.new(0.5,0.5); Size = UDim2.new(0,6,0,6); BackgroundTransparency = 1; Image = 'http://www.roblox.com/asset/?id=9619665977'; ImageColor3 = Color3.new(0,0,0); ZIndex = 19; Parent = SatVibMap })
        local HueSelectorOuter = Library:Create('Frame', { BorderColor3 = Color3.new(0,0,0); Position = UDim2.new(0,208,0,25); Size = UDim2.new(0,15,0,200); ZIndex = 17; Parent = PickerFrameInner })
        local HueSelectorInner = Library:Create('Frame', { BackgroundColor3 = Color3.new(1,1,1); BorderSizePixel = 0; Size = UDim2.new(1,0,1,0); ZIndex = 18; Parent = HueSelectorOuter })
        local HueCursor = Library:Create('Frame', { BackgroundColor3 = Color3.new(1,1,1); AnchorPoint = Vector2.new(0,0.5); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,0,0,1); ZIndex = 18; Parent = HueSelectorInner })
        local HueBoxOuter = Library:Create('Frame', { BorderColor3 = Color3.new(0,0,0); Position = UDim2.fromOffset(4,228); Size = UDim2.new(0.5,-6,0,20); ZIndex = 18; Parent = PickerFrameInner })
        local HueBoxInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 18; Parent = HueBoxOuter })
        local HueBox = Library:Create('TextBox', { BackgroundTransparency = 1; Position = UDim2.new(0,5,0,0); Size = UDim2.new(1,-5,1,0); Font = Library.Font; PlaceholderColor3 = Color3.fromRGB(190,190,190); PlaceholderText = 'Hex color'; Text = '#FFFFFF'; TextColor3 = Library.FontColor; TextSize = 14; TextStrokeTransparency = 0; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 20; Parent = HueBoxInner })
        local RgbBoxBase = Library:Create(HueBoxOuter:Clone(), { Position = UDim2.new(0.5,2,0,228); Size = UDim2.new(0.5,-6,0,20); Parent = PickerFrameInner })
        local RgbBox = Library:Create(RgbBoxBase.Frame:FindFirstChild('TextBox'), { Text = '255, 255, 255'; PlaceholderText = 'RGB color'; TextColor3 = Library.FontColor })
        Library:Create('UIGradient', { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(212,212,212)) }); Rotation = 90; Parent = HueBoxInner })
        local DisplayLabel = Library:CreateLabel({ Size = UDim2.new(1,0,0,14); Position = UDim2.fromOffset(5,5); TextXAlignment = Enum.TextXAlignment.Left; TextSize = 14; Text = ColorPicker.Title; TextWrapped = false; ZIndex = 16; Parent = PickerFrameInner })
        Library:AddToRegistry(PickerFrameInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
        Library:AddToRegistry(Highlight, { BackgroundColor3 = 'AccentColor' })
        Library:AddToRegistry(SatVibMapInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
        Library:AddToRegistry(HueBoxInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        Library:AddToRegistry(RgbBoxBase.Frame, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        Library:AddToRegistry(RgbBox, { TextColor3 = 'FontColor' })
        Library:AddToRegistry(HueBox, { TextColor3 = 'FontColor' })
        local SequenceTable = {}
        for HueVal = 0, 1, 0.1 do table.insert(SequenceTable, ColorSequenceKeypoint.new(HueVal, Color3.fromHSV(HueVal, 1, 1))) end
        Library:Create('UIGradient', { Color = ColorSequence.new(SequenceTable); Rotation = 90; Parent = HueSelectorInner })
        HueBox.FocusLost:Connect(function(enter) if enter then local success, result = pcall(Color3.fromHex, HueBox.Text); if success and typeof(result) == 'Color3' then ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color3.toHSV(result) end end; ColorPicker:Display() end)
        RgbBox.FocusLost:Connect(function(enter) if enter then local r, g, b = RgbBox.Text:match('(%d+),%s*(%d+),%s*(%d+)'); if r and g and b then ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color3.toHSV(Color3.fromRGB(r,g,b)) end end; ColorPicker:Display() end)
        function ColorPicker:Display()
            ColorPicker.Value = Color3.fromHSV(ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib)
            SatVibMap.BackgroundColor3 = Color3.fromHSV(ColorPicker.Hue, 1, 1)
            Library:Create(DisplayFrame, { BackgroundColor3 = ColorPicker.Value; BackgroundTransparency = ColorPicker.Transparency; BorderColor3 = Library:GetDarkerColor(ColorPicker.Value) })
            CursorOuter.Position = UDim2.new(ColorPicker.Sat, 0, 1 - ColorPicker.Vib, 0)
            HueCursor.Position = UDim2.new(0, 0, ColorPicker.Hue, 0)
            HueBox.Text = '#' .. ColorPicker.Value:ToHex()
            RgbBox.Text = table.concat({ math.floor(ColorPicker.Value.R*255), math.floor(ColorPicker.Value.G*255), math.floor(ColorPicker.Value.B*255) }, ', ')
            Library:SafeCallback(ColorPicker.Callback, ColorPicker.Value)
            Library:SafeCallback(ColorPicker.Changed, ColorPicker.Value)
        end
        function ColorPicker:OnChanged(Func) ColorPicker.Changed = Func; Func(ColorPicker.Value) end
        function ColorPicker:Show() for Frame, Val in next, Library.OpenedFrames do if Frame.Name == 'Color' then Frame.Visible = false; Library.OpenedFrames[Frame] = nil end end; PickerFrameOuter.Visible = true; Library.OpenedFrames[PickerFrameOuter] = true end
        function ColorPicker:Hide() PickerFrameOuter.Visible = false; Library.OpenedFrames[PickerFrameOuter] = nil end
        SatVibMap.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do local MinX = SatVibMap.AbsolutePosition.X; local MaxX = MinX + SatVibMap.AbsoluteSize.X; local MouseX = math.clamp(LocalPlayer:GetMouse().X, MinX, MaxX); local MinY = SatVibMap.AbsolutePosition.Y; local MaxY = MinY + SatVibMap.AbsoluteSize.Y; local MouseY = math.clamp(LocalPlayer:GetMouse().Y, MinY, MaxY); ColorPicker.Sat = (MouseX-MinX)/(MaxX-MinX); ColorPicker.Vib = 1 - ((MouseY-MinY)/(MaxY-MinY)); ColorPicker:Display(); RunService.RenderStepped:Wait() end end end)
        HueSelectorInner.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do local MinY = HueSelectorInner.AbsolutePosition.Y; local MaxY = MinY + HueSelectorInner.AbsoluteSize.Y; local MouseY = math.clamp(LocalPlayer:GetMouse().Y, MinY, MaxY); ColorPicker.Hue = (MouseY-MinY)/(MaxY-MinY); ColorPicker:Display(); RunService.RenderStepped:Wait() end end end)
        DisplayFrame.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then if PickerFrameOuter.Visible then ColorPicker:Hide() else ColorPicker:Show() end end end)
        Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then local AbsPos, AbsSize = PickerFrameOuter.AbsolutePosition, PickerFrameOuter.AbsoluteSize; if LocalPlayer:GetMouse().X < AbsPos.X or LocalPlayer:GetMouse().X > AbsPos.X + AbsSize.X or LocalPlayer:GetMouse().Y < (AbsPos.Y-20-1) or LocalPlayer:GetMouse().Y > AbsPos.Y + AbsSize.Y then ColorPicker:Hide() end end end))
        ColorPicker:Display()
        getgenv().Options = getgenv().Options or {}
        getgenv().Options[Idx] = ColorPicker
        return self
    end
    function Funcs:AddKeyPicker(Idx, Info)
        local ParentObj = self
        local ToggleLabel = self.TextLabel
        assert(Info.Default, 'AddKeyPicker: Missing default value.')
        local KeyPicker = { Value = Info.Default; Toggled = false; Mode = Info.Mode or 'Toggle'; Type = 'KeyPicker'; Callback = Info.Callback or function(Value) end; ChangedCallback = Info.ChangedCallback or function(New) end; SyncToggleState = Info.SyncToggleState or false }
        if KeyPicker.SyncToggleState then Info.Modes = { 'Toggle' }; Info.Mode = 'Toggle' end
        local PickOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(0,28,0,15); ZIndex = 6; Parent = ToggleLabel })
        local PickInner = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 7; Parent = PickOuter })
        Library:AddToRegistry(PickInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
        local DisplayLabel = Library:CreateLabel({ Size = UDim2.new(1,0,1,0); TextSize = 13; Text = Info.Default; TextWrapped = true; ZIndex = 8; Parent = PickInner })
        local Picking = false
        PickOuter.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                Picking = true; DisplayLabel.Text = ''; local Break; local Text = ''
                task.spawn(function() while (not Break) do if Text == '...' then Text = '' end; Text = Text .. '.'; DisplayLabel.Text = Text; wait(0.4) end end)
                wait(0.2)
                local Event
                Event = UserInputService.InputBegan:Connect(function(Input)
                    local Key
                    if Input.UserInputType == Enum.UserInputType.Keyboard then Key = Input.KeyCode.Name
                    elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then Key = 'MB1'
                    elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then Key = 'MB2' end
                    if Key then Break = true; Picking = false; DisplayLabel.Text = Key; KeyPicker.Value = Key; Library:SafeCallback(KeyPicker.ChangedCallback, Input.KeyCode or Input.UserInputType); Library:SafeCallback(KeyPicker.Changed, Input.KeyCode or Input.UserInputType); Event:Disconnect() end
                end)
            end
        end)
        Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input)
            if (not Picking) and KeyPicker.Mode == 'Toggle' then
                local Key = KeyPicker.Value
                if Key == 'MB1' or Key == 'MB2' then
                    if Key == 'MB1' and Input.UserInputType == Enum.UserInputType.MouseButton1 or Key == 'MB2' and Input.UserInputType == Enum.UserInputType.MouseButton2 then KeyPicker.Toggled = not KeyPicker.Toggled; Library:SafeCallback(KeyPicker.Callback, KeyPicker.Toggled) end
                elseif Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Key then KeyPicker.Toggled = not KeyPicker.Toggled; Library:SafeCallback(KeyPicker.Callback, KeyPicker.Toggled) end
            end
        end))
        getgenv().Options = getgenv().Options or {}
        getgenv().Options[Idx] = KeyPicker
        return self
    end
    BaseAddons.__index = Funcs
    BaseAddons.__namecall = function(Table, Key, ...) return Funcs[Key](...) end
end

-- ==================== GROUPBOX ====================
local BaseGroupbox = {}
do
    local Funcs = {}
    function Funcs:AddBlank(Size) Library:Create('Frame', { BackgroundTransparency = 1; Size = UDim2.new(1,0,0,Size); ZIndex = 1; Parent = self.Container }) end
    function Funcs:AddLabel(Text, DoesWrap)
        local Label = {}; local Groupbox = self; local Container = Groupbox.Container
        local TextLabel = Library:CreateLabel({ Size = UDim2.new(1,-4,0,15); TextSize = 14; Text = Text; TextWrapped = DoesWrap or false; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 5; Parent = Container })
        Label.TextLabel = TextLabel; Label.Container = Container
        function Label:SetText(Text) TextLabel.Text = Text end
        if (not DoesWrap) then setmetatable(Label, BaseAddons) end
        Groupbox:AddBlank(5); Groupbox:Resize(); return Label
    end
    function Funcs:AddButton(...)
        local Button = {}
        local function ProcessButtonParams(Class, Obj, ...)
            local Props = select(1, ...)
            if type(Props) == 'table' then Obj.Text = Props.Text; Obj.Func = Props.Func; Obj.DoubleClick = Props.DoubleClick; Obj.Tooltip = Props.Tooltip
            else Obj.Text = select(1, ...); Obj.Func = select(2, ...) end
            assert(type(Obj.Func) == 'function', 'AddButton: `Func` callback is missing.')
        end
        ProcessButtonParams('Button', Button, ...)
        local Groupbox = self; local Container = Groupbox.Container
        local function CreateBaseButton(Button)
            local Outer = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-4,0,20); ZIndex = 5 })
            local Inner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = Outer })
            local Label = Library:CreateLabel({ Size = UDim2.new(1,0,1,0); TextSize = 14; Text = Button.Text; ZIndex = 6; Parent = Inner })
            Library:Create('UIGradient', { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(212,212,212)) }); Rotation = 90; Parent = Inner })
            Library:AddToRegistry(Outer, { BorderColor3 = 'Black' }); Library:AddToRegistry(Inner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
            Library:OnHighlight(Outer, Outer, { BorderColor3 = 'AccentColor' }, { BorderColor3 = 'Black' })
            return Outer, Inner, Label
        end
        Button.Outer, Button.Inner, Button.Label = CreateBaseButton(Button); Button.Outer.Parent = Container
        Button.Outer.InputBegan:Connect(function(Input)
            if Input.UserInputType ~= Enum.UserInputType.MouseButton1 or Library:MouseIsOverOpenedFrame() then return end
            Library:SafeCallback(Button.Func)
        end)
        function Button:AddTooltip(tooltip) if type(tooltip) == 'string' then Library:AddToolTip(tooltip, self.Outer) end; return self end
        if type(Button.Tooltip) == 'string' then Button:AddTooltip(Button.Tooltip) end
        Groupbox:AddBlank(5); Groupbox:Resize(); return Button
    end
    function Funcs:AddDivider()
        local Groupbox = self; local Container = self.Container; Groupbox:AddBlank(2)
        local DividerOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-4,0,5); ZIndex = 5; Parent = Container })
        local DividerInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = DividerOuter })
        Library:AddToRegistry(DividerOuter, { BorderColor3 = 'Black' }); Library:AddToRegistry(DividerInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        Groupbox:AddBlank(9); Groupbox:Resize()
    end
    function Funcs:AddInput(Idx, Info)
        assert(Info.Text, 'AddInput: Missing `Text` string.')
        local Textbox = { Value = Info.Default or ''; Numeric = Info.Numeric or false; Finished = Info.Finished or false; Type = 'Input'; Callback = Info.Callback or function(Value) end }
        local Groupbox = self; local Container = Groupbox.Container
        Library:CreateLabel({ Size = UDim2.new(1,0,0,15); TextSize = 14; Text = Info.Text; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 5; Parent = Container })
        Groupbox:AddBlank(1)
        local TextBoxOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-4,0,20); ZIndex = 5; Parent = Container })
        local TextBoxInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = TextBoxOuter })
        Library:AddToRegistry(TextBoxInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        Library:OnHighlight(TextBoxOuter, TextBoxOuter, { BorderColor3 = 'AccentColor' }, { BorderColor3 = 'Black' })
        local Box = Library:Create('TextBox', { BackgroundTransparency = 1; Position = UDim2.fromOffset(5,0); Size = UDim2.new(1,-10,1,0); Font = Library.Font; PlaceholderColor3 = Color3.fromRGB(190,190,190); PlaceholderText = Info.Placeholder or ''; Text = Info.Default or ''; TextColor3 = Library.FontColor; TextSize = 14; TextStrokeTransparency = 0; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 7; Parent = TextBoxInner })
        Library:ApplyTextStroke(Box)
        function Textbox:SetValue(Text)
            if Info.MaxLength and #Text > Info.MaxLength then Text = Text:sub(1, Info.MaxLength) end
            if Textbox.Numeric then if (not tonumber(Text)) and Text:len() > 0 then Text = Textbox.Value end end
            Textbox.Value = Text; Box.Text = Text; Library:SafeCallback(Textbox.Callback, Textbox.Value); Library:SafeCallback(Textbox.Changed, Textbox.Value)
        end
        if Textbox.Finished then Box.FocusLost:Connect(function(enter) if enter then Textbox:SetValue(Box.Text) end end)
        else Box:GetPropertyChangedSignal('Text'):Connect(function() Textbox:SetValue(Box.Text) end) end
        Library:AddToRegistry(Box, { TextColor3 = 'FontColor' })
        function Textbox:OnChanged(Func) Textbox.Changed = Func; Func(Textbox.Value) end
        Groupbox:AddBlank(5); Groupbox:Resize()
        getgenv().Options = getgenv().Options or {}
        getgenv().Options[Idx] = Textbox; return Textbox
    end
    function Funcs:AddToggle(Idx, Info)
        assert(Info.Text, 'AddToggle: Missing `Text` string.')
        local Toggle = { Value = Info.Default or false; Type = 'Toggle'; Callback = Info.Callback or function(Value) end; Addons = {}; Risky = Info.Risky }
        local Groupbox = self; local Container = Groupbox.Container
        local ToggleOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(0,13,0,13); ZIndex = 5; Parent = Container })
        Library:AddToRegistry(ToggleOuter, { BorderColor3 = 'Black' })
        local ToggleInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = ToggleOuter })
        Library:AddToRegistry(ToggleInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        local ToggleLabel = Library:CreateLabel({ Size = UDim2.new(0,216,1,0); Position = UDim2.new(1,6,0,0); TextSize = 14; Text = Info.Text; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 6; Parent = ToggleInner })
        Library:Create('UIListLayout', { Padding = UDim.new(0,4); FillDirection = Enum.FillDirection.Horizontal; HorizontalAlignment = Enum.HorizontalAlignment.Right; SortOrder = Enum.SortOrder.LayoutOrder; Parent = ToggleLabel })
        local ToggleRegion = Library:Create('Frame', { BackgroundTransparency = 1; Size = UDim2.new(0,170,1,0); ZIndex = 8; Parent = ToggleOuter })
        Library:OnHighlight(ToggleRegion, ToggleOuter, { BorderColor3 = 'AccentColor' }, { BorderColor3 = 'Black' })
        function Toggle:Display()
            ToggleInner.BackgroundColor3 = Toggle.Value and Library.AccentColor or Library.MainColor
            ToggleInner.BorderColor3 = Toggle.Value and Library.AccentColorDark or Library.OutlineColor
            Library.RegistryMap[ToggleInner].Properties.BackgroundColor3 = Toggle.Value and 'AccentColor' or 'MainColor'
            Library.RegistryMap[ToggleInner].Properties.BorderColor3 = Toggle.Value and 'AccentColorDark' or 'OutlineColor'
        end
        function Toggle:OnChanged(Func) Toggle.Changed = Func; Func(Toggle.Value) end
        function Toggle:SetValue(Bool)
            Bool = (not not Bool); Toggle.Value = Bool; Toggle:Display()
            for _, Addon in next, Toggle.Addons do if Addon.Type == 'KeyPicker' and Addon.SyncToggleState then Addon.Toggled = Bool end end
            Library:SafeCallback(Toggle.Callback, Toggle.Value)
            Library:SafeCallback(Toggle.Changed, Toggle.Value)
            Library:UpdateDependencyBoxes()
        end
        ToggleRegion.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then Toggle:SetValue(not Toggle.Value) end end)
        Toggle:Display(); Groupbox:AddBlank(Info.BlankSize or 5 + 2); Groupbox:Resize()
        Toggle.TextLabel = ToggleLabel; Toggle.Container = Container; setmetatable(Toggle, BaseAddons)
        getgenv().Toggles = getgenv().Toggles or {}
        getgenv().Toggles[Idx] = Toggle; Library:UpdateDependencyBoxes(); return Toggle
    end
    function Funcs:AddSlider(Idx, Info)
        assert(Info.Default, 'AddSlider: Missing default value.'); assert(Info.Text, 'AddSlider: Missing slider text.')
        assert(Info.Min, 'AddSlider: Missing minimum value.'); assert(Info.Max, 'AddSlider: Missing maximum value.'); assert(Info.Rounding, 'AddSlider: Missing rounding value.')
        local Slider = { Value = Info.Default; Min = Info.Min; Max = Info.Max; Rounding = Info.Rounding; MaxSize = 232; Type = 'Slider'; Callback = Info.Callback or function(Value) end }
        local Groupbox = self; local Container = Groupbox.Container
        if not Info.Compact then Library:CreateLabel({ Size = UDim2.new(1,0,0,10); TextSize = 14; Text = Info.Text; TextXAlignment = Enum.TextXAlignment.Left; TextYAlignment = Enum.TextYAlignment.Bottom; ZIndex = 5; Parent = Container }); Groupbox:AddBlank(3) end
        local SliderOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-4,0,13); ZIndex = 5; Parent = Container })
        Library:AddToRegistry(SliderOuter, { BorderColor3 = 'Black' })
        local SliderInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = SliderOuter })
        Library:AddToRegistry(SliderInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        local Fill = Library:Create('Frame', { BackgroundColor3 = Library.AccentColor; BorderColor3 = Library.AccentColorDark; Size = UDim2.new(0,0,1,0); ZIndex = 7; Parent = SliderInner })
        Library:AddToRegistry(Fill, { BackgroundColor3 = 'AccentColor'; BorderColor3 = 'AccentColorDark' })
        local DisplayLabel = Library:CreateLabel({ Size = UDim2.new(1,0,1,0); TextSize = 14; Text = 'Infinite'; ZIndex = 9; Parent = SliderInner })
        Library:OnHighlight(SliderOuter, SliderOuter, { BorderColor3 = 'AccentColor' }, { BorderColor3 = 'Black' })
        function Slider:Display()
            local Suffix = Info.Suffix or ''
            if Info.Compact then DisplayLabel.Text = Info.Text .. ': ' .. Slider.Value .. Suffix
            elseif Info.HideMax then DisplayLabel.Text = string.format('%s', Slider.Value .. Suffix)
            else DisplayLabel.Text = string.format('%s/%s', Slider.Value .. Suffix, Slider.Max .. Suffix) end
            local X = math.ceil(Library:MapValue(Slider.Value, Slider.Min, Slider.Max, 0, Slider.MaxSize))
            Fill.Size = UDim2.new(0, X, 1, 0)
        end
        function Slider:OnChanged(Func) Slider.Changed = Func; Func(Slider.Value) end
        local function Round(Value) if Slider.Rounding == 0 then return math.floor(Value) end; return tonumber(string.format('%.' .. Slider.Rounding .. 'f', Value)) end
        function Slider:GetValueFromXOffset(X) return Round(Library:MapValue(X, 0, Slider.MaxSize, Slider.Min, Slider.Max)) end
        function Slider:SetValue(Str)
            local Num = tonumber(Str); if (not Num) then return end; Num = math.clamp(Num, Slider.Min, Slider.Max)
            Slider.Value = Num; Slider:Display(); Library:SafeCallback(Slider.Callback, Slider.Value); Library:SafeCallback(Slider.Changed, Slider.Value)
        end
        SliderInner.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                local mPos = LocalPlayer:GetMouse().X; local gPos = Fill.Size.X.Offset; local Diff = mPos - (Fill.AbsolutePosition.X + gPos)
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    local nMPos = LocalPlayer:GetMouse().X; local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, Slider.MaxSize)
                    local nValue = Slider:GetValueFromXOffset(nX); local OldValue = Slider.Value; Slider.Value = nValue; Slider:Display()
                    if nValue ~= OldValue then Library:SafeCallback(Slider.Callback, Slider.Value); Library:SafeCallback(Slider.Changed, Slider.Value) end
                    RunService.RenderStepped:Wait()
                end
            end
        end)
        Slider:Display(); Groupbox:AddBlank(Info.BlankSize or 6); Groupbox:Resize()
        getgenv().Options = getgenv().Options or {}
        getgenv().Options[Idx] = Slider; return Slider
    end
    function Funcs:AddDropdown(Idx, Info)
        assert(Info.Values, 'AddDropdown: Missing dropdown value list.')
        if (not Info.Text) then Info.Compact = true end
        local Dropdown = { Values = Info.Values; Value = Info.Multi and {}; Multi = Info.Multi; Type = 'Dropdown'; Callback = Info.Callback or function(Value) end }
        local Groupbox = self; local Container = Groupbox.Container
        if not Info.Compact then Library:CreateLabel({ Size = UDim2.new(1,0,0,10); TextSize = 14; Text = Info.Text; TextXAlignment = Enum.TextXAlignment.Left; TextYAlignment = Enum.TextYAlignment.Bottom; ZIndex = 5; Parent = Container }); Groupbox:AddBlank(3) end
        local DropdownOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-4,0,20); ZIndex = 5; Parent = Container })
        Library:AddToRegistry(DropdownOuter, { BorderColor3 = 'Black' })
        local DropdownInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 6; Parent = DropdownOuter })
        Library:AddToRegistry(DropdownInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        Library:Create('ImageLabel', { AnchorPoint = Vector2.new(0,0.5); BackgroundTransparency = 1; Position = UDim2.new(1,-16,0.5,0); Size = UDim2.new(0,12,0,12); Image = 'http://www.roblox.com/asset/?id=6282522798'; ZIndex = 8; Parent = DropdownInner })
        local ItemList = Library:CreateLabel({ Position = UDim2.new(0,5,0,0); Size = UDim2.new(1,-5,1,0); TextSize = 14; Text = '--'; TextXAlignment = Enum.TextXAlignment.Left; TextWrapped = true; ZIndex = 7; Parent = DropdownInner })
        Library:OnHighlight(DropdownOuter, DropdownOuter, { BorderColor3 = 'AccentColor' }, { BorderColor3 = 'Black' })
        local ListOuter = Library:Create('Frame', { BackgroundColor3 = Color3.new(0,0,0); BorderColor3 = Color3.new(0,0,0); ZIndex = 20; Visible = false; Parent = ScreenGui })
        local function RecalculateListPosition() ListOuter.Position = UDim2.fromOffset(DropdownOuter.AbsolutePosition.X, DropdownOuter.AbsolutePosition.Y + DropdownOuter.Size.Y.Offset + 1) end
        local function RecalculateListSize(YSize) ListOuter.Size = UDim2.fromOffset(DropdownOuter.AbsoluteSize.X, YSize or (8*20+2)) end
        RecalculateListPosition(); RecalculateListSize()
        DropdownOuter:GetPropertyChangedSignal('AbsolutePosition'):Connect(RecalculateListPosition)
        local ListInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 21; Parent = ListOuter })
        Library:AddToRegistry(ListInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
        local Scrolling = Library:Create('ScrollingFrame', { BackgroundTransparency = 1; BorderSizePixel = 0; CanvasSize = UDim2.new(0,0,0,0); Size = UDim2.new(1,0,1,0); ZIndex = 21; Parent = ListInner; ScrollBarThickness = 3; ScrollBarImageColor3 = Library.AccentColor })
        Library:Create('UIListLayout', { Padding = UDim.new(0,0); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; Parent = Scrolling })
        function Dropdown:Display()
            local Values = Dropdown.Values; local Str = ''
            if Info.Multi then for Idx, Value in next, Values do if Dropdown.Value[Value] then Str = Str .. Value .. ', ' end end; Str = Str:sub(1, #Str - 2)
            else Str = Dropdown.Value or '' end
            ItemList.Text = (Str == '' and '--' or Str)
        end
        function Dropdown:GetActiveValues() if Info.Multi then local T = {}; for Value, Bool in next, Dropdown.Value do table.insert(T, Value) end; return T else return Dropdown.Value and 1 or 0 end end
        function Dropdown:BuildDropdownList()
            local Values = Dropdown.Values; local Buttons = {}
            for _, Element in next, Scrolling:GetChildren() do if not Element:IsA('UIListLayout') then Element:Destroy() end end
            local Count = 0
            for Idx, Value in next, Values do
                local Table = {}; Count = Count + 1
                local Button = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Middle; Size = UDim2.new(1,-1,0,20); ZIndex = 23; Active = true; Parent = Scrolling })
                Library:AddToRegistry(Button, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })
                local ButtonLabel = Library:CreateLabel({ Active = false; Size = UDim2.new(1,-6,1,0); Position = UDim2.new(0,6,0,0); TextSize = 14; Text = Value; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 25; Parent = Button })
                Library:OnHighlight(Button, Button, { BorderColor3 = 'AccentColor', ZIndex = 24 }, { BorderColor3 = 'OutlineColor', ZIndex = 23 })
                local Selected; if Info.Multi then Selected = Dropdown.Value[Value] else Selected = Dropdown.Value == Value end
                function Table:UpdateButton()
                    if Info.Multi then Selected = Dropdown.Value[Value] else Selected = Dropdown.Value == Value end
                    ButtonLabel.TextColor3 = Selected and Library.AccentColor or Library.FontColor
                    Library.RegistryMap[ButtonLabel].Properties.TextColor3 = Selected and 'AccentColor' or 'FontColor'
                end
                ButtonLabel.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local Try = not Selected
                        if Info.Multi then Selected = Try; if Selected then Dropdown.Value[Value] = true else Dropdown.Value[Value] = nil end
                        else Selected = Try; if Selected then Dropdown.Value = Value else Dropdown.Value = nil end; for _, OtherButton in next, Buttons do OtherButton:UpdateButton() end end
                        Table:UpdateButton(); Dropdown:Display(); Library:SafeCallback(Dropdown.Callback, Dropdown.Value); Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
                    end
                end)
                Table:UpdateButton(); Dropdown:Display(); Buttons[Button] = Table
            end
            Scrolling.CanvasSize = UDim2.fromOffset(0, (Count*20)+1)
            local Y = math.clamp(Count*20, 0, 8*20) + 1
            RecalculateListSize(Y)
        end
        function Dropdown:OpenDropdown() ListOuter.Visible = true; Library.OpenedFrames[ListOuter] = true end
        function Dropdown:CloseDropdown() ListOuter.Visible = false; Library.OpenedFrames[ListOuter] = nil end
        function Dropdown:OnChanged(Func) Dropdown.Changed = Func; Func(Dropdown.Value) end
        function Dropdown:SetValue(Val)
            if Dropdown.Multi then local nTable = {}; for Value, Bool in next, Val do if table.find(Dropdown.Values, Value) then nTable[Value] = true end end; Dropdown.Value = nTable
            else if (not Val) then Dropdown.Value = nil; elseif table.find(Dropdown.Values, Val) then Dropdown.Value = Val end end
            Dropdown:BuildDropdownList(); Library:SafeCallback(Dropdown.Callback, Dropdown.Value); Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
        end
        DropdownOuter.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then if ListOuter.Visible then Dropdown:CloseDropdown() else Dropdown:OpenDropdown() end end end)
        UserInputService.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                local AbsPos, AbsSize = ListOuter.AbsolutePosition, ListOuter.AbsoluteSize
                if LocalPlayer:GetMouse().X < AbsPos.X or LocalPlayer:GetMouse().X > AbsPos.X + AbsSize.X or LocalPlayer:GetMouse().Y < (AbsPos.Y-20-1) or LocalPlayer:GetMouse().Y > AbsPos.Y + AbsSize.Y then Dropdown:CloseDropdown() end
            end
        end)
        Dropdown:BuildDropdownList(); Dropdown:Display()
        if type(Info.Default) == 'string' then local Idx = table.find(Dropdown.Values, Info.Default); if Idx then Dropdown.Value = Dropdown.Values[Idx] end end
        Groupbox:AddBlank(Info.BlankSize or 5); Groupbox:Resize()
        getgenv().Options = getgenv().Options or {}
        getgenv().Options[Idx] = Dropdown; return Dropdown
    end
    BaseGroupbox.__index = Funcs
    BaseGroupbox.__namecall = function(Table, Key, ...) return Funcs[Key](...) end
end

-- ==================== WINDOW & NOTIFICATIONS ====================
Library.NotificationArea = Library:Create('Frame', { BackgroundTransparency = 1; Position = UDim2.new(0,0,0,40); Size = UDim2.new(0,300,0,200); ZIndex = 100; Parent = ScreenGui })
Library:Create('UIListLayout', { Padding = UDim.new(0,4); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; Parent = Library.NotificationArea })

local WatermarkOuter = Library:Create('Frame', { BorderColor3 = Color3.new(0,0,0); Position = UDim2.new(0,100,0,-25); Size = UDim2.new(0,213,0,20); ZIndex = 200; Visible = false; Parent = ScreenGui })
local WatermarkInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.AccentColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 201; Parent = WatermarkOuter })
Library:AddToRegistry(WatermarkInner, { BorderColor3 = 'AccentColor' })
local WMInnerFrame = Library:Create('Frame', { BackgroundColor3 = Color3.new(1,1,1); BorderSizePixel = 0; Position = UDim2.new(0,1,0,1); Size = UDim2.new(1,-2,1,-2); ZIndex = 202; Parent = WatermarkInner })
Library:Create('UIGradient', { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)), ColorSequenceKeypoint.new(1, Library.MainColor) }); Rotation = -90; Parent = WMInnerFrame })
Library.Watermark = WatermarkOuter
Library.WatermarkText = Library:CreateLabel({ Position = UDim2.new(0,4,0,0); Size = UDim2.new(1,-4,1,0); TextSize = 14; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 203; Parent = WMInnerFrame })
Library:MakeDraggable(Library.Watermark)

function Library:SetWatermarkVisibility(Bool) Library.Watermark.Visible = Bool end
function Library:SetWatermark(Text)
    local X, Y = Library:GetTextBounds(Text, Library.Font, 14)
    Library.Watermark.Size = UDim2.new(0, X+8, 0, (Y*1.5)+3)
    Library:SetWatermarkVisibility(true)
    Library.WatermarkText.Text = Text
end

function Library:Notify(Text, Time)
    local XSize, YSize = Library:GetTextBounds(Text, Library.Font, 14); YSize = YSize + 7
    local NotifyOuter = Library:Create('Frame', { BorderColor3 = Color3.new(0,0,0); Position = UDim2.new(0,100,0,10); Size = UDim2.new(0,0,0,YSize); ClipsDescendants = true; ZIndex = 100; Parent = Library.NotificationArea })
    local NotifyInner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,1,0); ZIndex = 101; Parent = NotifyOuter })
    Library:AddToRegistry(NotifyInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' }, true)
    local InnerFrame = Library:Create('Frame', { BackgroundColor3 = Color3.new(1,1,1); BorderSizePixel = 0; Position = UDim2.new(0,1,0,1); Size = UDim2.new(1,-2,1,-2); ZIndex = 102; Parent = NotifyInner })
    Library:Create('UIGradient', { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)), ColorSequenceKeypoint.new(1, Library.MainColor) }); Rotation = -90; Parent = InnerFrame })
    Library:CreateLabel({ Position = UDim2.new(0,4,0,0); Size = UDim2.new(1,-4,1,0); Text = Text; TextXAlignment = Enum.TextXAlignment.Left; TextSize = 14; ZIndex = 103; Parent = InnerFrame })
    Library:Create('Frame', { BackgroundColor3 = Library.AccentColor; BorderSizePixel = 0; Position = UDim2.new(0,-1,0,-1); Size = UDim2.new(0,3,1,2); ZIndex = 104; Parent = NotifyOuter })
    pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, XSize+8+4, 0, YSize), 'Out', 'Quad', 0.4, true)
    task.spawn(function() wait(Time or 5); pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0,0,0,YSize), 'Out', 'Quad', 0.4, true); wait(0.4); NotifyOuter:Destroy() end)
end

function Library:CreateWindow(Config)
    if type(Config) ~= 'table' then Config = { Title = Config, AutoShow = false } end
    if type(Config.Title) ~= 'string' then Config.Title = 'No title' end
    if type(Config.TabPadding) ~= 'number' then Config.TabPadding = 0 end
    if type(Config.MenuFadeTime) ~= 'number' then Config.MenuFadeTime = 0.2 end
    if typeof(Config.Position) ~= 'UDim2' then Config.Position = UDim2.fromOffset(175, 50) end
    if typeof(Config.Size) ~= 'UDim2' then Config.Size = UDim2.fromOffset(550, 600) end
    if Config.Center then Config.AnchorPoint = Vector2.new(0.5, 0.5); Config.Position = UDim2.fromScale(0.5, 0.5) end

    local Window = { Tabs = {} }
    local Outer = Library:Create('Frame', { AnchorPoint = Config.AnchorPoint or Vector2.zero; BackgroundColor3 = Color3.new(0,0,0); BorderSizePixel = 0; Position = Config.Position; Size = Config.Size; Visible = false; ZIndex = 1; Parent = ScreenGui })
    Library:MakeDraggable(Outer, 25)
    local Inner = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderColor3 = Library.AccentColor; BorderMode = Enum.BorderMode.Inset; Position = UDim2.new(0,1,0,1); Size = UDim2.new(1,-2,1,-2); ZIndex = 1; Parent = Outer })
    Library:AddToRegistry(Inner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'AccentColor' })
    local WindowLabel = Library:CreateLabel({ Position = UDim2.new(0,7,0,0); Size = UDim2.new(1,-14,0,25); Text = Config.Title or ''; TextXAlignment = Enum.TextXAlignment.Center; ZIndex = 1; Parent = Inner })
    local MainSectionOuter = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BorderColor3 = Library.OutlineColor; Position = UDim2.new(0,8,0,25); Size = UDim2.new(1,-16,1,-33); ZIndex = 1; Parent = Inner })
    Library:AddToRegistry(MainSectionOuter, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
    local MainSectionInner = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BackgroundTransparency = 0.5; BorderColor3 = Color3.new(0,0,0); BorderMode = Enum.BorderMode.Inset; Position = UDim2.new(0,0,0,0); Size = UDim2.new(1,0,1,0); ZIndex = 1; Parent = MainSectionOuter })
    Library:AddToRegistry(MainSectionInner, { BackgroundColor3 = 'BackgroundColor' })
    local TabArea = Library:Create('Frame', { BackgroundTransparency = 1; Position = UDim2.new(0,8,0,8); Size = UDim2.new(1,-16,0,21); ZIndex = 1; Parent = MainSectionInner })
    local TabListLayout = Library:Create('UIListLayout', { Padding = UDim.new(0, Config.TabPadding); FillDirection = Enum.FillDirection.Horizontal; HorizontalAlignment = Enum.HorizontalAlignment.Center; SortOrder = Enum.SortOrder.LayoutOrder; Parent = TabArea })
    local TabContainer = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BackgroundTransparency = 0.5; BorderColor3 = Library.OutlineColor; Position = UDim2.new(0,8,0,30); Size = UDim2.new(1,-16,1,-38); ZIndex = 3; Parent = MainSectionInner })
    Library:AddToRegistry(TabContainer, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor' })

    function Window:AddTab(Name)
        local Tab = { Groupboxes = {}; Tabboxes = {} }
        local TabButtonWidth = Library:GetTextBounds(Name, Library.Font, 16)
        local TabButton = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BorderColor3 = Library.OutlineColor; Size = UDim2.new(0, TabButtonWidth+8+4, 1, 0); ZIndex = 1; Parent = TabArea })
        Library:AddToRegistry(TabButton, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
        Library:CreateLabel({ Position = UDim2.new(0,0,0,0); Size = UDim2.new(1,0,1,-1); Text = Name; ZIndex = 1; Parent = TabButton })
        local Blocker = Library:Create('Frame', { BackgroundColor3 = Library.MainColor; BorderSizePixel = 0; Position = UDim2.new(0,0,1,0); Size = UDim2.new(1,0,0,1); BackgroundTransparency = 1; ZIndex = 3; Parent = TabButton })
        Library:AddToRegistry(Blocker, { BackgroundColor3 = 'MainColor' })
        local TabFrame = Library:Create('Frame', { Name = 'TabFrame'; BackgroundTransparency = 1; Position = UDim2.new(0,0,0,0); Size = UDim2.new(1,0,1,0); Visible = false; ZIndex = 2; Parent = TabContainer })
        local LeftSide = Library:Create('ScrollingFrame', { BackgroundTransparency = 1; BorderSizePixel = 0; Position = UDim2.new(0,8-1,0,8-1); Size = UDim2.new(0.5,-12+2,0,507+2); CanvasSize = UDim2.new(0,0,0,0); ScrollBarThickness = 0; ZIndex = 2; Parent = TabFrame })
        local RightSide = Library:Create('ScrollingFrame', { BackgroundTransparency = 1; BorderSizePixel = 0; Position = UDim2.new(0.5,4+1,0,8-1); Size = UDim2.new(0.5,-12+2,0,507+2); CanvasSize = UDim2.new(0,0,0,0); ScrollBarThickness = 0; ZIndex = 2; Parent = TabFrame })
        Library:Create('UIListLayout', { Padding = UDim.new(0,8); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; HorizontalAlignment = Enum.HorizontalAlignment.Center; Parent = LeftSide })
        Library:Create('UIListLayout', { Padding = UDim.new(0,8); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; HorizontalAlignment = Enum.HorizontalAlignment.Center; Parent = RightSide })
        for _, Side in next, { LeftSide, RightSide } do
            Side:WaitForChild('UIListLayout'):GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                Side.CanvasSize = UDim2.fromOffset(0, Side.UIListLayout.AbsoluteContentSize.Y)
            end)
        end
        function Tab:ShowTab()
            for _, T in next, Window.Tabs do T:HideTab() end
            Blocker.BackgroundTransparency = 0; TabButton.BackgroundColor3 = Library.MainColor
            Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'MainColor'; TabFrame.Visible = true
        end
        function Tab:HideTab()
            Blocker.BackgroundTransparency = 1; TabButton.BackgroundColor3 = Library.BackgroundColor
            Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'BackgroundColor'; TabFrame.Visible = false
        end
        function Tab:AddGroupbox(Info)
            local Groupbox = {}
            local BoxOuter = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BackgroundTransparency = 0.5; BorderColor3 = Library.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1,0,0,507+2); ZIndex = 2; Parent = Info.Side == 1 and LeftSide or RightSide })
            Library:AddToRegistry(BoxOuter, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor' })
            local BoxInner = Library:Create('Frame', { BackgroundColor3 = Library.BackgroundColor; BackgroundTransparency = 0.5; BorderColor3 = Color3.new(0,0,0); Size = UDim2.new(1,-2,1,-2); Position = UDim2.new(0,1,0,1); ZIndex = 4; Parent = BoxOuter })
            Library:AddToRegistry(BoxInner, { BackgroundColor3 = 'BackgroundColor' })
            Library:Create('Frame', { BackgroundColor3 = Library.AccentColor; BorderSizePixel = 0; Size = UDim2.new(1,0,0,2); ZIndex = 5; Parent = BoxInner })
            Library:CreateLabel({ Size = UDim2.new(1,0,0,18); Position = UDim2.new(0,4,0,2); TextSize = 14; Text = Info.Name; TextXAlignment = Enum.TextXAlignment.Left; ZIndex = 5; Parent = BoxInner })
            local Container = Library:Create('Frame', { BackgroundTransparency = 1; Position = UDim2.new(0,4,0,20); Size = UDim2.new(1,-4,1,-20); ZIndex = 1; Parent = BoxInner })
            Library:Create('UIListLayout', { FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; Parent = Container })
            function Groupbox:Resize()
                local Size = 0
                for _, Element in next, Groupbox.Container:GetChildren() do
                    if (not Element:IsA('UIListLayout')) and Element.Visible then Size = Size + Element.Size.Y.Offset end
                end
                BoxOuter.Size = UDim2.new(1,0,0,20+Size+2+2)
            end
            Groupbox.Container = Container; setmetatable(Groupbox, BaseGroupbox)
            Groupbox:AddBlank(3); Groupbox:Resize(); Tab.Groupboxes[Info.Name] = Groupbox; return Groupbox
        end
        function Tab:AddLeftGroupbox(Name) return Tab:AddGroupbox({ Side = 1; Name = Name }) end
        function Tab:AddRightGroupbox(Name) return Tab:AddGroupbox({ Side = 2; Name = Name }) end
        TabButton.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then Tab:ShowTab() end end)
        if #TabContainer:GetChildren() == 1 then Tab:ShowTab() end
        Window.Tabs[Name] = Tab; return Tab
    end

    local ModalElement = Library:Create('TextButton', { BackgroundTransparency = 1; Size = UDim2.new(0,0,0,0); Visible = true; Text = ''; Modal = false; Parent = ScreenGui })
    local TransparencyCache = {}; local Toggled = false; local Fading = false
    function Library:Toggle()
        if Fading then return end
        local FadeTime = Config.MenuFadeTime; Fading = true; Toggled = (not Toggled); ModalElement.Modal = Toggled
        if Toggled then Outer.Visible = true end
        for _, Desc in next, Outer:GetDescendants() do
            local Properties = {}
            if Desc:IsA('ImageLabel') then table.insert(Properties, 'ImageTransparency'); table.insert(Properties, 'BackgroundTransparency')
            elseif Desc:IsA('TextLabel') or Desc:IsA('TextBox') then table.insert(Properties, 'TextTransparency')
            elseif Desc:IsA('Frame') or Desc:IsA('ScrollingFrame') then table.insert(Properties, 'BackgroundTransparency')
            elseif Desc:IsA('UIStroke') then table.insert(Properties, 'Transparency') end
            local Cache = TransparencyCache[Desc]
            if (not Cache) then Cache = {}; TransparencyCache[Desc] = Cache end
            for _, Prop in next, Properties do
                if not Cache[Prop] then Cache[Prop] = Desc[Prop] end
                if Cache[Prop] ~= 1 then
                    TweenService:Create(Desc, TweenInfo.new(FadeTime, Enum.EasingStyle.Linear), { [Prop] = Toggled and Cache[Prop] or 1 }):Play()
                end
            end
        end
        task.wait(FadeTime); Outer.Visible = Toggled; Fading = false
    end
    Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input, Processed)
        if type(Library.ToggleKeybind) == 'table' and Library.ToggleKeybind.Type == 'KeyPicker' then
            if Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Library.ToggleKeybind.Value then task.spawn(Library.Toggle) end
        elseif Input.KeyCode == Enum.KeyCode.RightControl or (Input.KeyCode == Enum.KeyCode.RightShift and (not Processed)) then task.spawn(Library.Toggle) end
    end))
    if Config.AutoShow then task.spawn(Library.Toggle) end
    Window.Holder = Outer
    return Window
end

getgenv().Library = Library
getgenv().Toggles = {}
getgenv().Options = {}

-- ==================== CONFIG SYSTEM ====================
local CFG_FOLDER = "WindLua"
local CFG_FILE = CFG_FOLDER .. "/autoload.json"
if not isfolder(CFG_FOLDER) then pcall(makefolder, CFG_FOLDER) end

local function saveConfig(path)
    path = path or CFG_FILE
    local ok, enc = pcall(function() return HttpService:JSONEncode(cfg) end)
    if ok then pcall(writefile, path, enc) end
end
local function loadConfig(path)
    path = path or CFG_FILE
    if not isfile(path) then return false end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
    if ok and type(data) == "table" then
        for k, v in pairs(data) do if cfg[k] ~= nil then cfg[k] = v end end
        return true
    end
    return false
end

if isfile(CFG_FILE) then loadConfig(CFG_FILE) end

-- ==================== UI CONSTRUCTION ====================
local winSize = isMobile and UDim2.fromOffset(340, 480) or UDim2.fromOffset(550, 600)
local Window = Library:CreateWindow({ Title = "Wind Lua", Center = true, AutoShow = true, Size = winSize, TabPadding = 8, MenuFadeTime = 0.2 })

local MovementTab = Window:AddTab("Movement")
local CombatTab = Window:AddTab("Combat")
local AntiTab = Window:AddTab("Anti")
local UtilitiesTab = Window:AddTab("Utilities")
local SettingsTab = Window:AddTab("Settings")

-- ============ MOVEMENT ============
local MoveBox = MovementTab:AddLeftGroupbox("Basic Movement")
MoveBox:AddToggle("fly", { Text = "Fly", Default = cfg.flyEnabled, Callback = function(v)
    cfg.flyEnabled = v
    if not v then local h = getHum(); if h then h:ChangeState(Enum.HumanoidStateType.GettingUp) end end
end })
MoveBox:AddSlider("flySpeed", { Text = "Fly Speed", Default = cfg.flySpeed, Min = 10, Max = 500, Rounding = 0, Callback = function(v) cfg.flySpeed = v end })
MoveBox:AddToggle("speed", { Text = "Speed", Default = cfg.speed, Callback = function(v) cfg.speed = v end })
MoveBox:AddSlider("speedValue", { Text = "Speed Value", Default = cfg.speedValue, Min = 16, Max = 300, Rounding = 0, Callback = function(v) cfg.speedValue = v end })
MoveBox:AddToggle("jp", { Text = "Jump Power", Default = cfg.jumpPower, Callback = function(v) cfg.jumpPower = v end })
MoveBox:AddSlider("jpValue", { Text = "Jump Power Value", Default = cfg.jumpPowerValue, Min = 50, Max = 500, Rounding = 0, Callback = function(v) cfg.jumpPowerValue = v end })
MoveBox:AddToggle("infJump", { Text = "Infinite Jump", Default = cfg.infJump, Callback = function(v) cfg.infJump = v end })
MoveBox:AddToggle("nc", { Text = "Noclip", Default = cfg.nc, Callback = function(v) cfg.nc = v end })
MoveBox:AddToggle("dblJump", { Text = "Double Jump", Default = cfg.doubleJumpEnabled, Callback = function(v) cfg.doubleJumpEnabled = v end })

local GlideBox = MovementTab:AddRightGroupbox("Glide")
GlideBox:AddToggle("glide", { Text = "Glide", Default = cfg.glideEnabled, Callback = function(v) cfg.glideEnabled = v; if v then startGlide() else stopGlide() end end })
GlideBox:AddSlider("glideSpeed", { Text = "Glide Speed", Default = cfg.glideSpeed, Min = 10, Max = 5000, Rounding = 0, Callback = function(v) cfg.glideSpeed = v end })
GlideBox:AddSlider("glideAccel", { Text = "Glide Accel", Default = cfg.glideAccel, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfg.glideAccel = v end })

local VoidBox = MovementTab:AddRightGroupbox("Void / Void Spam")
VoidBox:AddToggle("void", { Text = "Void (Extreme)", Default = cfg.VoidEnabled, Callback = function(v) cfg.VoidEnabled = v; if v then startVoid() else stopVoid() end end })
VoidBox:AddSlider("voidX", { Text = "X Bound", Default = 1e8, Min = 1000, Max = 1e9, Rounding = 0, Callback = function(v) cfg.voidX = v end })
VoidBox:AddSlider("voidY", { Text = "Y Bound", Default = 1e8, Min = 1000, Max = 1e9, Rounding = 0, Callback = function(v) cfg.voidY = v end })
VoidBox:AddSlider("voidZ", { Text = "Z Bound", Default = 1e8, Min = 1000, Max = 1e9, Rounding = 0, Callback = function(v) cfg.voidZ = v end })
VoidBox:AddToggle("voidSpam", { Text = "Void Spam", Default = cfg.voidSpamEnabled, Callback = function(v) cfg.voidSpamEnabled = v; if v then startVoidSpam() else stopVoidSpam() end end })
VoidBox:AddDropdown("voidPattern", { Text = "Pattern", Default = "random", Values = { "random","spiral","wave","bounce","chaos","cross","helix","strobe" }, Callback = function(v) cfg.voidPattern = v end })
VoidBox:AddSlider("voidBurst", { Text = "Burst", Default = 5, Min = 1, Max = 20, Rounding = 0, Callback = function(v) cfg.voidSpamBurst = v end })

local EvasionBox = MovementTab:AddLeftGroupbox("Evasion")
EvasionBox:AddToggle("evasion", { Text = "Evasion", Default = cfg.evasionEnabled, Callback = function(v) cfg.evasionEnabled = v; if v then startEvasion() else stopEvasion() end end })
EvasionBox:AddSlider("evasInt", { Text = "Evasion Power", Default = 30, Min = 10, Max = 100, Rounding = 0, Callback = function(v) cfg.evasionIntensity = v/10 end })
EvasionBox:AddToggle("blink", { Text = "Blink", Default = cfg.blinkEnabled, Callback = function(v) cfg.blinkEnabled = v; if v then startBlink() else stopBlink() end end })
EvasionBox:AddSlider("blinkR", { Text = "Blink Radius", Default = 80, Min = 10, Max = 300, Rounding = 0, Callback = function(v) cfg.blinkRadius = v end })
EvasionBox:AddToggle("ghost", { Text = "Ghost", Default = cfg.ghostEnabled, Callback = function(v) cfg.ghostEnabled = v; if v then startGhost() else stopGhost() end end })
EvasionBox:AddSlider("ghostG", { Text = "Ghost Gap", Default = 150, Min = 20, Max = 500, Rounding = 0, Callback = function(v) cfg.ghostDistance = v end })
EvasionBox:AddToggle("fakePos", { Text = "Fake Position", Default = cfg.fakePositionEnabled, Callback = function(v) cfg.fakePositionEnabled = v; if v then startFakePosition() else stopFakePosition() end end })
EvasionBox:AddToggle("desync", { Text = "Desync", Default = cfg.desyncEnabled, Callback = function(v) cfg.desyncEnabled = v; if v then startDesync() else stopDesync() end end })

-- ============ COMBAT ============
local RageBox = CombatTab:AddLeftGroupbox("Ragebot")
RageBox:AddToggle("rage", { Text = "Ragebot", Default = cfg.ragebot, Callback = function(v) cfg.ragebot = v end })
RageBox:AddDropdown("rageMode", { Text = "Mode", Default = "Orbit", Values = { "Orbit","Overlap","Teleport" }, Callback = function(v) cfg.ragebotMode = v end })

local AimBox = CombatTab:AddLeftGroupbox("Aimbot / Silent")
AimBox:AddToggle("aimbot", { Text = "Aimbot", Default = cfg.aimbot, Callback = function(v) cfg.aimbot = v end })
AimBox:AddSlider("aimSmooth", { Text = "Aimbot Smooth", Default = 18, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfg.aimbotSmooth = v/100 end })
AimBox:AddToggle("silent", { Text = "Silent Aim", Default = cfg.silentAim, Callback = function(v) cfg.silentAim = v end })
AimBox:AddToggle("fov", { Text = "FOV Circle", Default = cfg.fovEnabled, Callback = function(v) cfg.fovEnabled = v end })
AimBox:AddSlider("fovSize", { Text = "FOV Size", Default = 250, Min = 50, Max = 800, Rounding = 0, Callback = function(v) cfg.fovSize = v end })

local WeaponBox = CombatTab:AddRightGroupbox("Weapon")
WeaponBox:AddToggle("rapidFire", { Text = "Rapid Fire", Default = cfg.rapidFire, Callback = function(v) cfg.rapidFire = v; if v then startRapidFire() else stopRapidFire() end end })
WeaponBox:AddToggle("wallbang", { Text = "Wallbang", Default = cfg.wallbangEnabled, Callback = function(v) cfg.wallbangEnabled = v; if v then startWallbang() else stopWallbang() end end })
WeaponBox:AddToggle("fastReload", { Text = "Fast Reload", Default = cfg.fastReload, Callback = function(v) cfg.fastReload = v; if v then startFastReload() end end })
WeaponBox:AddToggle("daggerBypass", { Text = "Dagger Bypass", Default = cfg.daggerBypass, Callback = function(v) cfg.daggerBypass = v end })
WeaponBox:AddToggle("tpEnemy", { Text = "Teleport to Enemy", Default = cfg.teleportEnemyEnabled, Callback = function(v) cfg.teleportEnemyEnabled = v; if v then startTp() else stopTp() end end })
WeaponBox:AddToggle("antiClose", { Text = "Anti Close", Default = cfg.antiClose, Callback = function(v) cfg.antiClose = v; if v then startAntiClose() else stopAntiClose() end end })

local SlingBox = CombatTab:AddRightGroupbox("Sling / Proj")
SlingBox:AddToggle("slingRage", { Text = "Slingshot Ragebot", Default = cfg.slingRage, Callback = function(v) cfg.slingRage = v; if v then startSlingRage() else stopSlingRage() end end })
SlingBox:AddToggle("antiProj", { Text = "Anti Projectile", Default = cfg.antiProj, Callback = function(v) cfg.antiProj = v; if v then startAntiProj() else stopAntiProj() end end })

local CounterBox = CombatTab:AddRightGroupbox("Counters")
CounterBox:AddToggle("kicia", { Text = "Kicia Counter", Default = cfg.kiciaCounter, Callback = function(v) cfg.kiciaCounter = v end })
CounterBox:AddToggle("elisium", { Text = "Elisium Counter", Default = cfg.elisiumCounter, Callback = function(v) cfg.elisiumCounter = v end })
CounterBox:AddToggle("ue", { Text = "UE Counter", Default = cfg.ueCounter, Callback = function(v) cfg.ueCounter = v end })

local OrbitBox = CombatTab:AddLeftGroupbox("Orbit")
OrbitBox:AddToggle("orbit", { Text = "Orbit Mode", Default = cfg.orbit, Callback = function(v) cfg.orbit = v; if v then startOrbit() else stopOrbit() end end })
OrbitBox:AddSlider("orbSpeed", { Text = "Orbit Speed", Default = 90, Min = 10, Max = 720, Rounding = 0, Callback = function(v) cfg.orbitSpeed = v end })
OrbitBox:AddSlider("orbDist", { Text = "Orbit Radius", Default = 8, Min = 1, Max = 5000, Rounding = 0, Callback = function(v) cfg.orbitDistance = v end })

-- ============ ANTI ============
local AntiBox = AntiTab:AddLeftGroupbox("Anti")
AntiBox:AddToggle("afb", { Text = "Anti Flashbang", Default = cfg.antiFlashbang, Callback = function(v) cfg.antiFlashbang = v end })
AntiBox:AddToggle("akatana", { Text = "Anti Katana", Default = cfg.antiKatana, Callback = function(v) cfg.antiKatana = v end })
AntiBox:AddToggle("asubspace", { Text = "Anti Subspace/Trapmine", Default = cfg.antiSubspace, Callback = function(v) cfg.antiSubspace = v end })

local AntiAimBox = AntiTab:AddLeftGroupbox("Anti Aim")
AntiAimBox:AddToggle("antiAim", { Text = "Anti Aim", Default = cfg.antiAimEnabled, Callback = function(v) cfg.antiAimEnabled = v end })
AntiAimBox:AddSlider("pitch", { Text = "Pitch Shift", Default = 0, Min = -180, Max = 180, Rounding = 0, Callback = function(v) cfg.pitchAngle = v end })
AntiAimBox:AddSlider("yaw", { Text = "Yaw Shift", Default = 0, Min = -180, Max = 180, Rounding = 0, Callback = function(v) cfg.yawAngle = v end })
AntiAimBox:AddToggle("spin", { Text = "Spin Bypass", Default = cfg.spinEnabled, Callback = function(v) cfg.spinEnabled = v end })
AntiAimBox:AddToggle("underMap", { Text = "Underground", Default = cfg.underMapEnabled, Callback = function(v) cfg.underMapEnabled = v; if v then startUnderMap() else stopUnderMap() end end })
AntiAimBox:AddSlider("underMapY", { Text = "Under Y", Default = -500, Min = -5000, Max = -50, Rounding = 0, Callback = function(v) cfg.underMapY = v end })

local RiotBox = AntiTab:AddRightGroupbox("Riot")
RiotBox:AddToggle("riotAbuser", { Text = "Riot Abuser", Default = cfg.riotAbuserEnabled, Callback = function(v) cfg.riotAbuserEnabled = v; if v then startRiotAbuser() else stopRiotAbuser() end end })
RiotBox:AddSlider("riotDist", { Text = "Spread Distance", Default = 300, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) cfg.riotAbuserDistance = v end })
RiotBox:AddSlider("riotSpin", { Text = "Spin Speed", Default = 720, Min = 0, Max = 2000, Rounding = 0, Callback = function(v) cfg.riotAbuserSpin = v end })
RiotBox:AddToggle("riotBypass", { Text = "Riot Bypass", Default = cfg.riotBypassEnabled, Callback = function(v) cfg.riotBypassEnabled = v; if v then startRiotBypass() else stopRiotBypass() end end })
RiotBox:AddDropdown("riotPos", { Text = "Position", Default = "Front", Values = { "Front","Back","Above","Below" }, Callback = function(v) cfg.riotBypassPosition = v end })

-- ============ UTILITIES ============
local AutoBox = UtilitiesTab:AddLeftGroupbox("Automation")
AutoBox:AddToggle("autocollect", { Text = "Auto Collect Heals", Default = cfg.autocollectEnabled, Callback = function(v) cfg.autocollectEnabled = v; if v then startAutocollect() else stopAutocollect() end end })
AutoBox:AddSlider("healR", { Text = "Collect Radius", Default = 60, Min = 10, Max = 300, Rounding = 0, Callback = function(v) cfg.autocollectRadius = v end })
AutoBox:AddToggle("safeZone", { Text = "Safe Zone", Default = cfg.safeZoneEnabled, Callback = function(v) cfg.safeZoneEnabled = v; if v then startSafeZone() else stopSafeZone() end end })
AutoBox:AddToggle("returnHome", { Text = "Return Home", Default = cfg.returnHomeEnabled, Callback = function(v) cfg.returnHomeEnabled = v; if v then startReturnHome() else stopReturnHome() end end })
AutoBox:AddButton("Save Home Position", function()
    if getHrp() then getgenv().homePosition = getHrp().Position; Library:Notify("Home Saved", 2) end
end)
AutoBox:AddToggle("antiAfk", { Text = "Anti AFK", Default = cfg.antiAfkEnabled, Callback = function(v) cfg.antiAfkEnabled = v; if v then startAntiAfk() else stopAntiAfk() end end })

local LoopBox = UtilitiesTab:AddRightGroupbox("Teleport Loop")
LoopBox:AddToggle("tploop", { Text = "Teleport Loop", Default = cfg.teleportLoopEnabled, Callback = function(v) if v then startTeleportLoop() else stopTeleportLoop() end end })
LoopBox:AddSlider("loopD", { Text = "Delay (×10ms)", Default = 150, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) cfg.teleportLoopDelay = v/100 end })
LoopBox:AddButton("Add Waypoint", function()
    if getHrp() then
        getgenv().loopWaypoints = getgenv().loopWaypoints or {}
        table.insert(getgenv().loopWaypoints, getHrp().Position)
        Library:Notify("Waypoint #" .. #getgenv().loopWaypoints, 2)
    end
end)
LoopBox:AddButton("Clear Waypoints", function()
    getgenv().loopWaypoints = {}; getgenv().loopIndex = 1
    Library:Notify("Waypoints Cleared", 2)
end)

-- ============ SETTINGS ============
local cfgName = "default"
local CfgBox = SettingsTab:AddLeftGroupbox("Config")
CfgBox:AddInput("cfgname", { Text = "Config Name", Default = "default", Placeholder = "name...", Finished = true, Callback = function(v) cfgName = v end })
CfgBox:AddButton("Save Config", function()
    saveConfig(CFG_FOLDER .. "/" .. cfgName .. ".json")
    Library:Notify("Saved: " .. cfgName, 2)
end)
CfgBox:AddButton("Load Config", function()
    if loadConfig(CFG_FOLDER .. "/" .. cfgName .. ".json") then
        Library:Notify("Loaded: " .. cfgName, 2)
    else
        Library:Notify("Not found: " .. cfgName, 2)
    end
end)
CfgBox:AddButton("Delete Config", function()
    local p = CFG_FOLDER .. "/" .. cfgName .. ".json"
    if isfile(p) then pcall(delfile, p); Library:Notify("Deleted: " .. cfgName, 2) end
end)
CfgBox:AddButton("Save Autoload", function()
    saveConfig(CFG_FILE); Library:Notify("Autoload saved", 2)
end)
CfgBox:AddToggle("autoLoad", { Text = "Auto Load on Start", Default = cfg.autoLoadConfig, Callback = function(v)
    cfg.autoLoadConfig = v
    if v then saveConfig(CFG_FILE) end
end })

local SysBox = SettingsTab:AddRightGroupbox("System")
SysBox:AddButton("Save All + Autoload", function()
    saveConfig(CFG_FILE); Library:Notify("Everything saved", 2)
end)
SysBox:AddButton("Delete Autoload + Unload", function()
    if isfile(CFG_FILE) then pcall(delfile, CFG_FILE) end
    getgenv().wind_loaded = false
    cfg.flyEnabled=false; cfg.VoidEnabled=false; cfg.voidSpamEnabled=false
    cfg.orbit=false; cfg.ragebot=false; cfg.aimbot=false; cfg.silentAim=false
    cfg.evasionEnabled=false; cfg.blinkEnabled=false; cfg.ghostEnabled=false
    cfg.glideEnabled=false; cfg.riotAbuserEnabled=false; cfg.riotBypassEnabled=false
    cfg.slingRage=false; cfg.antiProj=false; cfg.rapidFire=false; cfg.wallbangEnabled=false
    cfg.autocollectEnabled=false; cfg.safeZoneEnabled=false; cfg.returnHomeEnabled=false
    cfg.teleportLoopEnabled=false; cfg.underMapEnabled=false
    cfg.kiciaCounter=false; cfg.elisiumCounter=false; cfg.ueCounter=false
    cfg.antiFlashbang=false; cfg.antiKatana=false; cfg.antiSubspace=false
    stopVoid(); stopVoidSpam(); stopOrbit(); stopTp(); stopFakePosition(); stopDesync()
    stopEvasion(); stopBlink(); stopGhost(); stopGlide(); stopRiotAbuser(); stopRiotBypass()
    stopSlingRage(); stopAntiProj(); stopAntiClose(); stopRapidFire(); stopWallbang()
    stopAutocollect(); stopSafeZone(); stopReturnHome(); stopTeleportLoop(); stopAntiAfk()
    stopUnderMap()
    if fovCircle then pcall(function() fovCircle:Remove() end) end
    if flyConn then flyConn:Disconnect() end
    if speedConn then speedConn:Disconnect() end
    if jpConn then jpConn:Disconnect() end
    Library:Unload()
    getgenv().wind_loaded = nil
end)

Library:SetWatermark("Wind Lua | Rivals")
Library:Notify("Wind Lua loaded", 3)

-- ==================== MOBILE TOGGLE ====================
if isMobile then
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 90, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, 80)
    btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btn.BorderSizePixel = 0
    btn.Text = "Wind Lua"
    btn.TextColor3 = Color3.fromRGB(255, 162, 167)
    btn.Font = Enum.Font.Code
    btn.TextSize = 14
    btn.ZIndex = 999
    btn.Parent = CoreGui
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 162, 167); stroke.Thickness = 1
    btn.MouseButton1Click:Connect(function() Library:Toggle() end)
end

print("[Wind Lua] Full version loaded — all features + Sanity UI + autoload + anti-cheat")