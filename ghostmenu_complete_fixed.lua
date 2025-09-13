-- Menu Ghost Moderno Limpo (Preto/Vermelho) - Estrutura funcional e sem bugs
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GhostMenu"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 320)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = true

-- TopBar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
local y = 32

-- Texto centralizado na TopBar

-- Texto "Ghost Menu" grande, canto esquerdo
local GhostLabel = Instance.new("TextLabel")
GhostLabel.Name = "GhostLabel"
GhostLabel.Size = UDim2.new(0, 160, 1, 0)
GhostLabel.Position = UDim2.new(0, 8, 0, 0)
GhostLabel.BackgroundTransparency = 1
GhostLabel.Text = "Ghost Menu"
GhostLabel.TextColor3 = Color3.fromRGB(255,255,255)
GhostLabel.Font = Enum.Font.SourceSansBold
GhostLabel.TextSize = 22
GhostLabel.TextStrokeTransparency = 0.7
GhostLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
GhostLabel.TextXAlignment = Enum.TextXAlignment.Left
GhostLabel.TextYAlignment = Enum.TextYAlignment.Center
GhostLabel.Parent = TopBar

-- Texto "By Magnata 2.0" menor, ao lado
local MagnataLabel = Instance.new("TextLabel")
MagnataLabel.Name = "MagnataLabel"
MagnataLabel.Size = UDim2.new(0, 110, 1, 0)
MagnataLabel.Position = UDim2.new(0, 170, 0, 0)
MagnataLabel.BackgroundTransparency = 1
MagnataLabel.Text = "By Magnata 2.0"
MagnataLabel.TextColor3 = Color3.fromRGB(200,200,200)
MagnataLabel.Font = Enum.Font.SourceSans
MagnataLabel.TextSize = 14
MagnataLabel.TextStrokeTransparency = 0.8
MagnataLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
MagnataLabel.TextXAlignment = Enum.TextXAlignment.Left
MagnataLabel.TextYAlignment = Enum.TextYAlignment.Center
MagnataLabel.Parent = TopBar

