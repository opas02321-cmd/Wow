local Wind=assert(loadstring([========[
--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/
    
    v1.6.65  |  2026-07-01  |  Roblox UI Library for scripts
    
    To view the source code, see the `src/` folder on the official GitHub repository.
    
    Author: Footagesus (Footages, .ftgs, oftgs)
    Github: https://github.com/Footagesus/WindUI
    Discord: https://discord.gg/ftgs-development-hub-1300692552005189632
    License: MIT
]]

type ConfigType__DARKLUA_TYPE_a={
Object:Instance,
Camera:Instance?,
Interactive:boolean?,
Height:number?,
Focused:boolean,

Window:any,
WindUI:any,
Tab:any,
Parent:Instance,
}local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()

local b

local d={
New=nil,
Init=nil,
Shapes={
Circle={
Image="rbxassetid://111665032676235",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleOutline={
Image="rbxassetid://108556680453287",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleGlass={
Image="rbxassetid://95600044758841",
Rect=Rect.new(512,512,512,512),
Radius=512,
},



SquircleH={
Image="rbxassetid://125083578015333",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHOutline={
Image="rbxassetid://107043713170567",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHGlass={
Image="rbxassetid://84819521201001",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
["SquircleH-TL-TR"]={
Image="rbxassetid://90680657206619",
Rect=Rect.new(807,512,807,512),
Radius=325,
AutoChange=false,
},
["SquircleH-BL-BR"]={
Image="rbxassetid://99216342056719",
Rect=Rect.new(0,512,0,512),
Radius=325,
AutoChange=false,
},

SquircleV={
Image="rbxassetid://124965260437653",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVOutline={
Image="rbxassetid://88808835404198",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVGlass={
Image="rbxassetid://124982801466667",
Rect=Rect.new(325,512,325,512),
Radius=325,
},

Squircle={
Image="rbxassetid://89641024074289",
Rect=Rect.new(460,460,460,460),
Radius=310,
},
SquircleOutline={
Image="rbxassetid://74029063732681",
Rect=Rect.new(512,512,512,512),
Radius=310,
},
SquircleGlass={
Image="rbxassetid://131126436897551",
Rect=Rect.new(512,512,512,512),
Radius=310,
},

["Squircle-TL-TR"]={
Image="rbxassetid://75712142040725",
Rect=Rect.new(512,512,512,512),
Radius=310,
AutoChange=false,
},
["Squircle-BL-BR"]={
Image="rbxassetid://83676684425544",
Rect=Rect.new(512,0,512,0),
Radius=310,
AutoChange=false,
},Square=
{
Image="rbxassetid://82909646051652",
Rect=Rect.new(512,512,512,512),
Radius=512,
AutoChange=false,
},
},
}

function d.Init(e,f)
b=f
return e.New
end

function d.New(e,f,g,h,i,j,l)
local m={
Radius=f or 0,
Type=g or"Circle",
GetRadius=nil,
GetType=nil,
SetRadius=nil,
SetType=nil,
}

local p={
["Glass-0.7"]="SquircleGlass",
["Glass-1"]="SquircleGlass",
["Glass-1.4"]="SquircleGlass",
["Squircle-Outline"]="SquircleOutline",
}

local function GetShape(r)
return d.Shapes[p[r]or r]or d.Shapes.Circle
end

local r=b.New(j and"ImageButton"or"ImageLabel",{
Image="",
ScaleType=l~=false and"Slice"or nil,
SliceCenter=m.Type~="Squircle"and Rect.new(512,512,512,512)or nil,
SliceScale=1,
ThemeTag=h and h.ThemeTag or nil,
BackgroundTransparency=1,
},i)

for u,v in next,h do
if not table.find({"ThemeTag"},u)then
r[u]=v
end
end

function m.SetRadius(u,v)
m.Radius=v
r.SliceScale=math.max(v/GetShape(m.Type).Radius,0.0001)
return m
end

function m.SetType(u,v)
m.Type=v
local x=GetShape(v)
r.Image=x.Image
r.SliceCenter=x.Rect
m:SetRadius(m.Radius)
return m
end

function m.GetRadius(u)
return m.Radius
end

function m.GetType(u)
return m.Type
end

m:SetRadius(f)
m:SetType(g)

b.AddSignal(r:GetPropertyChangedSignal"AbsoluteSize",function()
local u=GetShape(m.Type)
if u.AutoChange==false then
return
end

if string.find(m.Type,"Squircle")then
local v=string.find(m.Type,"Glass")and"Glass"or nil
local x=string.find(m.Type,"Outline")and"Outline"or nil

local z=math.round(r.AbsoluteSize.X/b.UIScale)
local A=math.round(r.AbsoluteSize.Y/b.UIScale)

local B=m.Radius~=0 and m.Radius or math.min(z,A)/2
local C=d.Shapes.Squircle.Radius/1024
local F=B/math.min(z,A)

local G

if z>A then
if F>=C then
G="SquircleH"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
elseif z<A then
if F>=C then
G="SquircleV"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
else
if F>=C then
G="Circle"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
end

if G~=m:GetType()then
m:SetType(G)
end
end
end)

return r,m
end

return d end function a.b()

local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"ReplicatedStorage":WaitForChild("GetIcons",99999):InvokeServer())

local function parseIconString(e)
if type(e)=="string"then
local f=e:find":"
if f then
local g=e:sub(1,f-1)
local h=e:sub(f+1)
return g,h
end
end
return nil,e
end

function d.AddIcons(e,f)
if type(e)~="string"or type(f)~="table"then
error"AddIcons: packName must be string, iconsData must be table"
return
end

if not d.Icons[e]then
d.Icons[e]={
Icons={},
Spritesheets={}
}
end

for g,h in pairs(f)do
if type(h)=="number"or(type(h)=="string"and h:match"^rbxassetid://")then
local i=h
if type(h)=="number"then
i="rbxassetid://"..tostring(h)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=Vector2.new(0,0),
ImageRectPosition=Vector2.new(0,0),
Parts=nil
}
d.Icons[e].Spritesheets[i]=i

elseif type(h)=="table"then
if h.Image and h.ImageRectSize and h.ImageRectPosition then
local i=h.Image
if type(i)=="number"then
i="rbxassetid://"..tostring(i)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=h.ImageRectSize,
ImageRectPosition=h.ImageRectPosition,
Parts=h.Parts
}

if not d.Icons[e].Spritesheets[i]then
d.Icons[e].Spritesheets[i]=i
end
else
warn("AddIcons: Invalid spritesheet data format for icon '"..g.."'")
end
else
warn("AddIcons: Unsupported data type for icon '"..g.."': "..type(h))
end
end
end

function d.SetIconsType(e)
d.IconsType=e
end

local e
function d.Init(f,g)
d.New=f
d.IconThemeTag=g

e=f
return d
end

function d.Icon(f,g,h)
h=h~=false
local i,j=parseIconString(f)

local l=i or g or d.IconsType
local m=j

local p=d.Icons[l]

if p and p.Icons and p.Icons[m]then
return{
p.Spritesheets[tostring(p.Icons[m].Image)],
p.Icons[m],
}
elseif p and p[m]and string.find(p[m],"rbxassetid://")then
return h and{
p[m],
{ImageRectSize=Vector2.new(0,0),ImageRectPosition=Vector2.new(0,0)}
}or p[m]
end
return nil
end

function d.GetIcon(f,g)
return d.Icon(f,g,false)
end


function d.Icon2(f,g,h)
return d.Icon(f,g,true)
end

function d.Image(f)
local g={
Icon=f.Icon or nil,
Type=f.Type,
Colors=f.Colors or{(d.IconThemeTag or Color3.new(1,1,1)),Color3.new(1,1,1)},
Transparency=f.Transparency or{0,0},
Size=f.Size or UDim2.new(0,24,0,24),

IconFrame=nil,
}

local h={}
local i={}

for j,l in next,g.Colors do
h[j]={
ThemeTag=typeof(l)=="string"and l,
Color=typeof(l)=="Color3"and l,
}
end

for j,l in next,g.Transparency do
i[j]={
ThemeTag=typeof(l)=="string"and l,
Value=typeof(l)=="number"and l,
}
end


local j=d.Icon2(g.Icon,g.Type)
local l=typeof(j)=="string"and string.find(j,'rbxassetid://')

if d.New then
local m=e or d.New



local p=m("ImageLabel",{
Size=g.Size,
BackgroundTransparency=1,
ImageColor3=h[1].Color or nil,
ImageTransparency=i[1].Value or nil,
ThemeTag=h[1].ThemeTag and{
ImageColor3=h[1].ThemeTag,
ImageTransparency=i[1].ThemeTag,
},
Image=l and j or j[1],
ImageRectSize=l and nil or j[2].ImageRectSize,
ImageRectOffset=l and nil or j[2].ImageRectPosition,
})


if not l and j[2].Parts then
for r,u in next,j[2].Parts do
local v=d.Icon(u,g.Type)

m("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageColor3=h[1+r].Color or nil,
ImageTransparency=i[1+r].Value or nil,
ThemeTag=h[1+r].ThemeTag and{
ImageColor3=h[1+r].ThemeTag,
ImageTransparency=i[1+r].ThemeTag,
},
Image=v[1],
ImageRectSize=v[2].ImageRectSize,
ImageRectOffset=v[2].ImageRectPosition,
Parent=p,
})
end
end

g.IconFrame=p
else
local m=Instance.new"ImageLabel"
m.Size=g.Size
m.BackgroundTransparency=1
m.ImageColor3=h[1].Color
m.ImageTransparency=i[1].Value or nil
m.Image=l and j or j[1]
m.ImageRectSize=l and nil or j[2].ImageRectSize
m.ImageRectOffset=l and nil or j[2].ImageRectPosition


if not l and j[2].Parts then
for p,r in next,j[2].Parts do
local u=d.Icon(r,g.Type)

local v=Instance.New"ImageLabel"
v.Size=UDim2.new(1,0,1,0)
v.BackgroundTransparency=1
v.ImageColor3=h[1+p].Color
v.ImageTransparency=i[1+p].Value or nil
v.Image=u[1]
v.ImageRectSize=u[2].ImageRectSize
v.ImageRectOffset=u[2].ImageRectPosition
v.Parent=m
end
end

g.IconFrame=m
end


return g
end

return d end function a.c()
return function(b)
return{


Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=0.95,

WindowBackground="Background",

WindowShadow="Black",


WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",


WindowSearchBarBackground="Dialog",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=0.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",

ElementBackground="Text",
ElementBackgroundTransparency=0.93,
ElementBackgroundHover=b:AddColor("ElementBackground","#ffffff",0.1),
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Dialog",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=0.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

ProgressBar="Primary",
ProgressBarTrack="Text",
ProgressBarTrackTransparency=0.9,
ProgressBarText="Text",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

TabSectionIcon="Icon",

SectionIcon="Icon",

SectionExpandIcon="Icon",
SectionExpandIconTransparency=0.4,
SectionBox="Text",
SectionBoxTransparency=0.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=0.75,
SectionBoxBackground="Text",
SectionBoxBackgroundTransparency=0.97,

SearchBarBorder="White",
SearchBarBorderTransparency=0.75,

Notification="Background",
Notification2="White",
Notification2Transparency=0.92,
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=0.4,
NotificationDuration="White",
NotificationDurationTransparency=0.95,
NotificationBorder="White",
NotificationBorderTransparency=0.75,

DropdownTabBorder="White",
DropdownTabBackground="ElementBackground",
DropdownBackground="Background",

LabelBackground="White",
LabelBackgroundTransparency=0.95,

ViewportBackground="ElementBackground",
ViewportBackgroundTransparency="ElementBackgroundTransparency",
}
end end function a.d()

local b=(cloneref or clonereference or function(b)
return b
end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")

local i=a.load'a'local j=

d.Heartbeat

local l="https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

local m
if d:IsStudio()or not writefile then
m=a.load'b'
else
m=loadstring(
game.HttpGet and game:HttpGet(l)or h:GetAsync(l)
)()
end

m.SetIconsType"lucide"

local p

local r
r={
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=m,
Signals={},
Objects={},
LocalizationObjects={},
UIScale=1,
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
},
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
ThemeFallbacks=nil,





















ThemeChangeCallbacks={},
}

function r.Init(u)
p=u

r.ThemeFallbacks=a.load'c'(r)

r.UIScale=u.UIScale

i:Init(r)
end

function r.AddSignal(u,v)
local x=u:Connect(v)
table.insert(r.Signals,x)
return x
end

function r.DisconnectAll()
for u,v in next,r.Signals do
local x=table.remove(r.Signals,u)
x:Disconnect()
end
end

function r.SafeCallback(u,...)
if not u then
return
end

local v,x=pcall(u,...)
if not v then
if p and p.Window and p.Window.Debug then local
z, A=x:find":%d+: "

warn("[ WindUI: DEBUG Mode ] "..x)

return p:Notify{
Title="DEBUG Mode: Error",
Content=not A and x or x:sub(A+1),
Duration=8,
}
end
end
end

function r.Gradient(u,v)
if p and p.Gradient then
return p:Gradient(u,v)
end

local x={}
local z={}

for A,B in next,u do
local C=tonumber(A)
if C then
C=math.clamp(C/100,0,1)
table.insert(x,ColorSequenceKeypoint.new(C,B.Color))
table.insert(z,NumberSequenceKeypoint.new(C,B.Transparency or 0))
end
end

table.sort(x,function(A,B)
return A.Time<B.Time
end)
table.sort(z,function(A,B)
return A.Time<B.Time
end)

if#x<2 then
error"ColorSequence requires at least 2 keypoints"
end

local A={
Color=ColorSequence.new(x),
Transparency=NumberSequence.new(z),
}

if v then
for B,C in pairs(v)do
A[B]=C
end
end

return A
end

function r.SetTheme(u)
local v=r.Theme
r.Theme=u
r.UpdateTheme(nil,false)

for x,z in next,r.ThemeChangeCallbacks do
r.SafeCallback(z,u,v)
end
end

function r.AddFontObject(u)
table.insert(r.FontObjects,u)
r.UpdateFont(r.Font)
end

function r.UpdateFont(u)
r.Font=u
for v,x in next,r.FontObjects do
x.FontFace=Font.new(u,x.FontFace.Weight,x.FontFace.Style)
end
end

function r.GetThemeProperty(u,v)
local function getValue(x,z)
local A=z[x]

if A==nil then
return nil
end

if typeof(A)=="string"and string.sub(A,1,1)=="#"then
return Color3.fromHex(A)
end

if typeof(A)=="Color3"then
return A
end

if typeof(A)=="number"then
return A
end

if typeof(A)=="table"and A.Color and A.Transparency then
return A
end

if typeof(A)=="function"then
return A(z)
end

return A
end

local x=getValue(u,v)
if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
local z=r.GetThemeProperty(x,v)
if z~=nil then
return z
end
else
return x
end
end

local z=r.ThemeFallbacks[u]
if z~=nil then
if typeof(z)=="string"and string.sub(z,1,1)~="#"then
return r.GetThemeProperty(z,v)
else
return getValue(u,{[u]=z})
end
end

x=getValue(u,r.Themes.Dark)
if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
local A=r.GetThemeProperty(x,r.Themes.Dark)
if A~=nil then
return A
end
else
return x
end
end

if z~=nil then
if typeof(z)=="string"and string.sub(z,1,1)~="#"then
return r.GetThemeProperty(z,r.Themes.Dark)
else
return getValue(u,{[u]=z})
end
end

return nil
end

function r.AddThemeObject(u,v,x)
if r.Objects[u]then
for z,A in pairs(v)do
r.Objects[u].Properties[z]=A
end
else
r.Objects[u]={Object=u,Properties=v}
end

if not x then
r.UpdateTheme(u,false)
end
return u
end

function r.AddLangObject(u)
local v=r.LocalizationObjects[u]
if not v then
return
end

local x=v.Object

r.SetLangForObject(u)

return x
end

function r.UpdateTheme(u,v,x,z,A,B)
local function ApplyTheme(C)
for F,G in pairs(C.Properties or{})do
local H=r.GetThemeProperty(G,r.Theme)
if H~=nil then
if typeof(H)=="Color3"then
local J=C.Object:FindFirstChild"LibraryGradient"
if J then
J:Destroy()
end

if x then
r.Tween(
C.Object,
z or 0.2,
{[F]=H},
A or Enum.EasingStyle.Quint,
B or Enum.EasingDirection.Out
):Play()
elseif v then
r.Tween(C.Object,0.08,{[F]=H}):Play()
else
C.Object[F]=H
end
elseif typeof(H)=="table"and H.Color and H.Transparency then
C.Object[F]=Color3.new(1,1,1)

local J=C.Object:FindFirstChild"LibraryGradient"
if not J then
J=Instance.new"UIGradient"
J.Name="LibraryGradient"
J.Parent=C.Object
end

J.Color=H.Color
J.Transparency=H.Transparency

for L,M in pairs(H)do
if L~="Color"and L~="Transparency"and J[L]~=nil then
J[L]=M
end
end
elseif typeof(H)=="number"then
if x then
r.Tween(
C.Object,
z or 0.2,
{[F]=H},
A or Enum.EasingStyle.Quint,
B or Enum.EasingDirection.Out
):Play()
elseif v then
r.Tween(C.Object,0.08,{[F]=H}):Play()
else
C.Object[F]=H
end
end
else
local J=C.Object:FindFirstChild"LibraryGradient"
if J then
J:Destroy()
end
end
end
end

if u then
local C=r.Objects[u]
if C then
ApplyTheme(C)
end
else
for C,F in pairs(r.Objects)do
ApplyTheme(F)
end
end
end

function r.SetThemeTag(u,v,x,z,A)
r.AddThemeObject(u,v)
r.UpdateTheme(u,false,true,x,z,A)
end

function r.SetLangForObject(u)
if r.Localization and r.Localization.Enabled then
local v=r.LocalizationObjects[u]
if not v then
return
end

local x=v.Object
local z=v.TranslationId

local A=r.Localization.Translations[r.Language]
if A and A[z]then
x.Text=A[z]
else
local B=r.Localization
and r.Localization.Translations
and r.Localization.Translations.en
or nil
if B and B[z]then
x.Text=B[z]
else
x.Text="["..z.."]"
end
end
end
end

function r.ChangeTranslationKey(u,v,x)
if r.Localization and r.Localization.Enabled then
local z=string.match(x,"^"..r.Localization.Prefix.."(.+)")
if z then
for A,B in ipairs(r.LocalizationObjects)do
if B.Object==v then
B.TranslationId=z
r.SetLangForObject(A)
return
end
end

table.insert(r.LocalizationObjects,{
TranslationId=z,
Object=v,
})
r.SetLangForObject(#r.LocalizationObjects)
end
end
end

function r.UpdateLang(u)
if u then
r.Language=u
end

for v=1,#r.LocalizationObjects do
local x=r.LocalizationObjects[v]
if x.Object and x.Object.Parent~=nil then
r.SetLangForObject(v)
else
r.LocalizationObjects[v]=nil
end
end
end

function r.SetLanguage(u)
r.Language=u
r.UpdateLang()
end

function r.Icon(u,v)
return m.Icon2(u,nil,v~=false)
end

function r.AddIcons(u,v)
return m.AddIcons(u,v)
end

function r.New(u,v,x)
local z=Instance.new(u)

for A,B in next,r.DefaultProperties[u]or{}do
z[A]=B
end

for A,B in next,v or{}do
if A~="ThemeTag"then
z[A]=B
end
if r.Localization and r.Localization.Enabled and A=="Text"then
local C=string.match(B,"^"..r.Localization.Prefix.."(.+)")
if C then
local F=#r.LocalizationObjects+1
r.LocalizationObjects[F]={TranslationId=C,Object=z}

r.SetLangForObject(F)
end
end
end

for A,B in next,x or{}do
B.Parent=z
end

if v and v.ThemeTag then
r.AddThemeObject(z,v.ThemeTag)
end
if v and v.FontFace then
r.AddFontObject(z)
end
return z
end

function r.Tween(u,v,x,...)
return f:Create(u,TweenInfo.new(v,...),x)
end








































































function r.NewRoundFrame(u,v,x,z,A,B)
return i:New(u,v,x,z,A,nil)
end

local u=r.New local v=
r.Tween

function r.SetDraggable(x)
r.CanDraggable=x
end

function r.Drag(x,z,A)
local B=p.GenerateGUID()

local C
local F=false
local G,H
local J

local L={
CanDraggable=true,
}

if not z or typeof(z)~="table"then
z={x}
end

local function update(M)
if not F or not L.CanDraggable then
return
end

local N=M.Position-G
r.Tween(x,0.02,{
Position=UDim2.new(
H.X.Scale,
H.X.Offset+N.X,
H.Y.Scale,
H.Y.Offset+N.Y
),
}):Play()
end

for M,N in pairs(z)do
N.InputBegan:Connect(function(O)
if not L.CanDraggable or F then
return
end

if
O.UserInputType==Enum.UserInputType.MouseButton1
or O.UserInputType==Enum.UserInputType.Touch
then
if p and p.CurrentInput and p.CurrentInput~=B then
return
end

p.CurrentInput=B

F=true
J=O
C=N
G=O.Position
H=x.Position

if A and typeof(A)=="function"then
A(true,C)
end
end
end)
end

e.InputChanged:Connect(function(M)
if not F then
return
end
if p.CurrentInput and p.CurrentInput~=B then
return
end

if J.UserInputType==Enum.UserInputType.MouseButton1 then
if M.UserInputType==Enum.UserInputType.MouseMovement then
update(M)
end
elseif J.UserInputType==Enum.UserInputType.Touch then
if M==J then
update(M)
end
end
end)

e.InputEnded:Connect(function(M)
if not F or p.CurrentInput~=B then
return
end

if
M==J
or(
J.UserInputType==Enum.UserInputType.MouseButton1
and M.UserInputType==Enum.UserInputType.MouseButton1
)
then
p.CurrentInput=nil
F=false
J=nil
C=nil

if A and typeof(A)=="function"then
A(false,nil)
end
end
end)

function L.Set(M,N)
L.CanDraggable=N
end

return L
end

m.Init(u,"Icon")

function r.SanitizeFilename(x)
local z=x:match"([^/]+)$"or x

z=z:gsub("%.[^%.]+$","")

z=z:gsub("[^%w%-_]","_")

if#z>50 then
z=z:sub(1,50)
end

return z
end

function r.Image(x,z,A,B,C,F,G,H)
B=B or"Temp"
z=r.SanitizeFilename(z)

local J=u("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
u("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(r.Icon(x)or G)and{
ImageColor3=F and(H or"Icon")or nil,
}or nil,
},{
u("UICorner",{
CornerRadius=UDim.new(0,A),
}),
}),
})
if r.Icon(x)then
J.ImageLabel:Destroy()

local L=m.Image{
Icon=x,
Size=UDim2.new(1,0,1,0),
Colors={
(F and(H or"Icon")or false),
"Button",
},
}.IconFrame
L.Parent=J
elseif string.find(x,"http")and not string.find(x,"roblox.com")then
local L="WindUI/"..B.."/assets/."..C.."-"..z..".png"
local M,N=pcall(function()
task.spawn(function()
local M=r.Request
and r.Request{
Url=x,
Method="GET",
}.Body
or{}

if not d:IsStudio()and writefile then
writefile(L,M)
end


local N,O=pcall(getcustomasset,L)
if N then
J.ImageLabel.Image=O
else
warn(
string.format(
"[ WindUI.Creator ] Failed to load custom asset '%s': %s",
L,
tostring(O)
)
)
J:Destroy()

return
end
end)
end)
if not M then
warn(
"[ WindUI.Creator ]  '"..identifyexecutor()
or"Studio".."' doesnt support the URL Images. Error: "..N
)

J:Destroy()
end
elseif x==""then
J.Visible=false
else
J.ImageLabel.Image=x
end

return J
end

function r.Color3ToHSB(x)
local z,A,B=x.R,x.G,x.B
local C=math.max(z,A,B)
local F=math.min(z,A,B)
local G=C-F

local H=0
if G~=0 then
if C==z then
H=(A-B)/G%6
elseif C==A then
H=(B-z)/G+2
else
H=(z-A)/G+4
end
H=H*60
else
H=0
end

local J=(C==0)and 0 or(G/C)
local L=C

return{
h=math.floor(H+0.5),
s=J,
b=L,
}
end

function r.GetPerceivedBrightness(x)
local z=x.R
local A=x.G
local B=x.B
return 0.299*z+0.587*A+0.114*B
end

function r.GetTextColorForHSB(x,z)
local A=r.Color3ToHSB(x)local
B, C, F=A.h, A.s, A.b
if r.GetPerceivedBrightness(x)>(z or 0.5)then
return Color3.fromHSV(B/360,0,0.05)
else
return Color3.fromHSV(B/360,0,0.98)
end
end

function r.GetAverageColor(x)
local z,A,B=0,0,0
local C=x.Color.Keypoints
for F,G in ipairs(C)do

z=z+G.Value.R
A=A+G.Value.G
B=B+G.Value.B
end
local F=#C
return Color3.new(z/F,A/F,B/F)
end

function r.GenerateUniqueID(x)
return h:GenerateGUID(false)
end

function r.OnThemeChange(x,z)
if typeof(z)~="function"then
return
end

local A=h:GenerateGUID(false)
r.ThemeChangeCallbacks[A]=z

return{
Disconnect=function()
r.ThemeChangeCallbacks[A]=nil
end,
}
end

function r.AddColor(x,z,A,B)
B=math.clamp(B or 1,0,1)
if typeof(A)=="string"then
A=Color3.fromHex(A)
end

return function(C)
local F
if typeof(z)=="string"and string.sub(z,1,1)~="#"then
F=r.GetThemeProperty(z,C)
elseif typeof(z)=="string"then
F=Color3.fromHex(z)
else
F=z
end

if not F or typeof(F)~="Color3"then
return nil
end

return Color3.new(
math.clamp(F.R+A.R*B,0,1),
math.clamp(F.G+A.G*B,0,1),
math.clamp(F.B+A.B*B,0,1)
)
end
end

function r.GetElementPosition(x,z,A,B)
if type(A)~="number"or A~=math.floor(A)then
return nil,1
end






local C=#z


if C==0 or A<1 or A>C then
return nil,2
end

local function isDelimiter(F)
if F==nil then
return true
end
local G=F.__type
return G=="Divider"or G=="Space"or G=="Section"
end

if isDelimiter(z[A])then
return nil,3
end

local function calculate(F,G)
if G==1 then
return"Squircle"
end
if F==1 then
return B and"SquircleH-TL-TR"or"Squircle-TL-TR"
end
if F==G then
return B and"SquircleH-BL-BR"or"Squircle-BL-BR"
end
return"Square"
end

local F=1
local G=0

for H=1,C do
local J=z[H]
if isDelimiter(J)then
if A>=F and A<=H-1 then
local L=A-F+1
return calculate(L,G)
end
F=H+1
G=0
else
G=G+1
end
end

if A>=F and A<=C then
local H=A-F+1
return calculate(H,G)
end

return nil,4
end

return r end function a.e()

local b={}







function b.New(d,e,f)
local g={
Enabled=e.Enabled or false,
Translations=e.Translations or{},
Prefix=e.Prefix or"loc:",
DefaultLanguage=e.DefaultLanguage or"en"
}

f.Localization=g

return g
end



return b end function a.f()
local b=a.load'd'
local d=b.New
local e=b.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=18,
UIPadding=14,

Holder=nil,
NotificationIndex=0,
Notifications={},
}

function f.Init(g)
local h={
Lower=false,
}

function h.SetLower(i)
h.Lower=i
h.Frame.Size=i and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29),
}),
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
IconThemed=g.IconThemed,
Background=g.Background,
BackgroundImageTransparency=g.BackgroundImageTransparency,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=g.CanClose~=false,
UIElements={},
Closed=false,
}



f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h









local i

if h.Icon then





















i=b.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.Window,
"Notification",
h.IconThemed
)
i.Size=UDim2.new(0,26,0,26)
i.Position=UDim2.new(0,f.UIPadding,0,f.UIPadding)

end

local l
if h.CanClose then
l=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.4,
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})
end

local m=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(0,0,1,0),
ThemeTag={
ImageTransparency="NotificationDurationTransparency",
ImageColor3="NotificationDuration",
},

})

local p=d("Frame",{
Size=UDim2.new(1,h.Icon and-28-f.UIPadding or 0,1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=18,
ThemeTag={
TextColor3="NotificationTitle",
TextTransparency="NotificationTitleTransparency",
},
Text=h.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3),
}),
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,

TextSize=15,
ThemeTag={
TextColor3="NotificationContent",
TextTransparency="NotificationContentTransparency",
},
Text=h.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=p,
})
end

local r=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=0.05,
ThemeTag={
ImageColor3="Notification",
},

},{
b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Notification2",
ImageTransparency="Notification2Transparency",
},
}),
d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="DurationFrame",
},{






d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
m,
}),




}),
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency,

},{
d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
}),
}),

p,
i,
l,
})

local u=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder,
},{
r,
})

function h.Close(v)
if not h.Closed then
h.Closed=true
e(
u,
0.45,
{Size=UDim2.new(1,0,0,-8)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
e(r,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(0.45)
u:Destroy()
end
end

task.spawn(function()
task.wait()
e(
u,
0.45,
{Size=UDim2.new(1,0,0,r.AbsoluteSize.Y)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
e(r,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
m.Size=UDim2.new(0,r.DurationFrame.AbsoluteSize.X,1,0)
e(
r.DurationFrame.Frame,
h.Duration,
{Size=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut
):Play()
task.wait(h.Duration)
h:Close()
end
end)

if l then
b.AddSignal(l.TextButton.MouseButton1Click,function()
h:Close()
end)
end


return h
end

return f end function a.g()












local b=4294967296;local d=b-1;local function c(e,f)local g,h=0,1;while e~=0 or f~=0 do local i,l=e%2,f%2;local m=(i+l)%2;g=g+m*h;e=math.floor(e/2)f=math.floor(f/2)h=h*2 end;return g%b end;local function k(e,f,g,...)local h;if f then e=e%b;f=f%b;h=c(e,f)if g then h=k(h,g,...)end;return h elseif e then return e%b else return 0 end end;local function n(e,f,g,...)local h;if f then e=e%b;f=f%b;h=(e+f-c(e,f))/2;if g then h=n(h,g,...)end;return h elseif e then return e%b else return d end end;local function o(e)return d-e end;local function q(e,f)if f<0 then return lshift(e,-f)end;return math.floor(e%4294967296/2^f)end;local function s(e,f)if f>31 or f<-31 then return 0 end;return q(e%b,f)end;local function lshift(e,f)if f<0 then return s(e,-f)end;return e*2^f%4294967296 end;local function t(e,f)e=e%b;f=f%32;local g=n(e,2^f-1)return s(e,f)+lshift(g,32-f)end;local e={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(f)return string.gsub(f,".",function(g)return string.format("%02x",string.byte(g))end)end;local function y(f,g)local h=""for i=1,g do local l=f%256;h=string.char(l)..h;f=(f-l)/256 end;return h end;local function D(f,g)local h=0;for i=g,g+3 do h=h*256+string.byte(f,i)end;return h end;local function E(f,g)local h=64-(g+9)%64;g=y(8*g,8)f=f.."\128"..string.rep("\0",h)..g;assert(#f%64==0)return f end;local function I(f)f[1]=0x6a09e667;f[2]=0xbb67ae85;f[3]=0x3c6ef372;f[4]=0xa54ff53a;f[5]=0x510e527f;f[6]=0x9b05688c;f[7]=0x1f83d9ab;f[8]=0x5be0cd19;return f end;local function K(f,g,h)local i={}for l=1,16 do i[l]=D(f,g+(l-1)*4)end;for l=17,64 do local m=i[l-15]local p=k(t(m,7),t(m,18),s(m,3))m=i[l-2]i[l]=(i[l-16]+p+i[l-7]+k(t(m,17),t(m,19),s(m,10)))%b end;local l,m,p,r,u,v,x,z=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]for A=1,64 do local B=k(t(l,2),t(l,13),t(l,22))local C=k(n(l,m),n(l,p),n(m,p))local F=(B+C)%b;local G=k(t(u,6),t(u,11),t(u,25))local H=k(n(u,v),n(o(u),x))local J=(z+G+H+e[A]+i[A])%b;z=x;x=v;v=u;u=(r+J)%b;r=p;p=m;m=l;l=(J+F)%b end;h[1]=(h[1]+l)%b;h[2]=(h[2]+m)%b;h[3]=(h[3]+p)%b;h[4]=(h[4]+r)%b;h[5]=(h[5]+u)%b;h[6]=(h[6]+v)%b;h[7]=(h[7]+x)%b;h[8]=(h[8]+z)%b end;local function Z(f)f=E(f,#f)local g=I{}for h=1,#f,64 do K(f,h,g)end;return w(y(g[1],4)..y(g[2],4)..y(g[3],4)..y(g[4],4)..y(g[5],4)..y(g[6],4)..y(g[7],4)..y(g[8],4))end;local f;local g={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local h={["/"]="/"}for i,l in pairs(g)do h[l]=i end;local i=function(i)return"\\"..(g[i]or string.format("u%04x",i:byte()))end;local l=function(l)return"null"end;local m=function(m,p)local r={}p=p or{}if p[m]then error"circular reference"end;p[m]=true;if rawget(m,1)~=nil or next(m)==nil then local u=0;for v in pairs(m)do if type(v)~="number"then error"invalid table: mixed or invalid key types"end;u=u+1 end;if u~=#m then error"invalid table: sparse array"end;for v,x in ipairs(m)do table.insert(r,f(x,p))end;p[m]=nil;return"["..table.concat(r,",").."]"else for u,v in pairs(m)do if type(u)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(r,f(u,p)..":"..f(v,p))end;p[m]=nil;return"{"..table.concat(r,",").."}"end end;local p=function(p)return'"'..p:gsub('[%z\1-\31\\"]',i)..'"'end;local r=function(r)if r~=r or r<=-math.huge or r>=math.huge then error("unexpected number value '"..tostring(r).."'")end;return string.format("%.14g",r)end;local u={["nil"]=l,table=m,string=p,number=r,boolean=tostring}f=function(v,x)local z=type(v)local A=u[z]if A then return A(v,x)end;error("unexpected type '"..z.."'")end;local v=function(v)return f(v)end;local x;local z=function(...)local z={}for A=1,select("#",...)do z[select(A,...)]=true end;return z end;local A=z(" ","\t","\r","\n")local B=z(" ","\t","\r","\n","]","}",",")local C=z("\\","/",'"',"b","f","n","r","t","u")local F=z("true","false","null")local G={["true"]=true,["false"]=false,null=nil}local H=function(H,J,L,M)for N=J,#H do if L[H:sub(N,N)]~=M then return N end end;return#H+1 end;local J=function(J,L,M)local N=1;local O=1;for P=1,L-1 do O=O+1;if J:sub(P,P)=="\n"then N=N+1;O=1 end end;error(string.format("%s at line %d col %d",M,N,O))end;local L=function(L)local M=math.floor;if L<=0x7f then return string.char(L)elseif L<=0x7ff then return string.char(M(L/64)+192,L%64+128)elseif L<=0xffff then return string.char(M(L/4096)+224,M(L%4096/64)+128,L%64+128)elseif L<=0x10ffff then return string.char(M(L/262144)+240,M(L%262144/4096)+128,M(L%4096/64)+128,L%64+128)end;error(string.format("invalid unicode codepoint '%x'",L))end;local M=function(M)local N=tonumber(M:sub(1,4),16)local O=tonumber(M:sub(7,10),16)if O then return L((N-0xd800)*0x400+O-0xdc00+0x10000)else return L(N)end end;local N=function(N,O)local P=""local Q=O+1;local R=Q;while Q<=#N do local S=N:byte(Q)if S<32 then J(N,Q,"control character in string")elseif S==92 then P=P..N:sub(R,Q-1)Q=Q+1;local T=N:sub(Q,Q)if T=="u"then local U=N:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",Q+1)or N:match("^%x%x%x%x",Q+1)or J(N,Q-1,"invalid unicode escape in string")P=P..M(U)Q=Q+#U else if not C[T]then J(N,Q-1,"invalid escape char '"..T.."' in string")end;P=P..h[T]end;R=Q+1 elseif S==34 then P=P..N:sub(R,Q-1)return P,Q+1 end;Q=Q+1 end;J(N,O,"expected closing quote for string")end;local O=function(O,P)local Q=H(O,P,B)local R=O:sub(P,Q-1)local S=tonumber(R)if not S then J(O,P,"invalid number '"..R.."'")end;return S,Q end;local P=function(P,Q)local R=H(P,Q,B)local S=P:sub(Q,R-1)if not F[S]then J(P,Q,"invalid literal '"..S.."'")end;return G[S],R end;local Q=function(Q,R)local S={}local T=1;R=R+1;while 1 do local U;R=H(Q,R,A,true)if Q:sub(R,R)=="]"then R=R+1;break end;U,R=x(Q,R)S[T]=U;T=T+1;R=H(Q,R,A,true)local V=Q:sub(R,R)R=R+1;if V=="]"then break end;if V~=","then J(Q,R,"expected ']' or ','")end end;return S,R end;local R=function(R,S)local T={}S=S+1;while 1 do local U,V;S=H(R,S,A,true)if R:sub(S,S)=="}"then S=S+1;break end;if R:sub(S,S)~='"'then J(R,S,"expected string for key")end;U,S=x(R,S)S=H(R,S,A,true)if R:sub(S,S)~=":"then J(R,S,"expected ':' after key")end;S=H(R,S+1,A,true)V,S=x(R,S)T[U]=V;S=H(R,S,A,true)local W=R:sub(S,S)S=S+1;if W=="}"then break end;if W~=","then J(R,S,"expected '}' or ','")end end;return T,S end;local S={['"']=N,["0"]=O,["1"]=O,["2"]=O,["3"]=O,["4"]=O,["5"]=O,["6"]=O,["7"]=O,["8"]=O,["9"]=O,["-"]=O,t=P,f=P,n=P,["["]=Q,["{"]=R}x=function(T,U)local V=T:sub(U,U)local W=S[V]if W then return W(T,U)end;J(T,U,"unexpected character '"..V.."'")end;local T=function(T)if type(T)~="string"then error("expected argument of type string, got "..type(T))end;local U,V=x(T,H(T,1,A,true))V=H(T,V,A,true)if V<=#T then J(T,V,"trailing garbage")end;return U end;
local U,V,W=v,T,Z;





local X={}

local Y=(cloneref or clonereference or function(Y)return Y end)


function X.New(_,aa)

local ab=_;
local ac=aa;
local ad=true;


local ae=function(ae)end;


repeat task.wait(1)until game:IsLoaded();


local af=false;
local ag,ah,ai,aj,ak,al,am,an,ao=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return Y(game:GetService"Players").LocalPlayer.UserId end
local ap,aq="",0;


local ar="https://api.platoboost.app";
local as=ah{
Url=ar.."/public/connectivity",
Method="GET"
};
if as.StatusCode~=200 and as.StatusCode~=429 then
ar="https://api.platoboost.net";
end


function cacheLink()
if aq+(600)<al()then
local at=ah{
Url=ar.."/public/start",
Method="POST",
Body=U{
service=ab,
identifier=W(ao())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if at.StatusCode==200 then
local au=V(at.Body);

if au.success==true then
ap=au.data.url;
aq=al();
return true,ap
else
ae(au.message);
return false,au.message
end
elseif at.StatusCode==429 then
local au="you are being rate limited, please wait 20 seconds and try again.";
ae(au);
return false,au
end

local au="Failed to cache link.";
ae(au);
return false,au
else
return true,ap
end
end

cacheLink();


local at=function()
local at=""
for au=1,16 do
at=at..ai(an(am()*(26))+97)
end
return at
end


for au=1,5 do
local av=at();
task.wait(0.2)
if at()==av then
local aw="platoboost nonce error.";
ae(aw);
error(aw);
end
end


local au=function()
local au,av=cacheLink();

if au then
ag(av);
end
end


local av=function(av)
local aw=at();
local ax=ar.."/public/redeem/"..aj(ab);

local ay={
identifier=W(ao()),
key=av
}

if ad then
ay.nonce=aw;
end

local az=ah{
Url=ax,
Method="POST",
Body=U(ay),
Headers={
["Content-Type"]="application/json"
}
};

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..aw.."-"..ac)then
return true
else
ae"failed to verify integrity.";
return false
end
else
return true
end
else
ae"key is invalid.";
return false
end
else
if ak(aA.message,1,27)=="unique constraint violation"then
ae"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ae(aA.message);
return false
end
end
elseif az.StatusCode==429 then
ae"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ae"server returned an invalid status code, please try again later.";
return false
end
end


local aw=function(aw)
if af==true then
return false,("A request is already being sent, please slow down.")
else
af=true;
end

local ax=at();
local ay=ar.."/public/whitelist/"..aj(ab).."?identifier="..W(ao()).."&key="..aw;

if ad then
ay=ay.."&nonce="..ax;
end

local az=ah{
Url=ay,
Method="GET",
};

af=false;

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..ax.."-"..ac)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if ak(aw,1,4)=="KEY_"then
return true,av(aw)
else
return false,("Key is invalid.")
end
end
else
return false,(aA.message)
end
elseif az.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local ax=function(ax)
local ay=at();
local az=ar.."/public/flag/"..aj(ab).."?name="..ax;

if ad then
az=az.."&nonce="..ay;
end

local aA=ah{
Url=az,
Method="GET",
};

if aA.StatusCode==200 then
local aB=V(aA.Body);

if aB.success==true then
if ad then
if aB.data.hash==W(aj(aB.data.value).."-"..ay.."-"..ac)then
return aB.data.value
else
ae"failed to verify integrity.";
return nil
end
else
return aB.data.value
end
else
ae(aB.message);
return nil
end
else
return nil
end
end


return{
Verify=aw,
GetFlag=ax,
Copy=au,
}
end


return X end function a.h()






local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ab=aa(game:GetService"HttpService")
local ac={}

function ac.New(ad)
local ae=gethwid or function()
return aa(game:GetService"Players").LocalPlayer.UserId
end
local af,ag=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ah)
local ai="https://api.pandauth.com/api/v1/keys/validate"

local aj={
ServiceID=ad,
HWID=tostring(ae()),
Key=tostring(ah),
}

local ak=ab:JSONEncode(aj)
local al,am=pcall(function()
return af{
Url=ai,
Method="POST",
Headers={
["User-Agent"]="Roblox/Exploit",
["Content-Type"]="application/json",
},
Body=ak,
}
end)

if al and am then
if am.Success then
local an,ao=pcall(function()
return ab:JSONDecode(am.Body)
end)

if an and ao then
if ao.Authenticated_Status and ao.Authenticated_Status=="Success"then
return true,"Authenticated"
else
local ap=ao.Note or"Unknown reason"
return false,"Authentication failed: "..ap
end
else
return false,"JSON decode error"
end
else
warn(
" HTTP request was not successful. Code: "
..tostring(am.StatusCode)
.." Message: "
..am.StatusMessage
)
return false,"HTTP request failed: "..am.StatusMessage
end
else
return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://new.pandadevelopment.net/getkey/"..tostring(ad).."?hwid="..tostring(ae())
end

function CopyLink()
return ag(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return ac end function a.i()







local aa={}

function aa.New(ab,ac)
local ad="https://sdkapi-public.luarmor.net/library.lua"

local ae=loadstring(game.HttpGet and game:HttpGet(ad)or HttpService:GetAsync(ad))()
local af=setclipboard or toclipboard

ae.script_id=ab

function ValidateKey(ag)
local ah=ae.check_key(ag)


if ah.code=="KEY_VALID"then
return true,"Whitelisted!"
elseif ah.code=="KEY_HWID_LOCKED"then
return false,"Key linked to a different HWID. Please reset it using our bot"
elseif ah.code=="KEY_INCORRECT"then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ah.message.." Code: "..ah.code
end
end

function CopyLink()
af(tostring(ac))
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return aa end function a.j()









local aa={}

function aa.New(ab,ac,ad)
JunkieProtected.API_KEY=ac
JunkieProtected.PROVIDER=ad
JunkieProtected.SERVICE_ID=ab

local function ValidateKey(ae)
if not ae or ae==""then
print"No key provided!"

return false,"No key provided. Please get a key."
end

local af=JunkieProtected.IsKeylessMode()
if af and af.keyless_mode then
print"Keyless mode enabled. Starting script..."
return true,"Keyless mode enabled. Starting script..."
end

local ag=JunkieProtected.ValidateKey{Key=ae}
if ag=="valid"then
print"Key is valid! Starting script..."
load()
if _G.JD_IsPremium then
print"Premium user detected!"
else
print"Standard user"
end

return true,"Key is valid!"
else
local ah=JunkieProtected.GetKeyLink()
print"Invalid key!"

return false,"Invalid key. Get one from:"..ah
end
end

local function copyLink()
local ae=JunkieProtected.GetKeyLink()

if setclipboard then
setclipboard(ae)
end
end
return{
Verify=ValidateKey,
Copy=copyLink
}
end

return aa end function a.k()



return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},

New=a.load'g'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},

New=a.load'h'.New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},

New=a.load'i'.New
},
junkiedevelopment={
Name="Junkie Development",
Icon="rbxassetid://106310347705078",
Args={"ServiceId","ApiKey","Provider"},

New=a.load'j'.New
},


}end function a.l()



return[[
{
    "name": "windui",
    "version": "1.6.65",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "live": "python3 -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python3 updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]end function a.m()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

function aa.New(ae,af,ag,ah,ai,aj,ak,al)
ah=ah or"Primary"
local am=al or(not ak and 10 or 999)
local an
if af and af~=""then
an=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ah=="White"and 0.4 or 0,
ThemeTag={
ImageColor3=ah~="White"and"Icon"or nil,
},
})
end

local ao=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1,
},{
ab.NewRoundFrame(am,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 0.9,
}),

ab.NewRoundFrame(am,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1,
}),

ab.NewRoundFrame(am,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not ak,
}),

ab.NewRoundFrame(am,"SquircleGlass",{
ThemeTag={
ImageColor3="White",
},
Size=UDim2.new(1,1,1,1),

ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Outline",
},{













}),

ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil,
},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1,
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
an,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={
TextColor3=(ah~="Primary"and ah~="White")and"Text",
},
TextColor3=ah=="Primary"and Color3.new(1,1,1)
or ah=="White"and Color3.new(0,0,0)
or nil,
AutomaticSize="XY",
TextSize=18,
}),
}),
})

ab.AddSignal(ao.MouseEnter,function()
ad(ao.Frame,0.047,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(ao.MouseLeave,function()
ad(ao.Frame,0.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(ao.MouseButton1Click,function()
if aj then
aj:Close()()
end
if ag then
ab.SafeCallback(ag)
end
end)

return ao
end

return aa end function a.n()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween

function aa.New(ae,af,ag,ah,ai,aj,ak,al,am)
ah=ah or"Input"
local an=ak or 10
local ao
if af and af~=""then
ao=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local ap=ah=="Textarea"

local aq=ac("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ao and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=al or false,
ClipsDescendants=true,
TextWrapped=ap,
MultiLine=ap,
TextXAlignment="Left",
TextYAlignment=ah~="Textarea"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local ar=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(an,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not am and ab.NewRoundFrame(an-1,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
})or nil,
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah~="Textarea"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah~="Textarea"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah~="Textarea"and"Center"or"Top",
HorizontalAlignment="Left",
}),
ao,
aq,
}),
}),
})










if aj then
ab.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
else
ab.AddSignal(aq.FocusLost,function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
end

return ar
end

return aa end function a.o()

local aa=a.load'd'
local ab=aa.New
local ac=aa.Tween




local ad={
Holder=nil,

Parent=nil,
}

function ad.Create(ae,af,ag,ah,ai)
local aj={
UICorner=28,
UIPadding=12,

Window=ag,
WindUI=ah,

UIElements={},
}

if ae then
aj.UIPadding=0
end
if ae then
aj.UICorner=26
end

af=af or"Dialog"

if not ae then
aj.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ad.Parent
or(ag and ag.UIElements and ag.UIElements.Main and ag.UIElements.Main.Main),
},{
ab("UICorner",{
CornerRadius=UDim.new(0,ag.UICorner),
}),
})
end

ab("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

aj.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3=af.."Background",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,aj.UIPadding),
PaddingLeft=UDim.new(0,aj.UIPadding),
PaddingRight=UDim.new(0,aj.UIPadding),
PaddingBottom=UDim.new(0,aj.UIPadding),
}),
})

aj.UIElements.MainContainer=aa.NewRoundFrame(aj.UICorner,"Squircle",{
Visible=false,

ImageTransparency=ae and 0.15 or 0,
Parent=ai or aj.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=af.."Background",
ImageTransparency=af.."BackgroundTransparency",
},
ZIndex=9999,
},{






aj.UIElements.Main,




















})

function aj.Open(ak)
if not ae then
aj.UIElements.FullScreen.Visible=true
aj.UIElements.FullScreen.Active=true
end

task.spawn(function()
aj.UIElements.MainContainer.Visible=true

if not ae then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=0.65}):Play()
end
ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
aj.UIElements.Main.Visible=true
end)
end)
end
function aj.Close(ak)
if not ae then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
aj.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(0.1)
aj.UIElements.FullScreen.Visible=false
end)
end
aj.UIElements.Main.Visible=false

ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(0.1)
if not ae then
aj.UIElements.FullScreen:Destroy()
else
aj.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return aj
end

return ad end function a.p()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'm'.New
local af=a.load'n'.New

function aa.new(ag,ah,ai,aj)
local ak=a.load'o'
local al=ak.Create(true,"Popup",ag.Window,ag.WindUI,ag.WindUI.ScreenGui.KeySystem)

local am={}

local an

local ao=(ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width)or 200

local ap=430
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
ap=430+(ao/2)
end

al.UIElements.Main.AutomaticSize="Y"
al.UIElements.Main.Size=UDim2.new(0,ap,0,0)

local aq

if ag.Icon then
aq=
ab.Image(ag.Icon,ag.Title..":"..ag.Icon,0,"Temp","KeySystem",ag.IconThemed)
aq.Size=UDim2.new(0,24,0,24)
aq.LayoutOrder=-1
end

local ar=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.KeySystem.Title or ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
})

local as=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16,
})

local at=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aq,
ar,
})

local au=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





at,
as,
})

local av=af("Enter Key","key",nil,"Input",function(av)
an=av
end)

local aw
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
aw=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=0.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ax=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
}),
}),
})

local ay
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local az
if ag.KeySystem.Thumbnail.Title then
az=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ay=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ao,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=al.UIElements.Main,
ScaleType="Crop",
},{
az,
ac("UICorner",{
CornerRadius=UDim.new(0,20),
}),
})
end

ac("Frame",{

Size=UDim2.new(1,ay and-ao or 0,1,0),
Position=UDim2.new(0,ay and ao or 0,0,0),
BackgroundTransparency=1,
Parent=al.UIElements.Main,
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
au,
aw,
av,
ax,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
}),
}),
})





local az=ae("Exit","log-out",function()
al:Close()()
end,"Tertiary",ax.Frame)

if ay then
az.Parent=ay
az.Size=UDim2.new(0,0,0,42)
az.Position=UDim2.new(0,10,1,-10)
az.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",ax.Frame)
end

if ag.KeySystem.API then








local aA=240
local aB=false
local b=ae("Get key","key",nil,"Secondary",ax.Frame)

local d=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=b.Frame,
},{
d,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
}),
})

local f=ab.Image("chevron-down","chevron-down",0,"Temp","KeySystem",true)

f.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=b.Frame,
BackgroundTransparency=1,
},{
f,
})

local g=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
}),
})

local h=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,aA,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=b,
Position=UDim2.new(1,0,1,15),
},{
g,
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=g,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
})

for i,l in next,ag.KeySystem.API do
local m=ag.WindUI.Services[l.Type]
if m then
local p={}
for r,u in next,m.Args do
table.insert(p,l[u])
end

local r=m.New(table.unpack(p))
r.Type=l.Type
table.insert(am,r)

local u=ab.Image(
l.Icon or m.Icon or Icons[l.Type]or"user",
l.Icon or m.Icon or Icons[l.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
u.Size=UDim2.new(0,24,0,24)

local v=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=g,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
u,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=l.Title or m.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=l.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=l.Desc and true or false,
TextXAlignment="Left",
}),
}),
},true)

ab.AddSignal(v.MouseEnter,function()
ad(v,0.08,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(v.InputEnded,function()
ad(v,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(v.MouseButton1Click,function()
r.Copy()
ag.WindUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(b.MouseButton1Click,function()
if not aB then
ad(
h,
0.3,
{Size=UDim2.new(0,aA,0,g.AbsoluteSize.Y+1)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(f,0.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(
h,
0.25,
{Size=UDim2.new(0,aA,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(f,0.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aB=not aB
end)
end

local function handleSuccess(aA)
al:Close()()
writefile((ag.Folder or"Temp").."/"..ah..".key",tostring(aA))
task.wait(0.4)
ai(true)
end

local aA=ae("Submit","arrow-right",function()
local aA=tostring(an or"empty")local aB=
ag.Folder or ag.Title

if ag.KeySystem.KeyValidator then
local b=ag.KeySystem.KeyValidator(aA)

if b then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
else
ag.WindUI:Notify{
Title="Key System. Error",
Content="Invalid key.",
Icon="triangle-alert",
}
end
elseif not ag.KeySystem.API then
local b=type(ag.KeySystem.Key)=="table"and table.find(ag.KeySystem.Key,aA)
or ag.KeySystem.Key==aA

if b then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
end
else
local b,d
for f,g in next,am do
local h,i=g.Verify(aA)
if h then
b,d=true,i
break
end
d=i
end

if b then
handleSuccess(aA)
else
ag.WindUI:Notify{
Title="Key System. Error",
Content=d,
Icon="triangle-alert",
}
end
end
end,"Primary",ax)

aA.AnchorPoint=Vector2.new(1,0.5)
aA.Position=UDim2.new(1,0,0.5,0)










al:Open()
end

return aa end function a.q()




local aa=(cloneref or clonereference or function(aa)return aa end)


local function map(ab,ac,ad,ae,af)
return(ab-ac)*(af-ae)/(ad-ac)+ae
end

local function viewportPointToWorld(ab,ac)
local ad=aa(game:GetService"Workspace").CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ad.Origin+ad.Direction*ac
end

local function getOffset()
local ab=aa(game:GetService"Workspace").CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.r()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.load'd'
local ac=ab.New


local ad,ae=unpack(a.load'q')
local af=Instance.new("Folder",aa(game:GetService"Workspace").CurrentCamera)


local function createAcrylic()
local ag=ac("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ac("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return ag
end


local function createAcrylicBlur(ag)
local ah={}

ag=ag or 0.001
local ai={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local aj=createAcrylic()
aj.Parent=af

local function updatePositions(ak,al)
ai.topLeft=al
ai.topRight=al+Vector2.new(ak.X,0)
ai.bottomRight=al+ak
end

local function render()
local ak=aa(game:GetService"Workspace").CurrentCamera
if ak then
ak=ak.CFrame
end
local al=ak
if not al then
al=CFrame.new()
end

local am=al
local an=ai.topLeft
local ao=ai.topRight
local ap=ai.bottomRight

local aq=ad(an,ag)
local ar=ad(ao,ag)
local as=ad(ap,ag)

local at=(ar-aq).Magnitude
local au=(ar-as).Magnitude

aj.CFrame=
CFrame.fromMatrix((aq+as)/2,am.XVector,am.YVector,am.ZVector)
aj.Mesh.Scale=Vector3.new(at,au,0)
end

local function onChange(ak)
local al=ae()
local am=ak.AbsoluteSize-Vector2.new(al,al)
local an=ak.AbsolutePosition+Vector2.new(al/2,al/2)

updatePositions(am,an)
task.spawn(render)
end

local function renderOnChange()
local ak=aa(game:GetService"Workspace").CurrentCamera
if not ak then
return
end

table.insert(ah,ak:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

aj.Destroying:Connect(function()
for ak,al in ah do
pcall(function()
al:Disconnect()
end)
end
end)

renderOnChange()

return onChange,aj
end

return function(ag)
local ah={}
local ai,aj=createAcrylicBlur(ag)

local ak=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ab.AddSignal(ak:GetPropertyChangedSignal"AbsolutePosition",function()
ai(ak)
end)

ab.AddSignal(ak:GetPropertyChangedSignal"AbsoluteSize",function()
ai(ak)
end)

ah.AddParent=function(al)
ab.AddSignal(al:GetPropertyChangedSignal"Visible",function()

end)
end

ah.SetVisibility=function(al)
aj.Transparency=al and 0.98 or 1
end

ah.Frame=ak
ah.Model=aj

return ah
end end function a.s()


local aa=a.load'd'
local ab=a.load'r'

local ac=aa.New

return function(ad)
local ae={}

ae.Frame=ac("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ac("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local af

task.wait()
if ad.UseAcrylic then
af=ab()

af.Frame.Parent=ae.Frame
ae.Model=af.Model
ae.AddParent=af.AddParent
ae.SetVisibility=af.SetVisibility
end

return ae,af
end end function a.t()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.load'r',

AcrylicPaint=a.load's',
}

function ab.init()
local ac=Instance.new"DepthOfFieldEffect"
ac.FarIntensity=0
ac.InFocusRadius=0.1
ac.NearIntensity=1

local ad={}

function ab.Enable()
for ae,af in pairs(ad)do
af.Enabled=false
end
ac.Parent=aa(game:GetService"Lighting")
end

function ab.Disable()
for ae,af in pairs(ad)do
af.Enabled=af.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(ae)
if ae:IsA"DepthOfFieldEffect"then
ad[ae]={enabled=ae.Enabled}
end
end

for ae,af in pairs(aa(game:GetService"Lighting"):GetChildren())do
register(af)
end

if aa(game:GetService"Workspace").CurrentCamera then
for ae,af in pairs(aa(game:GetService"Workspace").CurrentCamera:GetChildren())do
register(af)
end
end
end

registerDefaults()
ab.Enable()
end

return ab end function a.u()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween


function aa.new(ae,af)
local ag={
Title=ae.Title or"Dialog",
Content=ae.Content,
Icon=ae.Icon,
IconThemed=ae.IconThemed,
Thumbnail=ae.Thumbnail,
Buttons=ae.Buttons,

IconSize=22,
}

local ah=a.load'o'
local ai=ah.Create(true,"Popup",ae.WindUI.Window,ae.WindUI,af)

local aj=200

local ak=430
if ag.Thumbnail and ag.Thumbnail.Image then
ak=430+(aj/2)
end

ai.UIElements.Main.AutomaticSize="Y"
ai.UIElements.Main.Size=UDim2.new(0,ak,0,0)



local al

if ag.Icon then
al=ab.Image(
ag.Icon,
ag.Title..":"..ag.Icon,
0,
ae.WindUI.Window,
"Popup",
true,
ae.IconThemed,
"PopupIcon"
)
al.Size=UDim2.new(0,ag.IconSize,0,ag.IconSize)
al.LayoutOrder=-1
end


local am=ac("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ag.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="PopupTitle",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,al and-ag.IconSize-14 or 0,0,0)
})

local an=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
al,am
})

local ao=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





an,
})

local ap
if ag.Content and ag.Content~=""then
ap=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="PopupContent",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local aq=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local ar
if ag.Thumbnail and ag.Thumbnail.Image then
local as
if ag.Thumbnail.Title then
as=ac("TextLabel",{
Text=ag.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ar=ac("ImageLabel",{
Image=ag.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,aj,1,0),
Parent=ai.UIElements.Main,
ScaleType="Crop"
},{
as,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,ar and-aj or 0,1,0),
Position=UDim2.new(0,ar and aj or 0,0,0),
BackgroundTransparency=1,
Parent=ai.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
ao,
ap,
aq,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local as=a.load'm'.New

for at,au in next,ag.Buttons do
as(au.Title,au.Icon,au.Callback,au.Variant,aq,ai)
end

ai:Open()


return ag
end

return aa end function a.v()
return function(aa,ab)
return{
Dark={
Name="Dark",

Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#1a1a1a",
Outline=Color3.fromHex"#FFFFFF",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#a1a1a1",
Background=Color3.fromHex"#101010",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

SliderIcon=Color3.fromHex"#908F95",
Primary=Color3.fromHex"#0091FF",


LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.83,

ElementBackground=Color3.fromHex"#2A2A2C",
ElementBackgroundTransparency=0,
},

Light={
Name="Light",

Accent=Color3.fromHex"#efefef",
Dialog=Color3.fromHex"#f4f4f5",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Background=Color3.fromHex"#FFFFFF",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

DropdownTabBackground=Color3.fromHex"#bebebe",
DropdownBackground=Color3.fromHex"#ffffff",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f3f3f3",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#efefef",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#efefef",
PanelBackgroundTransparency=0,

LabelBackground=Color3.fromHex"#efefef",
LabelBackgroundTransparency=0,

ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
},

Rose={
Name="Rose",

Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Background=Color3.fromHex"#1f0308",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",

ElementBackground=Color3.fromHex"#381E23",
ElementBackgroundTransparency=0,
},

Plant={
Name="Plant",

Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",

Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Background=Color3.fromHex"#0a1b0f",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",

ElementBackground=Color3.fromHex"#28342A",
ElementBackgroundTransparency=0,
},

Red={
Name="Red",

Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Background=Color3.fromHex"#1c0606",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",

ElementBackground=Color3.fromHex"#322221",
ElementBackgroundTransparency=0,
},

Indigo={
Name="Indigo",

Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",

Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Background=Color3.fromHex"#0f0a2e",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",

ElementBackground=Color3.fromHex"#282543",
ElementBackgroundTransparency=0,
},

Sky={
Name="Sky",

Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",

Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Background=Color3.fromHex"#051a26",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",

Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",

PanelBackground=Color3.fromHex"#0d3a47",
PanelBackgroundTransparency=0.8,

ElementBackground=Color3.fromHex"#172E3B",
ElementBackgroundTransparency=0,
},

Violet={
Name="Violet",

Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",

Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Background=Color3.fromHex"#1e0a3e",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",

ElementBackground=Color3.fromHex"#342650",
ElementBackgroundTransparency=0,
},

Amber={
Name="Amber",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#b45309",Transparency=0},
["100"]={Color=Color3.fromHex"#d97706",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#451a03",Transparency=0},
["100"]={Color=Color3.fromHex"#6b2e05",Transparency=0},
},{Rotation=90}),






Text=aa:Gradient({
["0"]={Color=Color3.fromHex"#fffbeb",Transparency=0},
["100"]={Color=Color3.fromHex"#fff7ed",Transparency=0},
},{Rotation=45}),

Placeholder=aa:Gradient({
["0"]={Color=Color3.fromHex"#d1a326",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#1c1003",Transparency=0},
["100"]={Color=Color3.fromHex"#3f210d",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Icon=Color3.fromHex"#f59e0b",

Toggle=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Slider=Color3.fromHex"#d97706",

Checkbox=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

ElementBackground=Color3.fromHex"#3A2E22",
ElementBackgroundTransparency=0,
},

Emerald={
Name="Emerald",

Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",

Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Background=Color3.fromHex"#011411",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",

ElementBackground=Color3.fromHex"#202E2A",
ElementBackgroundTransparency=0,
},

Midnight={
Name="Midnight",

Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",

Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Background=Color3.fromHex"#0a0f1e",
Button=Color3.fromHex"#2563eb",
Primary=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",

ElementBackground=Color3.fromHex"#242836",
ElementBackgroundTransparency=0,
},

Crimson={
Name="Crimson",

Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Background=Color3.fromHex"#0c0404",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",

ElementBackground=Color3.fromHex"#251F1F",
ElementBackgroundTransparency=0,
},

MonokaiPro={
Name="Monokai Pro",

Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",

Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#afafaf",
Background=Color3.fromHex"#191622",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",

ElementBackground=Color3.fromHex"#323039",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=23,
},
},

CottonCandy={
Name="Cotton Candy",

Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Background=Color3.fromHex"#1a0b2e",
Button=Color3.fromHex"#d946ef",
Slider=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",

ElementBackground=Color3.fromHex"#312643",
ElementBackgroundTransparency=0,
},

Mellowsi={
Name="Mellowsi",

Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",

Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Background=Color3.fromHex"#1C1002",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",

Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",

ElementBackground=Color3.fromHex"#33291E",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=52,
},
},

Rainbow={
Name="Rainbow",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#00ff41",Transparency=0},
["33"]={Color=Color3.fromHex"#00ffff",Transparency=0},
["66"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["100"]={Color=Color3.fromHex"#8000ff",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#8000ff",Transparency=0},
["50"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["75"]={Color=Color3.fromHex"#00ff80",Transparency=0},
["100"]={Color=Color3.fromHex"#ff8000",Transparency=0},
},{Rotation=135}),


Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0040",Transparency=0},
["20"]={Color=Color3.fromHex"#ff4000",Transparency=0},
["40"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["60"]={Color=Color3.fromHex"#00ff40",Transparency=0},
["80"]={Color=Color3.fromHex"#0040ff",Transparency=0},
["100"]={Color=Color3.fromHex"#4000ff",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#ff8000",Transparency=0},
["50"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["75"]={Color=Color3.fromHex"#80ff00",Transparency=0},
["100"]={Color=Color3.fromHex"#00ffff",Transparency=0},
},{Rotation=60}),

Icon=Color3.fromHex"#ffffff",
},
}
end end function a.w()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween

function aa.New(ae,af,ag,ah,ai,aj)
local ak=ai or 10
local al
if af and af~=""then
al=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local am=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,al and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3=ah and"Placeholder"or"Text",
},
Text=ae,
})

local an=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(ak,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not aj and ab.NewRoundFrame(ak,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})or nil,
ab.NewRoundFrame(ak,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
al,
am,
}),
}),
})

return an
end

return aa end function a.x()

local aa={}

local ab=cloneref or clonereference or function(ab)
return ab
end
local ac=ab(game:GetService"UserInputService")

local ad=a.load'd'
local ae=ad.New

function aa.New(af,ag,ah,ai,aj)
local ak=ae("Frame",{
Size=UDim2.new(0,ai,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ag,
ZIndex=999,
Active=true,
})

local al=ad.NewRoundFrame(ai/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=ak,
})

local am=ae("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=al,
})

local an=ad:GenerateUniqueID()
local ao=false
local ap,aq

local function UpdateVisuals()
local ar=af.AbsoluteCanvasSize.Y
local as=af.AbsoluteWindowSize.Y

if ar<=as then
al.Visible=false
return
end

al.Visible=true

local at=math.clamp(as/ar,0.05,1)
al.Size=UDim2.new(1,0,at,0)

local au=ar-as
local av=1-at

if au>0 then
local aw=af.CanvasPosition.Y/au
al.Position=UDim2.new(0,0,math.clamp(aw*av,0,av),0)
else
al.Position=UDim2.new(0,0,0,0)
end
end

local function StopDrag()
if aj.CurrentInput==an then
aj.CurrentInput=nil
end
ao=false
af.ScrollingEnabled=true
if ap then
ap:Disconnect()
end
if aq then
aq:Disconnect()
end
end

ad.AddSignal(am.InputBegan,function(ar)
if
ar.UserInputType~=Enum.UserInputType.MouseButton1
and ar.UserInputType~=Enum.UserInputType.Touch
then
return
end
if ao then
return
end
if aj.CurrentInput and aj.CurrentInput~=an then
return
end

aj.CurrentInput=an

ao=true
af.ScrollingEnabled=false

local as=ar.Position.Y
local at=af.CanvasPosition.Y

ap=ac.InputChanged:Connect(function(au)
if
au.UserInputType==Enum.UserInputType.MouseMovement
or au.UserInputType==Enum.UserInputType.Touch
then
local av=au.Position.Y-as

local aw=af.AbsoluteCanvasSize.Y
local ax=af.AbsoluteWindowSize.Y
local ay=math.max(aw-ax,0)

local az=ak.AbsoluteSize.Y
local aA=al.AbsoluteSize.Y
local aB=math.max(az-aA,1)

local b=av*(ay/aB)

af.CanvasPosition=
Vector2.new(af.CanvasPosition.X,math.clamp(at+b,0,ay))
end
end)

aq=ac.InputEnded:Connect(function(au)
if au.UserInputType==ar.UserInputType then
if aj.CurrentInput and aj.CurrentInput~=an then
return
end

aj.CurrentInput=nil

StopDrag()
end
end)
end)

ad.AddSignal(af:GetPropertyChangedSignal"AbsoluteWindowSize",UpdateVisuals)
ad.AddSignal(af:GetPropertyChangedSignal"AbsoluteCanvasSize",UpdateVisuals)
ad.AddSignal(af:GetPropertyChangedSignal"CanvasPosition",UpdateVisuals)

UpdateVisuals()

return ak
end

return aa end function a.y()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

function aa.New(ae,af,ag)
local ah={
Title=af.Title or"Tag",
Icon=af.Icon,
Color=af.Color or Color3.fromHex"#315dff",
Radius=af.Radius or 999,
Border=af.Border or false,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
IconSize=16,
}

local ai
if ah.Icon then
ai=ab.Image(ah.Icon,ah.Icon,0,af.Window,"Tag",false)

ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.ImageLabel.ImageColor3=typeof(ah.Color)=="Color3"
and ab.GetTextColorForHSB(ah.Color)
or typeof(ah.Color)=="string"
and(ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme)))
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ah.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ah.Title,
TextColor3=typeof(ah.Color)=="Color3"and ab.GetTextColorForHSB(ah.Color)or typeof(
ah.Color
)=="string"and(ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme))),
})

local ak

if typeof(ah.Color)=="table"then
ak=ac"UIGradient"
for al,am in next,ah.Color do
ak[al]=am
end

aj.TextColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
if ai then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
end
end

local al=ab.NewRoundFrame(ah.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ah.Height),
Parent=ag,
ImageColor3=typeof(ah.Color)=="Color3"and ah.Color
or typeof(ah.Color)=="table"and Color3.new(1,1,1)
or nil,
ThemeTag=typeof(ah.Color)=="string"and{
ImageColor3=ah.Color,
},
},{
ak,
ab.NewRoundFrame(ah.Radius+1,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0.75,
}),
ac("Frame",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Name="Content",
BackgroundTransparency=1,
},{
ai,
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ah.Padding),
PaddingRight=UDim.new(0,ah.Padding),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,ah.Padding/1.5),
}),
}),
})

function ah.SetTitle(am,an)
ah.Title=an
aj.Text=an

return ah
end

function ah.SetColor(am,an)
ah.Color=an
if typeof(an)=="table"then
local ao=ab.GetAverageColor(an)
ad(aj,0.06,{TextColor3=ab.GetTextColorForHSB(ao)}):Play()
local ap=al:FindFirstChildOfClass"UIGradient"or ac("UIGradient",{Parent=al})
for aq,ar in next,an do
ap[aq]=ar
end
ad(al,0.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if ak then
ak:Destroy()
end
ad(aj,0.06,{TextColor3=ab.GetTextColorForHSB(an)}):Play()
if ai then
ad(ai.ImageLabel,0.06,{ImageColor3=ab.GetTextColorForHSB(an)}):Play()
end
ad(al,0.06,{ImageColor3=an}):Play()
end

return ah
end

function ah.SetIcon(am,an)
ah.Icon=an

if an then
ai=ab.Image(an,an,0,af.Window,"Tag",false)

ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.Parent=al

if typeof(ah.Color)=="Color3"then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ah.Color)
elseif typeof(ah.Color)=="table"then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
end
else
if ai then
ai:Destroy()
ai=nil
end
end
return ah
end

function ah.Destroy(am)
al:Destroy()
return ah
end

ab:OnThemeChange(function(am,an)
aj.TextColor3=ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme))
ai.ImageLabel.ImageColor3=
ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme))
end)

return ah
end

return aa end function a.z()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=aa(game:GetService"RunService")
local ac=aa(game:GetService"HttpService")

local ad

local ae
ae={
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(af)
return{
__type=af.__type,
value=af.Default:ToHex(),
transparency=af.Transparency or nil,
}
end,
Load=function(af,ag)
if af and af.Update then
af:Update(Color3.fromHex(ag.value),ag.transparency or nil)
end
end
},
Dropdown={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Select then
af:Select(ag.value)
end
end
},
Input={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Keybind={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Slider={
Save=function(af)
return{
__type=af.__type,
value=af.Value.Default,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(tonumber(ag.value))
end
end
},
Toggle={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
}
}

function ae.Init(af,ag)
if not ag.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end
if ab:IsStudio()or not writefile then
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return false
end

ad=ag
ae.Folder=ad.Folder
ae.Path="WindUI/"..tostring(ae.Folder).."/config/"

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

local ah=ae:AllConfigs()

for ai,aj in next,ah do
if isfile and readfile and isfile(aj..".json")then
ae.Configs[aj]=readfile(aj..".json")
end
end

return ae
end

function ae.SetPath(af,ag)
if not ag then
warn"[ WindUI.ConfigManager ] Custom path is not specified."
return false
end

ae.Path=ag
if not ag:match"/$"then
ae.Path=ag.."/"
end

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

return true
end

function ae.CreateConfig(af,ag,ah)
local ai={
Path=ae.Path..ag..".json",
Elements={},
CustomData={},
AutoLoad=ah or false,
Version=1.2,
}

if not ag then
return false,"No config file is selected"
end

function ai.SetAsCurrent(aj)
ad:SetCurrentConfig(ai)
end

function ai.Register(aj,ak,al)
ai.Elements[ak]=al
end

function ai.Set(aj,ak,al)
ai.CustomData[ak]=al
end

function ai.Get(aj,ak)
return ai.CustomData[ak]
end

function ai.SetAutoLoad(aj,ak)
ai.AutoLoad=ak
end

function ai.Save(aj)
if ad.PendingFlags then
for ak,al in next,ad.PendingFlags do
ai:Register(ak,al)
end
end

local ak={
__version=ai.Version,
__elements={},
__autoload=ai.AutoLoad,
__custom=ai.CustomData
}

for al,am in next,ai.Elements do
if ae.Parser[am.__type]then
ak.__elements[tostring(al)]=ae.Parser[am.__type].Save(am)
end
end

local al=ac:JSONEncode(ak)
if writefile then
writefile(ai.Path,al)
end

return ak
end

function ai.Load(aj)
if isfile and not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
local ak=readfile or function()
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return nil
end
return ac:JSONDecode(ak(ai.Path))
end)

if not ak then
return false,"Failed to parse config file"
end

if not al.__version then
local am={
__version=ai.Version,
__elements=al,
__custom={}
}
al=am
end

if ad.PendingFlags then
for am,an in next,ad.PendingFlags do
ai:Register(am,an)
end
end

for am,an in next,(al.__elements or{})do
if ai.Elements[am]and ae.Parser[an.__type]then
task.spawn(function()
ae.Parser[an.__type].Load(ai.Elements[am],an)
end)
end
end

ai.CustomData=al.__custom or{}

return ai.CustomData
end

function ai.Delete(aj)
if not delfile then
return false,"delfile function is not available"
end

if not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
delfile(ai.Path)
end)

if not ak then
return false,"Failed to delete config file: "..tostring(al)
end

ae.Configs[ag]=nil

if ad.CurrentConfig==ai then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ai.GetData(aj)
return{
elements=ai.Elements,
custom=ai.CustomData,
autoload=ai.AutoLoad
}
end


if isfile(ai.Path)then
local aj,ak=pcall(function()
return ac:JSONDecode(readfile(ai.Path))
end)

if aj and ak and ak.__autoload then
ai.AutoLoad=true

task.spawn(function()
task.wait(0.5)
local al,am=pcall(function()
return ai:Load()
end)
if al then
if ad.Debug then print("[ WindUI.ConfigManager ] AutoLoaded config: "..ag)end
else
warn("[ WindUI.ConfigManager ] Failed to AutoLoad config: "..ag.." - "..tostring(am))
end
end)
end
end


ai:SetAsCurrent()
ae.Configs[ag]=ai
return ai
end

function ae.Config(af,ag,ah)
return ae:CreateConfig(ag,ah)
end

function ae.GetAutoLoadConfigs(af)
local ag={}

for ah,ai in pairs(ae.Configs)do
if ai.AutoLoad then
table.insert(ag,ah)
end
end

return ag
end

function ae.DeleteConfig(af,ag)
if not delfile then
return false,"delfile function is not available"
end

local ah=ae.Path..ag..".json"

if not isfile(ah)then
return false,"Config file does not exist"
end

local ai,aj=pcall(function()
delfile(ah)
end)

if not ai then
return false,"Failed to delete config file: "..tostring(aj)
end

ae.Configs[ag]=nil

if ad.CurrentConfig and ad.CurrentConfig.Path==ah then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ae.AllConfigs(af)
if not listfiles then return{}end

local ag={}
if not isfolder(ae.Path)then
makefolder(ae.Path)
return ag
end

for ah,ai in next,listfiles(ae.Path)do
local aj=ai:match"([^\\/]+)%.json$"
if aj then
table.insert(ag,aj)
end
end

return ag
end

function ae.GetConfig(af,ag)
return ae.Configs[ag]
end

return ae end function a.A()
local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween


local ae=(cloneref or clonereference or function(ae)return ae end)


ae(game:GetService"UserInputService")


function aa.New(af)
local ag={
Button=nil
}

local ah













local ai=ac("TextLabel",{
Text=af.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local aj=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.3,
})
})
local ak=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local al=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=af.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})


local am=ac("UIScale",{
Scale=1,
})

local an=ac("Frame",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=al,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{
am,
ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
aj,
ak,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ah,
ac("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai,
ac("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

ag.Button=an



function ag.SetIcon(ao,ap)
if ah then
ah:Destroy()
end
if ap then
ah=ab.Image(
ap,
af.Title,
0,
af.Folder,
"OpenButton",
true,
af.IconThemed
)
ah.Size=UDim2.new(0,22,0,22)
ah.LayoutOrder=-1
ah.Parent=ag.Button.TextButton
end
end

if af.Icon then
ag:SetIcon(af.Icon)
end



ab.AddSignal(an:GetPropertyChangedSignal"AbsoluteSize",function()
al.Size=UDim2.new(
0,an.AbsoluteSize.X,
0,an.AbsoluteSize.Y
)
end)

ab.AddSignal(an.TextButton.MouseEnter,function()
ad(an.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(an.TextButton.MouseLeave,function()
ad(an.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local ao=ab.Drag(al)


function ag.Visible(ap,aq)
al.Visible=aq
end

function ag.SetScale(ap,aq)
am.Scale=aq
end

function ag.Edit(ap,aq)
local ar={
Title=aq.Title,
Icon=aq.Icon,
Enabled=aq.Enabled,
Position=aq.Position,
OnlyIcon=aq.OnlyIcon or false,
Draggable=aq.Draggable or nil,
OnlyMobile=aq.OnlyMobile,
CornerRadius=aq.CornerRadius or UDim.new(1,0),
StrokeThickness=aq.StrokeThickness or 2,
Scale=aq.Scale or 1,
Color=aq.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if ar.Enabled==false then
af.IsOpenButtonEnabled=false
end

if ar.OnlyMobile~=false then
ar.OnlyMobile=true
else
af.IsPC=false
end


if ar.Draggable==false and aj and ak then
aj.Visible=ar.Draggable
ak.Visible=ar.Draggable

if ao then
ao:Set(ar.Draggable)
end
end

if ar.Position and al then
al.Position=ar.Position
end

if ar.OnlyIcon==true and ai then
ai.Visible=false
an.TextButton.UIPadding.PaddingLeft=UDim.new(0,7)
an.TextButton.UIPadding.PaddingRight=UDim.new(0,7)
elseif ar.OnlyIcon==false then
ai.Visible=true
an.TextButton.UIPadding.PaddingLeft=UDim.new(0,11)
an.TextButton.UIPadding.PaddingRight=UDim.new(0,11)
end





if ai then
if ar.Title then
ai.Text=ar.Title
ab:ChangeTranslationKey(ai,ar.Title)
elseif ar.Title==nil then

end
end

if ar.Icon then
ag:SetIcon(ar.Icon)
end

an.UIStroke.UIGradient.Color=ar.Color
if Glow then
Glow.UIGradient.Color=ar.Color
end

an.UICorner.CornerRadius=ar.CornerRadius
an.TextButton.UICorner.CornerRadius=UDim.new(ar.CornerRadius.Scale,ar.CornerRadius.Offset-4)
an.UIStroke.Thickness=ar.StrokeThickness

ag:SetScale(ar.Scale)
end

return ag
end



return aa end function a.B()
local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={
Container=nil,
TooltipSize=16,

TooltipArrowSizeX=ai=="Small"and 16 or 24,
TooltipArrowSizeY=ai=="Small"and 6 or 9,

PaddingX=ai=="Small"and 12 or 14,
PaddingY=ai=="Small"and 7 or 9,

Radius=999,

TitleFrame=nil,
}

ah=ah or""
aj=aj~=false

local al=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=aj,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=ai=="Small"and 15 or 17,
TextTransparency=1,
ThemeTag={
TextColor3="Tooltip"..ah.."Text",
}
})

ak.TitleFrame=al

local am=ac("UIScale",{
Scale=.9
})

local an=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=ag,
Name="Arrow",
},{
ac("ImageLabel",{
Size=UDim2.new(0,ak.TooltipArrowSizeX,0,ak.TooltipArrowSizeY),
BackgroundTransparency=1,

Image="rbxassetid://105854070513330",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
},{










}),
}),
ab.NewRoundFrame(ak.Radius,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{



AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

al,
ac("UIPadding",{
PaddingTop=UDim.new(0,ak.PaddingY),
PaddingLeft=UDim.new(0,ak.PaddingX),
PaddingRight=UDim.new(0,ak.PaddingX),
PaddingBottom=UDim.new(0,ak.PaddingY),
}),
})
}),
am,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ak.Container=an

function ak.Open(ao)
an.Visible=true


ad(an.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.22,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ak.Close(ao,ap)

ad(an.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()

ap=ap~=false
if ap then
task.wait(.35)

an.Visible=false
an:Destroy()
end
end

return ak
end



return aa end function a.C()
game:GetService"ReplicatedStorage"
local aa=a.load'd'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

local ae=(cloneref or clonereference or function(ae)
return ae
end)

ae(game:GetService"UserInputService")

local af=a.load'y'

local function Color3ToHSB(ag)
local ah,ai,aj=ag.R,ag.G,ag.B
local ak=math.max(ah,ai,aj)
local al=math.min(ah,ai,aj)
local am=ak-al

local an=0
if am~=0 then
if ak==ah then
an=(ai-aj)/am%6
elseif ak==ai then
an=(aj-ah)/am+2
else
an=(ah-ai)/am+4
end
an=an*60
else
an=0
end

local ao=(ak==0)and 0 or(am/ak)
local ap=ak

return{
h=math.floor(an+0.5),
s=ao,
b=ap,
}
end

local function GetPerceivedBrightness(ag)
local ah=ag.R
local ai=ag.G
local aj=ag.B
return 0.299*ah+0.587*ai+0.114*aj
end

local function GetTextColorForHSB(ag)
local ah=Color3ToHSB(ag)local
ai, aj, ak=ah.h, ah.s, ah.b
if GetPerceivedBrightness(ag)>0.5 then
return Color3.fromHSV(ai/360,0,0.05)
else
return Color3.fromHSV(ai/360,0,0.98)
end
end

return function(ag)
local ah={
Title=ag.Title,
Desc=ag.Desc or nil,
Hover=ag.Hover,
Thumbnail=ag.Thumbnail,
ThumbnailSize=ag.ThumbnailSize or 80,
Image=ag.Image,
IconThemed=ag.IconThemed or false,
ImageSize=ag.ImageSize or 30,
Color=ag.Color,
Scalable=ag.Scalable,
Parent=ag.Parent,
Justify=ag.Justify or"Between",
UIPadding=ag.Window.ElementConfig.UIPadding,
UICorner=ag.Window.ElementConfig.UICorner,
Size=ag.Size or"Default",
Tags=ag.Tags or{},
UIElements={},

Index=ag.Index,
}

local ai=ah.Size=="Small"and-4 or ah.Size=="Large"and 4 or 0
local aj=ah.Size=="Small"and-4 or ah.Size=="Large"and 4 or 0

local ak=ah.ImageSize
local al=ah.ThumbnailSize
local am=true


local an=0

local ao
local ap
if ah.Thumbnail then
ao=aa.Image(
ah.Thumbnail,
ah.Title,
ag.Window.NewElements and ah.UICorner-11 or(ah.UICorner-4),
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
ao.Size=UDim2.new(1,0,0,al)
end
if ah.Image then
ap=aa.Image(
ah.Image,
ah.Title,
ag.Window.NewElements and ah.UICorner-11 or(ah.UICorner-4),
ag.Window.Folder,
"Image",
ah.IconThemed,
not ah.Color and true or false,
"ElementIcon"
)

if typeof(ah.Color)=="string"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
elseif typeof(ah.Color)=="Color3"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(ah.Color)
end

ap.Size=UDim2.new(0,ak,0,ak)

an=ak
end

local function CreateText(aq,ar)
local as=typeof(ah.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
or typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=aq or"",
TextSize=ar=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not ah.Color and("Element"..ar)or nil,
},
TextColor3=ah.Color and as or nil,
TextTransparency=ar=="Desc"and 0.3 or 0,
TextWrapped=true,
Size=UDim2.new(ah.Justify=="Between"and 1 or 0,0,0,0),
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
FontFace=Font.new(aa.Font,ar=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold),
})
end

local aq=CreateText(ah.Title,"Title")
local ar=CreateText(ah.Desc,"Desc")
if not ah.Title or ah.Title==""then
ar.Visible=false
end
if not ah.Desc or ah.Desc==""then
ar.Visible=false
end

ah.UIElements.Title=aq
ah.UIElements.Desc=ar

ah.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,ah.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment=ah.Justify=="Between"and"Left"or"Center",
}),
ao,
ab("Frame",{
Size=UDim2.new(
ah.Justify=="Between"and 1 or 0,
ah.Justify=="Between"and-ag.TextOffset or 0,
0,
0
),
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
BackgroundTransparency=1,
Name="TitleFrame",
},{
ab("UIListLayout",{
Padding=UDim.new(0,ah.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=ag.Window.NewElements and(ah.Justify=="Between"and"Top"or"Center")
or"Center",
HorizontalAlignment=ah.Justify~="Between"and ah.Justify or"Center",
}),
ap,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
Size=UDim2.new(
ah.Justify=="Between"and 1 or 0,
ah.Justify=="Between"and(ap and-an-ah.UIPadding or-an)
or 0,
1,
0
),
Name="TitleFrame",
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,(ag.Window.NewElements and ah.UIPadding/2 or 0)+aj),
PaddingLeft=UDim.new(0,(ag.Window.NewElements and ah.UIPadding/2 or 0)+ai),
PaddingRight=UDim.new(
0,
(ag.Window.NewElements and ah.UIPadding/2 or 0)+ai
),
PaddingBottom=UDim.new(
0,
(ag.Window.NewElements and ah.UIPadding/2 or 0)+aj
),
}),
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ab("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=-99,
BackgroundTransparency=1,
ScrollingDirection="X",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
Visible=false,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ag.Window.UIPadding/2),
}),
}),
ab("Frame",{
Name="Space",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Visible=false,
}),
aq,
ar,
}),
}),
})

for as,at in next,ag.Tags or{}do
if not ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible then
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible=true
ah.UIElements.Container.TitleFrame.TitleFrame.Space.Visible=true
end
af:New(at,ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame)
end

aa.AddSignal(
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout:GetPropertyChangedSignal
"AbsoluteContentSize"
,
function()
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Size=UDim2.new(
1,
0,
0,
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y
/ag.ParentConfig.UIScale
)
end
)





local as=aa.Image("lock","lock",0,ag.Window.Folder,"Lock",false)
as.Size=UDim2.new(0,20,0,20)
as.ImageLabel.ImageColor3=Color3.new(1,1,1)
as.ImageLabel.ImageTransparency=0.4

local at=ab("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=0.05,
})

local au=ab("Frame",{
Size=UDim2.new(1,ah.UIPadding*2,1,ah.UIPadding*2),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ZIndex=9999999,
})

local av,aw=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.25,
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
Parent=au,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
as,
at,
},nil,true)local

ax=ac(ah.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=au,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local ay,az=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=au,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)local

aA=ac(ah.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Visible=false,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=au,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
},nil,true)

local aB,b=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=au,
},{
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local d,f=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ah.Color and 0.05 or(not ag.Window.NewElements and 0.93 or nil),



Parent=ag.Parent,
ThemeTag={
ImageColor3=not ah.Color and(ag.Window.NewElements and"ElementBackground"or"Text")or nil,
ImageTransparency=not ah.Color
and(ag.Window.NewElements and"ElementBackgroundTransparency"or nil)
or nil,
},
ImageColor3=ah.Color and(typeof(ah.Color)=="string"and Color3.fromHex(
aa.Colors[ah.Color]
)or typeof(ah.Color)=="Color3"and ah.Color)or nil,
},{
ah.UIElements.Container,
au,
ab("UIPadding",{
PaddingTop=UDim.new(0,ah.UIPadding),
PaddingLeft=UDim.new(0,ah.UIPadding),
PaddingRight=UDim.new(0,ah.UIPadding),
PaddingBottom=UDim.new(0,ah.UIPadding),
}),
},true,true)

ah.UIElements.Main=d
ah.UIElements.Locked=av

if ah.Hover then
aa.AddSignal(d.MouseEnter,function()
if am then

ad(aB,0.12,{ImageTransparency=0.9}):Play()
ad(aA,0.12,{ImageTransparency=0.8}):Play()
aa.AddSignal(d.MouseMoved,function(g,h)
aB.HoverGradient.Offset=
Vector2.new(((g-d.AbsolutePosition.X)/d.AbsoluteSize.X)-0.5,0)
aA.HoverGradient.Offset=
Vector2.new(((g-d.AbsolutePosition.X)/d.AbsoluteSize.X)-0.5,0)
end)
end
end)
aa.AddSignal(d.InputEnded,function()
if am then

ad(aB,0.12,{ImageTransparency=1}):Play()
ad(aA,0.12,{ImageTransparency=1}):Play()
end
end)
end

function ah.SetTitle(g,h)
ah.Title=h
aq.Text=h
end

function ah.SetDesc(g,h)
ah.Desc=h
ar.Text=h or""
if not h then
ar.Visible=false
elseif not ar.Visible then
ar.Visible=true
end
end

function ah.Colorize(g,h,i)
if ah.Color then
h[i]=typeof(ah.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
or typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)
or nil
end
end

if ag.ElementTable then
aa.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ah.Title~=aq.Text then
ah:SetTitle(aq.Text)
ag.ElementTable.Title=aq.Text
end
end)
aa.AddSignal(ar:GetPropertyChangedSignal"Text",function()
if ah.Desc~=ar.Text then
ah:SetDesc(ar.Text)
ag.ElementTable.Desc=ar.Text
end
end)
end





function ah.SetThumbnail(g,h,i)
ah.Thumbnail=h
if i then
ah.ThumbnailSize=i
al=i
end

if ao then
if h then
ao:Destroy()
ao=aa.Image(
h,
ah.Title,
ah.UICorner-3,
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
if ao then
ao.Size=UDim2.new(1,0,0,al)
ao.Parent=ah.UIElements.Container
local l=ah.UIElements.Container:FindFirstChild"UIListLayout"
if l then
ao.LayoutOrder=-1
end
end
else
ao.Visible=false
end
else
if h then
ao=aa.Image(
h,
ah.Title,
ah.UICorner-3,
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
if ao then
ao.Size=UDim2.new(1,0,0,al)
ao.Parent=ah.UIElements.Container
local l=ah.UIElements.Container:FindFirstChild"UIListLayout"
if l then
ao.LayoutOrder=-1
end
end
end
end
end

function ah.SetImage(g,h,i)
ah.Image=h
if i then
ah.ImageSize=i
ak=i
end

if h then
local l=ap and ap.Parent or ah.UIElements.Container.TitleFrame
if ap then
ap:Destroy()
end

ap=aa.Image(
h,
h,
ah.UICorner-3,
ag.Window.Folder,
"Image",
not ah.Color and true or false
)
if ap then
if typeof(ah.Color)=="string"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=
GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
elseif typeof(ah.Color)=="Color3"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(ah.Color)
end

ap.Visible=true
ap.Parent=l
ap.LayoutOrder=-99

ap.Size=UDim2.new(0,ak,0,ak)
an=ah.ImageSize+ah.UIPadding
end
else
if ap then
ap.Visible=true
end
an=0
end

ah.UIElements.Container.TitleFrame.TitleFrame.Size=UDim2.new(1,-an,1,0)
end

function ah.Destroy(g)
d:Destroy()
end

function ah.Lock(g,h)
am=false
av.Active=true
av.Visible=true
at.Text=h or"Locked"
end

function ah.Unlock(g)
am=true
av.Active=false
av.Visible=false
end

function ah.Highlight(g)
local h=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.1,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.9,0.9),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=ax,
})

local i=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.15,0.8),
NumberSequenceKeypoint.new(0.5,0.1),
NumberSequenceKeypoint.new(0.85,0.8),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=ay,
})

ax.ImageTransparency=0.65
ay.ImageTransparency=0.88

ad(h,0.75,{
Offset=Vector2.new(1,0),
}):Play()

ad(i,0.75,{
Offset=Vector2.new(1,0),
}):Play()

task.spawn(function()
task.wait(0.75)
ax.ImageTransparency=1
ay.ImageTransparency=1
h:Destroy()
i:Destroy()
end)
end

function ah.UpdateShape(g)
if ag.Window.NewElements then
local h=aa:GetElementPosition(
g.Elements,
ah.Index,
ag.ParentConfig.ParentTable.__type=="HStack"or ag.ParentConfig.ParentTable.__type=="Group"
)

if h and d then
f:SetType(h)
aw:SetType(h)
az:SetType(h)

b:SetType(h)

end
end
end





return ah
end end function a.D()

local aa=a.load'd'
local ab=aa.New

local ac={}

local ad=a.load'm'.New

function ac.New(ae,af)
af.Hover=false
af.TextOffset=0
af.ParentConfig=af
af.IsButtons=af.Buttons and#af.Buttons>0 and true or false

local ag={
__type="Paragraph",
Title=af.Title or"Paragraph",
Desc=af.Desc or nil,

Locked=af.Locked or false,
}
local ah=a.load'C'(af)

ag.ParagraphFrame=ah
if af.Buttons and#af.Buttons>0 then
local ai=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.UIElements.Container,
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
}),
})

for aj,ak in next,af.Buttons do
local al=ad(
ak.Title,
ak.Icon,
ak.Callback,
ak.Variant or"White",
ai,
nil,
nil,
af.Window.NewElements and 999 or 10
)
al.Size=UDim2.new(1,0,0,38)

end
end

return ag.__type,ag
end

return ac end function a.E()

local aa=a.load'd'local ab=
aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Icon=ae.Icon or"mouse-pointer-click",
IconThemed=ae.IconThemed or false,
IconColor=ae.IconColor or nil,
Color=ae.Color,
Justify=ae.Justify or"Between",
IconAlign=ae.IconAlign or"Right",
Locked=ae.Locked or false,
LockedTitle=ae.LockedTitle,
Callback=ae.Callback or function()end,
UIElements={},
}

local ag=true

af.ButtonFrame=a.load'C'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
Color=af.Color,
Justify=af.Justify,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=ae.Tab,
Index=ae.Index,
ElementTable=af,
ParentConfig=ae,
Size=ae.Size,
Tags=ae.Tags,
}














af.UIElements.ButtonIcon=aa.Image(
af.Icon,
af.Icon,
0,
ae.Window.Folder,
"Button",
not(af.Color or af.IconColor)and true or nil,
af.IconThemed
)

if af.IconColor then
af.UIElements.ButtonIcon.ImageLabel.ImageColor3=af.IconColor
end

af.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
af.UIElements.ButtonIcon.Parent=af.Justify=="Between"and af.ButtonFrame.UIElements.Main
or af.ButtonFrame.UIElements.Container.TitleFrame
af.UIElements.ButtonIcon.LayoutOrder=af.IconAlign=="Left"and-99999 or 99999
af.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
af.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

af.ButtonFrame:Colorize(af.UIElements.ButtonIcon.ImageLabel,"ImageColor3")

function af.Lock(ah)
af.Locked=true
ag=false
return af.ButtonFrame:Lock(af.LockedTitle)
end
function af.Unlock(ah)
af.Locked=false
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.F()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=game:GetService"UserInputService"

function aa.New(af,ag,ah,ai,aj,ak,al)
local am={
GlassSpritesheet={
Id="rbxassetid://77297718671545",
MirroredId="rbxassetid://92258969882244",
Size=Vector2.new(102,128),
Total=80,
Cols=10,
},
}

function am.GetGlassFrame(an,ao:number):(string,Vector2,Vector2)
local ap=am.GlassSpritesheet
local aq:number

if ao<=0.4 then
aq=math.floor((ao/0.4)*(ap.Total-1))
elseif ao<0.6 then
aq=ap.Total-1
else
aq=math.floor(((ao-0.6)/0.4)*(ap.Total-1))
end

aq=math.clamp(aq,0,ap.Total-1)

local ar=ao>=0.6
if ar then
aq=(ap.Total-1)-aq
end

local as=ar and ap.MirroredId or ap.Id

return as,ap.Size,Vector2.new((aq%ap.Cols)*ap.Size.X,math.floor(aq/ap.Cols)*ap.Size.Y)
end

local an=12
local ao
if ag and ag~=""then
ao=ac("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(ag)[1],
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local ap=ac("Frame",{
Size=UDim2.new(0,2,0,26),
BackgroundTransparency=1,
Parent=ai,
})

local aq=ab.NewRoundFrame(an,"Squircle",{
ImageTransparency=0.85,
ThemeTag={
ImageColor3="Text",
},
Parent=ap,
Size=UDim2.new(0,ak and(52)or(40.8),0,24),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
Name="ToggleFrame",
},{
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Toggle",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(an,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
}),
}),


ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(0,ak and 30 or 20,0,20),
Position=UDim2.new(0,2,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar",
},{
ab.New("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
Name="Highlight",
BackgroundTransparency=1,
},{
ab.NewRoundFrame(9999,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
ImageColor3=Color3.new(1,1,1),
Name="SquircleGlass",
ImageTransparency=0.5,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
}),
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="GlassBackground",
ImageTransparency=0,
ThemeTag={
ImageColor3="ElementBackground",
},
ZIndex=-1,
}),
ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Glass",
ImageTransparency=0,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),






ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="BarOverlay",
ThemeTag={
ImageColor3="ToggleBar",
},
ZIndex=999,
}),
}),
ao,
ac("UIScale",{
Scale=1,
}),
}),
}),
ac("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="Hitbox",
Text="",
}),
})

local ar
local as

local at=ak and 30 or 20
local au=aq.Size.X.Offset

function am.Set(av,aw,ax,ay)
if not ay then
if aw then
ad(aq.Frame,0.35,{
Position=UDim2.new(0,au-at-2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.15)

ad(
aq.Frame.Bar.Highlight.Glass,
0.15,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
else
ad(aq.Frame,0.35,{
Position=UDim2.new(0,2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.15)
ad(
aq.Frame.Bar.Highlight.Glass,
0.15,
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
else
if aw then
aq.Frame.Position=UDim2.new(0,au-at-2,0.5,0)
else
aq.Frame.Position=UDim2.new(0,2,0.5,0)
end
end

if aw then
ad(aq.Layer,0.1,{
ImageTransparency=0,
}):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.1)
ad(
aq.Frame.Bar.Highlight.Glass,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if ao then
ad(ao,0.1,{
ImageTransparency=0,
}):Play()
end

local az,aA,aB=am:GetGlassFrame(1)

aq.Frame.Bar.Highlight.Glass.Image=az
aq.Frame.Bar.Highlight.Glass.ImageRectSize=aA
aq.Frame.Bar.Highlight.Glass.ImageRectOffset=aB
else
ad(aq.Layer,0.1,{
ImageTransparency=1,
}):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.1)
ad(
aq.Frame.Bar.Highlight.Glass,
0.1,
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if ao then
ad(ao,0.1,{
ImageTransparency=1,
}):Play()
end

local az,aA,aB=am:GetGlassFrame(0)

aq.Frame.Bar.Highlight.Glass.Image=az
aq.Frame.Bar.Highlight.Glass.ImageRectSize=aA
aq.Frame.Bar.Highlight.Glass.ImageRectOffset=aB
end

ax=ax~=false

task.spawn(function()
if aj and ax then
ab.SafeCallback(aj,aw)
end
end)
end

function am.Animate(av,aw,ax)
if not al.Window.IsToggleDragging then
al.Window.IsToggleDragging=true

local ay=aw.Position.X
local az=aw.Position.Y
local aA=aq.Frame.Position.X.Offset
local aB=false
local b=false

ad(
aq.Frame.Bar.UIScale,
0.28,
{Scale=1.5},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(
aq.Frame.Bar.Highlight.BarOverlay,
0.28,
{ImageTransparency=0.86},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if ar then
ar:Disconnect()
end

ar=ae.InputChanged:Connect(function(d)
if not al.Window.IsToggleDragging then
return
end
if
d.UserInputType~=Enum.UserInputType.MouseMovement
and d.UserInputType~=Enum.UserInputType.Touch
then
return
end
if aB then
return
end

local f=math.abs(d.Position.X-ay)
math.abs(d.Position.Y-az)

if not b and f>8 then
b=true
end

local g=d.Position.X-ay
local h=math.max(2,math.min(aA+g,au-at-2))

local i=math.clamp((h-2)/(au-at-4),0,1)

local l,m,p=am:GetGlassFrame(i)
aq.Frame.Bar.Highlight.Glass.Image=l
aq.Frame.Bar.Highlight.Glass.ImageRectSize=m
aq.Frame.Bar.Highlight.Glass.ImageRectOffset=p

ad(aq.Frame,0.12,{
Position=UDim2.new(0,h,0.5,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

if as then
as:Disconnect()
end

as=ae.InputEnded:Connect(function(d)
if not al.Window.IsToggleDragging then
return
end
if
d.UserInputType~=Enum.UserInputType.MouseButton1
and d.UserInputType~=Enum.UserInputType.Touch
then
return
end

al.Window.IsToggleDragging=false

if ar then
ar:Disconnect()
ar=nil
end
if as then
as:Disconnect()
as=nil
end

al.WindUI.CurrentInput=nil

if aB then
return
end

if not b then
ax:Set(not ax.Value,true,false)
else
local f=aq.Frame.Position.X.Offset
local g=f+at/2
local h=g>au/2
ax:Set(h,true,false)
end

ad(
aq.Frame.Bar.UIScale,
0.23,
{Scale=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(
aq.Frame.Bar.Highlight.BarOverlay,
0.23,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end)
end
end

return ap,am
end

return aa end function a.G()

local aa={}

local ab=a.load'd'local ac=
ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={}

af=af or"sfsymbols:checkmark"

local al=9

local am=ab.Image(
af,
af,
0,
(aj and aj.Window.Folder or"Temp"),
"Checkbox",
true,
false,
"CheckboxIcon"
)
am.Size=UDim2.new(1,-26+ag,1,-26+ag)
am.AnchorPoint=Vector2.new(0.5,0.5)
am.Position=UDim2.new(0.5,0,0.5,0)


local an=ab.NewRoundFrame(al,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ah,
Size=UDim2.new(0,26,0,26),
},{
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Checkbox",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(al,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ThemeTag={
ImageColor3="CheckboxBorder",
ImageTransparency="CheckboxBorderTransparency",
},
},{







}),

am,
},true)

function ak.Set(ao,ap)
if ap then
ad(an.Layer,0.06,{
ImageTransparency=0,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=0,
}):Play()
else
ad(an.Layer,0.05,{
ImageTransparency=1,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ai then
ab.SafeCallback(ai,ap)
end
end)
end

return an,ak
end


return aa end function a.H()
local aa=a.load'd'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'F'.New
local ae=a.load'G'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Locked=ah.Locked or false,
LockedTitle=ah.LockedTitle,
Value=ah.Value,
Icon=ah.Icon or nil,
IconSize=ah.IconSize or 23,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={},
}
ai.ToggleFrame=a.load'C'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=(52),
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
ElementTable=ai,
ParentConfig=ah,
Tags=ah.Tags,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end

function ai.Lock(ak)
ai.Locked=true
aj=false
return ai.ToggleFrame:Lock(ai.LockedTitle)
end
function ai.Unlock(ak)
ai.Locked=false
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(
ak,
ai.Icon,
ai.IconSize,
ai.ToggleFrame.UIElements.Main,
ai.Callback,
ah.Window.NewElements,
ah
)
elseif ai.Type=="Checkbox"then
al,am=ae(
ak,
ai.Icon,
ai.IconSize,
ai.ToggleFrame.UIElements.Main,
ai.Callback,
ah
)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,ah.Window.NewElements and 0 or 0.5)
al.Position=UDim2.new(1,0,ah.Window.NewElements and 0 or 0.5,0)

function ai.Set(an,ao,ap,aq)
if aj then
am:Set(ao,ap,aq or false)
ak=ao
ai.Value=ao
end
end

ai:Set(ak,false,ah.Window.NewElements)

local an=ah.WindUI.GenerateGUID()

if ah.Window.NewElements and am.Animate then
if ai.Type=="Toggle"then
aa.AddSignal(al.ToggleFrame.Hitbox.InputBegan,function(ao)
if
not ah.Window.IsToggleDragging
and(
ao.UserInputType==Enum.UserInputType.MouseButton1
or ao.UserInputType==Enum.UserInputType.Touch
)
then
if ah.WindUI.CurrentInput and ah.WindUI.CurrentInput~=an then
return
end

ah.WindUI.CurrentInput=an
am:Animate(ao,ai)
end
end)
end





else
if ai.Type=="Toggle"then
aa.AddSignal(al.ToggleFrame.Hitbox.MouseButton1Click,function()
ai:Set(not ai.Value,nil,ah.Window.NewElements)
end)
elseif ai.Type=="Checkbox"then
aa.AddSignal(al.MouseButton1Click,function()
ai:Set(not ai.Value,nil,ah.Window.NewElements)
end)
end
end

return ai.__type,ai
end

return af end function a.I()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")
local ad=aa(game:GetService"RunService")

local ae=a.load'd'
local af=ae.New
local ag=ae.Tween

local ah={}

local ai=false

function ah.New(aj,ak)
local al={
__type="Slider",
Title=ak.Title or nil,
Desc=ak.Desc or nil,
Locked=ak.Locked or nil,
LockedTitle=ak.LockedTitle,
Value=ak.Value or{},
Icons=ak.Icons or nil,
IsTooltip=ak.IsTooltip or false,
IsTextbox=ak.IsTextbox,
Step=ak.Step or 1,
Callback=ak.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=ak.Width or 130,
TextBoxWidth=ak.Window.NewElements and 40 or 30,
ThumbSize=13,
IconSize=26,
}
if al.Icons=={}then
al.Icons={
From="sfsymbols:sunMinFill",
To="sfsymbols:sunMaxFill",
}
end
if al.IsTextbox==nil and al.Title==nil then
al.IsTextbox=false
else
al.IsTextbox=al.IsTextbox~=false
end

local am
local an
local ao
local ap=al.Value.Default or al.Value.Min or 0

local aq=ap
local ar=(ap-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0))

local as=true
local at=al.Step%1~=0

local function FormatValue(au)
if at then
return tonumber(string.format("%.2f",au))
end
return math.floor(au+0.5)
end

local function CalculateValue(au)
if at then
return math.floor(au/al.Step+0.5)*al.Step
else
return math.floor(au/al.Step+0.5)*al.Step
end
end

local au,av
local aw=32
if al.Icons then
if al.Icons.From then
au=ae.Image(
al.Icons.From,
al.Icons.From,
0,
ak.Window.Folder,
"SliderIconFrom",
true,
true,
"SliderIconFrom"
)
au.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
if al.Icons.To then
av=ae.Image(
al.Icons.To,
al.Icons.To,
0,
ak.Window.Folder,
"SliderIconTo",
true,
true,
"SliderIconTo"
)
av.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
end
al.SliderFrame=a.load'C'{
Title=al.Title,
Desc=al.Desc,
Parent=ak.Parent,
TextOffset=al.Width,
Hover=false,
Tab=ak.Tab,
Index=ak.Index,
Window=ak.Window,
ElementTable=al,
ParentConfig=ak,
Tags=ak.Tags,
}

al.UIElements.SliderIcon=ae.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.95,
Size=UDim2.new(1,not al.IsTextbox and-aw or(-al.TextBoxWidth-8),0,4),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ar,0,1,0),
ImageTransparency=0.1,
ThemeTag={
ImageColor3="Slider",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(
0,
ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),
0,
ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2)
),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="SliderThumb",
},
Name="Thumb",
},{
ae.NewRoundFrame(999,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=0.5,
}),
}),
}),
})

al.UIElements.SliderContainer=af("Frame",{
Size=UDim2.new(al.Title==nil and 1 or 0,al.Title==nil and 0 or al.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,al.IsTextbox and(ak.Window.NewElements and-16 or 0)or 0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=al.SliderFrame.UIElements.Main,
},{
af("UIListLayout",{
Padding=UDim.new(0,al.Title~=nil and 8 or 12),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=al.Icons
and(al.Icons.From and(al.Icons.To and"Center"or"Left")or al.Icons.To and"Right")
or"Center",
}),
au,
al.UIElements.SliderIcon,
av,
af("TextBox",{
Size=UDim2.new(0,al.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(ap),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
Visible=al.IsTextbox,
}),
})

local ax
if al.IsTooltip then
ax=a.load'B'.New(
ap,
al.UIElements.SliderIcon.Frame.Thumb,
true,
"Secondary",
"Small",
false
)
ax.Container.AnchorPoint=Vector2.new(0.5,1)
ax.Container.Position=UDim2.new(0.5,0,0,-8)
end

function al.Lock(ay)
al.Locked=true
as=false
return al.SliderFrame:Lock(al.LockedTitle)
end
function al.Unlock(ay)
al.Locked=false
as=true
return al.SliderFrame:Unlock()
end

if al.Locked then
al:Lock()
end


local ay=ak.Tab.UIElements.ContainerFrame

function al.Set(az,aA,aB)
if as then
if
not al.IsFocusing
and not ai
and(
not aB
or(
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
)
)
then
if aB then
am=(aB.UserInputType==Enum.UserInputType.Touch)
ay.ScrollingEnabled=false
ai=true

local b=am and aB.Position.X or ac:GetMouseLocation().X
local d=math.clamp(
(b-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aA=CalculateValue(al.Value.Min+d*(al.Value.Max-al.Value.Min))
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(d,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end

an=ad.RenderStepped:Connect(function()
local f=am and aB.Position.X or ac:GetMouseLocation().X
local g=math.clamp(
(f-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aA=CalculateValue(al.Value.Min+g*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(g,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end)


ao=ac.InputEnded:Connect(function(f)
if
(
f.UserInputType==Enum.UserInputType.MouseButton1
or f.UserInputType==Enum.UserInputType.Touch
)and aB==f
then
an:Disconnect()
ao:Disconnect()
ai=false
ay.ScrollingEnabled=true

ak.WindUI.CurrentInput=nil

if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,0.2,{
ImageTransparency=0,
Size=UDim2.new(
0,
ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),
0,
ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end
if ax then
ax:Close(false)
end
end
end)
else
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

local b=math.clamp(
(aA-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0)),
0,
1
)
aA=CalculateValue(al.Value.Min+b*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(b,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end
end
end
end

function al.SetMax(az,aA)
al.Value.Max=aA

local aB=tonumber(al.Value.Default)or aq
if aB>aA then
al:Set(aA)
else
local b=
math.clamp((aB-(al.Value.Min or 0))/(aA-(al.Value.Min or 0)),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(b,0,1,0)}):Play()
end
end

function al.SetMin(az,aA)
al.Value.Min=aA

local aB=tonumber(al.Value.Default)or aq
if aB<aA then
al:Set(aA)
else
local b=math.clamp((aB-aA)/((al.Value.Max or 100)-aA),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(b,0,1,0)}):Play()
end
end

ae.AddSignal(al.UIElements.SliderContainer.TextBox.FocusLost,function(az)
local aA=tonumber(al.UIElements.SliderContainer.TextBox.Text)
if aA then
al:Set(aA)
else
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aq)
if ax then
ax.TitleFrame.Text=FormatValue(aq)
end
end
end)

local az=ak.WindUI.GenerateGUID()

ae.AddSignal(al.UIElements.SliderContainer.InputBegan,function(aA)
if al.Locked or ai then
return
end
if
aA.UserInputType==Enum.UserInputType.MouseButton1
or aA.UserInputType==Enum.UserInputType.Touch
then
if ak.WindUI.CurrentInput and ak.WindUI.CurrentInput~=az then
return
end
ak.WindUI.CurrentInput=az

al:Set(ap,aA)


if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,0.24,{
ImageTransparency=0.85,
Size=UDim2.new(
0,
(ak.Window.NewElements and(al.ThumbSize*2)or al.ThumbSize)+8,
0,
al.ThumbSize+8
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
if ax then
ax:Open()
end

end
end)

return al.__type,al
end

return ah end function a.J()

local aa=a.load'd'
local ac=aa.New
local ad=aa.Tween

local ae={}

local function ToFiniteNumber(af)
local ag=tonumber(af)
if ag==nil or ag~=ag or math.abs(ag)==math.huge then
return nil
end

return ag
end

local function FormatNumber(af)
if af%1==0 then
return tostring(af)
end

return tostring(tonumber(string.format("%.2f",af)))
end

function ae.New(af,ag)
local ah=typeof(ag.Value)=="table"and ag.Value or{}
local ai=ToFiniteNumber(ah.Min)or ToFiniteNumber(ag.Min)or 0
local aj=ToFiniteNumber(ah.Max)or ToFiniteNumber(ag.Max)or 100

if ai>aj then
ai,aj=aj,ai
end

local ak=typeof(ag.Value)=="number"and ag.Value
or ToFiniteNumber(ah.Default)
or ToFiniteNumber(ag.Default)
or ai
ak=ToFiniteNumber(ak)or ai

local al=ag.Indeterminate==true

local am=ag.ShowValue
if am==nil then
am=not al
end

local an=math.max(ToFiniteNumber(ag.ValueWidth)or 44,0)

local ao={
__type="ProgressBar",
Title=ag.Title or"Progress",
Desc=ag.Desc or nil,
Value={
Min=ai,
Max=aj,
Default=math.clamp(ak,ai,aj),
},
ShowValue=am,
DisplayMode=ag.DisplayMode or"Percent",
Format=ag.Format,
Animate=ag.Animate~=false,
AnimationDuration=math.max(ToFiniteNumber(ag.AnimationDuration)or 0.15,0),
Indeterminate=al,
IndeterminateText=ag.IndeterminateText or"",
Speed=math.max(ToFiniteNumber(ag.Speed)or 1,0.01),
ControlGap=math.max(ToFiniteNumber(ag.ControlGap)or 16,0),
UIElements={},

Width=math.max(ToFiniteNumber(ag.Width)or 160,0),
ValueWidth=an,
}

local function GetRatio(ap)
if ao.Value.Max==ao.Value.Min then
return ap>=ao.Value.Max and 1 or 0
end

return math.clamp((ap-ao.Value.Min)/(ao.Value.Max-ao.Value.Min),0,1)
end

local function GetValueText(ap,aq)
if ao.Indeterminate then
return tostring(ao.IndeterminateText)
end

local ar=aq*100

if typeof(ao.Format)=="function"then
local as,at=
pcall(ao.Format,ap,ar,ao.Value.Min,ao.Value.Max)

if as and at~=nil then
return tostring(at)
end
end

if ao.DisplayMode=="Value"then
return FormatNumber(ap)
elseif ao.DisplayMode=="Fraction"then
return FormatNumber(ap).."/"..FormatNumber(ao.Value.Max)
end

return tostring(math.floor(ar+0.5)).."%"
end

ao.ProgressBarFrame=a.load'C'{
Title=ao.Title,
Desc=ao.Desc,
Parent=ag.Parent,
TextOffset=ao.Width+ao.ControlGap,
Hover=false,
Tab=ag.Tab,
Index=ag.Index,
Window=ag.Window,
ElementTable=ao,
ParentConfig=ag,
Tags=ag.Tags,
}

ao.UIElements.Fill=aa.NewRoundFrame(99,"Squircle",{
Name="Fill",
Size=ao.Indeterminate and UDim2.new(0.3,0,1,0)
or UDim2.new(GetRatio(ao.Value.Default),0,1,0),
Position=ao.Indeterminate and UDim2.new(-0.3,0,0,0)or UDim2.new(0,0,0,0),
ThemeTag={
ImageColor3="ProgressBar",
},
})

ao.UIElements.Bar=aa.NewRoundFrame(99,"Squircle",{
Name="Bar",
Size=UDim2.new(1,ao.ShowValue and-(ao.ValueWidth+8)or 0,0,6),
ClipsDescendants=true,
ImageTransparency=0.9,
ThemeTag={
ImageColor3="ProgressBarTrack",
ImageTransparency="ProgressBarTrackTransparency",
},
},{
ao.UIElements.Fill,
})

ao.UIElements.Value=ac("TextLabel",{
Name="Value",
Size=UDim2.new(0,ao.ValueWidth,0,20),
BackgroundTransparency=1,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Text=GetValueText(ao.Value.Default,GetRatio(ao.Value.Default)),
TextSize=14,
TextTransparency=0.25,
TextTruncate="AtEnd",
TextXAlignment="Right",
Visible=ao.ShowValue,
ThemeTag={
TextColor3="ProgressBarText",
},
})

ao.UIElements.Container=ac("Frame",{
Name="ProgressBarContainer",
Size=UDim2.new(0,ao.Width,0,36),
Position=UDim2.new(1,0,ag.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ag.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ao.ProgressBarFrame.UIElements.Main,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Right",
VerticalAlignment="Center",
}),
ao.UIElements.Bar,
ao.UIElements.Value,
})

if ao.Indeterminate then
local ap=ad(
ao.UIElements.Fill,
1/ao.Speed,
{Position=UDim2.new(1,0,0,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut,-1

)
aa.AddSignal(ao.UIElements.Bar.Destroying,function()
ap:Cancel()
end)
ap:Play()
end

local function Update(ap,aq)
local ar=ToFiniteNumber(ap)
if ar==nil then
return ao.Value.Default
end

ar=math.clamp(ar,ao.Value.Min,ao.Value.Max)
ao.Value.Default=ar

local as=GetRatio(ar)
local at=UDim2.new(as,0,1,0)

if ao.UIElements.Fill and not ao.Indeterminate then
if aq or not ao.Animate or ao.AnimationDuration<=0 then
ao.UIElements.Fill.Size=at
else
ad(
ao.UIElements.Fill,
ao.AnimationDuration,
{Size=at},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end

ao.UIElements.Value.Text=GetValueText(ar,as)

return ar
end

function ao.Set(ap,aq)
return Update(aq,false)
end

function ao.Get(ap)
return ao.Value.Default
end

function ao.GetPercentage(ap)
return GetRatio(ao.Value.Default)*100
end

function ao.SetRange(ap,aq,ar)
aq=ToFiniteNumber(aq)
ar=ToFiniteNumber(ar)

if aq==nil or ar==nil then
return ao.Value.Min,ao.Value.Max
end

if aq>ar then
aq,ar=ar,aq
end

ao.Value.Min=aq
ao.Value.Max=ar
Update(ao.Value.Default,false)

return aq,ar
end

function ao.SetMin(ap,aq)
aq=ToFiniteNumber(aq)
if aq==nil then
return ao.Value.Min
end

ao:SetRange(aq,math.max(aq,ao.Value.Max))
return ao.Value.Min
end

function ao.SetMax(ap,aq)
aq=ToFiniteNumber(aq)
if aq==nil then
return ao.Value.Max
end

ao:SetRange(math.min(ao.Value.Min,aq),aq)
return ao.Value.Max
end

Update(ao.Value.Default,true)

return ao.__type,ao
end

return ae end function a.K()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")

local ad=a.load'd'
local ae=ad.New local af=
ad.Tween

local ag={
UICorner=6,
UIPadding=8,
}

local ah=a.load'w'.New

function ag.New(ai,aj)
local function NormalizeKeyCode(ak)
if typeof(ak)=="EnumItem"then
return ak.Name
elseif type(ak)=="string"then
return ak
else
return"F"
end
end

local ak={
__type="Keybind",
Title=aj.Title or"Keybind",
Desc=aj.Desc or nil,
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
Value=NormalizeKeyCode(aj.Value)or"F",
Callback=aj.Callback or function()end,
CanChange=aj.CanChange~=false,
Blacklist=aj.Blacklist or{},
Picking=false,
UIElements={},
}

local al={}

for am,an in next,ak.Blacklist do
table.insert(al,Enum.KeyCode[NormalizeKeyCode(an)])
end
table.insert(al,Enum.KeyCode[NormalizeKeyCode"Escape"])

local am=true

ak.KeybindFrame=a.load'C'{
Title=ak.Title,
Desc=ak.Desc,
Parent=aj.Parent,
TextOffset=85,
Hover=ak.CanChange,
Tab=aj.Tab,
Index=aj.Index,
Window=aj.Window,
ElementTable=ak,
ParentConfig=aj,
Tags=aj.Tags,
}

ak.UIElements.Keybind=ah(
ak.Value,
nil,
ak.KeybindFrame.UIElements.Main,
nil,
aj.Window.NewElements and 12 or 10
)

ak.UIElements.Keybind.Size=
UDim2.new(0,24+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
ak.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
ak.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)
ak.UIElements.Keybind.Interactable=false

ae("UIScale",{
Parent=ak.UIElements.Keybind,
Scale=0.85,
})

ad.AddSignal(
ak.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",
function()
ak.UIElements.Keybind.Size=
UDim2.new(0,24+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
end
)

function ak.Lock(an)
ak.Locked=true
am=false
return ak.KeybindFrame:Lock(ak.LockedTitle)
end
function ak.Unlock(an)
ak.Locked=false
am=true
return ak.KeybindFrame:Unlock()
end

function ak.Set(an,ao)
local ap=NormalizeKeyCode(ao)
ak.Value=ap
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=ap
end

if ak.Locked then
ak:Lock()
end

local an

ad.AddSignal(ak.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if am then
if ak.CanChange then
ak.Picking=true
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."



local ao
ao=ac.InputBegan:Connect(function(ap)
local aq

if ap.UserInputType==Enum.UserInputType.Keyboard then
if table.find(al,ap.KeyCode)then
aq=nil
return
else
aq=ap.KeyCode.Name
end
elseif
ap.UserInputType==Enum.UserInputType.MouseButton1
and not table.find(al,"MouseLeftButton")
then
aq="MouseLeftButton"
elseif
ap.UserInputType==Enum.UserInputType.MouseButton2
and not table.find(al,"MouseRightButton")
then
aq="MouseRightButton"
end

if an then
an:Disconnect()
end

an=ac.InputEnded:Connect(function(ar)
if
aq
and(
ar.KeyCode.Name==aq
or aq=="MouseLeft"and ar.UserInputType==Enum.UserInputType.MouseButton1
or aq=="MouseRight"and ar.UserInputType==Enum.UserInputType.MouseButton2
)
then
ak.Picking=false

ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=aq
ak.Value=aq

ao:Disconnect()
an:Disconnect()
end
end)
end)
end
end
end)

ad.AddSignal(ac.InputBegan,function(ao,ap)
if ac:GetFocusedTextBox()then
return
end
if not am then
return
end
if ak.Picking then
return
end

if ao.UserInputType==Enum.UserInputType.Keyboard then
if ao.KeyCode.Name==ak.Value then
ad.SafeCallback(ak.Callback,ao.KeyCode.Name)
end
elseif ao.UserInputType==Enum.UserInputType.MouseButton1 and ak.Value=="MouseLeft"then
ad.SafeCallback(ak.Callback,"MouseLeft")
elseif ao.UserInputType==Enum.UserInputType.MouseButton2 and ak.Value=="MouseRight"then
ad.SafeCallback(ak.Callback,"MouseRight")
end
end)

return ak.__type,ak
end

return ag end function a.L()

local aa=a.load'd'local ac=
aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'm'

.New
local ag=a.load'n'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
LockedTitle=ai.LockedTitle,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local ak=true

aj.InputFrame=a.load'C'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=aj.Width,
Hover=false,
Tab=ai.Tab,
Index=ai.Index,
Window=ai.Window,
ElementTable=aj,
ParentConfig=ai,
Tags=ai.Tags,
}

local al=ag(
aj.Placeholder,
aj.InputIcon,
aj.Type=="Textarea"and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,
aj.Type,
function(al)
aj:Set(al,true)
end,
nil,
ai.Window.NewElements and 12 or 10,
aj.ClearTextOnFocus
)

if aj.Type~="Textarea"then
al.Size=UDim2.new(0,aj.Width,0,36)
al.Position=UDim2.new(1,0,ai.Window.NewElements and 0 or 0.5,0)
al.AnchorPoint=Vector2.new(1,ai.Window.NewElements and 0 or 0.5)
else
al.Size=UDim2.new(1,0,0,148)
end






function aj.Lock(am)
aj.Locked=true
ak=false
return aj.InputFrame:Lock(aj.LockedTitle)
end
function aj.Unlock(am)
aj.Locked=false
ak=true
return aj.InputFrame:Unlock()
end

function aj.Set(am,an,ao)
if ak then
aj.Value=an
aa.SafeCallback(aj.Callback,an)

if not ao then
al.Frame.Frame.TextBox.Text=an
end
end
end

function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.M()

local aa=a.load'd'
local ae=aa.New

local af={}

function af.New(ag,ah)
local ai=ae("Frame",{
Size=ah.ParentType~="Group"and UDim2.new(1,0,0,1)or UDim2.new(0,1,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local aj=ae("Frame",{
Parent=ah.Parent,
Size=ah.ParentType~="Group"and UDim2.new(1,-7,0,7)or UDim2.new(0,7,1,-7),
BackgroundTransparency=1,
},{
ai
})

return"Divider",{__type="Divider",ElementFrame=aj}
end

return af end function a.N()
local aa={}

local ae=(cloneref or clonereference or function(ae)
return ae
end)

local af=ae(game:GetService"UserInputService")
local ag=ae(game:GetService"Players").LocalPlayer:GetMouse()
local ah=ae(game:GetService"Workspace").CurrentCamera local ai=

workspace.CurrentCamera

local aj=a.load'n'.New

local ak=a.load'd'
local al=ak.New
local am=ak.Tween

local an=0.67

function aa.New(ao,ap,aq,ar)
local as={}

if not ap.Callback then
ar="Menu"
end

ap.UIElements.UIListLayout=al("UIListLayout",{
Padding=UDim.new(0,aq.MenuPadding/1.5),
FillDirection="Vertical",
HorizontalAlignment="Center",
})

ap.UIElements.Menu=ak.NewRoundFrame(aq.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="DropdownBackground",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
al("UIPadding",{
PaddingTop=UDim.new(0,aq.MenuPadding),
PaddingLeft=UDim.new(0,aq.MenuPadding),
PaddingRight=UDim.new(0,aq.MenuPadding),
PaddingBottom=UDim.new(0,aq.MenuPadding),
}),
al("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,aq.MenuPadding),
}),
al("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,ap.SearchBarEnabled and-aq.MenuPadding-aq.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
Name="Frame",
},{
al("UICorner",{
CornerRadius=UDim.new(0,aq.MenuCorner-aq.MenuPadding),
}),
al("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
ap.UIElements.UIListLayout,
}),
}),
})

ap.UIElements.MenuCanvas=al("Frame",{
Size=UDim2.new(0,ap.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=ao.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
ap.UIElements.Menu,
al("UISizeConstraint",{
MinSize=Vector2.new(170,0),
MaxSize=Vector2.new(300,400),
}),
})

local function RecalculateCanvasSize()
ap.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=
UDim2.fromOffset(0,ap.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
local at=ao.WindUI.DropdownGui.AbsoluteSize.Y

local au=ap.UIElements.UIListLayout.AbsoluteContentSize.Y/ao.UIScale
local av=ap.SearchBarEnabled and(aq.SearchBarHeight+(aq.MenuPadding*3))
or(aq.MenuPadding*2)
local aw=au+av

if aw>at then
ap.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ap.UIElements.MenuCanvas.AbsoluteSize.X,at)
else
ap.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ap.UIElements.MenuCanvas.AbsoluteSize.X,aw)
end
end

function UpdatePosition()
local at=ap.UIElements.Dropdown or ap.DropdownFrame.UIElements.Main
local au=ap.UIElements.MenuCanvas

local av=ah.ViewportSize.Y
-(at.AbsolutePosition.Y+at.AbsoluteSize.Y)
-aq.MenuPadding
-54
local aw=au.AbsoluteSize.Y+aq.MenuPadding

local ax=-54
if av<aw then
ax=aw-av-54
end

au.Position=UDim2.new(
0,
at.AbsolutePosition.X+at.AbsoluteSize.X,
0,
at.AbsolutePosition.Y+at.AbsoluteSize.Y-ax+(aq.MenuPadding*2)
)
end

local at

function as.Display(au)
local av=ap.Values
local aw=""

if ap.Multi then
local ax={}
if typeof(ap.Value)=="table"then
for ay,az in ipairs(ap.Value)do
local aA=typeof(az)=="table"and az.Title or az
ax[aA]=true
end
end

for ay,az in ipairs(av)do
local aA=typeof(az)=="table"and az.Title or az
if ax[aA]then
aw=aw..aA..", "
end
end

if#aw>0 then
aw=aw:sub(1,#aw-2)
end
else
aw=typeof(ap.Value)=="table"and(ap.Value.Title or ap.Value[1])
or ap.Value
or""
end

if ap.UIElements.Dropdown then
ap.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(aw==""and"--"or aw)
end
end

local function Callback(au)
as:Display()
if ap.Locked then
return
end

if ap.Callback then
task.spawn(function()
if ap.Locked then
return
end
ak.SafeCallback(ap.Callback,ap.Value)
end)
else
task.spawn(function()
if ap.Locked then
return
end
ak.SafeCallback(au)
end)
end
end

function as.LockValues(au,av)
if not av then
return
end

for aw,ax in next,ap.Tabs do
if ax and ax.UIElements and ax.UIElements.TabItem then
local ay=ax.Name
local az=false

for aA,aB in next,av do
if ay==aB then
az=true
break
end
end

if az then
am(ax.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.6}):Play()
if ax.UIElements.TabIcon then
am(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.6}):Play()
end

ax.UIElements.TabItem.Active=false
ax.Locked=true
else
if ax.Selected then
am(ax.UIElements.TabItem,0.1,{ImageTransparency=an}):Play()

am(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ax.UIElements.TabIcon then
am(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
else
am(ax.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(
ax.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=ar=="Dropdown"and 0.4 or 0.05}
):Play()
if ax.UIElements.TabIcon then
am(
ax.UIElements.TabIcon.ImageLabel,
0.1,
{ImageTransparency=ar=="Dropdown"and 0.2 or 0}
):Play()
end
end

ax.UIElements.TabItem.Active=true
ax.Locked=false
end
end
end
end

function as.Refresh(au,av)
if ao.Window.Destroyed then
return
end

for aw,ax in next,ap.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not ax:IsA"UIListLayout"then
ax:Destroy()
end
end

ap.Tabs={}

if ap.SearchBarEnabled then
if not at then
at=aj("Search...","search",ap.UIElements.Menu,nil,function(aw)
for ax,ay in next,ap.Tabs do
if string.find(string.lower(ay.Name),string.lower(aw),1,true)then
ay.UIElements.TabItem.Visible=true
else
ay.UIElements.TabItem.Visible=false
end
RecalculateListSize()
RecalculateCanvasSize()
end
end,true)
at.Size=UDim2.new(1,0,0,aq.SearchBarHeight)
at.Position=UDim2.new(0,0,0,0)
at.Name="SearchBar"
end
end

for aw,ax in next,av do
if ax.Type~="Divider"then
local ay={
Name=typeof(ax)=="table"and ax.Title or ax,
Desc=typeof(ax)=="table"and ax.Desc or nil,
Icon=typeof(ax)=="table"and ax.Icon or nil,
IconSize=typeof(ax)=="table"and ax.IconSize or nil,
Original=ax,
Selected=false,
Locked=typeof(ax)=="table"and ax.Locked or false,
UIElements={},
}
local az
if ay.Icon then
az=ak.Image(ay.Icon,ay.Icon,0,ao.Window.Folder,"Dropdown",true)
az.Size=
UDim2.new(0,ay.IconSize or aq.TabIcon,0,ay.IconSize or aq.TabIcon)
az.ImageLabel.ImageTransparency=ar=="Dropdown"and 0.2 or 0
ay.UIElements.TabIcon=az
end
ay.UIElements.TabItem=ak.NewRoundFrame(
aq.MenuCorner-aq.MenuPadding,
"Squircle",
{
Size=UDim2.new(1,0,0,36),
AutomaticSize=ay.Desc and"Y",
ImageTransparency=1,
Parent=ap.UIElements.Menu.Frame.ScrollingFrame,

ThemeTag={
ImageColor3="DropdownTabBackground",
},
Active=not ay.Locked,
},
{
ak.NewRoundFrame(aq.MenuCorner-aq.MenuPadding,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="DropdownTabBorder",
},
ImageTransparency=1,
Name="Highlight",
},{













}),
al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("UIListLayout",{
Padding=UDim.new(0,aq.TabPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,aq.TabPadding),
PaddingLeft=UDim.new(0,aq.TabPadding),
PaddingRight=UDim.new(0,aq.TabPadding),
PaddingBottom=UDim.new(0,aq.TabPadding),
}),
al("UICorner",{
CornerRadius=UDim.new(0,aq.MenuCorner-aq.MenuPadding),
}),
az,
al("Frame",{
Size=UDim2.new(1,az and-aq.TabPadding-aq.TabIcon or 0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Name="Title",
},{
al("TextLabel",{
Text=ay.Name,
TextXAlignment="Left",
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=ar=="Dropdown"and 0.4 or 0.05,
LayoutOrder=999,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
}),
al("TextLabel",{
Text=ay.Desc or"",
TextXAlignment="Left",
FontFace=Font.new(ak.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=ar=="Dropdown"and 0.6 or 0.35,
LayoutOrder=999,
AutomaticSize="Y",
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
Visible=ay.Desc and true or false,
Name="Desc",
}),
al("UIListLayout",{
Padding=UDim.new(0,aq.TabPadding/3),
FillDirection="Vertical",
}),
}),
}),
},
true
)

if ay.Locked then
ay.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0.6
if ay.UIElements.TabIcon then
ay.UIElements.TabIcon.ImageLabel.ImageTransparency=0.6
end
end

if ap.Multi and typeof(ap.Value)=="string"then
for aA,aB in next,ap.Values do
if typeof(aB)=="table"then
if aB.Title==ap.Value then
ap.Value={aB}
end
else
if aB==ap.Value then
ap.Value={ap.Value}
end
end
end
end

if ap.Multi then
local aA=false
if typeof(ap.Value)=="table"then
for aB,b in ipairs(ap.Value)do
local d=typeof(b)=="table"and b.Title or b
if d==ay.Name then
aA=true
break
end
end
end
ay.Selected=aA
else
local aA=typeof(ap.Value)=="table"and ap.Value.Title or ap.Value
ay.Selected=aA==ay.Name
end

if ay.Selected and not ay.Locked then
ay.UIElements.TabItem.ImageTransparency=an

ay.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0
if ay.UIElements.TabIcon then
ay.UIElements.TabIcon.ImageLabel.ImageTransparency=0
end
end

ap.Tabs[aw]=ay

as:Display()

if ar=="Dropdown"then
ak.AddSignal(ay.UIElements.TabItem.MouseButton1Click,function()
if ap.Locked or ay.Locked then
return
end

if ap.Multi then
if not ay.Selected then
ay.Selected=true
am(
ay.UIElements.TabItem,
0.1,
{ImageTransparency=an}
):Play()

am(ay.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ay.UIElements.TabIcon then
am(ay.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
table.insert(ap.Value,ay.Original)
else
if not ap.AllowNone and#ap.Value==1 then
return
end
ay.Selected=false
am(ay.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(ay.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.4}):Play()
if ay.UIElements.TabIcon then
am(ay.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end

for aA,aB in next,ap.Value do
if typeof(aB)=="table"and(aB.Title==ay.Name)or(aB==ay.Name)then
table.remove(ap.Value,aA)
break
end
end
end
else
for aA,aB in next,ap.Tabs do
am(aB.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(
aB.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=0.4}
):Play()
if aB.UIElements.TabIcon then
am(aB.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end
aB.Selected=false
end
ay.Selected=true
am(ay.UIElements.TabItem,0.1,{ImageTransparency=an}):Play()

am(ay.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ay.UIElements.TabIcon then
am(ay.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
ap.Value=ay.Original
end
Callback()
end)
elseif ar=="Menu"then
if not ay.Locked then
ak.AddSignal(ay.UIElements.TabItem.MouseEnter,function()
am(ay.UIElements.TabItem,0.08,{ImageTransparency=an}):Play()
end)
ak.AddSignal(ay.UIElements.TabItem.InputEnded,function()
am(ay.UIElements.TabItem,0.08,{ImageTransparency=1}):Play()
end)
end
ak.AddSignal(ay.UIElements.TabItem.MouseButton1Click,function()
if ap.Locked or ay.Locked then
return
end
Callback(ax.Callback or function()end)
end)
end

RecalculateCanvasSize()
RecalculateListSize()
else a.load'M'
:New{Parent=ap.UIElements.Menu.Frame.ScrollingFrame}
end
end










ap.UIElements.MenuCanvas.Size=UDim2.new(
0,
ap.MenuWidth+6+6+5+5+18+6+6,
ap.UIElements.MenuCanvas.Size.Y.Scale,
ap.UIElements.MenuCanvas.Size.Y.Offset
)
Callback()

ap.Values=av
end

as:Refresh(ap.Values)

function as.Select(au,av)
if av then
ap.Value=av
else
if ap.Multi then
ap.Value={}
else
ap.Value=nil
end
end
as:Refresh(ap.Values)
end

RecalculateListSize()
RecalculateCanvasSize()

function as.Open(au)
if not ap.Locked then
ap.UIElements.Menu.Visible=true
ap.UIElements.MenuCanvas.Visible=true
ap.UIElements.MenuCanvas.Active=true
ap.UIElements.Menu.Size=UDim2.new(1,0,0,0)
am(ap.UIElements.Menu,0.1,{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
if ap.Locked then
return
end
ap.Opened=true
end)

UpdatePosition()
end
end

function as.Close(au)
ap.Opened=false

am(ap.UIElements.Menu,0.25,{
Size=UDim2.new(1,0,0,0),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
ap.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(0.25)
ap.UIElements.MenuCanvas.Visible=false
ap.UIElements.MenuCanvas.Active=false
end)
end

ak.AddSignal(
(
ap.UIElements.Dropdown and ap.UIElements.Dropdown.MouseButton1Click
or ap.DropdownFrame.UIElements.Main.MouseButton1Click
),
function()
as:Open()
end
)

ak.AddSignal(af.InputBegan,function(au)
if
au.UserInputType==Enum.UserInputType.MouseButton1
or au.UserInputType==Enum.UserInputType.Touch
then
local av=ap.UIElements.MenuCanvas
local aw,ax=av.AbsolutePosition,av.AbsoluteSize

local ay=ap.UIElements.Dropdown or ap.DropdownFrame.UIElements.Main
local az=ay.AbsolutePosition
local aA=ay.AbsoluteSize

local aB=ag.X>=az.X
and ag.X<=az.X+aA.X
and ag.Y>=az.Y
and ag.Y<=az.Y+aA.Y

local b=ag.X>=aw.X
and ag.X<=aw.X+ax.X
and ag.Y>=aw.Y
and ag.Y<=aw.Y+ax.Y

if ao.Window.CanDropdown and ap.Opened and not aB and not b then
as:Close()
end
end
end)

ak.AddSignal(
ap.UIElements.Dropdown and ap.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition"
or ap.DropdownFrame.UIElements.Main:GetPropertyChangedSignal"AbsolutePosition",
UpdatePosition
)

return as
end

return aa end function a.O()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local ae=
aa(game:GetService"Workspace").CurrentCamera

local af=a.load'd'
local ag=af.New local ah=
af.Tween

local ai=a.load'w'.New local aj=a.load'n'
.New
local ak=a.load'N'.New local al=

workspace.CurrentCamera

local am={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
SearchBarHeight=39,
TabIcon=18,
}

function am.New(an,ao)
local ap={
__type="Dropdown",
Title=ao.Title or"Dropdown",
Desc=ao.Desc or nil,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Values=ao.Values or{},
MenuWidth=ao.MenuWidth or 180,
Value=ao.Value,
AllowNone=ao.AllowNone,
SearchBarEnabled=ao.SearchBarEnabled or false,
Multi=ao.Multi,
Callback=ao.Callback or nil,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if ap.Multi and not ap.Value then
ap.Value={}
end
if ap.Values and typeof(ap.Value)=="number"then
ap.Value=ap.Values[ap.Value]
end

ap.DropdownFrame=a.load'C'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Callback and ap.Width or 20,
Hover=not ap.Callback and true or false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

if ap.Callback then
ap.UIElements.Dropdown=
ai("",nil,ap.DropdownFrame.UIElements.Main,nil,ao.Window.NewElements and 12 or 10)

ap.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
ap.UIElements.Dropdown.Frame.Frame.TextLabel.Size=
UDim2.new(1,ap.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

ap.UIElements.Dropdown.Size=UDim2.new(0,ap.Width,0,36)
ap.UIElements.Dropdown.Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0)
ap.UIElements.Dropdown.AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5)





end

ap.DropdownMenu=ak(ao,ap,am,"Dropdown")

ap.Display=ap.DropdownMenu.Display
ap.Refresh=ap.DropdownMenu.Refresh
ap.Select=ap.DropdownMenu.Select
ap.Open=ap.DropdownMenu.Open
ap.Close=ap.DropdownMenu.Close

ag("ImageLabel",{
Image=af.Icon"chevrons-up-down"[1],
ImageRectOffset=af.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=af.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,ap.UIElements.Dropdown and-12 or 0,0.5,0),
ThemeTag={
ImageColor3="Icon",
},
AnchorPoint=Vector2.new(1,0.5),
Parent=ap.UIElements.Dropdown and ap.UIElements.Dropdown.Frame
or ap.DropdownFrame.UIElements.Main,
})

function ap.Lock(aq)
ap.Locked=true
if ap.Opened or ap.UIElements.MenuCanvas.Visible then
ap:Close()
end
return ap.DropdownFrame:Lock(ap.LockedTitle)
end
function ap.Unlock(aq)
ap.Locked=false
return ap.DropdownFrame:Unlock()
end

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.P()




local aa={}
local af={
lua={
"and",
"break",
"or",
"else",
"elseif",
"if",
"then",
"until",
"repeat",
"while",
"do",
"for",
"in",
"end",
"local",
"return",
"function",
"export",
},
rbx={
"game",
"workspace",
"script",
"math",
"string",
"table",
"task",
"wait",
"select",
"next",
"Enum",
"tick",
"assert",
"shared",
"loadstring",
"tonumber",
"tostring",
"type",
"typeof",
"unpack",
"Instance",
"CFrame",
"Vector3",
"Vector2",
"Color3",
"UDim",
"UDim2",
"Ray",
"BrickColor",
"OverlapParams",
"RaycastParams",
"Axes",
"Random",
"Region3",
"Rect",
"TweenInfo",
"collectgarbage",
"not",
"utf8",
"pcall",
"xpcall",
"_G",
"setmetatable",
"getmetatable",
"os",
"pairs",
"ipairs",
},
operators={
"#",
"+",
"-",
"*",
"%",
"/",
"^",
"=",
"~",
"=",
"<",
">",
},
}

local ag={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(ai)
local ak={}
for al,am in ipairs(ai)do
ak[am]=true
end
return ak
end

local ai=createKeywordSet(af.lua)
local ak=createKeywordSet(af.rbx)
local al=createKeywordSet(af.operators)

local function getHighlight(am,an)
local ao=am[an]

if ag[ao.."_color"]then
return ag[ao.."_color"]
end

if tonumber(ao)then
return ag.numbers
elseif ao=="nil"then
return ag.null
elseif ao:sub(1,2)=="--"then
return ag.comment
elseif al[ao]then
return ag.operator
elseif ai[ao]then
return ag.lua
elseif ak[ao]then
return ag.rbx
elseif ao:sub(1,1)=='"'or ao:sub(1,1)=="'"then
return ag.str
elseif ao=="true"or ao=="false"then
return ag.boolean
end

if am[an+1]=="("then
if am[an-1]==":"then
return ag.self_call
end

return ag.call
end

if am[an-1]=="."then
if am[an-2]=="Enum"then
return ag.rbx
end

return ag.local_property
end
end

function aa.run(am,an)
if an~=nil then
for ao,ap in next,an do
ag[ao]=ap
end
end

local ao={}
local ap=""

local aq=false
local ar=false
local as=false

for at=1,#am do
local au=am:sub(at,at)

if ar then
if au=="\n"and not as then
table.insert(ao,ap)
table.insert(ao,au)
ap=""

ar=false
elseif am:sub(at-1,at)=="]]"and as then
ap=ap.."]"

table.insert(ao,ap)
ap=""

ar=false
as=false
else
ap=ap..au
end
elseif aq then
if au==aq and am:sub(at-1,at-1)~="\\"or au=="\n"then
ap=ap..au
aq=false
else
ap=ap..au
end
else
if am:sub(at,at+1)=="--"then
table.insert(ao,ap)
ap="-"
ar=true
as=am:sub(at+2,at+3)=="[["
elseif au=='"'or au=="'"then
table.insert(ao,ap)
ap=au
aq=au
elseif al[au]then
table.insert(ao,ap)
table.insert(ao,au)
ap=""
elseif au:match"[%w_]"then
ap=ap..au
else
table.insert(ao,ap)
table.insert(ao,au)
ap=""
end
end
end

table.insert(ao,ap)

local at={}

for au,av in ipairs(ao)do
local aw=getHighlight(ao,au)

if aw then
local ax=string.format(
'<font color = "#%s">%s</font>',
aw:ToHex(),
av:gsub("<","&lt;"):gsub(">","&gt;")
)

table.insert(at,ax)
else
table.insert(at,av)
end
end

return table.concat(at)
end

return aa end function a.Q()

local aa={}

local af=a.load'd'
local ag=af.New
local ai=af.Tween

local ak=a.load'P'

function aa.New(al,am,an,ao,ap)
local aq={
Radius=am.ElementConfig.UICorner,
Padding=am.NewElements and am.ElementConfig.UIPadding+4 or am.ElementConfig.UIPadding,

CodeFrame=nil,
}

local ar=ag("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=al.CodeSize,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding+3),
PaddingLeft=UDim.new(0,aq.Padding+3),
PaddingRight=UDim.new(0,aq.Padding+3),
PaddingBottom=UDim.new(0,aq.Padding+3),
}),
})
ar.Font="Code"

local as=ag("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize=al.Height~=nil and"XY"or"X",
ScrollingDirection=al.Height~=nil and"XY"or"X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
ar,
})

local at=al.CanCopied
and ag("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,35,0,35),
Position=UDim2.new(1,-aq.Padding/2,0,aq.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ao and true or false,
},{
af.NewRoundFrame(aq.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ag("UIScale",{
Scale=1,
}),
ag("ImageLabel",{
Image=af.Icon"copy"[1],
ImageRectSize=af.Icon"copy"[2].ImageRectSize,
ImageRectOffset=af.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.1,
}),
}),
})
or nil

local au,av=af.NewRoundFrame(aq.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.955,
Visible=false,
})

local aw,ax=af.NewRoundFrame(aq.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.96,
Size=UDim2.new(1,0,0,20+(aq.Padding*2)),
Visible=al.Title and true or false,
},{










ag("TextLabel",{
Text=al.Title,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=0.2,
TextSize=18,
AutomaticSize="Y",
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,at and-20-(aq.Padding*2),0,0),
}),
ag("UIPadding",{

PaddingLeft=UDim.new(0,aq.Padding+3),
PaddingRight=UDim.new(0,aq.Padding+3),

}),
ag("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local ay,az=af.NewRoundFrame(aq.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=0.035,
Size=al.Height~=nil
and UDim2.new(1,0,al.Height.Scale,al.Height.Offset==0 and-40 or al.Height.Offset)
or UDim2.new(1,0,0,20+(aq.Padding*2)),
AutomaticSize=al.Height~=nil and"None"or"Y",
Parent=an,
},{
au,
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,al.Height~=nil and 1 or 0,0),
AutomaticSize=al.Height~=nil and"None"or"Y",
},{
aw,
as,
ag("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
at,
},nil,true)

aq.CodeFrame=ay
aq.CodeFrameModule=az
aq.OutlineFrame=au
aq.OutlineFrameModule=av
aq.TopbarFrame=aw
aq.TopbarFrameModule=ax

af.AddSignal(ar:GetPropertyChangedSignal"TextBounds",function()
if al.Height~=nil then
as.Size=UDim2.new(1,0,1,al.Title~=nil and-(20+(aq.Padding*2))or nil)
else
as.Size=
UDim2.new(1,0,0,(ar.TextBounds.Y/(ap or 1))+((aq.Padding+3)*2))
end
end)

function aq.Set(aA)
ar.Text=ak.run(aA,al.CodeTheme)
end

function aq.Destroy()
ay:Destroy()
aq=nil
end

aq.Set(al.Code)

if at then
af.AddSignal(at.InputBegan,function(aA:InputObject)
if
aA.UserInputType==Enum.UserInputType.MouseButton1
or aA.UserInputType==Enum.UserInputType.Touch
then
ai(at.Button,0.05,{ImageTransparency=0.95}):Play()
ai(at.Button.UIScale,0.05,{Scale=0.9}):Play()
end
end)
af.AddSignal(at.InputEnded,function()
ai(at.Button,0.08,{ImageTransparency=1}):Play()
ai(at.Button.UIScale,0.08,{Scale=1}):Play()
end)
af.AddSignal(at.MouseButton1Click,function()
if ao then
ao()
local aA=af.Icon"check"
at.Button.ImageLabel.Image=aA[1]
at.Button.ImageLabel.ImageRectSize=aA[2].ImageRectSize
at.Button.ImageLabel.ImageRectOffset=aA[2].ImageRectPosition

task.delay(1,function()
local aB=af.Icon"copy"
at.Button.ImageLabel.Image=aB[1]
at.Button.ImageLabel.ImageRectSize=aB[2].ImageRectSize
at.Button.ImageLabel.ImageRectOffset=aB[2].ImageRectPosition
end)
end
end)
end

return aq
end

return aa end function a.R()

local aa=a.load'd'local af=
aa.New


local ag=a.load'Q'

local ai={}

function ai.New(ak,al)
local am={
__type="Code",
Title=al.Title,
Code=al.Code,
CodeSize=al.CodeSize or 18,
Height=al.Height,
CodeTheme=al.CodeTheme,
Locked=false,
CanCopied=al.CanCopied~=false,
OnCopy=al.OnCopy,

Index=al.Index,
}

local an=not am.Locked











local ao=ag.New(am,al.Window,al.Parent,function()
if an then
local ao=am.Title or"code"
local ap,aq=pcall(function()
if toclipboard then
toclipboard(am.Code)
end
if setclipboard then
setclipboard(am.Code)
end

if am.OnCopy then
am.OnCopy()
end
end)
if not ap then
al.WindUI:Notify{
Title="Error",
Content="The "..ao.." is not copied. Error: "..aq,
Icon="x",
Duration=5,
}
end
end
end,al.WindUI.UIScale)

function am.SetCode(ap,aq)
ao.Set(aq)
am.Code=aq
end

function am.Set(ap,aq)
return am.SetCode(aq)
end

function am.Destroy(ap)
ao.Destroy()
am=nil
end

function am.UpdateShape(ap)
if al.Window.NewElements then
local aq=aa:GetElementPosition(
ap.Elements,
am.Index,
al.ParentType=="HStack"or al.ParentType=="Group"
)

if aq and ao.CodeFrameModule then
ao.CodeFrameModule:SetType(aq)

print(aq)
ao.TopbarFrameModule:SetType(
table.find({"Squircle-BL-BR","SquircleH-BL-BR"},aq)~=nil and"Square"or aq
)
end
end
end

am.UIElements={Main=ao.CodeFrame}
am.ElementFrame=ao.CodeFrame

return am.__type,am
end

return ai end function a.S()

local aa=a.load'd'
local af=aa.New local ag=
aa.Tween

local ai=(cloneref or clonereference or function(ai)
return ai
end)

local ak=ai(game:GetService"UserInputService")
ai(game:GetService"TouchInputService")
local al=ai(game:GetService"RunService")
local am=ai(game:GetService"Players")local an=

al.RenderStepped
local ao=am.LocalPlayer
local ap=ao:GetMouse()

local aq=a.load'm'.New
local ar=a.load'n'.New

local as={
UICorner=9,

}

local at

function as.Colorpicker(au,av,aw,ax,ay)
local az={
__type="Colorpicker",
Title=av.Title,
Desc=av.Desc,
Default=av.Value or av.Default,
Callback=av.Callback,
Transparency=av.Transparency,
UIElements=av.UIElements,

TextPadding=10,
}

local aA={}
local aB=az.Transparency~=nil

function az.SetHSVFromRGB(b,d)
local f,g,h=Color3.toHSV(d)
az.Hue=f
az.Sat=g
az.Vib=h
end

az:SetHSVFromRGB(az.Default)

local b=a.load'o'
local d=b.Create(nil,"Dialog",aw,ax,aw.UIElements.Main.Main)

az.ColorpickerFrame=d

d.UIElements.Main.Size=UDim2.new(1,0,0,0)



local f,g,h=az.Hue,az.Sat,az.Vib

az.UIElements.Title=af("TextLabel",{
Text=az.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=d.UIElements.Main,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,az.TextPadding/2),
PaddingLeft=UDim.new(0,az.TextPadding/2),
PaddingRight=UDim.new(0,az.TextPadding/2),
PaddingBottom=UDim.new(0,az.TextPadding/2),
}),
})





local i=af("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local l=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=i,
BackgroundColor3=az.Default,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

az.UIElements.SatVibMap=af("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+az.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(f,1,1),
BackgroundTransparency=0,
Parent=d.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),

l,
})

az.UIElements.Inputs=af("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(
aB and 240 or 210,
40+az.TextPadding
),
BackgroundTransparency=1,
Parent=d.UIElements.Main,
},{
af("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
}),
})





local m=af("Frame",{
BackgroundColor3=az.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=az.Transparency,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

af("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+az.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=d.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),







m,
})

local p=af("Frame",{
BackgroundColor3=az.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

af("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+az.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=d.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
p,
})

local r={}

for u=0,1,0.1 do
table.insert(r,ColorSequenceKeypoint.new(u,Color3.fromHSV(u,1,1)))
end

local u=af("UIGradient",{
Color=ColorSequence.new(r),
Rotation=90,
})

local v=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=i,


BackgroundColor3=az.Default,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

local x=af("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+az.TextPadding),
Parent=d.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
u,
i,
})

local function CreateNewInput(z,A)
local B=ar(z,nil,az.UIElements.Inputs,nil,nil,nil,nil,nil,true)

af("TextLabel",{
BackgroundTransparency=1,
TextTransparency=0.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=B.Frame,
Text=z,
})

af("UIScale",{
Parent=B,
Scale=0.85,
})

B.Frame.Frame.TextBox.Text=A
B.Size=UDim2.new(0,150,0,42)

return B
end

local function ToRGB(z)
return{
R=math.floor(z.R*255),
G=math.floor(z.G*255),
B=math.floor(z.B*255),
}
end

local z=CreateNewInput("Hex","#"..az.Default:ToHex())

local A=CreateNewInput("Red",ToRGB(az.Default).R)
local B=CreateNewInput("Green",ToRGB(az.Default).G)
local C=CreateNewInput("Blue",ToRGB(az.Default).B)
local F
if aB then
F=CreateNewInput("Alpha",((1-az.Transparency)*100).."%")
end

local G=af("Frame",{
Size=UDim2.new(0,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+az.TextPadding),
BackgroundTransparency=1,
Parent=d.UIElements.Main,
LayoutOrder=4,
},{
af("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

aa.AddSignal(d.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",function()
az.UIElements.Title.Size=UDim2.new(
0,
d.UIElements.Main.AbsoluteSize.X/av.UIScale-(d.UIPadding*2),
0,
0
)
G.Size=UDim2.new(
0,
d.UIElements.Main.AbsoluteSize.X/av.UIScale-d.UIPadding*2,
0,
40
)
end)

local H={
{
Title="Cancel",
Variant="Secondary",
Callback=function()
av.IsShowed=false
for H,J in next,aA do
J:Disconnect()
end
aA={}
end,
},
{
Title="Apply",

Variant="Primary",
Callback=function()
av.IsShowed=false
for H,J in next,aA do
J:Disconnect()
end
aA={}

ay(Color3.fromHSV(az.Hue,az.Sat,az.Vib),az.Transparency)
end,
},
}

for J,L in next,H do
local M=aq(
L.Title,
L.Icon,
L.Callback,
L.Variant,
G,
d,
true
)
M.Size=UDim2.new(0.5,-3,0,40)
M.AutomaticSize="None"
end

local J,L,M
if aB then
local N=af("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

L=af("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=N,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

M=af("Frame",{
Size=UDim2.fromScale(1,1),
},{
af("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
af("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

J=af("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+az.TextPadding),
Parent=d.UIElements.Main,
BackgroundTransparency=1,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
af("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
M,
N,
})
end

function az.Round(N,O,P)
if P==0 then
return math.floor(O)
end
O=tostring(O)
return O:find"%."and tonumber(O:sub(1,O:find"%."+P))or O
end

function az.Update(N,O,P)
if O then
f,g,h=Color3.toHSV(O)
else
f,g,h=az.Hue,az.Sat,az.Vib
end

az.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(f,1,1)
l.Position=UDim2.new(g,0,1-h,0)
l.BackgroundColor3=Color3.fromHSV(f,g,h)
p.BackgroundColor3=Color3.fromHSV(f,g,h)
v.BackgroundColor3=Color3.fromHSV(f,1,1)
v.Position=UDim2.new(0.5,0,f,0)

z.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(f,g,h):ToHex()
A.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(f,g,h)).R
B.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(f,g,h)).G
C.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(f,g,h)).B

if P or aB then
p.BackgroundTransparency=az.Transparency or P
M.BackgroundColor3=Color3.fromHSV(f,g,h)
L.BackgroundColor3=Color3.fromHSV(f,g,h)
L.BackgroundTransparency=az.Transparency or P
L.Position=UDim2.new(0.5,0,1-az.Transparency or P,0)
F.Frame.Frame.TextBox.Text=az:Round(
(1-az.Transparency or P)*100,
0
).."%"
end
end

az:Update(az.Default,az.Transparency)

local function GetRGB()
local N=Color3.fromHSV(az.Hue,az.Sat,az.Vib)
return{R=math.floor(N.r*255),G=math.floor(N.g*255),B=math.floor(N.b*255)}
end



local function clamp(N,O,P)
return math.clamp(tonumber(N)or 0,O,P)
end

table.insert(
aA,
aa.AddSignal(z.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=z.Frame.Frame.TextBox.Text:gsub("#","")
local P,Q=pcall(Color3.fromHex,O)
if P and typeof(Q)=="Color3"then
az.Hue,az.Sat,az.Vib=Color3.toHSV(Q)
az:Update()
az.Default=Q
end
end
end)
)

local function updateColorFromInput(N,O)
aa.AddSignal(N.Frame.Frame.TextBox.FocusLost,function(P)
if P then
local Q=N.Frame.Frame.TextBox
local R=GetRGB()
local S=clamp(Q.Text,0,255)
Q.Text=tostring(S)

R[O]=S
local T=Color3.fromRGB(R.R,R.G,R.B)
az.Hue,az.Sat,az.Vib=Color3.toHSV(T)
az:Update()
end
end)
end

updateColorFromInput(A,"R")
updateColorFromInput(B,"G")
updateColorFromInput(C,"B")

if aB then
aa.AddSignal(F.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=F.Frame.Frame.TextBox
local P=clamp(O.Text,0,100)
O.Text=tostring(P)

az.Transparency=1-P*0.01
az:Update(nil,az.Transparency)
end
end)
end



local function UpdateSatVib(N,O)
local P=N.AbsolutePosition.X
local Q=P+N.AbsoluteSize.X
local R=N.AbsolutePosition.Y
local S=R+N.AbsoluteSize.Y

local T=math.clamp(ap.X,P,Q)
local U=math.clamp(ap.Y,R,S)

O.Sat=(T-P)/(Q-P)
O.Vib=1-((U-R)/(S-R))

O:Update()
end

local function UpdateHue(N,O)
local P=N.AbsolutePosition.Y
local Q=P+N.AbsoluteSize.Y

local R=math.clamp(ap.Y,P,Q)

O.Hue=(R-P)/(Q-P)

O:Update()
end

local function UpdateTransparency(N,O)
local P=N.AbsolutePosition.Y
local Q=P+N.AbsoluteSize.Y

local R=math.clamp(ap.Y,P,Q)

O.Transparency=1-((R-P)/(Q-P))

O:Update()
end

local N=ax.GenerateGUID()

table.insert(
aA,
ak.InputChanged:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseMovement
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if at=="SatVib"then
UpdateSatVib(az.UIElements.SatVibMap,az)
elseif at=="Hue"then
UpdateHue(x,az)
elseif at=="Transparency"then
UpdateTransparency(J,az)
end
end)
)

table.insert(
aA,
az.UIElements.SatVibMap.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="SatVib"then
return
end

at="SatVib"

UpdateSatVib(az.UIElements.SatVibMap,az)
end)
)

table.insert(
aA,
x.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="Hue"then
return
end

at="Hue"

UpdateHue(x,az)
end)
)

if J then
table.insert(
aA,
J.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="Transparency"then
return
end

at="Transparency"

UpdateTransparency(J,az)
end)
)
end

table.insert(
aA,
ak.InputEnded:Connect(function(O)
at=nil

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=nil
end)
)

return az
end

function as.New(au,av)
local aw={
__type="Colorpicker",
Title=av.Title or"Colorpicker",
Desc=av.Desc or nil,
Locked=av.Locked or false,
LockedTitle=av.LockedTitle,
Default=av.Default or Color3.new(1,1,1),
Callback=av.Callback or function()end,

UIScale=av.UIScale,
Transparency=av.Transparency,
UIElements={},

IsShowed=false,
}

local ax=true



aw.ColorpickerFrame=a.load'C'{
Title=aw.Title,
Desc=aw.Desc,
Parent=av.Parent,
TextOffset=40,
Hover=false,
Tab=av.Tab,
Index=av.Index,
Window=av.Window,
ElementTable=aw,
ParentConfig=av,
Tags=av.Tags,
}

aw.UIElements.Colorpicker=aa.NewRoundFrame(as.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=aw.Default,
Parent=aw.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,26,0,26),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2,
},{
aa.NewRoundFrame(as.UICorner,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=0.55,
}),
},true)

function aw.Lock(ay)
aw.Locked=true
ax=false
return aw.ColorpickerFrame:Lock(aw.LockedTitle)
end
function aw.Unlock(ay)
aw.Locked=false
ax=true
return aw.ColorpickerFrame:Unlock()
end

if aw.Locked then
aw:Lock()
end

function aw.Update(ay,az,aA)
aw.UIElements.Colorpicker.ImageTransparency=aA or 0
aw.UIElements.Colorpicker.ImageColor3=az
aw.Default=az
if aA then
aw.Transparency=aA
end
end

function aw.Set(ay,az,aA)
return aw:Update(az,aA)
end

aa.AddSignal(aw.UIElements.Colorpicker.MouseButton1Click,function()
if ax and not aw.IsShowed then
aw.IsShowed=true

as:Colorpicker(aw,av.Window,av.WindUI,function(ay,az)
aw:Update(ay,az)
aw.Default=ay
aw.Transparency=az
aa.SafeCallback(aw.Callback,ay,az)
end).ColorpickerFrame
:Open()
end
end)

return aw.__type,aw
end

return as end function a.T()

local aa=a.load'd'
local af=aa.New
local ai=aa.Tween

local ak={}

function ak.New(al,am)
local an={
__type="Section",
Title=am.Title or"Section",
Desc=am.Desc,
Icon=am.Icon,
IconThemed=am.IconThemed,
TextXAlignment=am.TextXAlignment or"Left",
TextSize=am.TextSize or 19,
DescTextSize=am.DescTextSize or 16,
Box=am.Box or false,
BoxBorder=am.BoxBorder or false,
FontWeight=am.FontWeight or Enum.FontWeight.SemiBold,
DescFontWeight=am.DescFontWeight or Enum.FontWeight.Medium,
TextTransparency=am.TextTransparency or 0.05,
DescTextTransparency=am.DescTextTransparency or 0.4,
Opened=am.Opened or false,
UIElements={},

HeaderSize=48,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local ao

function an.SetIcon(ap,aq)
an.Icon=aq or nil
if ao then
ao:Destroy()
end
if aq then
ao=aa.Image(
aq,
aq..":"..an.Title,
0,
am.Window.Folder,
an.__type,
true,
an.IconThemed,
"SectionIcon"
)
ao.Size=UDim2.new(0,an.IconSize,0,an.IconSize)
end
end

local ap=af("Frame",{
Size=UDim2.new(0,an.IconSize,0,an.IconSize),
BackgroundTransparency=1,
Visible=false,
},{
af("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageTransparency="SectionExpandIconTransparency",
ImageColor3="SectionExpandIcon",
},
}),
})

if an.Icon then
an:SetIcon(an.Icon)
end

local aq=af("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
af("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment=an.TextXAlignment,
VerticalAlignment="Center",
Padding=UDim.new(0,4),
}),
})

local ar,as

local function createTitle(at,au)
return af("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=an.TextXAlignment,
AutomaticSize="Y",
TextSize=au=="Title"and an.TextSize or an.DescTextSize,
TextTransparency=au=="Title"and an.TextTransparency or an.DescTextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,au=="Title"and an.FontWeight or an.DescFontWeight),


Text=at,
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
Parent=aq,
})
end

ar=createTitle(an.Title,"Title")
if an.Desc then
as=createTitle(an.Desc,"Desc")
end

local function UpdateTitleSize()
local at=0
if ao then
at=at-(an.IconSize+8)
end
if ap.Visible then
at=at-(an.IconSize+8)
end
aq.Size=UDim2.new(1,at,0,0)
end

local at=aa.NewRoundFrame(am.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=am.Parent,

AutomaticSize="Y",
ThemeTag={
ImageTransparency=an.Box and"SectionBoxBackgroundTransparency"or nil,
ImageColor3="SectionBoxBackground",
},
ImageTransparency=not an.Box and 1 or nil,
},{
aa.NewRoundFrame(am.Window.ElementConfig.UICorner-1,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ThemeTag={

ImageColor3="SectionBoxBorder",
},
ImageTransparency=an.Box and an.BoxBorder and 0.92 or 1,
Name="Outline",
ClipsDescendants=true,
},{
af("TextButton",{
Size=UDim2.new(1,0,0,an.Expandable and 0 or(not as and an.HeaderSize or 0)),
BackgroundTransparency=1,
AutomaticSize=(not an.Expandable or as)and"Y"or nil,
Text="",
Name="Top",
},{
an.Box and af("UIPadding",{
PaddingTop=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingLeft=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingRight=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingBottom=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
})or nil,
ao,
aq,
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ap,
}),
af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,an.HeaderSize+10),
},{
an.Box and af("UIPadding",{
PaddingLeft=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
PaddingRight=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
PaddingBottom=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
})or nil,
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,am.Tab.Gap),
VerticalAlignment="Top",
}),
}),
}),
})





an.ElementFrame=at

at.Outline.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
at.Outline.Content.Position=UDim2.new(0,0,0,(at.Outline.Top.AbsoluteSize.Y/am.UIScale)+10)

if an.Opened then
an:Open(true)
else
an.Close(true)
end
end)

local au=am.ElementsModule

au.Load(an,at.Outline.Content,au.Elements,am.Window,am.WindUI,function()
if not an.Expandable then
an.Expandable=true
ap.Visible=true
UpdateTitleSize()
end
end,au,am.UIScale,am.Tab)

UpdateTitleSize()

function an.SetTitle(av,aw)
an.Title=aw
ar.Text=aw
end

function an.SetDesc(av,aw)
an.Desc=aw
if not as then
as=createTitle(aw,"Desc")
end
as.Text=aw
end

function an.Destroy(av)
for aw,ax in next,an.Elements do
ax:Destroy()
end








at:Destroy()
end

function an.Open(av,aw)
if an.Expandable then
an.Opened=true
if aw then
at.Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
at.Outline.Top.AbsoluteSize.Y/am.UIScale
+(at.Outline.Content.AbsoluteSize.Y/am.UIScale)
+10
)
ap.ImageLabel.Rotation=180
else
ai(at,0.33,{
Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
at.Outline.Top.AbsoluteSize.Y/am.UIScale
+(at.Outline.Content.AbsoluteSize.Y/am.UIScale)
+10
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ai(
ap.ImageLabel,
0.2,
{Rotation=180},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end
function an.Close(av,aw)
if an.Expandable then
an.Opened=false
if aw then
at.Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
(at.Outline.Top.AbsoluteSize.Y/am.UIScale)
)
ap.ImageLabel.Rotation=0
else
ai(at,0.26,{
Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
(at.Outline.Top.AbsoluteSize.Y/am.UIScale)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ai(
ap.ImageLabel,
0.2,
{Rotation=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end

aa.AddSignal(at.Outline.Top.MouseButton1Click,function()
if an.Expandable then
if an.Opened then
an:Close()
else
an:Open()
end
end
end)

aa.AddSignal(at.Outline.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if an.Opened then
an:Open(true)
else
an:Close(true)
end
end)

task.defer(function()
if an.Expandable then








at.Size=
UDim2.new(at.Size.X.Scale,at.Size.X.Offset,0,at.Outline.Top.AbsoluteSize.Y/am.UIScale)
at.AutomaticSize="None"
at.Outline.Top.Size=UDim2.new(1,0,0,(not as and an.HeaderSize or 0))
at.Outline.Top.AutomaticSize=(not an.Expandable or as)and"Y"or"None"
at.Outline.Content.Visible=true
end
if an.Opened then
an:Open()
else
an:Close(true)
end
end)

return an.__type,an
end

return ak end function a.U()

local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am=af("Frame",{
Parent=al.Parent,
Size=not table.find({"Group","HStack"},al.ParentType)and UDim2.new(1,-7,0,7*(al.Columns or 1))or UDim2.new(0,7*(al.Columns or 1),0,0),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=am}
end

return ai end function a.V()
local aa=a.load'd'
local af=aa.New

local ai={}

local function ParseAspectRatio(ak)
if type(ak)=="string"then
local al,am=ak:match"(%d+):(%d+)"
if al and am then
return tonumber(al)/tonumber(am)
end
elseif type(ak)=="number"then
return ak
end
return nil
end

function ai.New(ak,al)
local am={
__type="Image",
Image=al.Image or"",
AspectRatio=al.AspectRatio or"16:9",
Radius=al.Radius or al.Window.ElementConfig.UICorner,
}
local an=aa.Image(
am.Image,
am.Image,
am.Radius,
al.Window.Folder,
"Image",
false
)
if an and an.Parent then
an.Parent=al.Parent
an.Size=UDim2.new(1,0,0,0)
an.BackgroundTransparency=1












local ao=ParseAspectRatio(am.AspectRatio)
local ap

if ao then
ap=af("UIAspectRatioConstraint",{
Parent=an,
AspectRatio=ao,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end

function am.Destroy(aq)
an:Destroy()
end
end

return am.__type,am
end

return ai end function a.W()
local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="Group",
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6))
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,
function(ap,aq)
local ar=al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)

local as={}
local at=0

for au,av in next,aq do
if av.__type=="Space"then
at=at+(av.ElementFrame.Size.X.Offset or 6)
elseif av.__type=="Divider"then
at=at+(av.ElementFrame.Size.X.Offset or 1)
else
table.insert(as,av)
end
end

local au=#as
if au==0 then return end

local av=1/au

local aw=ar*(au-1)

local ax=-(aw+at)

local ay=math.floor(ax/au)
local az=ax-(ay*au)

for aA,aB in next,as do
local b=ay
if aA<=math.abs(az)then
b=b-1
end

if aB.ElementFrame then
aB.ElementFrame.Size=UDim2.new(av,b,1,0)
end
end
end,
ao,
al.UIScale,
al.Tab
)



return am.__type,am
end

return ai end function a.X()
local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="HStack",
AutoSpace=al.AutoSpace or false,
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)),
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,
function(ap,aq)
local ar=al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)

local as={}
local at=0

for au,av in next,aq do
if av.__type=="Space"then
at=at+(av.ElementFrame.Size.X.Offset or 6)
elseif av.__type=="Divider"then
at=at+(av.ElementFrame.Size.X.Offset or 1)
else
table.insert(as,av)
end
end

local au=#as
if au==0 then
return
end

local av=1/au

local aw=ar*(au-1)

local ax=-(aw+at)

local ay=math.floor(ax/au)
local az=ax-(ay*au)

for aA,aB in next,as do
local b=ay
if aA<=math.abs(az)then
b=b-1
end

if aB.ElementFrame then
aB.ElementFrame.Size=UDim2.new(av,b,1,0)
end
end
end,
ao,
al.UIScale,
al.Tab
)

if am.AutoSpace then
for ap in next,ao.Elements do
if ap~="Space"and ap~="Divider"then
local aq=am[ap]
am[ap]=function(ar,as)
if#am.Elements>0 then
am:Space()
end
return aq(ar,as)
end
end
end
end

return am.__type,am
end

return ai end function a.Y()

local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="VStack",
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6))
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,







































nil,
ao,
al.UIScale,
al.Tab
)



return am.__type,am
end

return ai end function a.Z()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=aa(game:GetService"UserInputService")

local ai=a.load'd'
local ak=ai.New

local al={}














function al.New(am,an:ConfigType__DARKLUA_TYPE_a)
local ao={
__type="Viewport",
Object=an.Object,
Camera=an.Camera or Instance.new"Camera",
Interactive=an.Interactive or false,
Height=an.Height or 200,
Focused=an.Focused~=false,
}

local ap=false
local aq=false
local ar,as=0

local at=ai.NewRoundFrame(an.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,ao.Height),
Parent=an.Parent,
ThemeTag={
ImageColor3="ViewportBackground",
ImageTransparency="ViewportBackgroundTransparency",
},
},{
ak("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ak("UICorner",{
CornerRadius=UDim.new(0,an.Window.ElementConfig.UICorner),
}),
ak("ViewportFrame",{
Name="Viewport",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
CurrentCamera=ao.Camera,
Active=ao.Interactive,
},{
ao.Object,
}),
}),
})

local function IsTouchInsideViewport(au)
local av=at.CanvasGroup.Viewport.AbsolutePosition
local aw=at.CanvasGroup.Viewport.AbsoluteSize

return au.X>=av.X
and au.X<=av.X+aw.X
and au.Y>=av.Y
and au.Y<=av.Y+aw.Y
end

local au=an.WindUI.GenerateGUID()

ai.AddSignal(at.CanvasGroup.Viewport.MouseEnter,function()
if ao.Interactive then
an.Tab.UIElements.ContainerFrame.ScrollingEnabled=false
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputEnded,function(av)
if
av.UserInputType==Enum.UserInputType.MouseMovement
or av.UserInputType==Enum.UserInputType.Touch
then
an.Tab.UIElements.ContainerFrame.ScrollingEnabled=true
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputBegan,function(av)
if ao.Interactive then
if
(av.UserInputType==Enum.UserInputType.MouseButton1)
or(av.UserInputType==Enum.UserInputType.Touch and not aq)
then
if an.WindUI.CurrentInput and an.WindUI.CurrentInput~=au then
return
end

an.WindUI.CurrentInput=au

ap=true
as=av.Position
end
end
end)

ai.AddSignal(af.InputEnded,function(av)
if ao.Interactive then
if
av.UserInputType==Enum.UserInputType.MouseButton1
or av.UserInputType==Enum.UserInputType.Touch
then
if an.WindUI.CurrentInput and an.WindUI.CurrentInput~=au then
return
end

an.WindUI.CurrentInput=nil

ap=false
end
end
end)

ai.AddSignal(af.InputChanged,function(av)
if ao.Interactive and ap and not aq then
if
av.UserInputType==Enum.UserInputType.MouseMovement
or av.UserInputType==Enum.UserInputType.Touch
then
local aw=av.Position-as
as=av.Position

local ax=ao.Object:GetPivot().Position
local ay=ao.Camera

local az=CFrame.fromAxisAngle(Vector3.new(0,1,0),-aw.X*0.02)
ay.CFrame=CFrame.new(ax)*az*CFrame.new(-ax)*ay.CFrame

local aA=CFrame.fromAxisAngle(ay.CFrame.RightVector,-aw.Y*0.02)
local aB=CFrame.new(ax)*aA*CFrame.new(-ax)*ay.CFrame

if aB.UpVector.Y>0.1 then
ay.CFrame=aB
end
end
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputChanged,function(av)
if ao.Interactive then
if av.UserInputType==Enum.UserInputType.MouseWheel then
local aw=av.Position.Z*2
ao.Camera.CFrame+=ao.Camera.CFrame.LookVector*aw
end
end
end)

ai.AddSignal(af.TouchPinch,function(av,aw,ax,ay)
if not IsTouchInsideViewport(av[1])or not IsTouchInsideViewport(av[2])then
return
end
if ao.Interactive then
if ay==Enum.UserInputState.Begin then
aq=true
ap=false
ar=(av[1]-av[2]).Magnitude
elseif ay==Enum.UserInputState.Change then
if aq then
local az=(av[1]-av[2]).Magnitude
local aA=(az-ar)*0.03
ar=az
ao.Camera.CFrame+=ao.Camera.CFrame.LookVector*aA
end
elseif ay==Enum.UserInputState.End or ay==Enum.UserInputState.Cancel then
aq=false
end
end
end)

local function FocusCamera()
local av=ao.Object:IsA"BasePart"and ao.Object.Size
or select(2,ao.Object:GetBoundingBox(0))
local aw=math.max(av.X,av.Y,av.Z)
local ax=aw*2
local ay=ao.Object:GetPivot().Position

ao.Camera.CFrame=
CFrame.new(ay+Vector3.new(0,aw/2,ax),ay)
end

if ao.Focused then
FocusCamera()
end

function ao.SetObject(av,aw,ax)
if ax then
aw=aw:Clone()
end
if ao.Object then
ao.Object:Destroy()
end

ao.Object=aw
ao.Object.Parent=at.CanvasGroup.Viewport
end

function ao.SetHeight(av,aw)
at.Size=UDim2.new(1,0,0,aw)
end

function ao.Focus(av)
if ao.Object then
FocusCamera()
end
end

function ao.SetCamera(av,aw)
ao.Camera=aw
at.CanvasGroup.Viewport.CurrentCamera=aw
end

function ao.SetInteractive(av,aw)
ao.Interactive=aw
at.CanvasGroup.Viewport.Active=aw
end

ao.Main=at

return ao.__type,ao
end

return al end function a._()

return{
Elements={
Paragraph=a.load'D',
Button=a.load'E',
Toggle=a.load'H',
Slider=a.load'I',
ProgressBar=a.load'J',
Keybind=a.load'K',
Input=a.load'L',
Dropdown=a.load'O',
Code=a.load'R',
Colorpicker=a.load'S',
Section=a.load'T',
Divider=a.load'M',
Space=a.load'U',
Image=a.load'V',
Group=a.load'W',
HStack=a.load'X',
VStack=a.load'Y',
Viewport=a.load'Z',

},
Load=function(aa,af,ai,ak,al,am,an,ao,ap)
for aq,ar in next,ai do
aa[aq]=function(as,at)
at=at or{}
at.Tab=ap or aa
at.ParentType=aa.__type
at.ParentTable=aa
at.Index=#aa.Elements+1
at.GlobalIndex=#ak.AllElements+1
at.Parent=af
at.Window=ak
at.WindUI=al
at.UIScale=ao
at.ElementsModule=an local

au, av=ar:New(at)

if at.Flag and typeof(at.Flag)=="string"then
if ak.CurrentConfig then
ak.CurrentConfig:Register(at.Flag,av)

if ak.PendingConfigData and ak.PendingConfigData[at.Flag]then
local aw=ak.PendingConfigData[at.Flag]

local ax=ak.ConfigManager
if ax.Parser[aw.__type]then
task.defer(function()
local ay,az=pcall(function()
ax.Parser[aw.__type].Load(av,aw)
end)

if ay then
ak.PendingConfigData[at.Flag]=nil
else
warn(
"[ WindUI ] Failed to apply pending config for '"
..at.Flag
.."': "
..tostring(az)
)
end
end)
end
end
else
ak.PendingFlags=ak.PendingFlags or{}
ak.PendingFlags[at.Flag]=av
end
end

local aw
for ax,ay in next,av do
if typeof(ay)=="table"and ax~="ElementFrame"and ax:match"Frame$"then
aw=ay
break
end
end

if aw then
av.ElementFrame=aw.UIElements.Main
function av.SetTitle(ax,ay)
return aw.SetTitle and aw:SetTitle(ay)
end
function av.SetDesc(ax,ay)
return aw.SetDesc and aw:SetDesc(ay)
end
function av.SetImage(ax,ay,az)
return aw.SetImage and aw:SetImage(ay,az)
end
function av.SetThumbnail(ax,ay,az)
return aw.SetThumbnail and aw:SetThumbnail(ay,az)
end
function av.Highlight(ax)
aw:Highlight()
end
function av.Destroy(ax)
aw:Destroy()

table.remove(ak.AllElements,at.GlobalIndex)
table.remove(aa.Elements,at.Index)
table.remove(ap.Elements,at.Index)
aa:UpdateAllElementShapes(aa)
end
end

ak.AllElements[at.Index]=av
aa.Elements[at.Index]=av
if ap then
ap.Elements[at.Index]=av
end

if ak.NewElements then
aa:UpdateAllElementShapes(aa)
end

if am then
am(av,aa.Elements)
end
return av
end
end
function aa.UpdateAllElementShapes(aq,ar)
for as,at in next,ar.Elements do
local au
for av,aw in pairs(at)do
if typeof(aw)=="table"and av:match"Frame$"then
au=aw
break
end
end

if not au and at.UpdateShape then
au=at
end

if au then

au.Index=as
if au.UpdateShape then

au.UpdateShape(ar)
end
end
end
end
end,
}end function a.aa()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=game:GetService"Players"

aa(game:GetService"UserInputService")
local ai=af.LocalPlayer:GetMouse()

local ak=a.load'd'
local al=ak.New

local am=a.load'B'.New
local an=a.load'x'.New



local ao={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ao)end,
}

function ao.Init(ap,aq,ar,as)
Window=ap
WindUI=aq
ao.ToolTipParent=ar
ao.TabHighlight=as
return ao
end

function ao.New(ap,aq)
local ar={
__type="Tab",
Title=ap.Title or"Tab",
Desc=ap.Desc,
Icon=ap.Icon,
IconColor=ap.IconColor,
IconShape=ap.IconShape,
IconThemed=ap.IconThemed,
Locked=ap.Locked,
ShowTabTitle=ap.ShowTabTitle,
TabTitleAlign=ap.TabTitleAlign or"Left",
CustomEmptyPage=(ap.CustomEmptyPage and next(ap.CustomEmptyPage)~=nil)and ap.CustomEmptyPage
or{Icon="lucide:frown",IconSize=48,Title="This tab is Empty",Desc=nil},
Border=ap.Border,
Selected=false,
Index=nil,
Parent=ap.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}









if ar.IconShape then
ar.TabPaddingX=2+(Window.UIPadding/4)
ar.TabPaddingY=2+(Window.UIPadding/4)
ar.TitlePaddingY=2+(Window.UIPadding/4)
end

ao.TabCount=ao.TabCount+1

local as=ao.TabCount
ar.Index=as

ar.UIElements.Main=ak.NewRoundFrame(ar.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=ap.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
ak.NewRoundFrame(ar.UICorner-1,"Glass-1.4",{
Size=UDim2.new(1,1,1,1),
ThemeTag={
ImageColor3="TabBorder",
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=1,
Name="Outline",
},{













}),
ak.NewRoundFrame(ar.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,2+(Window.UIPadding/2)),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("TextLabel",{
Text=ar.Title,
ThemeTag={
TextColor3="TabTitle",
},
TextTransparency=not ar.Locked and 0.4 or 0.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
},{
al("UIPadding",{
PaddingTop=UDim.new(0,ar.TitlePaddingY),


PaddingBottom=UDim.new(0,ar.TitlePaddingY),
}),
}),
al("UIPadding",{
PaddingTop=UDim.new(0,ar.TabPaddingY),
PaddingLeft=UDim.new(0,ar.TabPaddingX),
PaddingRight=UDim.new(0,ar.TabPaddingX),
PaddingBottom=UDim.new(0,ar.TabPaddingY),
}),
}),
},true)

local at=0
local au
local av

if ar.Icon then
au=ak.Image(
ar.Icon,
ar.Icon..":"..ar.Title,
0,
Window.Folder,
ar.__type,
ar.IconColor and false or true,
ar.IconThemed,
"TabIcon"
)
au.Size=UDim2.new(0,16,0,16)
if ar.IconColor then
au.ImageLabel.ImageColor3=ar.IconColor
end
if not ar.IconShape then
au.Parent=ar.UIElements.Main.Frame
ar.UIElements.Icon=au
au.ImageLabel.ImageTransparency=not ar.Locked and 0 or 0.7
at=-18-(Window.UIPadding/2)
ar.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,at,0,0)
elseif ar.IconColor then
ak.NewRoundFrame(
ar.IconShape~="Circle"and(ar.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Squircle",
{
Size=UDim2.new(0,26,0,26),
ImageColor3=ar.IconColor,
Parent=ar.UIElements.Main.Frame,
},
{
au,
ak.NewRoundFrame(
ar.IconShape~="Circle"and(ar.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Glass-1.4",
{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0,
Name="Outline",
},
{













}
),
}
)
au.AnchorPoint=Vector2.new(0.5,0.5)
au.Position=UDim2.new(0.5,0,0.5,0)
au.ImageLabel.ImageTransparency=0
au.ImageLabel.ImageColor3=ak.GetTextColorForHSB(ar.IconColor,0.68)
at=-28-(Window.UIPadding/2)
ar.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,at,0,0)
end

av=
ak.Image(ar.Icon,ar.Icon..":"..ar.Title,0,Window.Folder,ar.__type,true,ar.IconThemed)
av.Size=UDim2.new(0,16,0,16)
av.ImageLabel.ImageTransparency=not ar.Locked and 0 or 0.7
at=-30




end

ar.UIElements.ContainerFrame=al("ScrollingFrame",{
Size=UDim2.new(1,0,1,ar.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
al("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ar.Gap),
HorizontalAlignment="Center",
}),
})





ar.UIElements.ContainerFrameCanvas=al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
ar.UIElements.ContainerFrame,
al("Frame",{
Size=UDim2.new(1,-14,1,-14),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="ScrollSliderHolder",
}),
al("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=ar.ShowTabTitle or false,
Name="TabTitle",
},{
av,
al("TextLabel",{
Text=ar.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextTransparency=0.1,
Size=UDim2.new(0,0,1,0),
FontFace=Font.new(ak.Font,Enum.FontWeight.SemiBold),

RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
AutomaticSize="X",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=ar.TabTitleAlign,
}),
}),
al("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=ar.ShowTabTitle or false,
}),
})

ao.Containers[as]=ar.UIElements.ContainerFrameCanvas
ao.Tabs[as]=ar

ar.ContainerFrame=ar.UIElements.ContainerFrameCanvas

ak.AddSignal(ar.UIElements.Main.MouseButton1Click,function()
if not ar.Locked then
ao:SelectTab(as)
end
end)

if Window.ScrollBarEnabled then
an(
ar.UIElements.ContainerFrame,
ar.UIElements.ContainerFrameCanvas.ScrollSliderHolder,
Window,
4,
WindUI
)
end

local aw
local ax
local ay
local az=false


if ar.Desc then
ak.AddSignal(ar.UIElements.Main.InputBegan,function()
az=true
ax=task.spawn(function()
task.wait(0.35)
if az and not aw then
aw=am(ar.Desc,ao.ToolTipParent,true)
aw.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if aw then
aw.Container.Position=UDim2.new(0,ai.X,0,ai.Y-4)
end
end

updatePosition()
ay=ai.Move:Connect(updatePosition)
aw:Open()
end
end)
end)
end

ak.AddSignal(ar.UIElements.Main.MouseEnter,function()
if not ar.Locked then
ak.SetThemeTag(ar.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.1)
end
end)
ak.AddSignal(ar.UIElements.Main.InputEnded,function()
if ar.Desc then
az=false
if ax then
task.cancel(ax)
ax=nil
end
if ay then
ay:Disconnect()
ay=nil
end
if aw then
aw:Close()
aw=nil
end
end

if not ar.Locked then
ak.SetThemeTag(ar.UIElements.Main.Frame,{
ImageTransparency="TabBorderTransparency",
},0.1)
end
end)

function ar.ScrollToTheElement(aA,aB)
ar.UIElements.ContainerFrame.ScrollingEnabled=false

ak.Tween(ar.UIElements.ContainerFrame,0.45,{
CanvasPosition=Vector2.new(
0,
ar.Elements[aB].ElementFrame.AbsolutePosition.Y
-ar.UIElements.ContainerFrame.AbsolutePosition.Y
-ar.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.48)

if ar.Elements[aB].Highlight then
ar.Elements[aB]:Highlight()
end
ar.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return ar
end



local aA=a.load'_'

aA.Load(
ar,
ar.UIElements.ContainerFrame,
aA.Elements,
Window,
WindUI,
nil,
aA,
aq,
ar
)

function ar.LockAll(aB)

for b,d in next,Window.AllElements do
if d.Tab and d.Tab.Index and d.Tab.Index==ar.Index and d.Lock then
d:Lock()
end
end
end
function ar.UnlockAll(aB)
for b,d in next,Window.AllElements do
if d.Tab and d.Tab.Index and d.Tab.Index==ar.Index and d.Unlock then
d:Unlock()
end
end
end
function ar.GetLocked(aB)
local b={}

for d,f in next,Window.AllElements do
if f.Tab and f.Tab.Index and f.Tab.Index==ar.Index and f.Locked==true then
table.insert(b,f)
end
end

return b
end
function ar.GetUnlocked(aB)
local b={}

for d,f in next,Window.AllElements do
if f.Tab and f.Tab.Index and f.Tab.Index==ar.Index and f.Locked==false then
table.insert(b,f)
end
end

return b
end

function ar.Select(aB)
return ao:SelectTab(ar.Index)
end

task.spawn(function()
local aB
if ar.CustomEmptyPage.Icon then
aB=
ak.Image(ar.CustomEmptyPage.Icon,ar.CustomEmptyPage.Icon,0,"Temp","EmptyPage",true)
aB.Size=
UDim2.fromOffset(ar.CustomEmptyPage.IconSize or 48,ar.CustomEmptyPage.IconSize or 48)
end

local b=al("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=ar.UIElements.ContainerFrame,
},{
al("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),











aB,
ar.CustomEmptyPage.Title and al("TextLabel",{
AutomaticSize="XY",
Text=ar.CustomEmptyPage.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
TextTransparency=0.5,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
})or nil,
ar.CustomEmptyPage.Desc and al("TextLabel",{
AutomaticSize="XY",
Text=ar.CustomEmptyPage.Desc,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.65,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Regular),
})or nil,
})





local d
d=ak.AddSignal(ar.UIElements.ContainerFrame.ChildAdded,function()
b.Visible=false
d:Disconnect()
end)
end)

return ar
end

function ao.OnChange(ap,aq)
ao.OnChangeFunc=aq
end

function ao.SelectTab(ap,aq)
if not ao.Tabs[aq].Locked then
ao.SelectedTab=aq

for ar,as in next,ao.Tabs do
if not as.Locked then
ak.SetThemeTag(as.UIElements.Main,{
ImageTransparency="TabBorderTransparency",
},0.15)
if as.Border then
ak.SetThemeTag(as.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparency",
},0.15)
end
ak.SetThemeTag(as.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparency",
},0.15)
if as.UIElements.Icon and not as.IconColor then
ak.SetThemeTag(as.UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparency",
},0.15)
end
as.Selected=false
end
end
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main,{
ImageColor3="TabBackgroundActive",
ImageTransparency="TabBackgroundActiveTransparency",
},0.15)
if ao.Tabs[aq].Border then
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparencyActive",
},0.15)
end
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparencyActive",
},0.15)
if ao.Tabs[aq].UIElements.Icon and not ao.Tabs[aq].IconColor then
ak.SetThemeTag(ao.Tabs[aq].UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparencyActive",
},0.15)
end
ao.Tabs[aq].Selected=true

task.spawn(function()
for ar,as in next,ao.Containers do
as.AnchorPoint=Vector2.new(0,0.05)
as.Visible=false
end
ao.Containers[aq].Visible=true
local ar=game:GetService"TweenService"

local as=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local at=ar:Create(ao.Containers[aq],as,{
AnchorPoint=Vector2.new(0,0),
})
at:Play()
end)

ao.OnChangeFunc(aq)
end
end

return ao end function a.ab()

local aa={}


local af=a.load'd'
local ai=af.New
local ak=af.Tween

local al=a.load'aa'

function aa.New(am,an,ao,ap,aq)
local ar={
Title=am.Title or"Section",
Icon=am.Icon,
IconThemed=am.IconThemed,
Opened=am.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local as
if ar.Icon then
as=af.Image(
ar.Icon,
ar.Icon,
0,
ao,
"Section",
true,
ar.IconThemed,
"TabSectionIcon"
)

as.Size=UDim2.new(0,ar.IconSize,0,ar.IconSize)
as.ImageLabel.ImageTransparency=.25
end

local at=ai("Frame",{
Size=UDim2.new(0,ar.IconSize,0,ar.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ai("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=af.Icon"chevron-down"[1],
ImageRectSize=af.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=af.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local au=ai("Frame",{
Size=UDim2.new(1,0,0,ar.HeaderSize),
BackgroundTransparency=1,
Parent=an,
ClipsDescendants=true,
},{
ai("TextButton",{
Size=UDim2.new(1,0,0,ar.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
as,
ai("TextLabel",{
Text=ar.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
as and(-ar.IconSize-10)*2
or(-ar.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
ai("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
at,
ai("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
ai("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,ar.HeaderSize)
},{
ai("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,aq.Gap),
VerticalAlignment="Bottom",
}),
})
})


function ar.Tab(av,aw)
if not ar.Expandable then
ar.Expandable=true
at.Visible=true
end
aw.Parent=au.Content
return al.New(aw,ap)
end

function ar.Open(av)
if ar.Expandable then
ar.Opened=true
ak(au,0.33,{
Size=UDim2.new(1,0,0,ar.HeaderSize+(au.Content.AbsoluteSize.Y/ap))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ak(at.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function ar.Close(av)
if ar.Expandable then
ar.Opened=false
ak(au,0.26,{
Size=UDim2.new(1,0,0,ar.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(at.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

af.AddSignal(au.TextButton.MouseButton1Click,function()
if ar.Expandable then
if ar.Opened then
ar:Close()
else
ar:Open()
end
end
end)

af.AddSignal(au.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if ar.Opened then
ar:Open()
end
end)

if ar.Opened then
task.spawn(function()
task.wait()
ar:Open()
end)
end



return ar
end


return aa end function a.ac()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.ad()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")

local af={
Margin=8,
Padding=9,
}

local ai=a.load'd'
local ak=ai.New
local al=ai.Tween

function af.new(am,an,ao)
local ap={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.load'ac',
}

local aq=ak("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(1,-((ap.IconSize*2)+(ap.Padding*2)),0,0),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local ar=ak("ImageLabel",{
Image=ai.Icon"x"[1],
ImageRectSize=ai.Icon"x"[2].ImageRectSize,
ImageRectOffset=ai.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
},{
ak("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})

local as=ak("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false,
},{
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ak("UIPadding",{
PaddingTop=UDim.new(0,ap.Padding),
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
PaddingBottom=UDim.new(0,ap.Padding),
}),
})

local at=ai.NewRoundFrame(ap.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
ai.NewRoundFrame(ap.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Frame",
},{
ak("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ak("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ak("ImageLabel",{
Image=ai.Icon"search"[1],
ImageRectSize=ai.Icon"search"[2].ImageRectSize,
ImageRectOffset=ai.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
}),
aq,
ar,
ak("UIListLayout",{
Padding=UDim.new(0,ap.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ak("UIPadding",{
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
}),
}),
}),
ak("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ak("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=0.9,
Visible=false,
}),
as,
ak("UISizeConstraint",{
MaxSize=Vector2.new(ap.Width,ap.MaxHeight),
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
})

local au=ak("Frame",{
Size=UDim2.new(0,ap.Width,0,0),
AutomaticSize="Y",
Parent=an,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ak("UIScale",{
Scale=0.9,
}),
at,















})

local function CreateSearchTab(av,aw,ax,ay,az,aA)
local aB=ak("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=ay or nil,
},{
ai.NewRoundFrame(ap.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main",
},{
ai.NewRoundFrame(ap.Radius-11,"Glass-1",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Outline",
},{








ak("UIPadding",{
PaddingTop=UDim.new(0,ap.Padding-2),
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
PaddingBottom=UDim.new(0,ap.Padding-2),
}),
ak("ImageLabel",{
Image=ai.Icon(ax)[1],
ImageRectSize=ai.Icon(ax)[2].ImageRectSize,
ImageRectOffset=ai.Icon(ax)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
}),
ak("Frame",{
Size=UDim2.new(1,-ap.IconSize-ap.Padding,0,0),
BackgroundTransparency=1,
},{
ak("TextLabel",{
Text=av,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title",
}),
ak("TextLabel",{
Text=aw or"",
Visible=aw and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.3,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc",
})or nil,
ak("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,ap.Padding),
FillDirection="Horizontal",
}),
}),
},true),
ak("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-ap.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=az,

},{
ai.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
}),
ak("Frame",{
Size=UDim2.new(1,-ap.Padding-2,0,0),
Position=UDim2.new(0,ap.Padding+2,0,0),
BackgroundTransparency=1,
},{
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right",
}),
})



aB.Main.Size=UDim2.new(
1,
0,
0,
aB.Main.Outline.Frame.Desc.Visible
and(((ap.Padding-2)*2)+aB.Main.Outline.Frame.Title.TextBounds.Y+6+aB.Main.Outline.Frame.Desc.TextBounds.Y)
or(((ap.Padding-2)*2)+aB.Main.Outline.Frame.Title.TextBounds.Y)
)

ai.AddSignal(aB.Main.MouseEnter,function()
al(aB.Main,0.04,{ImageTransparency=0.95}):Play()

end)
ai.AddSignal(aB.Main.InputEnded,function()
al(aB.Main,0.08,{ImageTransparency=1}):Play()

end)
ai.AddSignal(aB.Main.MouseButton1Click,function()
if aA then
aA()
end
end)

return aB
end

local function ContainsText(av,aw)
if not aw or aw==""then
return false
end

if not av or av==""then
return false
end

local ax=string.lower(av)
local ay=string.lower(aw)

return string.find(ax,ay,1,true)~=nil
end

local function Search(av)
if not av or av==""then
return{}
end

local aw={}
for ax,ay in next,am.Tabs do
local az=ContainsText(ay.Title or"",av)
local aA={}

for aB,b in next,ay.Elements do
if b.__type~="Section"then
local d=ContainsText(b.Title or"",av)
local f=ContainsText(b.Desc or"",av)

if d or f then
aA[aB]={
Title=b.Title,
Desc=b.Desc,
Original=b,
__type=b.__type,
Index=aB,
}
end
end
end

if az or next(aA)~=nil then
aw[ax]={
Tab=ay,
Title=ay.Title,
Icon=ay.Icon,
Elements=aA,
}
end
end
return aw
end

ai.AddSignal(as.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

al(as,0.06,{
Size=UDim2.new(
1,
0,
0,
math.clamp(
as.UIListLayout.AbsoluteContentSize.Y+(ap.Padding*2),
0,
ap.MaxHeight
)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function ap.Open(av)
task.spawn(function()
at.Frame.Visible=true
au.Visible=true
al(au.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function ap.Close(av,aw)
task.spawn(function()
ao()
at.Frame.Visible=false
al(au.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(0.12)
au.Visible=false
if aw then
au:Destroy()
end
end)
end

ai.AddSignal(ar.TextButton.MouseButton1Click,function()
ap:Close(true)
end)

ap:Open()

function ap.Search(av,aw)
aw=aw or""

local ax=Search(aw)

as.Visible=true
at.Frame.Results.Frame.Visible=true
for ay,az in next,as:GetChildren()do
if az.ClassName~="UIListLayout"and az.ClassName~="UIPadding"then
az:Destroy()
end
end

if ax and next(ax)~=nil then
for ay,az in next,ax do
local aA=ap.Icons.Tab
local aB=CreateSearchTab(az.Title,nil,aA,as,true,function()
ap:Close()
am:SelectTab(ay)
end)
if az.Elements and next(az.Elements)~=nil then
for b,d in next,az.Elements do
local f=ap.Icons[d.__type]
CreateSearchTab(
d.Title,
d.Desc,
f,
aB:FindFirstChild"ParentContainer"and aB.ParentContainer.Frame
or nil,
false,
function()
ap:Close()
am:SelectTab(ay)
if az.Tab.ScrollToTheElement then

az.Tab:ScrollToTheElement(d.Index)
end

end
)

end
end
end
elseif aw~=""then
ak("TextLabel",{
Size=UDim2.new(1,0,0,70),
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.2,
BackgroundTransparency=1,
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Parent=as,
Name="NotFound",
})
else
as.Visible=false
at.Frame.Results.Frame.Visible=false
end
end

ai.AddSignal(aq:GetPropertyChangedSignal"Text",function()
ap:Search(aq.Text)
end)

return ap
end

return af end function a.ae()



local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=aa(game:GetService"UserInputService")
local ai=aa(game:GetService"RunService")
local ak=aa(game:GetService"Players")

local al=workspace.CurrentCamera

local am=a.load't'

local an=a.load'd'
local ao=an.New
local ap=an.Tween


local aq=a.load'w'.New
local ar=a.load'm'.New
local as=a.load'x'.New
local at=a.load'y'

local au=a.load'z'



return function(av)
local aw={
Title=av.Title or"UI Library",
Author=av.Author,
Icon=av.Icon,
IconSize=av.IconSize or 22,
IconThemed=av.IconThemed,
IconRadius=av.IconRadius or 0,
Folder=av.Folder,
Resizable=av.Resizable~=false,
Background=av.Background,
BackgroundImageTransparency=av.BackgroundImageTransparency or 0,
ShadowTransparency=av.ShadowTransparency or 0.6,
User=av.User or{},
Footer=av.Footer or{},
Topbar=av.Topbar or{Height=52,ButtonsType="Default"},

Size=av.Size,

MinSize=av.MinSize or Vector2.new(560,350),
MaxSize=av.MaxSize or Vector2.new(850,560),

TopBarButtonIconSize=av.TopBarButtonIconSize,

ToggleKey=av.ToggleKey,
ElementsRadius=av.ElementsRadius,
Radius=av.Radius or 16,
Transparent=av.Transparent or false,
HideSearchBar=av.HideSearchBar~=false,
ScrollBarEnabled=av.ScrollBarEnabled or false,
SideBarWidth=av.SideBarWidth or 200,
Acrylic=av.Acrylic or false,
NewElements=av.NewElements or false,
IgnoreAlerts=av.IgnoreAlerts or false,
HidePanelBackground=av.HidePanelBackground or false,
AutoScale=av.AutoScale~=false,
OpenButton=av.OpenButton,
DragFrameSize=160,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=av.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=av.Resizable~=false,
IsOpenButtonEnabled=true,

CurrentConfig=nil,
ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

IsPC=false,

Gap=5,

TopBarButtons={},
AllElements={},

ElementConfig={},

PendingFlags={},

IsToggleDragging=false,
}

aw.UICorner=aw.Radius

aw.TopBarButtonIconSize=aw.TopBarButtonIconSize or(aw.Topbar.ButtonsType=="Mac"and 11 or 16)

aw.ElementConfig={
UIPadding=(aw.NewElements and 10 or 13),
UICorner=aw.ElementsRadius or(aw.NewElements and 23 or 16),
}

local ax=aw.Size or UDim2.new(0,580,0,460)
aw.Size=UDim2.new(
ax.X.Scale,
math.clamp(ax.X.Offset,aw.MinSize.X,aw.MaxSize.X),
ax.Y.Scale,
math.clamp(ax.Y.Offset,aw.MinSize.Y,aw.MaxSize.Y)
)

if aw.Topbar=={}then
aw.Topbar={Height=52,ButtonsType="Default"}
end

if not ai:IsStudio()and aw.Folder and writefile then
if not isfolder("WindUI/"..aw.Folder)then
makefolder("WindUI/"..aw.Folder)
end
if not isfolder("WindUI/"..aw.Folder.."/assets")then
makefolder("WindUI/"..aw.Folder.."/assets")
end
if not isfolder(aw.Folder)then
makefolder(aw.Folder)
end
if not isfolder(aw.Folder.."/assets")then
makefolder(aw.Folder.."/assets")
end
end

local ay=ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
})

if aw.Folder then
aw.ConfigManager=au:Init(aw)
end

if aw.Acrylic then local
az=am.AcrylicPaint{UseAcrylic=aw.Acrylic}

aw.AcrylicPaint=az
end

local az=ao("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true,
},{
ao("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})
local aA=an.NewRoundFrame(aw.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
ao("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=an.Icon"expand"[1],
ImageRectOffset=an.Icon"expand"[2].ImageRectPosition,
ImageRectSize=an.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local aB=an.NewRoundFrame(aw.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})









aw.UIElements.SideBar=ao("ScrollingFrame",{
Size=UDim2.new(
1,
aw.ScrollBarEnabled and-3-(aw.UIPadding/2)or 0,
1,
not aw.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
ao("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
ao("UIPadding",{



PaddingBottom=UDim.new(0,aw.UIPadding/2),
}),
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,aw.Gap),
}),
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,aw.UIPadding/2),
PaddingRight=UDim.new(0,aw.UIPadding/2),
PaddingBottom=UDim.new(0,aw.UIPadding/2),
}),

})

aw.UIElements.SideBarContainer=ao("Frame",{
Size=UDim2.new(
0,
aw.SideBarWidth,
1,
aw.User.Enabled and-aw.Topbar.Height-42-(aw.UIPadding*2)or-aw.Topbar.Height
),
Position=UDim2.new(0,0,0,aw.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
ao("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,not aw.HideSearchBar and-45-aw.UIPadding or-aw.UIPadding/2),
Position=UDim2.new(0,0,1,-aw.UIPadding/2),
AnchorPoint=Vector2.new(0,1),
}),
aw.UIElements.SideBar,
})

if aw.ScrollBarEnabled then
as(
aw.UIElements.SideBar,
aw.UIElements.SideBarContainer.Content,
aw,
3,
av.WindUI
)
end

aw.UIElements.MainBar=ao("Frame",{
Size=UDim2.new(1,-aw.UIElements.SideBarContainer.AbsoluteSize.X,1,-aw.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
an.NewRoundFrame(aw.UICorner-(aw.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not aw.HidePanelBackground,
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,aw.UIPadding/2),
PaddingRight=UDim.new(0,aw.UIPadding/2),
PaddingBottom=UDim.new(0,aw.UIPadding/2),
}),
})

local b=ao("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

if af.TouchEnabled and not af.KeyboardEnabled then
aw.IsPC=false
elseif af.KeyboardEnabled then
aw.IsPC=true
else
aw.IsPC=nil
end







local d
if aw.User then
local function GetUserThumb()local
f=ak:GetUserThumbnailAsync(
aw.User.Anonymous and 1 or ak.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return f
end

d=ao("TextButton",{
Size=UDim2.new(
0,
aw.UIElements.SideBarContainer.AbsoluteSize.X-(aw.UIPadding/2),
0,
42+aw.UIPadding
),
Position=UDim2.new(0,aw.UIPadding/2,1,-(aw.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=aw.User.Enabled or false,
},{
an.NewRoundFrame(aw.UICorner-(aw.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline",
},{
ao("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
an.NewRoundFrame(aw.UICorner-(aw.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ao("ImageLabel",{
Image=GetUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=0.93,
},{
ao("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ao("TextLabel",{
Text=aw.User.Anonymous and"Anonymous"or ak.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName",
}),
ao("TextLabel",{
Text=aw.User.Anonymous and"anonymous"or ak.LocalPlayer.Name,
TextSize=15,
TextTransparency=0.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName",
}),
ao("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
}),
}),
ao("UIListLayout",{
Padding=UDim.new(0,aw.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingLeft=UDim.new(0,aw.UIPadding/2),
PaddingRight=UDim.new(0,aw.UIPadding/2),
}),
}),
})

function aw.User.Enable(f)
aw.User.Enabled=true
ap(
aw.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,aw.SideBarWidth,1,-aw.Topbar.Height-42-(aw.UIPadding*2))},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
d.Visible=true
end
function aw.User.Disable(f)
aw.User.Enabled=false
ap(
aw.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,aw.SideBarWidth,1,-aw.Topbar.Height)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
d.Visible=false
end
function aw.User.SetAnonymous(f,g)
if g~=false then
g=true
end
aw.User.Anonymous=g
d.UserIcon.ImageLabel.Image=GetUserThumb()
d.UserIcon.Frame.DisplayName.Text=g and"Anonymous"or ak.LocalPlayer.DisplayName
d.UserIcon.Frame.UserName.Text=g and"anonymous"or ak.LocalPlayer.Name
end

if aw.User.Enabled then
aw.User:Enable()
else
aw.User:Disable()
end

if aw.User.Callback then
an.AddSignal(d.MouseButton1Click,function()
aw.User.Callback()
end)
an.AddSignal(d.MouseEnter,function()
ap(d.UserIcon,0.04,{ImageTransparency=0.95}):Play()
ap(d.Outline,0.04,{ImageTransparency=0.85}):Play()
end)
an.AddSignal(d.InputEnded,function()
ap(d.UserIcon,0.04,{ImageTransparency=1}):Play()
ap(d.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local f
local g

local h=false
local i

local l=typeof(aw.Background)=="string"and string.match(aw.Background,"^video:(.+)")or nil

local m=typeof(aw.Background)=="string"
and not l
and string.match(aw.Background,"^https?://.+")
or nil

local p=typeof(aw.Background)=="string"
and not l
and string.match(aw.Background,"^rbxassetid://%d+")
or nil

local function GetImageExtension(r)
if not r or typeof(r)~="string"then
return".png"
end
local u=r:match"^([^?#]+)"or r
local v=u:match"%.(%w+)$"
if v then
v=v:lower()
if v=="jpg"or v=="jpeg"or v=="png"or v=="webp"then
return"."..v
end
end
return".png"
end



if typeof(aw.Background)=="string"and l then
h=true

if string.find(l,"http")then
local r=(aw.Folder or"Temp").."/assets/."..an.SanitizeFilename(l)..".webm"
if not isfile(r)then
local u,v=pcall(function()





local u=game.HttpGet and game:HttpGet(l)
or an.Request{
Url=l,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(r,u)
end)
if not u then
warn("[ WindUI.Window.Background ] Failed to download video: "..tostring(v))
end
end

local u,v=pcall(function()
return getcustomasset(r)
end)
if not u then
warn("[ WindUI.Window.Background ] Failed to load custom asset: "..tostring(v))
end
warn"[ WindUI.Window.Background ] VideoFrame may not work with custom video"
l=v
end

i=ao("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=l,
Looped=true,
Volume=0,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
}),
})
i:Play()
elseif m then
local r=(aw.Folder or"Temp")
.."/assets/."
..an.SanitizeFilename(m)
..GetImageExtension(m)

if isfile and not isfile(r)then
local u,v=pcall(function()
local u=game.HttpGet and game:HttpGet(m)
or an.Request{
Url=m,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(r,u)
end)

if not u then
warn("[ Window.Background ] Failed to download image: "..tostring(v))
end
end

local u,v=pcall(function()
return getcustomasset(r)
end)

if not u then
warn("[ Window.Background ] Failed to load custom asset: "..tostring(v))
end

i=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=v,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
}),
})
elseif p then
i=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=p,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
}),
})
elseif aw.Background then
i=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(aw.Background)=="string"and aw.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
}),
})
end

local r=an.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
ao("TextButton",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
Name="Frame",
}),
})

function createAuthor(u)
return ao("TextLabel",{
Text=u,
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=aw.UIElements.Main and aw.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor",
},
Name="Author",
})
end

local u
local v

if aw.Author then
u=createAuthor(aw.Author)
end

local x=ao("TextLabel",{
Text=aw.Title,
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="WindowTopbarTitle",
},
})

aw.UIElements.Main=ao("Frame",{
Size=UDim2.new(aw.Size.X.Scale,aw.Size.X.Offset,0,0),
Position=aw.Position,
BackgroundTransparency=1,
Parent=av.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,

},{
av.WindUI.UIScaleObj,
aw.AcrylicPaint and aw.AcrylicPaint.Frame or nil,
b,
an.NewRoundFrame(aw.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground",
},

},{
i,
r,
az,
}),




ay,
aA,
aB,
ao("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,aw.UICorner),
}),
aw.UIElements.SideBarContainer,
aw.UIElements.MainBar,

d,

g,
ao("Frame",{
Size=UDim2.new(1,0,0,aw.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar",
},{
f,






ao("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left",
},{
ao("UIListLayout",{
Padding=UDim.new(0,aw.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
ao("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
x,
u,
}),
ao("UIPadding",{
PaddingLeft=UDim.new(0,4),
}),
}),
ao("CanvasGroup",{
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Center",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
AutomaticSize="Y",
Visible=false,
},{



ao("ScrollingFrame",{
Name="Holder",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,1,0),


},{

ao("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,aw.UIPadding/2),
}),
}),
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(aw.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(aw.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
ao("UIListLayout",{
Padding=UDim.new(0,aw.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,aw.UIPadding),
PaddingLeft=UDim.new(
0,
aw.Topbar.ButtonsType=="Default"and aw.UIPadding or aw.UIPadding-2
),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,aw.UIPadding),
}),
}),
}),
})

an.AddSignal(aw.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local z=0
local A=aw.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
/av.WindUI.UIScale

z=aw.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/av.WindUI.UIScale
if aw.Topbar.ButtonsType~="Default"then
z=z+A+aw.UIPadding-4
end

aw.UIElements.Main.Main.Topbar.Center.Position=
UDim2.new(0,z+(aw.UIPadding/av.WindUI.UIScale),0.5,0)
aw.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-z
-(aw.UIPadding/av.WindUI.UIScale)
-(aw.Topbar.ButtonsType=="Default"and A+aw.UIPadding or 0),
1,
0
)
end)

if aw.Topbar.ButtonsType~="Default"then
an.AddSignal(aw.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
aw.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(
0,
(aw.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/av.WindUI.UIScale)+aw.UIPadding-4,
0,
0
)
end)
end

function aw.CreateTopbarButton(z,A,B,C,F,G,H,J)
local L=an.Image(
B,
B,
0,
aw.Folder,
"WindowTopbarIcon",
aw.Topbar.ButtonsType=="Default"and true or false,
G,
"WindowTopbarButtonIcon"
)
L.Size=aw.Topbar.ButtonsType=="Default"
and UDim2.new(0,J or aw.TopBarButtonIconSize,0,J or aw.TopBarButtonIconSize)
or UDim2.new(0,0,0,0)
L.AnchorPoint=Vector2.new(0.5,0.5)
L.Position=UDim2.new(0.5,0,0.5,0)
L.ImageLabel.ImageTransparency=aw.Topbar.ButtonsType=="Default"and 0 or 1

if aw.Topbar.ButtonsType~="Default"then
L.ImageLabel.ImageColor3=an.GetTextColorForHSB(H)
end

local M=an.NewRoundFrame(
aw.Topbar.ButtonsType=="Default"and aw.UICorner-(aw.UIPadding/2)or 999,
"Squircle",
{
Size=aw.Topbar.ButtonsType=="Default"
and UDim2.new(0,aw.Topbar.Height-16,0,aw.Topbar.Height-16)
or UDim2.new(0,14,0,14),
LayoutOrder=F or 999,


ZIndex=9999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=aw.Topbar.ButtonsType~="Default"and(H or Color3.fromHex"#ff3030")or nil,
ThemeTag=aw.Topbar.ButtonsType=="Default"and{
ImageColor3="Text",
}or nil,
ImageTransparency=aw.Topbar.ButtonsType=="Default"and 1 or 0,
},
{












L,
ao("UIScale",{
Scale=1,
}),
},
true
)

local N=ao("Frame",{
Size=aw.Topbar.ButtonsType~="Default"and UDim2.new(0,24,0,24)
or UDim2.new(0,aw.Topbar.Height-16,0,aw.Topbar.Height-16),
BackgroundTransparency=1,
Parent=aw.UIElements.Main.Main.Topbar.Right,
LayoutOrder=F or 999,
},{
M,
})



aw.TopBarButtons[100-F]={
Name=A,
Object=N,
}

an.AddSignal(M.MouseButton1Click,function()
if C then
C()
end
end)
an.AddSignal(M.MouseEnter,function()
if aw.Topbar.ButtonsType=="Default"then
ap(M,0.15,{ImageTransparency=0.93}):Play()


else

ap(
L.ImageLabel,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ap(L,0.1,{
Size=UDim2.new(
0,
J or aw.TopBarButtonIconSize,
0,
J or aw.TopBarButtonIconSize
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)

an.AddSignal(M.MouseButton1Down,function()
ap(M.UIScale,0.2,{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

an.AddSignal(M.MouseLeave,function()
if aw.Topbar.ButtonsType=="Default"then
ap(M,0.1,{ImageTransparency=1}):Play()


else

ap(
L.ImageLabel,
0.1,
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ap(
L,
0.1,
{Size=UDim2.new(0,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end)

an.AddSignal(M.InputEnded,function()
ap(M.UIScale,0.2,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end)

return M
end

function aw.Topbar.Button(z,A:{
Name:string,
Icon:string,
Callback:any,
LayoutOrder:number,
IconThemed:boolean,
Color:Color3,
IconSize:number,
})
return aw:CreateTopbarButton(
A.Name,
A.Icon,
A.Callback,
A.LayoutOrder or 0,
A.IconThemed,
A.Color,
A.IconSize
)
end



local z=an.Drag(
aw.UIElements.Main,
{aw.UIElements.Main.Main.Topbar,r.Frame},
function(z,A)
if not aw.Closed then
if z and A==r.Frame then
ap(r,0.1,{ImageTransparency=0.35}):Play()
else
ap(r,0.2,{ImageTransparency=0.8}):Play()
end
aw.Position=aw.UIElements.Main.Position
aw.Dragging=z
end
end
)

if not h and aw.Background and typeof(aw.Background)=="table"then
local A=ao"UIGradient"
for B,C in next,aw.Background do
A[B]=C
end

aw.UIElements.BackgroundGradient=an.NewRoundFrame(aw.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=aw.UIElements.Main.Background,
ImageTransparency=aw.Transparent and av.WindUI.TransparencyValue or 0,
},{
A,
})
end














aw.OpenButtonMain=a.load'A'.New(aw)

task.spawn(function()
if aw.Icon then
local A=ao("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=aw.UIElements.Main.Main.Topbar.Left,
})

v=an.Image(
aw.Icon,
aw.Title,
aw.IconRadius,
aw.Folder,
"Window",
true,
aw.IconThemed,
"WindowTopbarIcon"
)
v.Parent=A
v.Size=UDim2.new(0,aw.IconSize,0,aw.IconSize)
v.Position=UDim2.new(0.5,0,0.5,0)
v.AnchorPoint=Vector2.new(0.5,0.5)

aw.OpenButtonMain:SetIcon(aw.Icon)











else
aw.OpenButtonMain:SetIcon(aw.Icon)

end
end)

function aw.SetToggleKey(A,B)
aw.ToggleKey=B
end

function aw.SetTitle(A,B)
aw.Title=B
x.Text=B
end

function aw.SetAuthor(A,B)
aw.Author=B
if not u then
u=createAuthor(aw.Author)
end

u.Text=B
end

function aw.SetSize(A,B)
if typeof(B)=="UDim2"then
aw.Size=B

ap(aw.UIElements.Main,0.08,{Size=B},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

function aw.SetBackgroundImage(A,B)
aw.UIElements.Main.Background.ImageLabel.Image=B
end
function aw.SetBackgroundImageTransparency(A,B)
if i and i:IsA"ImageLabel"then
i.ImageTransparency=math.floor(B*10+0.5)/10
end
aw.BackgroundImageTransparency=math.floor(B*10+0.5)/10
end

function aw.SetBackgroundTransparency(A,B)
local C=math.floor(tonumber(B)*10+0.5)/10
av.WindUI.TransparencyValue=C
aw:ToggleTransparency(C>0)
end

local A
local B
an.Icon"minimize"
an.Icon"maximize"

aw:CreateTopbarButton(
"Fullscreen",
aw.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"maximize",
function()
aw:ToggleFullscreen()
end,
(aw.Topbar.ButtonsType=="Default"and 998 or 999),
true,
Color3.fromHex"#60C762",
aw.Topbar.ButtonsType=="Mac"and 9 or nil
)

local function SetSize(C)
ap(aw.UIElements.Main,0.45,{
Size=not aw.IsFullscreen and B or UDim2.new(
0,
(av.WindUI.ScreenGui.AbsoluteSize.X-20)/av.WindUI.UIScale,
0,
(av.WindUI.ScreenGui.AbsoluteSize.Y-20-52)/av.WindUI.UIScale
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ap(
aw.UIElements.Main,
0.45,
{Position=not aw.IsFullscreen and A or UDim2.new(0.5,0,0.5,26)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end

function aw.ToggleFullscreen(C)
local F=aw.IsFullscreen

z:Set(F)

if not F then
A=aw.UIElements.Main.Position
B=aw.UIElements.Main.Size

aw.CanResize=false
else
if aw.Resizable then
aw.CanResize=true
end
end

aw.IsFullscreen=not F

SetSize(true)
end

an.AddSignal(av.WindUI.ScreenGui:GetPropertyChangedSignal"AbsoluteSize",function()
if aw.IsFullscreen then
SetSize()
end
end)

aw:CreateTopbarButton("Minimize","minus",function()
if aw.Close then
aw:Close()
end






















end,(aw.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#F4C948")

function aw.OnOpen(C,F)
aw.OnOpenCallback=F
end
function aw.OnClose(C,F)
aw.OnCloseCallback=F
end
function aw.OnDestroy(C,F)
aw.OnDestroyCallback=F
end

if av.WindUI.UseAcrylic then
aw.AcrylicPaint.AddParent(aw.UIElements.Main)
end

function aw.SetIconSize(C,F)
local G
if typeof(F)=="number"then
G=UDim2.new(0,F,0,F)
aw.IconSize=F
elseif typeof(F)=="UDim2"then
G=F
aw.IconSize=F.X.Offset
end

if v then
v.Size=G
end
end

function aw.Open(C)
if aw.Destroyed then
return
end
task.spawn(function()
if aw.OnOpenCallback then
task.spawn(function()
an.SafeCallback(aw.OnOpenCallback)
end)
end

task.wait(0.06)
aw.Closed=false

aw.UIElements.Main.Size=UDim2.new(aw.Size.X.Scale,aw.Size.X.Offset,0,100)

ap(aw.UIElements.Main,0.8,{

Size=aw.Size,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if aw.UIElements.BackgroundGradient then
ap(aw.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

aw.UIElements.Main.Background.ImageTransparency=1
ap(aw.UIElements.Main.Background,0.4,{

ImageTransparency=aw.Transparent and av.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if i then
if i:IsA"VideoFrame"then
i.Visible=true
else
ap(i,0.2,{
ImageTransparency=aw.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

if aw.OpenButtonMain and aw.IsOpenButtonEnabled then
aw.OpenButtonMain:Visible(false)
end









ap(
b,
0.25,
{ImageTransparency=aw.ShadowTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()




ap(
r,
0.45,
{Size=UDim2.new(0,aw.DragFrameSize,0,4),ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
z:Set(true)

if aw.Resizable then
ap(
az.ImageLabel,
0.45,
{ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
aw.CanResize=true
end

aw.CanDropdown=true
aw.UIElements.Main.Visible=true



aw.UIElements.Main:WaitForChild"Main".Visible=true

av.WindUI:ToggleAcrylic(true)

end)
end
function aw.Close(C)
if aw.Destroyed then
return
end

local F={}

if aw.OnCloseCallback then
task.spawn(function()
an.SafeCallback(aw.OnCloseCallback)
end)
end

av.WindUI:ToggleAcrylic(false)

if aw.UIElements.Main and aw.UIElements.Main:WaitForChild"Main"then
aw.UIElements.Main.Main.Visible=false
end

aw.CanDropdown=false
aw.Closed=true

ap(aw.UIElements.Main,0.9,{

Size=UDim2.new(aw.Size.X.Scale,aw.Size.X.Offset,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if aw.UIElements.BackgroundGradient then
ap(aw.UIElements.BackgroundGradient,0.2,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

ap(aw.UIElements.Main.Background,0.3,{

ImageTransparency=1,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()








if i then
if i:IsA"VideoFrame"then
i.Visible=false
else
ap(i,0.3,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
ap(b,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()




ap(
r,
0.3,
{Size=UDim2.new(0,0,0,4),ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut
):Play()
ap(
az.ImageLabel,
0.3,
{ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
z:Set(false)
aw.CanResize=false

task.spawn(function()
task.wait(0.4)

if not aw.Closed then
return
end

aw.UIElements.Main.Visible=false

if aw.OpenButtonMain and not aw.Destroyed and not aw.IsPC and aw.IsOpenButtonEnabled then
aw.OpenButtonMain:Visible(true)
end
end)

function F.Destroy(G)
task.spawn(function()
if aw.OnDestroyCallback then
task.spawn(function()
an.SafeCallback(aw.OnDestroyCallback)
end)
end

if aw.AcrylicPaint and aw.AcrylicPaint.Model then
aw.AcrylicPaint.Model:Destroy()
end

aw.Destroyed=true

task.wait(0.4)

av.WindUI.ScreenGui:Destroy()
av.WindUI.NotificationGui:Destroy()
av.WindUI.DropdownGui:Destroy()
av.WindUI.TooltipGui:Destroy()

an.DisconnectAll()

return
end)
end

return F
end
function aw.Destroy(C)
return aw:Close():Destroy()
end
function aw.Toggle(C)
if aw.Closed then
aw:Open()
else
aw:Close()
end
end

function aw.ToggleTransparency(C,F)

aw.Transparent=F
av.WindUI.Transparent=F

aw.UIElements.Main.Background.ImageTransparency=F and av.WindUI.TransparencyValue or 0


end

function aw.LockAll(C)
for F,G in next,aw.AllElements do
if G.Lock then
G:Lock()
end
end
end
function aw.UnlockAll(C)
for F,G in next,aw.AllElements do
if G.Unlock then
G:Unlock()
end
end
end
function aw.GetLocked(C)
local F={}

for G,H in next,aw.AllElements do
if H.Locked then
table.insert(F,H)
end
end

return F
end
function aw.GetUnlocked(C)
local F={}

for G,H in next,aw.AllElements do
if H.Locked==false then
table.insert(F,H)
end
end

return F
end

function aw.GetUIScale(C,F)
return av.WindUI.UIScale
end

function aw.SetUIScale(C,F)
av.WindUI.UIScale=F
ap(av.WindUI.UIScaleObj,0.2,{Scale=F},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return aw
end

function aw.SetToTheCenter(C)
ap(
aw.UIElements.Main,
0.45,
{Position=UDim2.new(0.5,0,0.5,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
return aw
end

function aw.SetCurrentConfig(C,F)
aw.CurrentConfig=F
end

do
local C=40
local F=al.ViewportSize
local G=Vector2.new(aw.Size.X.Offset,aw.Size.Y.Offset)

if not aw.IsFullscreen and aw.AutoScale then
local H=F.X-(C*2)
local J=F.Y-(C*2)

local L=H/G.X
local M=J/G.Y

local N=math.min(L,M)

local O=0.3
local P=1.0

local Q=math.clamp(N,O,P)

local R=aw:GetUIScale()or 1
local S=0.05

if math.abs(Q-R)>S then
aw:SetUIScale(Q)
end
end
end

if aw.OpenButtonMain and aw.OpenButtonMain.Button then
an.AddSignal(aw.OpenButtonMain.Button.TextButton.MouseButton1Click,function()


aw:Open()
end)
end

an.AddSignal(af.InputBegan,function(C,F)
if F then
return
end

if aw.ToggleKey then
if C.KeyCode==aw.ToggleKey then
aw:Toggle()
end
end
end)

task.spawn(function()

aw:Open()
end)

function aw.EditOpenButton(C,F)
return aw.OpenButtonMain:Edit(F)
end

if aw.OpenButton and typeof(aw.OpenButton)=="table"then
aw:EditOpenButton(aw.OpenButton)
end

local C=a.load'aa'
local F=a.load'ab'
local G=C.Init(aw,av.WindUI,av.WindUI.TooltipGui)
G:OnChange(function(H)
aw.CurrentTab=H
end)

aw.TabModule=G

function aw.Tab(H,J)
J.Parent=aw.UIElements.SideBar.Frame
return G.New(J,av.WindUI.UIScale)
end

function aw.SelectTab(H,J)
G:SelectTab(J)
end

function aw.Section(H,J)
return F.New(
J,
aw.UIElements.SideBar.Frame,
aw.Folder,
av.WindUI.UIScale,
aw
)
end

function aw.IsResizable(H,J)
aw.Resizable=J
aw.CanResize=J
end

function aw.SetPanelBackground(H,J)
if typeof(J)=="boolean"then
aw.HidePanelBackground=J

aw.UIElements.MainBar.Background.Visible=J

if G then
for L,M in next,G.Containers do
M.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,aw.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingLeft=
UDim.new(0,aw.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingRight=
UDim.new(0,aw.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingBottom=
UDim.new(0,aw.HidePanelBackground and 20 or 10)
end
end
end
end

function aw.Divider(H)
local J=ao("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
})
local L=ao("Frame",{
Parent=aw.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
J,
})

return L
end

local H=a.load'o'
function aw.Dialog(J,L)
local M={
Title=L.Title or"Dialog",
Width=L.Width or 320,
Content=L.Content,
Buttons=L.Buttons or{},

TextPadding=14,
}
local N=H.Create(false,"Dialog",aw,av.WindUI,aw.UIElements.Main.Main)

N.UIElements.Main.Size=UDim2.new(0,M.Width,0,0)

local O=ao("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=N.UIElements.Main,
},{
ao("UIListLayout",{
FillDirection="Vertical",

Padding=UDim.new(0,N.UIPadding),
}),
})

local P=ao("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O,
},{
ao("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,N.UIPadding),
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,M.TextPadding/2),
PaddingLeft=UDim.new(0,M.TextPadding/2),
PaddingRight=UDim.new(0,M.TextPadding/2),
}),
})

local Q
if L.Icon then
Q=an.Image(
L.Icon,
M.Title..":"..L.Icon,
0,
aw,
"Dialog",
true,
L.IconThemed
)
Q.Size=UDim2.new(0,22,0,22)
Q.Parent=P
end

N.UIElements.UIListLayout=ao("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
VerticalFlex="SpaceBetween",
Parent=N.UIElements.Main,
})

ao("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=N.UIElements.Main,
})

N.UIElements.Title=ao("TextLabel",{
Text=M.Title,
TextSize=20,
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,Q and-26-N.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=P,
})
if M.Content then
ao("TextLabel",{
Text=M.Content,
TextSize=18,
TextTransparency=0.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=O,
},{
ao("UIPadding",{
PaddingLeft=UDim.new(0,M.TextPadding/2),
PaddingRight=UDim.new(0,M.TextPadding/2),
PaddingBottom=UDim.new(0,M.TextPadding/2),
}),
})
end

local R=ao("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
HorizontalFlex="Fill",
})

local S=ao("Frame",{
Size=UDim2.new(1,0,0,36),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=N.UIElements.Main,
LayoutOrder=4,
},{
R,






})

local T={}

for U,V in next,M.Buttons do
local W=
ar(V.Title,V.Icon,V.Callback,V.Variant,S,N,true)
table.insert(T,W)
W.Size=UDim2.new(1,0,1,0)
end





















































N:Open()

return N
end

local J=false

aw:CreateTopbarButton("Close","x",function()
if not J then
if not aw.IgnoreAlerts then
J=true

aw:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()
J=false
end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()
J=false
aw:Destroy()
end,
Variant="Primary",
},
},
}
else
aw:Destroy()
end
end
end,(aw.Topbar.ButtonsType=="Default"and 999 or 997),nil,Color3.fromHex"#F4695F")

function aw.Tag(L,M)
if aw.UIElements.Main.Main.Topbar.Center.Visible==false then
aw.UIElements.Main.Main.Topbar.Center.Visible=true
end
M.Window=aw
return at:New(M,aw.UIElements.Main.Main.Topbar.Center.Holder)
end

local L=av.WindUI.GenerateGUID()

local function startResizing(M)
if aw.CanResize then
isResizing=true
aA.Active=true
initialSize=aw.UIElements.Main.Size
initialInputPosition=M.Position


ap(az.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

an.AddSignal(M.Changed,function()
if M.UserInputState==Enum.UserInputState.End then
if av.WindUI.CurrentInput and av.WindUI.CurrentInput~=L then
return
end

av.WindUI.CurrentInput=nil

isResizing=false
aA.Active=false


ap(az.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)
end
end

an.AddSignal(az.InputBegan,function(M)
if
M.UserInputType==Enum.UserInputType.MouseButton1
or M.UserInputType==Enum.UserInputType.Touch
then
if av.WindUI.CurrentInput and av.WindUI.CurrentInput~=L then
return
end
av.WindUI.CurrentInput=L

if aw.CanResize then
startResizing(M)
end
end
end)

an.AddSignal(af.InputChanged,function(M)
if
M.UserInputType==Enum.UserInputType.MouseMovement
or M.UserInputType==Enum.UserInputType.Touch
then
if isResizing and aw.CanResize then
local N=M.Position-initialInputPosition
local O=UDim2.new(0,initialSize.X.Offset+N.X*2,0,initialSize.Y.Offset+N.Y*2)

O=UDim2.new(
O.X.Scale,
math.clamp(O.X.Offset,aw.MinSize.X,aw.MaxSize.X),
O.Y.Scale,
math.clamp(O.Y.Offset,aw.MinSize.Y,aw.MaxSize.Y)
)

ap(aw.UIElements.Main,0.08,{
Size=O,
},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

aw.Size=O
end
end
end)

an.AddSignal(az.MouseEnter,function()
if av.WindUI.CurrentInput and av.WindUI.CurrentInput~=L then
return
end
if not isResizing then
ap(az.ImageLabel,0.1,{ImageTransparency=0.35}):Play()
end
end)
an.AddSignal(az.MouseLeave,function()
if av.WindUI.CurrentInput and av.WindUI.CurrentInput~=L then
return
end
if not isResizing then
ap(az.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)



local M=0
local N=0.4
local O
local P=0

function onDoubleClick()
aw:SetToTheCenter()
end

an.AddSignal(r.Frame.MouseButton1Up,function()
local Q=tick()
local R=aw.Position

P=P+1

if P==1 then
M=Q
O=R

task.spawn(function()
task.wait(N)
if P==1 then
P=0
O=nil
end
end)
elseif P==2 then
if Q-M<=N and R==O then
onDoubleClick()
end

P=0
O=nil
M=0
else
P=1
M=Q
O=R
end
end)



if not aw.HideSearchBar then
local Q=a.load'ad'
local R=false





















local S=aq("Search","search",aw.UIElements.SideBarContainer,true)
S.Size=UDim2.new(1,-aw.UIPadding/2,0,39)
S.Position=UDim2.new(0,aw.UIPadding/2,0,0)

an.AddSignal(S.MouseButton1Click,function()
if R then
return
end

Q.new(aw.TabModule,aw.UIElements.Main,function()

R=false
if aw.Resizable then
aw.CanResize=true
end

ap(aB,0.1,{ImageTransparency=1}):Play()
aB.Active=false
end)
ap(aB,0.1,{ImageTransparency=0.65}):Play()
aB.Active=true

R=true
aw.CanResize=false
end)
end



function aw.DisableTopbarButtons(Q,R)
for S,T in next,R do
for U,V in next,aw.TopBarButtons do
if V.Name==T then
V.Object.Visible=false
end
end
end
end



























return aw
end end end

local aa={
Window=nil,
Theme=nil,
Creator=a.load'd',
LocalizationModule=a.load'e',
NotificationModule=a.load'f',
Themes=nil,
Transparent=false,

TransparencyValue=0.15,

UIScale=1,

ConfigManager=nil,
Version="0.0.0",

Services=a.load'k',

OnThemeChangeFunction=nil,

cloneref=nil,
UIScaleObj=nil,

CreateWindow=nil,

CurrentInput=nil,
}

local af=(cloneref or clonereference or function(af)
return af
end)

aa.cloneref=af

local ai=af(game:GetService"HttpService")
local ak=af(game:GetService"Players")
local al=af(game:GetService"CoreGui")
local am=af(game:GetService"RunService")
local an=af(game:GetService"UserInputService")

function aa.GenerateGUID()
return ai:GenerateGUID(false)
end

local ao=aa.GenerateGUID()

an.InputBegan:Connect(function(ap,aq)




task.defer(function()
if
ap.UserInputType==Enum.UserInputType.MouseButton1
or ap.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ao then
return
end

aa.CurrentInput=ao


end
end)
end)
an.InputEnded:Connect(function(ap,aq)
if ap.UserInputType==Enum.UserInputType.MouseButton1 or ap.UserInputType==Enum.UserInputType.Touch then
if aa.CurrentInput and aa.CurrentInput~=ao then
return
end

aa.CurrentInput=nil
end
end)

local ap=ak.LocalPlayer or nil

local aq=ai:JSONDecode(a.load'l')
if aq then
aa.Version=aq.version
end

local ar=a.load'p'

local as=aa.Creator

local at=as.New




local au=a.load't'

local av=protectgui or(syn and syn.protect_gui)or function()end

local aw=gethui and gethui()or(al or ap:WaitForChild"PlayerGui")

local ax=at("UIScale",{
Scale=aa.UIScale,
})

aa.UIScaleObj=ax

aa.ScreenGui=at("ScreenGui",{
Name="WindUI",
Parent=aw,
IgnoreGuiInset=true,
ScreenInsets="None",
DisplayOrder=-99999,
},{

at("Folder",{
Name="Window",
}),






at("Folder",{
Name="KeySystem",
}),
at("Folder",{
Name="Popups",
}),
at("Folder",{
Name="ToolTips",
}),
})

aa.NotificationGui=at("ScreenGui",{
Name="WindUI/Notifications",
Parent=aw,
IgnoreGuiInset=true,
})
aa.DropdownGui=at("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=aw,
IgnoreGuiInset=true,
})
aa.TooltipGui=at("ScreenGui",{
Name="WindUI/Tooltips",
Parent=aw,
IgnoreGuiInset=true,
})
av(aa.ScreenGui)
av(aa.NotificationGui)
av(aa.DropdownGui)
av(aa.TooltipGui)

as.Init(aa)

function aa.SetParent(ay,az)
if aa.ScreenGui then
aa.ScreenGui.Parent=az
end
if aa.NotificationGui then
aa.NotificationGui.Parent=az
end
if aa.DropdownGui then
aa.DropdownGui.Parent=az
end
if aa.TooltipGui then
aa.TooltipGui.Parent=az
end
end
math.clamp(aa.TransparencyValue,0,1)

local ay=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(az,aA)
aA.Holder=ay.Frame
aA.Window=aa.Window

return aa.NotificationModule.New(aA)
end

function aa.SetNotificationLower(az,aA)
ay.SetLower(aA)
end

function aa.SetFont(az,aA)
as.UpdateFont(aA)
end

function aa.OnThemeChange(az,aA)
aa.OnThemeChangeFunction=aA
end

function aa.AddTheme(az,aA)
aa.Themes[aA.Name]=aA
return aA
end

function aa.SetTheme(az,aA)
if aa.Themes[aA]then
aa.Theme=aa.Themes[aA]
as.SetTheme(aa.Themes[aA])

if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(aA)
end

return aa.Themes[aA]
end
return nil
end

function aa.GetThemes(az)
return aa.Themes
end
function aa.GetCurrentTheme(az)
return aa.Theme.Name
end
function aa.GetTransparency(az)
return aa.Transparent or false
end
function aa.GetWindowSize(az)
return aa.Window.UIElements.Main.Size
end
function aa.Localization(az,aA)
return aa.LocalizationModule:New(aA,as)
end

function aa.SetLanguage(az,aA)
if as.Localization then
return as.SetLanguage(aA)
end
return false
end

function aa.ToggleAcrylic(az,aA)
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=aA
aa.Window.AcrylicPaint.Model.Transparency=aA and 0.98 or 1
if aA then
au.Enable()
else
au.Disable()
end
end
end

function aa.Gradient(az,aA,aB)
local b={}
local d={}

for f,g in next,aA do
local h=tonumber(f)
if h then
h=math.clamp(h/100,0,1)

local i=g.Color
if typeof(i)=="string"and string.sub(i,1,1)=="#"then
i=Color3.fromHex(i)
end

local l=g.Transparency or 0

table.insert(b,ColorSequenceKeypoint.new(h,i))
table.insert(d,NumberSequenceKeypoint.new(h,l))
end
end

table.sort(b,function(f,g)
return f.Time<g.Time
end)
table.sort(d,function(f,g)
return f.Time<g.Time
end)

if#b<2 then
table.insert(b,ColorSequenceKeypoint.new(1,b[1].Value))
table.insert(d,NumberSequenceKeypoint.new(1,d[1].Value))
end

local f={
Color=ColorSequence.new(b),
Transparency=NumberSequence.new(d),
}

if aB then
for g,h in pairs(aB)do
f[g]=h
end
end

return f
end

function aa.Popup(az,aA)
aA.WindUI=aa
return a.load'u'.new(aA,aa.ScreenGui.Popups)
end

aa.Themes=a.load'v'(aa,as)

as.Themes=aa.Themes

aa:SetTheme"Dark"
aa:SetLanguage(as.Language)

function aa.CreateWindow(az,aA)
local aB=a.load'ae'

if not am:IsStudio()and writefile then
if not isfolder"WindUI"then
makefolder"WindUI"
end
if aA.Folder then
makefolder(aA.Folder)
else
makefolder(aA.Title)
end
end

aA.WindUI=aa
aA.Window=aa.Window
aA.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local b=true

local d=aa.Themes[aA.Theme or"Dark"]


as.SetTheme(d)

local f=gethwid or function()
return ak.LocalPlayer.UserId
end

local g=f()

if aA.KeySystem then
b=false

local function loadKeysystem()
ar.new(aA,g,function(h)
b=h
end)
end

local h=(aA.Folder or"Temp").."/"..g..".key"

if aA.KeySystem.KeyValidator then
if aA.KeySystem.SaveKey and isfile(h)then
local i=readfile(h)
local l=aA.KeySystem.KeyValidator(i)

if l then
b=true
else
loadKeysystem()
end
else
loadKeysystem()
end
elseif not aA.KeySystem.API then
if aA.KeySystem.SaveKey and isfile(h)then
local i=readfile(h)
local l=(type(aA.KeySystem.Key)=="table")and table.find(aA.KeySystem.Key,i)
or tostring(aA.KeySystem.Key)==tostring(i)

if l then
b=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(h)then
local i=readfile(h)
local l=false

for m,p in next,aA.KeySystem.API do
local r=aa.Services[p.Type]
if r then
local u={}
for v,x in next,r.Args do
table.insert(u,p[x])
end

local v=r.New(table.unpack(u))
local x=v.Verify(i)
if x then
l=true
break
end
end
end

b=l
if not l then
loadKeysystem()
end
else
loadKeysystem()
end
end

repeat
task.wait()
until b
end

local h=aB(aA)

aa.Transparent=aA.Transparent
aa.Window=h

if aA.Acrylic then
au.init()
end













return h
end

return aa]========], "WindUI"))()
local lists={
 ['나라']='Tuvalu|Nauru|Kiribati|Palau|Comoros|Vanuatu|São Tomé and Príncipe|Cabo Verde|Eswatini|Timor-Leste|Djibouti|Lesotho|Micronesia|Marshall Islands|Saint Kitts and Nevis|Saint Vincent and the Grenadines|Dominica|Grenada|Bhutan|Aruba|Afghanistan|Angola|Anguilla|Åland Islands|Albania|Andorra|United Arab Emirates|Argentina|Armenia|American Samoa|Antarctica|French Southern Territories|Antigua and Barbuda|Australia|Austria|Azerbaijan|Burundi|Belgium|Benin|Burkina Faso|Bangladesh|Bulgaria|Bahrain|Bahamas|Bosnia and Herzegovina|Saint Barthélemy|Belarus|Belize|Bermuda|Bolivia|Brazil|Barbados|Brunei Darussalam|Bouvet Island|Botswana|Central African Republic|Canada|Switzerland|Chile|China|Cameroon|Congo|Cook Islands|Colombia|Costa Rica|Cuba|Curaçao|Christmas Island|Cayman Islands|Cyprus|Czechia|Germany|Denmark|Dominican Republic|Algeria|Ecuador|Egypt|Eritrea|Western Sahara|Spain|Estonia|Ethiopia|Finland|Fiji|France|Faroe Islands|Gabon|United Kingdom|Georgia|Guernsey|Ghana|Gibraltar|Guinea|Guadeloupe|Gambia|Guinea-Bissau|Equatorial Guinea|Greece|Greenland|Guatemala|French Guiana|Guam|Guyana|Hong Kong|Heard Island and McDonald Islands|Honduras|Croatia|Haiti|Hungary|Indonesia|Isle of Man|India|British Indian Ocean Territory|Ireland|Iran|Iraq|Iceland|Israel|Italy|Jamaica|Jersey|Jordan|Japan|Kazakhstan|Kenya|Kyrgyzstan|Cambodia|South Korea|Kuwait|Laos|Lebanon|Liberia|Libya|Saint Lucia|Liechtenstein|Sri Lanka|Lithuania|Luxembourg|Latvia|Macao|Morocco|Monaco|Moldova|Madagascar|Maldives|Mexico|North Macedonia|Mali|Malta|Myanmar|Montenegro|Mongolia|Northern Mariana Islands|Mozambique|Mauritania|Montserrat|Martinique|Mauritius|Malawi|Malaysia|Mayotte|Namibia|New Caledonia|Niger|Norfolk Island|Nigeria|Nicaragua|Niue|Netherlands|Norway|Nepal|New Zealand|Oman|Pakistan|Panama|Pitcairn|Peru|Philippines|Papua New Guinea|Poland|Puerto Rico|North Korea|Portugal|Paraguay|French Polynesia|Qatar|Réunion|Romania|Russian Federation|Rwanda|Saudi Arabia|Sudan|Senegal|Singapore|South Georgia and the South Sandwich Islands|Svalbard and Jan Mayen|Solomon Islands|Sierra Leone|El Salvador|San Marino|Somalia|Saint Pierre and Miquelon|Serbia|South Sudan|Sao Tome and Principe|Suriname|Slovakia|Slovenia|Sweden|Seychelles|Syria|Turks and Caicos Islands|Chad|Togo|Thailand|Tajikistan|Tokelau|Turkmenistan|Tonga|Trinidad and Tobago|Tunisia|Türkiye|Taiwan|Tanzania|Uganda|Ukraine|United States Minor Outlying Islands|Uruguay|United States|Uzbekistan|Venezuela|Vietnam|Wallis and Futuna|Samoa|Yemen|South Africa|Zambia|Zimbabwe',
 ['과일']='Salak|Feijoa|Jabuticaba|Langsat|Santol|Cupuaçu|Marang|Cherimoya|Tamarillo|Loquat|Medlar|Rambutan|Mangosteen|Sapodilla|Breadfruit|Longan|Soursop|Jujube|Ackee|Ambarella|Atemoya|Bael|Bilimbi|Calamansi|Canistel|Cempedak|Citron|Cloudberry|Damson|Durian|Gac|Gooseberry|Hala fruit|Hog plum|Ice cream bean|Imbe|Indian gooseberry|Juneberry|Kaffir lime|Kiwano|Kumquat|Lucuma|Mabolo|Mamoncillo|Miracle fruit|Monstera fruit|Nance|Noni|Pawpaw|Pepino|Persimmon|Physalis|Pitanga|Pomelo|Prickly pear|Quince|Redcurrant|Rollinia|Sea buckthorn|Serviceberry|Soncoya|Star apple|Starfruit|Surinam cherry|Ugli fruit|White sapote|Wood apple|Yuzu',
 ['래퍼']='Ka|Aesop Rock|Open Mike Eagle|Quelle Chris|billy woods|Mach-Hommy|Roc Marciano|Blu|Masta Ace|Pharoahe Monch|Jean Grae|Little Simz|Rapsody|Black Thought|Del the Funky Homosapien|Oddisee|Elzhi|Mick Jenkins|Saba|Noname|Smino|Tobe Nwigwe|Mavi|Navy Blue|MIKE|Medhane|Vince Staples|Denzel Curry|Rico Nasty|Tierra Whack|R.A. the Rugged Man|Brother Ali|Slug|Blueprint|Eyedea|Kool Keith|Jeru the Damaja|KRS-One|Rakim|Big Daddy Kane|Slick Rick|Kool G Rap|Bahamadia|Lady of Rage|Rah Digga|Diamond D|O.C.|Buckshot|Sean Price|Guilty Simpson|Black Milk|Danny Brown|Boldy James|Rome Streetz|Benny the Butcher|Conway the Machine|Westside Gunn|Flee Lord|Your Old Droog|Homeboy Sandman|Busdriver|Saul Williams|K-Rino',
 ['동물']='Saola|Okapi|Aye-aye|Fossa|Quoll|Numbat|Takin|Dhole|Binturong|Jerboa|Pangolin|Echidna|Kakapo|Shoebill|Gerenuk|Markhor|Bilby|Tenrec|Agouti|Almiqui|Ankole cattle|Argali|Arapaima|Axolotl|Babirusa|Banded linsang|Bongo|Bonobo|Bush dog|Cacomistle|Cassowary|Civet|Coati|Colugo|Coypu|Cusimanse|Degu|Dik-dik|Duiker|Eland|Fennec fox|Fisher|Flat-headed cat|Flying fox|Galago|Gaur|Genet|Gharial|Giant anteater|Giant isopod|Gibbon|Goral|Grison|Hirola|Hoatzin|Hyrax|Ibex|Indri|Irrawaddy dolphin|Jacana|Jaguarundi|Kinkajou|Kiwi|Klipspringer|Kob|Kouprey|Kudu|Lemming|Leopard seal|Loris|Mara|Margay|Musk deer|Nilgai|Olinguito|Onager|Oribi|Paca|Pika|Potoroo|Pronghorn|Quokka|Ratel|Ringtail|Saiga|Saki|Sand cat|Serow|Sifaka|Slender mongoose|Solenodon|Springhare|Sun bear|Tarsier|Tayra|Tuco-tuco|Vaquita|Vicuna|Viscacha|Wallaroo|Water chevrotain|Wolverine|Woylie|Zebra duiker|Zorilla',
}
lists['곤충·벌레']='Ant|Bee|Butterfly|Moth|Fly|Mosquito|Beetle|Ladybug|Grasshopper|Cricket|Dragonfly|Damselfly|Firefly|Termite|Cockroach|Flea|Louse|Aphid|Cicada|Weevil|Earwig|Silverfish|Mayfly|Stonefly|Caddisfly|Lacewing|Antlion|Praying mantis|Stick insect|Leaf insect|Water strider|Water boatman|Diving beetle|Dung beetle|Stag beetle|Rhinoceros beetle|Tiger beetle|Bombardier beetle|Click beetle|Jewel beetle|Goliath beetle|Atlas moth|Luna moth|Hercules beetle|Assassin bug|Stink bug|Mealybug|Bumblebee|Hornet|Wasp|Tsetse fly|Horsefly|Hoverfly|Crane fly|Scorpionfly|Dobsonfly'
lists['채소']='Carrot|Potato|Onion|Garlic|Cabbage|Lettuce|Cucumber|Spinach|Broccoli|Cauliflower|Celery|Pumpkin|Zucchini|Eggplant|Radish|Turnip|Beetroot|Pea|Green bean|Corn|Kale|Chard|Leek|Shallot|Asparagus|Artichoke|Okra|Parsnip|Rutabaga|Celeriac|Kohlrabi|Romanesco|Bok choy|Napa cabbage|Daikon|Watercress|Sorrel|Endive|Radicchio|Chayote|Jicama|Salsify|Scorzonera|Fiddlehead|Taro|Lotus root|Bamboo shoot|Burdock root|Yam|Cassava|Malabar spinach|Mustard greens|Collard greens|Komatsuna|Tatsoi|Oca|Ulluco|Yacon|Crosne|Samphire'
lists['새']='Sparrow|Pigeon|Crow|Eagle|Owl|Parrot|Duck|Goose|Swan|Penguin|Flamingo|Peacock|Woodpecker|Hummingbird|Pelican|Toucan|Hoopoe|Kakapo|Kea|Shoebill|Secretary bird|Cassowary|Kookaburra|Tawny frogmouth|Oilbird|Tinamou|Jacana|Sunbittern|Trumpeter|Kagu|Ibis|Potoo|Resplendent quetzal|Great bustard'
lists['물고기']='Goldfish|Salmon|Tuna|Cod|Trout|Carp|Catfish|Sardine|Herring|Mackerel|Anchovy|Guppy|Betta|Angelfish|Clownfish|Lionfish|Stonefish|Archerfish|Mudskipper|Paddlefish|Sturgeon|Arapaima|Arowana|Coelacanth|Lungfish|Oarfish|Barreleye|Hagfish|Lamprey|Goblin shark|Wobbegong|Sawfish|Mola mola|Humphead wrasse'
lists['색깔']='Red|Blue|Yellow|Green|Orange|Purple|Pink|Black|White|Gray|Brown|Beige|Teal|Cyan|Magenta|Indigo|Turquoise|Violet|Maroon|Ochre|Sienna|Umber|Cerulean|Viridian|Chartreuse|Vermilion|Periwinkle|Ecru|Mauve|Fuchsia|Celadon|Puce|Aubergine|Gamboge'
lists['직업']='Teacher|Doctor|Nurse|Engineer|Pilot|Chef|Firefighter|Police officer|Farmer|Artist|Musician|Architect|Mechanic|Carpenter|Electrician|Plumber|Librarian|Translator|Editor|Paramedic|Astronomer|Cartographer|Archivist|Taxidermist|Watchmaker|Glassblower|Farrier|Foley artist|Perfumer|Paleontologist|Geochemist|Luthier|Ceramicist|Restorer'
lists['스포츠']='Football|Basketball|Baseball|Tennis|Volleyball|Badminton|Swimming|Boxing|Wrestling|Golf|Rugby|Cricket|Hockey|Cycling|Archery|Fencing|Judo|Karate|Taekwondo|Handball|Water polo|Curling|Biathlon|Skeleton|Luge|Kabaddi|Sepak takraw|Bandy|Pesapallo|Bocce|Squash|Netball|Orienteering|Underwater hockey'
lists['악기']='Piano|Guitar|Violin|Drums|Flute|Trumpet|Saxophone|Clarinet|Cello|Trombone|Oboe|Bassoon|Harp|Accordion|Banjo|Ukulele|Mandolin|Harmonica|Tuba|Marimba|Xylophone|Theremin|Dulcimer|Erhu|Pipa|Gayageum|Haegeum|Koto|Shamisen|Sitar|Sarangi|Oud|Kora|Nyckelharpa|Hurdy-gurdy'
local songs={
 ['taylor swift']='The Outside|A Perfectly Good Heart|Come In With the Rain|Superstar|The Other Side of the Door|If This Was a Movie',
 ['ariana grande']='Piano|Daydreamin’|Tattooed Heart|Sometimes|Leave Me Lonely|Better Left Unsaid',
 ['drake']='The Resistance|Karaoke|Cece’s Interlude|Fireworks|Look What You’ve Done|The Ride',
 ['eminem']='Infinite|313|Tonite|Searchin’|Jealousy Woes II|Never 2 Far',
 ['bts']='바다|이사|흥탄소년단|고엽|잡아줘|둘! 셋!',
 ['iu']='마음|무릎|안경|새 신발|푸르던|을의 연애',
 ['blackpink']='Hope Not|Really|See U Later|You Never Know|Kick It|Don’t Know What To Do',
 ['billie eilish']='hostage|8|ilomilo|listen before i go|Halley’s Comet|Male Fantasy',
 ['the weeknd']='Loft Music|The Knowing|Montreal|Outside|The Fall|Till Dawn (Here Comes the Sun)',
 ['kanye west']='Family Business|Spaceship|Bring Me Down|Roses|Drive Slow|Gone',
}
songs['아이유']=songs.iu;songs['방탄소년단']=songs.bts;songs['블랙핑크']=songs.blackpink

-- v4: 415 named topics; hints only. No answer submission.
local extraTopics = {
 {title="가수", aliases={"singer","vocalist","가수"}, words="Adele|Bruno Mars|Sia|Sting|Enya|Aurora|Laufey|Hozier"},
 {title="음식", aliases={"food","dish","음식"}, words="Risotto|Paella|Goulash|Pierogi|Falafel|Biryani|Shakshuka|Ceviche"},
 {title="음료", aliases={"drink","beverage","음료"}, words="Lassi|Horchata|Kefir|Kombucha|Ayran|Kvass|Sikhye|Mate"},
 {title="디저트", aliases={"dessert","디저트"}, words="Baklava|Tiramisu|Pavlova|Cannoli|Panna cotta|Knafeh|Mochi|Halva"},
 {title="도시", aliases={"city","cities","도시"}, words="Tbilisi|Valletta|Ljubljana|Muscat|Bergen|Porto|Tartu|Luang Prabang"},
 {title="꽃", aliases={"flower","꽃"}, words="Anemone|Freesia|Delphinium|Hellebore|Lisianthus|Protea|Zinnia|Cosmos"},
 {title="나무", aliases={"tree","나무"}, words="Baobab|Ginkgo|Sequoia|Jacaranda|Tamarack|Yew|Larch|Banyan"},
 {title="탈것", aliases={"vehicle","transport","탈것","교통수단"}, words="Tram|Gondola|Rickshaw|Hovercraft|Monorail|Funicular|Airship|Hydrofoil"},
 {title="자동차 브랜드", aliases={"car brand","car manufacturer","자동차 브랜드"}, words="Saab|Skoda|Dacia|Alpine|Lancia|Pagani|Koenigsegg|Rimac"},
 {title="옷", aliases={"clothing","garment","옷","의류"}, words="Cardigan|Poncho|Kimono|Kaftan|Parka|Waistcoat|Sarong|Anorak"},
 {title="신발", aliases={"shoe","footwear","신발"}, words="Loafer|Moccasin|Espadrille|Brogue|Clog|Sandal|Boot|Sneaker"},
 {title="주방용품", aliases={"kitchen utensil","kitchenware","주방용품"}, words="Colander|Ladle|Whisk|Spatula|Mortar|Grater|Peeler|Sieve"},
 {title="학용품", aliases={"school supply","school supplies","stationery","학용품"}, words="Protractor|Compass|Eraser|Ruler|Stapler|Highlighter|Notebook|Binder"},
 {title="가구", aliases={"furniture","가구"}, words="Ottoman|Armoire|Credenza|Sideboard|Chaise longue|Bookcase|Stool|Settee"},
 {title="전자제품", aliases={"electronic device","electronics","전자제품"}, words="Projector|Scanner|Printer|Router|Tablet|Radio|Calculator|Camcorder"},
 {title="비디오 게임", aliases={"video game","computer game","비디오 게임"}, words="Terraria|Stardew Valley|Hollow Knight|Celeste|Hades|Undertale|Portal|Minecraft"},
 {title="슈퍼히어로", aliases={"superhero","슈퍼히어로"}, words="Zatanna|Blue Beetle|Moon Knight|Raven|Shazam|Daredevil|Storm|Cyborg"},
 {title="공룡", aliases={"dinosaur","공룡"}, words="Amargasaurus|Therizinosaurus|Deinocheirus|Carnotaurus|Baryonyx|Ouranosaurus|Iguanodon|Kentrosaurus"},
 {title="포유류", aliases={"mammal","포유류"}, words="Okapi|Saola|Quokka|Numbat|Takin|Binturong|Dhole|Tenrec"},
 {title="파충류", aliases={"reptile","파충류"}, words="Tuatara|Gharial|Komodo dragon|Chameleon|Iguana|Skink|Gecko|Slow worm"},
 {title="해양 동물", aliases={"sea animal","marine animal","해양 동물","바다 동물"}, words="Dugong|Narwhal|Manatee|Beluga|Walrus|Sea otter|Cuttlefish|Nautilus"},
 {title="민물 동물", aliases={"freshwater animal","민물 동물"}, words="Beaver|Otter|Axolotl|Crayfish|Platypus|Capybara|Hippopotamus|Freshwater stingray"},
 {title="사막 동물", aliases={"desert animal","사막 동물"}, words="Fennec fox|Jerboa|Dromedary|Addax|Sand cat|Oryx|Thorny devil|Gila monster"},
 {title="멸종 동물", aliases={"extinct animal","멸종 동물"}, words="Dodo|Thylacine|Quagga|Great auk|Steller's sea cow|Passenger pigeon|Woolly mammoth|Moa"},
 {title="유대류", aliases={"marsupial","유대류"}, words="Wombat|Numbat|Quoll|Bilby|Kangaroo|Wallaby|Koala|Tasmanian devil"},
 {title="영장류", aliases={"primate","영장류"}, words="Aye-aye|Indri|Sifaka|Tarsier|Gibbon|Bonobo|Marmoset|Mandrill"},
 {title="고양잇과", aliases={"wild cat","feline","고양잇과"}, words="Margay|Serval|Caracal|Ocelot|Pallas's cat|Jaguarundi|Lynx|Clouded leopard"},
 {title="개 품종", aliases={"dog breed","개 품종","강아지 품종"}, words="Basenji|Borzoi|Saluki|Azawakh|Schipperke|Keeshond|Puli|Whippet"},
 {title="농장 동물", aliases={"farm animal","livestock","농장 동물","가축"}, words="Alpaca|Llama|Goat|Sheep|Pig|Cow|Duck|Goose"},
 {title="야행성 동물", aliases={"nocturnal animal","야행성 동물"}, words="Aye-aye|Owl|Bat|Fennec fox|Slow loris|Kinkajou|Hedgehog|Sugar glider"},
 {title="날지 못하는 새", aliases={"flightless bird","날지 못하는 새"}, words="Kakapo|Kiwi|Emu|Ostrich|Cassowary|Rhea|Takahe|Penguin"},
 {title="물새", aliases={"water bird","waterfowl","물새"}, words="Grebe|Coot|Moorhen|Loon|Pelican|Cormorant|Swan|Duck"},
 {title="상어", aliases={"shark","상어"}, words="Goblin shark|Basking shark|Whale shark|Thresher shark|Zebra shark|Nurse shark|Blue shark|Wobbegong"},
 {title="문어와 오징어", aliases={"cephalopod","두족류","문어와 오징어"}, words="Nautilus|Cuttlefish|Vampire squid|Dumbo octopus|Mimic octopus|Bobtail squid|Giant squid|Blue-ringed octopus"},
 {title="갑각류", aliases={"crustacean","갑각류"}, words="Krill|Barnacle|Crayfish|Lobster|Mantis shrimp|Hermit crab|Woodlouse|Pill bug"},
 {title="거미류", aliases={"arachnid","거미류"}, words="Tarantula|Scorpion|Harvestman|Tick|Mite|Whip scorpion|Jumping spider|Wolf spider"},
 {title="딱정벌레", aliases={"beetle","딱정벌레"}, words="Stag beetle|Dung beetle|Jewel beetle|Click beetle|Tiger beetle|Goliath beetle|Ladybug|Weevil"},
 {title="벌", aliases={"bee","wasp","벌 종류"}, words="Bumblebee|Honeybee|Carpenter bee|Mason bee|Leafcutter bee|Mining bee|Hornet|Yellowjacket"},
 {title="개미", aliases={"ant","개미"}, words="Weaver ant|Leafcutter ant|Fire ant|Army ant|Carpenter ant|Honeypot ant|Bullet ant|Pharaoh ant"},
 {title="거북", aliases={"turtle","tortoise","거북"}, words="Matamata|Leatherback|Hawksbill|Aldabra tortoise|Galapagos tortoise|Snapping turtle|Box turtle|Pancake tortoise"},
 {title="도마뱀", aliases={"lizard","도마뱀"}, words="Basilisk|Anole|Tokay gecko|Bearded dragon|Thorny devil|Gila monster|Komodo dragon|Frilled lizard"},
 {title="상록수", aliases={"evergreen tree","상록수"}, words="Pine|Spruce|Fir|Cedar|Yew|Cypress|Juniper|Holly"},
 {title="낙엽수", aliases={"deciduous tree","낙엽수"}, words="Oak|Maple|Birch|Beech|Elm|Ash|Ginkgo|Larch"},
 {title="침엽수", aliases={"conifer","침엽수"}, words="Pine|Spruce|Fir|Hemlock|Cedar|Cypress|Larch|Sequoia"},
 {title="허브", aliases={"herb","허브"}, words="Tarragon|Chervil|Lovage|Marjoram|Thyme|Sage|Basil|Dill"},
 {title="향신료", aliases={"spice","향신료"}, words="Sumac|Mace|Cardamom|Saffron|Cumin|Turmeric|Clove|Allspice"},
 {title="버섯", aliases={"mushroom","fungus","버섯"}, words="Morel|Chanterelle|Porcini|Shiitake|Enoki|Maitake|Lion's mane|Oyster mushroom"},
 {title="콩류", aliases={"legume","pulse","콩류"}, words="Lentil|Chickpea|Adzuki bean|Mung bean|Fava bean|Lupin|Soybean|Cowpea"},
 {title="뿌리채소", aliases={"root vegetable","뿌리채소"}, words="Parsnip|Turnip|Radish|Carrot|Beetroot|Celeriac|Rutabaga|Salsify"},
 {title="열대 과일", aliases={"tropical fruit","열대 과일"}, words="Rambutan|Mangosteen|Durian|Langsat|Salak|Jackfruit|Papaya|Passion fruit"},
 {title="감귤류", aliases={"citrus","감귤류"}, words="Yuzu|Pomelo|Citron|Calamansi|Kumquat|Tangelo|Mandarin|Grapefruit"},
 {title="베리류", aliases={"berry","berries","베리류"}, words="Cloudberry|Lingonberry|Bilberry|Gooseberry|Elderberry|Blackberry|Raspberry|Cranberry"},
 {title="다육식물", aliases={"succulent","다육식물"}, words="Echeveria|Haworthia|Lithops|Aloe|Agave|Crassula|Sedum|Kalanchoe"},
 {title="실내 식물", aliases={"houseplant","indoor plant","실내 식물"}, words="Monstera|Pothos|Snake plant|Peace lily|Spider plant|ZZ plant|Rubber plant|Philodendron"},
 {title="꽃이 피는 식물", aliases={"flowering plant","꽃이 피는 식물"}, words="Orchid|Hibiscus|Magnolia|Camellia|Azalea|Gardenia|Begonia|Dahlia"},
 {title="고기 요리", aliases={"meat dish","고기 요리"}, words="Goulash|Rendang|Adobo|Bulgogi|Schnitzel|Osso buco|Moussaka|Satay"},
 {title="생선 요리", aliases={"fish dish","생선 요리"}, words="Ceviche|Gravlax|Fish and chips|Bouillabaisse|Escabeche|Bacalhau|Fish curry|Plaice meuniere"},
 {title="샐러드", aliases={"salad","샐러드"}, words="Tabbouleh|Fattoush|Waldorf salad|Nicoise salad|Caprese|Som tam|Coleslaw|Greek salad"},
 {title="샌드위치", aliases={"sandwich","샌드위치"}, words="Banh mi|Reuben|Cubano|Croque monsieur|Muffuletta|Po' boy|Panini|Bocadillo"},
 {title="빵", aliases={"bread","빵"}, words="Injera|Lavash|Brioche|Focaccia|Naan|Roti|Pumpernickel|Ciabatta"},
 {title="쿠키", aliases={"cookie","biscuit","쿠키"}, words="Speculoos|Amaretti|Biscotti|Shortbread|Snickerdoodle|Macaron|Madeleine|Alfajor"},
 {title="페이스트리", aliases={"pastry","페이스트리"}, words="Kouign-amann|Palmier|Croissant|Danish pastry|Choux|Strudel|Pastel de nata|Eclair"},
 {title="치즈", aliases={"cheese","치즈"}, words="Manchego|Comte|Gruyere|Burrata|Halloumi|Gouda|Stilton|Roquefort"},
 {title="면 요리", aliases={"noodle dish","면 요리"}, words="Pho|Laksa|Pad thai|Japchae|Udon|Ramen|Naengmyeon|Khao soi"},
 {title="쌀 요리", aliases={"rice dish","쌀 요리"}, words="Biryani|Paella|Risotto|Jambalaya|Bibimbap|Nasi goreng|Congee|Arroz con pollo"},
 {title="햄버거 재료", aliases={"burger ingredient","burger topping","햄버거 재료"}, words="Pickle|Lettuce|Tomato|Onion|Cheese|Bacon|Jalapeno|Avocado"},
 {title="소스", aliases={"sauce","소스"}, words="Chimichurri|Romesco|Bechamel|Hollandaise|Pesto|Sriracha|Tahini|Harissa"},
 {title="조미료", aliases={"condiment","seasoning","조미료"}, words="Soy sauce|Fish sauce|Vinegar|Mustard|Salt|Pepper|Miso|Gochujang"},
 {title="커피", aliases={"coffee","커피"}, words="Ristretto|Cortado|Affogato|Macchiato|Espresso|Cappuccino|Latte|Americano"},
 {title="과일 주스", aliases={"fruit juice","과일 주스"}, words="Guava juice|Pomegranate juice|Tamarind juice|Mango juice|Apple juice|Orange juice|Grape juice|Pineapple juice"},
 {title="탄산음료", aliases={"soda","soft drink","탄산음료"}, words="Root beer|Cream soda|Ginger ale|Cola|Lemonade|Sarsaparilla|Tonic water|Club soda"},
 {title="초콜릿 브랜드", aliases={"chocolate brand","초콜릿 브랜드"}, words="Valrhona|Lindt|Toblerone|Cadbury|Godiva|Ghirardelli|Guylian|Ritter Sport"},
 {title="사탕", aliases={"candy","sweet","사탕"}, words="Toffee|Fudge|Nougat|Marshmallow|Lollipop|Jelly bean|Gummy bear|Butterscotch"},
 {title="길거리 음식", aliases={"street food","길거리 음식"}, words="Takoyaki|Arepa|Samosa|Elote|Tteokbokki|Falafel|Baozi|Churro"},
 {title="한국 음식", aliases={"korean food","korean dish","한국 음식","한식"}, words="잡채|비빔밥|불고기|갈비찜|냉면|떡볶이|김밥|삼계탕"},
 {title="일본 음식", aliases={"japanese food","japanese dish","일본 음식","일식"}, words="Okonomiyaki|Takoyaki|Onigiri|Sukiyaki|Tempura|Soba|Oyakodon|Chawanmushi"},
 {title="인도 음식", aliases={"indian food","indian dish","인도 음식"}, words="Dosa|Idli|Palak paneer|Chana masala|Biryani|Samosa|Rogan josh|Dal"},
 {title="멕시코 음식", aliases={"mexican food","mexican dish","멕시코 음식"}, words="Pozole|Tamale|Mole|Enchilada|Tostada|Quesadilla|Chilaquiles|Taco"},
 {title="이탈리아 음식", aliases={"italian food","italian dish","이탈리아 음식"}, words="Risotto|Gnocchi|Arancini|Polenta|Ribollita|Lasagna|Focaccia|Bruschetta"},
 {title="태국 음식", aliases={"thai food","thai dish","태국 음식"}, words="Som tam|Khao soi|Pad thai|Tom kha gai|Massaman curry|Tom yum|Larb|Pad see ew"},
 {title="베트남 음식", aliases={"vietnamese food","vietnamese dish","베트남 음식"}, words="Banh mi|Pho|Bun cha|Goi cuon|Banh xeo|Cao lau|Com tam|Bun bo Hue"},
 {title="해산물", aliases={"seafood","해산물"}, words="Scallop|Clam|Mussel|Oyster|Abalone|Lobster|Crab|Squid"},
 {title="유제품", aliases={"dairy product","유제품"}, words="Kefir|Yogurt|Butter|Cream|Ghee|Cheese|Buttermilk|Clotted cream"},
 {title="발효 음식", aliases={"fermented food","발효 음식"}, words="Kimchi|Sauerkraut|Tempeh|Natto|Miso|Kefir|Yogurt|Kombucha"},
 {title="제빵 재료", aliases={"baking ingredient","제빵 재료"}, words="Yeast|Flour|Butter|Sugar|Baking powder|Cocoa|Vanilla|Cornstarch"},
 {title="아시아 국가", aliases={"asian country","countries in asia","아시아 국가","아시아 나라"}, words="Bhutan|Laos|Nepal|Timor-Leste|Brunei|Mongolia|Kyrgyzstan|Tajikistan"},
 {title="유럽 국가", aliases={"european country","countries in europe","유럽 국가","유럽 나라"}, words="Andorra|San Marino|Liechtenstein|Malta|Moldova|Albania|Montenegro|Estonia"},
 {title="남아메리카 국가", aliases={"south american country","countries in south america","남아메리카 국가"}, words="Suriname|Guyana|Uruguay|Paraguay|Ecuador|Bolivia|Peru|Chile"},
 {title="북아메리카 국가", aliases={"north american country","countries in north america","북아메리카 국가"}, words="Belize|Guatemala|Honduras|Nicaragua|Panama|Canada|Mexico|Costa Rica"},
 {title="오세아니아 국가", aliases={"oceanian country","countries in oceania","오세아니아 국가"}, words="Tuvalu|Nauru|Kiribati|Palau|Vanuatu|Samoa|Tonga|Fiji"},
 {title="내륙국", aliases={"landlocked country","내륙국"}, words="Lesotho|Bhutan|Nepal|Mongolia|Bolivia|Paraguay|Zambia|Chad"},
 {title="수도", aliases={"capital city","capital cities","수도 이름"}, words="Thimphu|Dili|Asmara|Lilongwe|Maseru|Bishkek|Podgorica|Yerevan"},
 {title="일본 도시", aliases={"japanese city","japanese cities","일본 도시"}, words="Kanazawa|Matsue|Takayama|Nara|Kobe|Sendai|Nagasaki|Kumamoto"},
 {title="미국 도시", aliases={"american city","us city","미국 도시"}, words="Boise|Tulsa|Omaha|Reno|Spokane|Madison|Savannah|Tucson"},
 {title="유럽 도시", aliases={"european city","european cities","유럽 도시"}, words="Ghent|Bruges|Graz|Linz|Tartu|Turku|Brno|Lille"},
 {title="산", aliases={"mountain","산 이름"}, words="Kilimanjaro|Denali|Aconcagua|Elbrus|Annapurna|Matterhorn|Fuji|K2"},
 {title="강", aliases={"river","강 이름"}, words="Mekong|Zambezi|Orinoco|Vistula|Limpopo|Danube|Volga|Rhine"},
 {title="호수", aliases={"lake","호수"}, words="Baikal|Titicaca|Tanganyika|Bled|Ladoga|Malawi|Geneva|Como"},
 {title="대양", aliases={"ocean","대양"}, words="Pacific Ocean|Atlantic Ocean|Indian Ocean|Southern Ocean|Arctic Ocean"},
 {title="사막", aliases={"desert","사막 이름"}, words="Atacama|Namib|Gobi|Kalahari|Thar|Mojave|Sonoran Desert|Taklamakan"},
 {title="화산", aliases={"volcano","화산"}, words="Etna|Stromboli|Vesuvius|Krakatoa|Tambora|Mauna Loa|Pinatubo|Cotopaxi"},
 {title="국립공원", aliases={"national park","국립공원"}, words="Banff|Jasper|Serengeti|Kruger|Plitvice Lakes|Yosemite|Yellowstone|Torres del Paine"},
 {title="유명 건축물", aliases={"landmark","famous building","유명 건축물","랜드마크"}, words="Petra|Angkor Wat|Borobudur|Hagia Sophia|Alhambra|Colosseum|Taj Mahal|Machu Picchu"},
 {title="탑", aliases={"tower","탑 이름"}, words="CN Tower|Tokyo Tower|Eiffel Tower|Leaning Tower of Pisa|N Seoul Tower|Canton Tower|Blackpool Tower|Galata Tower"},
 {title="성", aliases={"castle","성 이름"}, words="Neuschwanstein|Himeji Castle|Windsor Castle|Edinburgh Castle|Malbork Castle|Alnwick Castle|Bran Castle|Chillon Castle"},
 {title="궁전", aliases={"palace","궁전"}, words="Alhambra|Versailles|Topkapi Palace|Schonbrunn Palace|Gyeongbokgung|Potala Palace|Mysore Palace|Pena Palace"},
 {title="공항", aliases={"airport","공항"}, words="Changi Airport|Schiphol Airport|Incheon Airport|Haneda Airport|Heathrow Airport|Hamad Airport|Chhatrapati Shivaji Maharaj Airport|Keflavik Airport"},
 {title="항공사", aliases={"airline","항공사"}, words="Finnair|Icelandair|Air Astana|TAP Air Portugal|EVA Air|Etihad Airways|KLM|Korean Air"},
 {title="언어", aliases={"language","언어"}, words="Basque|Breton|Welsh|Amharic|Georgian|Lao|Maltese|Dzongkha"},
 {title="대륙", aliases={"continent","대륙"}, words="Asia|Africa|Europe|North America|South America|Antarctica|Australia"},
 {title="산맥", aliases={"mountain range","산맥"}, words="Andes|Himalayas|Alps|Pyrenees|Carpathians|Caucasus|Atlas Mountains|Urals"},
 {title="해협", aliases={"strait","해협"}, words="Bosphorus|Strait of Hormuz|Strait of Malacca|Strait of Gibraltar|Bering Strait|Torres Strait|Strait of Dover|Sunda Strait"},
 {title="만", aliases={"gulf","bay","만 이름"}, words="Bay of Biscay|Bay of Bengal|Hudson Bay|Gulf of Aden|Gulf of Oman|Gulf of Bothnia|Gulf of Mexico|Gulf of California"},
 {title="동굴", aliases={"cave","동굴"}, words="Son Doong|Mammoth Cave|Postojna Cave|Waitomo Caves|Reed Flute Cave|Fingal's Cave|Carlsbad Caverns|Jeita Grotto"},
 {title="영화", aliases={"movie","film","영화"}, words="Arrival|Amelie|Whiplash|Moonrise Kingdom|Spirited Away|Parasite|Memento|The Iron Giant"},
 {title="영화 장르", aliases={"movie genre","film genre","영화 장르"}, words="Noir|Western|Thriller|Documentary|Fantasy|Comedy|Musical|Animation"},
 {title="디즈니 캐릭터", aliases={"disney character","디즈니 캐릭터"}, words="Kuzco|Kronk|Yzma|Mushu|Megara|Esmeralda|Tiana|Moana"},
 {title="픽사 캐릭터", aliases={"pixar character","픽사 캐릭터"}, words="Remy|Linguini|WALL-E|EVE|Merida|Miguel|Dory|Frozone"},
 {title="마블 캐릭터", aliases={"marvel character","마블 캐릭터"}, words="Moon Knight|Nova|Squirrel Girl|She-Hulk|Daredevil|Storm|Gambit|Nightcrawler"},
 {title="포켓몬", aliases={"pokemon","포켓몬"}, words="Dunsparce|Shuckle|Girafarig|Chimecho|Tropius|Absol|Mawile|Flygon"},
 {title="마인크래프트 몹", aliases={"minecraft mob","마인크래프트 몹"}, words="Allay|Axolotl|Strider|Sniffer|Breeze|Bogged|Warden|Endermite"},
 {title="로블록스 게임", aliases={"roblox game","roblox experience","로블록스 게임"}, words="DOORS|Pressure|Fisch|Adopt Me!|Brookhaven|Tower of Hell|Arsenal|Natural Disaster Survival"},
 {title="카드게임", aliases={"card game","카드게임"}, words="Canasta|Cribbage|Pinochle|Euchre|Hearts|Spades|Rummy|Go Fish"},
 {title="체스 기물", aliases={"chess piece","체스 기물"}, words="King|Queen|Rook|Bishop|Knight|Pawn"},
 {title="음악 장르", aliases={"music genre","음악 장르"}, words="Shoegaze|Trip hop|Bossa nova|Bluegrass|Ambient|Ska|Reggae|Funk"},
 {title="록 밴드", aliases={"rock band","록 밴드"}, words="Muse|Rush|Pixies|Pavement|Radiohead|Blur|Oasis|Weezer"},
 {title="케이팝 그룹", aliases={"kpop group","k-pop group","케이팝 그룹","아이돌 그룹"}, words="SHINee|VIXX|BTOB|ONF|Dreamcatcher|Mamamoo|Red Velvet|STAYC"},
 {title="보이그룹", aliases={"boy band","boy group","보이그룹"}, words="SHINee|BTOB|VIXX|ONF|INFINITE|Highlight|SEVENTEEN|EXO"},
 {title="작곡가", aliases={"composer","작곡가"}, words="Ravel|Satie|Dvorak|Grieg|Sibelius|Debussy|Prokofiev|Saint-Saens"},
 {title="화가", aliases={"painter","화가"}, words="Vermeer|Klimt|Klee|Miro|Kandinsky|Hokusai|Magritte|Chagall"},
 {title="시인", aliases={"poet","시인"}, words="Rumi|Rilke|Sappho|Basho|Emily Dickinson|Pablo Neruda|Langston Hughes|Wislawa Szymborska"},
 {title="책", aliases={"book","novel","책 이름","소설 이름"}, words="Piranesi|Earthsea|Dune|Matilda|The Hobbit|The Little Prince|Momo|Coraline"},
 {title="그리스 신", aliases={"greek god","greek deity","그리스 신"}, words="Hestia|Demeter|Hephaestus|Hermes|Artemis|Apollo|Athena|Dionysus"},
 {title="이집트 신", aliases={"egyptian god","egyptian deity","이집트 신"}, words="Thoth|Bastet|Sekhmet|Anubis|Horus|Isis|Osiris|Sobek"},
 {title="북유럽 신", aliases={"norse god","norse deity","북유럽 신"}, words="Tyr|Heimdall|Baldr|Idun|Skadi|Freyja|Freyr|Njord"},
 {title="별자리", aliases={"constellation","별자리"}, words="Lyra|Cygnus|Lacerta|Vulpecula|Delphinus|Corvus|Carina|Dorado"},
 {title="행성", aliases={"planet","행성"}, words="Mercury|Venus|Earth|Mars|Jupiter|Saturn|Uranus|Neptune"},
 {title="왜행성", aliases={"dwarf planet","왜행성"}, words="Ceres|Pluto|Eris|Haumea|Makemake"},
 {title="원소", aliases={"chemical element","원소"}, words="Hafnium|Rhenium|Yttrium|Scandium|Tellurium|Bismuth|Niobium|Tantalum"},
 {title="보석", aliases={"gemstone","보석"}, words="Alexandrite|Spinel|Tanzanite|Peridot|Iolite|Tourmaline|Garnet|Opal"},
 {title="암석", aliases={"rock type","type of rock","암석"}, words="Basalt|Gabbro|Diorite|Obsidian|Pumice|Slate|Gneiss|Marble"},
 {title="금속", aliases={"metal","금속"}, words="Titanium|Tungsten|Bismuth|Cobalt|Nickel|Zinc|Copper|Aluminium"},
 {title="과학자", aliases={"scientist","과학자"}, words="Lise Meitner|Chien-Shiung Wu|Emmy Noether|Srinivasa Ramanujan|Satyendra Nath Bose|Jocelyn Bell Burnell|Vera Rubin|C. V. Raman"},
 {title="신체 부위", aliases={"body part","신체 부위"}, words="Elbow|Ankle|Wrist|Chin|Shoulder|Thumb|Knee|Heel"},
 {title="장기", aliases={"internal organ","human organ","신체 장기"}, words="Spleen|Pancreas|Liver|Kidney|Lung|Heart|Stomach|Thymus"},
 {title="뼈", aliases={"bone","뼈 이름"}, words="Scapula|Clavicle|Femur|Tibia|Fibula|Humerus|Radius|Ulna"},
 {title="날씨", aliases={"weather","날씨"}, words="Sleet|Hail|Drizzle|Fog|Mist|Snow|Rain|Thunderstorm"},
 {title="구름", aliases={"cloud type","type of cloud","구름"}, words="Cirrus|Cirrostratus|Cirrocumulus|Altostratus|Altocumulus|Nimbostratus|Stratus|Cumulonimbus"},
 {title="재생에너지", aliases={"renewable energy","재생에너지"}, words="Solar energy|Wind energy|Hydropower|Geothermal energy|Tidal energy|Wave energy|Biomass"},
 {title="도형", aliases={"shape","geometric shape","도형"}, words="Rhombus|Trapezoid|Pentagon|Hexagon|Octagon|Ellipse|Triangle|Parallelogram"},
 {title="입체도형", aliases={"solid shape","3d shape","입체도형"}, words="Tetrahedron|Octahedron|Dodecahedron|Icosahedron|Cube|Sphere|Cone|Cylinder"},
 {title="수학자", aliases={"mathematician","수학자"}, words="Emmy Noether|Srinivasa Ramanujan|Sophie Germain|Ada Lovelace|Leonhard Euler|Carl Friedrich Gauss|David Hilbert|Kurt Godel"},
 {title="프로그래밍 언어", aliases={"programming language","프로그래밍 언어"}, words="Elixir|Erlang|Haskell|Clojure|Julia|Lua|Rust|Kotlin"},
 {title="컴퓨터 부품", aliases={"computer component","computer part","컴퓨터 부품"}, words="Motherboard|Processor|RAM|SSD|Graphics card|Power supply|Heat sink|Sound card"},
 {title="출력 장치", aliases={"output device","출력 장치"}, words="Monitor|Printer|Speaker|Projector|Headphones|Plotter|Braille display|Haptic actuator"},
 {title="파일 확장자", aliases={"file extension","파일 확장자"}, words="SVG|WEBP|FLAC|OGG|JSON|CSV|EPUB|TIFF"},
 {title="운영체제", aliases={"operating system","운영체제"}, words="FreeBSD|OpenBSD|NetBSD|Haiku|Ubuntu|Debian|Fedora|Android"},
 {title="검색 엔진", aliases={"search engine","검색 엔진"}, words="Bing|DuckDuckGo|Ecosia|Qwant|Startpage|Brave Search|Naver|Google"},
 {title="사회관계망", aliases={"social media","social network","소셜 미디어","사회관계망"}, words="Mastodon|Bluesky|Tumblr|Pinterest|Reddit|Instagram|Snapchat|Threads"},
 {title="스포츠 브랜드", aliases={"sports brand","sportswear brand","스포츠 브랜드"}, words="Mizuno|Asics|Hummel|Umbro|Diadora|Kappa|Puma|Fila"},
 {title="패션 브랜드", aliases={"fashion brand","패션 브랜드"}, words="Loewe|Marni|Kenzo|Acne Studios|Issey Miyake|Bottega Veneta|Celine|Burberry"},
 {title="자동차 모델", aliases={"car model","자동차 모델"}, words="Miata|Supra|Impreza|Clio|Giulia|Quattro|Countach|Elise"},
 {title="자전거 종류", aliases={"type of bicycle","bicycle type","자전거 종류"}, words="Tandem|Recumbent|BMX|Road bike|Mountain bike|Folding bike|Cargo bike|Track bike"},
 {title="배 종류", aliases={"type of boat","boat type","배 종류"}, words="Catamaran|Schooner|Sloop|Ketch|Dinghy|Canoe|Kayak|Galleon"},
 {title="항공기 종류", aliases={"aircraft type","type of aircraft","항공기 종류"}, words="Glider|Seaplane|Helicopter|Airship|Gyrocopter|Biplane|Jet|Hot air balloon"},
 {title="공구", aliases={"tool","hand tool","공구"}, words="Awl|Chisel|Plane|Hacksaw|Mallet|Pliers|Wrench|Screwdriver"},
 {title="원예 도구", aliases={"gardening tool","원예 도구"}, words="Trowel|Secateurs|Rake|Hoe|Spade|Dibber|Watering can|Lopper"},
 {title="욕실용품", aliases={"bathroom item","toiletry","욕실용품"}, words="Loofah|Pumice stone|Toothbrush|Toothpaste|Soap|Shampoo|Towel|Comb"},
 {title="캠핑용품", aliases={"camping equipment","camping item","캠핑용품"}, words="Tent|Sleeping bag|Sleeping pad|Lantern|Compass|Camp stove|Tarp|Carabiner"},
 {title="등산용품", aliases={"hiking equipment","mountaineering equipment","등산용품"}, words="Crampons|Ice axe|Trekking poles|Gaiters|Harness|Carabiner|Helmet|Backpack"},
 {title="재봉용품", aliases={"sewing tool","sewing supply","재봉용품"}, words="Thimble|Seam ripper|Bodkin|Pincushion|Needle|Thread|Tape measure|Scissors"},
 {title="미술용품", aliases={"art supply","art supplies","미술용품"}, words="Palette knife|Easel|Charcoal|Pastel|Gouache|Canvas|Brush|Watercolor"},
 {title="문구 브랜드", aliases={"stationery brand","문구 브랜드"}, words="Staedtler|Faber-Castell|Rotring|Lamy|Sakura|Pentel|Pilot|Tombow"},
 {title="모자", aliases={"hat","headwear","모자"}, words="Beret|Fedora|Trilby|Sombrero|Fez|Beanie|Bowler|Boater"},
 {title="장신구", aliases={"jewelry","jewellery","장신구"}, words="Brooch|Cufflink|Tiara|Pendant|Anklet|Bracelet|Earring|Locket"},
 {title="주택 종류", aliases={"type of house","house type","주택 종류"}, words="Bungalow|Chalet|Yurt|Igloo|Cottage|Duplex|Townhouse|Houseboat"},
 {title="집 안의 방", aliases={"room in a house","house room","집 안의 방"}, words="Pantry|Attic|Cellar|Study|Bedroom|Kitchen|Bathroom|Living room"},
 {title="건축 재료", aliases={"building material","construction material","건축 재료"}, words="Adobe|Timber|Concrete|Brick|Steel|Glass|Stone|Bamboo"},
 {title="조명", aliases={"type of light","lighting fixture","조명"}, words="Chandelier|Sconce|Lantern|Pendant light|Floor lamp|Desk lamp|Spotlight|Downlight"},
 {title="식기", aliases={"tableware","dinnerware","식기"}, words="Saucer|Goblet|Tureen|Ramekin|Chopsticks|Fork|Plate|Bowl"},
 {title="조리기구", aliases={"cookware","조리기구"}, words="Wok|Dutch oven|Tagine|Skillet|Saucepan|Stockpot|Griddle|Steamer"},
 {title="장난감", aliases={"toy","장난감"}, words="Kaleidoscope|Spinning top|Yo-yo|Marble|Kite|Doll|Teddy bear|Jack-in-the-box"},
 {title="놀이공원 놀이기구", aliases={"amusement park ride","theme park ride","놀이공원 놀이기구"}, words="Carousel|Ferris wheel|Drop tower|Log flume|Roller coaster|Bumper cars|Swing ride|Teacups"},
 {title="수집품", aliases={"collectible","collectable","수집품"}, words="Postage stamp|Coin|Postcard|Trading card|Fossil|Mineral|Vinyl record|Comic book"},
 {title="무술", aliases={"martial art","무술"}, words="Aikido|Kendo|Hapkido|Capoeira|Sambo|Savate|Wushu|Silat"},
 {title="동계 스포츠", aliases={"winter sport","동계 스포츠"}, words="Curling|Biathlon|Skeleton|Luge|Bobsleigh|Snowboarding|Ski jumping|Speed skating"},
 {title="육상 종목", aliases={"athletics event","track and field event","육상 종목"}, words="Decathlon|Heptathlon|Steeplechase|Pole vault|Triple jump|Hammer throw|Discus throw|Javelin throw"},
 {title="라켓 스포츠", aliases={"racket sport","racquet sport","라켓 스포츠"}, words="Squash|Badminton|Tennis|Table tennis|Racquetball|Padel|Pickleball|Real tennis"},
 {title="단체 스포츠", aliases={"team sport","단체 스포츠"}, words="Netball|Handball|Kabaddi|Lacrosse|Bandy|Cricket|Rugby|Volleyball"},
 {title="축구 선수", aliases={"football player","soccer player","축구 선수"}, words="Luka Modric|Son Heung-min|Sadio Mane|Achraf Hakimi|Khvicha Kvaratskhelia|Victor Osimhen|Mohamed Salah|Antoine Griezmann"},
 {title="농구 선수", aliases={"basketball player","농구 선수"}, words="Manu Ginobili|Tony Parker|Pau Gasol|Dirk Nowitzki|Steve Nash|Dikembe Mutombo|Hakeem Olajuwon|Drazen Petrovic"},
 {title="테니스 선수", aliases={"tennis player","테니스 선수"}, words="Stan Wawrinka|Marin Cilic|Kei Nishikori|Gael Monfils|Petra Kvitova|Li Na|Caroline Wozniacki|Victoria Azarenka"},
 {title="축구 구단", aliases={"football club","soccer club","축구 구단"}, words="Atalanta|Bologna|Real Sociedad|Athletic Bilbao|Feyenoord|Sporting CP|Lille|Eintracht Frankfurt"},
 {title="스포츠 경기장", aliases={"sports stadium","stadium","스포츠 경기장"}, words="San Siro|Anfield|Maracana|Wembley|Camp Nou|Signal Iduna Park|La Bombonera|Estadio Azteca"},
 {title="현악기", aliases={"string instrument","현악기"}, words="Viola|Cello|Double bass|Mandolin|Banjo|Sitar|Oud|Erhu"},
 {title="목관악기", aliases={"woodwind instrument","목관악기"}, words="Bassoon|Oboe|Cor anglais|Piccolo|Clarinet|Saxophone|Recorder|Flute"},
 {title="금관악기", aliases={"brass instrument","금관악기"}, words="Euphonium|Flugelhorn|Cornet|Tuba|Trombone|Trumpet|French horn|Sousaphone"},
 {title="한국 전통 악기", aliases={"korean traditional instrument","한국 전통 악기","국악기"}, words="가야금|거문고|해금|아쟁|대금|소금|태평소|장구"},
 {title="미술 기법", aliases={"art technique","미술 기법"}, words="Etching|Lithography|Woodcut|Fresco|Pointillism|Collage|Impasto|Sgraffito"},
 {title="사진 장르", aliases={"photography genre","사진 장르"}, words="Macro|Portrait|Landscape|Street|Wildlife|Astrophotography|Still life|Documentary"},
 {title="영화 감독", aliases={"film director","movie director","영화 감독"}, words="Agnes Varda|Akira Kurosawa|Satyajit Ray|Wong Kar-wai|Hayao Miyazaki|Bong Joon-ho|Denis Villeneuve|Greta Gerwig"},
 {title="배우", aliases={"actor","actress","배우"}, words="Tilda Swinton|Mads Mikkelsen|Dev Patel|Saoirse Ronan|Song Kang-ho|Tony Leung|Olivia Colman|Mahershala Ali"},
 {title="오페라", aliases={"opera","오페라"}, words="Turandot|Rigoletto|Tosca|Carmen|La boheme|The Magic Flute|Aida|Fidelio"},
 {title="발레 작품", aliases={"ballet","발레 작품"}, words="Giselle|Coppelia|Sylvia|Swan Lake|The Nutcracker|Sleeping Beauty|La Bayadere|Don Quixote"},
 {title="축제", aliases={"festival","축제"}, words="Holi|Diwali|Songkran|Nowruz|Oktoberfest|Inti Raymi|Naadam|Boryeong Mud Festival"},
 {title="감정", aliases={"emotion","감정"}, words="Awe|Nostalgia|Gratitude|Relief|Curiosity|Joy|Surprise|Hope"},
 {title="성격 특성", aliases={"personality trait","character trait","성격 특성"}, words="Patience|Humility|Diligence|Generosity|Curiosity|Honesty|Resilience|Compassion"},
 {title="색조", aliases={"shade of color","colour shade","색조"}, words="Cerulean|Viridian|Chartreuse|Vermilion|Periwinkle|Celadon|Ochre|Mauve"},
 {title="문양", aliases={"pattern","문양"}, words="Paisley|Herringbone|Houndstooth|Tartan|Chevron|Argyle|Polka dot|Gingham"},
 {title="질감", aliases={"texture","질감"}, words="Velvety|Grainy|Silky|Bumpy|Rough|Smooth|Fuzzy|Glossy"},
 {title="우주 비행사", aliases={"astronaut","cosmonaut","우주 비행사"}, words="Mae Jemison|Valentina Tereshkova|Sally Ride|Guion Bluford|Chris Hadfield|Peggy Whitson|Kalpana Chawla|Eileen Collins"},
 {title="망원경", aliases={"telescope","망원경"}, words="Hubble|James Webb|Kepler|Spitzer|Chandra|Herschel|Gaia|Euclid"},
 {title="별", aliases={"star name","별 이름"}, words="Altair|Deneb|Rigel|Sirius|Vega|Arcturus|Capella|Antares"},
 {title="성운", aliases={"nebula","nebulae","성운"}, words="Crab Nebula|Orion Nebula|Ring Nebula|Helix Nebula|Eagle Nebula|Lagoon Nebula|Cat's Eye Nebula|Carina Nebula"},
 {title="혜성", aliases={"comet","혜성"}, words="Halley|Hale-Bopp|Hyakutake|Encke|Tempel 1|Wild 2|Borrelly|67P Churyumov-Gerasimenko"},
 {title="실험 기구", aliases={"laboratory equipment","lab equipment","실험 기구"}, words="Burette|Pipette|Crucible|Beaker|Test tube|Petri dish|Retort|Volumetric flask"},
 {title="생물 군계", aliases={"biome","생물 군계"}, words="Tundra|Taiga|Savanna|Chaparral|Desert|Temperate forest|Tropical rainforest|Grassland"},
 {title="생태계 분해자", aliases={"decomposer","분해자"}, words="Earthworm|Dung beetle|Millipede|Woodlouse|Springtail|Mushroom|Bacteria|Termite"},
 {title="동물의 집", aliases={"animal home","animal shelter","동물의 집"}, words="Burrow|Den|Nest|Hive|Lodge|Drey|Sett|Rookery"},
 {title="동물 울음소리", aliases={"animal sound","동물 울음소리"}, words="Bray|Bleat|Bellow|Chirp|Coo|Croak|Hoot|Howl"},
 {title="새끼 동물 이름", aliases={"baby animal","young animal","새끼 동물 이름"}, words="Fawn|Foal|Calf|Cub|Joey|Kid|Lamb|Leveret"},
 {title="공룡 시대", aliases={"geological period","지질 시대"}, words="Cambrian|Ordovician|Silurian|Devonian|Carboniferous|Permian|Triassic|Jurassic"},
 {title="고대 문명", aliases={"ancient civilization","고대 문명"}, words="Sumer|Akkad|Assyria|Babylonia|Indus Valley|Minoan civilization|Nok culture|Olmec civilization"},
 {title="문자 체계", aliases={"writing system","문자 체계"}, words="Hangul|Devanagari|Cyrillic|Armenian alphabet|Georgian script|Thai script|Tibetan script|Ethiopic script"},
 {title="지도 종류", aliases={"map type","type of map","지도 종류"}, words="Topographic map|Political map|Physical map|Choropleth map|Climate map|Road map|Bathymetric map|Transit map"},
 {title="방향", aliases={"direction","방향"}, words="North|South|East|West|Northeast|Northwest|Southeast|Southwest"},
 {title="요일", aliases={"day of the week","weekday","요일"}, words="Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday"},
 {title="월 이름", aliases={"month","월 이름"}, words="January|February|March|April|May|June|July|August|September|October|November|December"},
}
local additionalTopics = {
 {title="양서류",aliases={"amphibian","양서류"},words="Axolotl|Olm|Caecilian|Hellbender|Newt|Fire salamander|Tree frog|Surinam toad"},
 {title="극지 동물",aliases={"polar animal","arctic animal","극지 동물"},words="Polar bear|Arctic fox|Musk ox|Walrus|Narwhal|Beluga|Arctic hare|Snowy owl"},
 {title="설치류",aliases={"rodent","설치류"},words="Capybara|Degu|Chinchilla|Agouti|Mara|Dormouse|Beaver|Porcupine"},
 {title="고양이 품종",aliases={"cat breed","고양이 품종"},words="Korat|Sokoke|Nebelung|Burmilla|Toyger|Ocicat|Chartreux|Singapura"},
 {title="맹금류",aliases={"bird of prey","raptor","맹금류"},words="Osprey|Kestrel|Harrier|Peregrine falcon|Secretary bird|Harpy eagle|Kite|Condor"},
 {title="고래",aliases={"whale","고래"},words="Bowhead whale|Sei whale|Minke whale|Beluga|Narwhal|Gray whale|Sperm whale|Humpback whale"},
 {title="나비",aliases={"butterfly","나비"},words="Monarch|Painted lady|Red admiral|Blue morpho|Glasswing|Swallowtail|Peacock butterfly|Brimstone"},
 {title="뱀",aliases={"snake","뱀"},words="Taipan|Mamba|Krait|Anaconda|Boa|Python|Hognose snake|Kingsnake"},
 {title="개구리",aliases={"frog","개구리"},words="Glass frog|Tomato frog|Goliath frog|Poison dart frog|Bullfrog|Wood frog|African clawed frog|Red-eyed tree frog"},
 {title="견과류",aliases={"nut","견과류"},words="Pistachio|Macadamia|Pecan|Hazelnut|Walnut|Cashew|Almond|Brazil nut"},
 {title="곡물",aliases={"grain","cereal crop","곡물"},words="Teff|Fonio|Sorghum|Millet|Barley|Rye|Oats|Rice"},
 {title="잎채소",aliases={"leafy vegetable","leafy green","잎채소"},words="Kale|Chard|Spinach|Lettuce|Watercress|Arugula|Endive|Sorrel"},
 {title="수생식물",aliases={"aquatic plant","water plant","수생식물"},words="Lotus|Water lily|Duckweed|Water hyacinth|Hornwort|Water lettuce|Elodea|Vallisneria"},
 {title="잡초",aliases={"weed","잡초"},words="Dandelion|Chickweed|Purslane|Nettle|Plantain|Crabgrass|Bindweed|Clover"},
 {title="수프",aliases={"soup","수프","스프"},words="Borscht|Gazpacho|Minestrone|Laksa|Tom yum|Chowder|Bisque|Harira"},
 {title="케이크",aliases={"cake","케이크"},words="Battenberg|Lamington|Sachertorte|Genoise|Chiffon cake|Angel food cake|Carrot cake|Black Forest cake"},
 {title="파스타",aliases={"pasta","파스타"},words="Orecchiette|Bucatini|Farfalle|Orzo|Pappardelle|Fusilli|Rigatoni|Cavatelli"},
 {title="피자 토핑",aliases={"pizza topping","피자 토핑"},words="Artichoke|Anchovy|Capers|Arugula|Mushroom|Olive|Pepperoni|Basil"},
 {title="차",aliases={"tea","차 종류"},words="Rooibos|Oolong|Pu-erh|Matcha|Sencha|Darjeeling|Assam|Chamomile"},
 {title="아이스크림 맛",aliases={"ice cream flavor","ice cream flavour","아이스크림 맛","아이스크림맛"},words="Pistachio|Ube|Matcha|Black sesame|Vanilla|Chocolate|Strawberry|Salted caramel"},
 {title="아침 식사",aliases={"breakfast food","아침 식사"},words="Shakshuka|Porridge|Muesli|Pancake|Waffle|Omelette|Bagel|French toast"},
 {title="중국 음식",aliases={"chinese food","chinese dish","중국 음식","중식"},words="Mapo tofu|Jiaozi|Xiaolongbao|Char siu|Chow mein|Hot pot|Peking duck|Congee"},
 {title="프랑스 음식",aliases={"french food","french dish","프랑스 음식"},words="Ratatouille|Quiche|Cassoulet|Bouillabaisse|Coq au vin|Souffle|Crepe|Croque monsieur"},
 {title="만두",aliases={"dumpling","만두"},words="Pierogi|Momo|Manti|Jiaozi|Gyoza|Khinkali|Pelmeni|Mandu"},
 {title="조리 방법",aliases={"cooking method","조리 방법"},words="Poaching|Braising|Steaming|Roasting|Grilling|Sauteing|Blanching|Smoking"},
 {title="아프리카 국가",aliases={"african country","countries in africa","아프리카 국가"},words="Lesotho|Eswatini|Comoros|Djibouti|Benin|Togo|Gabon|Malawi"},
 {title="섬나라",aliases={"island country","island nation","섬나라"},words="Comoros|Maldives|Seychelles|Mauritius|Bahrain|Iceland|Cyprus|Malta"},
 {title="한국 도시",aliases={"korean city","korean cities","한국 도시"},words="통영|군산|목포|안동|공주|제천|속초|경주"},
 {title="섬",aliases={"island","섬 이름"},words="Socotra|Svalbard|Gotland|Sardinia|Corsica|Tasmania|Luzon|Hokkaido"},
 {title="바다",aliases={"sea","바다 이름"},words="Adriatic Sea|Aegean Sea|Baltic Sea|Coral Sea|Tasman Sea|Arabian Sea|Red Sea|Black Sea"},
 {title="폭포",aliases={"waterfall","폭포"},words="Kaieteur Falls|Dettifoss|Gullfoss|Iguazu Falls|Angel Falls|Victoria Falls|Niagara Falls|Tugela Falls"},
 {title="다리",aliases={"bridge","다리 이름"},words="Rialto Bridge|Charles Bridge|Tower Bridge|Brooklyn Bridge|Golden Gate Bridge|Ponte Vecchio|Akashi Kaikyo Bridge|Millau Viaduct"},
 {title="박물관",aliases={"museum","박물관"},words="Rijksmuseum|Prado|Louvre|Uffizi|British Museum|Hermitage|Vasa Museum|Acropolis Museum"},
 {title="통화",aliases={"currency","currencies","통화","화폐"},words="Lari|Lek|Lempira|Quetzal|Kip|Tugrik|Metical|Pula"},
 {title="반도",aliases={"peninsula","반도"},words="Yucatan Peninsula|Balkan Peninsula|Iberian Peninsula|Arabian Peninsula|Malay Peninsula|Korean Peninsula|Kamchatka Peninsula|Sinai Peninsula"},
 {title="애니메이션 영화",aliases={"animated movie","animated film","애니메이션 영화"},words="Klaus|Coraline|Kubo and the Two Strings|The Secret of Kells|Song of the Sea|Fantastic Mr. Fox|Ratatouille|WALL-E"},
 {title="DC 캐릭터",aliases={"dc character","dc comics","DC 캐릭터"},words="Zatanna|Blue Beetle|Booster Gold|Raven|Starfire|Cyborg|Shazam|Martian Manhunter"},
 {title="보드게임",aliases={"board game","보드게임"},words="Azul|Carcassonne|Splendor|Catan|Patchwork|Hive|Wingspan|Ticket to Ride"},
 {title="춤",aliases={"dance","춤"},words="Sarabande|Gavotte|Tarantella|Polka|Mazurka|Tango|Waltz|Samba"},
 {title="걸그룹",aliases={"girl group","걸그룹"},words="Dreamcatcher|Purple Kiss|Billlie|WJSN|Mamamoo|Red Velvet|Apink|STAYC"},
 {title="작가",aliases={"author","novelist","작가"},words="Ursula K. Le Guin|Italo Calvino|Jorge Luis Borges|Toni Morrison|Octavia Butler|Kazuo Ishiguro|Chinua Achebe|N. K. Jemisin"},
 {title="동화",aliases={"fairy tale","동화"},words="The Snow Queen|The Wild Swans|Thumbelina|The Red Shoes|Rapunzel|Rumpelstiltskin|The Frog Prince|The Golden Goose"},
 {title="신화 속 생물",aliases={"mythical creature","mythological creature","신화 속 생물"},words="Kelpie|Basilisk|Chimera|Griffin|Manticore|Hippogriff|Phoenix|Kraken"},
 {title="태양계 위성",aliases={"natural satellite","solar system moon","태양계 위성"},words="Enceladus|Iapetus|Triton|Titan|Europa|Ganymede|Callisto|Phobos"},
 {title="광물",aliases={"mineral","광물"},words="Fluorite|Calcite|Galena|Pyrite|Olivine|Feldspar|Mica|Quartz"},
 {title="발명품",aliases={"invention","발명품"},words="Compass|Printing press|Telephone|Radio|Microscope|Telescope|Steam engine|Transistor"},
 {title="감각",aliases={"sense","감각"},words="Sight|Hearing|Smell|Taste|Touch|Proprioception|Balance|Thermoception"},
 {title="자연재해",aliases={"natural disaster","자연재해"},words="Tsunami|Earthquake|Landslide|Avalanche|Drought|Flood|Tornado|Volcanic eruption"},
 {title="측정 단위",aliases={"measurement unit","unit of measurement","측정 단위"},words="Pascal|Joule|Watt|Newton|Kelvin|Candela|Ampere|Mole"},
 {title="입력 장치",aliases={"input device","입력 장치"},words="Keyboard|Mouse|Trackball|Touchpad|Joystick|Scanner|Microphone|Graphics tablet"},
 {title="웹 브라우저",aliases={"web browser","웹 브라우저"},words="Firefox|Opera|Vivaldi|Brave|Safari|Chrome|Edge|Tor Browser"},
 {title="스마트폰 브랜드",aliases={"phone brand","smartphone brand","스마트폰 브랜드"},words="Fairphone|Nothing|Sony|Motorola|OnePlus|Oppo|Vivo|Samsung"},
 {title="오토바이 브랜드",aliases={"motorcycle brand","오토바이 브랜드"},words="Aprilia|Moto Guzzi|Ducati|Triumph|Husqvarna|Royal Enfield|KTM|Benelli"},
 {title="기차 종류",aliases={"train type","type of train","기차 종류"},words="Monorail|Maglev|Tram|Funicular|Steam locomotive|Bullet train|Freight train|Sleeper train"},
 {title="청소용품",aliases={"cleaning supply","cleaning tool","청소용품"},words="Squeegee|Dustpan|Mop|Broom|Duster|Sponge|Scrub brush|Vacuum cleaner"},
 {title="가방",aliases={"bag type","type of bag","가방 종류"},words="Satchel|Tote|Duffel|Clutch|Rucksack|Messenger bag|Briefcase|Pannier"},
 {title="직물",aliases={"fabric","textile","직물","옷감"},words="Tweed|Corduroy|Velvet|Chiffon|Denim|Linen|Satin|Organza"},
 {title="가전제품",aliases={"household appliance","home appliance","가전제품"},words="Dehumidifier|Air purifier|Dishwasher|Microwave|Refrigerator|Washing machine|Toaster|Blender"},
 {title="침구",aliases={"bedding","침구"},words="Duvet|Quilt|Comforter|Pillow|Bolster|Bedspread|Sheet|Mattress"},
 {title="취미",aliases={"hobby","취미"},words="Origami|Philately|Numismatics|Birdwatching|Knitting|Pottery|Geocaching|Juggling"},
 {title="수상 스포츠",aliases={"water sport","수상 스포츠"},words="Rowing|Canoeing|Kayaking|Sailing|Surfing|Water polo|Wakeboarding|Windsurfing"},
 {title="올림픽 종목",aliases={"olympic sport","올림픽 종목"},words="Modern pentathlon|Triathlon|Fencing|Rowing|Canoe slalom|Archery|Judo|Sailing"},
 {title="야구 선수",aliases={"baseball player","야구 선수"},words="Ichiro Suzuki|Hideo Nomo|Adrian Beltre|Joey Votto|Zack Greinke|Shin-Soo Choo|Chan Ho Park|Larry Walker"},
 {title="타악기",aliases={"percussion instrument","타악기"},words="Djembe|Cajon|Bodhran|Tabla|Glockenspiel|Vibraphone|Timpani|Castanets"},
 {title="건반악기",aliases={"keyboard instrument","건반악기"},words="Clavichord|Harpsichord|Celesta|Piano|Organ|Accordion|Melodica|Synthesizer"},
 {title="예술 사조",aliases={"art movement","예술 사조"},words="Fauvism|Dada|Cubism|Surrealism|Impressionism|Expressionism|Bauhaus|Suprematism"},
 {title="뮤지컬",aliases={"musical","뮤지컬"},words="Hadestown|Pippin|Company|Cabaret|Wicked|Cats|Hamilton|Matilda"},
 {title="기념일",aliases={"holiday","observance","기념일"},words="Earth Day|World Oceans Day|International Literacy Day|World Environment Day|Arbor Day|World Book Day|Pi Day|International Jazz Day"},
 {title="우주 탐사선",aliases={"space probe","spacecraft","우주 탐사선"},words="Voyager 1|Voyager 2|Cassini|Juno|New Horizons|Rosetta|Dawn|Hayabusa2"},
 {title="은하",aliases={"galaxy","galaxies","은하"},words="Andromeda Galaxy|Triangulum Galaxy|Whirlpool Galaxy|Sombrero Galaxy|Pinwheel Galaxy|Cartwheel Galaxy|Milky Way|Centaurus A"},
 {title="수학 용어",aliases={"math term","mathematical term","수학 용어"},words="Isosceles|Hypotenuse|Asymptote|Logarithm|Derivative|Integral|Matrix|Vector"},
 {title="수분 매개자",aliases={"pollinator","수분 매개자"},words="Bumblebee|Honeybee|Hoverfly|Butterfly|Moth|Hummingbird|Sunbird|Fruit bat"},
 {title="동물 무리 이름",aliases={"animal group name","collective noun for animals","동물 무리 이름"},words="Pride|Pod|Herd|Flock|Swarm|School|Pack|Murmuration"},
 {title="고대 문자",aliases={"ancient script","고대 문자"},words="Cuneiform|Hieroglyphs|Linear A|Linear B|Phoenician alphabet|Oracle bone script|Mayan script|Ogham"},
 {title="계절",aliases={"season","계절"},words="Spring|Summer|Autumn|Winter|Wet season|Dry season"},
 {title="헤어스타일",aliases={"hairstyle","hair style","헤어스타일"},words="Bob cut|Pixie cut|Pompadour|Quiff|Undercut|Mullet|Ponytail|Chignon"},
 {title="반려동물",aliases={"pet","반려동물","애완동물"},words="Degu|Chinchilla|Gerbil|Guinea pig|Ferret|Sugar glider|Cockatiel|Axolotl"},
 {title="한국 전통 놀이",aliases={"korean traditional game","한국 전통 놀이"},words="윷놀이|제기차기|투호|비석치기|팽이치기|연날리기|널뛰기|공기놀이"},
 {title="로마 신",aliases={"roman god","roman deity","로마 신"},words="Jupiter|Juno|Neptune|Minerva|Mars|Venus|Apollo|Diana|Vulcan|Mercury|Ceres|Vesta|Janus|Saturn|Pluto|Bacchus|Quirinus|Terminus|Silvanus|Faunus|Fortuna|Bellona|Pomona|Flora"},
 {title="그리스 영웅",aliases={"greek hero","greek heroes","그리스 영웅","그리스 신화 영웅"},words="Perseus|Theseus|Heracles|Achilles|Odysseus|Jason|Bellerophon|Atalanta|Orpheus|Cadmus|Diomedes|Meleager|Peleus|Telamon|Ajax|Castor|Pollux|Iolaus|Amphiaraus|Philoctetes"},
 {title="그리스 신화 괴물",aliases={"greek monster","greek mythical monster","그리스 신화 괴물"},words="Typhon|Echidna|Cerberus|Hydra|Chimera|Minotaur|Medusa|Stheno|Euryale|Ladon|Python|Scylla|Charybdis|Orthrus|Sphinx|Harpies|Cyclops|Empusa|Talos|Nemean lion"},
 {title="그리스 여신",aliases={"greek goddess","greek goddesses","그리스 여신"},words="Athena|Artemis|Aphrodite|Hera|Demeter|Hestia|Persephone|Hecate|Iris|Nike|Hebe|Eos|Selene|Nyx|Gaia|Rhea|Themis|Nemesis|Eris|Harmonia"},
 {title="북유럽 신화 생물",aliases={"norse creature","norse mythical creature","북유럽 신화 생물"},words="Fenrir|Jormungandr|Sleipnir|Nidhogg|Ratatoskr|Garm|Hugin|Munin|Audhumla|Gullinbursti|Heidrun|Eikthyrnir|Dainn|Dvalinn|Duneyrr|Durathror"},
 {title="힌두교 신",aliases={"hindu god","hindu deity","힌두교 신","인도 신"},words="Brahma|Vishnu|Shiva|Lakshmi|Saraswati|Parvati|Durga|Kali|Ganesha|Kartikeya|Hanuman|Krishna|Rama|Indra|Agni|Varuna|Vayu|Surya|Chandra|Yama|Kubera|Dhanvantari"},
 {title="일본 신화 신",aliases={"japanese god","japanese deity","일본 신화 신","일본 신"},words="Amaterasu|Susanoo|Tsukuyomi|Izanagi|Izanami|Inari|Hachiman|Raijin|Fujin|Ebisu|Okuninushi|Sarutahiko|Ame-no-Uzume|Konohanasakuya|Takemikazuchi|Omoikane"},
 {title="한국 신화 인물",aliases={"korean mythology character","korean mythical figure","한국 신화 인물"},words="단군|환웅|환인|웅녀|주몽|유화|해모수|박혁거세|알영|김수로|허황옥|바리공주|자청비|설문대할망|삼신할머니|마고할미|도깨비|구미호"},
 {title="중국 신화 인물",aliases={"chinese mythology character","chinese mythical figure","중국 신화 인물"},words="Pangu|Nuwa|Fuxi|Shennong|Chang'e|Hou Yi|Jade Emperor|Nezha|Erlang Shen|Sun Wukong|Zhu Bajie|Sha Wujing|Xiwangmu|Zhurong|Gonggong|Lei Gong"},
 {title="신화 속 장소",aliases={"mythical place","mythological place","신화 속 장소"},words="Asgard|Midgard|Jotunheim|Vanaheim|Alfheim|Niflheim|Muspelheim|Valhalla|Elysium|Tartarus|Olympus|Avalon|Atlantis|Annwn|Tir na nOg|Duat"},
 {title="애니메이션",aliases={"animation","animated series","cartoon show","애니메이션","애니메이션 이름"},words="Avatar: The Last Airbender|Gravity Falls|Adventure Time|Steven Universe|The Owl House|Amphibia|Over the Garden Wall|Hilda|Bluey|Phineas and Ferb|Kim Possible|DuckTales|The Dragon Prince|Kipo and the Age of Wonderbeasts|She-Ra and the Princesses of Power|Infinity Train|We Bare Bears|Regular Show|The Amazing World of Gumball|Chowder|Samurai Jack|The Powerpuff Girls|Foster's Home for Imaginary Friends|My Life as a Teenage Robot"},
 {title="일본 애니메이션 캐릭터",aliases={"anime character","일본 애니메이션 캐릭터","애니 캐릭터"},words="Spike Spiegel|Vash the Stampede|Faye Valentine|Lelouch Lamperouge|Violet Evergarden|Frieren|Maomao|Shigeo Kageyama|Reigen Arataka|Senku Ishigami|Yusuke Urameshi|Kurapika|Killua Zoldyck|Gon Freecss|Edward Elric|Alphonse Elric|Winry Rockbell|Riza Hawkeye|Roy Mustang|Kenshin Himura|Gintoki Sakata|Kagura|Tohru Honda|Kyo Sohma"},
 {title="만화 캐릭터",aliases={"cartoon character","comic character","만화 캐릭터","만화캐릭터"},words="Tintin|Asterix|Obelix|Lucky Luke|Snoopy|Woodstock|Charlie Brown|Lucy van Pelt|Calvin|Hobbes|Garfield|Odie|Popeye|Olive Oyl|Betty Boop|Felix the Cat|Bugs Bunny|Daffy Duck|Porky Pig|Speedy Gonzales|Marvin the Martian|Foghorn Leghorn|Tweety|Sylvester"},
 {title="애니메이션 동물 캐릭터",aliases={"animated animal character","cartoon animal","애니메이션 동물 캐릭터"},words="Perry the Platypus|Jake the Dog|Bojack Horseman|Gumball Watterson|Darwin Watterson|Scooby-Doo|Courage|Tom Cat|Jerry Mouse|Garfield|Odie|Snoopy|Bluey|Bingo|Brian Griffin|Huckleberry Hound"},
 {title="디즈니 공주",aliases={"disney princess","disney princesses","디즈니 공주"},words="Snow White|Cinderella|Aurora|Ariel|Belle|Jasmine|Pocahontas|Mulan|Tiana|Rapunzel|Merida|Moana|Raya"},
 {title="디즈니 악당",aliases={"disney villain","디즈니 악당"},words="Yzma|Dr. Facilier|Madam Mim|Ratigan|Frollo|Hades|Maleficent|Ursula|Jafar|Scar|Captain Hook|Cruella de Vil|Gaston|Mother Gothel|Shan Yu|Lady Tremaine|The Horned King|Prince John|Madame Medusa|Shere Khan"},
 {title="드림웍스 캐릭터",aliases={"dreamworks character","드림웍스 캐릭터"},words="Hiccup|Astrid|Toothless|Stormfly|Po|Tigress|Shifu|Tai Lung|Lord Shen|Shrek|Fiona|Donkey|Puss in Boots|Kitty Softpaws|Perrito|Megamind|Metro Man|Roxanne Ritchi|Alex|Marty|Melman|Gloria|Skipper|Kowalski|Private|Rico"},
 {title="산리오 캐릭터",aliases={"sanrio character","산리오 캐릭터"},words="Pochacco|Badtz-Maru|Tuxedosam|Hangyodon|Pekkle|Chococat|Kuromi|My Melody|Cinnamoroll|Pompompurin|Hello Kitty|Keroppi|Gudetama|Wish me mell|Cogimyun|Bonbonribbon|Marroncream|Kiki|Lala|Aggretsuko"},
 {title="스튜디오 지브리 캐릭터",aliases={"ghibli character","studio ghibli character","지브리 캐릭터"},words="Totoro|Catbus|No-Face|Haku|Chihiro|Kiki|Jiji|Howl|Sophie|Calcifer|San|Ashitaka|Ponyo|Sosuke|Nausicaa|Porco Rosso|Arrietty|Baron|Pazu|Sheeta"},
 {title="샌드위치 빵",aliases={"sandwich bread","샌드위치 빵"},words="Sourdough|Rye bread|Pumpernickel|Ciabatta|Focaccia|Baguette|Brioche|Bagel|English muffin|Pita|White bread|Whole wheat bread|Multigrain bread|Pan de cristal|Potato bread|Milk bread"},
 {title="샌드위치 속재료",aliases={"sandwich filling","sandwich ingredient","샌드위치 속재료","샌드위치 재료"},words="Pastrami|Corned beef|Roast beef|Smoked salmon|Turkey|Ham|Salami|Mortadella|Prosciutto|Tuna|Egg salad|Chicken salad|Hummus|Falafel|Mozzarella|Brie|Avocado|Pickle|Sauerkraut|Watercress|Arugula|Cucumber|Tomato|Lettuce"},
 {title="한국 애니메이션",aliases={"korean animation","korean cartoon","한국 애니메이션","국산 애니메이션"},words="뽀롱뽀롱 뽀로로|꼬마버스 타요|로보카 폴리|라바|브레드 이발소|캐치! 티니핑|헬로 카봇|또봇|터닝메카드|신비아파트|안녕 자두야|검정 고무신|아기공룡 둘리|달려라 하니|머털도사|두치와 뿌꾸|날아라 슈퍼보드|장금이의 꿈|출동! 슈퍼윙스"},
}
for _,row in ipairs(additionalTopics) do extraTopics[#extraTopics+1]=row end
local expandedAnswers = {
 ["그리스 신"]="Zeus|Hades|Poseidon|Hera|Aphrodite|Ares|Persephone|Hecate|Iris|Nike|Hebe|Eos|Selene|Helios|Nyx|Hypnos|Thanatos|Nemesis|Eris|Pan|Asclepius|Eros|Triton|Proteus|Morpheus|Harmonia|Tyche",
 ["디즈니 캐릭터"]="Milo Thatch|Kida|Jim Hawkins|John Silver|Morph|Amelia|Doppler|Taran|Eilonwy|Gurgi|Basil of Baker Street|Dawson|Olivia Flaversham|Ratigan|Bernard|Bianca|Orville|Penny|Evinrude|Pongo|Perdita|Roger Radcliffe|Anita Radcliffe|Lady|Tramp|Jock|Trusty|Bambi|Thumper|Flower|Tod|Copper|Robin Hood|Little John|Maid Marian|Scrooge McDuck|Launchpad McQuack|Darkwing Duck|Oswald the Lucky Rabbit|Clarabelle Cow|Horace Horsecollar|Pete|Max Goof|Ludwig Von Drake|Figment|Tinker Bell|Silvermist|Rosetta|Iridessa|Fawn|Vidia|Mickey Mouse|Minnie Mouse|Donald Duck|Daisy Duck|Goofy|Pluto|Stitch|Lilo|Nani|Jumba|Pleakley|Nani Pelekai|Maui|Hei Hei|Pua|Olaf|Sven|Kristoff|Anna|Elsa|Pascal|Maximus|Flynn Rider|Ralph|Vanellope|Fix-It Felix|Baymax|Hiro Hamada|Go Go Tomago|Honey Lemon|Wasabi|Fred|Nick Wilde|Judy Hopps|Clawhauser|Flash|Gazelle|Bolt|Mittens|Rhino|Raya|Sisu|Tuk Tuk",
 ["애니메이션 영화"]="The Emperor's New Groove|Atlantis: The Lost Empire|Treasure Planet|The Black Cauldron|The Great Mouse Detective|The Rescuers|The Rescuers Down Under|Oliver & Company|The Fox and the Hound|Robin Hood|The Sword in the Stone|Meet the Robinsons|Bolt|Brother Bear|Home on the Range|The Princess and the Frog|Lilo & Stitch|Wreck-It Ralph|Big Hero 6|Zootopia|Raya and the Last Dragon|Encanto|The Jungle Book|Bambi|Pinocchio|Dumbo|The Aristocats|The Many Adventures of Winnie the Pooh|Sleeping Beauty|Alice in Wonderland|The Tale of the Princess Kaguya|Pom Poko|Only Yesterday|Whisper of the Heart|The Cat Returns|Porco Rosso|Castle in the Sky|Nausicaa of the Valley of the Wind|The Wind Rises|When Marnie Was There|Wolfwalkers|The Breadwinner|Ernest & Celestine|A Cat in Paris|The Triplets of Belleville|My Life as a Zucchini|Mary and Max|The Red Turtle|The Mitchells vs. the Machines|Nimona|The Bad Guys|Puss in Boots: The Last Wish|The Wild Robot",
 ["샌드위치"]="BLT|Club sandwich|Monte Cristo|Croque madame|Croque monsieur|Tuna melt|Patty melt|Grilled cheese|Cheesesteak|French dip|Italian beef|Lobster roll|Shrimp roll|Crab roll|Fluffernutter|Peanut butter and jelly|Sloppy joe|Pulled pork sandwich|Pastrami on rye|Corned beef sandwich|Egg salad sandwich|Chicken salad sandwich|Cucumber sandwich|Watercress sandwich|Ploughman's sandwich|Chip butty|Bacon butty|Toastie|Bauru|Choripan|Chacarero|Barros Luco|Barros Jarpa|Cemita|Torta|Pambazo|Mollete|Jibarito|Tripleta|Medianoche|Elena Ruz|Francesinha|Bifana|Prego|Smorrebrod|Smorgastarta|Broodje kroket|Mitraillette|Doubles|Vada pav|Dabeli|Bombay sandwich|Katsu sando|Tamago sando|Fruit sando|Yakisoba pan|Sabich|Shawarma|Doner kebab|Gyro|Falafel sandwich|Pane e panelle|Piadina|Tramezzino|Mozzarella in carrozza|Porchetta sandwich|Roujiamo|Gua bao|Lampredotto|Fischbrotchen|Leberkase sandwich",
 ["그리스 여신"]="Asteria|Astraea|Dike|Eunomia|Eirene|Ananke|Bia|Peitho|Enyo|Metis|Leto|Dione|Amphitrite|Thetis|Galatea|Leucothea|Britomartis|Pasiphae|Hygieia|Panacea",
 ["북유럽 신"]="Odin|Thor|Loki|Frigg|Sif|Hel|Bragi|Forseti|Hodr|Vidar|Vali|Ullr|Eir|Fulla|Gefjon|Nanna|Ran|Aegir|Sol|Mani",
 ["이집트 신"]="Ra|Amun|Ptah|Khnum|Hathor|Nephthys|Nut|Geb|Shu|Tefnut|Ma'at|Khonsu|Bes|Taweret|Aten|Wadjet|Nekhbet|Serket|Wepwawet|Seshat",
 ["픽사 캐릭터"]="Woody|Buzz Lightyear|Jessie|Bo Peep|Rex|Hamm|Slinky Dog|Bullseye|Lotso|Forky|Duke Caboom|Gabby Gabby|Mike Wazowski|James P. Sullivan|Boo|Randall Boggs|Roz|Celia Mae|Nemo|Marlin|Gill|Crush|Squirt|Bruce|Darla|Lightning McQueen|Mater|Sally Carrera|Doc Hudson|Chick Hicks|Guido|Luigi|Ramone|Flo|Edna Mode|Elastigirl|Mr. Incredible|Violet Parr|Dash Parr|Jack-Jack|Syndrome|Colette Tatou|Anton Ego|Emile|Dug|Russell|Carl Fredricksen|Kevin|Joy|Sadness|Anger|Fear|Disgust|Bing Bong|Anxiety|Envy|Embarrassment|Ennui|Alberto Scorfano|Giulia Marcovaldo|Mei Lee|Ming Lee|Joe Gardner|22|Ember Lumen|Wade Ripple",
 ["아이스크림 맛"]="Mint chocolate chip|Rocky road|Butter pecan|Rum raisin|Coffee|Mango|Coconut|Peach|Lemon|Raspberry ripple|Cookie dough|Cookies and cream|Stracciatella|Dulce de leche|Spumoni|Tutti frutti|Bubblegum|Banana|Blueberry|Cherry|Lavender|Rose|Earl Grey|Thai tea|Taro|Red bean|Sweet corn|Honeycomb|Maple walnut|Hazelnut",
 ["헤어스타일"]="Pompadour|Quiff|Undercut|Mullet|Pixie cut|Bob cut|Wolf cut|Shag|Bowl cut|Buzz cut|Crew cut|Flat top|French crop|Caesar cut|Mohawk|Faux hawk|Cornrows|Dreadlocks|Box braids|French braid|Dutch braid|Fishtail braid|Ponytail|Pigtails|Bun|Top knot|Chignon|Beehive|Victory rolls|Finger waves|Curtain bangs|Hime cut|Pageboy|Afro|Twists|Bantu knots",
 ["옷"]="Leg warmer|Bolero|Camisole|Halter top|Tunic|Blazer|Duffle coat|Peacoat|Trench coat|Cape|Cloak|Shawl|Stole|Shrug|Gilet|Tabard|Jodhpurs|Dungarees|Culottes|Palazzo pants|Capri pants|Cargo pants|Chinos|Slacks|Kilt|Skort|Petticoat|Crinoline|Slip dress|Pinafore|Sundress|Jumpsuit|Romper|Overalls|Turtleneck|Henley shirt|Polo shirt|Rash guard|Windbreaker|Bomber jacket|Harrington jacket|Varsity jacket|Cardigan|Sweater vest|Thermal underwear|Leotard|Unitard|Tutu|Toga|Sari|Hanbok|Cheongsam|Ao dai|Dashiki|Dirndl|Lederhosen|Ghutra|Keffiyeh|Balaclava|Bandana",
 ["신발"]="Oxford|Derby|Monk strap|Chelsea boot|Chukka boot|Desert boot|Wellington boot|Mary Jane|Ballet flat|Slingback|Mule|Slide|Flip-flop|Wedge|Platform shoe|Stiletto|Court shoe|Galosh|Geta|Zori|Jutti|Huarache|Bast shoe|Valenki",
 ["소스"]="쌈장|초장|고추장|된장|간장|굴소스|돈가스소스|양념치킨소스|불닭소스|데리야키소스|유자소스|참깨소스|겨자소스|와사비마요|청양마요|갈릭디핑소스|스위트칠리소스|칠리소스|로제소스|타르타르소스|Bordelaise|Bearnaise|Veloute|Espagnole|Gribiche|Remoulade|Aioli|Salsa verde|Mole|Adobo|Ponzu|Tonkatsu sauce|XO sauce|Hoisin sauce|Oyster sauce|Black bean sauce|Sweet chili sauce|Peanut sauce|Satay sauce|Sambal|Gochujang|Ssamjang|Doenjang|Chogochujang|Yuzu kosho|Nuoc cham|Toum|Muhammara|Zhug|Amba|Skordalia|Tzatziki|Ajvar|Tkemali|Satsebeli|Hogao|Huancaina|Aji verde|Mojo|Sofrito|Salmoriglio|Bagna cauda|Marinara|Arrabbiata|Carbonara|Alfredo|Bolognese|Ragu|Cocktail sauce|Worcestershire sauce",
 ["날씨"]="소나기|이슬비|가랑비|진눈깨비|우박|폭설|함박눈|안개|박무|황사|뇌우|천둥|번개|서리|이슬|무지개|Dust storm|Sandstorm|Blizzard|Snow flurry|Sunshower|Freezing rain|Ice fog|Haze|Squall|Downpour|Virga|Frost|Dew|Rainbow",
 ["카드게임"]="Durak|Skat|Doppelkopf|Schafkopf|Belote|Tarot|Briscola|Scopa|Tressette|Mus|Escoba|Truco|President|Cheat|Old Maid|Snap|Beggar-my-neighbour|War|Crazy Eights|Switch|Sevens|Spoons|Speed|Spit|Egyptian Ratscrew|Golf|Palace|Uno|Phase 10|Skip-Bo|The Mind|The Crew|Hanabi|Love Letter|Sushi Go!|Exploding Kittens|Coup|Bohnanza|6 nimmt!|No Thanks!",
 ["보드게임"]="Cascadia|Calico|Sagrada|Kingdomino|Queendomino|Akropolis|Codenames|Dixit|Just One|Wavelength|Decrypto|Telestrations|Camel Up|Quacks of Quedlinburg|Potion Explosion|King of Tokyo|Takenoko|Tsuro|Onitama|Quoridor|Blokus|Santorini|Qwirkle|Rummikub|Sequence|Labyrinth|Scotland Yard|Clue|Stratego|Othello|Go|Chess|Backgammon|Mancala|Carrom|Crokinole|Klask|Halli Galli|Dobble|Rhino Hero",
 ["비디오 게임"]="Outer Wilds|Return of the Obra Dinn|Disco Elysium|Tunic|Fez|Braid|Bastion|Transistor|Pyre|Hyper Light Drifter|Dead Cells|Slay the Spire|Balatro|Inscryption|Into the Breach|FTL: Faster Than Light|Papers, Please|The Stanley Parable|Superliminal|Viewfinder|Cocoon|Chants of Sennaar|Animal Well|Dredge|Dave the Diver|A Short Hike|Spiritfarer|Unpacking|Dorfromantik|Gris|Neva|Ori and the Blind Forest|Ori and the Will of the Wisps|Cuphead|Shovel Knight|Katana Zero|Hotline Miami|Risk of Rain 2|Enter the Gungeon|Vampire Survivors|Brotato|Noita|Spelunky|Spelunky 2|Oxygen Not Included|RimWorld|Factorio|Satisfactory|Dyson Sphere Program|Kerbal Space Program|Subnautica|The Long Dark|Don't Starve|Don't Starve Together|Raft|Valheim|V Rising|Grounded|Astroneer|Deep Rock Galactic|Sea of Thieves|Hunt: Showdown|Titanfall 2|Prey|Dishonored|Dishonored 2|Deus Ex|System Shock|BioShock|Psychonauts|Psychonauts 2|Okami|Shadow of the Colossus|Ico|The Last Guardian|Journey|Abzu|Flower|Sable|Eastshade",
 ["로블록스 게임"]="Work at a Pizza Place|Epic Minigames|Super Bomb Survival|Super Doomspire|Flood Escape 2|Entry Point|Dummies vs Noobs|Robot 64|Super Cube Cavern|Adventure Forward 2|Find the Chomiks|Find the Markers|Item Asylum|Regretevator|Block Tales|Pilgrammed|Arcane Odyssey|Deepwoken|Fantastic Frontier|World Zero|Vesteria|Dungeon Quest|Treasure Quest|Bee Swarm Simulator|Tower Defense Simulator|Tower Heroes|Tower Battles|Towers of Hell|Juke's Towers of Hell|Speed Run 4|Mega Fun Obby|Escape Room|Break In|Break In 2|Camping|The Mimic|Apeirophobia|The Rake Remastered|Specter|3008|Evade|Nico's Nextbots|Hide and Seek Extreme|Murder Mystery 2|Flee the Facility|Survive the Killer!|Banana Eats|Piggy|Dandy's World|Untitled Tag Game|Slap Battles|Ability Wars|Super Golf!|Golf It!|Robeats|Funky Friday|Project Lazarus|Those Who Remain|Deadline|Frontlines|Bad Business|Phantom Forces|Counter Blox|Michael's Zombies|Guts & Blackpowder|Centaura|Dead Ahead|Trenches|Steel Titans",
 ["포켓몬"]="Qwilfish|Corsola|Stantler|Smeargle|Delibird|Mantine|Skarmory|Phanpy|Donphan|Sunkern|Sunflora|Pineco|Forretress|Gligar|Granbull|Snubbull|Hoppip|Skiploom|Jumpluff|Wooper|Quagsire|Lanturn|Chinchou|Natu|Xatu|Sudowoodo|Aipom|Yanma|Murkrow|Misdreavus|Unown|Wobbuffet|Teddiursa|Ursaring|Slugma|Magcargo|Swinub|Piloswine|Remoraid|Octillery|Stantler|Surskit|Masquerain|Nincada|Ninjask|Shedinja|Whismur|Loudred|Exploud|Makuhita|Hariyama|Nosepass|Skitty|Delcatty|Sableye|Meditite|Medicham|Electrike|Manectric|Volbeat|Illumise|Gulpin|Swalot|Carvanha|Sharpedo|Wailmer|Wailord|Numel|Camerupt|Torkoal|Spoink|Grumpig|Spinda|Trapinch|Vibrava|Cacnea|Cacturne|Swablu|Altaria|Zangoose|Seviper|Lunatone|Solrock|Barboach|Whiscash|Corphish|Crawdaunt|Baltoy|Claydol|Lileep|Cradily|Anorith|Armaldo|Shuppet|Banette|Duskull|Dusclops|Snorunt|Glalie|Spheal|Sealeo|Walrein|Clamperl|Huntail|Gorebyss|Relicanth|Luvdisc",
 ["마블 캐릭터"]="Cloak|Dagger|Iron Fist|Luke Cage|Jessica Jones|Misty Knight|Colleen Wing|Echo|White Tiger|Shang-Chi|Moon Girl|Devil Dinosaur|Ms. Marvel|America Chavez|Kate Bishop|Wiccan|Hulkling|Patriot|Speed|Stature|Quake|Mockingbird|Sif|Beta Ray Bill|Hercules|Wonder Man|Tigra|Black Knight|Sersi|Ikaris|Makkari|Druig|Phastos|Kingo|Sprite|Thena|Gilgamesh|Ajak|Drax|Mantis|Rocket Raccoon|Groot|Nebula|Yondu|Cosmo|Adam Warlock|Silver Surfer|Namor|Clea|Wong|Dormammu|Nightmare|Magik|Colossus|Kitty Pryde|Jubilee|Bishop|Cable|Forge|Sunspot|Cannonball|Wolfsbane|Mirage|Karma|Warlock|Polaris|Havok|Banshee|Dazzler|Longshot|Multiple Man",
 ["슈퍼히어로"]="The Question|Plastic Man|Elongated Man|Mister Terrific|Doctor Fate|Doctor Mid-Nite|Hourman|Starman|Wildcat|Sandman|Phantom Stranger|Deadman|Spectre|Hawkman|Hawkgirl|Atom|Firestorm|Vixen|Black Canary|Huntress|Batwoman|Batgirl|Nightwing|Red Hood|Red Robin|Spoiler|Orphan|Static|Icon|Rocket|Hardware|Metamorpho|Red Tornado|Fire|Ice|Captain Atom|Animal Man|Swamp Thing|Adam Strange|Adam Warlock",
 ["디저트"]="Cendol|Bingsu|Halo-halo|Kulfi|Rasmalai|Gulab jamun|Jalebi|Kheer|Basbousa|Revani|Lokum|Muhallebi|Sutlac|Kataifi|Loukoumades|Galaktoboureko|Rizogalo|Arroz con leche|Tres leches cake|Flan|Chocoflan|Brigadeiro|Beijinho|Quindim|Cocada|Suspiro limeno|Mazamorra morada|Picarones|Alfajor|Dulce de membrillo|Pouding chomeur|Nanaimo bar|Butter tart|Syllabub|Eton mess|Trifle|Sticky toffee pudding|Spotted dick|Cranachan|Bannoffee pie|Bakewell tart|Treacle tart|Clafoutis|Far breton|Ile flottante|Creme caramel|Creme brulee|Creme anglaise|Mont blanc|Vacherin|Paris-Brest|Mille-feuille|Saint-honore|Religieuse|Opera cake|Dacquoise|Financier|Canele|Chiboust|Zabaglione|Semifreddo|Cassata|Zuccotto|Affogato|Budino|Tartufo|Sfogliatella|Zeppole|Bombolone|Pastiera|말차빙수|팥빙수|인절미빙수|약과|유과|다식|정과|양갱|수정과|오미자화채|호떡|꿀떡|백설기|경단|송편|찹쌀떡",
 ["한국 음식"]="감자옹심이|메밀전병|수수부꾸미|도토리묵|청포묵|묵사발|곤드레밥|산채비빔밥|콩나물밥|굴밥|전복죽|호박죽|동지팥죽|잣죽|흑임자죽|타락죽|추어탕|다슬기국|재첩국|올갱이국|매생이국|황태해장국|북엇국|콩나물국밥|순대국|돼지국밥|설렁탕|곰탕|육개장|감자탕|우거지탕|갈비탕|도가니탕|꼬리곰탕|아귀찜|해물찜|코다리찜|동태찌개|알탕|꽃게탕|대구탕|지리탕|연포탕|초계국수|막국수|밀면|비빔국수|잔치국수|칼국수|수제비|들깨수제비|팥칼국수|장칼국수|콩국수|어죽|잡탕밥|오징어순대|순대볶음|골뱅이무침|홍어삼합|꼬막무침|육회|간장게장|양념게장|새우장|전복장|장조림|깻잎장아찌|오이지|무말랭이무침|고사리나물|도라지무침|시래기나물|취나물|미나리전|감자전|녹두전|굴전|동태전|육전|배추전|김치전|파전|해물파전|부추전|빈대떡|동그랑땡|두부조림|갈치조림|고등어조림|꽁치조림|닭볶음탕|찜닭|닭한마리|백숙|오리주물럭|오리백숙|보쌈|족발|편육",
 ["음료"]="차이|미숫가루|식혜|수정과|오미자차|매실차|유자차|대추차|생강차|쌍화차|보리차|옥수수차|결명자차|둥굴레차|율무차|Adlay tea|Barley tea|Corn tea|Plum tea|Yuja tea|Masala chai|Karak chai|Thai iced tea|Thai iced coffee|Vietnamese iced coffee|Coconut water|Sugarcane juice|Soursop juice|Soursop smoothie|Avocado smoothie|Calamansi juice|Agua de jamaica|Agua de tamarindo|Atole|Champurrado|Salep|Sahlab|Boza|Kompot|Mors|Kissel|Sbiten|Tepache|Chicha morada|Bandung|Cendol drink|Falooda|Sharbat|Jallab|Sobia|Qamar al-din|Limonana|Sekanjabin|Doogh|Borhani|Sattu|Nimbu pani|Jaljeera|Solkadhi|Panakam",
 ["탄산음료"]="밀키스|암바사|맥콜|천연사이다|칠성사이다|나랑드사이다|환타|오란씨|데미소다|웰치스|탑씨|닥터페퍼|마운틴듀|스프라이트|코카콜라|펩시|미린다|Sprecher Root Beer|Moxie|Cheerwine|Big Red|Faygo|Vernors|Sun Drop|Squirt|Fresca|Tab|Irn-Bru|Dandelion and burdock|Bitter lemon|Chinotto|Cedrata|Crodino|Aranciata|Orangina|Ramune|Mitsuya Cider|Melon soda|Chilsung Cider|Milkis|Guarana Antarctica|Inca Kola|Jarritos|Manzanita Sol|Sidral Mundet|Ting|Lilt|Vimto|Tizer|Kola Champagne",
 ["과일"]="Apple|Apricot|Banana|Blackcurrant|Blueberry|Boysenberry|Cantaloupe|Cherry|Coconut|Cranberry|Date|Dragon fruit|Fig|Grape|Grapefruit|Guava|Honeydew|Kiwi|Lemon|Lime|Lychee|Mandarin|Mango|Mulberry|Nectarine|Olive|Orange|Papaya|Passion fruit|Peach|Pear|Pineapple|Plum|Pomegranate|Raspberry|Strawberry|Tangerine|Watermelon|Asian pear|Clementine|Greengage|Loganberry|Marionberry|Salmonberry|Tayberry|Wineberry|Huckleberry|Black sapote|Mamey sapote|Abiu",
 ["반려동물"]="Dog|Cat|Hamster|Gerbil|Guinea pig|Rabbit|Chinchilla|Degu|Fancy rat|Fancy mouse|Ferret|Hedgehog|Sugar glider|Budgerigar|Cockatiel|Lovebird|Canary|Finch|Parrotlet|Bourke's parakeet|Gouldian finch|Diamond dove|Goldfish|Guppy|Betta|Molly|Platy|Swordtail|Neon tetra|Corydoras|Bristlenose pleco|Zebra danio|Cherry barb|Kuhli loach|Mystery snail|Nerite snail|Cherry shrimp|Amano shrimp|Leopard gecko|Crested gecko|Bearded dragon|Blue-tongued skink|Ball python|Corn snake|Hermann's tortoise|Axolotl|White's tree frog|Pacman frog|African dwarf frog",
 ["가수"]="Alicia Keys|Norah Jones|Regina Spektor|Fiona Apple|Tori Amos|Kate Bush|Björk|Sade|Joni Mitchell|Tracy Chapman|Suzanne Vega|Imogen Heap|Feist|Roisin Murphy|Jessie Ware|Raye|Jorja Smith|Cleo Sol|Celeste|Yebba|Lianne La Havas|Nao|Moses Sumney|Sampha|James Blake|Bon Iver|Ben Howard|Paolo Nutini|Michael Kiwanuka|Leon Bridges|Jacob Banks|Rag'n'Bone Man|Tom Odell|Rufus Wainwright|Sufjan Stevens|Jose Gonzalez|Damien Rice|Nick Drake|Jeff Buckley|Elliott Smith",
 ["개 품종"]="Xoloitzcuintli|Lagotto Romagnolo|Thai Ridgeback|Rhodesian Ridgeback|Norwegian Lundehund|Swedish Vallhund|Finnish Spitz|Karelian Bear Dog|Icelandic Sheepdog|Norwegian Elkhound|Tibetan Terrier|Lhasa Apso|Lowchen|Coton de Tulear|Havanese|Bolognese|Bichon Frise|Chinese Crested|Peruvian Inca Orchid|Cirneco dell'Etna|Pharaoh Hound|Ibizan Hound|Sloughi|Chart Polski|Scottish Deerhound|Irish Wolfhound|Otterhound|Bloodhound|Basset Hound|Petit Basset Griffon Vendeen|Berger Picard|Beauceron|Briard|Bergamasco|Komondor|Kuvasz|Maremma Sheepdog|Anatolian Shepherd|Leonberger|Eurasier",
 ["고양이 품종"]="Abyssinian|Somali|Bengal|Savannah|Serengeti|Egyptian Mau|Turkish Van|Turkish Angora|Japanese Bobtail|American Bobtail|Kurilian Bobtail|Manx|Cymric|Norwegian Forest Cat|Siberian|Neva Masquerade|Maine Coon|Ragdoll|Ragamuffin|Birman|Balinese|Javanese|Siamese|Oriental Shorthair|Peterbald|Donskoy|Sphynx|Devon Rex|Cornish Rex|Selkirk Rex|LaPerm|American Curl|Scottish Fold|British Shorthair|British Longhair|Exotic Shorthair|Persian|Himalayan|Burmese|Tonkinese",
 ["치즈"]="Appenzeller|Tete de Moine|Raclette|Vacherin Mont d'Or|Beaufort|Abondance|Reblochon|Tomme de Savoie|Cantal|Salers|Morbier|Ossau-Iraty|Fourme d'Ambert|Bleu d'Auvergne|Saint-Nectaire|Chaource|Brillat-Savarin|Boursin|Neufchatel|Pont-l'Eveque|Livarot|Maroilles|Epoisses|Munster|Langres|Crottin de Chavignol|Valencay|Sainte-Maure de Touraine|Selles-sur-Cher|Pouligny-Saint-Pierre|Banon|Picodon|Rocamadour|Cabecou|Brousse|Brocciu|Pecorino Romano|Pecorino Sardo|Asiago|Fontina|Taleggio|Gorgonzola|Provolone|Scamorza|Caciocavallo|Stracciatella|Ricotta|Mascarpone|Parmigiano Reggiano|Grana Padano|Red Leicester|Double Gloucester|Wensleydale|Caerphilly|Lancashire|Cheshire|Shropshire Blue|Cornish Yarg|Cabrales|Idiazabal|Mahón|Tetilla|Roncal|Garrotxa|Serra da Estrela|Queijo de Azeitao|Cotija|Oaxaca|Queso fresco|Panela",
 ["직업"]="Actuary|Audiologist|Arborist|Apiculturist|Agronomist|Acoustician|Biostatistician|Bookbinder|Calligrapher|Conservator|Court reporter|Curator|Dendrochronologist|Dietitian|Entomologist|Ethnobotanist|Gemologist|Herpetologist|Hydrologist|Ichthyologist|Interpreter|Landscape architect|Lepidopterist|Locksmith|Metallurgist|Meteorologist|Microbiologist|Milliner|Mycologist|Oceanographer|Optometrist|Ornithologist|Orthotist|Osteopath|Palynologist|Patent examiner|Podiatrist|Prosthetist|Radiographer|Seismologist|Silversmith|Sommelier|Speech therapist|Surveyor|Toxicologist|Upholsterer|Urban planner|Volcanologist|Welder|Zoologist",
 ["악기"]="Balalaika|Bouzouki|Charango|Cuatro|Cavaquinho|Bandura|Domra|Dombra|Rubab|Rebab|Saz|Baglama|Setar|Tanbur|Dotar|Gusli|Guzheng|Guqin|Yangqin|Dizi|Sheng|Suona|Hulusi|Bawu|Xiao|Ney|Duduk|Zurna|Kaval|Quena|Zampona|Ocarina|Pan flute|Tin whistle|Uilleann pipes|Great Highland bagpipe|Duduk|Shakuhachi|Sho|Hichiriki|Taiko|Tsuzumi|Madal|Mridangam|Ghatam|Kanjira|Pakhawaj|Dhol|Dholak|Tumbi|Ektara|Esraj|Dilruba|Ravanhatta|Santoor|Jal tarang|Mbira|Kalimba|Balafon|Ngoni|Kobza|Nyckelharpa",
 ["공룡"]="Acrocanthosaurus|Allosaurus|Albertosaurus|Alioramus|Ankylosaurus|Apatosaurus|Argentinosaurus|Australovenator|Bambiraptor|Brontosaurus|Camarasaurus|Carcharodontosaurus|Ceratosaurus|Chasmosaurus|Coelophysis|Compsognathus|Concavenator|Corythosaurus|Cryolophosaurus|Daspletosaurus|Deinonychus|Diabloceratops|Dilophosaurus|Diplodocus|Dreadnoughtus|Dromaeosaurus|Dryosaurus|Edmontonia|Edmontosaurus|Eoraptor|Gallimimus|Giganotosaurus|Giraffatitan|Gorgosaurus|Herrerasaurus|Hypsilophodon|Irritator|Lambeosaurus|Leaellynasaura|Maiasaura|Majungasaurus|Mapusaurus|Massospondylus|Megalosaurus|Microraptor|Monolophosaurus|Mussaurus|Nigersaurus|Oviraptor|Pachycephalosaurus|Parasaurolophus|Plateosaurus|Protoceratops|Psittacosaurus|Qianzhousaurus|Rajasaurus|Rugops|Saltasaurus|Saurolophus|Shunosaurus|Sinoceratops|Sinornithosaurus|Sinosauropteryx|Spinosaurus|Stegosaurus|Struthiomimus|Styracosaurus|Suchomimus|Tarbosaurus|Tenontosaurus|Torvosaurus|Triceratops|Troodon|Tyrannosaurus|Utahraptor|Velociraptor|Yutyrannus|Zalmoxes|Zuniceratops",
 ["꽃"]="Aster|Amaryllis|Allium|Alstroemeria|Begonia|Borage|Calendula|Camellia|Campanula|Carnation|Celosia|Chrysanthemum|Columbine|Cornflower|Crocus|Cyclamen|Daffodil|Dahlia|Daisy|Dianthus|Echinacea|Edelweiss|Eryngium|Foxglove|Fritillaria|Fuchsia|Gardenia|Gaillardia|Gazania|Geranium|Gerbera|Gladiolus|Gypsophila|Heather|Hibiscus|Hollyhock|Hyacinth|Hydrangea|Impatiens|Iris|Lantana|Lavender|Lilac|Lily|Lily of the valley|Lobelia|Lupin|Magnolia|Marigold|Nasturtium|Nemesia|Nigella|Orchid|Pansy|Passionflower|Peony|Petunia|Phlox|Poppy|Primrose|Ranunculus|Rose|Salvia|Scabiosa|Snapdragon|Snowdrop|Statice|Stock|Sunflower|Sweet pea|Sweet William|Tansy|Trillium|Tulip|Verbena|Veronica|Viola|Wallflower|Wisteria|Yarrow",
}
for title,words in pairs(lists) do if expandedAnswers[title] then lists[title]=words.."|"..expandedAnswers[title] end end
for _,row in ipairs(extraTopics) do if expandedAnswers[row.title] then row.words=row.words.."|"..expandedAnswers[row.title] end end

for _,row in ipairs(extraTopics) do
 if row.title=='샌드위치' then
  row.aliases[#row.aliases+1]='샌드위치 종류'
  row.aliases[#row.aliases+1]='샌드윛'
  row.aliases[#row.aliases+1]='sandwich type'
  row.aliases[#row.aliases+1]='type of sandwich'
 end
 if row.title=='디즈니 캐릭터' then row.aliases[#row.aliases+1]='디즈니' end
end
-- v6 game-item answer examples. These names do not imply acceptance in Rarest Answer Party.
-- Reference samples: https://learn.microsoft.com/en-us/minecraft/creator/commands/enums/item
-- https://terraria.wiki.gg/wiki/Cell_Phone https://stardewvalleywiki.com/Items
local gameItemTopics = {
 {title="게임 아이템",aliases={"game item","video game item","gaming item","게임 아이템","게임아이템"},words="Estus Flask|Humanity|Homeward Bone|Ember|Soul Vessel|Lifegem|Divine Blessing|Fire Keeper Soul|Prism Stone|Rusted Coin|Phoenix Down|Ether|Elixir|Megalixir|Antidote|Remedy|Tent|Cottage|Rare Candy|Master Ball|Heart Container|Rupee|Hookshot|Ocarina of Time|Super Mushroom|Fire Flower|Tanooki Suit|Power Star|Super Leaf|Chaos Emerald|Golden Ring|Maxim Tomato|Warp Star|E-Tank|Energy Tank|Morph Ball|Gravity Suit|Fairy Bottle|Magic Mirror|Prismatic Shard|Gravity Coil|Bloxy Cola|Elytra|Totem of Undying|Ender Pearl|Portal Gun|Companion Cube|Pip-Boy|Nuka-Cola|Vault Boy Bobblehead|Soul Gem|Sweet Roll|Wonder Seed"},
 {title="게임 무기",aliases={"game weapon","video game weapon","게임 무기"},words="Master Sword|Biggoron's Sword|Great Fairy's Sword|Fierce Deity Sword|Buster Sword|Masamune|Gunblade|Keyblade|Ultima Weapon|Monado|Falchion|Ragnell|Alondite|Levin Sword|Moonlight Greatsword|Zweihander|Claymore|Uchigatana|Great Scythe|Dragon Tooth|Black Knight Sword|Sunlight Straight Sword|Lightning Spear|Zenith|Terra Blade|Night's Edge|Meowmere|Star Wrath|Last Prism|S.D.M.G.|Terraprisma|Daedalus Stormbow|Demon Scythe|Flower of Fire|Ice Rod|Diamond Sword|Netherite Sword|Trident|Crossbow|Enchanted Boomerang|Staff of Regrowth|Vampire Knives|Rainbow Rod|Razorpine|Influx Waver|North Pole|Flairon"},
 {title="게임 방어구",aliases={"game armor","game armour","video game armor","게임 방어구","게임 갑옷"},words="Diamond Helmet|Diamond Chestplate|Diamond Leggings|Diamond Boots|Netherite Helmet|Netherite Chestplate|Netherite Leggings|Netherite Boots|Iron Helmet|Iron Chestplate|Turtle Shell|Golden Helmet|Leather Tunic|Chainmail Chestplate|Solar Flare Helmet|Vortex Helmet|Nebula Helmet|Stardust Helmet|Hallowed Mask|Chlorophyte Mask|Beetle Helmet|Shroomite Headgear|Spectre Hood|Molten Helmet|Cactus Helmet|Frost Helmet|Fossil Helmet|Jungle Hat|Meteor Helmet|Wizard Hat|Hero's Shield|Ankh Shield|Hylian Shield|Mirror Shield|Deku Shield|Zora Tunic|Goron Tunic|Champion's Tunic|Stealth Mask|Flamebreaker Helm"},
 {title="게임 소모품",aliases={"game consumable","consumable item","게임 소모품","게임 회복 아이템"},words="Health Potion|Mana Potion|Stamina Potion|Elixir|Ether|Antidote|Phoenix Down|Remedy|Estus Flask|Lifegem|Divine Blessing|Green Herb|Red Herb|Blue Herb|First Aid Spray|First Aid Med|Herbal Medicine|Medkit|Bandage|Super Potion|Hyper Potion|Max Potion|Full Restore|Revive|Max Revive|Fresh Water|Soda Pop|Lemonade|Moomoo Milk|Honey Bottle|Suspicious Stew|Golden Apple|Enchanted Golden Apple|Cooked Porkchop|Cooked Beef|Baked Potato|Recall Potion|Healing Potion|Restoration Potion|Lesser Mana Potion|Bottled Honey|Strange Brew"},
 {title="게임 제작 재료",aliases={"game crafting material","crafting material","게임 제작 재료","게임 재료"},words="Iron Ingot|Gold Ingot|Copper Ingot|Netherite Ingot|Netherite Scrap|Ancient Debris|Blaze Rod|Blaze Powder|Ghast Tear|Magma Cream|Slimeball|Rabbit's Foot|Phantom Membrane|Nautilus Shell|Prismarine Shard|Prismarine Crystals|Echo Shard|Amethyst Shard|Dragon Scale|Demonite Ore|Crimtane Ore|Hellstone Bar|Hallowed Bar|Chlorophyte Bar|Luminite Bar|Soul of Light|Soul of Night|Soul of Might|Soul of Sight|Soul of Fright|Pixie Dust|Unicorn Horn|Fallen Star|Stardust Fragment|Solar Fragment|Vortex Fragment|Nebula Fragment|Battery Pack|Hardwood|Refined Quartz|Cinder Shard|Dragon Tooth|Radioactive Bar"},
 {title="마인크래프트 아이템",aliases={"minecraft item","minecraft items","마인크래프트 아이템","마크 아이템"},words="Elytra|Totem of Undying|Ender Pearl|Eye of Ender|Nether Star|Heart of the Sea|Nautilus Shell|Echo Shard|Recovery Compass|Spyglass|Brush|Bundle|Goat Horn|Disc Fragment|Music Disc|Name Tag|Saddle|Lead|Clock|Compass|Map|Lodestone Compass|Carrot on a Stick|Warped Fungus on a Stick|Fishing Rod|Shears|Flint and Steel|Fire Charge|Firework Rocket|Firework Star|Trident|Crossbow|Bow|Shield|Mace|Breeze Rod|Wind Charge|Heavy Core|Trial Key|Ominous Trial Key|Ominous Bottle|Bottle o' Enchanting|Dragon's Breath|Honey Bottle|Suspicious Stew|Golden Apple|Enchanted Golden Apple|Golden Carrot|Glistering Melon Slice|End Crystal|Armor Stand|Item Frame|Glow Item Frame|Painting|Flower Pot|Decorated Pot|Honeycomb|Turtle Scute|Armadillo Scute|Wolf Armor|Turtle Shell|Phantom Membrane|Rabbit's Foot|Rabbit Hide|Shulker Shell|Shulker Box|Netherite Upgrade Smithing Template|Diamond Horse Armor|Iron Horse Armor|Golden Horse Armor|Leather Horse Armor|Knowledge Book|Written Book|Book and Quill|Enchanted Book|Debug Stick|Command Block Minecart|Minecart with Chest|Minecart with Hopper|Minecart with TNT|Oak Boat|Bamboo Raft|Oak Chest Boat|Bucket of Axolotl|Bucket of Tadpole|Bucket of Tropical Fish|Bucket of Pufferfish|Powder Snow Bucket|Lava Bucket|Water Bucket|Milk Bucket"},
 {title="마인크래프트 블록",aliases={"minecraft block","minecraft blocks","마인크래프트 블록","마크 블록"},words="Lodestone|Respawn Anchor|Conduit|Beacon|Enchanting Table|Brewing Stand|Ender Chest|Shulker Box|Chiseled Bookshelf|Lectern|Cartography Table|Fletching Table|Smithing Table|Loom|Stonecutter|Grindstone|Blast Furnace|Smoker|Composter|Crafter|Calibrated Sculk Sensor|Sculk Shrieker|Sculk Catalyst|Sculk Sensor|Sculk Vein|Reinforced Deepslate|Budding Amethyst|Amethyst Cluster|Pointed Dripstone|Dripstone Block|Spore Blossom|Big Dripleaf|Small Dripleaf|Azalea|Flowering Azalea|Mangrove Roots|Muddy Mangrove Roots|Moss Block|Mud|Packed Mud|Mud Bricks|Tuff|Calcite|Basalt|Polished Basalt|Smooth Basalt|Blackstone|Gilded Blackstone|Crying Obsidian|Obsidian|Ancient Debris|Nether Gold Ore|Nether Quartz Ore|Soul Sand|Soul Soil|Magma Block|Shroomlight|Warped Wart Block|Nether Wart Block|Crimson Nylium|Warped Nylium|End Stone|Purpur Block|Chorus Plant|Chorus Flower|Sea Lantern|Prismarine|Dark Prismarine|Sponge|Wet Sponge|Honey Block|Honeycomb Block|Target|Observer|Dropper|Dispenser|Hopper|Piston|Sticky Piston|Redstone Comparator|Redstone Repeater|Daylight Detector|Note Block|Jukebox|Tripwire Hook|Redstone Lamp|Lightning Rod|Copper Bulb|Decorated Pot|Suspicious Sand|Suspicious Gravel|Trial Spawner|Vault"},
 {title="마인크래프트 물약",aliases={"minecraft potion","minecraft potions","마인크래프트 물약","마크 물약"},words="Potion of Healing|Potion of Harming|Potion of Regeneration|Potion of Strength|Potion of Swiftness|Potion of Slowness|Potion of Leaping|Potion of Slow Falling|Potion of Fire Resistance|Potion of Water Breathing|Potion of Night Vision|Potion of Invisibility|Potion of Poison|Potion of Weakness|Potion of the Turtle Master|Potion of Luck|Potion of Infestation|Potion of Oozing|Potion of Weaving|Potion of Wind Charging|Awkward Potion|Mundane Potion|Thick Potion|Splash Potion of Healing|Splash Potion of Weakness|Splash Potion of Poison|Lingering Potion of Harming|Lingering Potion of Regeneration|Lingering Potion of Invisibility|Water Bottle"},
 {title="로블록스 기어",aliases={"roblox gear","roblox item","roblox items","로블록스 기어","로블록스 아이템"},words="Gravity Coil|Speed Coil|Fusion Coil|Bloxy Cola|Cheezburger|Teddy Bloxpin|Linked Sword|Classic Sword|Rocket Launcher|Slingshot|Superball|Timebomb|Trowel|Paintball Gun|Grapple Hook|Rainbow Magic Carpet|Flying Magic Carpet|Golden Super Fly Boombox|Ban Hammer|Rage Table|Epic Duck|Bloxxy Award|Red Hyperlaser Gun|Blue Hyperlaser Gun|Green Hyperlaser Gun|Dual Gravity Coil|Snowy Gravity Coil|Regeneration Coil|Sword of the Seven Winters|Darkheart|Illumina|Venomshank|Firebrand|Windforce|Ghostwalker|Icedagger"},
 {title="테라리아 아이템",aliases={"terraria item","terraria items","테라리아 아이템"},words="Magic Mirror|Ice Mirror|Cell Phone|Shellphone|Rod of Discord|Rod of Harmony|Portal Gun|Demon Conch|Magic Conch|Recall Potion|Potion of Return|Wormhole Potion|Gender Change Potion|Teleportation Potion|Obsidian Skin Potion|Water Walking Potion|Gravitation Potion|Featherfall Potion|Spelunker Potion|Hunter Potion|Dangersense Potion|Mining Potion|Fishing Potion|Sonar Potion|Crate Potion|Battle Potion|Calming Potion|Builder Potion|Summoning Potion|Bewitching Table|Crystal Ball|War Table|Ammo Box|Sharpening Station|Slice of Cake|Garden Gnome|Bast Statue|Heart Lantern|Campfire|Star in a Bottle|Life Crystal|Life Fruit|Mana Crystal|Demon Heart|Celestial Onion|Torch God's Favor|Galaxy Pearl|Gummy Worm|Ambrosia|Aegis Fruit|Arcane Crystal|Vital Crystal|Artisan Loaf|Peddler's Satchel|Golden Fishing Rod|Hotline Fishing Hook|Lavaproof Fishing Hook|Golden Bug Net|Lavaproof Bug Net|Bug Net|Guide Voodoo Doll|Clothier Voodoo Doll|Goblin Battle Standard|Slime Crown|Suspicious Looking Eye|Bloody Spine|Worm Food|Abeemination|Deer Thing|Mechanical Eye|Mechanical Worm|Mechanical Skull|Lihzahrd Power Cell|Celestial Sigil|Truffle Worm|Prismatic Lacewing|Gelatin Crystal|Naughty Present|Pumpkin Moon Medallion|Snow Globe|Solar Tablet|Treasure Map|Bloody Tear|Eternia Crystal"},
 {title="스타듀밸리 아이템",aliases={"stardew valley item","stardew item","stardew valley items","스타듀밸리 아이템","스타듀 밸리 아이템"},words="Prismatic Shard|Stardrop|Ancient Seed|Ancient Seeds|Dinosaur Egg|Golden Egg|Ostrich Egg|Void Egg|Void Mayonnaise|Dinosaur Mayonnaise|Duck Mayonnaise|Duck Feather|Rabbit's Foot|Truffle|Truffle Oil|Caviar|Aged Roe|Roe|Sweet Gem Berry|Ancient Fruit|Starfruit|Qi Fruit|Qi Bean|Magic Rock Candy|Lucky Lunch|Spicy Eel|Crab Cakes|Seafoam Pudding|Triple Shot Espresso|Ginger Ale|Banana Pudding|Mango Sticky Rice|Tom Kha Soup|Pepper Poppers|Strange Bun|Pink Cake|Chocolate Cake|Pumpkin Pie|Dish O' The Sea|Super Meal|Survival Burger|Life Elixir|Energy Tonic|Muscle Remedy|Fairy Dust|Monster Musk|Oil of Garlic|Warp Totem: Farm|Warp Totem: Mountains|Warp Totem: Beach|Warp Totem: Desert|Warp Totem: Island|Rain Totem|Treasure Chest|Golden Pumpkin|Pearl|Mermaid's Pendant|Bouquet|Wilted Bouquet|Void Ghost Pendant|Dwarvish Translation Guide|Dwarf Gadget|Dwarf Scroll I|Dwarf Scroll II|Dwarf Scroll III|Dwarf Scroll IV|Rusty Key|Skull Key|Club Card|Magnifying Glass|Dark Talisman|Magic Ink|Secret Note|Journal Scrap|Golden Walnut|Dragon Tooth|Cinder Shard|Radioactive Bar|Iridium Bar|Battery Pack|Refined Quartz|Hardwood|Oak Resin|Pine Tar|Maple Syrup|Mystic Syrup|Moss|Fiber|Golden Tag|Stardew Valley Almanac|Book of Stars"},
 {title="포켓몬 도구",aliases={"pokemon item","pokemon held item","pokemon items","포켓몬 도구","포켓몬 아이템"},words="Leftovers|Black Sludge|Shell Bell|Life Orb|Flame Orb|Toxic Orb|Choice Band|Choice Specs|Choice Scarf|Assault Vest|Focus Sash|Focus Band|Expert Belt|Muscle Band|Wise Glasses|Scope Lens|Razor Claw|Razor Fang|Quick Claw|King's Rock|Rocky Helmet|Eviolite|Eject Button|Eject Pack|Red Card|Weakness Policy|Blunder Policy|Room Service|Throat Spray|Heavy-Duty Boots|Utility Umbrella|Protective Pads|Safety Goggles|Covert Cloak|Clear Amulet|Ability Shield|Loaded Dice|Punching Glove|Booster Energy|Mirror Herb|Mental Herb|White Herb|Power Herb|Sitrus Berry|Lum Berry|Chesto Berry|Leppa Berry|Oran Berry|Micle Berry|Custap Berry|Jaboca Berry|Rowap Berry|Liechi Berry|Salac Berry|Petaya Berry|Ganlon Berry|Apicot Berry|Lansat Berry|Starf Berry|Lucky Egg|Amulet Coin|Soothe Bell|Everstone|Destiny Knot|Macho Brace|Power Bracer|Power Belt|Power Lens|Power Band|Power Anklet|Power Weight|Oval Charm|Shiny Charm|Catching Charm|Exp. Share|Exp. Candy XL|Rare Candy|Ability Capsule|Ability Patch|Bottle Cap|Gold Bottle Cap|Master Ball|Premier Ball|Luxury Ball|Heal Ball|Nest Ball|Net Ball|Dive Ball|Dusk Ball|Timer Ball|Quick Ball|Repeat Ball|Dream Ball|Beast Ball|Friend Ball|Love Ball|Moon Ball|Heavy Ball|Level Ball|Fast Ball|Lure Ball|Safari Ball|Sport Ball"},
 {title="젤다 아이템",aliases={"zelda item","legend of zelda item","zelda items","젤다 아이템","젤다의 전설 아이템"},words="Hookshot|Longshot|Clawshot|Double Clawshots|Grappling Hook|Spinner|Dominion Rod|Ball and Chain|Iron Boots|Hover Boots|Pegasus Boots|Zora Tunic|Goron Tunic|Magic Cape|Cane of Somaria|Cane of Byrna|Magic Hammer|Megaton Hammer|Skull Hammer|Deku Leaf|Gust Jar|Gust Bellows|Lens of Truth|Ocarina of Time|Fairy Ocarina|Wind Waker|Spirit Flute|Harp of Ages|Goddess's Harp|Roc's Feather|Roc's Cape|Power Bracelet|Goron Bracelet|Silver Gauntlets|Golden Gauntlets|Mole Mitts|Magnetic Gloves|Sand Rod|Fire Rod|Ice Rod|Lightning Rod|Tornado Rod|Lamp|Lantern|Bug-Catching Net|Fishing Rod|Empty Bottle|Fairy Slingshot|Fairy Bow|Hero's Bow|Boomerang|Gale Boomerang|Magical Boomerang|Bomb Bag|Bombchu|Remote Bomb|Heart Container|Piece of Heart|Big Key|Boss Key|Small Key|Triforce Piece|Rupee|Blue Rupee|Red Rupee|Purple Rupee|Silver Rupee|Gold Rupee"},
 {title="마리오 아이템",aliases={"mario item","super mario item","mario power up","마리오 아이템","슈퍼마리오 아이템"},words="Super Mushroom|Fire Flower|Super Star|Super Leaf|Tanooki Suit|Frog Suit|Hammer Suit|Cape Feather|P-Balloon|Super Carrot|Mega Mushroom|Mini Mushroom|Blue Shell|Ice Flower|Penguin Suit|Propeller Mushroom|Cloud Flower|Rock Mushroom|Bee Mushroom|Boo Mushroom|Spring Mushroom|Spin Drill|Super Bell|Super Acorn|P-Acorn|Lucky Bell|Double Cherry|Boomerang Flower|Invincibility Leaf|Super Crown|Super Hammer|Superball Flower|Elephant Fruit|Bubble Flower|Drill Mushroom|Wonder Flower|Wonder Seed|Power Moon|Power Star|Grand Star|Shine Sprite|Star Coin|Moon Medal|Cat Shine|1-Up Mushroom|3-Up Moon|Coin|Red Coin|Blue Coin|Purple Coin|Green Star|Yoshi Egg|Super Pickax|Pal Pill"},
 {title="동물의숲 도구",aliases={"animal crossing tool","animal crossing item","animal crossing tools","동물의숲 도구","동물의 숲 아이템"},words="Flimsy Fishing Rod|Fishing Rod|Colorful Fishing Rod|Fish Fishing Rod|Outdoorsy Fishing Rod|Golden Rod|Flimsy Net|Net|Colorful Net|Outdoorsy Net|Star Net|Golden Net|Flimsy Shovel|Shovel|Colorful Shovel|Outdoorsy Shovel|Printed-Design Shovel|Golden Shovel|Flimsy Axe|Stone Axe|Axe|Golden Axe|Flimsy Watering Can|Watering Can|Colorful Watering Can|Elephant Watering Can|Outdoorsy Watering Can|Golden Watering Can|Slingshot|Colorful Slingshot|Outdoorsy Slingshot|Golden Slingshot|Vaulting Pole|Ladder|Timer|Wand|Star Wand|Bamboo Wand|Cherry-Blossom Wand|Bug Wand|Fish Wand|Ice Wand|Mushroom Wand|Shell Wand|Tree-Branch Wand|Wedding Wand|Ladder Set-Up Kit"},
}
for _,row in ipairs(gameItemTopics) do extraTopics[#extraTopics+1]=row end
-- v7: additional character and food subjects; all v6 subjects are preserved.
-- Agent name reference: https://playvalorant.com/en-us/agents/
local characterAndFoodTopics = {
 {title="캐릭터 이름",aliases={"character name","fictional character","character","캐릭터 이름","캐릭터이름","캐릭터"},words="Tintin|Asterix|Obelix|Popeye|Olive Oyl|Betty Boop|Felix the Cat|Snoopy|Woodstock|Charlie Brown|Lucy van Pelt|Linus van Pelt|Peppermint Patty|Marcie|Schroeder|Pig-Pen|Franklin|Sally Brown|Calvin|Hobbes|Garfield|Odie|Jon Arbuckle|Nermal|Arlene|Heathcliff|Inspector Gadget|Penny|Brain|Danger Mouse|Penfold|Count Duckula|Barney Rubble|Fred Flintstone|Wilma Flintstone|Betty Rubble|George Jetson|Jane Jetson|Judy Jetson|Elroy Jetson"},
 {title="게임 캐릭터",aliases={"video game character","game character","게임 캐릭터","게임캐릭터"},words="Samus Aran|Fox McCloud|Falco Lombardi|Captain Falcon|Ness|Lucas|Pit|Palutena|Dark Pit|Shulk|Rex|Pyra|Mythra|Ike|Marth|Lucina|Chrom|Robin|Corrin|Byleth|Alear|Chun-Li|Cammy|Guile|Blanka|Dhalsim|E. Honda|Akuma|Juri|Rashid|Luke|Jamie|Kimberly|Manon|Marisa|Lily|JP|Ed|Terry Bogard|Mai Shiranui|Kyo Kusanagi|Iori Yagami|Rock Howard|Kazuya Mishima|Jin Kazama|Nina Williams|King|Yoshimitsu|Lili|Asuka Kazama|Lars Alexandersson|Alisa Bosconovitch|Clive Rosfield|Cloud Strife|Tifa Lockhart|Aerith Gainsborough|Barret Wallace|Yuffie Kisaragi|Vincent Valentine|Red XIII|Cait Sith|Zack Fair|Sephiroth"},
 {title="닌텐도 캐릭터",aliases={"nintendo character","닌텐도 캐릭터"},words="Samus Aran|Fox McCloud|Falco Lombardi|Slippy Toad|Peppy Hare|Krystal|Wolf O'Donnell|Captain Falcon|Pikmin|Olimar|Louie|Alph|Brittany|Charlie|Ness|Paula|Jeff Andonuts|Poo|Lucas|Kumatora|Duster|Boney|Pit|Palutena|Viridi|Medusa|Dark Pit|Shulk|Melia|Dunban|Riki|Fiora|Reyn|Elma|Rex|Nia|Tora|Poppi|Pyra|Mythra|Noah|Mio|Lanz|Sena|Eunie|Taion|Little Mac|Doc Louis|Mr. Sandman|King Hippo|Glass Joe|Bald Bull"},
 {title="마리오 캐릭터",aliases={"mario character","super mario character","마리오 캐릭터","슈퍼마리오 캐릭터"},words="Mario|Luigi|Peach|Daisy|Rosalina|Pauline|Toad|Toadette|Captain Toad|Toadsworth|Yoshi|Birdo|Wario|Waluigi|Bowser|Bowser Jr.|Kamek|Kammy Koopa|King Boo|Petey Piranha|Wart|Tatanga|Nabbit|Professor E. Gadd|King Bob-omb|Boom Boom|Pom Pom|Diddy Kong|Dixie Kong|Cranky Kong|Funky Kong|Donkey Kong|Goomba|Koopa Troopa|Shy Guy|Lakitu|Wiggler|Monty Mole|Hammer Bro|Dry Bones|Boo|Blooper|Cheep Cheep|Chain Chomp|Thwomp|Whomp|Piranha Plant|Spike|Buzzy Beetle|Spiny|Pokey|Rex|Dino Rhino|Chargin' Chuck|Fawful|Cackletta|Dimentio|Count Bleck|Vivian|Goombella|Koops|Flurrie|Admiral Bobbery|Ms. Mowz|Geno|Mallow"},
 {title="젤다 캐릭터",aliases={"zelda character","legend of zelda character","젤다 캐릭터","젤다의 전설 캐릭터"},words="Link|Zelda|Ganondorf|Ganon|Impa|Sheik|Tingle|Tetra|Midna|Fi|Ghirahim|Demise|Groose|Navi|Tatl|Tael|Skull Kid|Happy Mask Salesman|Anju|Kafei|Malon|Talon|Ingo|Saria|Darunia|Ruto|Nabooru|Rauru|Kaepora Gaebora|Beedle|Linebeck|Ravio|Hilda|Yuga|Zant|Agitha|Ilia|Colin|Malo|Talo|Rusl|Ashei|Telma|Makar|Medli|Revali|Mipha|Daruk|Urbosa|Sidon|Riju|Yunobo|Teba|Tulin|Purah|Robbie|Paya|Kass|Hestu|Rhoam|King Dorephan|Kohga|Sooga|Sonia|Mineru|Penn|Yona|Tauro|Josha"},
 {title="커비 캐릭터",aliases={"kirby character","커비 캐릭터"},words="Kirby|Meta Knight|King Dedede|Bandana Waddle Dee|Waddle Dee|Waddle Doo|Gooey|Rick|Kine|Coo|Nago|ChuChu|Pitch|Adeleine|Ribbon|Marx|Magolor|Taranza|Susie|Elfilin|Daroach|Dark Meta Knight|Galacta Knight|Morpho Knight|Chef Kawasaki|Knuckle Joe|Bonkers|Broom Hatter|Sir Kibble|Blade Knight|Sword Knight|Bugzzy|Kracko|Whispy Woods|Lololo|Lalala|Nightmare|Dark Matter|Zero|Zero Two|Drawcia|Yin-Yarn|Queen Sectonia|Haltmann|Hyness|The Three Mage-Sisters|Francisca|Flamberge|Zan Partizanne|Fecto Elfilis"},
 {title="소닉 캐릭터",aliases={"sonic character","sonic the hedgehog character","소닉 캐릭터"},words="Sonic|Tails|Knuckles|Amy Rose|Cream the Rabbit|Cheese|Big the Cat|Froggy|Shadow|Rouge|E-123 Omega|Silver|Blaze|Vector|Espio|Charmy Bee|Mighty|Ray|Fang|Bean|Bark|Trip|Sticks|Tikal|Chaos|Chao|Metal Sonic|Dr. Eggman|Eggman Nega|Sage|Infinite|Mephiles|Black Doom|Zavok|Zazz|Zomom|Zik|Zeena|Zor|Orbot|Cubot|Jet|Wave|Storm|Marine|Gemerl|Emerl|E-102 Gamma"},
 {title="동물의숲 캐릭터",aliases={"animal crossing character","동물의숲 캐릭터","동물의 숲 캐릭터"},words="Tom Nook|Isabelle|Timmy|Tommy|K.K. Slider|Blathers|Celeste|Brewster|Redd|Kicks|Sable|Mabel|Label|Leif|Saharah|Gulliver|Gullivarrr|Pascal|Wisp|Kapp'n|Tortimer|Katrina|Lottie|Lyle|Digby|Reese|Cyrus|Harriet|Orville|Wilbur|Flick|C.J.|Daisy Mae|Joan|Luna|Pave|Jack|Jingle|Zipper T. Bunny|Franklin|Rover|Dr. Shrunk|Resetti|Don Resetti|Booker|Copper|Goldie|Marina|Zucker|Octavian|Raymond|Judy|Sherb|Dom|Audie|Molly|Maple|Stitches"},
 {title="스타듀밸리 캐릭터",aliases={"stardew valley character","stardew character","스타듀밸리 캐릭터","스타듀 밸리 캐릭터"},words="Abigail|Alex|Elliott|Emily|Haley|Harvey|Leah|Maru|Penny|Sam|Sebastian|Shane|Caroline|Clint|Demetrius|Dwarf|Evelyn|George|Gus|Jas|Jodi|Kent|Krobus|Leo|Lewis|Linus|Marnie|Pam|Pierre|Robin|Sandy|Vincent|Willy|Wizard|Gunther|Marlon|Gil|Morris|Bouncer|Mr. Qi|Birdie|Professor Snail|Governor|Grandpa|Hat Mouse|Old Mariner|Traveling Merchant"},
 {title="언더테일 캐릭터",aliases={"undertale character","언더테일 캐릭터"},words="Frisk|Chara|Flowey|Toriel|Sans|Papyrus|Undyne|Alphys|Mettaton|Asgore|Asriel|Napstablook|Monster Kid|Muffet|Grillby|Temmie|Gerson|Bratty|Catty|Burgerpants|Nice Cream Guy|Snowdrake|Ice Cap|Lesser Dog|Greater Dog|Doggo|Dogamy|Dogaressa|Mad Dummy|Mad Mew Mew|Froggit|Whimsun|Moldsmal|Loox|Vegetoid|Migosp|Aaron|Woshua|Shyren|Vulkin|Tsunderplane|Pyrope|So Sorry"},
 {title="오버워치 캐릭터",aliases={"overwatch character","overwatch hero","오버워치 캐릭터","오버워치 영웅"},words="Ana|Ashe|Baptiste|Bastion|Brigitte|Cassidy|D.Va|Doomfist|Echo|Genji|Hanzo|Illari|Junker Queen|Junkrat|Kiriko|Lifeweaver|Lucio|Mauga|Mei|Mercy|Moira|Orisa|Pharah|Ramattra|Reaper|Reinhardt|Roadhog|Sigma|Sojourn|Soldier: 76|Sombra|Symmetra|Torbjorn|Tracer|Venture|Widowmaker|Winston|Wrecking Ball|Zarya|Zenyatta|Juno"},
 {title="리그 오브 레전드 챔피언",aliases={"league of legends champion","lol champion","롤 챔피언","리그 오브 레전드 챔피언"},words="Aatrox|Ahri|Akali|Akshan|Alistar|Amumu|Anivia|Annie|Aphelios|Ashe|Aurelion Sol|Azir|Bard|Bel'Veth|Blitzcrank|Braum|Briar|Camille|Cassiopeia|Cho'Gath|Corki|Darius|Diana|Dr. Mundo|Draven|Ekko|Elise|Evelynn|Ezreal|Fiddlesticks|Fiora|Fizz|Galio|Gangplank|Garen|Gnar|Gragas|Gwen|Hecarim|Hwei|Illaoi|Irelia|Ivern|Janna|Jarvan IV|Jax|Jayce|Jhin|Jinx|Kai'Sa|Kalista|Karma|Karthus|Kassadin|Katarina|Kayle|Kayn|Kennen|Kha'Zix|Kindred|Kled|Kog'Maw|K'Sante|LeBlanc|Lee Sin|Lillia|Lissandra|Lucian|Lulu|Lux|Malphite|Malzahar|Maokai|Master Yi|Milio|Miss Fortune|Mordekaiser|Morgana|Naafiri|Nami|Nasus|Nautilus|Neeko|Nidalee|Nilah|Nocturne|Nunu & Willump|Olaf|Orianna|Ornn|Pantheon|Poppy|Pyke|Qiyana|Quinn|Rakan|Rammus|Rek'Sai|Rell|Renata Glasc|Renekton|Rengar|Riven|Rumble|Ryze|Samira|Sejuani|Senna|Seraphine|Sett|Shaco|Shen|Shyvana|Singed|Sion|Sivir|Skarner|Smolder|Sona|Soraka|Swain|Sylas|Syndra|Tahm Kench|Taliyah|Talon|Taric|Teemo|Thresh|Tristana|Trundle|Tryndamere|Twisted Fate|Twitch|Udyr|Urgot|Varus|Vayne|Veigar|Vel'Koz|Vex|Vi|Viego|Viktor|Vladimir|Volibear|Warwick|Wukong|Xayah|Xerath|Xin Zhao|Yasuo|Yone|Yorick|Yuumi|Zac|Zed|Zeri|Ziggs|Zilean|Zoe|Zyra"},
 {title="발로란트 요원",aliases={"valorant agent","valorant character","발로란트 요원","발로란트 캐릭터"},words="Astra|Breach|Brimstone|Chamber|Clove|Cypher|Deadlock|Fade|Gekko|Harbor|Iso|Jett|KAY/O|Killjoy|Neon|Omen|Phoenix|Raze|Reyna|Sage|Skye|Sova|Viper|Vyse|Yoru|Tejo|Waylay"},
 {title="원신 캐릭터",aliases={"genshin impact character","genshin character","원신 캐릭터"},words="Albedo|Alhaitham|Aloy|Amber|Arataki Itto|Arlecchino|Baizhu|Barbara|Beidou|Bennett|Candace|Charlotte|Chevreuse|Chiori|Chongyun|Clorinde|Collei|Cyno|Dehya|Diluc|Diona|Dori|Eula|Faruzan|Fischl|Freminet|Furina|Gaming|Ganyu|Gorou|Hu Tao|Jean|Kaedehara Kazuha|Kaeya|Kamisato Ayaka|Kamisato Ayato|Kaveh|Keqing|Kirara|Klee|Kujou Sara|Kuki Shinobu|Layla|Lisa|Lynette|Lyney|Mika|Mona|Nahida|Navia|Neuvillette|Nilou|Ningguang|Noelle|Qiqi|Raiden Shogun|Razor|Rosaria|Sangonomiya Kokomi|Sayu|Sethos|Shenhe|Shikanoin Heizou|Sigewinne|Sucrose|Tartaglia|Thoma|Tighnari|Venti|Wanderer|Wriothesley|Xiangling|Xianyun|Xiao|Xingqiu|Xinyan|Yae Miko|Yanfei|Yaoyao|Yelan|Yoimiya|Yun Jin|Zhongli"},
 {title="붕괴 스타레일 캐릭터",aliases={"honkai star rail character","star rail character","붕괴 스타레일 캐릭터","스타레일 캐릭터"},words="Acheron|Argenti|Arlan|Asta|Aventurine|Bailu|Black Swan|Blade|Boothill|Bronya|Clara|Dan Heng|Dr. Ratio|Firefly|Fu Xuan|Gallagher|Gepard|Guinaifen|Hanya|Herta|Himeko|Hook|Huohuo|Jade|Jing Yuan|Jingliu|Kafka|Luka|Luocha|Lynx|March 7th|Misha|Natasha|Pela|Qingque|Robin|Ruan Mei|Sampo|Seele|Serval|Silver Wolf|Sparkle|Sushang|Tingyun|Topaz|Welt|Xueyi|Yanqing|Yukong"},
 {title="마블 악당",aliases={"marvel villain","마블 악당","마블 빌런"},words="Doctor Doom|Magneto|Loki|Thanos|Ultron|Kang the Conqueror|Red Skull|Baron Zemo|Arnim Zola|Taskmaster|Abomination|Leader|MODOK|Kingpin|Bullseye|Typhoid Mary|Purple Man|Green Goblin|Hobgoblin|Doctor Octopus|Electro|Vulture|Mysterio|Sandman|Lizard|Kraven the Hunter|Scorpion|Rhino|Shocker|Chameleon|Morbius|Carnage|Knull|Mister Sinister|Apocalypse|Onslaught|Sabretooth|Mystique|Toad|Pyro|Juggernaut|Sauron|Omega Red|Lady Deathstrike|Sentinel|Nimrod|Bolivar Trask|Sebastian Shaw|Cassandra Nova|Shadow King|Dormammu|Mephisto|Blackheart|Annihilus|Blastaar|Super-Skrull|Ronan the Accuser|Korvac|High Evolutionary|Mole Man|Mad Thinker|Puppet Master|Diablo|Molecule Man|Wizard"},
 {title="DC 악당",aliases={"dc villain","DC 악당","디씨 악당"},words="Joker|Harley Quinn|Poison Ivy|Riddler|Penguin|Two-Face|Scarecrow|Bane|Killer Croc|Clayface|Mr. Freeze|Man-Bat|Mad Hatter|Hugo Strange|Ra's al Ghul|Talia al Ghul|Hush|Black Mask|Victor Zsasz|Professor Pyg|Calendar Man|Killer Moth|Firefly|Ventriloquist|Scarface|Deadshot|Deathstroke|Lex Luthor|Brainiac|Doomsday|General Zod|Bizarro|Metallo|Parasite|Livewire|Toyman|Mister Mxyzptlk|Darkseid|Desaad|Granny Goodness|Kalibak|Steppenwolf|Mongul|Sinestro|Atrocitus|Larfleeze|Black Hand|Reverse-Flash|Zoom|Captain Cold|Heat Wave|Mirror Master|Weather Wizard|Captain Boomerang|Gorilla Grodd|Cheetah|Circe|Ares|Giganta|Doctor Psycho|Black Manta|Ocean Master|Trigon|Brother Blood|Felix Faust|Eclipso|Vandal Savage|Solomon Grundy"},
 {title="스폰지밥 캐릭터",aliases={"spongebob character","sponge bob character","스폰지밥 캐릭터"},words="SpongeBob SquarePants|Patrick Star|Squidward Tentacles|Eugene Krabs|Sandy Cheeks|Sheldon J. Plankton|Karen Plankton|Gary the Snail|Pearl Krabs|Mrs. Puff|Larry the Lobster|Mermaid Man|Barnacle Boy|Man Ray|Dirty Bubble|Flying Dutchman|Patchy the Pirate|Potty the Parrot|Bubble Bass|Squilliam Fancyson|King Neptune|Princess Mindy|Dennis|DoodleBob|Old Man Jenkins|Fred|Tom|Nat Peterson|Harold SquarePants|Margaret SquarePants|Grandma SquarePants|Betsy Krabs|Squilvia|Stanley SquarePants|BlackJack|Bubble Buddy"},
 {title="짱구 캐릭터",aliases={"shin chan character","crayon shin chan character","짱구 캐릭터","짱구는 못말려 캐릭터"},words="신짱구|신짱아|신형만|봉미선|흰둥이|김철수|한유리|이훈이|맹구|수지|고순희|나미리|채성아|차은주|권지옹|사토 마사오|카자마 토오루|사쿠라다 네네|보오|사쿠라다 모에코|노하라 긴노스케|노하라 츠루|오오하라 나나코|Shinnosuke Nohara|Himawari Nohara|Hiroshi Nohara|Misae Nohara|Shiro|Toru Kazama|Nene Sakurada|Masao Sato|Bo|Ai Suotome|Midori Yoshinaga|Ume Matsuzaka|Masumi Ageo|Bunta Takakura|Nanako Ohara|Action Kamen|Buriburizaemon"},
 {title="도라에몽 캐릭터",aliases={"doraemon character","도라에몽 캐릭터"},words="Doraemon|Dorami|Nobita Nobi|Shizuka Minamoto|Takeshi Goda|Suneo Honekawa|Hidetoshi Dekisugi|Tamako Nobi|Nobisuke Nobi|Sewashi|Jaiko Goda|Mii-chan|Mini-Dora|Doramed III|El Matadora|Wang Dora|Dora-the-Kid|Dora-nichov|Dora-rinho|도라에몽|도라미|노진구|신이슬|만퉁퉁|왕비실|박영민|오진숙|노석구|노장구"},
 {title="원피스 캐릭터",aliases={"one piece character","원피스 캐릭터"},words="Monkey D. Luffy|Roronoa Zoro|Nami|Usopp|Sanji|Tony Tony Chopper|Nico Robin|Franky|Brook|Jinbe|Nefertari Vivi|Portgas D. Ace|Sabo|Shanks|Benn Beckman|Yasopp|Lucky Roux|Buggy|Dracule Mihawk|Crocodile|Donquixote Doflamingo|Boa Hancock|Bartholomew Kuma|Gecko Moria|Trafalgar Law|Eustass Kid|Killer|Jewelry Bonney|Basil Hawkins|X Drake|Scratchmen Apoo|Capone Bege|Urouge|Coby|Helmeppo|Smoker|Tashigi|Monkey D. Garp|Sengoku|Tsuru|Sakazuki|Borsalino|Kuzan|Issho|Aramaki|Silvers Rayleigh|Gol D. Roger|Scopper Gaban|Edward Newgate|Marco|Jozu|Vista|Marshall D. Teach|Charlotte Linlin|Charlotte Katakuri|Charlotte Pudding|Charlotte Cracker|Kaido|Yamato|King|Queen|Jack|Kozuki Oden|Kozuki Momonosuke|Kin'emon|Kanjuro|Raizo|Denjiro|Kikunojo|Kawamatsu|Ashura Doji|Inuarashi|Nekomamushi|Carrot|Pedro|Perona|Bepo|Bartolomeo|Cavendish|Rebecca|Shirahoshi|Hody Jones|Arlong|Enel|Rob Lucci|Kaku|Kalifa|Blueno|Spandam|Iceburg|Paulie|Tom|Dr. Kureha|Dr. Hiriluk|Wapol|Dalton|Bell-mere|Genzo|Nojiko|Makino|Dadan|Laboon"},
 {title="나루토 캐릭터",aliases={"naruto character","나루토 캐릭터"},words="Naruto Uzumaki|Sasuke Uchiha|Sakura Haruno|Kakashi Hatake|Sai|Yamato|Iruka Umino|Konohamaru Sarutobi|Shikamaru Nara|Ino Yamanaka|Choji Akimichi|Asuma Sarutobi|Hinata Hyuga|Kiba Inuzuka|Shino Aburame|Kurenai Yuhi|Neji Hyuga|Rock Lee|Tenten|Might Guy|Gaara|Temari|Kankuro|Baki|Tsunade|Jiraiya|Orochimaru|Kabuto Yakushi|Shizune|Anko Mitarashi|Ibiki Morino|Genma Shiranui|Hayate Gekko|Hiruzen Sarutobi|Minato Namikaze|Kushina Uzumaki|Hashirama Senju|Tobirama Senju|Madara Uchiha|Obito Uchiha|Rin Nohara|Itachi Uchiha|Shisui Uchiha|Kisame Hoshigaki|Deidara|Sasori|Hidan|Kakuzu|Konan|Nagato|Yahiko|Zetsu|Killer B|A|Darui|C|Samui|Karui|Omoi|Mei Terumi|Ao|Chojuro|Onoki|Kurotsuchi|Akatsuchi|Hanzo|Chiyo|Ebizo|Haku|Zabuza Momochi|Kimimaro|Jugo|Karin|Suigetsu Hozuki|Mifune|Hagoromo Otsutsuki|Hamura Otsutsuki|Kaguya Otsutsuki"},
 {title="드래곤볼 캐릭터",aliases={"dragon ball character","dragonball character","드래곤볼 캐릭터"},words="Goku|Vegeta|Gohan|Goten|Trunks|Future Trunks|Piccolo|Krillin|Tien Shinhan|Chiaotzu|Yamcha|Master Roshi|Bulma|Chi-Chi|Videl|Pan|Bulla|Launch|Oolong|Puar|Yajirobe|Korin|Kami|Mr. Popo|Dende|Nail|King Kai|Supreme Kai|Elder Kai|Beerus|Whis|Champa|Vados|Grand Zeno|Grand Priest|Frieza|King Cold|Cooler|Cell|Majin Buu|Dabura|Babidi|Bibidi|Dr. Gero|Android 16|Android 17|Android 18|Android 19|Android 21|Nappa|Raditz|Bardock|Gine|King Vegeta|Broly|Paragus|Cabba|Caulifla|Kale|Kefla|Hit|Frost|Jiren|Toppo|Dyspo|Ribrianne|Bergamo|Lavender|Basil|Gowasu|Zamasu|Goku Black|Fused Zamasu|Gogeta|Vegito|Gotenks|Shenron|Porunga|Super Shenron|Pilaf|Shu|Mai|Mercenary Tao|Commander Red|General Blue|Arale Norimaki"},
 {title="귀멸의 칼날 캐릭터",aliases={"demon slayer character","kimetsu no yaiba character","귀멸의 칼날 캐릭터"},words="Tanjiro Kamado|Nezuko Kamado|Zenitsu Agatsuma|Inosuke Hashibira|Kanao Tsuyuri|Genya Shinazugawa|Giyu Tomioka|Shinobu Kocho|Kyojuro Rengoku|Tengen Uzui|Muichiro Tokito|Mitsuri Kanroji|Obanai Iguro|Sanemi Shinazugawa|Gyomei Himejima|Kanae Kocho|Sakonji Urokodaki|Jigoro Kuwajima|Shinjuro Rengoku|Senjuro Rengoku|Kagaya Ubuyashiki|Amane Ubuyashiki|Kiriya Ubuyashiki|Aoi Kanzaki|Hotaru Haganezuka|Kozo Kanamori|Kotetsu|Sabito|Makomo|Tamayo|Yushiro|Chachamaru|Muzan Kibutsuji|Kokushibo|Doma|Akaza|Hantengu|Gyokko|Gyutaro|Daki|Kaigaku|Nakime|Enmu|Rui|Yahaba|Susamaru|Kyogai"},
 {title="명탐정 코난 캐릭터",aliases={"detective conan character","case closed character","명탐정 코난 캐릭터"},words="Conan Edogawa|Shinichi Kudo|Ran Mouri|Kogoro Mouri|Ai Haibara|Shiho Miyano|Hiroshi Agasa|Ayumi Yoshida|Mitsuhiko Tsuburaya|Genta Kojima|Sonoko Suzuki|Heiji Hattori|Kazuha Toyama|Kaito Kuroba|Kaitou Kid|Aoko Nakamori|Saguru Hakuba|Gin|Vodka|Vermouth|Bourbon|Rei Furuya|Toru Amuro|Rye|Shuichi Akai|Subaru Okiya|Masumi Sera|Mary Sera|Shukichi Haneda|Yumi Miyamoto|Juzo Megure|Wataru Takagi|Miwako Sato|Ninzaburo Shiratori|Kazunobu Chiba|Naeko Miike|Eri Kisaki|Yusaku Kudo|Yukiko Kudo|James Black|Jodie Starling|Andre Camel|Rumi Wakasa|Hyoue Kuroda|Kanenori Wakita|Rum|Chianti|Korn|Kir|Hidemi Hondou|Eisuke Hondou|Makoto Kyogoku|Momiji Ooka|Muga Iori"},
 {title="한국 반찬",aliases={"korean side dish","banchan","한국 반찬","반찬 종류","반찬"},words="멸치볶음|진미채볶음|오징어채볶음|어묵볶음|우엉조림|연근조림|감자조림|알감자조림|메추리알장조림|소고기장조림|돼지고기장조림|콩자반|깻잎찜|깻잎장아찌|고추장아찌|마늘장아찌|양파장아찌|무장아찌|오이지무침|무생채|오이무침|오이소박이|미역줄기볶음|가지나물|콩나물무침|숙주나물|시금치나물|고사리나물|도라지나물|취나물|참나물무침|세발나물무침|두릅무침|달래무침|더덕무침|더덕구이|쑥갓나물|곤드레나물|비름나물|건새우볶음|쥐포볶음|마늘종볶음|호박볶음|느타리버섯볶음|새송이버섯볶음|애호박전|계란말이|계란찜|두부부침|두부조림"},
 {title="한국 국과 탕",aliases={"korean soup","korean stew soup","한국 국","국 종류","탕 종류"},words="미역국|소고기뭇국|북엇국|황태국|콩나물국|김칫국|시래깃국|아욱국|근대국|배추된장국|냉이된장국|쑥국|달걀국|어묵국|오징어뭇국|조개탕|홍합탕|백합탕|바지락탕|매생이국|굴국|재첩국|다슬기국|선짓국|우거지해장국|뼈해장국|콩나물국밥|순대국|돼지국밥|소머리국밥|설렁탕|갈비탕|곰탕|도가니탕|꼬리곰탕|삼계탕|추어탕|아귀탕|동태탕|대구탕|알탕|꽃게탕|복국|감자탕|닭곰탕|초계탕|연포탕|육개장|닭개장|버섯들깨탕"},
 {title="찌개 종류",aliases={"korean jjigae","jjigae","찌개 종류","찌개"},words="김치찌개|참치김치찌개|꽁치김치찌개|돼지고기김치찌개|된장찌개|차돌된장찌개|우렁된장찌개|해물된장찌개|청국장찌개|순두부찌개|해물순두부찌개|들깨순두부찌개|부대찌개|고추장찌개|비지찌개|동태찌개|생태찌개|두부찌개|호박찌개|감자찌개|명란찌개|애호박찌개|짜글이|돼지고기짜글이|참치찌개"},
 {title="볶음 요리",aliases={"stir fried dish","stir fry dish","볶음 요리","볶음 종류"},words="제육볶음|오징어볶음|낙지볶음|쭈꾸미볶음|닭갈비|닭발볶음|곱창볶음|막창볶음|순대볶음|두루치기|오리주물럭|소불고기|버섯불고기|고추잡채|마파두부|가지볶음|숙주볶음|공심채볶음|마늘종볶음|어묵볶음|감자채볶음|멸치볶음|진미채볶음|새우볶음|해물볶음|팟카파오|팟타이|미고렝|차우멘|팟시유"},
 {title="찜 요리",aliases={"steamed dish","braised korean dish","찜 요리","찜 종류"},words="갈비찜|매운갈비찜|돼지갈비찜|등갈비찜|찜닭|안동찜닭|닭찜|아귀찜|해물찜|대구뽈찜|가오리찜|코다리찜|명태찜|콩나물찜|오징어찜|홍합찜|조개찜|가리비찜|전복찜|대게찜|꽃게찜|랍스터찜|계란찜|두부찜|가지찜|깻잎찜|단호박찜|수육|보쌈|양배추찜"},
 {title="구이 요리",aliases={"grilled dish","grilled food","구이 요리","구이 종류"},words="삼겹살구이|목살구이|항정살구이|갈매기살구이|소갈비구이|LA갈비|떡갈비|언양불고기|너비아니|오리구이|장어구이|더덕구이|황태구이|고등어구이|삼치구이|갈치구이|조기구이|굴비구이|꽁치구이|연어구이|도미구이|임연수구이|오징어구이|새우구이|전복구이|가리비구이|조개구이|닭꼬치|양꼬치|염통꼬치|군고구마|군밤|옥수수구이"},
 {title="전과 부침개",aliases={"korean pancake","jeon","buchimgae","전 종류","부침개 종류"},words="김치전|감자전|부추전|파전|해물파전|배추전|녹두전|빈대떡|메밀전|메밀전병|수수부꾸미|호박전|애호박전|가지전|고추전|깻잎전|표고전|동태전|대구전|굴전|새우전|오징어전|낙지전|육전|두부전|동그랑땡|꼬치전|산적|화양적|섭산적|장떡|쑥전|미나리전|팽이버섯전|연근전"},
 {title="김치 종류",aliases={"kimchi type","type of kimchi","kimchi variety","김치 종류","김치"},words="배추김치|포기김치|총각김치|깍두기|동치미|나박김치|열무김치|열무물김치|백김치|갓김치|파김치|부추김치|오이소박이|오이김치|깻잎김치|보쌈김치|고들빼기김치|씀바귀김치|섞박지|겉절이|돌나물물김치|고구마줄기김치|순무김치|양배추김치|가지김치|호박김치|얼갈이김치|배추겉절이|백깍두기|깻잎물김치"},
 {title="떡 종류",aliases={"rice cake","korean rice cake","tteok","떡 종류","떡"},words="백설기|콩설기|무지개떡|단호박설기|흑임자설기|꿀떡|송편|깨송편|모시송편|감자송편|인절미|쑥인절미|찰떡|콩찰떡|약식|약밥|가래떡|절편|쑥절편|기정떡|증편|술떡|시루떡|팥시루떡|수수팥떡|수수경단|경단|깨경단|찹쌀떡|두텁떡|구름떡|찰시루떡|오메기떡|빙떡|망개떡|영양떡|개피떡|바람떡|부꾸미|호박떡"},
 {title="죽 종류",aliases={"porridge type","type of porridge","죽 종류","죽"},words="전복죽|닭죽|소고기죽|참치죽|야채죽|새우죽|게살죽|굴죽|홍합죽|낙지죽|버섯죽|표고버섯죽|잣죽|깨죽|흑임자죽|팥죽|동지팥죽|단팥죽|호박죽|단호박죽|녹두죽|콩죽|땅콩죽|들깨죽|타락죽|흰죽|쌀죽|누룽지죽|오트밀죽|율무죽|밤죽|고구마죽|감자죽"},
 {title="국수 종류",aliases={"korean noodle dish","noodle soup type","국수 종류","국수"},words="잔치국수|비빔국수|김치말이국수|콩국수|열무국수|초계국수|들기름막국수|막국수|물막국수|비빔막국수|쫄면|밀면|물밀면|비빔밀면|칼국수|바지락칼국수|들깨칼국수|장칼국수|팥칼국수|닭칼국수|해물칼국수|멸치칼국수|물냉면|비빔냉면|회냉면|평양냉면|함흥냉면|진주냉면|우동|소바|모리소바|자루소바|냉모밀|야키소바|사라우동|라멘|탄탄면|우육면|완탕면|쌀국수|분짜|분보후에|카오소이"},
 {title="라면 종류",aliases={"ramyeon","instant noodle brand","instant ramen","라면 종류","봉지라면"},words="신라면|신라면블랙|안성탕면|너구리|짜파게티|짜왕|사리곰탕면|무파마|오징어짬뽕|새우탕|튀김우동|육개장사발면|김치사발면|진라면|열라면|참깨라면|진짬뽕|진짜장|오동통면|스낵면|스파게티|쇠고기미역국라면|삼양라면|불닭볶음면|까르보불닭볶음면|짜짜로니|맛있는라면|나가사끼짬뽕|간짬뽕|팔도비빔면|틈새라면|꼬꼬면|도시락|왕뚜껑|일품해물라면|배홍동|비빔밀면|메밀비빔면|감자면|멸치칼국수|둥지냉면"},
 {title="분식 종류",aliases={"korean snack food","bunsik","분식 종류","분식"},words="떡볶이|라볶이|국물떡볶이|짜장떡볶이|카레떡볶이|로제떡볶이|크림떡볶이|기름떡볶이|궁중떡볶이|치즈떡볶이|순대|찹쌀순대|피순대|아바이순대|오징어순대|떡꼬치|소떡소떡|어묵꼬치|물떡|김밥|충무김밥|꼬마김밥|참치김밥|치즈김밥|멸치김밥|땡초김밥|돈가스김밥|계란김밥|유부초밥|주먹밥|삼각김밥|비빔만두|만두튀김|군만두|야끼만두|찐만두|찐빵|만두국|쫄면|라면|라면땅"},
 {title="튀김 종류",aliases={"fried food","deep fried food","튀김 종류","튀김"},words="김말이|오징어튀김|새우튀김|고구마튀김|단호박튀김|감자튀김|야채튀김|고추튀김|깻잎튀김|가지튀김|연근튀김|우엉튀김|표고버섯튀김|느타리버섯튀김|팽이버섯튀김|쑥튀김|두릅튀김|닭튀김|양념치킨|후라이드치킨|닭강정|간장치킨|고추치킨|닭껍질튀김|통닭|탕수육|꿔바로우|깐풍기|유린기|멘보샤|돈가스|치킨가스|생선가스|고로케|크로켓|가라아게|가키아게|덴푸라|아게다시도후|토리텐|에비카츠|치즈스틱|어니언링|해시브라운|모차렐라스틱|콘도그"},
 {title="한과 종류",aliases={"hangwa","korean traditional confectionery","한과 종류","한과"},words="약과|개성약과|매작과|유과|강정|산자|쌀강정|깨강정|들깨강정|땅콩강정|콩강정|보리강정|백자강정|흑임자강정|다식|송화다식|흑임자다식|콩다식|녹말다식|정과|유자정과|도라지정과|생강정과|연근정과|인삼정과|동아정과|박고지정과|오란다|엿|쌀엿|호박엿|땅콩엿|갱엿|엿강정|주악|개성주악|율란|조란|생란|숙실과"},
 {title="그리스 음식",aliases={"greek food","greek dish","그리스 음식"},words="Moussaka|Pastitsio|Souvlaki|Gyro|Spanakopita|Tiropita|Dolmades|Gemista|Fasolada|Fakes|Revithada|Briam|Gigantes plaki|Stifado|Kleftiko|Youvetsi|Saganaki|Kolokithokeftedes|Tomatokeftedes|Dakos|Horiatiki|Tzatziki|Taramasalata|Skordalia|Fava|Avgolemono|Baklava|Loukoumades|Galaktoboureko|Kataifi|Bougatsa|Koulouri|Tsoureki|Melomakarona|Kourabiedes"},
 {title="튀르키예 음식",aliases={"turkish food","turkish dish","튀르키예 음식","터키 음식"},words="Lahmacun|Pide|Manti|Menemen|Cilbir|Mercimek corbasi|Ezogelin corbasi|Imam bayildi|Karniyarik|Hunkar begendi|Iskender kebab|Adana kebab|Urfa kebab|Doner kebab|Sis kebab|Kofte|Icli kofte|Cig kofte|Dolma|Sarma|Kisir|Borek|Gozleme|Simit|Pogaca|Acma|Baklava|Kunefe|Lokum|Sutlac|Kazandibi|Tavuk gogsu|Revani|Asure|Tulumba|Dondurma"},
 {title="스페인 음식",aliases={"spanish food","spanish dish","스페인 음식"},words="Paella|Fideua|Gazpacho|Salmorejo|Ajoblanco|Tortilla espanola|Patatas bravas|Croquetas|Pimientos de Padron|Gambas al ajillo|Pulpo a la gallega|Calamares a la romana|Boquerones en vinagre|Albondigas|Fabada asturiana|Cocido madrileno|Callos a la madrilena|Migas|Pisto|Escalivada|Pan con tomate|Bocadillo|Montadito|Empanada gallega|Ensaimada|Churros|Porras|Torrijas|Crema catalana|Tarta de Santiago|Flan|Polvoron|Mantecados|Turron|Leche frita"},
 {title="독일 음식",aliases={"german food","german dish","독일 음식"},words="Sauerbraten|Rouladen|Schweinshaxe|Eisbein|Schnitzel|Jagerschnitzel|Currywurst|Bratwurst|Weisswurst|Bockwurst|Knackwurst|Leberkase|Labskaus|Konigsberger Klopse|Maultaschen|Spatzle|Kasespatzle|Schupfnudeln|Kartoffelpuffer|Kartoffelsalat|Sauerkraut|Rotkohl|Semmelknodel|Kartoffelknodel|Brezel|Pumpernickel|Stollen|Lebkuchen|Baumkuchen|Bienenstich|Donauwelle|Schwarzwalder Kirschtorte|Rote Grutze|Dampfnudel|Germknodel|Apfelstrudel"},
 {title="영국 음식",aliases={"british food","british dish","영국 음식"},words="Fish and chips|Shepherd's pie|Cottage pie|Steak and kidney pie|Cornish pasty|Scotch egg|Sausage roll|Bangers and mash|Toad in the hole|Bubble and squeak|Welsh rarebit|Lancashire hotpot|Beef Wellington|Sunday roast|Yorkshire pudding|Black pudding|White pudding|Haggis|Cullen skink|Cock-a-leekie|Kedgeree|Kippers|Pork pie|Stargazy pie|Eton mess|Trifle|Spotted dick|Sticky toffee pudding|Treacle tart|Bakewell tart|Eccles cake|Battenberg|Victoria sponge|Scones|Crumpet|Pikelet|Welsh cake|Bara brith|Parkin|Lardy cake"},
 {title="미국 음식",aliases={"american food","american dish","미국 음식"},words="Jambalaya|Gumbo|Etouffee|Red beans and rice|Shrimp and grits|Hoppin' John|Brunswick stew|Burgoo|Cioppino|Clam chowder|Lobster roll|Crab cake|Po' boy|Muffuletta|Reuben|Philly cheesesteak|Italian beef|French dip|Cobb salad|Waldorf salad|Buffalo wings|Nashville hot chicken|Chicken and waffles|Biscuits and gravy|Country fried steak|Meatloaf|Macaroni and cheese|Cornbread|Hushpuppy|Fried green tomatoes|Collard greens|Succotash|Frito pie|Chili con carne|Sloppy joe|Corn dog|Chicago-style hot dog|Coney Island hot dog|Deep-dish pizza|Detroit-style pizza|Key lime pie|Pecan pie|Banana pudding|Sweet potato pie|Whoopie pie"},
 {title="인도네시아 음식",aliases={"indonesian food","indonesian dish","인도네시아 음식"},words="Nasi goreng|Mie goreng|Rendang|Satay|Gado-gado|Ketoprak|Soto ayam|Soto betawi|Rawon|Bakso|Pempek|Siomay|Batagor|Martabak|Nasi uduk|Nasi kuning|Nasi padang|Nasi liwet|Gudeg|Ayam penyet|Ayam geprek|Ayam taliwang|Bebek betutu|Lawar|Pepes ikan|Ikan bakar|Sayur asem|Sayur lodeh|Tempeh|Oncom|Perkedel|Opor ayam|Lontong|Ketupat|Bubur ayam|Bubur ketan hitam|Klepon|Onde-onde|Serabi|Pisang goreng|Es campur|Es teler|Cendol"},
 {title="말레이시아 음식",aliases={"malaysian food","malaysian dish","말레이시아 음식"},words="Nasi lemak|Nasi kerabu|Nasi dagang|Nasi kandar|Nasi minyak|Nasi tomato|Roti canai|Roti telur|Murtabak|Apam balik|Char kway teow|Hokkien mee|Mee rebus|Mee goreng mamak|Mee bandung|Curry laksa|Asam laksa|Laksam|Sarawak laksa|Kolo mee|Pan mee|Yong tau foo|Chee cheong fun|Bak kut teh|Popiah|Otak-otak|Keropok lekor|Satay|Rendang|Ayam percik|Ayam masak merah|Ikan bakar|Ikan patin tempoyak|Gulai|Sambal belacan|Acar|Cendol|Ais kacang|Bubur cha cha|Pulut hitam|Kuih lapis|Kuih seri muka|Onde-onde"},
 {title="중동 음식",aliases={"middle eastern food","middle eastern dish","중동 음식"},words="Hummus|Baba ghanoush|Muhammara|Labneh|Fattoush|Tabbouleh|Kibbeh|Falafel|Shawarma|Manakish|Sfiha|Fatayer|Sambousek|Mujaddara|Maqluba|Musakhan|Mansaf|Kabsa|Mandi|Saleeg|Jareesh|Harees|Thareed|Machboos|Quzi|Masgouf|Dolma|Kofta|Shish taouk|Fatteh|Ful medames|Shakshuka|Malawach|Jachnun|Sabich|Sabzi polo|Ghormeh sabzi|Fesenjan|Tahdig|Kuku sabzi|Ash reshteh|Zereshk polo|Bastani|Faloodeh|Knafeh|Basbousa|Maamoul|Qatayef|Halva|Lokma|Umm Ali|Roz bel laban"},
 {title="간식 종류",aliases={"snack type","type of snack","snack food","간식 종류","간식"},words="붕어빵|잉어빵|국화빵|계란빵|땅콩빵|풀빵|델리만쥬|호두과자|경주빵|황남빵|찰보리빵|십원빵|술빵|찐빵|호빵|만쥬|보리빵|찹쌀도넛|꽈배기|약과도넛|와플|크로플|팬케이크|프렌치토스트|호떡|씨앗호떡|공갈빵|달고나|뻥튀기|강냉이|쌀과자|누룽지과자|군밤|군고구마|맛탕|꿀고구마|소시지빵|옥수수빵|마늘빵|러스크|파니니|브레첼|브라우니|스콘|휘낭시에|마들렌|까눌레|에그타르트|쿠키슈|소보로빵|단팥빵|크림빵|멜론빵|맘모스빵|야채빵|고로케|도넛|베이글|쿠키|마카롱"},
}
for _,row in ipairs(characterAndFoodTopics) do extraTopics[#extraTopics+1]=row end

local characterPool, gameCharacterPool, foodPool = {}, {}, {}
characterPool[#characterPool+1]=characterAndFoodTopics[1].words
characterPool[#characterPool+1]=characterAndFoodTopics[2].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[2].words
characterPool[#characterPool+1]=characterAndFoodTopics[3].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[3].words
characterPool[#characterPool+1]=characterAndFoodTopics[4].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[4].words
characterPool[#characterPool+1]=characterAndFoodTopics[5].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[5].words
characterPool[#characterPool+1]=characterAndFoodTopics[6].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[6].words
characterPool[#characterPool+1]=characterAndFoodTopics[7].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[7].words
characterPool[#characterPool+1]=characterAndFoodTopics[8].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[8].words
characterPool[#characterPool+1]=characterAndFoodTopics[9].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[9].words
characterPool[#characterPool+1]=characterAndFoodTopics[10].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[10].words
characterPool[#characterPool+1]=characterAndFoodTopics[11].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[11].words
characterPool[#characterPool+1]=characterAndFoodTopics[12].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[12].words
characterPool[#characterPool+1]=characterAndFoodTopics[13].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[13].words
characterPool[#characterPool+1]=characterAndFoodTopics[14].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[14].words
characterPool[#characterPool+1]=characterAndFoodTopics[15].words
gameCharacterPool[#gameCharacterPool+1]=characterAndFoodTopics[15].words
characterPool[#characterPool+1]=characterAndFoodTopics[16].words
characterPool[#characterPool+1]=characterAndFoodTopics[17].words
characterPool[#characterPool+1]=characterAndFoodTopics[18].words
characterPool[#characterPool+1]=characterAndFoodTopics[19].words
characterPool[#characterPool+1]=characterAndFoodTopics[20].words
characterPool[#characterPool+1]=characterAndFoodTopics[21].words
characterPool[#characterPool+1]=characterAndFoodTopics[22].words
characterPool[#characterPool+1]=characterAndFoodTopics[23].words
characterPool[#characterPool+1]=characterAndFoodTopics[24].words
characterPool[#characterPool+1]=characterAndFoodTopics[25].words
foodPool[#foodPool+1]=characterAndFoodTopics[26].words
foodPool[#foodPool+1]=characterAndFoodTopics[27].words
foodPool[#foodPool+1]=characterAndFoodTopics[28].words
foodPool[#foodPool+1]=characterAndFoodTopics[29].words
foodPool[#foodPool+1]=characterAndFoodTopics[30].words
foodPool[#foodPool+1]=characterAndFoodTopics[31].words
foodPool[#foodPool+1]=characterAndFoodTopics[32].words
foodPool[#foodPool+1]=characterAndFoodTopics[33].words
foodPool[#foodPool+1]=characterAndFoodTopics[34].words
foodPool[#foodPool+1]=characterAndFoodTopics[35].words
foodPool[#foodPool+1]=characterAndFoodTopics[36].words
foodPool[#foodPool+1]=characterAndFoodTopics[37].words
foodPool[#foodPool+1]=characterAndFoodTopics[38].words
foodPool[#foodPool+1]=characterAndFoodTopics[39].words
foodPool[#foodPool+1]=characterAndFoodTopics[40].words
foodPool[#foodPool+1]=characterAndFoodTopics[41].words
foodPool[#foodPool+1]=characterAndFoodTopics[42].words
foodPool[#foodPool+1]=characterAndFoodTopics[43].words
foodPool[#foodPool+1]=characterAndFoodTopics[44].words
foodPool[#foodPool+1]=characterAndFoodTopics[45].words
foodPool[#foodPool+1]=characterAndFoodTopics[46].words
foodPool[#foodPool+1]=characterAndFoodTopics[47].words
foodPool[#foodPool+1]=characterAndFoodTopics[48].words
foodPool[#foodPool+1]=characterAndFoodTopics[49].words
foodPool[#foodPool+1]=characterAndFoodTopics[50].words

for _,row in ipairs(extraTopics) do
 if row.title=='캐릭터 이름' then row.words=row.words..'|'..table.concat(characterPool,'|') end
 if row.title=='게임 캐릭터' then row.words=row.words..'|'..table.concat(gameCharacterPool,'|') end
 if row.title=='음식' then
  row.words=row.words..'|'..table.concat(foodPool,'|')
  row.aliases[#row.aliases+1]='음식 종류'
  row.aliases[#row.aliases+1]='음식종류'
  row.aliases[#row.aliases+1]='type of food'
  row.aliases[#row.aliases+1]='food type'
 end
end
-- Estimated recommendation order only; no live game acceptance or rarity scores.
-- Avengers reference: https://www.marvel.com/teams-and-groups/avengers/in-comics
-- Historical roster: https://en.wikipedia.org/wiki/List_of_Avengers_members
local teamTopics={
 {title='어벤져스 멤버',aliases={'avenger','avengers','avengers member','member of the avengers','어벤져스','어벤저스','어벤져스 멤버','어벤저스 멤버'},words='Silverclaw|Triathlon|Living Lightning|Stingray|D-Man|Jack of Hearts|Sersi|Gilgamesh|Firebird|Justice|Firestar|Lionheart|Jocasta|Tigra|Mockingbird|Wonder Man|Black Knight|Moondragon|Mantis|Hellcat|Quasar|Swordsman|Starfox|Machine Man|Demolition Man|US Agent|Darkhawk|Sentry|Echo|Ronin|Jessica Jones|Luke Cage|Iron Fist|Spider-Woman|Spider-Man|Wolverine|Beast|She-Hulk|Hercules|Black Panther|Captain Marvel|Monica Rambeau|War Machine|Falcon|Winter Soldier|Shang-Chi|Doctor Strange|Blade|Ghost Rider|Ant-Man|Wasp|Hawkeye|Black Widow|Vision|Scarlet Witch|Quicksilver|Iron Man|Captain America|Thor|Hulk'},
 {title='영화 어벤져스 멤버',aliases={'mcu avengers','movie avengers','avengers movie member','영화 어벤져스','MCU 어벤져스','영화 어벤저스'},words='Quicksilver|War Machine|Falcon|Vision|Scarlet Witch|Ant-Man|Spider-Man|Captain Marvel|Rocket|Nebula|Iron Man|Captain America|Thor|Hulk|Black Widow|Hawkeye'},
 {title='가디언즈 오브 갤럭시 멤버',aliases={'guardians of the galaxy member','guardians of the galaxy','가디언즈 오브 갤럭시 멤버','가오갤 멤버','가디언즈 멤버'},words='Phyla-Vell|Moondragon|Major Victory|Martinex|Charlie-27|Nikki|Starhawk|Aleta Ogord|Vance Astro|Bug|Adam Warlock|Cosmo|Mantis|Kraglin|Yondu|Nova|Kitty Pryde|Agent Venom|Angela|Star-Lord|Gamora|Drax|Rocket Raccoon|Groot'},
 {title='엑스맨 멤버',aliases={'x-men member','x men member','x-men','엑스맨 멤버','엑스맨'},words='Thunderbird|Sunfire|Banshee|Longshot|Dazzler|Forge|Polaris|Havok|Psylocke|Bishop|Cecilia Reyes|Maggott|Marrow|Sage|Lifeguard|Slipstream|Stacy X|Frenzy|Northstar|Warpath|Husk|Chamber|Cannonball|Sunspot|Karma|Mirage|Wolfsbane|Magik|Colossus|Nightcrawler|Angel|Beast|Iceman|Jean Grey|Cyclops|Storm|Wolverine|Rogue|Gambit|Jubilee|Kitty Pryde'},
 {title='판타스틱 포 멤버',aliases={'fantastic four member','fantastic four','판타스틱 포 멤버','판타스틱포 멤버','판타스틱 포','판타스틱포'},words='She-Hulk|Crystal|Medusa|Luke Cage|She-Thing|Ms. Thing|Ant-Man|Black Panther|Storm|Spider-Man|Mister Fantastic|Invisible Woman|Human Torch|Thing'},
 {title='저스티스 리그 멤버',aliases={'justice league member','justice league','저스티스 리그 멤버','저스티스리그 멤버','저스티스 리그'},words='Doctor Light|Gypsy|Vibe|Vixen|Commander Steel|Elongated Man|Red Tornado|Firestorm|Zatanna|Black Canary|Hawkgirl|Hawkman|Atom|Metamorpho|Plastic Man|Captain Atom|Rocket Red|Fire|Ice|Booster Gold|Blue Beetle|Mister Miracle|Big Barda|Huntress|Black Lightning|Steel|Red Arrow|Supergirl|Power Girl|Shazam|Mera|Cyborg|Martian Manhunter|Green Arrow|Green Lantern|Flash|Aquaman|Wonder Woman|Batman|Superman'},
 {title='틴 타이탄 멤버',aliases={'teen titans member','teen titans','titans member','틴 타이탄 멤버','틴타이탄 멤버','틴 타이탄'},words='Lilith Clay|Gnarrk|Mal Duncan|Bumblebee|Duela Dent|Jericho|Kole|Pantha|Red Star|Argent|Risk|Prysm|Hot Spot|Ravager|Miss Martian|Blue Beetle|Static|Kid Devil|Wonder Girl|Donna Troy|Aqualad|Tempest|Speedy|Arsenal|Kid Flash|Wally West|Bart Allen|Superboy|Robin|Nightwing|Starfire|Raven|Beast Boy|Cyborg'},
}
for _,row in ipairs(teamTopics) do extraTopics[#extraTopics+1]=row end

-- v12 brand examples; game acceptance and rarity are not verified.
-- Reference examples: https://novesta.co.kr/ https://www.moosetoys.com/
local brandTopics={
 {title="신발 브랜드",aliases={"shoe brand","footwear brand","sneaker brand","신발 브랜드","신발브랜드","운동화 브랜드","운동화브랜드"},words="Novesta|Spring Court|Walsh|Feiyue|Gola|Etonic|Spalwart|Stepney Workers Club|Karhu|Kangaroos|PF Flyers|Pro-Keds|Pony|K-Swiss|Diadora|Lotto|Le Coq Sportif|Hummel|Umbro|Mizuno|Saucony|Brooks|Altra|Topo Athletic|Newton Running|Inov-8|La Sportiva|Scarpa|Lowa|Hanwag|Meindl|Zamberlan|Aku|Danner|Wolverine|Thorogood|Chippewa|Red Wing|Blundstone|R.M. Williams|Dr. Martens|Solovair|Grenson|Tricker's|Loake|Barker|Cheaney|Crockett & Jones|Church's|Alden|Allen Edmonds|John Lobb|Edward Green|Paraboot|Kleman|Camper|Pikolinos|Clarks|Ecco|Geox|Mephisto|Gabor|Ara|Rieker|Tamaris|Superga|Victoria|Cienta|Tretorn|Toms|Veja|Cariuma|Allbirds|Axel Arigato|Autry|D.A.T.E.|On|Hoka|Salomon|Merrell|Keen|Teva|Chaco|Birkenstock|FitFlop|Oofos|Dansko|Sanita|Vionic|Naturalizer|Rockport|Sperry|Sebago|Timberland|Kickers|Fila|Reebok|Asics|New Balance|Converse|Vans|Skechers|Crocs|Nike|Adidas|Puma|Jordan|Under Armour|Prospecs|Lecaf|Shoopen|Sappun|슈펜|사뿐|프로스펙스|르까프|엘칸토|금강제화|소다|탠디|미소페|세라|랜드로바"},
 {title="장난감 브랜드",aliases={"toy brand","toy manufacturer","toys brand","장난감 브랜드","장난감브랜드","완구 브랜드","완구브랜드"},words="Bullyland|CollectA|Safari Ltd|Papo|Schleich|SIKU|Bruder|Fischertechnik|Quercetti|Geomag|LaQ|Plus-Plus|Magformers|Magna-Tiles|Connetix|SmartMax|SmartGames|Grimm's|Grapat|Ostheimer|Holztiger|Goki|Hape|HABA|Janod|Djeco|Vilac|Moulin Roty|Kaloo|Lilliputiens|Tender Leaf Toys|Le Toy Van|Bigjigs|Tidlo|Small Foot|PlanToys|Wonderworld|Tegu|Bajo|Brio|Micki|Lundby|Dantoy|Viking Toys|Green Toys|Fat Brain Toys|Learning Resources|Educational Insights|Learning Journey|Peaceable Kingdom|eeBoo|Orchard Toys|Galt|Ambi Toys|Battat|B. toys|Manhattan Toy|Melissa & Doug|Little Tikes|Step2|Radio Flyer|Rolly Toys|Smoby|Falk|Feber|Wader|Polesie|Playmobil|Ravensburger|Goliath|Moose Toys|Spin Master|MGA Entertainment|Jakks Pacific|Basic Fun!|PlayMonster|WowWee|Silverlit|Zuru|VTech|LeapFrog|Fisher-Price|Little People|Mega Bloks|Mega Construx|K'Nex|Lincoln Logs|Tinkertoy|Erector|Meccano|LEGO|Duplo|Hasbro|Mattel|Bandai|Takara Tomy|Epoch|Sylvanian Families|Calico Critters|L.O.L. Surprise!|Rainbow High|Bratz|Barbie|Hot Wheels|Matchbox|Polly Pocket|American Girl|Thomas & Friends|Nerf|Play-Doh|Tonka|Transformers|Beyblade|Tomica|Plarail|Anpanman|Sanrio|Jellycat|Steiff|Gund|Aurora|Ty|Build-A-Bear|Squishmallows|Squishables|Pokemon|Academy|Oxford|Young Toys|Sonokong|Mimiworld|Happyland|Blue Rabbit|Toytron|Daeho Toys|아이코닉스|영실업|손오공|미미월드|아카데미과학|옥스포드|토이트론|대호토이즈|코니스|야야|지나월드|아이존|한립토이스|바니랜드|씽크토이|레고|플레이모빌|반다이|타카라토미|실바니안패밀리"},
 {title="브랜드 이름",aliases={"brand name","brand","브랜드 이름","브랜드이름","브랜드"},words="Novesta|Spring Court|Walsh|Feiyue|Gola|Etonic|Spalwart|Stepney Workers Club|Karhu|Kangaroos|PF Flyers|Pro-Keds|Pony|K-Swiss|Diadora|Lotto|Le Coq Sportif|Hummel|Umbro|Mizuno|Saucony|Brooks|Altra|Topo Athletic|Newton Running|Inov-8|La Sportiva|Scarpa|Lowa|Hanwag|Meindl|Zamberlan|Aku|Danner|Wolverine|Thorogood|Chippewa|Red Wing|Blundstone|R.M. Williams|Dr. Martens|Solovair|Grenson|Tricker's|Loake|Barker|Cheaney|Crockett & Jones|Church's|Alden|Allen Edmonds|John Lobb|Edward Green|Paraboot|Kleman|Camper|Pikolinos|Clarks|Ecco|Geox|Mephisto|Gabor|Ara|Rieker|Tamaris|Superga|Victoria|Cienta|Tretorn|Toms|Veja|Cariuma|Allbirds|Axel Arigato|Autry|D.A.T.E.|On|Hoka|Salomon|Merrell|Keen|Teva|Chaco|Birkenstock|FitFlop|Oofos|Dansko|Sanita|Vionic|Naturalizer|Rockport|Sperry|Sebago|Timberland|Kickers|Fila|Reebok|Asics|New Balance|Converse|Vans|Skechers|Crocs|Nike|Adidas|Puma|Jordan|Under Armour|Prospecs|Lecaf|Shoopen|Sappun|슈펜|사뿐|프로스펙스|르까프|엘칸토|금강제화|소다|탠디|미소페|세라|랜드로바|Givova|Errea|Joma|Kelme|Macron|Lotto|Le Coq Sportif|Sergio Tacchini|Ellesse|Kappa|Hummel|Diadora|Castore|Craft|Odlo|Uhlsport|Jako|Patrick|Saller|Stanno|Masita|Acerbis|Zeus Sport|Luanvi|Roly|Rukka|Karhu|Umbro|Canterbury|Gilbert|Kukri|BLK|Kooga|O'Neills|Harrow|Mizuno|Asics|Saucony|Brooks|New Balance|Fila|Reebok|Puma|Nike|Adidas|Under Armour|Champion|Russell Athletic|Spalding|Wilson|Yonex|Victor|Li-Ning|Anta|Xtep|361 Degrees|Peak|Erke|Qiaodan|K-Swiss|Head|Babolat|Dunlop|Tecnifibre|Lacoste|Lululemon|Alo Yoga|Vuori|Gymshark|Fabletics|Rhone|2XU|Skins|Prospecs|Lecaf|EXR|Descente|Arena|Speedo|TYR|MP Michael Phelps|Funky Trunks|Funkita|프로스펙스|르까프|데상트|르꼬끄스포르티브|다이나핏|엄브로|카파|휠라|아레나|스피도|요넥스|리닝|안타|Bullyland|CollectA|Safari Ltd|Papo|Schleich|SIKU|Bruder|Fischertechnik|Quercetti|Geomag|LaQ|Plus-Plus|Magformers|Magna-Tiles|Connetix|SmartMax|SmartGames|Grimm's|Grapat|Ostheimer|Holztiger|Goki|Hape|HABA|Janod|Djeco|Vilac|Moulin Roty|Kaloo|Lilliputiens|Tender Leaf Toys|Le Toy Van|Bigjigs|Tidlo|Small Foot|PlanToys|Wonderworld|Tegu|Bajo|Brio|Micki|Lundby|Dantoy|Viking Toys|Green Toys|Fat Brain Toys|Learning Resources|Educational Insights|Learning Journey|Peaceable Kingdom|eeBoo|Orchard Toys|Galt|Ambi Toys|Battat|B. toys|Manhattan Toy|Melissa & Doug|Little Tikes|Step2|Radio Flyer|Rolly Toys|Smoby|Falk|Feber|Wader|Polesie|Playmobil|Ravensburger|Goliath|Moose Toys|Spin Master|MGA Entertainment|Jakks Pacific|Basic Fun!|PlayMonster|WowWee|Silverlit|Zuru|VTech|LeapFrog|Fisher-Price|Little People|Mega Bloks|Mega Construx|K'Nex|Lincoln Logs|Tinkertoy|Erector|Meccano|LEGO|Duplo|Hasbro|Mattel|Bandai|Takara Tomy|Epoch|Sylvanian Families|Calico Critters|L.O.L. Surprise!|Rainbow High|Bratz|Barbie|Hot Wheels|Matchbox|Polly Pocket|American Girl|Thomas & Friends|Nerf|Play-Doh|Tonka|Transformers|Beyblade|Tomica|Plarail|Anpanman|Sanrio|Jellycat|Steiff|Gund|Aurora|Ty|Build-A-Bear|Squishmallows|Squishables|Pokemon|Academy|Oxford|Young Toys|Sonokong|Mimiworld|Happyland|Blue Rabbit|Toytron|Daeho Toys|아이코닉스|영실업|손오공|미미월드|아카데미과학|옥스포드|토이트론|대호토이즈|코니스|야야|지나월드|아이존|한립토이스|바니랜드|씽크토이|레고|플레이모빌|반다이|타카라토미|실바니안패밀리|Apple|Samsung|Sony|Nintendo|Microsoft|Google|LG|Panasonic|Canon|Nikon|Fujifilm|Olympus|Leica|Pentax|Ricoh|Casio|Seiko|Citizen|Orient|Swatch|Tissot|Longines|Omega|Rolex|Timex|Fossil|Garmin|Suunto|Polar|Bose|JBL|Sennheiser|Audio-Technica|Shure|AKG|Beyerdynamic|Bang & Olufsen|Marshall|Yamaha|Roland|Korg|Fender|Gibson|Ibanez|Cort|Pearl|Tama|Zildjian|Sabian|Paiste|D'Addario|Ernie Ball|Nivea|Dove|Vaseline|Olay|L'Oreal|Maybelline|Revlon|Clinique|Lancome|Shiseido|Kose|SK-II|Sulwhasoo|Laneige|Innisfree|Etude|The Face Shop|TonyMoly|Missha|Nature Republic|COSRX|Anua|Torriden|Round Lab"},
}
for _,row in ipairs(brandTopics) do extraTopics[#extraTopics+1]=row end
local sportswearAnswers="Givova|Errea|Joma|Kelme|Macron|Lotto|Le Coq Sportif|Sergio Tacchini|Ellesse|Kappa|Hummel|Diadora|Castore|Craft|Odlo|Uhlsport|Jako|Patrick|Saller|Stanno|Masita|Acerbis|Zeus Sport|Luanvi|Roly|Rukka|Karhu|Umbro|Canterbury|Gilbert|Kukri|BLK|Kooga|O'Neills|Harrow|Mizuno|Asics|Saucony|Brooks|New Balance|Fila|Reebok|Puma|Nike|Adidas|Under Armour|Champion|Russell Athletic|Spalding|Wilson|Yonex|Victor|Li-Ning|Anta|Xtep|361 Degrees|Peak|Erke|Qiaodan|K-Swiss|Head|Babolat|Dunlop|Tecnifibre|Lacoste|Lululemon|Alo Yoga|Vuori|Gymshark|Fabletics|Rhone|2XU|Skins|Prospecs|Lecaf|EXR|Descente|Arena|Speedo|TYR|MP Michael Phelps|Funky Trunks|Funkita|프로스펙스|르까프|데상트|르꼬끄스포르티브|다이나핏|엄브로|카파|휠라|아레나|스피도|요넥스|리닝|안타"
for _,row in ipairs(extraTopics) do
 if row.title=='스포츠 브랜드' then
  row.words=row.words..'|'..sportswearAnswers
  for _,alias in ipairs({'sportswear brand','sportswear','athletic wear brand','activewear brand','스포츠웨어 브랜드','스포츠웨어브랜드','스포츠웨어','스포츠 의류 브랜드','운동복 브랜드'}) do row.aliases[#row.aliases+1]=alias end
 end
end

-- v13 expanded topics. Names are answer examples, not verified game acceptance.
-- References: michaeljackson.com/albums/ ; nintendo.com/en-gb/Games/ ; ebs.co.kr
local expanded550={
 {title="닌텐도 게임 이름",aliases={"nintendo game","nintendo title","닌텐도 게임","닌텐도게임","닌텐도"},words="Ever Oasis|Code Name: S.T.E.A.M.|Captain Rainbow|Doshin the Giant|Soma Bringer|The Last Story|Pandora's Tower|Chibi-Robo!|Custom Robo|Custom Robo Arena|Geist|Eternal Darkness: Sanity's Requiem|Cubivore: Survival of the Fittest|Odama|GiFTPiA|Disaster: Day of Crisis|The Mysterious Murasame Castle|StarTropics|The Legendary Starfy|Drill Dozer|Rhythm Heaven|Elite Beat Agents|Electroplankton|Hotel Dusk: Room 215|Last Window: The Secret of Cape West|Another Code: Two Memories|Another Code: Recollection|Endless Ocean|Endless Ocean: Blue World|Endless Ocean Luminous|Steel Diver|Steel Diver: Sub Wars|Tank Troopers|HarmoKnight|Pushmo|Crashmo|Stretchmo|BOXBOY!|BOXBOXBOY!|BYE-BYE BOXBOY!|BOXBOY! + BOXGIRL!|Part Time UFO|Snipperclips|ARMS|1-2-Switch|Ring Fit Adventure|Nintendo Land|Wii Sports|Wii Sports Resort|Wii Fit|Wii Music|Wii Party|Tomodachi Life|Miitopia|Nintendogs|Brain Age|Big Brain Academy|Clubhouse Games|Sushi Striker: The Way of Sushido|Astral Chain|Kid Icarus|Kid Icarus: Uprising|EarthBound|Mother 3|Golden Sun|Golden Sun: The Lost Age|Golden Sun: Dark Dawn|Advance Wars|Advance Wars 2: Black Hole Rising|Advance Wars: Dual Strike|Advance Wars: Days of Ruin|Sin and Punishment|Sin and Punishment: Star Successor|Excitebike|Excite Truck|Excitebots: Trick Racing|Wave Race 64|1080 Snowboarding|Pilotwings|Pilotwings 64|Pilotwings Resort|FlingSmash|Wario World|Super Mario Bros.|Super Mario Bros. 2|Super Mario Bros. 3|Super Mario World|Super Mario Land|Super Mario Land 2: 6 Golden Coins|Super Mario 64|Super Mario Sunshine|Super Mario Galaxy|Super Mario Galaxy 2|Super Mario 3D Land|Super Mario 3D World|Super Mario Odyssey|Super Mario Bros. Wonder|New Super Mario Bros.|New Super Mario Bros. Wii|New Super Mario Bros. 2|New Super Mario Bros. U|Super Mario Maker|Super Mario Maker 2|Mario Kart 8 Deluxe|Mario Kart DS|Mario Kart Wii|Super Mario RPG|Mario & Luigi: Superstar Saga|Mario & Luigi: Partners in Time|Mario & Luigi: Bowser's Inside Story|Mario & Luigi: Dream Team|Mario & Luigi: Brothership|The Legend of Zelda|Zelda II: The Adventure of Link|The Legend of Zelda: A Link to the Past|The Legend of Zelda: Link's Awakening|The Legend of Zelda: Ocarina of Time|The Legend of Zelda: Majora's Mask|The Legend of Zelda: Oracle of Ages|The Legend of Zelda: Oracle of Seasons|The Legend of Zelda: The Wind Waker|The Legend of Zelda: Four Swords Adventures|The Legend of Zelda: The Minish Cap|The Legend of Zelda: Twilight Princess|The Legend of Zelda: Phantom Hourglass|The Legend of Zelda: Spirit Tracks|The Legend of Zelda: Skyward Sword|The Legend of Zelda: A Link Between Worlds|The Legend of Zelda: Tri Force Heroes|The Legend of Zelda: Breath of the Wild|The Legend of Zelda: Tears of the Kingdom|The Legend of Zelda: Echoes of Wisdom|Pokemon Red|Pokemon Blue|Pokemon Yellow|Pokemon Gold|Pokemon Silver|Pokemon Crystal|Pokemon Ruby|Pokemon Sapphire|Pokemon Emerald|Pokemon FireRed|Pokemon LeafGreen|Pokemon Diamond|Pokemon Pearl|Pokemon Platinum|Pokemon HeartGold|Pokemon SoulSilver|Pokemon Black|Pokemon White|Pokemon Black 2|Pokemon White 2|Pokemon X|Pokemon Y|Pokemon Omega Ruby|Pokemon Alpha Sapphire|Pokemon Sun|Pokemon Moon|Pokemon Ultra Sun|Pokemon Ultra Moon|Pokemon Sword|Pokemon Shield|Pokemon Scarlet|Pokemon Violet|Pokemon Legends: Arceus|Pokemon Snap|New Pokemon Snap|Pokemon Colosseum|Pokemon XD: Gale of Darkness|Pokemon Ranger|Pokemon Conquest|Pokemon Mystery Dungeon: Explorers of Sky|Kirby's Dream Land|Kirby's Adventure|Kirby's Dream Land 2|Kirby Super Star|Kirby's Dream Land 3|Kirby 64: The Crystal Shards|Kirby & the Amazing Mirror|Kirby: Canvas Curse|Kirby: Squeak Squad|Kirby's Epic Yarn|Kirby's Return to Dream Land|Kirby: Triple Deluxe|Kirby: Planet Robobot|Kirby Star Allies|Kirby and the Forgotten Land|Kirby Air Ride|Kirby's Dream Course|Kirby's Pinball Land|Kirby Mass Attack|Kirby Fighters 2|Donkey Kong|Donkey Kong Jr.|Donkey Kong 3|Donkey Kong Country|Donkey Kong Country 2: Diddy's Kong Quest|Donkey Kong Country 3: Dixie Kong's Double Trouble!|Donkey Kong 64|Donkey Kong Jungle Beat|Donkey Kong Country Returns|Donkey Kong Country: Tropical Freeze|Donkey Kong Jungle Climber|DK: King of Swing|Donkey Konga|Metroid|Metroid II: Return of Samus|Super Metroid|Metroid Fusion|Metroid: Zero Mission|Metroid: Samus Returns|Metroid Dread|Metroid Prime|Metroid Prime 2: Echoes|Metroid Prime 3: Corruption|Metroid Prime Hunters|Metroid Prime Pinball|Metroid: Other M|Metroid Prime: Federation Force|Metroid Prime Remastered|Fire Emblem: Shadow Dragon|Fire Emblem: Mystery of the Emblem|Fire Emblem: Genealogy of the Holy War|Fire Emblem: Thracia 776|Fire Emblem: The Binding Blade|Fire Emblem: The Blazing Blade|Fire Emblem: The Sacred Stones|Fire Emblem: Path of Radiance|Fire Emblem: Radiant Dawn|Fire Emblem Awakening|Fire Emblem Fates|Fire Emblem Echoes: Shadows of Valentia|Fire Emblem: Three Houses|Fire Emblem Engage|Fire Emblem Warriors|Animal Crossing|Animal Crossing: Wild World|Animal Crossing: City Folk|Animal Crossing: New Leaf|Animal Crossing: New Horizons|Animal Crossing: Happy Home Designer|Animal Crossing: Amiibo Festival|Animal Crossing: Pocket Camp|Pikmin|Pikmin 2|Pikmin 3|Pikmin 3 Deluxe|Pikmin 4|Hey! Pikmin|Pikmin Bloom|Splatoon|Splatoon 2|Splatoon 3|Splatoon 2: Octo Expansion|Splatoon 3: Side Order|Paper Mario|Paper Mario: The Thousand-Year Door|Super Paper Mario|Paper Mario: Sticker Star|Paper Mario: Color Splash|Paper Mario: The Origami King|Wario Land: Super Mario Land 3|Virtual Boy Wario Land|Wario Land II|Wario Land 3|Wario Land 4|Wario Land: Shake It!|Wario World|Wario: Master of Disguise|WarioWare, Inc.: Mega Microgames!|WarioWare: Twisted!|WarioWare: Touched!|WarioWare: Smooth Moves|WarioWare: D.I.Y.|Game & Wario|WarioWare Gold|WarioWare: Get It Together!|WarioWare: Move It!|Star Fox|Star Fox 2|Star Fox 64|Star Fox Adventures|Star Fox: Assault|Star Fox Command|Star Fox 64 3D|Star Fox Zero|Star Fox Guard|Xenoblade Chronicles|Xenoblade Chronicles X|Xenoblade Chronicles 2|Xenoblade Chronicles 2: Torna - The Golden Country|Xenoblade Chronicles: Definitive Edition|Xenoblade Chronicles 3|Xenoblade Chronicles 3: Future Redeemed"},
 {title="닌텐도 게임기",aliases={"nintendo console","nintendo system","닌텐도 게임기"},words="Color TV-Game|Game & Watch|Famicom|Nintendo Entertainment System|Super Famicom|Super Nintendo Entertainment System|Nintendo 64|GameCube|Wii|Wii U|Nintendo Switch|Game Boy|Game Boy Color|Game Boy Advance|Nintendo DS|Nintendo DSi|Nintendo 3DS|Nintendo 2DS|Virtual Boy"},
 {title="마리오 게임",aliases={"mario game","super mario game","마리오 게임"},words="Super Mario Bros.|Super Mario Bros. 2|Super Mario Bros. 3|Super Mario World|Super Mario Land|Super Mario Land 2: 6 Golden Coins|Super Mario 64|Super Mario Sunshine|Super Mario Galaxy|Super Mario Galaxy 2|Super Mario 3D Land|Super Mario 3D World|Super Mario Odyssey|Super Mario Bros. Wonder|New Super Mario Bros.|New Super Mario Bros. Wii|New Super Mario Bros. 2|New Super Mario Bros. U|Super Mario Maker|Super Mario Maker 2|Mario Kart 8 Deluxe|Mario Kart DS|Mario Kart Wii|Super Mario RPG|Mario & Luigi: Superstar Saga|Mario & Luigi: Partners in Time|Mario & Luigi: Bowser's Inside Story|Mario & Luigi: Dream Team|Mario & Luigi: Brothership"},
 {title="젤다 게임",aliases={"zelda game","legend of zelda game","젤다 게임"},words="The Legend of Zelda|Zelda II: The Adventure of Link|The Legend of Zelda: A Link to the Past|The Legend of Zelda: Link's Awakening|The Legend of Zelda: Ocarina of Time|The Legend of Zelda: Majora's Mask|The Legend of Zelda: Oracle of Ages|The Legend of Zelda: Oracle of Seasons|The Legend of Zelda: The Wind Waker|The Legend of Zelda: Four Swords Adventures|The Legend of Zelda: The Minish Cap|The Legend of Zelda: Twilight Princess|The Legend of Zelda: Phantom Hourglass|The Legend of Zelda: Spirit Tracks|The Legend of Zelda: Skyward Sword|The Legend of Zelda: A Link Between Worlds|The Legend of Zelda: Tri Force Heroes|The Legend of Zelda: Breath of the Wild|The Legend of Zelda: Tears of the Kingdom|The Legend of Zelda: Echoes of Wisdom"},
 {title="포켓몬 게임",aliases={"pokemon game","pokémon game","포켓몬 게임"},words="Pokemon Red|Pokemon Blue|Pokemon Yellow|Pokemon Gold|Pokemon Silver|Pokemon Crystal|Pokemon Ruby|Pokemon Sapphire|Pokemon Emerald|Pokemon FireRed|Pokemon LeafGreen|Pokemon Diamond|Pokemon Pearl|Pokemon Platinum|Pokemon HeartGold|Pokemon SoulSilver|Pokemon Black|Pokemon White|Pokemon Black 2|Pokemon White 2|Pokemon X|Pokemon Y|Pokemon Omega Ruby|Pokemon Alpha Sapphire|Pokemon Sun|Pokemon Moon|Pokemon Ultra Sun|Pokemon Ultra Moon|Pokemon Sword|Pokemon Shield|Pokemon Scarlet|Pokemon Violet|Pokemon Legends: Arceus|Pokemon Snap|New Pokemon Snap|Pokemon Colosseum|Pokemon XD: Gale of Darkness|Pokemon Ranger|Pokemon Conquest|Pokemon Mystery Dungeon: Explorers of Sky"},
 {title="커비 게임",aliases={"kirby game","커비 게임"},words="Kirby's Dream Land|Kirby's Adventure|Kirby's Dream Land 2|Kirby Super Star|Kirby's Dream Land 3|Kirby 64: The Crystal Shards|Kirby & the Amazing Mirror|Kirby: Canvas Curse|Kirby: Squeak Squad|Kirby's Epic Yarn|Kirby's Return to Dream Land|Kirby: Triple Deluxe|Kirby: Planet Robobot|Kirby Star Allies|Kirby and the Forgotten Land|Kirby Air Ride|Kirby's Dream Course|Kirby's Pinball Land|Kirby Mass Attack|Kirby Fighters 2"},
 {title="소닉 게임",aliases={"sonic game","소닉 게임"},words="Sonic the Hedgehog|Sonic the Hedgehog 2|Sonic CD|Sonic 3 & Knuckles|Sonic Adventure|Sonic Adventure 2|Sonic Heroes|Sonic Advance|Sonic Rush|Sonic Rush Adventure|Sonic Colors|Sonic Generations|Sonic Lost World|Sonic Mania|Sonic Forces|Sonic Frontiers|Sonic Superstars|Sonic and the Secret Rings|Sonic and the Black Knight"},
 {title="동키콩 게임",aliases={"donkey kong game","동키콩 게임"},words="Donkey Kong|Donkey Kong Jr.|Donkey Kong 3|Donkey Kong Country|Donkey Kong Country 2: Diddy's Kong Quest|Donkey Kong Country 3: Dixie Kong's Double Trouble!|Donkey Kong 64|Donkey Kong Jungle Beat|Donkey Kong Country Returns|Donkey Kong Country: Tropical Freeze|Donkey Kong Jungle Climber|DK: King of Swing|Donkey Konga"},
 {title="메트로이드 게임",aliases={"metroid game","메트로이드 게임"},words="Metroid|Metroid II: Return of Samus|Super Metroid|Metroid Fusion|Metroid: Zero Mission|Metroid: Samus Returns|Metroid Dread|Metroid Prime|Metroid Prime 2: Echoes|Metroid Prime 3: Corruption|Metroid Prime Hunters|Metroid Prime Pinball|Metroid: Other M|Metroid Prime: Federation Force|Metroid Prime Remastered"},
 {title="파이어 엠블렘 게임",aliases={"fire emblem game","파이어 엠블렘 게임"},words="Fire Emblem: Shadow Dragon|Fire Emblem: Mystery of the Emblem|Fire Emblem: Genealogy of the Holy War|Fire Emblem: Thracia 776|Fire Emblem: The Binding Blade|Fire Emblem: The Blazing Blade|Fire Emblem: The Sacred Stones|Fire Emblem: Path of Radiance|Fire Emblem: Radiant Dawn|Fire Emblem Awakening|Fire Emblem Fates|Fire Emblem Echoes: Shadows of Valentia|Fire Emblem: Three Houses|Fire Emblem Engage|Fire Emblem Warriors"},
 {title="동물의숲 게임",aliases={"animal crossing game","동물의숲 게임","동물의 숲 게임"},words="Animal Crossing|Animal Crossing: Wild World|Animal Crossing: City Folk|Animal Crossing: New Leaf|Animal Crossing: New Horizons|Animal Crossing: Happy Home Designer|Animal Crossing: Amiibo Festival|Animal Crossing: Pocket Camp"},
 {title="피크민 게임",aliases={"pikmin game","피크민 게임"},words="Pikmin|Pikmin 2|Pikmin 3|Pikmin 3 Deluxe|Pikmin 4|Hey! Pikmin|Pikmin Bloom"},
 {title="스플래툰 게임",aliases={"splatoon game","스플래툰 게임"},words="Splatoon|Splatoon 2|Splatoon 3|Splatoon 2: Octo Expansion|Splatoon 3: Side Order"},
 {title="페이퍼 마리오 게임",aliases={"paper mario game","페이퍼 마리오 게임"},words="Paper Mario|Paper Mario: The Thousand-Year Door|Super Paper Mario|Paper Mario: Sticker Star|Paper Mario: Color Splash|Paper Mario: The Origami King"},
 {title="와리오 게임",aliases={"wario game","와리오 게임"},words="Wario Land: Super Mario Land 3|Virtual Boy Wario Land|Wario Land II|Wario Land 3|Wario Land 4|Wario Land: Shake It!|Wario World|Wario: Master of Disguise|WarioWare, Inc.: Mega Microgames!|WarioWare: Twisted!|WarioWare: Touched!|WarioWare: Smooth Moves|WarioWare: D.I.Y.|Game & Wario|WarioWare Gold|WarioWare: Get It Together!|WarioWare: Move It!"},
 {title="스타폭스 게임",aliases={"star fox game","스타폭스 게임"},words="Star Fox|Star Fox 2|Star Fox 64|Star Fox Adventures|Star Fox: Assault|Star Fox Command|Star Fox 64 3D|Star Fox Zero|Star Fox Guard"},
 {title="제노블레이드 게임",aliases={"xenoblade game","제노블레이드 게임"},words="Xenoblade Chronicles|Xenoblade Chronicles X|Xenoblade Chronicles 2|Xenoblade Chronicles 2: Torna - The Golden Country|Xenoblade Chronicles: Definitive Edition|Xenoblade Chronicles 3|Xenoblade Chronicles 3: Future Redeemed"},
 {title="플레이스테이션 게임",aliases={"playstation game","플레이스테이션 게임"},words="Gravity Rush|Gravity Rush 2|Patapon|LocoRoco|Ape Escape|MediEvil|The Legend of Dragoon|Dark Cloud|Dark Chronicle|ICO|Shadow of the Colossus|The Last Guardian|LittleBigPlanet|Tearaway|Sackboy: A Big Adventure|Astro Bot|Returnal|Bloodborne|Ghost of Tsushima|Uncharted|God of War|Ratchet & Clank|Jak and Daxter|Sly Cooper"},
 {title="엑스박스 게임",aliases={"xbox game","엑스박스 게임"},words="Viva Pinata|Viva Pinata: Trouble in Paradise|Kameo: Elements of Power|Blinx: The Time Sweeper|Crimson Skies: High Road to Revenge|Lost Odyssey|Blue Dragon|Fable|Fable II|Fable III|Halo: Combat Evolved|Halo 2|Halo 3|Halo: Reach|Gears of War|Forza Horizon|Forza Motorsport|Sea of Thieves|Hi-Fi Rush|Grounded|Pentiment|Psychonauts 2"},
 {title="인디 게임",aliases={"indie game","인디 게임"},words="Chants of Sennaar|Cocoon|Tunic|Sable|Eastshade|A Short Hike|Lil Gator Game|TOEM|Chicory: A Colorful Tale|Wandersong|Night in the Woods|Oxenfree|Kentucky Route Zero|Mutazione|Citizen Sleeper|Norco|OneShot|Omori|Undertale|Deltarune|Celeste|Hollow Knight|Stardew Valley"},
 {title="협동 게임",aliases={"co op game","co-op game","cooperative game","협동 게임"},words="Keep Talking and Nobody Explodes|Unrailed!|Moving Out|Tools Up!|Lovers in a Dangerous Spacetime|Heave Ho|Pico Park|Human: Fall Flat|Overcooked!|Overcooked! 2|It Takes Two|A Way Out|Portal 2|We Were Here|Trine|Deep Rock Galactic|Phasmophobia|Raft"},
 {title="퍼즐 게임",aliases={"puzzle game","퍼즐 게임"},words="Baba Is You|Patrick's Parabox|Stephen's Sausage Roll|A Monster's Expedition|Snakebird|The Talos Principle|The Witness|Portal|Portal 2|Superliminal|Viewfinder|Gorogoa|The Room|World of Goo|Human Resource Machine|Opus Magnum|Zachtronics Solitaire Collection|Tetris|Puyo Puyo|Lumines"},
 {title="리듬 게임",aliases={"rhythm game","리듬 게임"},words="Rhythm Doctor|A Dance of Fire and Ice|Melatonin|Crypt of the NecroDancer|Sayonara Wild Hearts|Thumper|Sound Shapes|Rhythm Heaven|Elite Beat Agents|PaRappa the Rapper|Um Jammer Lammy|Gitaroo Man|Patapon|Taiko no Tatsujin|Muse Dash|DJMAX Respect|Beat Saber|Guitar Hero|Rock Band|Project DIVA"},
 {title="레이싱 게임",aliases={"racing game","레이싱 게임"},words="Art of Rally|Absolute Drift|Inertial Drift|Distance|Redout|BallisticNG|GRIP: Combat Racing|FAST RMX|F-Zero GX|Wave Race 64|Hydro Thunder|OutRun|Daytona USA|Ridge Racer|Wipeout|Burnout Paradise|Burnout 3: Takedown|Mario Kart 8 Deluxe|Gran Turismo|Forza Horizon 5|Need for Speed: Most Wanted"},
 {title="스포츠 비디오 게임",aliases={"sports video game","sports game","스포츠 게임"},words="Windjammers|Windjammers 2|Super Mega Baseball|Golf Story|Sports Story|Everybody's Golf|Mario Golf: Toadstool Tour|Mario Tennis Aces|Mario Strikers: Battle League|Nintendo Switch Sports|Wii Sports|Tony Hawk's Pro Skater|Skate 3|SSX Tricky|Rocket League|NBA Jam|NBA Street|NFL Blitz|Punch-Out!!"},
 {title="플랫포머 게임",aliases={"platform game","platformer","플랫포머 게임"},words="VVVVVV|N++|Dustforce|Super Meat Boy|The End Is Nigh|Celeste|Shovel Knight|A Hat in Time|Demon Turf|Yooka-Laylee|Psychonauts|Rayman Origins|Rayman Legends|Klonoa|Croc: Legend of the Gobbos|Spyro the Dragon|Crash Bandicoot|Sonic Mania|Ori and the Blind Forest"},
 {title="롤플레잉 게임",aliases={"role playing game","role-playing game","rpg game","롤플레잉 게임"},words="Radiant Historia|The Last Story|Lost Odyssey|Skies of Arcadia|Grandia|Lunar: Silver Star Story|Golden Sun|Suikoden II|Chrono Trigger|Chrono Cross|Xenogears|Vagrant Story|Shadow Hearts|Baten Kaitos|Bravely Default|Octopath Traveler|Triangle Strategy|Sea of Stars|Chained Echoes|Persona 5|Dragon Quest XI"},
 {title="생존 게임",aliases={"survival game","생존 게임"},words="The Long Dark|Green Hell|Stranded Deep|Don't Starve|Don't Starve Together|Subnautica|Subnautica: Below Zero|Raft|Grounded|Valheim|V Rising|Project Zomboid|7 Days to Die|The Forest|Sons of the Forest|Terraria|Core Keeper|Astroneer|Oxygen Not Included|Rust"},
 {title="공포 게임",aliases={"horror game","공포 게임"},words="Detention|Devotion|Mundaun|Darkwood|Lost in Vivo|Cry of Fear|SOMA|Amnesia: The Dark Descent|Penumbra: Overture|Outlast|Alien: Isolation|Signalis|Fear & Hunger|Fatal Frame|Siren|Clock Tower|Haunting Ground|Rule of Rose|Resident Evil|Silent Hill|Little Nightmares|Layers of Fear"},
 {title="게임 배급사",aliases={"game publisher","게임 배급사"},words="Annapurna Interactive|Raw Fury|Devolver Digital|Fellow Traveller|Finji|Humble Games|Team17|Chuckelfish|Dangen Entertainment|Playism|NIS America|Xseed Games|Marvelous|Atlus|Sega|Capcom|Bandai Namco|Square Enix|Nintendo|Sony Interactive Entertainment|Xbox Game Studios|Electronic Arts|Ubisoft"},
 {title="게임기",aliases={"game console","video game console","게임기"},words="Atari Jaguar|Atari Lynx|Neo Geo|Neo Geo Pocket|WonderSwan|WonderSwan Color|PC Engine|TurboGrafx-16|3DO|Philips CD-i|Sega Saturn|Sega Dreamcast|Sega Game Gear|Sega Genesis|PlayStation Vita|PlayStation Portable|PlayStation 2|PlayStation 3|PlayStation 4|PlayStation 5|Xbox|Xbox 360|Xbox One|Xbox Series X|Nintendo Switch"},
 {title="게임 장르",aliases={"video game genre","game genre","게임 장르"},words="Metroidvania|Roguelike|Roguelite|Soulslike|Immersive sim|Visual novel|Point-and-click adventure|Deckbuilder|Tower defense|Real-time strategy|Turn-based strategy|Tactical RPG|Dungeon crawler|Sandbox|Survival horror|Platformer|Rhythm|Puzzle|Fighting|Racing|Simulation|Battle royale|MOBA|MMORPG"},
 {title="파이널 판타지 게임",aliases={"final fantasy game","파이널 판타지 게임"},words="Final Fantasy|Final Fantasy II|Final Fantasy III|Final Fantasy IV|Final Fantasy V|Final Fantasy VI|Final Fantasy VII|Final Fantasy VIII|Final Fantasy IX|Final Fantasy X|Final Fantasy XI|Final Fantasy XII|Final Fantasy XIII|Final Fantasy XIV|Final Fantasy XV|Final Fantasy XVI|Final Fantasy Tactics|Final Fantasy Crystal Chronicles|Final Fantasy Type-0|World of Final Fantasy"},
 {title="드래곤 퀘스트 게임",aliases={"dragon quest game","드래곤 퀘스트 게임"},words="Dragon Quest|Dragon Quest II|Dragon Quest III|Dragon Quest IV|Dragon Quest V|Dragon Quest VI|Dragon Quest VII|Dragon Quest VIII|Dragon Quest IX|Dragon Quest X|Dragon Quest XI|Dragon Quest Builders|Dragon Quest Builders 2|Dragon Quest Heroes|Dragon Quest Treasures|Dragon Quest Monsters: The Dark Prince|Dragon Quest Swords"},
 {title="청바지 브랜드",aliases={"jeans brand","denim brand","청바지 브랜드"},words="Nudie Jeans|Edwin|Evisu|Momotaro|Pure Blue Japan|Studio D'Artisan|The Flat Head|Iron Heart|Samurai Jeans|Sugar Cane|Full Count|Oni Denim|Resolute|Japan Blue Jeans|Naked & Famous|Tellason|3sixteen|A.P.C.|Levi's|Lee|Wrangler|Diesel|G-Star Raw|Pepe Jeans|True Religion"},
 {title="가방 브랜드",aliases={"bag brand","handbag brand","가방 브랜드"},words="Cote&Ciel|Crumpler|Timbuk2|Chrome Industries|Mission Workshop|Mystery Ranch|Gregory|Osprey|Deuter|Thule|Herschel|Eastpak|JanSport|Kipling|LeSportsac|Fjallraven|Tumi|Samsonite|American Tourister|Delsey|Rimowa|Longchamp|Coach|Furla|Coccinelle|Radley"},
 {title="시계 브랜드",aliases={"watch brand","시계 브랜드"},words="Nomos|Junghans|Stowa|Laco|Sinn|Oris|Mido|Certina|Rado|Doxa|Glycine|Squale|Baltic|Lorier|Farer|Christopher Ward|Zelos|Phoibos|Orient|Citizen|Seiko|Casio|Timex|Tissot|Longines|Hamilton|Omega|Rolex|Patek Philippe|Audemars Piguet|Vacheron Constantin"},
 {title="향수 브랜드",aliases={"perfume brand","fragrance brand","향수 브랜드"},words="Zoologist|Imaginary Authors|Etat Libre d'Orange|Serge Lutens|L'Artisan Parfumeur|Diptyque|Byredo|Le Labo|Frederic Malle|Maison Francis Kurkdjian|Amouage|Xerjoff|Parfums de Marly|Penhaligon's|Floris|Creed|Acqua di Parma|Jo Malone|Maison Margiela|Tom Ford|Guerlain|Chanel|Dior|Hermes|Prada"},
 {title="화장품 브랜드",aliases={"cosmetics brand","makeup brand","화장품 브랜드"},words="Kryolan|Ben Nye|RCMA|Mehron|Inglot|Illamasqua|Zoeva|Nabla|Viseart|Melt Cosmetics|Lethal Cosmetics|Kiko Milano|Make Up For Ever|Nars|MAC|Bobbi Brown|Laura Mercier|Charlotte Tilbury|Rare Beauty|Fenty Beauty|Glossier|Clinique|Lancome|Shiseido|Etude|Clio|Romand|Peripera|Espoir|3CE"},
 {title="치킨 프랜차이즈",aliases={"chicken chain","chicken restaurant","치킨 브랜드","치킨집"},words="노랑통닭|부어치킨|멕시카나|멕시칸치킨|처갓집양념치킨|페리카나|또래오래|또봉이통닭|호식이두마리치킨|땅땅치킨|티바두마리치킨|치킨매니아|네네치킨|지코바|자담치킨|푸라닭|60계치킨|바른치킨|깐부치킨|오븐마루|오꾸닭|굽네치킨|교촌치킨|BHC|BBQ|KFC|Popeyes|Jollibee|Chick-fil-A|Raising Cane's|Church's Texas Chicken"},
 {title="카페 체인",aliases={"coffee shop chain","cafe chain","카페 브랜드","카페 체인"},words="더벤티|더리터|하삼동커피|하이오커피|텐퍼센트커피|감성커피|매머드커피|메가커피|컴포즈커피|빽다방|이디야|투썸플레이스|할리스|탐앤탐스|엔제리너스|카페베네|커피빈|폴바셋|파스쿠찌|드롭탑|달콤커피|블루보틀|커피빈|Starbucks|Costa Coffee|Caffe Nero|Tim Hortons|Peet's Coffee|Dutch Bros|Caribou Coffee|Gloria Jean's"},
 {title="편의점 브랜드",aliases={"convenience store chain","편의점 브랜드","편의점"},words="미니스톱|씨스페이스|스토리웨이|이마트24|GS25|CU|세븐일레븐|7-Eleven|FamilyMart|Lawson|Daily Yamazaki|NewDays|Seicomart|Circle K|AMPM|Wawa|Sheetz|QuikTrip|RaceTrac|Casey's|Spar|Oxxo|Alfamart|Indomaret"},
 {title="아이스크림 브랜드",aliases={"ice cream brand","아이스크림 브랜드"},words="Talenti|Jeni's|Van Leeuwen|Tillamook|Graeter's|Blue Bell|Blue Bunny|Turkey Hill|Breyers|Edy's|Dreyer's|Friendly's|Carvel|Dippin' Dots|Cold Stone Creamery|Marble Slab Creamery|Bruster's|Salt & Straw|Ample Hills|Llaollao|Amorino|Venchi|Gelatissimo|Grom|Movenpick|Haagen-Dazs|Ben & Jerry's|Baskin-Robbins|Melona|Magnum|Cornetto|롯데웰푸드|빙그레|해태아이스크림"},
 {title="과자 브랜드",aliases={"snack brand","cookie brand","과자 브랜드"},words="Tim Tam|Arnott's|Walkers|McVitie's|Bahlsen|Leibniz|Lotus|Biscoff|Loacker|Manner|Ritter Sport|Milka|Toblerone|Lindt|Haribo|Trolli|Katjes|Jelly Belly|Pez|Tunnock's|Oreo|Ritz|Chips Ahoy!|Nutter Butter|Nilla|Goldfish|Cheez-It|Triscuit|Wheat Thins|Doritos|Cheetos|Fritos|Takis|Lay's|Pringles|Bugles"},
 {title="TV 프로그램",aliases={"tv program","tv programme","tv show","television show","television program","TV 프로그램","TV프로그램","티비 프로그램","방송 프로그램"},words="EBS 스페이스 공감|장학퀴즈|우리말 겨루기|TV쇼 진품명품|가요무대|전국노래자랑|아침마당|6시 내고향|동네 한 바퀴|걸어서 세계속으로|세계테마기행|한국기행|극한직업|건축탐구 집|명의|인간극장|생로병사의 비밀|다큐프라임|역사저널 그날|추적 60분|PD수첩|그것이 알고 싶다|시사기획 창|TV 동물농장|순간포착 세상에 이런 일이|세상에 나쁜 개는 없다|고양이를 부탁해|개는 훌륭하다|생활의 달인|서프라이즈|신비한 TV 서프라이즈|런닝맨|무한도전|1박 2일|놀면 뭐하니?|나 혼자 산다|전지적 참견 시점|라디오스타|유 퀴즈 온 더 블럭|아는 형님|신서유기|강식당|윤식당|삼시세끼|꽃보다 할배|꽃보다 누나|꽃보다 청춘|지구오락실|뿅뿅 지구오락실|놀라운 토요일|토요일은 밥이 좋아|맛있는 녀석들|식객 허영만의 백반기행|백종원의 골목식당|냉장고를 부탁해|한식대첩|마스터셰프 코리아|복면가왕|불후의 명곡|히든싱어|슈퍼스타K|K팝 스타|보이스 코리아|미스터트롯|미스트롯|싱어게인|팬텀싱어|풍류대장|나는 가수다|쇼미더머니|스케치북|유희열의 스케치북|뮤직뱅크|인기가요|쇼! 음악중심|엠카운트다운|열린음악회|콘서트 7080"},
 {title="한국 예능",aliases={"korean variety show","korean entertainment show","한국 예능","예능 프로그램"},words="비정상회담|마녀사냥|문제적 남자|더 지니어스|크라임씬|대탈출|여고추리반|소사이어티 게임|더 타임 호텔|피의 게임|데블스 플랜|솔로지옥|환승연애|하트시그널|짝|나는 SOLO|연애의 참견|안녕하세요|동상이몽|슈퍼맨이 돌아왔다|아빠! 어디가?|오 마이 베이비|리틀 포레스트|청춘불패|패밀리가 떴다|X맨|강심장|해피투게더|야심만만|상상플러스|쟁반노래방|천생연분|만원의 행복|스타골든벨|스펀지"},
 {title="한국 드라마",aliases={"korean drama","k drama","한국 드라마","국내 드라마"},words="나인: 아홉 번의 시간여행|라이프 온 마스|신의 퀴즈|괴물|비밀의 숲|시그널|터널|악의 마음을 읽는 자들|손 the guest|구경이|아무도 모른다|마더|눈이 부시게|멜로가 체질|나의 아저씨|나의 해방일지|미생|스토브리그|슬기로운 감빵생활|슬기로운 의사생활|응답하라 1988|응답하라 1994|응답하라 1997|도깨비|미스터 션샤인|사랑의 불시착|호텔 델루나|별에서 온 그대|스카이 캐슬|펜트하우스|오징어 게임|킹덤|더 글로리|이상한 변호사 우영우|무빙"},
 {title="해외 드라마",aliases={"foreign tv series","american tv drama","해외 드라마","미국 드라마"},words="Severance|Dark|The Leftovers|Halt and Catch Fire|The Americans|The Wire|The Expanse|Mr. Robot|Person of Interest|Fringe|Orphan Black|Utopia|The OA|Counterpart|Devs|Station Eleven|Patriot|Lodge 49|Pushing Daisies|Wonderfalls|Dead Like Me|Deadwood|Fargo|True Detective|Twin Peaks|Better Call Saul|Breaking Bad|Lost|Prison Break|Sherlock|Doctor Who|Downton Abbey|Broadchurch|Luther|The Crown"},
 {title="어린이 TV 프로그램",aliases={"children tv show","kids tv show","어린이 TV 프로그램","어린이 프로그램"},words="딩동댕 유치원|방귀대장 뿡뿡이|모여라 딩동댕|생방송 톡!톡! 보니하니|한글이 야호|한글용사 아이야|숲속 친구 파파룰라|최고다! 호기심딱지|방송국의 시간을 팝니다|방학엔 뭐하니?|Sesame Street|Mister Rogers' Neighborhood|Blue's Clues|The Wiggles|Teletubbies|Barney & Friends|Yo Gabba Gabba!|LazyTown|The Big Comfy Couch|Zoboomafoo|Reading Rainbow|Art Attack|Mister Maker|Play School|In the Night Garden"},
 {title="TV 방송국",aliases={"tv channel","television network","TV 방송국","방송국"},words="EBS|KBS|MBC|SBS|JTBC|tvN|OCN|채널A|MBN|TV조선|YTN|연합뉴스TV|BBC|ITV|Channel 4|Channel 5|ABC|CBS|NBC|Fox|PBS|HBO|Showtime|AMC|FX|The CW|Nickelodeon|Cartoon Network|Disney Channel|Discovery Channel|National Geographic|Animal Planet|History|TLC"},
 {title="OTT 서비스",aliases={"streaming service","ott service","OTT 서비스","스트리밍 서비스"},words="Mubi|Criterion Channel|Shudder|BritBox|Acorn TV|Viki|iQIYI|Viu|WeTV|U-Next|FOD|Abema|Tubi|Pluto TV|Plex|Rakuten TV|Crunchyroll|Hidive|Netflix|Disney+|Prime Video|Apple TV+|Hulu|Peacock|Paramount+|Max|TVING|Wavve|Watcha|Coupang Play|Laftel"},
 {title="요리 TV 프로그램",aliases={"cooking tv show","cooking show","요리 프로그램","요리 TV 프로그램"},words="한식대첩|마스터셰프 코리아|냉장고를 부탁해|쿡가대표|집밥 백선생|백종원의 골목식당|백종원의 푸드트럭|수미네 반찬|신상출시 편스토랑|알토란|최고의 요리비결|오늘 뭐 먹지?|삼시세끼|윤식당|강식당|서진이네|흑백요리사|Chef's Table|The Chef Show|Salt Fat Acid Heat|Somebody Feed Phil|Ugly Delicious|Iron Chef|MasterChef|Top Chef|Hell's Kitchen|The Great British Bake Off|Nailed It!|Chopped|Good Eats"},
 {title="오디션 TV 프로그램",aliases={"talent show","singing competition show","오디션 프로그램"},words="슈퍼스타K|K팝 스타|보이스 코리아|위대한 탄생|스타 오디션 위대한 탄생|미스트롯|미스터트롯|싱어게인|팬텀싱어|슈퍼밴드|풍류대장|쇼미더머니|언프리티 랩스타|고등래퍼|프로듀스 101|소년24|믹스나인|더 유닛|아이돌학교|Girls Planet 999|Boys Planet|I-LAND|LOUD|American Idol|The Voice|The X Factor|Britain's Got Talent|America's Got Talent|Pop Idol"},
 {title="다큐멘터리 프로그램",aliases={"documentary tv show","documentary series","다큐멘터리 프로그램","다큐 프로그램"},words="다큐프라임|다큐멘터리 3일|다큐 인사이트|다큐 온|인간극장|명의|극한직업|세계테마기행|한국기행|걸어서 세계속으로|건축탐구 집|동물의 왕국|자연의 세계|환경스페셜|생로병사의 비밀|문명의 기억 지도|Planet Earth|Blue Planet|Frozen Planet|Our Planet|Life|The Hunt|Africa|Human Planet|Cosmos|The World at War|The Civil War|The Vietnam War|The Last Dance"},
 {title="시트콤",aliases={"sitcom","시트콤"},words="웬만해선 그들을 막을 수 없다|똑바로 살아라|순풍산부인과|뉴 논스톱|논스톱|안녕 프란체스카|거침없이 하이킥|지붕뚫고 하이킥|하이킥! 짧은 다리의 역습|감자별 2013QR3|마음의 소리|The IT Crowd|Black Books|Spaced|Peep Show|Father Ted|Fawlty Towers|Keeping Up Appearances|Community|Parks and Recreation|30 Rock|Frasier|Cheers|Seinfeld|Friends|Modern Family|Brooklyn Nine-Nine|The Good Place|New Girl|Superstore"},
 {title="미국 TV 애니메이션",aliases={"american cartoon","american animated show","미국 TV 애니메이션"},words="Chowder|The Marvelous Misadventures of Flapjack|Camp Lazlo|My Gym Partner's a Monkey|Class of 3000|Sym-Bionic Titan|Megas XLR|Time Squad|Sheep in the Big City|Mike, Lu & Og|Whatever Happened to Robot Jones?|Evil Con Carne|The Grim Adventures of Billy & Mandy|Foster's Home for Imaginary Friends|Codename: Kids Next Door|Ed, Edd n Eddy|Dexter's Laboratory|Johnny Bravo|Courage the Cowardly Dog|The Secret Saturdays|Generator Rex|Ben 10|Danny Phantom|The Fairly OddParents"},
 {title="해리 포터 캐릭터",aliases={"harry potter character","해리 포터 캐릭터","해리포터 캐릭터"},words="Luna Lovegood|Neville Longbottom|Ginny Weasley|Cho Chang|Cedric Diggory|Nymphadora Tonks|Remus Lupin|Sirius Black|Kingsley Shacklebolt|Mad-Eye Moody|Arthur Weasley|Molly Weasley|Percy Weasley|Bill Weasley|Charlie Weasley|Fleur Delacour|Viktor Krum|Igor Karkaroff|Olympe Maxime|Garrick Ollivander|Argus Filch|Pomona Sprout|Filius Flitwick|Sybill Trelawney|Gilderoy Lockhart|Horace Slughorn|Dolores Umbridge|Peter Pettigrew|Bellatrix Lestrange|Lucius Malfoy|Narcissa Malfoy|Draco Malfoy|Dobby|Kreacher|Harry Potter|Hermione Granger|Ron Weasley|Severus Snape|Albus Dumbledore|Lord Voldemort"},
 {title="스타워즈 캐릭터",aliases={"star wars character","스타워즈 캐릭터"},words="Plo Koon|Kit Fisto|Shaak Ti|Ki-Adi-Mundi|Aayla Secura|Luminara Unduli|Barriss Offee|Quinlan Vos|Adi Gallia|Yaddle|Oppo Rancisis|Depa Billaba|Saesee Tiin|Even Piell|Coleman Trebor|Jocasta Nu|Bail Organa|Mon Mothma|Wedge Antilles|Biggs Darklighter|Nien Nunb|Wicket|Admiral Ackbar|Cad Bane|Hondo Ohnaka|Asajj Ventress|Darth Maul|Count Dooku|General Grievous|Ahsoka Tano|Captain Rex|Commander Cody|Luke Skywalker|Leia Organa|Han Solo|Chewbacca|Darth Vader|Obi-Wan Kenobi|Yoda|Palpatine"},
 {title="반지의 제왕 캐릭터",aliases={"lord of the rings character","lotr character","반지의 제왕 캐릭터"},words="Tom Bombadil|Goldberry|Glorfindel|Radagast|Celeborn|Haldir|Gildor|Beregond|Bergil|Ioreth|Imrahil|Damrod|Mablung|Gorbag|Shagrat|Grishnakh|Ugluk|Lurtz|Eomer|Eowyn|Theoden|Denethor|Faramir|Boromir|Arwen|Elrond|Galadriel|Treebeard|Gimli|Legolas|Aragorn|Gandalf|Frodo Baggins|Samwise Gamgee|Meriadoc Brandybuck|Peregrin Took|Bilbo Baggins|Gollum|Saruman|Sauron"},
 {title="호빗 캐릭터",aliases={"hobbit character","the hobbit character","호빗 캐릭터"},words="Balin|Dwalin|Fili|Kili|Dori|Nori|Ori|Oin|Gloin|Bifur|Bofur|Bombur|Thorin Oakenshield|Bilbo Baggins|Gandalf|Beorn|Bard|Thranduil|Radagast|Smaug|Elrond|Tauriel|Azog|Bolg|Alfrid|Sigrid|Bain|Tilda"},
 {title="트랜스포머 캐릭터",aliases={"transformers character","transformer character","트랜스포머 캐릭터"},words="Perceptor|Blaster|Tracks|Skids|Grapple|Hoist|Inferno|Red Alert|Smokescreen|Bluestreak|Trailbreaker|Hound|Mirage|Windcharger|Gears|Brawn|Cliffjumper|Beachcomber|Seaspray|Powerglide|Warpath|Cosmos|Wheeljack|Ratchet|Ironhide|Prowl|Jazz|Sideswipe|Sunstreaker|Jetfire|Grimlock|Slag|Sludge|Snarl|Swoop|Optimus Prime|Bumblebee|Megatron|Starscream|Soundwave|Shockwave|Ravage|Laserbeak|Rumble|Frenzy"},
 {title="닌자 거북이 캐릭터",aliases={"teenage mutant ninja turtles character","tmnt character","닌자 거북이 캐릭터"},words="Baxter Stockman|Leatherhead|Mondo Gecko|Mona Lisa|Metalhead|Slash|Ray Fillet|Fugitoid|Usagi Yojimbo|Karai|Rat King|Casey Jones|April O'Neil|Splinter|Leonardo|Donatello|Raphael|Michelangelo|Shredder|Krang|Bebop|Rocksteady|Tokka|Rahzar|Tatsu|Tiger Claw|Fishface|Dogpound"},
 {title="루니 툰 캐릭터",aliases={"looney tunes character","루니 툰 캐릭터","루니툰 캐릭터"},words="Michigan J. Frog|Gossamer|Witch Hazel|Granny|Henery Hawk|Barnyard Dawg|Cecil Turtle|Pete Puma|Beaky Buzzard|Hubie|Bertie|Claude Cat|Marc Anthony|Pussyfoot|Bugs Bunny|Daffy Duck|Porky Pig|Elmer Fudd|Yosemite Sam|Foghorn Leghorn|Marvin the Martian|Tweety|Sylvester|Speedy Gonzales|Wile E. Coyote|Road Runner|Tasmanian Devil|Pepe Le Pew"},
 {title="피너츠 캐릭터",aliases={"peanuts character","피너츠 캐릭터"},words="Schroeder|Pig-Pen|Franklin|Marcie|Peppermint Patty|Sally Brown|Rerun van Pelt|Patty|Violet Gray|Shermy|Frieda|Eudora|5|Roy|Spike|Belle|Olaf|Andy|Molly|Rover|Charlie Brown|Snoopy|Woodstock|Linus van Pelt|Lucy van Pelt"},
 {title="어드벤처 타임 캐릭터",aliases={"adventure time character","어드벤처 타임 캐릭터"},words="Prismo|Cosmic Owl|Peppermint Butler|Cinnamon Bun|Root Beer Guy|Choose Goose|Huntress Wizard|Fern|Susan Strong|Flame Princess|Lumpy Space Princess|Lemongrab|Tree Trunks|Mr. Pig|Death|The Lich|Gunter|Magic Man|Hunson Abadeer|Billy|BMO|Princess Bubblegum|Marceline|Ice King|Finn|Jake|Lady Rainicorn"},
 {title="그래비티 폴즈 캐릭터",aliases={"gravity falls character","그래비티 폴즈 캐릭터"},words="Wendy Corduroy|Soos Ramirez|Pacifica Northwest|Gideon Gleeful|Fiddleford McGucket|Candy Chiu|Grenda Grendinator|Robbie Valentino|Blendin Blandin|Sheriff Blubs|Deputy Durland|Toby Determined|Bud Gleeful|Lazy Susan|Manly Dan|Waddles|Gompers|Dipper Pines|Mabel Pines|Stanley Pines|Stanford Pines|Bill Cipher"},
 {title="검볼 캐릭터",aliases={"gumball character","amazing world of gumball character","검볼 캐릭터"},words="Carrie Krueger|Penny Fitzgerald|Tobias Wilson|Banana Joe|Alan Keane|Carmen Verde|Bobert|Tina Rex|Masami Yoshida|Ocho Tootmorsel|Teri|Leslie|Clayton|Colin|Felix|Julius Oppenheimer Jr.|Rob|Larry Needlemeyer|Principal Brown|Miss Simian|Mr. Small|Gumball Watterson|Darwin Watterson|Anais Watterson|Nicole Watterson|Richard Watterson"},
 {title="파워퍼프걸 캐릭터",aliases={"powerpuff girls character","파워퍼프걸 캐릭터"},words="Ms. Keane|Ms. Bellum|Professor Utonium|The Mayor|Fuzzy Lumpkins|Sedusa|Princess Morbucks|Ace|Snake|Arturo|Grubber|Big Billy|Brick|Boomer|Butch|Mojo Jojo|Him|Blossom|Bubbles|Buttercup|Bullet|Bunny"},
 {title="스쿠비 두 캐릭터",aliases={"scooby doo character","scooby-doo character","스쿠비 두 캐릭터"},words="Velma Dinkley|Daphne Blake|Fred Jones|Shaggy Rogers|Scooby-Doo|Scrappy-Doo|Scooby-Dum|Vincent Van Ghoul|Flim-Flam|Hex Girls|Thorn|Dusk|Luna|Hot Dog Water|Sheriff Stone|Professor Pericles|Angel Dynamite|Marcie Fleach"},
 {title="디즈니 애니메이션",aliases={"disney animation","disney animated movie","disney movie","디즈니 애니메이션","디즈니 영화"},words="The Black Cauldron|The Great Mouse Detective|The Rescuers|The Rescuers Down Under|Oliver & Company|Treasure Planet|Atlantis: The Lost Empire|The Emperor's New Groove|Brother Bear|Home on the Range|Meet the Robinsons|The Princess and the Frog|Bolt|Dinosaur|The Fox and the Hound|The Sword in the Stone|Robin Hood|The Aristocats|The Hunchback of Notre Dame|Hercules|Mulan|Pocahontas|Tarzan|Lilo & Stitch|Wreck-It Ralph|Big Hero 6|Zootopia|Moana|Raya and the Last Dragon|Encanto|Frozen|Tangled|Aladdin|The Lion King|Beauty and the Beast"},
 {title="픽사 영화",aliases={"pixar movie","pixar film","픽사 영화"},words="The Good Dinosaur|Onward|Luca|Turning Red|Soul|Elemental|Lightyear|Brave|A Bug's Life|Cars|Cars 2|Cars 3|Monsters, Inc.|Monsters University|Finding Nemo|Finding Dory|The Incredibles|Incredibles 2|Toy Story|Toy Story 2|Toy Story 3|Toy Story 4|Inside Out|Inside Out 2|Ratatouille|WALL-E|Up|Coco"},
 {title="드림웍스 영화",aliases={"dreamworks movie","dreamworks film","드림웍스 영화"},words="Sinbad: Legend of the Seven Seas|The Road to El Dorado|The Prince of Egypt|Spirit: Stallion of the Cimarron|Joseph: King of Dreams|Antz|Shark Tale|Over the Hedge|Bee Movie|Flushed Away|Monsters vs. Aliens|Megamind|The Croods|Home|Turbo|Mr. Peabody & Sherman|Captain Underpants: The First Epic Movie|Abominable|The Bad Guys|The Wild Robot|Rise of the Guardians|Shrek|Shrek 2|Madagascar|Kung Fu Panda|How to Train Your Dragon|Puss in Boots: The Last Wish"},
 {title="지브리 영화",aliases={"ghibli movie","studio ghibli film","지브리 영화"},words="Only Yesterday|Pom Poko|My Neighbors the Yamadas|Ocean Waves|The Cat Returns|Tales from Earthsea|From Up on Poppy Hill|When Marnie Was There|The Tale of the Princess Kaguya|The Wind Rises|Earwig and the Witch|The Boy and the Heron|Porco Rosso|Whisper of the Heart|Arrietty|Ponyo|Howl's Moving Castle|Spirited Away|Princess Mononoke|Kiki's Delivery Service|My Neighbor Totoro|Castle in the Sky|Grave of the Fireflies|Nausicaa of the Valley of the Wind"},
 {title="한국 가수",aliases={"korean singer","한국 가수"},words="김현철|윤상|이적|김동률|정재형|조규찬|하림|루시드폴|김사월|이랑|오지은|선우정아|정인|박정현|하동균|나얼|정엽|이소라|김윤아|장혜진|거미|린|케이윌|이승환|윤종신|성시경|박효신|아이유|태연|윤하"},
 {title="외국 가수",aliases={"foreign singer","international singer","외국 가수"},words="Ane Brun|Agnes Obel|Emiliana Torrini|Susanne Sundfor|AURORA|Sigrid|Sondre Lerche|Damien Rice|Glen Hansard|Lisa Hannigan|Laura Marling|Aldous Harding|Weyes Blood|Angel Olsen|Julia Holter|Joanna Newsom|Regina Spektor|Fiona Apple|Tori Amos|Kate Bush|Björk|Sade|Tracy Chapman|Joni Mitchell"},
 {title="음악 밴드",aliases={"music band","musical band","음악 밴드"},words="Khruangbin|Men I Trust|Crumb|Mild High Club|The Marías|Alvvays|Japanese Breakfast|Beach House|Slowdive|Cocteau Twins|Mazzy Star|Yo La Tengo|Galaxie 500|Broadcast|Stereolab|Belle and Sebastian|Camera Obscura|The Sundays|Prefab Sprout|The Blue Nile|Everything Everything|Elbow|Doves|Keane|Travis"},
 {title="영화 시리즈",aliases={"movie franchise","film series","영화 시리즈"},words="The Thin Man|The Pink Panther|The Naked Gun|Hot Shots!|Police Academy|The Gods Must Be Crazy|Crocodile Dundee|Romancing the Stone|National Treasure|Night at the Museum|The Mummy|Pirates of the Caribbean|Indiana Jones|Back to the Future|Ghostbusters|Men in Black|Jurassic Park|Planet of the Apes|Mission: Impossible|James Bond|Bourne|John Wick|Mad Max|Alien|Predator"},
 {title="영화제",aliases={"film festival","movie festival","영화제"},words="Locarno Film Festival|Karlovy Vary International Film Festival|San Sebastian International Film Festival|Rotterdam International Film Festival|Tribeca Festival|Telluride Film Festival|Sundance Film Festival|Cannes Film Festival|Venice Film Festival|Berlin International Film Festival|Toronto International Film Festival|Busan International Film Festival|Jeonju International Film Festival|Bucheon International Fantastic Film Festival|Sitges Film Festival|Annecy International Animation Film Festival"},
 {title="영화 시상식",aliases={"film award","movie award","영화 시상식"},words="Independent Spirit Awards|Gotham Awards|Critics' Choice Awards|Satellite Awards|Saturn Awards|Annie Awards|European Film Awards|Cesar Awards|Goya Awards|David di Donatello Awards|Ariel Awards|BAFTA Awards|Academy Awards|Golden Globe Awards|청룡영화상|대종상|백상예술대상|부일영화상"},
 {title="동화 캐릭터",aliases={"fairy tale character","동화 캐릭터"},words="Rumpelstiltskin|Thumbelina|The Snow Queen|Gerda|Kai|The Little Match Girl|The Steadfast Tin Soldier|The Selfish Giant|The Happy Prince|The Nightingale|Puss in Boots|The Pied Piper|The Frog Prince|The Gingerbread Man|Goldilocks|Little Red Riding Hood|Hansel|Gretel|Pinocchio|Geppetto|Rapunzel|Cinderella|Snow White|Jack|Sleeping Beauty"},
 {title="세서미 스트리트 캐릭터",aliases={"sesame street character","세서미 스트리트 캐릭터"},words="Count von Count|Mr. Snuffleupagus|Telly Monster|Rosita|Prairie Dawn|Zoe|Abby Cadabby|Julia|Baby Bear|Herry Monster|Murray Monster|Guy Smiley|Don Music|Sherlock Hemlock|Biff|Sully|Barkley|Slimey|Two-Headed Monster|Big Bird|Elmo|Cookie Monster|Bert|Ernie|Grover|Oscar the Grouch"},
 {title="머펫 캐릭터",aliases={"muppet character","the muppets character","머펫 캐릭터"},words="Dr. Bunsen Honeydew|Beaker|Sam Eagle|Swedish Chef|Statler|Waldorf|Sweetums|Robin the Frog|Uncle Deadly|Crazy Harry|Lew Zealand|Beauregard|Dr. Teeth|Floyd Pepper|Janice|Zoot|Lips|Pepe the King Prawn|Bobo the Bear|Walter|Kermit the Frog|Miss Piggy|Fozzie Bear|Gonzo|Rizzo the Rat|Rowlf the Dog|Scooter|Animal"},
 {title="미니언즈 캐릭터",aliases={"minions character","despicable me character","미니언즈 캐릭터"},words="Dr. Nefario|Vector|El Macho|Eduardo Perez|Balthazar Bratt|Scarlet Overkill|Herb Overkill|Wild Knuckles|Belle Bottom|Jean Clawed|Svengeance|Stronghold|Nun-Chuck|Silas Ramsbottom|Margo|Edith|Agnes|Lucy Wilde|Gru|Dru|Kevin|Stuart|Bob|Otto|Mel|Dave|Jerry|Tim|Phil|Carl"},
 {title="쿵푸팬더 캐릭터",aliases={"kung fu panda character","쿵푸팬더 캐릭터"},words="Master Oogway|Shifu|Tigress|Viper|Crane|Monkey|Mantis|Tai Lung|Lord Shen|Kai|Master Croc|Master Ox|Master Thundering Rhino|Master Storming Ox|Master Chicken|Commander Vachir|Mr. Ping|Li Shan|Grandma Panda|Mei Mei|Master Yao|Fung|Tong Fo|Po|Zhen|The Chameleon"},
 {title="드래곤 길들이기 캐릭터",aliases={"how to train your dragon character","드래곤 길들이기 캐릭터"},words="Gobber|Stoick|Valka|Eret|Dagur|Heather|Alvin|Viggo Grimborn|Ryker Grimborn|Krogan|Johann|Grimmel|Drago Bludvist|Hiccup|Astrid|Snotlout|Fishlegs|Ruffnut|Tuffnut|Toothless|Stormfly|Hookfang|Meatlug|Barf and Belch|Skullcrusher|Cloudjumper"},
 {title="슈렉 캐릭터",aliases={"shrek character","슈렉 캐릭터"},words="Doris|Dronkey|Duloc Mascot|Thelonious|Captain Hook|Cyclops|Pied Piper|Rumpelstiltskin|Fairy Godmother|Prince Charming|King Harold|Queen Lillian|Artie|Merlin|Fergus|Farkle|Felicia|Dragon|Gingerbread Man|Pinocchio|Big Bad Wolf|Three Little Pigs|Puss in Boots|Donkey|Fiona|Shrek|Lord Farquaad"},
 {title="마다가스카 캐릭터",aliases={"madagascar character","마다가스카 캐릭터"},words="Maurice|Mort|King Julien|Skipper|Kowalski|Rico|Private|Mason|Phil|Nana|Marlene|Officer X|Dr. Blowhole|Joey|Alice|DuBois|Gia|Vitaly|Stefano|Sonia|Zuba|Florrie|Makunga|Moto Moto|Alex|Marty|Melman|Gloria"},
 {title="토이 스토리 캐릭터",aliases={"toy story character","토이 스토리 캐릭터"},words="Wheezy|Stinky Pete|Al McWhiggin|Emperor Zurg|Hannah Phillips|Sid Phillips|Scud|Buster|Etch A Sketch|Mr. Spell|Lenny|RC|Rocky Gibraltar|Trixie|Buttercup|Dolly|Mr. Pricklepants|Big Baby|Ken|Stretch|Chunk|Sparks|Twitch|Gabby Gabby|Duke Caboom|Giggle McDimples|Ducky|Bunny|Forky|Woody|Buzz Lightyear|Jessie|Bo Peep|Bullseye|Rex|Hamm|Slinky Dog"},
 {title="몬스터 주식회사 캐릭터",aliases={"monsters inc character","monsters university character","몬스터 주식회사 캐릭터"},words="Roz|Celia Mae|Henry J. Waternoose|Randall Boggs|Fungus|George Sanderson|Needleman|Smitty|Yeti|Jerry Slugworth|Flint|Dean Hardscrabble|Don Carlton|Art|Scott Squibbles|Terri Perry|Terry Perry|Johnny Worthington|Chet Alexander|Claire Wheeler|Brock Pearson|James P. Sullivan|Mike Wazowski|Boo"},
 {title="니모를 찾아서 캐릭터",aliases={"finding nemo character","finding dory character","니모를 찾아서 캐릭터"},words="Gill|Bloat|Bubbles|Deb|Flo|Gurgle|Peach|Jacques|Nigel|Darla|Philip Sherman|Bruce|Anchor|Chum|Crush|Squirt|Mr. Ray|Hank|Destiny|Bailey|Fluke|Rudder|Becky|Gerald|Jenny|Charlie|Marlin|Nemo|Dory"},
 {title="인사이드 아웃 캐릭터",aliases={"inside out character","인사이드 아웃 캐릭터"},words="Bing Bong|Jangles|Rainbow Unicorn|Lance Slashblade|Deep Dark Secret|Pouchy|Bloofy|Nostalgia|Anxiety|Envy|Embarrassment|Ennui|Joy|Sadness|Anger|Fear|Disgust|Riley Andersen|Jill Andersen|Bill Andersen|Valentina Ortiz|Bree|Grace"},
 {title="인크레더블 캐릭터",aliases={"incredibles character","the incredibles character","인크레더블 캐릭터"},words="Frozone|Edna Mode|Syndrome|Mirage|Rick Dicker|Bomb Voyage|The Underminer|Gilbert Huph|Kari McKeen|Buddy Pine|Winston Deavor|Evelyn Deavor|Voyd|Brick|Reflux|Krushauer|He-Lectrix|Screech|Dicker|Bob Parr|Helen Parr|Violet Parr|Dash Parr|Jack-Jack Parr|Tony Rydinger"},
 {title="라따뚜이 캐릭터",aliases={"ratatouille character","라따뚜이 캐릭터"},words="Colette Tatou|Anton Ego|Auguste Gusteau|Skinner|Emile|Django|Mustafa|Horst|Lalo|Larousse|Pompidou|Git|Talon Labarthe|Mabel|Francois|Remy|Alfredo Linguini"},
 {title="빅 히어로 캐릭터",aliases={"big hero 6 character","빅 히어로 캐릭터"},words="Go Go Tomago|Honey Lemon|Wasabi|Fred|Tadashi Hamada|Aunt Cass|Robert Callaghan|Alistair Krei|Abigail Callaghan|Heathcliff|Mochi|Hiro Hamada|Baymax|Yama"},
 {title="주토피아 캐릭터",aliases={"zootopia character","주토피아 캐릭터"},words="Clawhauser|Flash|Priscilla|Chief Bogo|Mayor Lionheart|Dawn Bellwether|Mr. Big|Fru Fru|Finnick|Duke Weaselton|Gazelle|Yax|Jerry Jumbeaux Jr.|Mrs. Otterton|Emmitt Otterton|Manchas|Bonnie Hopps|Stu Hopps|Gideon Grey|Doug|Nick Wilde|Judy Hopps"},
 {title="알라딘 캐릭터",aliases={"aladdin character","알라딘 캐릭터"},words="Abu|Rajah|Iago|Sultan|Jafar|Razoul|Fazahl|Gazeem|Hakim|Prince Achmed|Merchant|Carpet|Mozenrath|Abis Mal|Mechanicles|Sadira|Aladdin|Jasmine|Genie"},
 {title="라이온 킹 캐릭터",aliases={"lion king character","라이온 킹 캐릭터"},words="Zazu|Rafiki|Sarabi|Sarafina|Shenzi|Banzai|Ed|Nuka|Vitani|Kovu|Kiara|Zira|Kion|Bunga|Fuli|Beshte|Ono|Anga|Janja|Jasiri|Makuu|Mufasa|Scar|Simba|Nala|Timon|Pumbaa"},
 {title="겨울왕국 캐릭터",aliases={"frozen character","겨울왕국 캐릭터"},words="Oaken|Weselton|Marshmallow|Snowgies|Grand Pabbie|Bulda|Cliff|King Agnarr|Queen Iduna|Lieutenant Mattias|Yelena|Honeymaren|Ryder|Bruni|Nokk|Gale|Earth Giants|Hans|Kristoff|Sven|Olaf|Anna|Elsa"},
 {title="아메리카 국가",aliases={"american country","countries in the americas","north and south american country","아메리카 국가","북미 남미","북미·남미"},words="Suriname|Guyana|Belize|Dominica|Grenada|Saint Kitts and Nevis|Saint Lucia|Saint Vincent and the Grenadines|Antigua and Barbuda|Barbados|Bahamas|Trinidad and Tobago|Guatemala|Honduras|El Salvador|Nicaragua|Costa Rica|Panama|Cuba|Haiti|Dominican Republic|Jamaica|Canada|Mexico|United States|Argentina|Bolivia|Brazil|Chile|Colombia|Ecuador|Paraguay|Peru|Uruguay|Venezuela"},
}
for _,row in ipairs(expanded550) do extraTopics[#extraTopics+1]=row end
local continentalData={
 ["아시아 국가"]={words="Bhutan|Brunei|Timor-Leste|Laos|Maldives|Mongolia|Kyrgyzstan|Tajikistan|Turkmenistan|Uzbekistan|Kazakhstan|Afghanistan|Armenia|Azerbaijan|Bahrain|Bangladesh|Cambodia|China|Cyprus|Georgia|India|Indonesia|Iran|Iraq|Israel|Japan|Jordan|Kuwait|Lebanon|Malaysia|Myanmar|Nepal|North Korea|Oman|Pakistan|Palestine|Philippines|Qatar|Saudi Arabia|Singapore|South Korea|Sri Lanka|Syria|Thailand|Turkey|United Arab Emirates|Vietnam|Yemen|Taiwan",aliases={"asia","asian country","countries in asia","아시아","아시아 나라","아시아 국가"}},
 ["유럽 국가"]={words="Andorra|Liechtenstein|San Marino|Malta|Moldova|Montenegro|Monaco|Luxembourg|Albania|Austria|Belarus|Belgium|Bosnia and Herzegovina|Bulgaria|Croatia|Czechia|Denmark|Estonia|Finland|France|Germany|Greece|Hungary|Iceland|Ireland|Italy|Latvia|Lithuania|Netherlands|North Macedonia|Norway|Poland|Portugal|Romania|Russia|Serbia|Slovakia|Slovenia|Spain|Sweden|Switzerland|Ukraine|United Kingdom|Vatican City|Kosovo",aliases={"europe","european country","countries in europe","유럽","유럽 나라","유럽 국가"}},
 ["아프리카 국가"]={words="Comoros|Sao Tome and Principe|Eswatini|Lesotho|Djibouti|Cabo Verde|Seychelles|Mauritius|Gabon|Benin|Togo|Malawi|Burundi|Algeria|Angola|Botswana|Burkina Faso|Cameroon|Central African Republic|Chad|Democratic Republic of the Congo|Republic of the Congo|Egypt|Equatorial Guinea|Eritrea|Ethiopia|Gambia|Ghana|Guinea|Guinea-Bissau|Ivory Coast|Kenya|Liberia|Libya|Madagascar|Mali|Mauritania|Morocco|Mozambique|Namibia|Niger|Nigeria|Rwanda|Senegal|Sierra Leone|Somalia|South Africa|South Sudan|Sudan|Tanzania|Tunisia|Uganda|Zambia|Zimbabwe",aliases={"africa","african country","countries in africa","아프리카","아프리카 나라","아프리카 국가"}},
 ["북아메리카 국가"]={words="Saint Kitts and Nevis|Dominica|Saint Vincent and the Grenadines|Antigua and Barbuda|Grenada|Saint Lucia|Barbados|Belize|Bahamas|Trinidad and Tobago|Costa Rica|Cuba|Dominican Republic|El Salvador|Guatemala|Haiti|Honduras|Jamaica|Nicaragua|Panama|Canada|Mexico|United States",aliases={"north america","north american country","countries in north america","북미","북아메리카","북아메리카 국가"}},
 ["남아메리카 국가"]={words="Suriname|Guyana|Paraguay|Uruguay|Bolivia|Ecuador|Peru|Chile|Colombia|Venezuela|Argentina|Brazil",aliases={"south america","south american country","countries in south america","남미","남아메리카","남아메리카 국가"}},
 ["오세아니아 국가"]={words="Tuvalu|Nauru|Kiribati|Palau|Marshall Islands|Micronesia|Vanuatu|Tonga|Samoa|Solomon Islands|Fiji|Papua New Guinea|New Zealand|Australia",aliases={"oceania","oceanian country","oceanic country","countries in oceania","오세아니아","대양주","오세아니아 국가"}},
}
for _,row in ipairs(extraTopics) do
 local region=continentalData[row.title]
 if region then
  row.words=region.words
  for _,alias in ipairs(region.aliases) do row.aliases[#row.aliases+1]=alias end
 end
end
local additionalArtists={{"michael jackson","마이클 잭슨","마이클잭슨","MJ"},{"dua lipa","두아 리파","두아리파"},{"ed sheeran","에드 시런","에드시런"},{"bruno mars","브루노 마스","브루노마스"},{"adele","아델"},{"rihanna","리한나"},{"beyonce","비욘세","beyoncé"},{"lady gaga","레이디 가가","레이디가가"},{"justin bieber","저스틴 비버","저스틴비버"},{"justin timberlake","저스틴 팀버레이크","저스틴팀버레이크"},{"britney spears","브리트니 스피어스","브리트니스피어스"},{"katy perry","케이티 페리","케이티페리"},{"coldplay","콜드플레이"},{"queen","퀸"},{"the beatles","비틀즈","비틀스","beatles"},{"abba","아바"},{"imagine dragons","이매진 드래곤스","이매진드래곤스"},{"maroon 5","마룬 파이브","마룬5","마룬 5"},{"linkin park","린킨 파크","린킨파크"},{"oasis","오아시스"},{"nirvana","너바나","니르바나"},{"red velvet","레드벨벳","레드 벨벳"},{"twice","트와이스"},{"seventeen","세븐틴"},{"exo","엑소"},{"newjeans","뉴진스","new jeans"}}
local songDisplayNames={["michael jackson"]="마이클 잭슨 노래",["dua lipa"]="두아 리파 노래",["ed sheeran"]="에드 시런 노래",["bruno mars"]="브루노 마스 노래",["adele"]="아델 노래",["rihanna"]="리한나 노래",["beyonce"]="비욘세 노래",["lady gaga"]="레이디 가가 노래",["justin bieber"]="저스틴 비버 노래",["justin timberlake"]="저스틴 팀버레이크 노래",["britney spears"]="브리트니 스피어스 노래",["katy perry"]="케이티 페리 노래",["coldplay"]="콜드플레이 노래",["queen"]="퀸 노래",["the beatles"]="비틀즈 노래",["abba"]="아바 노래",["imagine dragons"]="이매진 드래곤스 노래",["maroon 5"]="마룬 파이브 노래",["linkin park"]="린킨 파크 노래",["oasis"]="오아시스 노래",["nirvana"]="너바나 노래",["red velvet"]="레드벨벳 노래",["twice"]="트와이스 노래",["seventeen"]="세븐틴 노래",["exo"]="엑소 노래",["newjeans"]="뉴진스 노래"}
songs["michael jackson"]="Threatened|2000 Watts|Privacy|Don't Walk Away|The Lost Children|Whatever Happens|You Are My Life|Heaven Can Wait|Break of Dawn|Unbreakable|Heartbreaker|Invincible|Butterflies|Speechless|Cry|You Rock My World|Why You Wanna Trip on Me|She Drives Me Wild|Can't Let Her Get Away|Keep the Faith|Gone Too Soon|Jam|In the Closet|Remember the Time|Heal the World|Black or White|Who Is It|Give In to Me|Will You Be There|Dangerous|D.S.|Money|Tabloid Junkie|2 Bad|Little Susie|Smile|Childhood|History|This Time Around|Come Together|Earth Song|They Don't Care About Us|Stranger in Moscow|Scream|You Are Not Alone|Morphine|Superfly Sister|Ghosts|Is It Scary|Blood on the Dance Floor|Speed Demon|Liberian Girl|Just Good Friends|Another Part of Me|Leave Me Alone|Dirty Diana|Smooth Criminal|Bad|The Way You Make Me Feel|Man in the Mirror|I Just Can't Stop Loving You|Baby Be Mine|The Lady in My Life|Human Nature|P.Y.T. (Pretty Young Thing)|The Girl Is Mine|Wanna Be Startin' Somethin'|Thriller|Beat It|Billie Jean|Girlfriend|Get on the Floor|It's the Falling in Love|Burn This Disco Out|I Can't Help It|Workin' Day and Night|She's Out of My Life|Rock with You|Don't Stop 'Til You Get Enough|Love Never Felt So Good|Chicago|Loving You|A Place with No Name|Slave to the Rhythm|Do You Know Where Your Children Are|Blue Gangsta|Xscape|Hold My Hand|Hollywood Tonight|Best of Joy|I Like the Way You Love Me|Another Day|Behind the Mask|Much Too Soon|Got to Be There|Rockin' Robin|I Wanna Be Where You Are|Ain't No Sunshine|Ben|People Make the World Go Round|With a Child's Heart|Music and Me|Happy|One Day in Your Life|We're Almost There|Just a Little Bit of You|Dapper-Dan|We've Got Forever|I'll Come Home to You|You Are There|Farewell My Summer Love|Girl You're So Together|For All Time|Streetwalker|Fly Away|Carousel|Someone in the Dark|Scared of the Moon|Cheater|Sunset Driver|We Are Here to Change the World|On the Line|Fall Again|Beautiful Girl|The Way You Love Me|We've Had Enough|Shout|One More Chance|This Is It"
songs["dua lipa"]="Genesis|Garden|Homesick|Thinking 'Bout You|New Rules|IDGAF|Be the One|Don't Start Now|Physical|Levitating|Hallucinate|Love Again|Future Nostalgia|Pretty Please|Break My Heart|Cool|Houdini|Training Season|Illusion"
songs["ed sheeran"]="Afire Love|Tenerife Sea|Photograph|Bloodstream|I'm a Mess|Thinking Out Loud|The A Team|Lego House|Drunk|Give Me Love|Small Bump|Kiss Me|I See Fire|Castle on the Hill|Galway Girl|Perfect|Happier|Dive|Nancy Mulligan|Supermarket Flowers|Shivers|Bad Habits|Eyes Closed"
songs["bruno mars"]="Talking to the Moon|Liquor Store Blues|Somewhere in Brooklyn|The Other Side|Our First Time|Runaway Baby|Count on Me|Marry You|Grenade|Just the Way You Are|The Lazy Song|When I Was Your Man|Locked Out of Heaven|Treasure|Gorilla|Moonshine|Young Girls|Natalie|Money Make Her Smile|If I Knew|24K Magic|Chunky|Versace on the Floor|Too Good to Say Goodbye|Finesse|That's What I Like"
songs["adele"]="Hometown Glory|Daydreamer|Melt My Heart to Stone|Cold Shoulder|Tired|Right as Rain|Best for Last|My Same|Chasing Pavements|Make You Feel My Love|Rolling in the Deep|Rumour Has It|Turning Tables|Don't You Remember|Set Fire to the Rain|He Won't Go|Take It All|One and Only|Lovesong|Someone Like You|Hello|I Miss You|River Lea|Remedy|Water Under the Bridge|Million Years Ago|All I Ask|When We Were Young|Easy on Me|Oh My God|I Drink Wine|To Be Loved"
songs["rihanna"]="Cold Case Love|Fire Bomb|Russian Roulette|Photographs|Te Amo|Hard|Rude Boy|Disturbia|Rehab|Breakin' Dishes|Take a Bow|Umbrella|Don't Stop the Music|Unfaithful|SOS|Pon de Replay|Man Down|California King Bed|Cheers (Drink to That)|Only Girl (In the World)|What's My Name?|We Found Love|Where Have You Been|Diamonds|Stay|Love on the Brain|Needed Me|Kiss It Better|Consideration|Desperado|Higher|Close to You"
songs["beyonce"]="Sandcastles|Love Drought|All Night|Pray You Catch Me|Daddy Lessons|Freedom|Formation|Hold Up|Sorry|Don't Hurt Yourself|Halo|Sweet Dreams|Broken-Hearted Girl|If I Were a Boy|Diva|Single Ladies|Irreplaceable|Deja Vu|Upgrade U|Green Light|Get Me Bodied|Crazy in Love|Baby Boy|Me, Myself and I|Dangerously in Love 2|Listen|Love on Top|Countdown|End of Time|1+1|I Care|I Was Here|Cuff It|Break My Soul|Alien Superstar|Virgo's Groove"
songs["lady gaga"]="Speechless|So Happy I Could Die|Teeth|Dance in the Dark|Monster|Bad Romance|Alejandro|Telephone|Paparazzi|Poker Face|Just Dance|LoveGame|Eh, Eh (Nothing Else I Can Say)|Brown Eyes|Summerboy|Born This Way|Judas|Marry the Night|The Edge of Glory|You and I|Hair|Scheisse|Government Hooker|Bloody Mary|Heavy Metal Lover|Applause|Venus|G.U.Y.|Dope|Gypsy|Million Reasons|Perfect Illusion|Joanne|Shallow|Always Remember Us This Way|Rain on Me|Stupid Love|911|Replay"
songs["justin bieber"]="Nothing Like Us|All That Matters|Heartbreaker|Recovery|Bad Day|All Bad|Change Me|Confident|One Life|Flatline|Baby|One Time|One Less Lonely Girl|Love Me|Somebody to Love|U Smile|Never Say Never|Pray|Boyfriend|As Long as You Love Me|Beauty and a Beat|Be Alright|Fall|All Around the World|What Do You Mean?|Sorry|Love Yourself|Company|Purpose|Life Is Worth Living|Mark My Words|Ghost|Hold On|Peaches|Anyone|Lonely|Holy"
songs["justin timberlake"]="Strawberry Bubblegum|Blue Ocean Floor|Pusher Love Girl|Spaceship Coupe|Don't Hold the Wall|That Girl|Tunnel Vision|Mirrors|Suit & Tie|Cry Me a River|Rock Your Body|Like I Love You|Senorita|Still on My Brain|Never Again|SexyBack|My Love|LoveStoned|What Goes Around... Comes Around|Summer Love|Until the End of Time|Chop Me Up|Losing My Way|Drink You Away|Not a Bad Thing|TKO|Take Back the Night|Can't Stop the Feeling!|Say Something"
songs["britney spears"]="Breathe on Me|Touch of My Hand|Everytime|Early Mornin'|Showdown|The Hook Up|Toxic|Me Against the Music|Outrageous|Born to Make You Happy|Sometimes|Lucky|Stronger|Don't Let Me Be the Last to Know|Oops!... I Did It Again|I'm a Slave 4 U|Overprotected|I'm Not a Girl, Not Yet a Woman|Anticipating|Lonely|Gimme More|Piece of Me|Break the Ice|Get Naked (I Got a Plan)|Freakshow|Heaven on Earth|Womanizer|Circus|If U Seek Amy|Unusual You|3|Hold It Against Me|Till the World Ends|I Wanna Go|Criminal"
songs["katy perry"]="Lost|I'm Still Breathing|Thinking of You|Mannequin|Fingerprints|Waking Up in Vegas|Hot n Cold|I Kissed a Girl|One of the Boys|Teenage Dream|California Gurls|Firework|E.T.|Last Friday Night (T.G.I.F.)|The One That Got Away|Pearl|Hummingbird Heartbeat|Who Am I Living For?|Not Like the Movies|Wide Awake|Part of Me|Roar|Dark Horse|Unconditionally|Walking on Air|Birthday|This Moment|By the Grace of God|Chained to the Rhythm|Never Really Over|Daisies"
songs["coldplay"]="Amsterdam|Warning Sign|Green Eyes|A Rush of Blood to the Head|A Whisper|The Scientist|Clocks|In My Place|Politik|Sparks|Trouble|Shiver|Yellow|Spies|Everything's Not Lost|Don't Panic|Fix You|Speed of Sound|Talk|The Hardest Part|Swallowed in the Sea|Viva la Vida|Violet Hill|Strawberry Swing|Lovers in Japan|Death and All His Friends|Charlie Brown|Every Teardrop Is a Waterfall|Paradise|Magic|O|A Sky Full of Stars|Everglow|Adventure of a Lifetime|Hymn for the Weekend"
songs["queen"]="The March of the Black Queen|The Fairy Feller's Master-Stroke|Nevermore|White Queen (As It Began)|Ogre Battle|Seven Seas of Rhye|Killer Queen|Now I'm Here|Stone Cold Crazy|Lily of the Valley|Brighton Rock|Bohemian Rhapsody|You're My Best Friend|'39|Love of My Life|The Prophet's Song|Death on Two Legs|Somebody to Love|Good Old-Fashioned Lover Boy|You Take My Breath Away|We Are the Champions|We Will Rock You|Spread Your Wings|It's Late|Don't Stop Me Now|Bicycle Race|Fat Bottomed Girls|Save Me|Play the Game|Another One Bites the Dust|Crazy Little Thing Called Love|Under Pressure|Radio Ga Ga|I Want to Break Free|Who Wants to Live Forever|The Show Must Go On"
songs["the beatles"]="For No One|Here, There and Everywhere|I'm Only Sleeping|And Your Bird Can Sing|She Said She Said|Tomorrow Never Knows|Got to Get You into My Life|Eleanor Rigby|Norwegian Wood|In My Life|Nowhere Man|Girl|Michelle|Drive My Car|You Won't See Me|The Word|Here Comes the Sun|Something|Because|You Never Give Me Your Money|Golden Slumbers|Carry That Weight|The End|Come Together|Octopus's Garden|Blackbird|Mother Nature's Son|I Will|Julia|Dear Prudence|Helter Skelter|Happiness Is a Warm Gun|While My Guitar Gently Weeps|A Day in the Life|Lucy in the Sky with Diamonds|She's Leaving Home|With a Little Help from My Friends|Penny Lane|Strawberry Fields Forever|Hey Jude|Let It Be|Yesterday|Help!"
songs["abba"]="The Visitors|The Day Before You Came|I Let the Music Speak|One of Us|When All Is Said and Done|Soldiers|Slipping Through My Fingers|Our Last Summer|Andante, Andante|Happy New Year|Super Trouper|The Winner Takes It All|Lay All Your Love on Me|The Piper|Dancing Queen|Mamma Mia|S.O.S.|Knowing Me, Knowing You|Take a Chance on Me|The Name of the Game|Eagle|Thank You for the Music|Money, Money, Money|Fernando|Chiquitita|Does Your Mother Know|Voulez-Vous|Gimme! Gimme! Gimme! (A Man After Midnight)|I Have a Dream|Waterloo"
songs["imagine dragons"]="Amsterdam|Hear Me|Bleeding Out|Nothing Left to Say|Rocks|Round and Round|My Fault|Tiptoe|Demons|It's Time|Radioactive|On Top of the World|Shots|Gold|Smoke and Mirrors|Dream|I'm So Sorry|I Bet My Life|Polaroid|Hopeless Opus|Believer|Thunder|Whatever It Takes|Walking the Wire|Next to Me|Natural|Bad Liar|Zero|Birds|Wrecked|Follow You|Enemy|Bones|Sharks"
songs["maroon 5"]="Must Get Out|Secret|Through with You|Not Coming Home|Sweetest Goodbye|Sunday Morning|She Will Be Loved|This Love|Harder to Breathe|Shiver|Makes Me Wonder|Wake Up Call|Won't Go Home Without You|Nothing Lasts Forever|Little of Your Time|Goodnight Goodnight|If I Never See Your Face Again|Misery|Never Gonna Leave This Bed|Give a Little More|Stutter|Moves Like Jagger|One More Night|Payphone|Daylight|Love Somebody|Maps|Animals|Sugar|It Was Always You|Unkiss Me|Cold|What Lovers Do|Wait|Girls Like You|Memories"
songs["linkin park"]="Forgotten|By Myself|With You|Runaway|Pushing Me Away|A Place for My Head|Papercut|One Step Closer|Crawling|In the End|Points of Authority|Cure for the Itch|Figure.09|Hit the Floor|Nobody's Listening|Easier to Run|Breaking the Habit|Faint|Numb|Somewhere I Belong|From the Inside|Lying from You|Bleed It Out|Given Up|Leave Out All the Rest|Shadow of the Day|What I've Done|The Little Things Give You Away|Waiting for the End|The Catalyst|Iridescent|Burning in the Skies|Lost in the Echo|Castle of Glass|Powerless|Final Masquerade|One More Light"
songs["oasis"]="The Masterplan|Acquiesce|Half the World Away|Talk Tonight|Rockin' Chair|Listen Up|Fade Away|Stay Young|Whatever|Slide Away|Live Forever|Supersonic|Shakermaker|Cigarettes & Alcohol|Rock 'n' Roll Star|Married with Children|Columbia|Cast No Shadow|Some Might Say|Don't Look Back in Anger|Wonderwall|Champagne Supernova|Morning Glory|She's Electric|Hey Now!|Roll with It|D'You Know What I Mean?|Stand by Me|Don't Go Away|All Around the World|Stop Crying Your Heart Out|Little by Little|The Hindu Times|Songbird|Lyla|The Importance of Being Idle"
songs["nirvana"]="Aneurysm|Dive|Sliver|Molly's Lips|Son of a Gun|Been a Son|Sappy|You Know You're Right|About a Girl|Blew|School|Love Buzz|Negative Creep|Lithium|Drain You|Lounge Act|On a Plain|Stay Away|Territorial Pissings|Polly|Something in the Way|In Bloom|Come as You Are|Smells Like Teen Spirit|Serve the Servants|Scentless Apprentice|Frances Farmer Will Have Her Revenge on Seattle|Dumb|Very Ape|Milk It|Pennyroyal Tea|Radio Friendly Unit Shifter|Tourette's|All Apologies|Heart-Shaped Box"
songs["red velvet"]="Kingdom Come|Body Talk|Sunny Side Up!|In & Out|I Just|Cool World|Automatic|Be Natural|One of These Nights|Little Little|You Better Know|Look|Perfect 10|Time to Love|So Good|Butterflies|Eyes Locked, Hands Locked|LP|Bamboleo|Rainbow Halo|In My Dreams|Birthday|Psycho|Bad Boy|Peek-A-Boo|Russian Roulette|Red Flavor|Dumb Dumb|Ice Cream Cake|Feel My Rhythm|Chill Kill|Cosmic"
songs["twice"]="Love Foolish|Get Loud|Trick It|Make Me Go|Shadow|Oxygen|Hell in Heaven|Up No More|Behind the Mask|Say Something|Handle It|Depend on You|Cry for Me|Moonlight|Icon|Cruel|F.I.L.A.|Rewind|Espresso|Last Waltz|Cactus|Basics|Gone|Brave|Talk That Talk|Feel Special|Fancy|I Can't Stop Me|What Is Love?|Dance the Night Away|Likey|TT|Cheer Up|Yes or Yes|Heart Shaker|Scientist|The Feels|Set Me Free|One Spark"
songs["seventeen"]="Kidult|Together|Habit|Pinwheel|Don't Listen in Secret|Hug|Smile Flower|Our Dawn Is Hotter Than Day|Campfire|Good to Me|Getting Closer|Fearless|I Don't Know|Lie Again|Second Life|Lucky|My My|Heaven's Cloud|Anyone|To You|Imperfect Love|Crush|Rock with You|Ready to Love|Home|Fear|Thanks|Don't Wanna Cry|Very Nice|Mansae|Pretty U|Adore U|Clap|Left & Right|Hot|Super|God of Music|Maestro"
songs["exo"]="Baby Don't Cry|My Lady|Heart Attack|Black Pearl|Don't Go|Peter Pan|Lucky|Thunder|Moonlight|Love, Love, Love|El Dorado|What If..|My Answer|Lady Luck|Transformer|Playboy|Artificial Love|White Noise|She's Dreaming|Heaven|The Eve|Forever|Walk on Memories|Been Through|Stay|Fall|Lights Out|Gravity|Ooh La La La|Oasis|Bad Dream|Ya Ya Ya|Groove|Obsession|Love Shot|Tempo|Ko Ko Bop|Monster|Call Me Baby|Growl|Overdose"
songs["newjeans"]="Hurt|Cookie|Attention|Hype Boy|Ditto|OMG|New Jeans|Super Shy|ETA|Cool with You|Get Up|ASAP|Bubble Gum|How Sweet|Right Now|Supernatural|Beautiful Restriction|Our Night Is More Beautiful Than Your Day|GODS|Zero"

local longAnswerAdditions={
 ["나라"]="Democratic Republic of Sao Tome and Principe|Federated States of Micronesia|Republic of the Marshall Islands|Democratic Republic of Timor-Leste|Saint Vincent and the Grenadines|Democratic Republic of the Congo",
 ["아프리카 국가"]="Democratic Republic of Sao Tome and Principe|Democratic Republic of the Congo|Central African Republic|Republic of Equatorial Guinea",
 ["아시아 국가"]="Democratic Republic of Timor-Leste|Lao People's Democratic Republic|Democratic Socialist Republic of Sri Lanka|Brunei Darussalam",
 ["오세아니아 국가"]="Federated States of Micronesia|Republic of the Marshall Islands|Independent State of Papua New Guinea|Republic of Kiribati",
 ["북아메리카 국가"]="Federation of Saint Kitts and Nevis|Antigua and Barbuda|Saint Vincent and the Grenadines|Republic of Trinidad and Tobago",
 ["남아메리카 국가"]="Cooperative Republic of Guyana|Republic of Suriname|Plurinational State of Bolivia|Oriental Republic of Uruguay",
 ["아메리카 국가"]="Federation of Saint Kitts and Nevis|Saint Vincent and the Grenadines|Cooperative Republic of Guyana|Republic of Trinidad and Tobago",
 ["도시"]="San Cristobal de La Laguna|Santiago de Compostela|Reggio nell'Emilia|Castellammare di Stabia|San Miguel de Allende|San Cristobal de las Casas|San Carlos de Bariloche|San Salvador de Jujuy|Vila Real de Santo Antonio",
 ["유럽 도시"]="San Cristobal de La Laguna|Santiago de Compostela|Castellammare di Stabia|Vila Real de Santo Antonio|Frankfurt an der Oder|Bad Homburg vor der Hohe|Bietigheim-Bissingen|Villingen-Schwenningen",
 ["일본 도시"]="Minamisatsuma|Minamikyushu|Kitaibaraki|Higashihiroshima|Hitachinaka|Sanyo-Onoda|Aizuwakamatsu|Nishinoomote|Minamishimabara",
 ["미국 도시"]="San Luis Obispo|Truth or Consequences|Rancho Cucamonga|King of Prussia|Fuquay-Varina|Winston-Salem|Bonita Springs|Tarpon Springs|Natchitoches",
 ["동물"]="Northern hairy-nosed wombat|Southern hairy-nosed wombat|Screaming hairy armadillo|Pink fairy armadillo|Sunda flying lemur|Golden-rumped elephant shrew|White-throated woodrat|Black-and-rufous elephant shrew|Spectacled flying fox|Long-eared jerboa",
 ["포유류"]="Northern hairy-nosed wombat|Southern hairy-nosed wombat|Screaming hairy armadillo|Golden-rumped elephant shrew|Sunda flying lemur|Spectacled flying fox|White-throated woodrat|Black-and-rufous elephant shrew",
 ["유대류"]="Northern hairy-nosed wombat|Southern hairy-nosed wombat|Brush-tailed phascogale|Long-nosed potoroo|Yellow-footed antechinus|Red-tailed phascogale|Eastern barred bandicoot",
 ["사막 동물"]="Brush-tailed mulgara|Fat-tailed dunnart|Short-beaked echidna|Greater Egyptian jerboa|Long-eared jerboa|Sandhill dunnart|Dama gazelle|Arabian oryx",
 ["멸종 동물"]="Steller's sea cow|Caribbean monk seal|Schomburgk's deer|Bubal hartebeest|Falkland Islands wolf|Bluebuck|Laughing owl|Carolina parakeet|Heath hen|New Zealand quail",
 ["영장류"]="Golden-headed lion tamarin|Black-faced lion tamarin|Golden-crowned sifaka|Silky sifaka|Red-shanked douc|Gray-shanked douc|Golden snub-nosed monkey|Tonkin snub-nosed monkey|Proboscis monkey",
 ["고양잇과"]="Flat-headed cat|Rusty-spotted cat|Black-footed cat|Geoffroy's cat|Andean mountain cat|Bornean bay cat|Sunda clouded leopard|Asian golden cat",
 ["새"]="Ribbon-tailed astrapia|Twelve-wired bird-of-paradise|Greater superb bird-of-paradise|Blue-capped cordon-bleu|Violet-crowned woodnymph|Rufous-bellied chachalaca|Greater double-collared sunbird|Standard-winged nightjar",
 ["물새"]="White-faced whistling duck|Fulvous whistling duck|Rufous-bellied heron|Boat-billed heron|Bare-throated tiger heron|African jacana|Black-necked grebe|Great crested grebe",
 ["맹금류"]="Black-and-chestnut eagle|Black-and-white hawk-eagle|Rufous-bellied hawk-eagle|African harrier-hawk|African cuckoo-hawk|Long-crested eagle",
 ["물고기"]="Psychedelic frogfish|Ornate ghost pipefish|Mediterranean parrotfish|Red-lipped batfish|Spotted handfish|Splendid toadfish|Longsnout seahorse|Leafy seadragon|Sargassumfish",
 ["상어"]="Tasselled wobbegong|Spotted wobbegong|Ornate wobbegong|Longnose velvet dogfish|Blotched catshark|Pyjama shark|Epaulette shark|Viper dogfish|Smalltooth sand tiger|Bluntnose sixgill shark",
 ["해양 동물"]="Scaly-foot gastropod|Vampire squid|Southern elephant seal|Northern elephant seal|Dumbo octopus|Giant Pacific octopus|Japanese spider crab|Giant siphonophore|Christmas tree worm",
 ["곤충·벌레"]="Queen Alexandra's birdwing|Madagascan sunset moth|Hummingbird hawk-moth|Death's-head hawkmoth|Hercules beetle|Elephant beetle|Saddleback caterpillar|Red-banded leafhopper|Giraffe weevil|Golden tortoise beetle",
 ["나비"]="Queen Alexandra's birdwing|Rajah Brooke's birdwing|Purple-spotted swallowtail|Queen of Spain fritillary|Green-banded urania|Emerald swallowtail|Palos Verdes blue|Schaus' swallowtail",
 ["딱정벌레"]="Rainbow scarab beetle|Golden tortoise beetle|Satan beetle|Neptune beetle|Harlequin beetle|Sacred scarab|European rose chafer|Eastern Hercules beetle|Giraffe stag beetle",
 ["거미류"]="Brazilian salmon pink birdeater|Goliath birdeater|Greenbottle blue tarantula|Cobalt blue tarantula|Golden silk orb-weaver|Spiny-backed orb-weaver|Regal jumping spider",
 ["파충류"]="Mata mata turtle|Pig-nosed turtle|Alligator snapping turtle|Satanic leaf-tailed gecko|Mossy leaf-tailed gecko|Leaf-tailed gecko|Frilled-neck lizard|Rough-scaled bush viper",
 ["양서류"]="Chinese giant salamander|Japanese giant salamander|Anderson's crocodile newt|Vietnamese mossy frog|Amazon milk frog|Vietnamese crocodile newt|Purple frog|Surinam toad",
 ["뱀"]="Madagascar leaf-nosed snake|Dragon snake|Rhinoceros rat snake|Red-tailed green rat snake|Blue Malayan coral snake|Emerald tree boa|Mangrove pit viper",
 ["도마뱀"]="Satanic leaf-tailed gecko|Mossy leaf-tailed gecko|Madagascar giant day gecko|Prehensile-tailed skink|Mexican alligator lizard|Rough-throated leaf-tailed gecko",
 ["거북"]="Northern snake-necked turtle|Eastern long-necked turtle|Mary River turtle|Roti Island snake-necked turtle|Alligator snapping turtle|Madagascar big-headed turtle",
 ["반려동물"]="Bourke's parakeet|White-bellied caique|Black-headed caique|Green-cheeked conure|Black-cheeked lovebird|Blue-tongued skink|African pygmy hedgehog|Chinese striped hamster",
 ["개 품종"]="Petit Basset Griffon Vendeen|Grand Basset Griffon Vendeen|Grand Bleu de Gascogne|Petit Bleu de Gascogne|Basset Fauve de Bretagne|Chien Francais Tricolore|Nederlandse Kooikerhondje|Perro de Presa Canario|Nova Scotia Duck Tolling Retriever|Cao da Serra de Aires",
 ["고양이 품종"]="Norwegian Forest Cat|American Wirehair|British Longhair|Oriental Longhair|European Shorthair|Ukrainian Levkoy|Kurilian Bobtail|Havana Brown|Australian Mist|Aegean cat",
 ["꽃"]="Bleeding heart|Lily of the valley|Love-in-a-mist|Love-lies-bleeding|Black-eyed Susan|Queen Anne's lace|Bird of paradise|Lily of the Incas|Jack-in-the-pulpit|Forget-me-not",
 ["나무"]="Madagascar dragon tree|Monterey cypress|Dawn redwood|Monkey puzzle tree|Chinese parasol tree|Japanese umbrella pine|Rainbow eucalyptus|Cannonball tree|Socotra dragon tree",
 ["실내 식물"]="String of turtles|String of hearts|String of pearls|Bird's nest fern|Staghorn fern|Maidenhair fern|Chinese money plant|Purple passion plant|Rattlesnake plant|Swiss cheese plant",
 ["버섯"]="Chicken of the woods|Hen of the woods|Amethyst deceiver|Collared earthstar|Shaggy parasol|Velvet shank|Bleeding tooth fungus|Devil's fingers|Scarlet elf cup",
 ["과일"]="White-fleshed pitahaya|Yellow dragon fruit|Purple mangosteen|Malabar tamarind|Ceylon gooseberry|Governor's plum|African star apple|Black velvet tamarind|Burmese grape|Velvet apple",
 ["채소"]="Jerusalem artichoke|Chinese water chestnut|Belgian endive|Italian dandelion|Japanese bunching onion|Chinese flowering cabbage|Purple sprouting broccoli|Hamburg parsley",
 ["향신료"]="Grains of paradise|Long pepper|Tasmanian pepperberry|Ethiopian cardamom|Black cardamom|Szechuan pepper|Urfa biber|Aleppo pepper|Kashmiri chili",
 ["허브"]="Mexican tarragon|Vietnamese coriander|Culantro|Lemon verbena|Lemon balm|Pineapple sage|Chocolate mint|Apple mint|Greek mountain tea|Sweet woodruff",
 ["음식"]="Imam bayildi|Hunkar begendi|Cochinita pibil|Chiles en nogada|Bun bo Hue|Bun rieu cua|Hu tieu Nam Vang|Banh cuon Thanh Tri|Khao khluk kapi|Kaeng som cha-om|Acaraje|Tacaca|Moqueca capixaba|Pasta alla puttanesca|Coda alla vaccinara",
 ["한국 음식"]="누룽지해물탕|들깨시래기된장국|우렁쌈밥|낙지연포탕|능이버섯닭백숙|메밀전병|콩비지감자탕|흑임자타락죽|수수팥경단|송이버섯전골",
 ["디저트"]="Galaktoboureko|Galatopita|Kaiserschmarrn|Salzburger Nockerl|Salzburger Mozartkugel|Aranygaluska|Rakott palacsinta|Flodni|Dampfnudel|Dresdner Eierschecke|Quarkkeulchen|Rote Grutze mit Vanillesauce",
 ["치즈"]="Sainte-Maure de Touraine|Pouligny-Saint-Pierre|Crottin de Chavignol|Fourme de Montbrison|Fourme d'Ambert|Bleu des Causses|Bleu de Gex|Tomme de Savoie|Ossau-Iraty|Queso de Valdeon|Queijo Serra da Estrela",
 ["샌드위치"]="Mozzarella in carrozza|Bocadillo de calamares|Bocadillo de tortilla|Sandwich de miga|Serranito|Pan con chicharron|Pan con pejerrey|Chivito canadiense|Banh mi xiu mai|Banh mi thit nuong",
 ["소스"]="Salsa alla puttanesca|Salsa di noci|Salsa bagnet verd|Sauce gribiche|Sauce charcutiere|Sauce perigourdine|Sauce bigarade|Sauce maltaise|Sauce chasseur|Sauce soubise|Sauce mousseline|Salsa huancaina|Salsa macha|Aji de huacatay",
 ["빵"]="Pane di Altamura|Pane di Genzano|Pane carasau|Pane guttiau|Pane casareccio|Pain de campagne|Pain d'epices|Pain viennois|Pao de queijo|Bolo do caco|Broa de milho|Pao alentejano|Dampfnudel|Franzbrotchen",
 ["페이스트리"]="Kouign-amann|Sfogliatella riccia|Sfogliatella frolla|Pasticciotto leccese|Zeppole di San Giuseppe|Cannoli siciliani|Paris-Brest|Gateau Saint-Honore|Pain aux raisins|Pain au chocolat|Pithiviers|Mille-feuille",
 ["파스타"]="Cappelletti|Tortelloni|Agnolotti del plin|Casoncelli|Pizzoccheri|Strozzapreti|Strangozzi|Scialatielli|Malloreddus|Lorighittas|Fregula|Culurgiones|Corzetti|Mafaldine|Radiatori",
 ["면 요리"]="Bun bo Hue|Bun rieu cua|Hu tieu Nam Vang|Cao lau Hoi An|Khao soi gai|Khao piak sen|Khanom chin nam ya|Laksa Sarawak|Hokkien prawn mee|Mee rebus|Char kway teow|Soto mie Bogor",
 ["그리스 음식"]="Kolokithokeftedes|Melitzanosalata|Kolokithopita|Lahanodolmades|Moschari kokkinisto|Kotosoupa avgolemono|Garides saganaki|Psarosoupa|Spanakorizo|Gemista me ryzi",
 ["튀르키예 음식"]="Hunkar begendi|Imam bayildi|Mercimek koftesi|Zeytinyagli enginar|Iskender kebab|Ali nazik kebab|Cokertme kebabi|Havuc dilimi baklava|Tavuk gogsu|Kazandibi",
 ["이탈리아 음식"]="Pasta alla puttanesca|Spaghetti alla nerano|Pasta con le sarde|Risotto alla milanese|Risotto al nero di seppia|Coda alla vaccinara|Saltimbocca alla romana|Fegato alla veneziana|Sarde in saor|Caponata siciliana",
 ["스페인 음식"]="Fabada asturiana|Cocido madrileno|Callos a la madrilena|Pulpo a la gallega|Pimientos de Padron|Gambas al ajillo|Patatas a la importancia|Bacalao al pil-pil|Bacalao a la vizcaina|Arroz a banda",
 ["일본 음식"]="Hitsumabushi|Hoto|Hachinoko|Kiritanpo nabe|Ishikari nabe|Shottsuru nabe|Jibuni|Keihan|Ise udon|Bara-zushi|Matsumaezuke|Goya champuru|Tofu champuru|Okinawa soba",
 ["중국 음식"]="Buddha Jumps Over the Wall|Dongpo pork|Lion's head meatballs|Squirrel-shaped mandarin fish|Beggar's chicken|Eight treasure duck|Chongqing spicy chicken|Twice-cooked pork|Steamed lion's head|Crossing-the-bridge noodles",
 ["인도 음식"]="Hyderabadi dum biryani|Lucknowi biryani|Thalassery biryani|Kashmiri dum aloo|Paneer lababdar|Methi malai matar|Sarson ka saag|Makki ki roti|Gatte ki sabzi|Dal baati churma|Mirchi ka salan",
 ["베트남 음식"]="Hu tieu Nam Vang|Bun rieu cua|Banh cuon Thanh Tri|Banh bot loc|Banh canh cua|Banh trang nuong|Banh trang tron|Banh xeo mien Tay|Cao lau Hoi An|Com hen Hue",
 ["영화"]="The Assassination of Jesse James by the Coward Robert Ford|The Englishman Who Went Up a Hill But Came Down a Mountain|The 100-Year-Old Man Who Climbed Out the Window and Disappeared|The Cook, the Thief, His Wife & Her Lover|The Discreet Charm of the Bourgeoisie|The Personal History of David Copperfield|The Life Aquatic with Steve Zissou|The Adventures of Buckaroo Banzai Across the 8th Dimension|A Pigeon Sat on a Branch Reflecting on Existence|Uncle Boonmee Who Can Recall His Past Lives",
 ["책"]="The Curious Incident of the Dog in the Night-Time|The Hundred-Year-Old Man Who Climbed Out the Window and Disappeared|The Unbearable Lightness of Being|The Hitchhiker's Guide to the Galaxy|The Guernsey Literary and Potato Peel Pie Society|The Long Way to a Small, Angry Planet|The Priory of the Orange Tree|The House in the Cerulean Sea|The Invisible Life of Addie LaRue",
 ["작가"]="Jorge Luis Borges|Gabriel Garcia Marquez|Mario Vargas Llosa|Miguel Angel Asturias|Jose Saramago|Clarice Lispector|Joao Guimaraes Rosa|Wisława Szymborska|Wislawa Szymborska|Zbigniew Herbert|Jaroslaw Iwaszkiewicz|Witold Gombrowicz|Olga Tokarczuk|Milorad Pavic|Danilo Kis",
 ["배우"]="Chiwetel Ejiofor|Djimon Hounsou|Gugu Mbatha-Raw|Adepero Oduye|Lupita Nyong'o|CCH Pounder|Barkhad Abdi|Sophie Okonedo|Benedict Wong|David Dastmalchian|Walton Goggins|Michael Stuhlbarg|Scoot McNairy|Jimmi Simpson|Garret Dillahunt",
 ["영화 감독"]="Apichatpong Weerasethakul|Alejandro Gonzalez Inarritu|Alfonso Gomez-Rejon|Alfonso Cuaron|Guillermo del Toro|Alejandro Amenabar|Miguel Gomes|Pedro Costa|Nuri Bilge Ceylan|Cristian Mungiu|Cristi Puiu|Corneliu Porumboiu|Radu Jude|Hong Sang-soo",
 ["과학자"]="Subrahmanyan Chandrasekhar|Cecilia Payne-Gaposchkin|Jocelyn Bell Burnell|Maria Goeppert Mayer|Emmy Noether|Chien-Shiung Wu|Satyendra Nath Bose|Meghnad Saha|Abdus Salam|Har Gobind Khorana|Venkatraman Ramakrishnan",
 ["수학자"]="Srinivasa Ramanujan|Sofia Kovalevskaya|Maryam Mirzakhani|Ingrid Daubechies|Olga Ladyzhenskaya|Karen Uhlenbeck|Jean-Pierre Serre|Alexander Grothendieck|Andrey Kolmogorov|Nikolai Lobachevsky",
 ["직업"]="Dendrochronologist|Paleoethnobotanist|Paleoclimatologist|Geochronologist|Biogeochemist|Neuropsychologist|Psycholinguist|Hydrogeologist|Radioastronomer|Geomorphologist|Medical entomologist|Forensic anthropologist|Architectural conservator|Transportation planner",
 ["악기"]="Ravanhatta|Nyckelharpa|Hardanger fiddle|Contrabass clarinet|Contrabass saxophone|Octocontrabass clarinet|Subcontrabass flute|Glass armonica|Bowed psaltery|Viola d'amore|Viola da gamba|Basset clarinet|Bass oboe|Heckelphone|Sopranino recorder",
 ["목관악기"]="Octocontrabass clarinet|Contrabass clarinet|Contra-alto clarinet|Basset clarinet|Bass oboe|Heckelphone|Subcontrabass flute|Hyperbass flute|Contrabass flute|Sopranino recorder",
 ["현악기"]="Hardanger fiddle|Viola d'amore|Viola da gamba|Viola pomposa|Viola da spalla|Bass viol|Arpeggione|Baryton|Tromba marina|Bowed psaltery|Swedish nyckelharpa",
 ["금관악기"]="Contrabass trombone|Contrabass bugle|Subcontrabass tuba|Cimbasso|Bass trumpet|Piccolo trumpet|Vienna horn|Alto trombone|Marching euphonium|Mellophone",
 ["원소"]="Praseodymium|Protactinium|Rutherfordium|Darmstadtium|Roentgenium|Copernicium|Livermorium|Moscovium|Tennessine|Oganesson|Dysprosium|Gadolinium",
 ["광물"]="Clinochlore|Clinohumite|Clinozoisite|Chrysoberyl|Chrysocolla|Chalcopyrite|Rhodochrosite|Rhodochrosite|Pyromorphite|Vanadinite|Mimetite|Hemimorphite|Prehnite|Aragonite",
 ["보석"]="Clinohumite|Chrysoberyl|Alexandrite|Demantoid garnet|Spessartine garnet|Tsavorite garnet|Paraiba tourmaline|Indicolite tourmaline|Chrome diopside|Andalusite|Sillimanite|Grandidierite",
 ["옷"]="Ulster coat|Inverness cape|Harrington jacket|Norfolk jacket|Donkey jacket|Nehru jacket|Eisenhower jacket|Chesterfield coat|Morning coat|Prince Charlie jacket|Fair Isle sweater|Argyle sweater|Letterman jacket",
 ["신발"]="Monk strap shoe|Double monk strap|Blucher shoe|Norwegian welt shoe|Wholecut Oxford|Spectator shoe|Jodhpur boot|Balmoral boot|Button boot|Engineer boot|Monkey boot",
 ["신발 브랜드"]="Maison Mihara Yasuhiro|The Last Conspiracy|Officine Creative|Premiata|Pantofola d'Oro|W6YZ|Bettanin & Venturi|Ducal|Silvano Lattanzi|Stefano Bemer|Santoni|Paolo Scafora",
 ["패션 브랜드"]="Comme des Garcons|Junya Watanabe|Yohji Yamamoto|Issey Miyake|Maison Mihara Yasuhiro|Maison Kitsune|Dries Van Noten|Ann Demeulemeester|Haider Ackermann|Rick Owens|Boris Bidjan Saberi|Carol Christian Poell",
 ["향수 브랜드"]="Maison Francis Kurkdjian|Editions de Parfums Frederic Malle|Juliette Has a Gun|Etat Libre d'Orange|L'Artisan Parfumeur|Histoires de Parfums|Les Liquides Imaginaires|Ormonde Jayne|Clive Christian|Maison Crivelli|Maison Violet",
 ["치킨 프랜차이즈"]="Church's Texas Chicken|Raising Cane's Chicken Fingers|Slim Chickens|Guthrie's Chicken|Zaxby's|Bojangles|Pollo Campero|Pollo Tropical|Bonchon Chicken|Pelicana Chicken|Goobne Chicken",
 ["카페 체인"]="The Coffee Bean & Tea Leaf|Gloria Jean's Coffees|The Coffee Academics|The Coffee Collective|Intelligentsia Coffee|Stumptown Coffee Roasters|Counter Culture Coffee|La Colombe Coffee Roasters|Blue Bottle Coffee|Coffee Supreme",
 ["시계 브랜드"]="Vacheron Constantin|Audemars Piguet|A. Lange & Sohne|Jaeger-LeCoultre|Girard-Perregaux|Frederique Constant|Raymond Weil|Maurice Lacroix|Ferdinand Berthoud|Laurent Ferrier|F.P. Journe|H. Moser & Cie.",
 ["TV 프로그램"]="The Repair Shop|The Great Pottery Throw Down|The Great British Sewing Bee|The Great British Bake Off|Mortimer & Whitehouse: Gone Fishing|Antiques Roadshow|The World's Most Extraordinary Homes|Amazing Hotels: Life Beyond the Lobby|George Clarke's Amazing Spaces|The Joy of Painting",
 ["해외 드라마"]="The Increasingly Poor Decisions of Todd Margaret|The Woman in the House Across the Street from the Girl in the Window|The Last Man on Earth|The Lost Flowers of Alice Hart|The Mysterious Benedict Society|Jonathan Strange & Mr Norrell|The Dark Crystal: Age of Resistance|Dirk Gently's Holistic Detective Agency|The Bastard Son & The Devil Himself",
 ["한국 드라마"]="괜찮아 사랑이야|그들이 사는 세상|내가 가장 예뻤을 때|이번 생은 처음이라|하늘에서 내리는 일억개의 별|일리 있는 사랑|날씨가 좋으면 찾아가겠어요|아무것도 하고 싶지 않아|어쩌다 발견한 하루|검색어를 입력하세요 WWW",
 ["예술 사조"]="Neo-Impressionism|Post-Impressionism|Abstract Expressionism|Analytical Cubism|Synthetic Cubism|Russian Constructivism|Neo-Plasticism|Metaphysical painting|Pre-Raphaelitism|Photorealism",
 ["비디오 게임"]="The Vanishing of Ethan Carter|The Unfinished Swan|What Remains of Edith Finch|The Forgotten City|The Sexy Brutale|The Case of the Golden Idol|Return of the Obra Dinn|The Excavation of Hob's Barrow|The Last Door|The Darkside Detective: A Fumble in the Dark|Nelly Cootalot: The Fowl Fleet",
 ["인디 게임"]="The Excavation of Hob's Barrow|The Case of the Golden Idol|The Darkside Detective: A Fumble in the Dark|Nelly Cootalot: The Fowl Fleet|The Rewinder|The Procession to Calvary|Four Last Things|The Supper|The Journey Down|The Last Door",
 ["퍼즐 게임"]="The Talos Principle 2|The Pedestrian|The Swapper|The Turing Test|The Entropy Centre|The Eyes of Ara|The Room Three|The Room: Old Sins|The Witness|The Gardens Between",
 ["공포 게임"]="The Vanishing of Ethan Carter|The Mortuary Assistant|The Town of Light|The Suicide of Rachel Foster|The Inpatient|The Beast Inside|The Sinking City|The Chant|The Dark Pictures Anthology: Little Hope|The Dark Pictures Anthology: House of Ashes",
 ["롤플레잉 게임"]="The Legend of Heroes: Trails in the Sky|The Legend of Heroes: Trails from Zero|The Legend of Heroes: Trails to Azure|The Legend of Heroes: Trails of Cold Steel|The Legend of Heroes: Trails into Reverie|Atelier Escha & Logy: Alchemists of the Dusk Sky|Atelier Shallie: Alchemists of the Dusk Sea|Atelier Sophie: The Alchemist of the Mysterious Book",
 ["닌텐도 게임 이름"]="The Legend of Zelda: A Link Between Worlds|The Legend of Zelda: Four Swords Adventures|Fire Emblem: Genealogy of the Holy War|Fire Emblem Echoes: Shadows of Valentia|Fire Emblem: Shadow Dragon and the Blade of Light|Advance Wars 2: Black Hole Rising|Sin and Punishment: Star Successor|Another Code: Recollection|The Legend of Zelda: Oracle of Seasons",
 ["드래곤 퀘스트 게임"]="Dragon Quest IV: Chapters of the Chosen|Dragon Quest V: Hand of the Heavenly Bride|Dragon Quest VI: Realms of Revelation|Dragon Quest VII: Fragments of the Forgotten Past|Dragon Quest VIII: Journey of the Cursed King|Dragon Quest IX: Sentinels of the Starry Skies|Dragon Quest XI: Echoes of an Elusive Age|Dragon Quest Monsters 2: Cobi's Journey|Dragon Quest Heroes: The World Tree's Woe and the Blight Below",
 ["파이널 판타지 게임"]="Final Fantasy Tactics: The War of the Lions|Final Fantasy Crystal Chronicles: The Crystal Bearers|Final Fantasy Crystal Chronicles: Ring of Fates|Final Fantasy Crystal Chronicles: Echoes of Time|Final Fantasy XII: Revenant Wings|Dirge of Cerberus: Final Fantasy VII|Crisis Core: Final Fantasy VII|Stranger of Paradise: Final Fantasy Origin",
 ["마이클 잭슨 노래"]="We've Had Enough|We Are Here to Change the World|Someone in the Dark|Don't Stop 'Til You Get Enough|Can't Let Her Get Away|Why You Wanna Trip on Me|Wanna Be Startin' Somethin'|I Just Can't Stop Loving You|Do You Know Where Your Children Are|Got the Hots|Don't Be Messin' 'Round|I'm So Blue|Song Groove (Abortion Papers)|Free|Price of Fame|Al Capone|If You Don't Love Me|Loving You",
 ["퀸 노래"]="The Fairy Feller's Master-Stroke|Good Old-Fashioned Lover Boy|I'm in Love with My Car|Bring Back That Leroy Brown|In the Lap of the Gods... Revisited|You Take My Breath Away|Who Wants to Live Forever|The Millionaire Waltz|Seaside Rendezvous",
 ["비틀즈 노래"]="Everybody's Got Something to Hide Except Me and My Monkey|The Continuing Story of Bungalow Bill|Being for the Benefit of Mr. Kite!|Everybody's Trying to Be My Baby|You've Got to Hide Your Love Away|I'm Looking Through You|It's All Too Much|You Know My Name (Look Up the Number)|Sgt. Pepper's Lonely Hearts Club Band",
 ["콜드플레이 노래"]="Death and All His Friends|Everything's Not Lost|Every Teardrop Is a Waterfall|A Rush of Blood to the Head|The Goldrush|A Spell a Rebel Yell|Things I Don't Understand|How You See the World|Life in Technicolor II",
 ["린킨 파크 노래"]="The Little Things Give You Away|A Line in the Sand|Until It's Gone|In Pieces|No More Sorrow|Hands Held High|Until It Breaks|Roads Untraveled|The Messenger|Not Alone|Blackbirds",
 ["오아시스 노래"]="The Importance of Being Idle|It's Gettin' Better (Man!!)|I Hope, I Think, I Know|Who Put the Weight of the World on My Shoulders?|Let's All Make Believe|Flashbax|Full On|Idler's Dream|Carry Us All|As Long as They've Got Cigarettes in Hell",
 ["너바나 노래"]="Frances Farmer Will Have Her Revenge on Seattle|Radio Friendly Unit Shifter|Even in His Youth|I Hate Myself and Want to Die|Verse Chorus Verse|Moist Vagina|Curmudgeon|Oh, the Guilt|Marigold|Aero Zeppelin|Big Long Now",
 ["원피스 캐릭터"]="Donquixote Rosinante|Donquixote Doflamingo|Saint Donquixote Mjosgard|Saint Jaygarcia Saturn|Saint Marcus Mars|Saint Topman Warcury|Saint Ethanbaron V. Nusjuro|Saint Shepherd Ju Peter|Charlotte Mont-d'Or|Charlotte Perospero|Charlotte Compote|Charlotte Daifuku|Charlotte Oven|Charlotte Brulee",
 ["나루토 캐릭터"]="Hamura Otsutsuki|Hagoromo Otsutsuki|Kaguya Otsutsuki|Kimimaro Kaguya|Mangetsu Hozuki|Fuguki Suikazan|Jinin Akebino|Kushimaru Kuriarare|Jinpachi Munashi|Ameyuri Ringo|Zabuza Momochi|Gengetsu Hozuki|Mu|Yagura Karatachi",
 ["스타워즈 캐릭터"]="Quinlan Vos|Luminara Unduli|Barriss Offee|Ki-Adi-Mundi|Oppo Rancisis|Saesee Tiin|Coleman Trebor|Yarael Poof|Depa Billaba|Agen Kolar|Bultar Swan|Jocasta Nu|Garazeb Orrelios|Hera Syndulla|Kanan Jarrus|Sabine Wren",
 ["반지의 제왕 캐릭터"]="Meriadoc Brandybuck|Peregrin Took|Fredegar Bolger|Rosie Cotton|Lobelia Sackville-Baggins|Otho Sackville-Baggins|Adelard Took|Gerontius Took|Bandobras Took|Will Whitfoot|Barliman Butterbur|Hamfast Gamgee|Farmer Maggot|Fatty Lumpkin",
 ["그리스 신"]="Asclepius|Amphitrite|Leucothea|Palaemon|Telesphorus|Phosphorus|Hesperus|Astraeus|Asteria|Aristaios",
 ["그리스 신화 괴물"]="Crommyonian sow|Ceryneian hind|Erymanthian boar|Stymphalian birds|Colchian dragon|Campe|Hecatoncheires|Lernaean Hydra|Nemean lion|Cretan bull|Mares of Diomedes|Ethon",
 ["어벤져스 멤버"]="Miguel Santos|Delroy Garrett|Maria de Guadalupe Santiago|Jonathan Hart|Bonita Juarez|Dane Whitman|Monica Rambeau|Kelsey Leigh|Demolition Man|Living Lightning|Triathlon|Silverclaw|Stingray|Jack of Hearts",
 ["축구 클럽 이름"]="Inverness Caledonian Thistle|Havant & Waterlooville|Haverfordwest County|Dagenham & Redbridge|Connah's Quay Nomads|Gala Fairydean Rovers|Inverurie Loco Works|Civil Service Strollers|Bishop's Stortford|Hemel Hempstead Town|Weston-super-Mare|Saffron Walden Town|Hamilton Academical|Clachnacuddin|Forres Mechanics|Strathspey Thistle|Buckie Thistle|Bonnyrigg Rose|Kelty Hearts|Bo'ness United|The New Saints|Pontypridd United|Caernarfon Town|Flint Town United|Prestatyn Town|Llanelli Town|Accrington Stanley|Forest Green Rovers|Cheltenham Town|Boreham Wood|Chesham United|Wealdstone|Braintree Town|Tonbridge Angels|Eastleigh|Solihull Moors|Maidenhead United|Kidderminster Harriers|Gloucester City|Spennymoor Town|Blyth Spartans|Darlington|Farsley Celtic|Curzon Ashton|Warrington Town|South Shields|Chorley|AFC Fylde|Buxton|Leamington|Enfield Town|Carshalton Athletic|Cheshunt|Cray Wanderers|Wingate & Finchley|Bognor Regis Town|Billericay Town|Potters Bar Town|Hashtag United|Dulwich Hamlet|Folkestone Invicta|Lewes|Hornchurch|Chatham Town|Hastings United|Horsham|Gimnasia y Esgrima de Jujuy|Gimnasia y Esgrima de Concepcion del Uruguay|Defensores de Belgrano|Sportivo Desamparados|Deportivo Laferrere|Sarmiento de Resistencia|Chaco For Ever|Deportivo Moron|Almirante Brown|Brown de Adrogue|Tristan Suarez|Guillermo Brown|Agropecuario Argentino|Gimnasia y Tiro|San Martin de Tucuman|San Martin de San Juan|Douglas Haig|Flandria|Villa Dalmine|Nueva Chicago|Deportivo Riestra|Estudiantes de Rio Cuarto|Instituto de Cordoba|Central Cordoba de Santiago del Estero|Gremio Novorizontino|Operario Ferroviario|Ferroviaria|Chapecoense|Brusque|Botafogo-SP|Figueirense|Londrina|Paysandu|Sampaio Correa|Ferroviario|Ypiranga|Volta Redonda|Tombense|Sao Jose-RS|America-RN|Aparecidense|Athletic Club|Manaus|Remo|Gokulam Kerala|Sreenidi Deccan|Churchill Brothers|Shillong Lajong|Rajasthan United|Real Kashmir|Mohammedan Sporting Club|Inter Kashi|Namdhari|TRAU|Aizawl|Neroca|Dempo|Salgaocar|Sporting Clube de Goa|Bashundhara Kings|Abahani Limited Dhaka|Brothers Union|Rahmatganj MFS|Muktijoddha Sangsad KC|Chonburi|Ratchaburi|Nongbua Pitchaya|BG Pathum United|Nakhon Ratchasima|Port|Prachuap|Police Tero|Muangthong United|Buriram United|Daejeon Korail|Gyeongju Korea Hydro & Nuclear Power|Changwon City|Gangneung City|Gimhae City|Yangpyeong|Paju Citizen|Pocheon Citizen|Siheung Citizen|Mokpo City|Hwaseong|Cheonan City|Cheongju|충북청주FC|천안시티FC|김포FC|성남FC|서울이랜드FC|부산아이파크|경남FC|전남드래곤즈|안산그리너스FC|충남아산FC|수원삼성블루윙즈|제주SK FC",
}
for _,row in ipairs(extraTopics) do
 if row.title=='축구 구단' then
  row.title='축구 클럽 이름'
  for _,alias in ipairs({'축구 클럽 이름','축구클럽 이름','축구클럽','축구 클럽','축구팀 이름','축구팀','축구 구단','football club name','soccer club name'}) do row.aliases[#row.aliases+1]=alias end
 end
 if longAnswerAdditions[row.title] then row.words=row.words..'|'..longAnswerAdditions[row.title] end
end
for title,words in pairs(lists) do if longAnswerAdditions[title] then lists[title]=words..'|'..longAnswerAdditions[title] end end
for key,title in pairs(songDisplayNames) do if longAnswerAdditions[title] then songs[key]=songs[key]..'|'..longAnswerAdditions[title] end end

local newV15Topics={
 {title="게임 개발사",aliases={"game developer","game studio","게임 개발사"},words="Supergiant Games|Mobius Digital|Subset Games|Motion Twin|Dead Mage|Mimimi Games|Image & Form|Ghost Ship Games|Klei Entertainment|ConcernedApe|Team Cherry|Toby Fox|FromSoftware|PlatinumGames|Vanillaware|Grezzo|Monolith Soft|Intelligent Systems"},
 {title="게임 엔진",aliases={"game engine","게임 엔진"},words="Defold|Stride|Flax Engine|Panda3D|Cocos2d-x|Solar2D|GDevelop|Construct|GameMaker|RPG Maker|Ren'Py|Adventure Game Studio|Godot|Unity|Unreal Engine|CryEngine|Source|id Tech|Frostbite|RE Engine"},
 {title="게임 상태 이상",aliases={"game status effect","status ailment","게임 상태 이상"},words="Silence|Petrification|Confusion|Paralysis|Sleep|Poison|Burn|Freeze|Frostbite|Bleed|Blindness|Curse|Doom|Charm|Fear|Slow|Stun|Berserk|Amnesia|Exhaustion"},
 {title="게임 직업",aliases={"game character class","rpg class","게임 직업"},words="Geomancer|Astrologian|Red Mage|Blue Mage|Time Mage|Beastmaster|Puppeteer|Dancer|Bard|Scholar|Arcanist|Summoner|Dark Knight|Paladin|Dragoon|Monk|Ninja|Ranger|Berserker|Necromancer|Artificer|Battlemage"},
 {title="포켓몬 타입",aliases={"pokemon type","포켓몬 타입"},words="Normal|Fire|Water|Electric|Grass|Ice|Fighting|Poison|Ground|Flying|Psychic|Bug|Rock|Ghost|Dragon|Dark|Steel|Fairy"},
 {title="포켓몬 특성",aliases={"pokemon ability","포켓몬 특성"},words="Wonder Guard|Magic Bounce|Mold Breaker|Contrary|Simple|Unaware|Prankster|Infiltrator|Overcoat|Skill Link|Sheer Force|Serene Grace|Super Luck|Tinted Lens|Scrappy|Stakeout|Corrosion|Merciless|Comatose|Disguise|Schooling|Shields Down|Stance Change|Power Construct|Multiscale|Intimidate"},
 {title="포켓몬 기술",aliases={"pokemon move","포켓몬 기술"},words="Forest's Curse|Trick-or-Treat|Flying Press|Powder|Electrify|Ion Deluge|Topsy-Turvy|Mat Block|Crafty Shield|King's Shield|Spiky Shield|Obstruct|Baneful Bunker|Burning Bulwark|Silk Trap|Doodle|Salt Cure|Population Bomb|Gigaton Hammer|Last Respects|Revival Blessing|Fillet Away|Aqua Step|Torch Song|Flower Trick"},
 {title="포켓몬 체육관 관장",aliases={"pokemon gym leader","포켓몬 체육관 관장"},words="Roxanne|Brawly|Wattson|Flannery|Norman|Winona|Tate|Liza|Wallace|Juan|Roark|Gardenia|Maylene|Crasher Wake|Fantina|Byron|Candice|Volkner|Cilan|Chili|Cress|Lenora|Burgh|Elesa|Clay|Skyla|Brycen|Drayden|Iris|Cheren|Roxie|Marlon"},
 {title="마리오 적 캐릭터",aliases={"mario enemy","마리오 적","마리오 몬스터"},words="Chargin' Chuck|Sumo Bro|Boomerang Bro|Fire Bro|Sledge Bro|Waddlewing|Ninji|Spike Top|Bony Beetle|Buster Beetle|Scaredy Rat|Scuttlebug|Swoop|Fuzzy|Wiggler|Monty Mole|Rocky Wrench|Ptooie|Nipper Plant|Fire Snake|Roto-Disc|Boo|Dry Bones|Thwomp|Whomp"},
 {title="젤다 종족",aliases={"zelda race","zelda species","젤다 종족"},words="Zonai|Twili|Minish|Picori|Kokiri|Korok|Goron|Zora|Rito|Gerudo|Hylian|Sheikah|Deku Scrub|Kikwi|Mogma|Parellan|Lokomo|Anouki|Yeti|Subrosian"},
 {title="마인크래프트 음식",aliases={"minecraft food","마인크래프트 음식","마크 음식"},words="Suspicious Stew|Rabbit Stew|Mushroom Stew|Beetroot Soup|Enchanted Golden Apple|Golden Apple|Golden Carrot|Cooked Mutton|Cooked Rabbit|Cooked Cod|Cooked Salmon|Cooked Beef|Cooked Porkchop|Cooked Chicken|Baked Potato|Dried Kelp|Pumpkin Pie|Sweet Berries|Glow Berries|Honey Bottle|Chorus Fruit|Bread|Cookie|Cake|Melon Slice"},
 {title="마인크래프트 도구",aliases={"minecraft tool","마인크래프트 도구","마크 도구"},words="Netherite Pickaxe|Diamond Pickaxe|Iron Pickaxe|Golden Pickaxe|Stone Pickaxe|Wooden Pickaxe|Netherite Shovel|Netherite Hoe|Netherite Axe|Diamond Shovel|Diamond Hoe|Diamond Axe|Brush|Shears|Flint and Steel|Fishing Rod|Carrot on a Stick|Warped Fungus on a Stick|Spyglass|Recovery Compass|Compass|Clock|Lead|Saddle|Bucket"},
 {title="마인크래프트 바이옴",aliases={"minecraft biome","마인크래프트 바이옴","마크 바이옴"},words="Eroded Badlands|Wooded Badlands|Old Growth Birch Forest|Old Growth Pine Taiga|Old Growth Spruce Taiga|Sparse Jungle|Bamboo Jungle|Windswept Gravelly Hills|Windswept Savanna|Windswept Forest|Mushroom Fields|Mangrove Swamp|Cherry Grove|Frozen Peaks|Jagged Peaks|Stony Peaks|Grove|Snowy Slopes|Lush Caves|Dripstone Caves|Deep Dark|Soul Sand Valley|Warped Forest|Crimson Forest|Basalt Deltas"},
 {title="마인크래프트 구조물",aliases={"minecraft structure","마인크래프트 구조물","마크 구조물"},words="Trail Ruins|Trial Chambers|Ancient City|Bastion Remnant|Ruined Portal|Woodland Mansion|Ocean Monument|Pillager Outpost|Desert Pyramid|Jungle Temple|Witch Hut|Igloo|Ocean Ruins|Shipwreck|Buried Treasure|Stronghold|Mineshaft|Nether Fortress|End City|End Ship|Village|Desert Well|Nether Fossil"},
 {title="마인크래프트 광물",aliases={"minecraft ore","minecraft mineral","마인크래프트 광물","마크 광물"},words="Deepslate Emerald Ore|Deepslate Coal Ore|Deepslate Copper Ore|Deepslate Iron Ore|Deepslate Gold Ore|Deepslate Lapis Lazuli Ore|Deepslate Redstone Ore|Deepslate Diamond Ore|Nether Gold Ore|Nether Quartz Ore|Ancient Debris|Emerald Ore|Diamond Ore|Redstone Ore|Lapis Lazuli Ore|Copper Ore|Iron Ore|Gold Ore|Coal Ore|Amethyst Shard"},
 {title="마인크래프트 마법부여",aliases={"minecraft enchantment","마인크래프트 마법부여","마크 인챈트"},words="Curse of Binding|Curse of Vanishing|Bane of Arthropods|Luck of the Sea|Depth Strider|Frost Walker|Soul Speed|Swift Sneak|Respiration|Aqua Affinity|Feather Falling|Projectile Protection|Blast Protection|Fire Protection|Channeling|Riptide|Loyalty|Impaling|Multishot|Quick Charge|Piercing|Sweeping Edge|Silk Touch|Mending|Infinity"},
 {title="마인크래프트 주민 직업",aliases={"minecraft villager profession","minecraft villager job","마인크래프트 주민 직업","마크 주민 직업"},words="Armorer|Butcher|Cartographer|Cleric|Farmer|Fisherman|Fletcher|Leatherworker|Librarian|Mason|Shepherd|Toolsmith|Weaponsmith"},
 {title="햄버거 프랜차이즈",aliases={"burger chain","hamburger chain","햄버거 브랜드","햄버거 프랜차이즈"},words="Freddy's Frozen Custard & Steakburgers|Wayback Burgers|The Habit Burger Grill|Culver's|Cook Out|Whataburger|Fatburger|Smashburger|Five Guys|In-N-Out Burger|Shake Shack|Steak 'n Shake|Sonic Drive-In|Jack in the Box|Carl's Jr.|Hardee's|Checkers|Rally's|White Castle|Krystal|Burger King|Wendy's|McDonald's|맘스터치|노브랜드버거|프랭크버거|버거킹|롯데리아"},
 {title="피자 브랜드",aliases={"pizza chain","pizza brand","피자 브랜드"},words="Godfather's Pizza|Hungry Howie's|Marco's Pizza|Mountain Mike's Pizza|Round Table Pizza|Pizza Inn|Pizza Ranch|Rosati's Pizza|Jet's Pizza|Donatos Pizza|Mellow Mushroom|MOD Pizza|Blaze Pizza|Pieology|Papa Murphy's|Sbarro|Little Caesars|Papa Johns|Domino's|Pizza Hut|피자나라치킨공주|청년피자|반올림피자|피자스쿨|피자마루|피자알볼로|피자에땅"},
 {title="편의점 음식",aliases={"convenience store food","편의점 음식"},words="삼각김밥|유부초밥|컵밥|주먹밥|샌드위치|토스트|샐러드|도시락|치킨너겟|치즈스틱|핫바|꼬치어묵|호빵|붕어빵|고구마말랭이|반숙란|훈제란|닭가슴살|컵떡볶이|컵라면|컵누들|소시지|햄버거|핫도그|마카로니샐러드"},
 {title="시리얼 브랜드",aliases={"cereal brand","시리얼 브랜드"},words="Cinnamon Toast Crunch|French Toast Crunch|Golden Grahams|Frosted Mini-Wheats|Honey Bunches of Oats|Grape-Nuts|Shredded Wheat|Weetabix|Weet-Bix|Alpen|Jordans|Dorset Cereals|Barbara's Puffins|Kashi|Life|Cap'n Crunch|Lucky Charms|Cheerios|Froot Loops|Frosted Flakes|Raisin Bran|Rice Krispies|Cocoa Puffs|Reese's Puffs"},
 {title="생수 브랜드",aliases={"bottled water brand","water brand","생수 브랜드"},words="Acqua Panna|San Pellegrino|Badoit|Gerolsteiner|Volvic|Vittel|Contrex|Wattwiller|Berg|Voss|Fiji Water|Evian|Perrier|Topo Chico|Mountain Valley Spring Water|Icelandic Glacial|Waiakea|Sole|Ferrarelle|Lurisia|Antipodes|삼다수|백산수|아이시스|평창수|동원샘물"},
 {title="주스 브랜드",aliases={"juice brand","주스 브랜드"},words="Lakewood|R.W. Knudsen|Santa Cruz Organic|Biotta|Ceres|Rubicon|Pago|Rauch|Granini|Eckes-Granini|Pfanner|Happy Day|Innocent|Naked Juice|Bolthouse Farms|Odwalla|V8|Ocean Spray|Welch's|Mott's|Tropicana|Dole|Del Monte|Minute Maid|Florida's Natural|Simply|Natalie's Orchid Island Juice"},
 {title="도넛 종류",aliases={"donut type","doughnut type","도넛 종류"},words="Old-fashioned doughnut|Buttermilk doughnut|Sour cream doughnut|Apple cider doughnut|Cruller|French cruller|Bear claw|Boston cream doughnut|Bavarian cream doughnut|Long John|Maple bar|Apple fritter|Jelly doughnut|Berliner|Paczki|Bombolone|Sufganiyah|Malasada|Beignet|Zeppola|Loukoumades|Oliebollen|Youtiao|Mochi doughnut"},
 {title="도넛 브랜드",aliases={"donut chain","doughnut brand","도넛 브랜드"},words="Voodoo Doughnut|Blue Star Donuts|Doughnut Plant|Federal Donuts|Sidecar Doughnuts|The Salty Donut|Shipley Do-Nuts|Duck Donuts|Hurts Donut|Stan's Donuts|Randy's Donuts|Top Pot Doughnuts|LaMar's Donuts|Winchell's Donut House|Mister Donut|Krispy Kreme|Dunkin'|Tim Hortons|노티드|도넛플랜트뉴욕시티"},
 {title="비스킷 종류",aliases={"biscuit type","type of biscuit","비스킷 종류"},words="Garibaldi biscuit|Abernethy biscuit|Bath Oliver|Nice biscuit|Rich tea|Digestive biscuit|Hobnob|Bourbon biscuit|Custard cream|Malted milk biscuit|Ginger nut|Shortcake|Empire biscuit|Viennese whirl|Jammie Dodger|Jammy wheel|Fig roll|Party ring|Wafer|Speculoos|Biscoff|Marie biscuit|Petit beurre"},
 {title="초밥 종류",aliases={"sushi type","type of sushi","초밥 종류"},words="Battera|Oshizushi|Hakozushi|Bozushi|Temarizushi|Chirashizushi|Edomae sushi|Narezushi|Funazushi|Nigirizushi|Gunkanmaki|Temaki|Futomaki|Hosomaki|Uramaki|Inarizushi|Sabazushi|Kakinohazushi|Masuzushi|Tekkamaki|Kappamaki|Kohada nigiri|Anago nigiri|Engawa nigiri"},
 {title="일본 라멘 종류",aliases={"ramen type","japanese ramen type","일본 라멘 종류","라멘 종류"},words="Tori paitan ramen|Niboshi ramen|Kitakata ramen|Hakodate ramen|Asahikawa ramen|Wakayama ramen|Onomichi ramen|Takamatsu ramen|Tokushima ramen|Kurume ramen|Hakata ramen|Kumamoto ramen|Kagoshima ramen|Sapporo miso ramen|Iekei ramen|Jiro-style ramen|Tsukemen|Abura soba|Hiyashi chuka|Tantanmen"},
 {title="카레 종류",aliases={"curry type","type of curry","카레 종류"},words="Kashmiri rogan josh|Goan vindaloo|Goan fish curry|Malabar fish curry|Chettinad chicken curry|Kerala vegetable stew|Navratan korma|Mughlai korma|Dhansak|Pathia|Dopiaza|Pasanda|Jalfrezi|Madras curry|Bhuna|Saag|Balti|Tikka masala|Massaman curry|Panang curry|Gaeng tai pla|Gaeng hang le|Kare-kare|Kari ayam|Soup curry|Katsu curry"},
 {title="타코 종류",aliases={"taco type","type of taco","타코 종류"},words="Tacos de suadero|Tacos de tripa|Tacos de cabeza|Tacos de lengua|Tacos de canasta|Tacos de cochinita pibil|Tacos de birria|Tacos gobernador|Tacos de pescado|Tacos de camaron|Tacos al pastor|Tacos arabes|Tacos dorados|Tacos de barbacoa|Tacos de carnitas|Tacos de carne asada|Tacos de huitlacoche|Tacos de nopales"},
 {title="소시지 종류",aliases={"sausage type","type of sausage","소시지 종류"},words="Cumberland sausage|Lincolnshire sausage|Glamorgan sausage|Kranjska klobasa|Nurnberger Rostbratwurst|Thuringer Rostbratwurst|Kasekrainer|Debrecener|Merguez|Salsiccia|Andouille|Andouillette|Boudin blanc|Boudin noir|Boudin antillais|Knackwurst|Bockwurst|Weisswurst|Bratwurst|Landjager|Cabanossi|Kabanos|Kielbasa|Sucuk|Loukaniko|Boerewors|Longganisa|Lap cheong"},
 {title="햄 종류",aliases={"ham type","type of ham","햄 종류"},words="Prosciutto di Parma|Prosciutto di San Daniele|Jamon iberico|Jamon serrano|Jambon de Bayonne|Jambon de Paris|Westfalischer Schinken|Schwarzwalder Schinken|Speck Alto Adige|Jamón de Teruel|York ham|Country ham|Virginia ham|Wiltshire ham|Ardennes ham|Presunto|Prazska sunka|Cooked ham|Smoked ham|Capocollo|Coppa|Culatello|Pancetta"},
 {title="올리브 종류",aliases={"olive variety","type of olive","올리브 종류"},words="Cerignola|Castelvetrano|Nocellara del Belice|Bella di Cerignola|Ascolana Tenera|Taggiasca|Itrana|Leccino|Frantoio|Moraiolo|Coratina|Arbequina|Arbosana|Picual|Hojiblanca|Manzanilla|Gordal|Empeltre|Kalamata|Amfissa|Halkidiki|Lucques|Picholine|Nicoise|Gaeta"},
 {title="사과 품종",aliases={"apple variety","apple cultivar","사과 품종"},words="Ashmead's Kernel|Cox's Orange Pippin|Bramley's Seedling|Egremont Russet|Ribston Pippin|D'Arcy Spice|Worcester Pearmain|Orleans Reinette|Calville Blanc d'Hiver|Belle de Boskoop|Reinette du Canada|Gravenstein|Baldwin|Northern Spy|Esopus Spitzenburg|Newtown Pippin|Arkansas Black|Pink Pearl|Cameo|Envy|Ambrosia|SweeTango|Kanzi|Jazz|Fuji|Gala"},
 {title="포도 품종",aliases={"grape variety","grape cultivar","포도 품종"},words="Muscat of Alexandria|Muscat Blanc a Petits Grains|Gewurztraminer|Gruner Veltliner|Muller-Thurgau|Blaufrankisch|Zweigelt|Trousseau|Poulsard|Savagnin|Assyrtiko|Moschofilero|Malagousia|Xinomavro|Agiorgitiko|Furmint|Harslevelu|Kadarka|Saperavi|Rkatsiteli|Mtsvane|Kisi|Krakhuna|Tsolikouri|Cabernet Sauvignon|Sauvignon Blanc|Pinot Noir|Pinot Grigio"},
 {title="소금 종류",aliases={"salt type","type of salt","소금 종류"},words="Fleur de sel|Sel gris|Maldon sea salt|Alaska flake salt|Hawaiian red alaea salt|Hawaiian black lava salt|Kala namak|Celtic sea salt|Cyprus flake salt|Persian blue salt|Himalayan pink salt|Smoked salt|Kosher salt|Pickling salt|Curing salt|Garlic salt|Celery salt|Truffle salt|Iodized salt|Rock salt"},
 {title="식용유 종류",aliases={"cooking oil","edible oil","식용유 종류"},words="Camelina oil|Perilla oil|Pumpkin seed oil|Pistachio oil|Poppy seed oil|Sacha inchi oil|Argan oil|Macadamia oil|Hazelnut oil|Walnut oil|Almond oil|Avocado oil|Grapeseed oil|Rice bran oil|Peanut oil|Sesame oil|Mustard oil|Sunflower oil|Safflower oil|Canola oil|Soybean oil|Corn oil|Olive oil|Coconut oil"},
 {title="꿀 종류",aliases={"honey type","type of honey","꿀 종류"},words="Leatherwood honey|Sourwood honey|Tupelo honey|Meadowfoam honey|Fireweed honey|Buckwheat honey|Chestnut honey|Heather honey|Linden honey|Acacia honey|Orange blossom honey|Sage honey|Rosemary honey|Lavender honey|Thyme honey|Eucalyptus honey|Manuka honey|Rewarewa honey|Kamahi honey|Beechwood honey|Clover honey|Wildflower honey"},
 {title="잼 종류",aliases={"jam type","type of jam","잼 종류"},words="Cloudberry jam|Lingonberry jam|Huckleberry jam|Boysenberry jam|Blackcurrant jam|Redcurrant jelly|Gooseberry jam|Damson jam|Greengage jam|Quince jelly|Medlar jelly|Rose petal jam|Fig jam|Plum jam|Apricot jam|Peach jam|Pineapple jam|Mango jam|Guava jam|Passion fruit jam|Strawberry jam|Raspberry jam|Orange marmalade|Lemon curd"},
 {title="샌드위치 체인",aliases={"sandwich chain","sandwich restaurant","샌드위치 체인","샌드위치 브랜드"},words="Potbelly Sandwich Shop|Schlotzsky's|Which Wich|Firehouse Subs|Jersey Mike's Subs|Jimmy John's|Capriotti's|Ike's Love & Sandwiches|Cheba Hut|Lenny's Grill & Subs|Cousins Subs|Penn Station East Coast Subs|PrimoHoagies|Port of Subs|Earl of Sandwich|Blimpie|Subway|Quiznos|Pret A Manger|Greggs|Paul|Paris Baguette|Panera Bread"},
 {title="차 브랜드",aliases={"tea brand","차 브랜드"},words="Kusmi Tea|Mariage Freres|Dammann Freres|Palais des Thes|Betjeman & Barton|Whittard of Chelsea|Fortnum & Mason|Jing Tea|Newby Teas|Harney & Sons|Smith Teamaker|Rishi Tea|Tea Forte|Adagio Teas|Numi|Traditional Medicinals|Pukka Herbs|Yogi Tea|Celestial Seasonings|Taylors of Harrogate|Yorkshire Tea|Twinings|T2|TWG Tea|Dilmah|Basilur|Mlesna"},
 {title="냉동식품 브랜드",aliases={"frozen food brand","냉동식품 브랜드"},words="Amy's Kitchen|Healthy Choice|Lean Cuisine|Stouffer's|Marie Callender's|Banquet|Birds Eye|Green Giant|Gorton's|SeaPak|Mrs. Paul's|Van de Kamp's|Tyson|Perdue|Foster Farms|Quorn|Boca|MorningStar Farms|Dr. Praeger's|Caulipower|DiGiorno|Red Baron|Tombstone|Totino's|Newman's Own|비비고|풀무원|고메|아워홈|동원F&B"},
 {title="반려동물 사료 브랜드",aliases={"pet food brand","반려동물 사료 브랜드","사료 브랜드"},words="Ziwi Peak|The Honest Kitchen|Stella & Chewy's|Primal Pet Foods|Instinct|Nature's Logic|Farmina|Nutrience|Canagan|Carnilove|Wolfsblut|Essential Foods|Edgard & Cooper|Lily's Kitchen|Forthglade|Butcher's|Applaws|Almo Nature|Schesir|Brit Care|Happy Dog|Happy Cat|Josera|JosiCat|Orijen|Acana|Wellness|Royal Canin|Hill's|Purina"},
 {title="음향기기 브랜드",aliases={"audio brand","headphone brand","음향기기 브랜드"},words="Beyerdynamic|Audio-Technica|Audeze|Hifiman|Focal|Meze Audio|Dan Clark Audio|Final Audio|Campfire Audio|64 Audio|Noble Audio|Unique Melody|Softears|Thieaudio|Moondrop|Dunu|Truthear|Kiwi Ears|Simgot|Tangzu|7Hz|FiiO|iBasso|Shanling|Cayin|Chord Electronics|RME|Topping|SMSL|Sennheiser|Shure|AKG"},
 {title="카메라 브랜드",aliases={"camera brand","카메라 브랜드"},words="Hasselblad|Phase One|Mamiya|Bronica|Rolleiflex|Linhof|Sinar|Arca-Swiss|Wista|Tachihara|Chamonix|Intrepid|Graflex|Voigtlander|Zeiss Ikon|Contax|Yashica|Minolta|Konica|Praktica|Zenit|Zorki|FED|Lomo|Holga|Diana|Polaroid|Kodak|Leica|Pentax|Ricoh|Olympus|Fujifilm|Nikon|Canon|Sony"},
 {title="자전거 브랜드",aliases={"bicycle brand","bike brand","자전거 브랜드"},words="Riese & Muller|Tout Terrain|Thorn Cycles|Santos Bikes|Koga|Idworx|Patria|VSF Fahrradmanufaktur|Hase Bikes|HP Velotechnik|Azub|ICE Trikes|Catrike|Greenspeed|Bacchetta|Lightning Cycle Dynamics|Burley|Bike Friday|Brompton|Birdy|Moulton|Dahon|Tern|Strida|Bickerton|Montague|Ritchey|Salsa|Surly|Kona|Marin|Norco|Rocky Mountain"},
 {title="악기 브랜드",aliases={"musical instrument brand","악기 브랜드"},words="Buffet Crampon|F. Loree|Fox Products|Heckel|Puchner|Walter Schreiber|Mollenhauer|Moeck|Kobliczek|Adler-Heinrich|Kung|Aulos|Zen-On|Hohner|Weltmeister|Pigini|Scandalli|Beltuna|Castagnari|Saltarelle|Dallape|Roland|Korg|Yamaha|Kawai|Casio|Nord|Kurzweil|Moog|Sequential|Waldorf|Access|Novation"},
 {title="등산 브랜드",aliases={"hiking brand","outdoor clothing brand","등산 브랜드"},words="Klattermusen|Norrona|Haglofs|Fjallraven|Lundhags|Bergans|Tilak|Direct Alpine|Mountain Equipment|Montane|Rab|Mammut|Ortovox|Vaude|Jack Wolfskin|Schöffel|Schöffel|Salewa|La Sportiva|Ferrino|Karpos|Montura|Millet|Lafuma|Eider|Black Yak|K2|Kolon Sport|Snow Peak|Nanga|Montbell|Finetrack"},
 {title="수영용품 브랜드",aliases={"swimwear brand","swimming brand","수영용품 브랜드"},words="Funky Trunks|Funkita|Amanzi|Dolfin|Finis|Turbo|Delfina|Zealous|Jolyn|Budgy Smuggler|Arena|Speedo|TYR|MP Michael Phelps|Aqua Sphere|Zoggs|Mad Wave|Mosconi|Cressi|Mares|Seac|Huub|Zone3|Orca|Sailfish|BlueSeventy|2XU|Roka|De Soto Sport"},
 {title="축구용품 브랜드",aliases={"football equipment brand","soccer equipment brand","축구용품 브랜드"},words="Uhlsport|Reusch|Sells|HO Soccer|Rinat|One Glove|West Coast Goalkeeping|Kaliaaer|Precision Goalkeeping|Elite Sport|Aviata|KA Goalkeeping|Rectrix|Tuto|Gripmode|Storelli|G-Form|Sondico|Patrick|Joma|Kelme|Macron|Errea|Lotto|Mizuno|Diadora|Pantofola d'Oro|Nike|Adidas|Puma|Umbro"},
 {title="치즈 요리",aliases={"cheese dish","치즈 요리"},words="mac and cheese|Macaroni and cheese|Kasespatzle|Kasspatzln|Aligot|Truffade|Tartiflette|Raclette|Fondue savoyarde|Welsh rarebit|Croque monsieur|Croque madame|Khachapuri|Adjarian khachapuri|Saganaki|Fried halloumi|Mozzarella in carrozza|Queso fundido|Quesadilla|Paneer tikka|Palak paneer|Shahi paneer|Matar paneer|Chilli paneer"},
 {title="한국 전통 과자",aliases={"korean traditional snack","한국 전통 과자"},words="매작과|유과|산자|쌀강정|깨강정|들깨강정|땅콩강정|다식|송화다식|콩다식|흑임자다식|오란다|엿강정|개성약과|개성주악|전주초코파이|보리빵|호두과자|찰보리빵|황남빵|경주빵|강릉커피콩빵|제주감귤과즐"},
 {title="한국 지역 음식",aliases={"korean regional food","한국 지역 음식","향토음식"},words="올챙이국수|콧등치기국수|감자옹심이|춘천닭갈비|횡성한우|안동찜닭|안동헛제사밥|영주태평초|포항물회|영덕대게|경주교동쌈밥|대구따로국밥|통영충무김밥|진주냉면|밀양돼지국밥|부산밀면|전주비빔밥|남원추어탕|순창고추장|담양떡갈비|나주곰탕|벌교꼬막|목포홍어삼합|제주고기국수|제주빙떡"},
 {title="장아찌 종류",aliases={"pickled korean vegetable","jangajji","장아찌 종류"},words="명이장아찌|곰취장아찌|참취장아찌|깻잎장아찌|방풍나물장아찌|두릅장아찌|엄나무순장아찌|고들빼기장아찌|마늘종장아찌|마늘장아찌|양파장아찌|고추장아찌|무장아찌|오이장아찌|여주장아찌|연근장아찌|우엉장아찌|도라지장아찌|더덕장아찌|매실장아찌|참외장아찌|수박껍질장아찌"},
 {title="젓갈 종류",aliases={"salted seafood","jeotgal","젓갈 종류"},words="갈치속젓|황석어젓|까나리젓|자리돔젓|멸치젓|추자멸치젓|전어밤젓|토하젓|가리비젓|굴젓|어리굴젓|조개젓|오징어젓|낙지젓|창난젓|명란젓|아가미젓|청어알젓|새우젓|곤쟁이젓|육젓|오젓|추젓|백하젓"},
 {title="F1 드라이버 이름",aliases={"f1 driver","formula 1 driver","formula one driver","F1 드라이버","F1드라이버","포뮬러원 드라이버"},words="Narain Karthikeyan|Domenico Schiattarella|Jean-Denis Deletraz|Markus Winkelhock|Joachim Winkelhock|Hans-Joachim Stuck|Wolfgang von Trips|Carel Godin de Beaufort|Alfonso de Portago|Alejandro de Tomaso|Piercarlo Ghinzani|Gabriele Tarquini|Pierluigi Martini|Gianni Morbidelli|Giovanni Lavaggi|Andrea Montermini|Mauricio Gugelmin|Luis Perez-Sala|Franco Forini|Olivier Grouillard|Eric van de Poele|Andrea Chiesa|Gregor Foitek|Philippe Streiff|Philippe Alliot|Franck Lagorce|Eric Bernard|Bernd Schneider|Christian Danner|Karun Chandhok|Sakon Yamamoto|Ukyo Katayama|Toshio Suzuki|Satoru Nakajima|Shinji Nakano|Aguri Suzuki|Takuma Sato|Yuji Ide|Kamui Kobayashi|Kazuki Nakajima|Toranosuke Takagi|Pedro de la Rosa|Pedro Lamy|Tiago Monteiro|Christijan Albers|Robert Doornbos|Anthony Davidson|Bruno Senna|Antonio Pizzonia|Nelson Piquet Jr.|Vitantonio Liuzzi|Scott Speed|Jaime Alguersuari|Sebastien Buemi|Sebastien Bourdais|Giedo van der Garde|Charles Pic|Max Chilton|Marcus Ericsson|Pascal Wehrlein|Rio Haryanto|Sergey Sirotkin|Nikita Mazepin|Logan Sargeant|Heikki Kovalainen|Mika Salo|JJ Lehto|Mika Hakkinen|Kimi Raikkonen|Valtteri Bottas|Carlos Reutemann|Carlos Pace|Clay Regazzoni|Ronnie Peterson|Gunnar Nilsson|Patrick Depailler|Jean-Pierre Jabouille|Jean-Pierre Jarier|Rene Arnoux|Jacques Laffite|Didier Pironi|Patrick Tambay|Michele Alboreto|Riccardo Patrese|Andrea de Cesaris|Emanuele Pirro|Nicola Larini|Ivan Capelli|Roberto Moreno|Tarso Marques|Ricardo Rosset|Stefano Modena|Alex Caffi|Pedro Rodriguez|Ricardo Rodriguez|Juan Manuel Fangio|Alberto Ascari|Giuseppe Farina|Stirling Moss|Jack Brabham|Bruce McLaren|Denny Hulme|John Surtees|Jim Clark|Graham Hill|Damon Hill|Phil Hill|Jackie Stewart|Emerson Fittipaldi|Wilson Fittipaldi|Nelson Piquet|Niki Lauda|James Hunt|Jody Scheckter|Alan Jones|Keke Rosberg|Nico Rosberg|Ayrton Senna|Alain Prost|Nigel Mansell|Gerhard Berger|Jean Alesi|Heinz-Harald Frentzen|Johnny Herbert|Mark Blundell|Martin Brundle|David Coulthard|Rubens Barrichello|Eddie Irvine|Ralf Schumacher|Michael Schumacher|Felipe Massa|Giancarlo Fisichella|Jarno Trulli|Nick Heidfeld|Robert Kubica|Vitaly Petrov|Paul di Resta|Pastor Maldonado|Adrian Sutil|Esteban Gutierrez|Jolyon Palmer|Stoffel Vandoorne|Brendon Hartley|Daniel Ricciardo|Daniil Kvyat|Alexander Albon|Yuki Tsunoda|Zhou Guanyu|Lewis Hamilton|Fernando Alonso|Sebastian Vettel|Max Verstappen|Charles Leclerc|Carlos Sainz|Lando Norris|Oscar Piastri|George Russell|Esteban Ocon|Pierre Gasly|Sergio Perez|Nico Hulkenberg|Kevin Magnussen|Lance Stroll|Liam Lawson|Oliver Bearman|Jack Doohan|Gabriel Bortoleto|Andrea Kimi Antonelli|Franco Colapinto"},
}
for _,row in ipairs(newV15Topics) do extraTopics[#extraTopics+1]=row end
local requestedFoodWords="mac and cheese|Macaroni and cheese|Baked macaroni and cheese|Lobster mac and cheese|Truffle mac and cheese|맥앤치즈|마카로니 앤드 치즈"
local requestedCopperWords="깎은 구리 반 블록|깎인 구리 반 블록|Cut Copper Slab|Exposed Cut Copper Slab|Weathered Cut Copper Slab|Oxidized Cut Copper Slab|Waxed Cut Copper Slab|Waxed Exposed Cut Copper Slab|Waxed Weathered Cut Copper Slab|Waxed Oxidized Cut Copper Slab|Cut Copper Stairs|Exposed Cut Copper Stairs|Weathered Cut Copper Stairs|Oxidized Cut Copper Stairs|Waxed Cut Copper Stairs|Waxed Exposed Cut Copper Stairs|Waxed Weathered Cut Copper Stairs|Waxed Oxidized Cut Copper Stairs|Chiseled Copper|Exposed Chiseled Copper|Weathered Chiseled Copper|Oxidized Chiseled Copper|Waxed Chiseled Copper|Waxed Exposed Chiseled Copper|Waxed Weathered Chiseled Copper|Waxed Oxidized Chiseled Copper|Waxed Weathered Copper Grate|Waxed Oxidized Copper Grate|Waxed Weathered Copper Bulb|Waxed Oxidized Copper Bulb"
for _,row in ipairs(extraTopics) do
 if row.title=='음식' or row.title=='미국 음식' or row.title=='치즈 요리' then row.words=row.words..'|'..requestedFoodWords end
 if row.title=='마인크래프트 블록' or row.title=='마인크래프트 아이템' or row.title=='게임 아이템' then row.words=row.words..'|'..requestedCopperWords end
end

local topics, byTitle = {}, {}
-- Use ordinary short country names instead of fabricated full-name variants.
local countryTitles={['나라']=true,['아시아 국가']=true,['유럽 국가']=true,['아프리카 국가']=true,['북아메리카 국가']=true,['남아메리카 국가']=true,['오세아니아 국가']=true,['아메리카 국가']=true,['섬나라']=true,['내륙국']=true}
local countryShortNames={
 ['democratic republic of sao tome and principe']='Sao Tome and Principe',
 ['federated states of micronesia']='Micronesia',
 ['republic of the marshall islands']='Marshall Islands',
 ['democratic republic of timor-leste']='Timor-Leste',
 ['democratic republic of the congo']='DR Congo',
 ['democratic republic of congo']='DR Congo',
 ['republic of the congo']='Congo',
 ['republic of congo']='Congo',
 ['republic of equatorial guinea']='Equatorial Guinea',
 ['republic of kiribati']='Kiribati',
 ['independent state of papua new guinea']='Papua New Guinea',
 ['federation of saint kitts and nevis']='Saint Kitts and Nevis',
 ['republic of trinidad and tobago']='Trinidad and Tobago',
 ['cooperative republic of guyana']='Guyana',
 ['co-operative republic of guyana']='Guyana',
 ['republic of suriname']='Suriname',
 ['plurinational state of bolivia']='Bolivia',
 ['oriental republic of uruguay']='Uruguay',
 ["lao people's democratic republic"]='Laos',
 ['democratic socialist republic of sri lanka']='Sri Lanka',
 ['brunei darussalam']='Brunei',
 ['russian federation']='Russia',
 ['united republic of tanzania']='Tanzania',
 ["people's republic of china"]='China',
 ["democratic people's republic of korea"]='North Korea',
 ['republic of korea']='South Korea',
 ['united states of america']='United States',
 ['united kingdom of great britain and northern ireland']='United Kingdom',
 ['kingdom of eswatini']='Eswatini',
 ['kingdom of bhutan']='Bhutan',
 ['federal democratic republic of nepal']='Nepal',
 ['federal republic of germany']='Germany',
 ['federal republic of nigeria']='Nigeria',
}
local function shortCountryName(word)
 local key=word:lower():gsub('%s+',' '):match('^%s*(.-)%s*$')
 if countryShortNames[key] then return countryShortNames[key] end
 if key:find('republic of',1,true) or key:find('kingdom of',1,true) or key:find('democratic republic',1,true) then return nil end
 return word
end

local function addTopic(title, aliases, words)
 assert(not byTitle[title], 'Duplicate topic: '..title)
 local entry = {title=title, aliases=aliases, words={}, packed=words}
 local seen = {}
 for word in words:gmatch('[^|]+') do
  word = word:match('^%s*(.-)%s*$')
  if countryTitles[title] then word=shortCountryName(word) end
  if word and word~='' and not seen[word:lower()] then
   seen[word:lower()]=true
   entry.words[#entry.words+1]=word
  end
 end
 topics[#topics+1]=entry; byTitle[title]=entry
end
local baseAliases={
 {'나라','country','countries','나라','국가'},
 {'과일','fruit','fruits','과일'},
 {'래퍼','rapper','rappers','래퍼','랩퍼'},
 {'동물','animal','animals','동물'},
 {'곤충·벌레','insect','insects','bug','bugs','곤충','벌레'},
 {'채소','vegetable','vegetables','채소','야채'},
 {'새','bird','birds','새 이름','새의 이름','조류'},
 {'물고기','fish','fishes','물고기','어류'},
 {'색깔','color','colour','colors','colours','색깔','색상'},
 {'직업','job','jobs','profession','직업'},
 {'스포츠','sport','sports','스포츠','운동 종목'},
 {'악기','instrument','musical instrument','악기'},
}
for _, row in ipairs(baseAliases) do
 local names={}
 for i=2,#row do names[#names+1]=row[i] end
 addTopic(row[1],names,lists[row[1]])
end
for _,row in ipairs(extraTopics) do addTopic(row.title,row.aliases,row.words) end
local artists={
 {'taylor swift','테일러 스위프트'}, {'ariana grande','아리아나 그란데'},
 {'drake','드레이크'}, {'eminem','에미넴'}, {'bts','방탄소년단'},
 {'iu','아이유'}, {'blackpink','블랙핑크'}, {'billie eilish','빌리 아일리시'},
 {'the weeknd','위켄드'}, {'kanye west','카니예 웨스트','칸예 웨스트'},
}
for _,row in ipairs(additionalArtists) do artists[#artists+1]=row end
local function songTopicTitle(id) return songDisplayNames[id] or '노래 · '..id end
for _,row in ipairs(artists) do addTopic(songTopicTitle(row[1]),row,songs[row[1]]) end
assert(#topics==606, 'Topic count must be 606')
table.sort(topics,function(a,b) return a.title<b.title end)
local titles,total,uniqueWords={},0,{}
for _,entry in ipairs(topics) do
 titles[#titles+1]=entry.title;total=total+#entry.words
 for _,word in ipairs(entry.words) do uniqueWords[word:lower()]=true end
end
local uniqueCount=0
for _ in pairs(uniqueWords) do uniqueCount=uniqueCount+1 end
local function normalize(s)
 return tostring(s):lower():gsub('<[^>]*>',''):gsub('’',"'"):gsub('‘',"'"):gsub('%s+',' '):match('^%s*(.-)%s*$')
end
local function contains(s,alias)
 alias=normalize(alias)
 if alias=='' then return false end
 if not alias:find('[\128-\255]') then
  local start=1
  while true do
   local a,b=s:find(alias,start,true)
   if not a then return false end
   local before=a>1 and s:sub(a-1,a-1) or ''
   local after=s:sub(b+1,b+1)
   if not before:match('[%w_]') and not after:match('[%w_]') then return true end
   -- Regular English plurals; irregular forms are explicit aliases.
   if not before:match('[%w_]') and after=='s' and not s:sub(b+2,b+2):match('[%w_]') then return true end
   start=b+1
  end
 end
 return s:find(alias,1,true)~=nil
end
local rarityFirst=true
local rarePriority={
 ['어벤져스 멤버']='Silverclaw|Triathlon|Living Lightning|Stingray|Jack of Hearts|D-Man|Firebird|Sersi|Gilgamesh|Jocasta',
 ['영화 어벤져스 멤버']='Quicksilver|War Machine|Falcon|Vision|Nebula|Rocket',
 ['가디언즈 오브 갤럭시 멤버']='Martinex|Charlie-27|Nikki|Aleta Ogord|Major Victory|Vance Astro',
 ['엑스맨 멤버']='Maggott|Cecilia Reyes|Lifeguard|Slipstream|Stacy X|Sage|Marrow',
 ['판타스틱 포 멤버']='Ms. Thing|She-Thing|Crystal|Medusa|Ant-Man|Luke Cage',
 ['저스티스 리그 멤버']='Commander Steel|Gypsy|Vibe|Doctor Light|Rocket Red|Fire|Ice',
 ['틴 타이탄 멤버']='Gnarrk|Kole|Prysm|Argent|Risk|Lilith Clay|Mal Duncan',
 ['나라']='Tuvalu|Nauru|Kiribati|Comoros|Sao Tome and Principe|Palau|Eswatini',
 ['수도']='Thimphu|Maseru|Bishkek|Asmara|Lilongwe|Podgorica|Yerevan',
 ['상어']='Wobbegong|Thresher shark|Zebra shark|Goblin shark|Nurse shark|Basking shark',
 ['동물']='Saola|Numbat|Quoll|Tenrec|Solenodon|Hirola|Kouprey|Zorilla',
 ['과일']='Abiu|Imbe|Nance|Mabolo|Canistel|Soncoya|Rollinia|Lucuma',
 ['옷']='Leg warmer|Tabard|Jodhpurs|Crinoline|Culottes|Gilet|Bolero|Stole',
 ['소스']='Tkemali|Satsebeli|Skordalia|Amba|Zhug|Huancaina|Salmoriglio|Toum',
 ['날씨']='Virga|Sunshower|Ice fog|Squall|Freezing rain|Sleet|Drizzle',
 ['아이스크림 맛']='Sweet corn|Lavender|Earl Grey|Rose|Ube|Black sesame|Thai tea',
 ['카드게임']='Pinochle|Euchre|Tressette|Schafkopf|Doppelkopf|Escoba|Canasta|Briscola',
 ['샌드위치']='Elena Ruz|Barros Jarpa|Pambazo|Jibarito|Lampredotto|Dabeli|Chacarero|Cemita',
 ['그리스 신']='Morpheus|Proteus|Harmonia|Tyche|Triton|Hebe|Iris|Nemesis',
 ['디즈니 캐릭터']='Evinrude|Gurgi|Doppler|Ludwig Von Drake|Horace Horsecollar|Olivia Flaversham|Orville|Amelia',
 ['픽사 캐릭터']='Duke Caboom|Gabby Gabby|Colette Tatou|Celia Mae|Frozone|Edna Mode',
 ['비디오 게임']='Chants of Sennaar|Return of the Obra Dinn|Dorfromantik|Eastshade|Cocoon|Sable|Tunic',
 ['주방용품']='Mortar|Colander|Sieve|Grater|Ladle|Whisk',
 ['악기']='Ravanhatta|Jal tarang|Nyckelharpa|Sarangi|Esraj|Dilruba|Balafon',
 ['직업']='Palynologist|Dendrochronologist|Foley artist|Luthier|Farrier|Milliner|Orthotist',
 ['한국 음식']='타락죽|초계국수|메밀전병|수수부꾸미|재첩국|매생이국|다슬기국',
 ['디저트']='Syllabub|Pouding chomeur|Cranachan|Quindim|Suspiro limeno|Mazamorra morada|Far breton',
 ['헤어스타일']='Victory rolls|Finger waves|Bantu knots|Pageboy|Chignon|Beehive|Hime cut',
 ['반려동물']='Degu|Bourke\'s parakeet|Gouldian finch|Diamond dove|Kuhli loach|Nerite snail',
 ['꽃']='Fritillaria|Eryngium|Nemesia|Nigella|Scabiosa|Hellebore|Lisianthus',
 ['치즈']='Pouligny-Saint-Pierre|Sainte-Maure de Touraine|Rocamadour|Cabecou|Banon|Garrotxa',
 ['나무']='Tamarack|Jacaranda|Banyan|Baobab|Yew|Larch',
 ['곤충·벌레']='Scorpionfly|Dobsonfly|Antlion|Lacewing|Caddisfly|Stonefly',
 ['스포츠']='Pesapallo|Sepak takraw|Bandy|Underwater hockey|Kabaddi|Orienteering',
}
rarePriority['신발 브랜드']='Novesta|Spring Court|Walsh|Spalwart|Stepney Workers Club|Etonic|Feiyue|Gola|Karhu|PF Flyers'
rarePriority['스포츠 브랜드']='Givova|Errea|Luanvi|Masita|Rukka|Stanno|Kukri|Joma|Kelme|Macron'
rarePriority['장난감 브랜드']='Bullyland|CollectA|Quercetti|LaQ|Grapat|Ostheimer|Holztiger|Dantoy|Viking Toys|Bajo'
rarePriority['닌텐도 게임 이름']='Ever Oasis|Code Name: S.T.E.A.M.|Captain Rainbow|Doshin the Giant|Soma Bringer|GiFTPiA|Odama|Electroplankton|FlingSmash|Custom Robo'
rarePriority['마이클 잭슨 노래']='Threatened|2000 Watts|Privacy|The Lost Children|Whatever Happens|Superfly Sister|Morphine|Scared of the Moon|Sunset Driver|On the Line'
rarePriority['TV 프로그램']='EBS 스페이스 공감|장학퀴즈|우리말 겨루기|TV쇼 진품명품|가요무대|역사저널 그날|건축탐구 집|한국기행'
for title,words in pairs(longAnswerAdditions) do
 rarePriority[title]=(rarePriority[title] and rarePriority[title]..'|' or '')..words
end
local longRareFirst=true
rarePriority['F1 드라이버 이름']='Domenico Schiattarella|Carel Godin de Beaufort|Jean-Denis Deletraz|Heinz-Harald Frentzen|Narain Karthikeyan|Hans-Joachim Stuck|Markus Winkelhock|Toranosuke Takagi|Jean-Pierre Jabouille|Pedro de la Rosa'
rarePriority['음식']=(rarePriority['음식'] or '')..'|mac and cheese|Macaroni and cheese|Lobster mac and cheese|Truffle mac and cheese'
rarePriority['치즈 요리']='mac and cheese|Lobster mac and cheese|Truffle mac and cheese|Kasespatzle|Kasspatzln'
rarePriority['마인크래프트 블록']=(rarePriority['마인크래프트 블록'] or '')..'|'..requestedCopperWords
rarePriority['마인크래프트 아이템']=(rarePriority['마인크래프트 아이템'] or '')..'|'..requestedCopperWords
local function splitPriority(title)
 local result={}
 for word in (rarePriority[title] or ''):gmatch('[^|]+') do result[#result+1]=word end
 return result
end
local commonAnswers={}
for word in ('Iron Man|Captain America|Thor|Hulk|Batman|Superman|Spider-Man|Mario|Luigi|Sonic|Mickey Mouse|Donald Duck|Goofy|Elsa|Anna|Woody|Buzz Lightyear|Pikachu|Charizard|Naruto Uzumaki|Monkey D. Luffy|Goku|Apple|Banana|Orange|Strawberry|Watermelon|Mango|Dog|Cat|Lion|Tiger|Elephant|Giraffe|Rabbit|Hamster|Red|Blue|Yellow|Green|Black|White|Pink|Piano|Guitar|Violin|Drums|Teacher|Doctor|Nurse|Football|Basketball|Baseball|Tennis|Vanilla|Chocolate|Cookies and cream|BLT|Grilled cheese|Club sandwich|Minecraft|Roblox|Fortnite|Terraria|Japan|China|United States|United Kingdom|France|Germany|Italy|Canada|Australia|South Korea|Zeus|Poseidon|Athena|Harry Potter|Sherlock Holmes|김치|비빔밥|불고기|김밥|떡볶이|라면|치킨|피자|햄버거|사과|바나나|딸기|포도|강아지|고양이|빨강|파랑|바닐라|초콜릿'):gmatch('[^|]+') do commonAnswers[normalize(word)]=true end
-- Carry known less-common recommendations into broad categories as well.
-- This rank is computed over the entire candidate pool before any five-item slicing.
local globalRarePriority={}
for _,words in pairs(rarePriority) do
 local position=0
 for word in words:gmatch('[^|]+') do
  position=position+1
  local key=normalize(word)
  globalRarePriority[key]=math.min(globalRarePriority[key] or position,position)
 end
end
for word in ('Nike|Adidas|Puma|New Balance|Converse|Vans|Skechers|Crocs|LEGO|레고|Mattel|Hasbro|Bandai|반다이|Barbie|Hot Wheels|Play-Doh|Fisher-Price|Apple|Samsung|Sony|Nintendo'):gmatch('[^|]+') do commonAnswers[normalize(word)]=true end
local function orderedWords(entry)
 if not entry then return {} end
 local ranked,priority={},{}
 for i,word in ipairs(splitPriority(entry.title)) do priority[normalize(word)]=i end
 for i,word in ipairs(entry.words) do
  local key=normalize(word)
  local knownRare=priority[key]~=nil or globalRarePriority[key]~=nil
  local length=utf8.len(word) or #word
  local tier=commonAnswers[key] and 3 or (knownRare and 0 or 2)
  local score=priority[key] or (globalRarePriority[key] and 100+globalRarePriority[key]) or (commonAnswers[key] and 100000 or 1000)
  ranked[#ranked+1]={word=word,index=i,rank=rarityFirst and score or 0,tier=tier,length=length}
 end
 table.sort(ranked,function(a,b)
  if rarityFirst and longRareFirst then
   if a.tier~=b.tier then return a.tier<b.tier end
   if a.length~=b.length then return a.length>b.length end
  end
  if a.rank~=b.rank then return a.rank<b.rank end
  return a.index<b.index
 end)
 local result={}
 for _,row in ipairs(ranked) do result[#result+1]=row.word end
 return result
end

local customRecords={}
local matchers={}
local catalogRevision=0
local function rebuildCatalog()
 table.sort(topics,function(a,b) return a.title<b.title end)
 titles,total,uniqueWords={},0,{}
 matchers={};uniqueCount=0
 for _,entry in ipairs(topics) do
  titles[#titles+1]=entry.title;total=total+#entry.words
  for _,word in ipairs(entry.words) do uniqueWords[word:lower()]=true end
  local seen={}
  for _,alias in ipairs(entry.aliases) do
   local key=normalize(alias)
   if key~='' and not seen[key] then
    seen[key]=true
    local record=customRecords[entry.title]
    local custom=record and record.isNew or false
    if record and not custom then
     for _,addedAlias in ipairs(record.aliases) do if normalize(addedAlias)==key then custom=true;break end end
    end
    matchers[#matchers+1]={alias=key,entry=entry,score=utf8.len(alias) or #alias,custom=custom}
   end
  end
 end
 for _ in pairs(uniqueWords) do uniqueCount=uniqueCount+1 end
 table.sort(matchers,function(a,b)
  if a.score==b.score then return a.entry.title<b.entry.title end
  return a.score>b.score
 end)
 catalogRevision=catalogRevision+1
end
rebuildCatalog()
local function classify(raw)
 if #raw>600 or #raw<2 then return end
 local s=normalize(raw)
 local customQuestion=contains(s,'name') or contains(s,'give') or contains(s,'type') or contains(s,'list')
  or s:find('말해',1,true) or s:find('입력',1,true) or s:find('이름',1,true) or s:find('?',1,true) or s:find('고르',1,true) or s:find('하나',1,true)
 for _,matcher in ipairs(matchers) do
  if matcher.custom and (customQuestion or s==matcher.alias or s==normalize(matcher.entry.title)) and contains(s,matcher.alias) then
   return matcher.entry,150+matcher.score
  end
 end
 local north=contains(s,'north america') or contains(s,'north american') or s:find('북미',1,true) or s:find('북아메리카',1,true)
 local south=contains(s,'south america') or contains(s,'south american') or s:find('남미',1,true) or s:find('남아메리카',1,true)
 if north and south then return byTitle['아메리카 국가'],120 end
 if north then return byTitle['북아메리카 국가'],120 end
 if south then return byTitle['남아메리카 국가'],120 end
 local countryPrompt=contains(s,'country') or contains(s,'countries') or s:find('나라',1,true) or s:find('국가',1,true)
 for _,r in ipairs({{'아시아 국가',{'asia','asian','아시아'}},{'유럽 국가',{'europe','european','유럽'}},{'아프리카 국가',{'africa','african','아프리카'}},{'오세아니아 국가',{'oceania','oceanian','오세아니아','대양주'}}}) do
  for _,alias in ipairs(r[2]) do
   if contains(s,alias) and (countryPrompt or s==normalize(alias)) then return byTitle[r[1]],120 end
  end
 end
 -- This game's category labels sometimes omit "brand" entirely.
 if contains(s,'sportswear') or contains(s,'activewear') or s:find('스포츠웨어',1,true) or s:find('운동복 브랜드',1,true) then
  return byTitle['스포츠 브랜드'],120
 end
 local shoePrompt=contains(s,'shoe') or contains(s,'footwear') or contains(s,'sneaker') or s:find('신발',1,true) or s:find('운동화',1,true)
 if shoePrompt then
  local explicitType=contains(s,'type of shoe') or contains(s,'shoe type') or contains(s,'type of footwear') or s:find('신발 종류',1,true) or s:find('신발종류',1,true)
  return byTitle[explicitType and '신발' or '신발 브랜드'],120
 end
 local toyPrompt=contains(s,'toy') or contains(s,'toys') or s:find('장난감',1,true) or s:find('완구',1,true)
 if toyPrompt then
  local explicitType=contains(s,'type of toy') or contains(s,'toy type') or s:find('장난감 종류',1,true) or s:find('장난감종류',1,true)
  return byTitle[explicitType and '장난감' or '장난감 브랜드'],120
 end
 if (contains(s,'avengers') or s:find('어벤져스',1,true) or s:find('어벤저스',1,true)) and (contains(s,'mcu') or contains(s,'movie') or contains(s,'film') or s:find('영화',1,true)) then
  return byTitle['영화 어벤져스 멤버'],120
 end
 local itemPrompt=contains(s,'item') or contains(s,'gear') or contains(s,'tool') or contains(s,'block') or contains(s,'potion') or contains(s,'power up') or contains(s,'power-up')
  or s:find('아이템',1,true) or s:find('도구',1,true) or s:find('기어',1,true) or s:find('블록',1,true) or s:find('물약',1,true)
 if itemPrompt then
  local gameRoutes={
   {'마인크래프트 아이템',{'minecraft','마인크래프트','마크'}},
   {'로블록스 기어',{'roblox','로블록스'}},
   {'테라리아 아이템',{'terraria','테라리아'}},
   {'스타듀밸리 아이템',{'stardew valley','stardew','스타듀밸리','스타듀 밸리'}},
   {'포켓몬 도구',{'pokemon','pokémon','포켓몬'}},
   {'젤다 아이템',{'zelda','젤다'}},
   {'마리오 아이템',{'mario','마리오'}},
   {'동물의숲 도구',{'animal crossing','동물의숲','동물의 숲'}},
  }
  for _,route in ipairs(gameRoutes) do
   for _,name in ipairs(route[2]) do
    if contains(s,name) then
     local title=route[1]
     if title=='마인크래프트 아이템' then
      if contains(s,'block') or s:find('블록',1,true) then title='마인크래프트 블록'
      elseif contains(s,'potion') or s:find('물약',1,true) then title='마인크래프트 물약'
      elseif contains(s,'tool') or s:find('도구',1,true) then title='마인크래프트 도구' end
     end
     return byTitle[title],120
    end
   end
  end
 end
 local characterPrompt=contains(s,'character') or contains(s,'champion') or contains(s,'agent') or contains(s,'hero')
  or s:find('캐릭터',1,true) or s:find('챔피언',1,true) or s:find('요원',1,true)
 if characterPrompt then
  local characterRoutes={
   {'마리오 캐릭터',{'mario','마리오'}},
   {'젤다 캐릭터',{'zelda','젤다'}},
   {'커비 캐릭터',{'kirby','커비'}},
   {'소닉 캐릭터',{'sonic','소닉'}},
   {'동물의숲 캐릭터',{'animal crossing','동물의숲','동물의 숲'}},
   {'스타듀밸리 캐릭터',{'stardew valley','stardew','스타듀밸리','스타듀 밸리'}},
   {'언더테일 캐릭터',{'undertale','언더테일'}},
   {'오버워치 캐릭터',{'overwatch','오버워치'}},
   {'리그 오브 레전드 챔피언',{'league of legends','lol','리그 오브 레전드','롤'}},
   {'발로란트 요원',{'valorant','발로란트'}},
   {'원신 캐릭터',{'genshin impact','genshin','원신'}},
   {'붕괴 스타레일 캐릭터',{'honkai star rail','star rail','스타레일','스타 레일'}},
   {'스폰지밥 캐릭터',{'spongebob','sponge bob','스폰지밥'}},
   {'짱구 캐릭터',{'shin chan','shin-chan','crayon shin chan','짱구'}},
   {'도라에몽 캐릭터',{'doraemon','도라에몽'}},
   {'원피스 캐릭터',{'one piece','원피스'}},
   {'나루토 캐릭터',{'naruto','나루토'}},
   {'드래곤볼 캐릭터',{'dragon ball','dragonball','드래곤볼'}},
   {'귀멸의 칼날 캐릭터',{'demon slayer','kimetsu no yaiba','귀멸의 칼날'}},
   {'명탐정 코난 캐릭터',{'detective conan','case closed','명탐정 코난'}},
   {'닌텐도 캐릭터',{'nintendo','닌텐도'}},
  }
  for _,route in ipairs(characterRoutes) do
   for _,name in ipairs(route[2]) do
    if contains(s,name) then return byTitle[route[1]],120 end
   end
  end
 end
 local song=contains(s,'song') or contains(s,'track') or s:find('노래',1,true) or s:find('곡을',1,true)
 if song then
  for _,row in ipairs(artists) do
   for _,alias in ipairs(row) do
    if contains(s,alias) then return byTitle[songTopicTitle(row[1])],100 end
   end
  end
  return nil -- An unregistered artist must not produce unrelated answers.
 end
 local question=contains(s,'name') or contains(s,'give') or contains(s,'type') or contains(s,'list')
  or s:find('말해',1,true) or s:find('입력',1,true) or s:find('이름',1,true)
  or s:find('?',1,true) or s:find('고르',1,true) or s:find('하나',1,true)
 for _,matcher in ipairs(matchers) do
  if (question or s==matcher.alias or s==normalize(matcher.entry.title)) and contains(s,matcher.alias) then
   return matcher.entry,matcher.score
  end
 end
end
-- User additions are stored separately from the bundled answer database.
local customFile = 'RarestAnswer_CustomHints_v1.json'
local loadNotice = ''
local function clean(value)
 return tostring(value or ''):gsub('[%z\1-\8\11\12\14-\31]',''):match('^%s*(.-)%s*$')
end
local function splitEntries(value)
 local result,seen={},{}
 value=clean(value):gsub('\r','\n'):gsub('，',','):gsub('、',','):gsub('；',';')
 for part in value:gmatch('[^|,;\n]+') do
  local word=clean(part)
  if word~='' and not seen[normalize(word)] then
   if #word>4000 then return nil,'단어나 감지 이름 하나가 너무 길어요.' end
   if word:find('[<>]') then return nil,'단어와 감지 이름에는 < > 문자를 사용할 수 없어요.' end
   seen[normalize(word)]=true;result[#result+1]=word
  end
 end
 return result
end
local function resolveTopic(title)
 if title=='축구 구단' then title='축구 클럽 이름' end
 local key=normalize(clean(title))
 for _,entry in ipairs(topics) do if normalize(entry.title)==key then return entry end end
end
local function appendCustom(title,wordText,aliasText,restoring)
 title=clean(title)
 if title=='' then return nil,'주제 이름을 입력하거나 기존 주제를 선택해 주세요.' end
 if #title>240 or title:find('[<>|,;\n\r]') then return nil,'주제 이름을 짧게 입력해 주세요. 줄바꿈과 구분 문자는 사용할 수 없어요.' end
 if #tostring(wordText or '')>100000 or #tostring(aliasText or '')>10000 then return nil,'한 번에 입력한 내용이 너무 많아요. 나누어 추가해 주세요.' end
 local words,wordError=splitEntries(wordText)
 if not words then return nil,wordError end
 local aliases,aliasError=splitEntries(aliasText)
 if not aliases then return nil,aliasError end
 local entry=resolveTopic(title)
 if #words==0 and not (restoring and entry and #aliases>0) then return nil,'추가할 답 단어를 한 개 이상 입력해 주세요.' end
 if entry then title=entry.title end
 if countryTitles[title] then
  local cleaned={}
  for _,word in ipairs(words) do local short=shortCountryName(word);if short then cleaned[#cleaned+1]=short end end
  words=cleaned
  if #words==0 then return nil,'긴 공화국 명칭 대신 일반 나라 이름을 넣어 주세요.' end
 end
 for _,alias in ipairs(aliases) do
  local key=normalize(alias)
  for _,other in ipairs(topics) do
   if other~=entry then
    if normalize(other.title)==key then return nil,'감지 이름이 다른 주제와 같아요: '..other.title end
    for _,existing in ipairs(other.aliases) do
     if normalize(existing)==key then return nil,'감지 이름이 다른 주제에서 사용 중이에요: '..other.title end
    end
   end
  end
 end
 if not entry then
  -- A new title must not duplicate an existing recognition alias.
  for _,other in ipairs(topics) do
   for _,alias in ipairs(other.aliases) do
    if normalize(alias)==normalize(title) then return nil,'같은 이름으로 감지되는 기존 주제가 있어요: '..other.title end
   end
  end
  addTopic(title,{title},'');entry=byTitle[title]
 end
 local record=customRecords[title] or {title=title,words={},aliases={},isNew=#entry.words==0}
 local seen,aliasSeen={},{ }
 for _,word in ipairs(entry.words) do seen[normalize(word)]=true end
 for _,alias in ipairs(entry.aliases) do aliasSeen[normalize(alias)]=true end
 local count,aliasCount=0,0
 for _,word in ipairs(words) do
  if not seen[normalize(word)] then
   seen[normalize(word)]=true;entry.words[#entry.words+1]=word
   record.words[#record.words+1]=word;count=count+1
  end
 end
 for _,alias in ipairs(aliases) do
  if not aliasSeen[normalize(alias)] then
   aliasSeen[normalize(alias)]=true;entry.aliases[#entry.aliases+1]=alias
   record.aliases[#record.aliases+1]=alias;aliasCount=aliasCount+1
  end
 end
 entry.packed=table.concat(entry.words,'|')
 customRecords[title]=record
 rebuildCatalog()
 return entry,count,aliasCount
end
local function customPayload()
 local records={}
 for _,record in pairs(customRecords) do
  if #record.words>0 or #record.aliases>0 then records[#records+1]={title=record.title,words=record.words,aliases=record.aliases} end
 end
 table.sort(records,function(a,b) return a.title<b.title end)
 return {schemaVersion=1,topics=records}
end
local function saveCustom()
 if type(writefile)~='function' then return false,'자동 저장을 지원하지 않는 환경이에요. 이번 실행에서만 유지됩니다.' end
 local ok=pcall(function()
  local http=game:GetService('HttpService')
  writefile(customFile,http:JSONEncode(customPayload()))
 end)
 if ok then return true,'저장 완료 · 다음 실행 때 자동으로 불러옵니다.' end
 return false,'자동 저장에 실패했어요. 현재 실행에는 추가된 내용이 유지됩니다.'
end
local function loadCustom()
 if type(readfile)~='function' then return end
 if type(isfile)=='function' then
  local ok,exists=pcall(isfile,customFile)
  if not ok or not exists then return end
 end
 local readOk,raw=pcall(readfile,customFile)
 if not readOk then return end
 local decodedOk,payload=pcall(function()
  if type(raw)~='string' or #raw>4000000 then error('invalid save size') end
  return game:GetService('HttpService'):JSONDecode(raw)
 end)
 if not decodedOk or type(payload)~='table' or payload.schemaVersion~=1 or type(payload.topics)~='table' then
  loadNotice='저장된 추가 목록을 읽지 못했어요. 기본 목록은 그대로 사용할 수 있습니다.';return
 end
 local loaded,skipped=0,0
 for _,record in ipairs(payload.topics) do
  local valid=type(record)=='table' and type(record.title)=='string' and type(record.words)=='table' and (record.aliases==nil or type(record.aliases)=='table')
  if valid then
   for _,word in ipairs(record.words) do if type(word)~='string' then valid=false;break end end
   for _,alias in ipairs(record.aliases or {}) do if type(alias)~='string' then valid=false;break end end
  end
  if valid then
   local entry=appendCustom(record.title,table.concat(record.words,'|'),table.concat(record.aliases or {},'|'),true)
   if entry then loaded=loaded+1 else skipped=skipped+1 end
  else skipped=skipped+1 end
 end
 loadNotice=('저장된 추가 목록 %d개 불러옴'):format(loaded)
 if skipped>0 then loadNotice=loadNotice..(' · 읽지 못한 항목 %d개'):format(skipped) end
end
loadCustom()

local detectionState={tracked=0,read=0,questions=0,errors=0,recovered=false}
local detectionStatus,refreshDetection
local window=Wind:CreateWindow({Title='Rarest Answer · 희귀 답 힌트',Author='v17 · 내 차례·답 입력칸 탐색 수정',Size=UDim2.fromOffset(490,390),Acrylic=false,ScrollBarEnabled=true})
local tab=window:Tab({Title='힌트'})
local statsParagraph=tab:Paragraph({Title='등록된 힌트',Desc=('주제 %d개 · 주제별 답 후보 합계 %d개\n중복을 제외한 답 문구 %d개'):format(#topics,total,uniqueCount)})
local topicLabel=tab:Paragraph({Title='주제 감지',Desc='게임 질문을 기다리는 중'})
local output=tab:Paragraph({Title='답 후보',Desc='주제를 선택하거나 게임 질문을 기다려 주세요.'})
local autoInput,typingSpeed=false,300
local autoInputControl,autoInputButton
local typingNotice
local typingGeneration,typingBusy=0,false
local activeQuestionKey,inputStatus,typeHintNow,cancelTyping,tryAutoInput
local alive,automatic,last=true,true,nil
local current,idx,currentEntry={},1,nil
local miniFrame,miniTopic,miniFooter,hintScale,miniList
local hintScalePercent=100
local miniRows={}
local function render()
 local lines={}
 for i=idx,math.min(idx+4,#current) do lines[#lines+1]=current[i] end
 output:SetDesc(#lines>0 and ('%d–%d / %d\n'):format(idx,idx+#lines-1,#current)..table.concat(lines,'\n') or '등록된 후보가 없어요.')
 if miniList then miniList.CanvasPosition=Vector2.new(0,0) end
 if miniTopic then miniTopic.Text=(automatic and '자동 · ' or '수동 · ')..(currentEntry and currentEntry.title or '주제 감지 대기 중') end
 for slot,row in ipairs(miniRows) do
  local word=current[idx+slot-1]
  local rank=idx+slot-1
  row.Text=word and ((rank==1 and '★ 1. ' or tostring(rank)..'. ')..word) or (slot==1 and '질문을 기다리는 중…' or '')
 end
 if miniFooter then
  local note=rarityFirst and (longRareFirst and '긴 희귀 이름 우선 · 추정 순위' or '전체 후보 예상 희귀순 · 실제 점수 아님') or '등록된 순서'
  if currentEntry and currentEntry.title=='어벤져스 멤버' then note='코믹스 역대 멤버 포함 · '..note end
  miniFooter.Text=(#current>0 and ('%d–%d / %d · '):format(idx,math.min(idx+4,#current),#current) or '')..note
 end
end
local function choose(entry)
 currentEntry=entry;current=orderedWords(entry);idx=1;render()
end
local function nextHints()
 if #current>0 then idx=idx+5;if idx>#current then idx=1 end;render() end
end
local function firstHints()
 -- Rebuild the full order, then show positions 1 through 5, even from later pages.
 choose(currentEntry)
end
local function setHintScale(value)
 hintScalePercent=math.clamp(tonumber(value) or 100,60,150)
 if hintScale then hintScale.Scale=hintScalePercent/100 end
 if miniFrame then
  local camera=game:GetService('Workspace').CurrentCamera
  if camera then
   local scale=hintScalePercent/100
   miniFrame.Position=UDim2.fromOffset(
    math.clamp(miniFrame.Position.X.Offset,0,math.max(0,camera.ViewportSize.X-278*scale)),
    math.clamp(miniFrame.Position.Y.Offset,0,math.max(0,camera.ViewportSize.Y-270*scale-30)))
  end
 end
end
local function manual(entry)
 last=nil
 topicLabel:SetDesc((automatic and '미리보기 · 자동감지 유지: ' or '수동 선택: ')..entry.title..'\n주제를 고정하려면 자동감지를 꺼 주세요.')
 choose(entry)
end
local wordTargetDropdown
local topicDropdown=tab:Dropdown({Title='주제 검색 · 선택',Values=titles,SearchBarEnabled=true,AllowNone=false,Callback=function(value)
 local entry=byTitle[value]
 if entry then manual(entry) end
end})
tab:Input({Title='질문 직접 넣기',Placeholder='예: Name a dog breed / 한국 음식을 말해 보세요',Callback=function(value)
 if tostring(value):match('^%s*$') then return end
 local entry=byTitle[tostring(value)] or classify(value)
 if entry then manual(entry) else output:SetDesc('일치하는 주제가 없어요. 주제 검색에서 직접 선택해 주세요.') end
end})
tab:Button({Title='전체 후보 중 처음 5개',Callback=firstHints})
tab:Button({Title='다음 후보 5개',Callback=nextHints})
local sizeSlider=tab:Slider({Title='작은 힌트 창 크기 (%)',Desc='설정에서 60%~150%로 조절합니다. 글자와 버튼도 함께 바뀝니다.',Value={Min=60,Max=150,Default=100},Step=5,Callback=setHintScale})
tab:Button({Title='힌트 창 기본 크기 (100%)',Callback=function() setHintScale(100);sizeSlider:Set(100) end})
tab:Toggle({Title='희귀 후보 먼저 · 추정',Value=true,Callback=function(value) rarityFirst=value;choose(currentEntry) end})
tab:Toggle({Title='긴 희귀 이름 먼저',Value=true,Callback=function(value) longRareFirst=value;choose(currentEntry) end})
tab:Button({Title='주제 자동 감지 켜기',Callback=function()
 automatic=true;last=nil;topicLabel:SetDesc('게임 질문을 기다리는 중');render()
end})
tab:Button({Title='주제 자동 감지 끄기',Callback=function()
 automatic=false;topicLabel:SetDesc('수동 선택 모드');render()
end})
tab:Paragraph({Title='참고',Desc='힌트와 답 입력을 보조합니다. 제출은 게임 버튼으로 합니다. 희귀도 순위와 게임 허용 여부는 확인되지 않았어요. 시작 글자·글자 수 등 추가 조건은 직접 확인해 주세요.'})
inputStatus=tab:Paragraph({Title='자동입력 상태',Desc='자동입력은 기본 꺼짐입니다. 내 닉네임의 차례 + 답 입력칸이 확인될 때만 타이핑합니다. 제출은 게임 버튼으로 합니다.'})
autoInputControl=tab:Toggle({Title='내 차례 자동입력',Value=false,Callback=function(value)
 autoInput=value
 if autoInputButton then autoInputButton.Text=value and '입력 ON' or '입력 OFF' end
 if not value and cancelTyping then cancelTyping('자동입력 꺼짐') end
end})
tab:Slider({Title='타자 속도 (글자/분)',Value={Min=60,Max=1200,Default=300},Step=30,Callback=function(value) typingSpeed=math.clamp(tonumber(value) or 300,60,1200) end})
tab:Button({Title='지금 표시된 첫 힌트 입력',Callback=function() if typeHintNow then typeHintNow() end end})
tab:Button({Title='타이핑 중단',Callback=function() if cancelTyping then cancelTyping('입력을 중단했어요.') end end})
detectionStatus=tab:Paragraph({Title='자동 감지 진단',Desc='전광판과 화면 질문을 확인 중입니다.'})
tab:Button({Title='질문 다시 찾기',Callback=function()
 automatic=true;last=nil;activeQuestionKey=nil
 if cancelTyping then cancelTyping() end
 if refreshDetection then refreshDetection() end
 choose(nil)
end})
local editTab=window:Tab({Title='주제 · 단어 추가'})
editTab:Paragraph({Title='내 힌트 추가',Desc='새 주제를 만들거나 기존 주제에 답을 추가할 수 있어요. 여러 단어는 쉼표(,), 줄바꿈, |로 구분하세요. 띄어쓰기는 단어 안에 그대로 유지됩니다.'})
local editStatus=editTab:Paragraph({Title='추가 상태',Desc=loadNotice~='' and loadNotice or '저장 기능을 지원하는 환경에서는 추가한 내용이 자동 저장됩니다.'})
local newTitle,newAliases,newWords='','',''
editTab:Input({Title='새 주제 이름',Placeholder='예: 쿠키런 캐릭터',Value='',Callback=function(v) newTitle=tostring(v) end})
editTab:Input({Title='자동 감지 이름 · 선택 사항',Placeholder='예: cookie run character, 쿠키런 등장인물',Value='',Callback=function(v) newAliases=tostring(v) end})
editTab:Input({Title='새 주제의 답 단어',Placeholder='예: 용감한 쿠키, 명랑한 쿠키, GingerBrave',Value='',Callback=function(v) newWords=tostring(v) end})
local wordTarget,wordInput,wordAliases='','',''
local function afterAddition(entry,count,aliasCount)
 local saved,message=saveCustom()
 statsParagraph:SetDesc(('주제 %d개 · 주제별 답 후보 합계 %d개\n중복을 제외한 답 문구 %d개'):format(#topics,total,uniqueCount))
 topicDropdown:Refresh(titles);topicDropdown:Select(entry.title)
 if wordTargetDropdown then wordTargetDropdown:Refresh(titles);wordTargetDropdown:Select(entry.title) end
 wordTarget=entry.title;last=nil;manual(entry)
 editStatus:SetDesc(('%s\n새 답 %d개 · 감지 이름 %d개 추가\n%s'):format(entry.title,count,aliasCount,message))
end
editTab:Button({Title='새 주제 + 답 단어 추가',Callback=function()
 if resolveTopic(newTitle) then editStatus:SetDesc('이미 있는 주제예요. 아래 기존 주제 단어 추가를 이용해 주세요.');return end
 local entry,count,aliasCount=appendCustom(newTitle,newWords,newAliases)
 if not entry then editStatus:SetDesc(count);return end
 afterAddition(entry,count,aliasCount)
end})
editTab:Paragraph({Title='기존 주제에 단어 추가',Desc='주제를 고르고 새 답을 입력하세요. 중복 단어는 자동으로 건너뜁니다.'})
wordTargetDropdown=editTab:Dropdown({Title='단어를 추가할 기존 주제',Values=titles,SearchBarEnabled=true,AllowNone=false,Callback=function(value) wordTarget=value or '' end})
editTab:Input({Title='기존 주제에 넣을 답 단어',Placeholder='예: 피스타치오, 흑임자, 녹차',Value='',Callback=function(v) wordInput=tostring(v) end})
editTab:Input({Title='기존 주제의 감지 이름 추가 · 선택 사항',Placeholder='예: ice cream flavours',Value='',Callback=function(v) wordAliases=tostring(v) end})
editTab:Button({Title='선택한 주제에 단어 추가',Callback=function()
 if not resolveTopic(wordTarget) then editStatus:SetDesc('단어를 추가할 기존 주제를 먼저 선택해 주세요.');return end
 local entry,count,aliasCount=appendCustom(wordTarget,wordInput,wordAliases)
 if not entry then editStatus:SetDesc(count);return end
 afterAddition(entry,count,aliasCount)
end})
editTab:Button({Title='추가한 내용 다시 저장',Callback=function()
 local saved,message=saveCustom();editStatus:SetDesc(message)
end})

local pg=game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui')
local world=game:GetService('Workspace')
local nodes,connections={},{}
-- Compact player-facing hints; the full WindUI window is for managing the database.
local managementRequested=false
local hintOverlayGui=Instance.new('ScreenGui')
hintOverlayGui.Name='WindUI_RarestHintsOverlay'
hintOverlayGui.ResetOnSpawn=false
hintOverlayGui.DisplayOrder=1000
hintOverlayGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
hintOverlayGui.Parent=pg
local function styleCorner(parent,radius)
 local corner=Instance.new('UICorner');corner.CornerRadius=UDim.new(0,radius);corner.Parent=parent
end
local function label(parent,text,x,y,width,height,size)
 local item=Instance.new('TextLabel')
 item.BackgroundTransparency=1;item.BorderSizePixel=0;item.Text=text
 item.Position=UDim2.fromOffset(x,y);item.Size=UDim2.fromOffset(width,height)
 item.Font=Enum.Font.Gotham;item.TextSize=size or 14;item.TextColor3=Color3.fromRGB(235,238,247)
 item.TextXAlignment=Enum.TextXAlignment.Left;item.TextYAlignment=Enum.TextYAlignment.Center
 item.TextWrapped=true;item.RichText=false;item.Parent=parent;return item
end
local function button(parent,text,x,y,width,height,callback)
 local item=Instance.new('TextButton')
 item.Text=text;item.Position=UDim2.fromOffset(x,y);item.Size=UDim2.fromOffset(width,height)
 item.Font=Enum.Font.GothamBold;item.TextSize=13;item.TextColor3=Color3.fromRGB(245,246,252)
 item.BackgroundColor3=Color3.fromRGB(54,64,92);item.BorderSizePixel=0;item.AutoButtonColor=true
 item.Parent=parent;styleCorner(item,7)
 connections[#connections+1]=item.Activated:Connect(callback)
 return item
end
miniFrame=Instance.new('Frame')
miniFrame.Name='FiveHints';miniFrame.Size=UDim2.fromOffset(278,270)
miniFrame.Position=UDim2.fromOffset(12,120);miniFrame.BackgroundColor3=Color3.fromRGB(20,24,36)
miniFrame.BackgroundTransparency=0.08;miniFrame.BorderSizePixel=0;miniFrame.Parent=hintOverlayGui
styleCorner(miniFrame,12)
hintScale=Instance.new('UIScale');hintScale.Scale=hintScalePercent/100;hintScale.Parent=miniFrame
setHintScale(hintScalePercent)
local header=Instance.new('Frame')
header.Name='DragHeader';header.Size=UDim2.new(1,0,0,30);header.BackgroundTransparency=1;header.Active=true;header.Parent=miniFrame
label(header,'희귀 힌트 · 5개',10,0,132,30,14).Font=Enum.Font.GothamBold
button(header,'자동',146,3,44,24,function() automatic=true;last=nil;activeQuestionKey=nil;if cancelTyping then cancelTyping('질문을 다시 감지합니다.') end;if refreshDetection then refreshDetection() end;choose(nil) end)
button(header,'입력',197,3,42,24,function() if typeHintNow then typeHintNow() end end)
button(header,'×',245,3,26,24,function() miniFrame.Visible=false end)
miniTopic=label(miniFrame,'주제 감지 대기 중',10,31,184,22,13)
autoInputButton=button(miniFrame,'입력 OFF',199,31,69,22,function()
 local value=not autoInput;autoInput=value;autoInputButton.Text=value and '입력 ON' or '입력 OFF'
 if autoInputControl then autoInputControl:Set(value) end
 if not value and cancelTyping then cancelTyping('자동입력 꺼짐') end
 if value and tryAutoInput then tryAutoInput() end
end)
autoInputButton.TextSize=11
miniTopic.TextColor3=Color3.fromRGB(136,188,255)
miniList=Instance.new('ScrollingFrame')
miniList.Name='FiveLongHints';miniList.Position=UDim2.fromOffset(10,55);miniList.Size=UDim2.fromOffset(258,150)
miniList.BackgroundTransparency=1;miniList.BorderSizePixel=0;miniList.ScrollBarThickness=4
miniList.AutomaticCanvasSize=Enum.AutomaticSize.Y;miniList.CanvasSize=UDim2.fromOffset(0,0)
miniList.ScrollingDirection=Enum.ScrollingDirection.Y;miniList.Parent=miniFrame
local hintLayout=Instance.new('UIListLayout');hintLayout.Padding=UDim.new(0,5);hintLayout.SortOrder=Enum.SortOrder.LayoutOrder;hintLayout.Parent=miniList
for i=1,5 do
 local row=label(miniList,'',0,0,252,30,14)
 row.Size=UDim2.new(1,-6,0,30);row.AutomaticSize=Enum.AutomaticSize.Y;row.LayoutOrder=i
 row.TextYAlignment=Enum.TextYAlignment.Top
 if i==1 then row.TextColor3=Color3.fromRGB(255,211,103) end
 miniRows[i]=row
end
miniFooter=label(miniFrame,'예상 희귀순 · 실제 게임 점수 아님',10,205,258,24,10)
miniFooter.TextColor3=Color3.fromRGB(159,168,190)
button(miniFrame,'처음 5개',10,233,80,27,firstHints)
button(miniFrame,'다음 5개',96,233,80,27,nextHints)
button(miniFrame,'설정 · 추가',182,233,86,27,function()
 managementRequested=true;window:Open()
end)
local launcher=button(hintOverlayGui,'힌트 5',12,70,66,35,function()
 miniFrame.Visible=not miniFrame.Visible
end)
launcher.Name='HintLauncher'
-- Drag only from the compact header; tapping hints and controls stays independent.
local inputService=game:GetService('UserInputService')
local dragging,dragToken,dragStart,frameStart=false,nil,nil,nil
connections[#connections+1]=header.InputBegan:Connect(function(input)
 if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
  dragging=true;dragToken=input;dragStart=input.Position;frameStart=miniFrame.AbsolutePosition
 end
end)
connections[#connections+1]=inputService.InputChanged:Connect(function(input)
 if not dragging then return end
 if input~=dragToken and input.UserInputType~=Enum.UserInputType.MouseMovement then return end
 local dx=input.Position.X-dragStart.X;local dy=input.Position.Y-dragStart.Y
 local x,y=frameStart.X+dx,frameStart.Y+dy
 local camera=world.CurrentCamera
 if camera then
  x=math.clamp(x,0,math.max(0,camera.ViewportSize.X-278*(hintScalePercent/100)))
  y=math.clamp(y,0,math.max(0,camera.ViewportSize.Y-270*(hintScalePercent/100)-30))
 end
 miniFrame.Position=UDim2.fromOffset(x,y)
end)
connections[#connections+1]=inputService.InputEnded:Connect(function(input)
 if input==dragToken or input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false;dragToken=nil end
end)
window.IsOpenButtonEnabled=false
if window.OpenButtonMain then window.OpenButtonMain:Visible(false) end
-- WindUI opens its main window asynchronously on creation. Let that finish first.
task.wait(0.12)
if not managementRequested then window:Close() end
render()

local function track(o)
 if o:IsA('TextLabel') or o:IsA('TextButton') or (o:IsA('TextBox') and o.TextEditable==false) then nodes[o]=nodes[o] or {} end
end
refreshDetection=function()
 for _,root in ipairs({pg,world}) do
  for _,node in ipairs(root:GetDescendants()) do track(node) end
 end
 for node in pairs(nodes) do if not node.Parent then nodes[node]=nil end end
end
local lastDetectionRefresh=os.clock()
-- Index text nodes once. Text is inspected only when it belongs to PlayerGui
-- or to an enabled SurfaceGui attached to the workspace hierarchy.
for _,root in ipairs({pg,world}) do
 connections[#connections+1]=root.DescendantAdded:Connect(track)
 connections[#connections+1]=root.DescendantRemoving:Connect(function(o) nodes[o]=nil end)
end
for _,o in ipairs(pg:GetDescendants()) do track(o) end
for i,o in ipairs(world:GetDescendants()) do
 track(o)
 if i%1500==0 then task.wait() end
end
local function guiSource(o,relaxed)
 local origin=o
 local parent=o
 local surface,billboard=false,false
 while parent and parent~=pg and parent~=world do
  if parent==hintOverlayGui or parent==Wind.ScreenGui or parent==Wind.NotificationGui or parent==Wind.DropdownGui or parent==Wind.TooltipGui then return nil end
  local name=parent.Name:lower()
  if name:find('windui',1,true) then return nil end
  if parent:IsA('SurfaceGui') then surface=true end
  if parent:IsA('BillboardGui') then billboard=true end
  if parent:IsA('GuiObject') and not parent.Visible then return nil end
  if parent:IsA('LayerCollector') and not parent.Enabled then return nil end
  parent=parent.Parent
 end
 local kind
 if parent==pg then kind=surface and 'SurfaceGui' or (billboard and 'BillboardGui' or 'PlayerGui')
 elseif parent==world then kind=surface and 'SurfaceGui' or (billboard and 'BillboardGui' or nil) end
 if not kind then return nil end
 -- World-space canvas coordinates are not screen pixel coordinates.
 -- Never reject a board because its clipping rectangle or part pivot is unusual.
 if kind=='PlayerGui' then
  parent=o
  while parent and parent~=pg do
   local name=parent.Name:lower()
   if name=='chat' or name=='chatgui' or name=='experiencechat' or name=='chatwindow' then return nil end
   if not relaxed then
    if parent:IsA('CanvasGroup') and parent.GroupTransparency>=0.98 then return nil end
    if parent~=origin and parent:IsA('GuiObject') and parent.ClipsDescendants then
     local p,size=parent.AbsolutePosition,parent.AbsoluteSize
     local q,extent=origin.AbsolutePosition,origin.AbsoluteSize
     if p and q and size and extent and (q.X+extent.X<=p.X or q.Y+extent.Y<=p.Y or q.X>=p.X+size.X or q.Y>=p.Y+size.Y) then return nil end
    end
   end
   parent=parent.Parent
  end
 end
 if not relaxed and (o:IsA('TextLabel') or o:IsA('TextButton') or o:IsA('TextBox')) then
  if o.TextTransparency>=0.98 and o.TextStrokeTransparency>=0.98 then return nil end
 end
 return kind
end

-- Fill only the visible answer field. The game submit button remains user-controlled.
local lastTypingNotice
local function typingStatus(message)
 typingNotice=message
 if inputStatus and message~=lastTypingNotice then inputStatus:SetDesc(message) end
 lastTypingNotice=message
 if miniFooter and (autoInput or message=='자동입력 꺼짐') then miniFooter.Text=(autoInput and '입력 ON · ' or '입력 OFF · ')..message end
end
local function plainIdentity(text)
 return normalize(text):gsub('​',''):gsub('﻿',''):gsub(' ',' '):match('^%s*(.-)%s*$')
end
local function ownTurn()
 local player=game:GetService('Players').LocalPlayer
 local name,display=plainIdentity(player.Name or ''),plainIdentity(player.DisplayName or '')
 local found,best,observed=false,nil,nil
 local function matches(identity)
  identity=plainIdentity(identity):gsub('^@','')
  return (name~='' and (identity==name or contains(identity,name))) or (display~='' and (identity==display or contains(identity,display)))
 end
 for node in pairs(nodes) do
  pcall(function()
   local kind=node.Parent and guiSource(node,true)
   if not kind or not (node:IsA('TextLabel') or node:IsA('TextButton')) then return end
   local text=plainIdentity(node.Text)
   if text:find('?',1,true) or text:find('말해',1,true) or text:match('^name%s') then return end
   local owner=text:match('^(.-)%s*의%s*차례')
   local englishTurn=contains(text,'your turn') or text:match("'s%s+turn") or text:match('^turn%s*[:%-]')
   local marker=owner~=nil or text=='차례' or text=='의 차례' or text=='현재 차례' or englishTurn
   if not marker then return end
   local mine=false
   local identity=owner or text
   if owner and owner~='' then mine=matches(owner)
   elseif contains(text,'your turn') then mine=true
   elseif contains(text,'turn') and matches(text) then mine=true
   elseif (owner=='' or text=='차례' or text=='의 차례' or text=='현재 차례') and node.Parent and node.Parent~=pg and node.Parent~=world then
    -- Some versions render the nickname and "의 차례" as separate labels.
    local siblings=node.Parent:GetDescendants()
    if #siblings<=150 then
     for _,sibling in ipairs(siblings) do
      if sibling~=node and (sibling:IsA('TextLabel') or sibling:IsA('TextButton')) and guiSource(sibling,true) then
       local p,q=node.AbsolutePosition,sibling.AbsolutePosition
       if p and q and math.abs(p.Y-q.Y)<=math.max(node.AbsoluteSize.Y,sibling.AbsoluteSize.Y)+8 and math.abs(p.X-q.X)<600 then
        local candidate=plainIdentity(sibling.Text)
        if matches(candidate) then mine=true;identity=candidate;break end
       end
      end
     end
    end
   end
   local score=(kind=='SurfaceGui' and 3000 or (kind=='BillboardGui' and 2500 or 0))+math.min(node.TextSize,120)
   if not best or score>best then found,best,observed=mine,score,identity end
  end)
 end
 return found,observed
end
local function isGuideText(text)
 local value=plainIdentity(text):gsub('…',''):gsub('%.',''):gsub('%s+','')
 return value=='' or value=='답을입력하세요' or value=='답을입력해주세요' or value=='enteryouranswer' or value=='typeyouranswer' or value=='answerhere'
end
local function answerBox()
 local boxes,submit={},nil
 local candidates=pg:GetDescendants()
 for _,node in ipairs(candidates) do
  pcall(function()
   if not guiSource(node,true) then return end
   if node:IsA('TextBox') and node.TextEditable~=false and node.AbsoluteSize.X>0 and node.AbsoluteSize.Y>0 then boxes[#boxes+1]=node
   elseif node:IsA('TextButton') or node:IsA('ImageButton') then
    local caption=node:IsA('TextButton') and plainIdentity(node.Text) or ''
    if caption~='제출' and caption~='submit' then
     for _,child in ipairs(node:GetDescendants()) do
      if child:IsA('TextLabel') then
       local value=plainIdentity(child.Text)
       if value=='제출' or value=='submit' then caption=value;break end
      end
     end
    end
    if caption=='제출' or caption=='submit' then submit=node end
   end
  end)
 end
 local best,bestScore
 for _,box in ipairs(boxes) do
  local placeholder=plainIdentity(box.PlaceholderText or '')
  local name=plainIdentity(box.Name)
  local score=0
  if placeholder:find('답',1,true) or contains(placeholder,'answer') then score=score+120 end
  if name:find('answer',1,true) or name:find('답',1,true) then score=score+50 end
  if box.Text~='' and isGuideText(box.Text) then score=score+80 end
  local parent=box.Parent
  if parent and parent~=pg then
   local children=parent:GetDescendants()
   if #children<=100 then
    for _,child in ipairs(children) do
     if child:IsA('TextLabel') and child.Text~='' and isGuideText(child.Text) then score=score+60;break end
    end
   end
  end
  if submit then
   local p,q=box.AbsolutePosition,submit.AbsolutePosition
   if p and q and math.abs(p.Y-q.Y)<=math.max(box.AbsoluteSize.Y,submit.AbsoluteSize.Y) then score=score+20 end
  end
  if score>0 and (not bestScore or score>bestScore) then best,bestScore=box,score end
 end
 -- A unique visible editable game textbox is sufficient; do not require a text submit button.
 if not best and #boxes==1 then best=boxes[1] end
 return best,submit,#boxes
end
cancelTyping=function(message)
 typingGeneration=typingGeneration+1;typingBusy=false
 if message then typingStatus(message) end
end
local function beginTyping(word)
 if typingBusy then return false end
 if not word then typingStatus('질문/추천 단어를 기다리는 중입니다.');return false end
 local mine,owner=ownTurn()
 if not mine then typingStatus(owner and ('다른 차례 표시: '..owner) or '닉네임의 차례 표시를 찾지 못했어요.');return false end
 local box,submit,count=answerBox()
 if not box then typingStatus(('답 입력칸 선택 불가 · 편집칸 %d개'):format(count));return false end
 if not isGuideText(box.Text) then typingStatus('입력칸에 내용이 있어 덮어쓰지 않습니다.');return false end
 if box.Text~='' then box.Text='' end
 typingGeneration=typingGeneration+1
 local generation=typingGeneration
 local topic=currentEntry and currentEntry.title
 typingBusy=true;typingStatus('타이핑 중: '..word)
 task.spawn(function()
  local expected=''
  local ok=pcall(function()
   for _,codepoint in utf8.codes(word) do
    if generation~=typingGeneration or not alive then return end
    if not box.Parent or not guiSource(box,true) or not ownTurn() or (currentEntry and currentEntry.title or nil)~=topic then
     cancelTyping('차례/질문이 바뀌어 중단했어요.');return
    end
    if box.Text~=expected then cancelTyping('직접 입력한 내용이 바뀌어 중단했어요.');return end
    expected=expected..utf8.char(codepoint);box.Text=expected
    task.wait(60/typingSpeed)
   end
  end)
  if generation~=typingGeneration then return end
  typingBusy=false
  if not ok then typingStatus('입력칸에 쓰지 못했어요. 입력칸을 한 번 누른 뒤 입력 버튼을 눌러주세요.');return end
  typingStatus('입력 완료 · 제출은 게임 버튼으로 해주세요.')
 end)
 return true
end
typeHintNow=function() beginTyping(current[idx]) end
local attemptedTurn,lastWasMine,turnNumber=nil,false,0
tryAutoInput=function()
 if not autoInput then return end
 if not automatic then typingStatus('수동 주제 모드입니다. 작은 창의 자동 버튼을 눌러주세요.');return end
 local mine,owner=ownTurn()
 if not mine then
  lastWasMine=false;attemptedTurn=nil
  if typingBusy then cancelTyping('다른 플레이어 차례라 중단했어요.')
  else typingStatus(owner and ('다른 차례: '..owner) or '내 닉네임의 차례 표시를 기다리는 중입니다.') end
  return
 end
 if not lastWasMine then turnNumber=turnNumber+1;lastWasMine=true end
 if not activeQuestionKey or not currentEntry or not current[1] then typingStatus('내 차례 확인됨 · 질문/힌트 감지 대기');return end
 local key=tostring(turnNumber)..'\n'..currentEntry.title
 if not typingBusy and attemptedTurn~=key then
  if beginTyping(current[1]) then attemptedTurn=key end
 end
end

window:OnDestroy(function()
 if cancelTyping then cancelTyping() end
 alive=false
 hintOverlayGui:Destroy()
 for _,connection in ipairs(connections) do connection:Disconnect() end
 table.clear(nodes)
end)
local function questionQuality(raw,node)
 local text=normalize(raw)
 if text=='' or #text>1200 then return nil end
 -- A real question stays valid even when an ancestor happens to be named Scoreboard.
 if text:find('말해',1,true) or text:find('이름은',1,true) or text:find('종류는',1,true)
  or text:find('이름을',1,true) or text:match('^name%s') or text:match('^give%s') or text:match('^list%s') then return 5,true end
 if text:find('?',1,true) or text:find('？',1,true) then return 4,true end
 local parent=node
 while parent and parent~=pg and parent~=world do
  local name=parent.Name:lower()
  if name:find('previous',1,true) or name:find('history',1,true) or name:find('dropdown',1,true) or name:find('topiclist',1,true) then return nil end
  if name:find('question',1,true) or name:find('prompt',1,true) then return 1,true end
  parent=parent.Parent
 end
 return nil
end
local function questionPosition(node,kind)
 local camera=world.CurrentCamera
 if not camera then return 0 end
 local viewport=camera.ViewportSize
 if not viewport or viewport.X<=0 or viewport.Y<=0 then return 0 end
 local position
 if kind=='PlayerGui' then
  local p,size=node.AbsolutePosition,node.AbsoluteSize
  if p and size then
   if p.X+size.X<=0 or p.Y+size.Y<=0 or p.X>=viewport.X or p.Y>=viewport.Y then return -500 end
   position={X=p.X+size.X/2,Y=p.Y+size.Y/2}
  end
 else
  local canvas=node.Parent
  while canvas and canvas~=pg and canvas~=world and not canvas:IsA('SurfaceGui') and not canvas:IsA('BillboardGui') do canvas=canvas.Parent end
  if canvas and (canvas:IsA('SurfaceGui') or canvas:IsA('BillboardGui')) then
   local adornee=canvas.Adornee or canvas.Parent
   if adornee and adornee:IsA('BasePart') then
    local ok,point=pcall(function() return camera:WorldToViewportPoint(adornee.Position) end)
    if ok and point then
     if point.Z<=0 then return -500 end
     position=point
    end
   end
  end
 end
 if not position then return 0 end
 local dx,dy=position.X/viewport.X-.5,position.Y/viewport.Y-.48
 return math.max(-500,400-math.sqrt(dx*dx+dy*dy)*600)
end
local lastDiagnostic
local function showDetectionState()
 local message=('등록 텍스트 %d개 · 읽은 UI %d개 · 질문 후보 %d개\n%s'):format(detectionState.tracked,detectionState.read,detectionState.questions,detectionState.recovered and '복구 감지 사용 중' or '기본 감지')
 if detectionState.errors>0 then message=message..('\n읽기 오류 %d개는 건너뛰었습니다.'):format(detectionState.errors) end
 if message~=lastDiagnostic then
  lastDiagnostic=message
  if detectionStatus then detectionStatus:SetDesc(message) end
 end
 if not currentEntry and miniFooter then
  miniFooter.Text=('질문 탐색 · 텍스트 %d / 질문 %d'):format(detectionState.tracked,detectionState.questions)
 end
end
local function detectQuestion()
 local selected,source,best,sourceKind
 detectionState.tracked=0;detectionState.read=0;detectionState.questions=0;detectionState.errors=0;detectionState.recovered=false
 for _ in pairs(nodes) do detectionState.tracked=detectionState.tracked+1 end
 local function scan(relaxed)
  for node,cache in pairs(nodes) do
   local ok,entry,raw,kind,score=pcall(function()
    if not node.Parent then return end
    local kind=guiSource(node,relaxed)
    if not kind then return end
    if node:IsA('TextBox') and node.TextEditable~=false then return end
    detectionState.read=detectionState.read+1
    local raw=node.Text
    local quality,named=questionQuality(raw,node)
    if not quality then return end
    if relaxed and quality<4 then return end
    detectionState.questions=detectionState.questions+1
    if cache.text~=raw or cache.revision~=catalogRevision then
     if cache.text and cache.text~=raw then cache.changedAt=os.clock() end
     cache.revision=catalogRevision;cache.text=raw;cache.entry,cache.specificity=classify(raw)
    end
    if not cache.entry and quality<4 then return end
    local fresh=cache.changedAt and os.clock()-cache.changedAt<8 and 400 or 0
    local positionScore=questionPosition(node,kind)
    local sourceScore=kind=='SurfaceGui' and 2000 or (kind=='BillboardGui' and 1500 or 0)
    local score=quality*1000+sourceScore+positionScore+(named and 250 or 0)+fresh+math.min(node.TextSize,120)
    return cache.entry,raw,kind,score
   end)
   if not ok then detectionState.errors=detectionState.errors+1
   elseif score and (not best or score>best or (score==best and raw<(source or raw))) then
    selected,source,best,sourceKind=entry,raw,score,kind
   end
  end
 end
 scan(false)
 if not source then detectionState.recovered=true;scan(true) end
 showDetectionState()
 return selected,source,sourceKind
end

task.spawn(function()
 while alive do
  if automatic then
   local selected,source,kind=detectQuestion()
   local sourceKey=source and (kind..'\n'..source..'\n'..catalogRevision)
   activeQuestionKey=sourceKey
   if sourceKey and sourceKey~=last then
    last=sourceKey
    if selected then
     topicLabel:SetDesc('감지: '..selected.title..'\n위치: '..(kind=='SurfaceGui' and '전광판 SurfaceGui' or (kind=='BillboardGui' and '전광판 BillboardGui' or '화면 PlayerGui'))..'\n'..source)
     choose(selected)
    else
     topicLabel:SetDesc('현재 질문은 감지했지만 주제가 미등록입니다.\n'..source)
     choose(nil)
     if miniTopic then miniTopic.Text='자동 · 미등록 질문' end
    end
   elseif not source and (last or currentEntry) then
    last=nil;choose(nil);topicLabel:SetDesc('질문 미감지 · 화면 UI와 SurfaceGui를 확인 중입니다.')
   end
  end
  if automatic and not activeQuestionKey and os.clock()-lastDetectionRefresh>8 then
   lastDetectionRefresh=os.clock()
   pcall(refreshDetection)
  end
  if tryAutoInput then
   local ok=pcall(tryAutoInput)
   if not ok and inputStatus then inputStatus:SetDesc('입력 UI를 다시 확인 중입니다.') end
  end
  task.wait(.35)
 end
end)
