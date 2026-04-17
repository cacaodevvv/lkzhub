--[[
    LKZ HUB - FREDOKA ONE EDITION
    Lead Dev: Joaquín (Brilliant Mind)
    Group: CacaoDev
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- 1. CREACIÓN DE LA GUI PRINCIPAL
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LKZ_Hub_Fredoka"
ScreenGui.Parent = pgui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 0, 76) -- Morado oscuro de la foto
Frame.Position = UDim2.new(0.38, 0, 0.3, 0)
Frame.Size = UDim2.new(0.288, 0, 0.45, 0)
Frame.Active = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

-- 2. LOGO Y LA "L" DECORATIVA
local TextLabel_L = Instance.new("TextLabel")
TextLabel_L.Name = "L_Decorativa"
TextLabel_L.Parent = Frame
TextLabel_L.BackgroundTransparency = 1
TextLabel_L.Position = UDim2.new(-0.286, 0, 0.063, 0)
TextLabel_L.Size = UDim2.new(0.862, 0, 0.1, 0)
TextLabel_L.Font = Enum.Font.FredokaOne -- FUENTE SOLICITADA
TextLabel_L.Text = "L"
TextLabel_L.TextColor3 = Color3.fromRGB(29, 0, 58)
TextLabel_L.TextSize = 54
TextLabel_L.ZIndex = 10

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Position = UDim2.new(0.056, 0, 0.04, 0)
ImageLabel.Size = UDim2.new(0.176, 0, 0.146, 0)
ImageLabel.Image = "rbxassetid://15256525166" -- Asegúrate de usar tu ID de logo
ImageLabel.ZIndex = 11
Instance.new("UICorner", ImageLabel)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.153, 0, 0.06, 0)
Title.Size = UDim2.new(0.862, 0, 0.1, 0)
Title.Font = Enum.Font.FredokaOne -- FUENTE SOLICITADA
Title.Text = "LKZ HUB"
Title.TextColor3 = Color3.fromRGB(29, 0, 58)
Title.TextSize = 50
Title.ZIndex = 12

-- 3. FUNCIÓN PARA NOTIFICACIONES (Esquina y Auto-desaparecer)
local function MostrarNotificacion(titulo, mensaje)
    local nFrame = Instance.new("Frame", ScreenGui)
    nFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    nFrame.Position = UDim2.new(1, 10, 0.8, 0)
    nFrame.Size = UDim2.new(0, 250, 0, 80)
    nFrame.ZIndex = 100
    
    local nCorner = Instance.new("UICorner", nFrame)
    nCorner.CornerRadius = UDim.new(0, 12)
    
    local s = Instance.new("UIStroke", nFrame)
    s.Color = Color3.fromRGB(0, 120, 255)
    s.Thickness = 2

    local tTitle = Instance.new("TextLabel", nFrame)
    tTitle.Size = UDim2.new(1, -10, 0, 30)
    tTitle.Position = UDim2.new(0, 10, 0, 5)
    tTitle.BackgroundTransparency = 1
    tTitle.Font = Enum.Font.FredokaOne
    tTitle.Text = tostring(titulo)
    tTitle.TextColor3 = Color3.fromRGB(0, 120, 255)
    tTitle.TextSize = 18
    tTitle.TextXAlignment = Enum.TextXAlignment.Left
    tTitle.ZIndex = 101

    local tMsg = Instance.new("TextLabel", nFrame)
    tMsg.Size = UDim2.new(1, -20, 0, 40)
    tMsg.Position = UDim2.new(0, 10, 0, 35)
    tMsg.BackgroundTransparency = 1
    tMsg.Font = Enum.Font.FredokaOne
    tMsg.Text = tostring(mensaje)
    tMsg.TextColor3 = Color3.new(1,1,1)
    tMsg.TextSize = 13
    tMsg.TextWrapped = true
    tMsg.TextXAlignment = Enum.TextXAlignment.Left
    tMsg.ZIndex = 101

    nFrame:TweenPosition(UDim2.new(1, -260, 0.8, 0), "Out", "Back", 0.5, true)

    task.delay(3, function()
        local t = TweenService:Create(nFrame, TweenInfo.new(0.5), {Position = UDim2.new(1, 10, 0.8, 0)})
        t:Play()
        t.Completed:Connect(function() nFrame:Destroy() end)
    end)
end

-- 4. BOTONES (ESTILO DE LA FOTO)
local function CrearBoton(txt, pos, emoji)
    local btn = Instance.new("TextButton", Frame)
    btn.BackgroundColor3 = Color3.fromRGB(125, 12, 255) -- Morado brillante de la foto
    btn.Position = pos
    btn.Size = UDim2.new(0.704, 0, 0.158, 0)
    btn.Font = Enum.Font.FredokaOne -- FUENTE SOLICITADA
    btn.Text = txt
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 28
    btn.ZIndex = 15
    Instance.new("UICorner", btn)

    local emBox = Instance.new("TextLabel", Frame)
    emBox.BackgroundColor3 = Color3.fromRGB(136, 16, 255)
    emBox.Position = UDim2.new(0.054, 0, pos.Y.Scale, 0)
    emBox.Size = UDim2.new(0.158, 0, 0.152, 0)
    emBox.Font = Enum.Font.SourceSans
    emBox.Text = emoji
    emBox.TextSize = 35
    emBox.ZIndex = 15
    Instance.new("UICorner", emBox)

    btn.MouseButton1Click:Connect(function()
        MostrarNotificacion(txt, "Módulo activado correctamente ✅")
    end)
end

CrearBoton("Freeze Trade", UDim2.new(0.232, 0, 0.212, 0), "❄️")
CrearBoton("Auto Accept", UDim2.new(0.232, 0, 0.393, 0), "🧲")
CrearBoton("Cancel Trade", UDim2.new(0.235, 0, 0.58, 0), "❌")

-- 5. FOOTER (Vip Version & by CacaoDev)
local function CrearFooter(pos, txt)
    local f = Instance.new("TextLabel", Frame)
    f.BackgroundTransparency = 1
    f.Position = pos
    f.Size = UDim2.new(0.862, 0, 0.1, 0)
    f.Font = Enum.Font.FredokaOne -- FUENTE SOLICITADA
    f.Text = txt
    f.TextColor3 = Color3.fromRGB(128, 0, 255)
    f.TextSize = 22
    f.ZIndex = 10
end
CrearFooter(UDim2.new(0.05, 0, 0.74, 0), "Vip Version")
CrearFooter(UDim2.new(0.05, 0, 0.84, 0), "by CacaoDev")

-- 6. SISTEMA DE ARRASTRE
local dragging, dragInput, dragStart, startPos
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