-- Botão Minimizar
local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinimizeButton"
MinBtn.Size = UDim2.new(0, 36, 0, 28)
MinBtn.Position = UDim2.new(1, -80, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 22
MinBtn.Text = "_"
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TopBar

-- Botão Fechar
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseButton"
CloseBtn.Size = UDim2.new(0, 36, 0, 28)
CloseBtn.Position = UDim2.new(1, -40, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 22
CloseBtn.Text = "X"
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar

-- Movimentação do menu (drag)

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- Sidebar
local SideBar = Instance.new("Frame")
SideBar.Name = "SideBar"
SideBar.Size = UDim2.new(0, 140, 1, -36)
SideBar.Position = UDim2.new(0, 0, 0, 36)
SideBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

-- Área Principal com rolagem
local MainArea = Instance.new("ScrollingFrame")
MainArea.Name = "MainArea"
MainArea.Size = UDim2.new(1, -140, 1, -36)
MainArea.Position = UDim2.new(0, 140, 0, 36)
MainArea.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MainArea.BorderSizePixel = 0
MainArea.Parent = MainFrame
MainArea.CanvasSize = UDim2.new(0, 0, 0, 1200) -- Aumenta a área de rolagem para garantir espaço para todos os botões
MainArea.ScrollBarThickness = 8
MainArea.ScrollBarImageColor3 = Color3.fromRGB(60,60,60)
-- Removido AutomaticCanvasSize e VerticalScrollBarInset para evitar bugs de rolagem

-- Mini perfil estilo Discord (rodapé da SideBar)
local ProfileFrame = Instance.new("Frame")
ProfileFrame.Name = "ProfileFrame"
ProfileFrame.Size = UDim2.new(1, 0, 0, 56)
ProfileFrame.Position = UDim2.new(0, 0, 1, -56)
ProfileFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ProfileFrame.BorderSizePixel = 0
ProfileFrame.Parent = SideBar
local Avatar = Instance.new("ImageLabel")
Avatar.Name = "Avatar"
Avatar.Size = UDim2.new(0, 36, 0, 36)
Avatar.Position = UDim2.new(0, 10, 0, 10)
Avatar.BackgroundTransparency = 1
Avatar.Parent = ProfileFrame
Avatar.ScaleType = Enum.ScaleType.Fit

-- Pega o avatar real do jogador
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local userId = Players.LocalPlayer and Players.LocalPlayer.UserId or 1
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size100x100
local thumbUrl = "rbxasset://textures/ui/GuiImagePlaceholder.png"
pcall(function()
	local url, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	if isReady and url then
		thumbUrl = url
	end
end)
Avatar.Image = thumbUrl
ContentProvider:PreloadAsync({thumbUrl})
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(1,0)
uicorner.Parent = Avatar
local UserName = Instance.new("TextLabel")
UserName.Name = "UserName"
UserName.Size = UDim2.new(1, -56, 0, 20)
UserName.Position = UDim2.new(0, 52, 0, 12)
UserName.BackgroundTransparency = 1
UserName.Text = game.Players.LocalPlayer and game.Players.LocalPlayer.DisplayName or "Usuário"
UserName.TextColor3 = Color3.fromRGB(255,255,255)
UserName.Font = Enum.Font.SourceSansBold
UserName.TextSize = 16
UserName.TextXAlignment = Enum.TextXAlignment.Left
UserName.Parent = ProfileFrame
local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Size = UDim2.new(1, -56, 0, 16)
Status.Position = UDim2.new(0, 52, 0, 32)
Status.BackgroundTransparency = 1
Status.Text = "Online"
Status.TextColor3 = Color3.fromRGB(0,255,100)
Status.Font = Enum.Font.SourceSans
Status.TextSize = 13
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = ProfileFrame

-- Abas laterais
local Tabs = {"Geral", "Combate", "Visual", "Players", "Configurações"}
local tabButtons = {}
local selectedTab = nil

local function clearMainArea()
	for _, child in ipairs(MainArea:GetChildren()) do
		child:Destroy()
	end
end
 


-- ESP AVANÇADO (caixa branca, barra de vida verde, nome, distância, item, linha)
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

_G.GhostMenu = _G.GhostMenu or {}
local state = _G.GhostMenu
state.ESP = state.ESP or {Caixa=false, Linha=false, Nome=false, Distancia=false, Item=false, Vida=false}
local ESP = state.ESP

local allESP = {}

local function getHeldTool(character)
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("Tool") then
			return v.Name
		end
	end
	return nil
end

local function clearAllESP()
	for _, tbl in pairs(allESP) do
		for _, obj in pairs(tbl) do
			if typeof(obj) == "Instance" or typeof(obj) == "table" and obj.Remove then
				pcall(function() obj:Remove() end)
			elseif typeof(obj) == "table" and obj.Destroy then
				pcall(function() obj:Destroy() end)
			end
		end
	end
	allESP = {}
end


local function createESP(player)
	if player == LocalPlayer then return end
	-- Checagem de time: não desenhar ESP para jogadores do mesmo time
	if player.Team ~= nil and LocalPlayer.Team ~= nil and player.Team == LocalPlayer.Team then return end

	local function onCharacterAdded(character)
		-- Remove ESP antigo se existir
		if allESP[player] then
			for _, obj in pairs(allESP[player]) do
				if obj and obj.Remove then pcall(function() obj:Remove() end) end
			end
		end

		-- Linhas da caixa (brancas)
		local boxLines = {}
		for i = 1, 4 do
			local line = Drawing.new("Line")
			line.Thickness = 2
			line.Color = Color3.fromRGB(255, 255, 255)
			boxLines[i] = line
		end

		-- Nome, distância, linha (brancos)
		local nameTag = Drawing.new("Text")
		nameTag.Size = 16
		nameTag.Color = Color3.fromRGB(255,255,255)
		nameTag.Outline = true
		nameTag.Center = true

		local distanceTag = Drawing.new("Text")
		distanceTag.Size = 14
		distanceTag.Color = Color3.fromRGB(255,255,255)
		distanceTag.Outline = true
		distanceTag.Center = true

		local itemTag = Drawing.new("Text")
		itemTag.Size = 14
		itemTag.Color = Color3.fromRGB(255,255,255)
		itemTag.Outline = true
		itemTag.Center = true

		local line = Drawing.new("Line")
		line.Thickness = 1
		line.Color = Color3.fromRGB(255,255,255)

		-- Barra de vida (verde)
		local healthBar = Drawing.new("Line")
		healthBar.Thickness = 4
		healthBar.Color = Color3.fromRGB(0,255,0)

		allESP[player] = {boxLines=boxLines, nameTag=nameTag, distanceTag=distanceTag, itemTag=itemTag, line=line, healthBar=healthBar, character=character}

		-- Sempre recria o ESP quando o personagem respawnar
		if allESP[player]._charConn then allESP[player]._charConn:Disconnect() end
		allESP[player]._charConn = character.AncestryChanged:Connect(function(_, parent)
			if not parent then
				for _, l in ipairs(boxLines) do l:Remove() end
				nameTag:Remove()
				distanceTag:Remove()
				itemTag:Remove()
				healthBar:Remove()
				line:Remove()
				allESP[player] = nil
			end
		end)
	end

	-- Sempre conecta o evento para respawn
	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then
		onCharacterAdded(player.Character)
	end
end

-- RenderStepped global para todos os ESPs
RunService.RenderStepped:Connect(function()
	for player, tbl in pairs(allESP) do
		local character = tbl.character
		local boxLines = tbl.boxLines
		local nameTag = tbl.nameTag
		local distanceTag = tbl.distanceTag
		local itemTag = tbl.itemTag
		local line = tbl.line
		local healthBar = tbl.healthBar
		if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Humanoid") then
			for _, l in ipairs(boxLines) do l.Visible = false end
			nameTag.Visible = false
			distanceTag.Visible = false
			itemTag.Visible = false
			healthBar.Visible = false
			line.Visible = false
		else
			local hrp = character.HumanoidRootPart
			local size = Vector3.new(4, 6, 2)
			local corners = {
				hrp.CFrame * Vector3.new(-size.X/2, size.Y/2, -size.Z/2), -- Top Left
				hrp.CFrame * Vector3.new(size.X/2, size.Y/2, -size.Z/2),  -- Top Right
				hrp.CFrame * Vector3.new(size.X/2, -size.Y/2, -size.Z/2), -- Bottom Right
				hrp.CFrame * Vector3.new(-size.X/2, -size.Y/2, -size.Z/2) -- Bottom Left
			}
			local screenPoints = {}
			local onScreen = true
			for i, corner in ipairs(corners) do
				local pos, visible = Camera:WorldToViewportPoint(corner)
				if not visible then onScreen = false break end
				screenPoints[i] = Vector2.new(pos.X, pos.Y)
			end
			if onScreen then
				-- Caixa
				if ESP.Caixa then
					for i = 1, 4 do
						boxLines[i].From = screenPoints[i]
						boxLines[i].To = screenPoints[(i % 4) + 1]
						boxLines[i].Visible = true
					end
				else
					for i = 1, 4 do boxLines[i].Visible = false end
				end
				-- Vida
				if ESP.Vida then
					local hp = character.Humanoid.Health
					local maxHp = character.Humanoid.MaxHealth
					local percent = math.clamp(hp/maxHp, 0, 1)
					local barStart = screenPoints[1]
					local barEnd = barStart:Lerp(screenPoints[4], percent)
					healthBar.From = barStart - Vector2.new(8,0)
					healthBar.To = barEnd - Vector2.new(8,0)
					-- Cor dinâmica: verde (cheio), amarelo (meio), vermelho (baixo)
					if percent > 0.5 then
						healthBar.Color = Color3.fromRGB(0,255,0)
					elseif percent > 0.2 then
						healthBar.Color = Color3.fromRGB(255,255,0)
					else
						healthBar.Color = Color3.fromRGB(255,0,0)
					end
					healthBar.Visible = true
				else
					healthBar.Visible = false
				end
				   -- Nome
				   if ESP.Nome then
					   nameTag.Text = player.Name
					   nameTag.Position = Vector2.new(screenPoints[1].X, screenPoints[1].Y - 16)
					   nameTag.Visible = true
				   else
					   nameTag.Visible = false
				   end

				   -- (Removido: não atualizar itemTag fora do bloco ESP.Item)
				-- Distancia
				if ESP.Distancia then
					local dist = math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)
					distanceTag.Text = tostring(dist).."m"
					distanceTag.Position = Vector2.new(screenPoints[3].X, screenPoints[3].Y + 16)
					distanceTag.Visible = true
				else
					distanceTag.Visible = false
				end
				   -- Item
				   if ESP.Item then
					   local toolName = getHeldTool(character)
					   if toolName then
						   itemTag.Text = toolName
						   -- Posição: apenas abaixo da caixa (nunca acima da cabeça)
						   itemTag.Position = Vector2.new(screenPoints[3].X, screenPoints[3].Y + 32)
						   itemTag.Visible = true
					   else
						   itemTag.Visible = false
					   end
				   else
					   itemTag.Visible = false
				   end
				-- Linha
				if ESP.Linha then
					line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
					line.To = Vector2.new(screenPoints[1].X, screenPoints[1].Y)
					line.Visible = true
				else
					line.Visible = false
				end
			else
				for i = 1, 4 do boxLines[i].Visible = false end
				nameTag.Visible = false
				distanceTag.Visible = false
				itemTag.Visible = false
				healthBar.Visible = false
				line.Visible = false
			end
		end
	end
end)
 
local function updateAllESP()
	-- Remove ESP de quem saiu
	for player, _ in pairs(allESP) do
		if not Players:FindFirstChild(player.Name) then
			for _, obj in pairs(allESP[player]) do
				if obj and obj.Remove then pcall(function() obj:Remove() end) end
			end
			allESP[player] = nil
		end
	end
	-- Garante ESP para todos os jogadores (exceto LocalPlayer)
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and not allESP[player] then
			createESP(player)
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	if player ~= LocalPlayer then
		createESP(player)
		updateAllESP()
	end
end)
Players.PlayerRemoving:Connect(function(player)
	if allESP[player] then
		for _, obj in pairs(allESP[player]) do
			if obj and obj.Remove then pcall(function() obj:Remove() end) end
		end
		allESP[player] = nil
		updateAllESP()
	end
end)

-- Atualizar ESP ao ativar/desativar qualquer toggle
local function setESP(key, value)
	ESP[key] = value
	updateAllESP()
end

local function selectTab(tabName)
	for _, btn in pairs(tabButtons) do
		btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		btn.TextColor3 = Color3.fromRGB(220,220,220)
	end
	if tabButtons[tabName] then
		tabButtons[tabName].BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		tabButtons[tabName].TextColor3 = Color3.fromRGB(255,255,255)
	end
	selectedTab = tabName
	clearMainArea()
	if tabName == "Geral" then
		local y = 32
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0, 220, 0, 32)
		btn.Position = UDim2.new(0, 24, 0, y)
		btn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		btn.TextColor3 = Color3.fromRGB(255,255,255)
		btn.Font = Enum.Font.SourceSansBold
		btn.TextSize = 18
		btn.Text = "Resetar Personagem"
		btn.BorderSizePixel = 0
		btn.Parent = MainArea
		btn.MouseButton1Click:Connect(function()
			if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
				game.Players.LocalPlayer.Character:BreakJoints()
			end
		end)
		y = y + 44
		local rejoinBtn = Instance.new("TextButton")
		rejoinBtn.Size = UDim2.new(0, 220, 0, 32)
		rejoinBtn.Position = UDim2.new(0, 24, 0, y)
		rejoinBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		rejoinBtn.TextColor3 = Color3.fromRGB(255,255,255)
		rejoinBtn.Font = Enum.Font.SourceSansBold
		rejoinBtn.TextSize = 18
		rejoinBtn.Text = "Reentrar no Jogo"
		rejoinBtn.BorderSizePixel = 0
		rejoinBtn.Parent = MainArea
		rejoinBtn.MouseButton1Click:Connect(function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end)
	elseif tabName == "Combate" then
		local y = 32
		-- Estados globais
		_G.GhostMenu = _G.GhostMenu or {}
		local state = _G.GhostMenu
		if state.aimbotOn == nil then state.aimbotOn = false end
		if state.norecoilOn == nil then state.norecoilOn = false end
		if state.fov == nil then state.fov = 120 end
		if state.smooth == nil then state.smooth = 6 end

		-- Toggle Aimbot
		local aimbotToggle = Instance.new("TextButton")
		aimbotToggle.Size = UDim2.new(0, 220, 0, 32)
		aimbotToggle.Position = UDim2.new(0, 24, 0, y)
		aimbotToggle.BackgroundColor3 = state.aimbotOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		aimbotToggle.TextColor3 = Color3.fromRGB(255,255,255)
		aimbotToggle.Font = Enum.Font.SourceSansBold
		aimbotToggle.TextSize = 18
		aimbotToggle.Text = "Aimbot: "..(state.aimbotOn and "ON" or "OFF")
		aimbotToggle.BorderSizePixel = 0
		aimbotToggle.Parent = MainArea
		y = y + 40
		-- Campo FOV
		local fovLabel = Instance.new("TextLabel")
		fovLabel.Size = UDim2.new(0, 80, 0, 28)
		fovLabel.Position = UDim2.new(0, 24, 0, y)
		fovLabel.BackgroundTransparency = 1
		fovLabel.Text = "FOV:"
		fovLabel.TextColor3 = Color3.fromRGB(255,255,255)
		fovLabel.Font = Enum.Font.SourceSansBold
		fovLabel.TextSize = 18
		fovLabel.TextXAlignment = Enum.TextXAlignment.Left
		fovLabel.Parent = MainArea
		local fovBox = Instance.new("TextBox")
		fovBox.Size = UDim2.new(0, 80, 0, 28)
		fovBox.Position = UDim2.new(0, 110, 0, y)
		fovBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
		fovBox.TextColor3 = Color3.fromRGB(255,255,255)
		fovBox.Font = Enum.Font.SourceSansBold
		fovBox.TextSize = 18
		fovBox.Text = tostring(state.fov)
		fovBox.ClearTextOnFocus = false
		fovBox.Parent = MainArea
		y = y + 36
		-- Campo Smooth
		local smoothLabel = Instance.new("TextLabel")
		smoothLabel.Size = UDim2.new(0, 80, 0, 28)
		smoothLabel.Position = UDim2.new(0, 24, 0, y)
		smoothLabel.BackgroundTransparency = 1
		smoothLabel.Text = "Smooth:"
		smoothLabel.TextColor3 = Color3.fromRGB(255,255,255)
		smoothLabel.Font = Enum.Font.SourceSansBold
		smoothLabel.TextSize = 18
		smoothLabel.TextXAlignment = Enum.TextXAlignment.Left
		smoothLabel.Parent = MainArea
		local smoothBox = Instance.new("TextBox")
		smoothBox.Size = UDim2.new(0, 80, 0, 28)
		smoothBox.Position = UDim2.new(0, 110, 0, y)
		smoothBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
		smoothBox.TextColor3 = Color3.fromRGB(255,255,255)
		smoothBox.Font = Enum.Font.SourceSansBold
		smoothBox.TextSize = 18
		smoothBox.Text = tostring(state.smooth)
		smoothBox.ClearTextOnFocus = false
		smoothBox.Parent = MainArea
		y = y + 44

		-- Toggle NoRecoil
		local norecoilToggle = Instance.new("TextButton")
		norecoilToggle.Size = UDim2.new(0, 220, 0, 32)
		norecoilToggle.Position = UDim2.new(0, 24, 0, y)
		norecoilToggle.BackgroundColor3 = state.norecoilOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		norecoilToggle.TextColor3 = Color3.fromRGB(255,255,255)
		norecoilToggle.Font = Enum.Font.SourceSansBold
		norecoilToggle.TextSize = 18
		norecoilToggle.Text = "NoRecoil: "..(state.norecoilOn and "ON" or "OFF")
		norecoilToggle.BorderSizePixel = 0
		norecoilToggle.Parent = MainArea

		-- Botão God Mode
		y = y + 44
		local godToggle = Instance.new("TextButton")
		godToggle.Size = UDim2.new(0, 220, 0, 32)
		godToggle.Position = UDim2.new(0, 24, 0, y)
	godToggle.BackgroundColor3 = state.godOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		godToggle.TextColor3 = Color3.fromRGB(255,255,255)
		godToggle.Font = Enum.Font.SourceSansBold
		godToggle.TextSize = 18
		godToggle.Text = "God Mode: "..(state.godOn and "ON" or "OFF")
		godToggle.BorderSizePixel = 0
		godToggle.Parent = MainArea

		local function updateGodBtn()
			godToggle.Text = "God Mode: "..(state.godOn and "ON" or "OFF")
			godToggle.BackgroundColor3 = state.godOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		end

		-- Função God Mode (invulnerável)
		local godConnection
		local function enableGod()
			local lp = game.Players.LocalPlayer
			if not lp.Character then return end
			for _, v in ipairs(lp.Character:GetDescendants()) do
				if v:IsA("Humanoid") then
					v.Health = v.MaxHealth
					v:GetPropertyChangedSignal("Health"):Connect(function()
						if state.godOn then v.Health = v.MaxHealth end
					end)
				end
			end
			if godConnection then godConnection:Disconnect() end
			godConnection = lp.CharacterAdded:Connect(function(char)
				for _, v in ipairs(char:GetDescendants()) do
					if v:IsA("Humanoid") then
						v.Health = v.MaxHealth
						v:GetPropertyChangedSignal("Health"):Connect(function()
							if state.godOn then v.Health = v.MaxHealth end
						end)
					end
				end
			end)
		end
		local function disableGod()
			if godConnection then godConnection:Disconnect() end
		end

		state.godOn = state.godOn or false
		godToggle.MouseButton1Click:Connect(function()
			state.godOn = not state.godOn
			updateGodBtn()
			if state.godOn then
				enableGod()
			else
				disableGod()
			end
		end)

		-- Funções de atualização visual
		local function updateAimbotBtn()
			aimbotToggle.Text = "Aimbot: "..(state.aimbotOn and "ON" or "OFF")
			aimbotToggle.BackgroundColor3 = state.aimbotOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		end
		local function updateNoRecoilBtn()
			norecoilToggle.Text = "NoRecoil: "..(state.norecoilOn and "ON" or "OFF")
			norecoilToggle.BackgroundColor3 = state.norecoilOn and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
		end

		-- Função NoRecoil rápida
		local function removeRecoil(tool)
			for _, v in pairs(tool:GetDescendants()) do
				if v:IsA("NumberValue") or v:IsA("IntValue") then
					local n = v.Name:lower()
					if n:find("recoil") or n:find("kick") then
						v.Value = 0
					end
				elseif v:IsA("ModuleScript") then
					local s, m = pcall(require, v)
					if s and type(m) == "table" then
						for key, value in pairs(m) do
							local k = tostring(key):lower()
							if (k:find("recoil") or k:find("kick")) and type(value) == "number" then
								m[key] = 0
							end
						end
					end
				end
			end
		end

		local function applyNoRecoil()
			local lp = game.Players.LocalPlayer
			if lp.Character then
				for _, tool in ipairs(lp.Character:GetChildren()) do
					if tool:IsA("Tool") then removeRecoil(tool) end
				end
			end
			for _, tool in ipairs(lp.Backpack:GetChildren()) do
				if tool:IsA("Tool") then removeRecoil(tool) end
			end
		end

		-- Listeners (apenas um por botão)
		aimbotToggle.MouseButton1Click:Connect(function()
			state.aimbotOn = not state.aimbotOn
			updateAimbotBtn()
			if state.fovCircle then state.fovCircle.Visible = state.aimbotOn end
		end)
		norecoilToggle.MouseButton1Click:Connect(function()
			state.norecoilOn = not state.norecoilOn
			updateNoRecoilBtn()
			if state.norecoilOn then
				applyNoRecoil()
			end
		end)
		fovBox.FocusLost:Connect(function()
			local v = tonumber(fovBox.Text) or 120
			state.fov = v
			if state.fovCircle then state.fovCircle.Radius = v end
		end)
		smoothBox.FocusLost:Connect(function()
			local v = tonumber(smoothBox.Text) or 6
			state.smooth = v
		end)

		-- AIMBOT LÓGICA GLOBAL (apenas uma vez)
		if not state.aimbotInit then
			state.aimbotInit = true
			local Players = game:GetService("Players")
			local LocalPlayer = Players.LocalPlayer
			local Camera = workspace.CurrentCamera
			local UserInputService = game:GetService("UserInputService")
			local RunService = game:GetService("RunService")
			local aiming = false
			-- Círculo FOV
			local fovCircle = Drawing.new("Circle")
			fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
			fovCircle.Radius = state.fov
			fovCircle.Color = Color3.fromRGB(255,255,255)
			fovCircle.Thickness = 2
			fovCircle.Filled = false
			fovCircle.Visible = false
			state.fovCircle = fovCircle
			Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
			end)
			-- Função para pegar player mais próximo da cabeça dentro do FOV
			local function getClosestPlayerInFOV()
				local closestPlayer = nil
				local shortestDistance = state.fov or 120
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer
						and player.Character
						and player.Character:FindFirstChild("Head")
						and player.Character:FindFirstChild("Humanoid")
						and player.Character.Humanoid.Health > 0
					then
						local pos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
						if onScreen then
							local mousePos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
							local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
							if dist < shortestDistance then
								shortestDistance = dist
								closestPlayer = player
							end
						end
					end
				end
				return closestPlayer
			end
			-- Input para ativar/desativar mira
			UserInputService.InputBegan:Connect(function(input, processed)
				if input.UserInputType == Enum.UserInputType.MouseButton2 then
					aiming = true
				end
			end)
			UserInputService.InputEnded:Connect(function(input, processed)
				if input.UserInputType == Enum.UserInputType.MouseButton2 then
					aiming = false
				end
			end)
			RunService.RenderStepped:Connect(function()
				-- Garante que o círculo fique centralizado
				fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
				fovCircle.Radius = state.fov
				if state.aimbotOn and aiming then
					local target = getClosestPlayerInFOV()
					if target and target.Character and target.Character:FindFirstChild("Head") then
						local headPos = target.Character.Head.Position
						local camPos = Camera.CFrame.Position
						local newCFrame = CFrame.new(camPos, camPos + (headPos - camPos).Unit)
						-- Smooth
						local smoothValue = tonumber(state.smooth) or 2
						local lerped = Camera.CFrame:Lerp(newCFrame, math.clamp(smoothValue/100,0.15,1))
						-- Dica: quanto menor o smooth, mais forte o lock
						-- Exemplo: smooth 1 = lock instantâneo, smooth 2 = lock forte, smooth 6+ = lock fraco
						Camera.CFrame = lerped
						Camera.CFrame = lerped
					end
				end
			end)
		end
	elseif tabName == "Visual" then
		local y = 24
		-- end
		local state = _G.GhostMenu
		state.ESP = state.ESP or {}
		-- Inicializa valores padrões se não existirem
		for _, key in ipairs({"Caixa", "Linha", "Nome", "Distancia", "Item", "Vida"}) do
			if state.ESP[key] == nil then state.ESP[key] = false end
		end
		local espNames = {"ESP Caixa", "ESP Linha", "ESP Nome", "ESP Distancia", "ESP Item", "ESP Vida"}
		for i, esp in ipairs(espNames) do
			local espToggle = Instance.new("TextButton")
			espToggle.Size = UDim2.new(0, 220, 0, 32)
			espToggle.Position = UDim2.new(0, 24, 0, y)
			local key = esp:match("ESP (.+)")
			espToggle.BackgroundColor3 = state.ESP[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
			espToggle.TextColor3 = Color3.fromRGB(255,255,255)
			espToggle.Font = Enum.Font.SourceSansBold
			espToggle.TextSize = 18
			espToggle.Text = esp..": "..(state.ESP[key] and "ON" or "OFF")
			espToggle.BorderSizePixel = 0
			espToggle.Parent = MainArea
			espToggle.MouseButton1Click:Connect(function()
				state.ESP[key] = not state.ESP[key]
				setESP(key, state.ESP[key])
				espToggle.Text = esp..": "..(state.ESP[key] and "ON" or "OFF")
				espToggle.BackgroundColor3 = state.ESP[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
	elseif tabName == "Players" then
		local y = 32
		-- Botões de trapaça para o jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local buttons = {
				{"Teleportar até Jogador", function(btn)
					local lp = Players.LocalPlayer
					if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and state.selectedPlayer and state.selectedPlayer.Character and state.selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
						lp.Character.HumanoidRootPart.CFrame = state.selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,2)
					end
				end},
				{"Matar Jogador", function(btn)
					local target = state.selectedPlayer
					if target and target.Character and target.Character:FindFirstChild("Humanoid") then
						target.Character.Humanoid.Health = 0
					end
				end},
				{"Prender Jogador", function(btn)
					local target = state.selectedPlayer
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						for i = 1, 4 do
							local part = Instance.new("Part")
							part.Size = Vector3.new(4, 8, 0.2)
							part.Anchored = true
							part.CanCollide = true
							part.BrickColor = BrickColor.new("Really black")
							part.Parent = workspace
							local angle = math.rad((i-1)*90)
							local offset = Vector3.new(math.cos(angle)*2, 4, math.sin(angle)*2)
							part.CFrame = target.Character.HumanoidRootPart.CFrame + offset
						end
						local top = Instance.new("Part")
						top.Size = Vector3.new(4, 0.2, 4)
						top.Anchored = true
						top.CanCollide = true
						top.BrickColor = BrickColor.new("Really black")
						top.Parent = workspace
						top.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,8,0)
					end
				end},
				{"Congelar Jogador", function(btn)
					local target = state.selectedPlayer
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						target.Character.HumanoidRootPart.Anchored = true
					end
				end},
				{"Clonar Aparência", function(btn)
					local lp = Players.LocalPlayer
					local target = state.selectedPlayer
					if lp and lp.Character and target and target.Character then
						for _, v in ipairs(lp.Character:GetChildren()) do
							if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
								v:Destroy()
							end
						end
						for _, v in ipairs(target.Character:GetChildren()) do
							if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
								v:Clone().Parent = lp.Character
							end
						end
					end
				end},
				{"Lançar Jogador", function(btn)
					local target = state.selectedPlayer
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						local hrp = target.Character.HumanoidRootPart
						hrp.Velocity = Vector3.new(0, 150, 0) + (hrp.CFrame.LookVector * 100)
					end
				end},
				{"Remover Acessórios", function(btn)
					local target = state.selectedPlayer
					if target and target.Character then
						for _, v in ipairs(target.Character:GetChildren()) do
							if v:IsA("Accessory") then
								v:Destroy()
							end
						end
					end
				end},
			}
			for _, data in ipairs(buttons) do
				local btn = Instance.new("TextButton")
				btn.Size = UDim2.new(0, 220, 0, 32)
				btn.Position = UDim2.new(0, 24, 0, y)
				btn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
				btn.TextColor3 = Color3.fromRGB(255,255,255)
				btn.Font = Enum.Font.SourceSansBold
				btn.TextSize = 18
				btn.Text = data[1]
				btn.BorderSizePixel = 0
				btn.Parent = MainArea
				btn.MouseButton1Click:Connect(function()
					btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
					data[2](btn)
					wait(0.15)
					btn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
				end)
				y = y + 44
			end
	end
	local Players = game:GetService("Players")
	-- Botão para abrir/fechar mini lista
	_G.GhostMenu = _G.GhostMenu or {}
	local state = _G.GhostMenu
	-- Mantém referência global da mini lista
	if state.miniList and state.miniList.Parent == nil then state.miniList = nil end
	local showListBtn = Instance.new("TextButton")
		showListBtn.Size = UDim2.new(0, 220, 0, 32)
		showListBtn.Position = UDim2.new(0, 24, 0, y)
		showListBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		showListBtn.TextColor3 = Color3.fromRGB(255,255,255)
		showListBtn.Font = Enum.Font.SourceSansBold
		showListBtn.TextSize = 18
		showListBtn.Text = state.miniList and "Fechar Lista" or "Mostrar Jogadores"
		showListBtn.BorderSizePixel = 0
		showListBtn.Parent = MainArea
		y = y + 44

		-- Função para telar player
		local function updateSpectate()
			local Camera = workspace.CurrentCamera
			if state.spectating and state.spectating.Character then
				if state.spectating.Character:FindFirstChild("HumanoidRootPart") then
					Camera.CameraSubject = state.spectating.Character.HumanoidRootPart
				elseif state.spectating.Character:FindFirstChild("Humanoid") then
					Camera.CameraSubject = state.spectating.Character.Humanoid
				end
			end
		end
		local function spectatePlayer(targetPlayer)
			state.spectating = targetPlayer
			updateSpectate()
			-- Atualiza sempre que o personagem do player mudar
			if state._spectateConn then state._spectateConn:Disconnect() end
			if targetPlayer then
				state._spectateConn = targetPlayer.CharacterAdded:Connect(function()
					updateSpectate()
				end)
			end
		end
		local function stopSpectate()
			local Camera = workspace.CurrentCamera
			state.spectating = nil
			if state._spectateConn then state._spectateConn:Disconnect() state._spectateConn = nil end
			local LocalPlayer = Players.LocalPlayer
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				Camera.CameraSubject = LocalPlayer.Character.Humanoid
			end
		end
		local function createMiniList()
			if state.miniList then
				state.miniList:Destroy()
				state.miniList = nil
				showListBtn.Text = "Mostrar Jogadores"
				-- Não limpar selectedPlayer aqui, para manter seleção ao reabrir
				return
			end
			local miniList = Instance.new("ScrollingFrame")
			miniList.Size = UDim2.new(0, 220, 0, 320)
			miniList.Position = UDim2.new(0, MainFrame.AbsolutePosition.X + MainFrame.AbsoluteSize.X + 12, 0, MainFrame.AbsolutePosition.Y)
			miniList.BackgroundColor3 = Color3.fromRGB(30,30,30)
			miniList.BorderSizePixel = 0
			miniList.CanvasSize = UDim2.new(0, 0, 0, 1000)
			miniList.ScrollBarThickness = 8
			miniList.ScrollBarImageColor3 = Color3.fromRGB(60,60,60)
			miniList.Parent = ScreenGui
			state.miniList = miniList
			showListBtn.Text = "Fechar Lista"
			local title = Instance.new("TextLabel")
			title.Size = UDim2.new(1, 0, 0, 32)
			title.Position = UDim2.new(0, 0, 0, 0)
			title.BackgroundColor3 = Color3.fromRGB(200,0,0)
			title.TextColor3 = Color3.fromRGB(255,255,255)
			title.Font = Enum.Font.SourceSansBold
			title.TextSize = 18
			title.Text = "Jogadores Online"
			title.Parent = miniList
			local y2 = 36
			for _, player in ipairs(Players:GetPlayers()) do
				local plrBtn = Instance.new("TextButton")
				plrBtn.Size = UDim2.new(1, -12, 0, 26)
				plrBtn.Position = UDim2.new(0, 6, 0, y2)
				plrBtn.BackgroundColor3 = (state.selectedPlayer == player) and Color3.fromRGB(200,0,0) or Color3.fromRGB(40,40,40)
				plrBtn.TextColor3 = Color3.fromRGB(255,255,255)
				plrBtn.Font = Enum.Font.SourceSansBold
				plrBtn.TextSize = 15
				plrBtn.Text = player.DisplayName .. " ("..player.Name..")"
				plrBtn.BorderSizePixel = 0
				plrBtn.Parent = miniList
				plrBtn.MouseButton1Click:Connect(function()
					state.selectedPlayer = player
					-- Redesenha a mini lista para destacar
					miniList:Destroy()
					state.miniList = nil
					createMiniList()
					-- Atualiza a aba Players para mostrar o botão de Telar
					selectTab("Players")
				end)
				y2 = y2 + 28
			end
		end
		showListBtn.MouseButton1Click:Connect(createMiniList)

		-- Botão de telar/parar de telar
		if state.spectating then
			local stopBtn = Instance.new("TextButton")
			stopBtn.Size = UDim2.new(0, 220, 0, 32)
			stopBtn.Position = UDim2.new(0, 24, 0, y)
			stopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
			stopBtn.TextColor3 = Color3.fromRGB(255,255,255)
			stopBtn.Font = Enum.Font.SourceSansBold
			stopBtn.TextSize = 18
			stopBtn.Text = "Parar de Telar"
			stopBtn.BorderSizePixel = 0
			stopBtn.Parent = MainArea
			stopBtn.MouseButton1Click:Connect(function()
				stopSpectate()
				state.selectedPlayer = nil
				selectTab("Players")
			end)
			y = y + 44
		end

		-- Botão Teleportar até o jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local tpBtn = Instance.new("TextButton")
			tpBtn.Size = UDim2.new(0, 220, 0, 32)
			tpBtn.Position = UDim2.new(0, 24, 0, y)
			tpBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			tpBtn.TextColor3 = Color3.fromRGB(255,255,255)
			tpBtn.Font = Enum.Font.SourceSansBold
			tpBtn.TextSize = 18
			tpBtn.Text = "Teleportar até Jogador"
			tpBtn.BorderSizePixel = 0
			tpBtn.Parent = MainArea
			tpBtn.MouseButton1Click:Connect(function()
				tpBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local lp = Players.LocalPlayer
				if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and state.selectedPlayer and state.selectedPlayer.Character and state.selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
					lp.Character.HumanoidRootPart.CFrame = state.selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,2)
				end
				wait(0.15)
				tpBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end

			local spectateBtn = Instance.new("TextButton")
			spectateBtn.Size = UDim2.new(0, 220, 0, 32)
			spectateBtn.Position = UDim2.new(0, 24, 0, y)
			spectateBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			spectateBtn.TextColor3 = Color3.fromRGB(255,255,255)
			spectateBtn.Font = Enum.Font.SourceSansBold
			spectateBtn.TextSize = 18
			spectateBtn.Text = "Telar Jogador"
			spectateBtn.BorderSizePixel = 0
			spectateBtn.Parent = MainArea
			spectateBtn.MouseButton1Click:Connect(function()
				spectateBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				spectatePlayer(state.selectedPlayer)
				selectTab("Players")
				wait(0.15)
				spectateBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		flyBtn.TextColor3 = Color3.fromRGB(255,255,255)
		flyBtn.Font = Enum.Font.SourceSansBold
		flyBtn.TextSize = 18
		flyBtn.Text = "Fly (em breve)"
		flyBtn.BorderSizePixel = 0
		flyBtn.Parent = MainArea
		y = y + 44
		local noclipBtn = Instance.new("TextButton")
		noclipBtn.Size = UDim2.new(0, 220, 0, 32)
		noclipBtn.Position = UDim2.new(0, 24, 0, y)
		noclipBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		noclipBtn.TextColor3 = Color3.fromRGB(255,255,255)
		noclipBtn.Font = Enum.Font.SourceSansBold
		noclipBtn.TextSize = 18
		noclipBtn.Text = "NoClip (em breve)"
		noclipBtn.BorderSizePixel = 0
		noclipBtn.Parent = MainArea
		y = y + 44

		-- Botão Teleportar até o jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local tpBtn = Instance.new("TextButton")
			tpBtn.Size = UDim2.new(0, 220, 0, 32)
			tpBtn.Position = UDim2.new(0, 24, 0, y)
			tpBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
			tpBtn.TextColor3 = Color3.fromRGB(255,255,255)
			tpBtn.Font = Enum.Font.SourceSansBold
			tpBtn.TextSize = 18
			tpBtn.Text = "Teleportar até Jogador"
			tpBtn.BorderSizePixel = 0
			tpBtn.Parent = MainArea
			tpBtn.MouseButton1Click:Connect(function()
				local lp = Players.LocalPlayer
				if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and state.selectedPlayer and state.selectedPlayer.Character and state.selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
					lp.Character.HumanoidRootPart.CFrame = state.selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,2)
				end
			end)
			y = y + 44
		end
		-- Botão Matar Jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local killBtn = Instance.new("TextButton")
			killBtn.Size = UDim2.new(0, 220, 0, 32)
			killBtn.Position = UDim2.new(0, 24, 0, y)
			killBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			killBtn.TextColor3 = Color3.fromRGB(255,255,255)
			killBtn.Font = Enum.Font.SourceSansBold
			killBtn.TextSize = 18
			killBtn.Text = "Matar Jogador"
			killBtn.BorderSizePixel = 0
			killBtn.Parent = MainArea
			killBtn.MouseButton1Click:Connect(function()
				killBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local target = state.selectedPlayer
				if target and target.Character and target.Character:FindFirstChild("Humanoid") then
					target.Character.Humanoid.Health = 0
				end
				wait(0.15)
				killBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
		-- Botão Prender Jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local jailBtn = Instance.new("TextButton")
			jailBtn.Size = UDim2.new(0, 220, 0, 32)
			jailBtn.Position = UDim2.new(0, 24, 0, y)
			jailBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			jailBtn.TextColor3 = Color3.fromRGB(255,255,255)
			jailBtn.Font = Enum.Font.SourceSansBold
			jailBtn.TextSize = 18
			jailBtn.Text = "Prender Jogador"
			jailBtn.BorderSizePixel = 0
			jailBtn.Parent = MainArea
			jailBtn.MouseButton1Click:Connect(function()
				jailBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local target = state.selectedPlayer
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					-- Cria uma "jaula" simples ao redor do jogador
					for i = 1, 4 do
						local part = Instance.new("Part")
						part.Size = Vector3.new(4, 8, 0.2)
						part.Anchored = true
						part.CanCollide = true
						part.BrickColor = BrickColor.new("Really black")
						part.Parent = workspace
						local angle = math.rad((i-1)*90)
						local offset = Vector3.new(math.cos(angle)*2, 4, math.sin(angle)*2)
						part.CFrame = target.Character.HumanoidRootPart.CFrame + offset
					end
					-- Teto
					local top = Instance.new("Part")
					top.Size = Vector3.new(4, 0.2, 4)
					top.Anchored = true
					top.CanCollide = true
					top.BrickColor = BrickColor.new("Really black")
					top.Parent = workspace
					top.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,8,0)
				end
				wait(0.15)
				jailBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
		-- Botão Congelar Jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local freezeBtn = Instance.new("TextButton")
			freezeBtn.Size = UDim2.new(0, 220, 0, 32)
			freezeBtn.Position = UDim2.new(0, 24, 0, y)
			freezeBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			freezeBtn.TextColor3 = Color3.fromRGB(255,255,255)
			freezeBtn.Font = Enum.Font.SourceSansBold
			freezeBtn.TextSize = 18
			freezeBtn.Text = "Congelar Jogador"
			freezeBtn.BorderSizePixel = 0
			freezeBtn.Parent = MainArea
			freezeBtn.MouseButton1Click:Connect(function()
				freezeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local target = state.selectedPlayer
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					target.Character.HumanoidRootPart.Anchored = true
				end
				wait(0.15)
				freezeBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
		-- Botão Clonar Aparência do jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local cloneBtn = Instance.new("TextButton")
			cloneBtn.Size = UDim2.new(0, 220, 0, 32)
			cloneBtn.Position = UDim2.new(0, 24, 0, y)
			cloneBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			cloneBtn.TextColor3 = Color3.fromRGB(255,255,255)
			cloneBtn.Font = Enum.Font.SourceSansBold
			cloneBtn.TextSize = 18
			cloneBtn.Text = "Clonar Aparência"
			cloneBtn.BorderSizePixel = 0
			cloneBtn.Parent = MainArea
			cloneBtn.MouseButton1Click:Connect(function()
				cloneBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local lp = Players.LocalPlayer
				local target = state.selectedPlayer
				if lp and lp.Character and target and target.Character then
					-- Clona todas as roupas e acessórios
					for _, v in ipairs(lp.Character:GetChildren()) do
						if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
							v:Destroy()
						end
					end
					for _, v in ipairs(target.Character:GetChildren()) do
						if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
							v:Clone().Parent = lp.Character
						end
					end
				end
				wait(0.15)
				cloneBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
		-- Botão Lançar/Jogar para longe o jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local launchBtn = Instance.new("TextButton")
			launchBtn.Size = UDim2.new(0, 220, 0, 32)
			launchBtn.Position = UDim2.new(0, 24, 0, y)
			launchBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			launchBtn.TextColor3 = Color3.fromRGB(255,255,255)
			launchBtn.Font = Enum.Font.SourceSansBold
			launchBtn.TextSize = 18
			launchBtn.Text = "Lançar Jogador"
			launchBtn.BorderSizePixel = 0
			launchBtn.Parent = MainArea
			launchBtn.MouseButton1Click:Connect(function()
				launchBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local target = state.selectedPlayer
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = target.Character.HumanoidRootPart
					hrp.Velocity = Vector3.new(0, 150, 0) + (hrp.CFrame.LookVector * 100)
				end
				wait(0.15)
				launchBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
		-- Botão Remover Acessórios do jogador selecionado
		if state.selectedPlayer and state.selectedPlayer ~= Players.LocalPlayer then
			local removeBtn = Instance.new("TextButton")
			removeBtn.Size = UDim2.new(0, 220, 0, 32)
			removeBtn.Position = UDim2.new(0, 24, 0, y)
			removeBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			removeBtn.TextColor3 = Color3.fromRGB(255,255,255)
			removeBtn.Font = Enum.Font.SourceSansBold
			removeBtn.TextSize = 18
			removeBtn.Text = "Remover Acessórios"
			removeBtn.BorderSizePixel = 0
			removeBtn.Parent = MainArea
			removeBtn.MouseButton1Click:Connect(function()
				removeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				local target = state.selectedPlayer
				if target and target.Character then
					for _, v in ipairs(target.Character:GetChildren()) do
						if v:IsA("Accessory") then
							v:Destroy()
						end
					end
				end
				wait(0.15)
				removeBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
			end)
			y = y + 44
		end
	elseif tabName == "Configurações" then
		local y = 32
		local saveBtn = Instance.new("TextButton")
		saveBtn.Size = UDim2.new(0, 220, 0, 32)
		saveBtn.Position = UDim2.new(0, 24, 0, y)
		saveBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		saveBtn.TextColor3 = Color3.fromRGB(255,255,255)
		saveBtn.Font = Enum.Font.SourceSansBold
		saveBtn.TextSize = 18
		saveBtn.Text = "Salvar Configuração"
		saveBtn.BorderSizePixel = 0
		saveBtn.Parent = MainArea
		y = y + 44
		local loadBtn = Instance.new("TextButton")
		loadBtn.Size = UDim2.new(0, 220, 0, 32)
		loadBtn.Position = UDim2.new(0, 24, 0, y)
		loadBtn.BackgroundColor3 = Color3.fromRGB(35, 39, 42)
		loadBtn.TextColor3 = Color3.fromRGB(255,255,255)
		loadBtn.Font = Enum.Font.SourceSansBold
		loadBtn.TextSize = 18
		loadBtn.Text = "Carregar Configuração"
		loadBtn.BorderSizePixel = 0
		loadBtn.Parent = MainArea

		-- Função para serializar config
		local function getConfigTable()
			local state = _G.GhostMenu or {}
			return {
				ESP = state.ESP or {},
				aimbotOn = state.aimbotOn,
				norecoilOn = state.norecoilOn,
				fov = state.fov,
				smooth = state.smooth
			}
		end
		local function applyConfigTable(cfg)
			local state = _G.GhostMenu or {}
			if cfg.ESP then
				for k,v in pairs(cfg.ESP) do
					state.ESP[k] = v
					setESP(k, v)
				end
			end
			if cfg.aimbotOn ~= nil then state.aimbotOn = cfg.aimbotOn end
			if cfg.norecoilOn ~= nil then state.norecoilOn = cfg.norecoilOn end
			if cfg.fov then state.fov = cfg.fov end
			if cfg.smooth then state.smooth = cfg.smooth end
		end

		-- Salvar (copiar para clipboard)
		saveBtn.MouseButton1Click:Connect(function()
			local HttpService = game:GetService("HttpService")
			local configStr = HttpService:JSONEncode(getConfigTable())
			if state.spectating then
				local stopBtn = Instance.new("TextButton")
				stopBtn.Size = UDim2.new(0, 220, 0, 32)
				stopBtn.Position = UDim2.new(0, 24, 0, y)
				stopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
				stopBtn.TextColor3 = Color3.fromRGB(255,255,255)
				stopBtn.Font = Enum.Font.SourceSansBold
				stopBtn.TextSize = 18
				stopBtn.Text = "Parar de Telar"
				stopBtn.BorderSizePixel = 0
				stopBtn.Parent = MainArea
				stopBtn.MouseButton1Click:Connect(function()
					stopSpectate()
					state.selectedPlayer = nil
					selectTab("Players")
				end)
				y = y + 44
			end
		end)
	end
end

for i, name in ipairs(Tabs) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 36)
	btn.Position = UDim2.new(0, 0, 0, (i-1)*40+8)
	btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	btn.TextColor3 = Color3.fromRGB(220,220,220)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	btn.Text = name
	btn.BorderSizePixel = 0
	btn.Parent = SideBar
	tabButtons[name] = btn
	btn.MouseButton1Click:Connect(function()
		selectTab(name)
	end)
end

selectTab(Tabs[1])

-- Minimizar/Maximizar
local minimized = false
local originalSize = UDim2.new(0, 520, 0, 320)
local minimizedSize = UDim2.new(0, 520, 0, 36)
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		MainArea.Visible = false
		SideBar.Visible = false
		MainFrame.Size = minimizedSize
		MinBtn.Text = "□"
		MinBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	else
		MainArea.Visible = true
		SideBar.Visible = true
		MainFrame.Size = originalSize
		MinBtn.Text = "_"
		MinBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
