--[[
    ╔══════════════════════════════════════════════╗
    ║   HOÀNG LONG SIGMAMEOMEOPLS 🍃               ║
    ║   Version: 9.9.9.9.999.999                   ║
    ║   Acc: SIGMAMEOMEO                           ║
    ║   Tối ưu cho: Delta X Mobile / PC            ║
    ╚══════════════════════════════════════════════╝
]]

-- ============================================================
--  SERVICES (dùng getgenv an toàn cho Delta X)
-- ============================================================
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace        = game:GetService("Workspace")
local TweenService     = game:GetService("TweenService")

local player = Players.LocalPlayer

-- Xác định Parent GUI (Delta X hỗ trợ CoreGui, fallback PlayerGui)
local function getGuiParent()
    local ok, cg = pcall(function() return game:GetService("CoreGui") end)
    if ok and cg then return cg end
    return player:WaitForChild("PlayerGui")
end

local GuiParent = getGuiParent()

-- Xóa GUI cũ
pcall(function()
    local old = GuiParent:FindFirstChild("HoangLongMenu")
    if old then old:Destroy() end
end)

-- ============================================================
--  BIẾN TRẠNG THÁI
-- ============================================================
local flying        = false
local noclipOn      = false
local flySpeed      = 100
local walkSpeed     = 100
local flyConnection = nil
local noclipConn    = nil
local speedOn       = false

-- ============================================================
--  SCREEN GUI
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HoangLongMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = GuiParent

-- ============================================================
--  NÚT TOGGLE NHỎ GỌN
-- ============================================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 140, 0, 36)
ToggleBtn.Position = UDim2.new(0, 12, 0, 60)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Text = "🍃 HOÀNG LONG"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 140)
ToggleBtn.TextSize = 14
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.AutoButtonColor = false
ToggleBtn.Active = true
ToggleBtn.Parent = ScreenGui

local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 10)
tc.Parent = ToggleBtn

local ts = Instance.new("UIStroke")
ts.Color = Color3.fromRGB(0, 255, 140)
ts.Thickness = 1.5
ts.Parent = ToggleBtn

-- ============================================================
--  KHUNG MENU CHÍNH
-- ============================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 470)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -235)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 12)
mc.Parent = MainFrame

local ms = Instance.new("UIStroke")
ms.Color = Color3.fromRGB(0, 255, 140)
ms.Thickness = 2
ms.Parent = MainFrame

-- ---- HEADER ----
local Header = Instance.new("TextButton")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Header.BorderSizePixel = 0
Header.Text = ""
Header.AutoButtonColor = false
Header.Active = true
Header.Parent = MainFrame

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 12)
hc.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 0, 22)
Title.Position = UDim2.new(0, 12, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "HOÀNG LONG SIGMAMEOMEOPLS 🍃"
Title.TextColor3 = Color3.fromRGB(0, 255, 140)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Ver = Instance.new("TextLabel")
Ver.Size = UDim2.new(1, -60, 0, 16)
Ver.Position = UDim2.new(0, 12, 0, 30)
Ver.BackgroundTransparency = 1
Ver.Text = "v9.9.9.9.999.999 | acc: SIGMAMEOMEO"
Ver.TextColor3 = Color3.fromRGB(130, 255, 180)
Ver.TextSize = 10
Ver.Font = Enum.Font.Gotham
Ver.TextXAlignment = Enum.TextXAlignment.Left
Ver.Parent = Header

-- Nút close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(210, 45, 45)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixe
