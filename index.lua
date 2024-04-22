local properties = {
	"Position","Size","Color","Color3","BrickColor","CastShandow","Material","Reflectance","Transparency","Locked","Name","Parent","Orientation","CFrame","CanCollide","CanQuery","CanTouch","Anchored","Shape","Decoration","RootPriority","Value","Massless","FieldOfView",
	"HeadScale","Archivable","Text","BackgroundTransparency","TextScaled","AnchorPoint","SoundId","Image","BorderSizePixel","RollOffMaxDistance","RollOffMinDistance","RollOffMode","Looped","PlaybackSpeed","Playing","TimePosition",
	"Volume","C0","C1","TexureId","CanBeDropped","ManualActivationOnly","RequiresHandle","Grip","Enabled","AllowTeamChangeOnTouch","Neutral","TeamColor","Duration","Texture","Color3","ZIndex","ResetOnSpawn","PlaceholderText","TextSize","CanvasSize","Part0",
	"Part1","PlayOnRemove","Active","IngoreGuilnset","DisplayOrder","ClassName","Angle","Brightness","Shandows","Range","HeadColor","LeftArmColor","LeftLegColor","RightArmColor","RightLegColor","TorsoColor","BaseMaterial","ColorMap","MetalnessMap","RoughnessMap",
	"MaterialPattern","StudsPerTitle","Offset","OffsetStudsU","OffsetStudsV","StudsPerTileU","StudsPerTileV","Adornee","AlwaysOnTop","ExtendsOffset","ExtendsOffsetWorldSpace","LightInfluence","MaxDistance","PlayerToHideFrom","SizeOffset","StudsOffset","StudsOffsetWorldSpace",
	"ZIndexBehavior","CornerRadius","Padding","PaddingBottom","PaddingLeft","PaddingRight","PaddingTop","FillDirection","HorizontalAlignment","VerticalAlignment","ShortOrder",
	"ClipsDescendants","AutoLocalize","Face","Selectable","SelectionGroup","SelectionOrder","BackgroundColor3","BorderColor3","TextColor3","Rotation","LineHeight","MaxVisibleGraphemes","RichText","TextStrokeColor3","TextStrokeTransparency","TextTransparency",
	"TextWrapped","Modal","AutoButtonColor","Disabled","WalkSpeed","BreakJointsOnDeath","RequiresNeck","AutoRotate","Jump","Sit","PlatformStand","HipHeight","MaxHealth","MaxSlopeAngle","AutoJumpEnabled","JumpPower","UseJumpPower","JumpHeight","Origin",
	"PrimaryPart","WorldPivot", "Ambient","ColorShift_Bottom","ColorShift_Top","EnvironmentDiffuseScale","EnvironmentSpecularScale","GlobalShandows","ShandowSoftness","Technology","ClockTime","GeographicLatitude","ExposureCompensation","FogColor","FogEnd","FogStart",
	"UseCurrentLightning","CurrentCamera","DistributedGameTime","AllowThirdPartySales","ClientAnimatorThrottling","FallenPartsDestroyHeight","Gravity","HumanoidOnlySetCollisionOnStateChange","InterPolationThrottling","MeshPartHeadsAndAccessories","PhysicsSteppingMethod",
	"Retargetting","SignalBehavior","Terrain","TouchesUseCollisionGroups","UnionsScaleNonuniformly","StreamingEnabled","ScreenOrientation","VitrualCursorMode","HealthDisplayDistance","NameDisplayDistance","CameraMaxZoomDistance","CameraMinZoomDistance","CameraMode","UserEmotesEnabled"
}
local TweenSevice = game.TweenService
local player = game.Players.LocalPlayer
local UserInputService = game.UserInputService
local playerGUI = player.PlayerGui
local isOpened = false
local guiScreen = Instance.new("ScreenGui")
guiScreen.ResetOnSpawn = false
guiScreen.Parent = playerGUI
local guiSidebar = Instance.new("Frame")
guiSidebar.BackgroundTransparency = 1
guiSidebar.BorderSizePixel = 0
guiSidebar.Position = UDim2.new(1, -50,0,0)
guiSidebar.Size = UDim2.new(0,350,1,0)
guiSidebar.Parent = guiScreen
local openSidebarGoal = {}
openSidebarGoal["AnchorPoint"] = Vector2.new(1,0)
openSidebarGoal["Position"] = UDim2.new(1,0,0,0)
openSidebarGoal["BackgroundTransparency"] = 0
local closeSidebarGoal = {}
closeSidebarGoal["AnchorPoint"] = Vector2.new(0,0)
closeSidebarGoal["Position"] = UDim2.new(1,-25,0,0)
closeSidebarGoal["BackgroundTransparency"] = 1
local tweenSidebarInfo = TweenInfo.new(1)
local openSidebarTween = TweenSevice:Create(guiSidebar,tweenSidebarInfo,openSidebarGoal)
local closeSidebarTween = TweenSevice:Create(guiSidebar,tweenSidebarInfo,closeSidebarGoal)
local openhideButton = Instance.new("TextButton")
local refreshButton = Instance.new("ImageButton")
local espEnabled = false
local flyEnabled = false

function toggleESP()
	espEnabled = not espEnabled
	print("ESP ativado: " .. tostring(espEnabled))
end

function toggleFly()
	flyEnabled = not flyEnabled
	print("Voar ativado: " .. tostring(flyEnabled))
end

function openSidebar()
	openhideButton.Text = ">"
	openSidebarTween:Play()
	refreshButton.Visible = true
	isOpened = true
	openhideButton.Modal = true
end

function closeSidebar()
	openhideButton.Text = "<"
	closeSidebarTween:Play()
	refreshButton.Visible = false
	isOpened = false
	openhideButton.Modal = false
end

function openCloseSidebar()
	if (isOpened) then
		closeSidebar()
	else
		openSidebar()
	end
end

UserInputService.InputBegan:Connect(function(input,gpe)
	if input.KeyCode == Enum.KeyCode.K and gpe == false then
		openCloseSidebar()
	end
end)

openhideButton.MouseButton1Click:Connect(openCloseSidebar)
openhideButton.Size = UDim2.new(0,25,0,25)
openhideButton.Parent = guiSidebar
refreshButton.Size = UDim2.new(0,25,0,25)
refreshButton.Position = UDim2.new(0,0,0,25)
refreshButton.Image = "rbxassetid://10281560445"
refreshButton.Parent = guiSidebar

local guiSidebarContent = Instance.new("Frame")
guiSidebarContent.BackgroundTransparency = 0
guiSidebarContent.Size = UDim2.new(1,-25,1,0)
guiSidebarContent.Position = UDim2.new(0,25,0,0)
guiSidebarContent.Parent = guiSidebar
local loadingLabel = Instance.new("TextLabel")
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading..."
loadingLabel.Size = UDim2.new(1,0,0,40)
loadingLabel.TextScaled = true
loadingLabel.BorderSizePixel = 0
loadingLabel.Position = UDim2.new(0,0,0.5,-20)
loadingLabel.Parent = guiSidebarContent

local guiName = Instance.new("TextLabel")
guiName.Text = "Birdy Roblox Place Explorer"
guiName.Size = UDim2.new(1,0,0,20)
guiName.TextScaled = true
guiName.BorderSizePixel = 0
guiName.Position = UDim2.new(0,0,0.5,40)
guiName.BackgroundTransparency = 1
guiName.Parent = guiSidebarContent

openSidebar()
wait(1)

local showPart = Instance.new("Part")
showPart.Anchored = true
showPart.CanCollide = false
showPart.Size = Vector3.new(0,0,0)
showPart.Color = Color3.new(1,0.5,0)
showPart.TopSurface = Enum.SurfaceType.Smooth
showPart.BottomSurface = Enum.SurfaceType.Smooth
showPart.CastShadow = false
showPart.Transparency = 1

local hideShowPartGoal = {}
hideShowPartGoal.Transparency = 1

showPart.Parent = workspace

local hideShowPartTween = TweenSevice:Create(showPart,TweenInfo.new(2),hideShowPartGoal)
local frameTop = Instance.new("Frame")
local frameTopCnt:ScrollingFrame
frameTop.Size = UDim2.new(1,0,0.5,0)
frameTop.Parent = guiSidebarContent

local textboxSearch = Instance.new("TextBox")
textboxSearch.Text = ""
textboxSearch.PlaceholderText = "Search"
textboxSearch.Size = UDim2.new(1,0,0,25)
textboxSearch.ClearTextOnFocus = false
textboxSearch.TextSize = 14
textboxSearch.Parent = frameTop

local frameBottom = Instance.new("Frame")
frameBottom.Size = UDim2.new(1,0,0.5,0)
frameBottom.Position = UDim2.new(0,0,0.5,0)
frameBottom.Parent = guiSidebarContent

local frameBottomCnt:ScrollingFrame

function generateTreeElements()
	if (frameTopCnt ~= nil) then
		frameTopCnt:Destroy()
	end

	frameTopCnt = Instance.new("ScrollingFrame")
	frameTopCnt.CanvasSize = UDim2.new(0,0,0,0)
	frameTopCnt.AutomaticCanvasSize = Enum.AutomaticSize.XY
	frameTopCnt.Size = UDim2.new(1,0,1,-25)
	frameTopCnt.Position = UDim2.new(0,0,0,25)
	frameTopCnt.Parent = frameTop
	local listft = Instance.new("UIListLayout")
	listft.Parent = frameTopCnt
	local licount = 0
	local function addElementListItem(element:Instance,subw,showhidebutton:TextButton,parentcf)
		local qSearch = {element}
		if subw == 0 then
			local frame = Instance.new("Frame")
			local buttonelement = Instance.new("TextButton")
			buttonelement.Text = element.Name
			frame.Size = UDim2.new(0,225,0,25)
			frame.Position = UDim2.new(0,0,0,licount * 25)
			frameTopCnt.CanvasSize += UDim2.new(0,0,0,25)
			buttonelement.Parent = frame
			buttonelement.Size = UDim2.new(1,-50,1,0)
			buttonelement.Position = UDim2.new(0,25,0,0)
			frame.Parent = frameTopCnt
			local buttonCH = Instance.new("TextButton")
			buttonCH.Size = UDim2.new(0,25,0,25)
			buttonCH.Text = "+"
			buttonCH.Parent = frame
			buttonelement.Size = UDim2.new(1,-50,1,0)
			buttonelement.Position = UDim2.new(0,25,0,0)
			licount += 1
			subw += 1
			showhidebutton = buttonCH
			local addButton = Instance.new("TextButton")
			addButton.Text = "+"
			addButton.Size = UDim2.new(0,25,0,25)
			addButton.Position = UDim2.new(1,-25,0,0)
			addButton.MouseButton1Click:Connect(function()
				addchild(element)
			end)
			buttonelement.MouseButton1Click:Connect(function()
				showprops(element,frame)
			end)
			addButton.Parent = frame
		end
		--while #qSearch > 0 do
		local childs = qSearch[1]:GetChildren()
		local framechildspadding = Instance.new("Frame")
		framechildspadding.Size = UDim2.new(0,0,0,0)
		--framechildspadding.AutomaticSize = Enum.AutomaticSize.XY
		framechildspadding.BorderSizePixel = 0
		framechildspadding.BackgroundTransparency = 1
		local childsFrame = Instance.new("Frame")
		childsFrame.Position = UDim2.new(0,25,0,0)
		childsFrame.Size = UDim2.new(1,0,0,0)
		childsFrame.AutomaticSize = Enum.AutomaticSize.XY
		childsFrame.Parent = framechildspadding
		childsFrame.BorderSizePixel = 0
		childsFrame.BackgroundTransparency = 1
		childsFrame.Visible = false
		local uilistchilds = Instance.new("UIListLayout")
		uilistchilds.Parent = childsFrame
		if parentcf then
			framechildspadding.Parent = parentcf
		else
			framechildspadding.Parent = frameTopCnt
		end
		if showhidebutton ~= nil then
			showhidebutton.MouseButton1Click:Connect(function()
				--for _,frame:Frame in frames do
				--	frame.Visible = not frame.Visible
				--	if frame.Visible then
				--		showhidebutton.Text = "-"
				--	else
				--		showhidebutton.Text = "+"
				--	end
				--end
				childsFrame.Visible = not childsFrame.Visible
				if childsFrame.Visible then
					showhidebutton.Text = "-"
					framechildspadding.AutomaticSize = Enum.AutomaticSize.XY
				else
					showhidebutton.Text = "+"
					framechildspadding.AutomaticSize = Enum.AutomaticSize.None
				end
				--reposTree()
			end)
		end
		for _,elem:Instance in childs do
			local hh = nil;
			if elem.Name:match(textboxSearch.Text) or textboxSearch.Text == "" then
				local buttonelem = Instance.new("TextButton")
				buttonelem.Text = elem.Name
				local frameelem = Instance.new("Frame")
				--if subw > 1 then
				--	frameelem.Visible = false
				--	
				--end
				frameelem.Size = UDim2.new(0,225,0,25)-- offsetx -(subw * 10)
				--frameelem.Position = UDim2.new(0,subw * 25,0,licount * 25)
				--if frameTopCnt.CanvasSize.X.Offset < (subw * 25) + 225 then
				--	frameTopCnt.CanvasSize = UDim2.new(0,(subw * 25) + 225,0,frameTopCnt.CanvasSize.Y.Offset)
				--end
				--frameTopCnt.CanvasSize += UDim2.new(0,0,0,25)
				if (#elem:GetChildren() ~= 0) then
					local buttonCH = Instance.new("TextButton")
					buttonCH.Size = UDim2.new(0,25,0,25)
					hh = buttonCH
					buttonCH.Text = "+"
					buttonCH.Parent = frameelem
					buttonelem.Size = UDim2.new(1,-50,1,0)
					buttonelem.Position = UDim2.new(0,25,0,0)
				else
					buttonelem.Size = UDim2.new(1,-25,1,0)
				end
				local addButton = Instance.new("TextButton")
				addButton.Text = "+"
				addButton.Size = UDim2.new(0,25,0,25)
				addButton.Position = UDim2.new(1,-25,0,0)
				addButton.MouseButton1Click:Connect(function()
					addchild(elem)
				end)
				addButton.Parent = frameelem
				buttonelem.Parent = frameelem
				frameelem.Parent = childsFrame
				buttonelem.MouseButton1Click:Connect(function()
					showprops(elem,frameelem)
				end)
				--print(licount)
				licount += 1
			end
		end
	end

	function showprops(element:Instance,frame)
		if frame ~= nil then
			if frame:IsA("Frame") then
				frame:Destroy()
			end
		end
		local frameProps = Instance.new("Frame")
		local uilist = Instance.new("UIListLayout")
		frameProps.Size = UDim2.new(1,0,0,0)
		uilist.Parent = frameProps
		frameProps.Parent = frameTopCnt
		for _,prop in ipairs(properties) do
			local propval = nil
			if (type(element[prop]) == "number") then
				propval = tostring(element[prop])
			elseif (type(element[prop]) == "EnumItem") then
				propval = element[prop].Name
			elseif (type(element[prop]) == "boolean") then
				if (element[prop] == true) then
					propval = "true"
				else
					propval = "false"
				end
			elseif (type(element[prop]) == "string") then
				propval = element[prop]
			end
			if (propval ~= nil) then
				local labelProp = Instance.new("TextLabel")
				labelProp.Text = prop .. ": " .. propval
				labelProp.BackgroundTransparency = 1
				labelProp.BorderSizePixel = 0
				labelProp.Size = UDim2.new(1,0,0,25)
				labelProp.TextScaled = true
				labelProp.Parent = frameProps
			end
		end
	end

	function addchild(element:Instance)
		local qSearch = {element}
		--while #qSearch > 0 do
		local childs = qSearch[1]:GetChildren()
		for _,elem:Instance in childs do
			if elem.Name:match(textboxSearch.Text) or textboxSearch.Text == "" then
				if frameTopCnt ~= nil then
					local frame = Instance.new("Frame")
					local buttonelem = Instance.new("TextButton")
					buttonelem.Text = elem.Name
					frame.Size = UDim2.new(1,-50,0,25)
					frame.Position = UDim2.new(0,25,0,licount * 25)
					frameTopCnt.CanvasSize += UDim2.new(0,0,0,25)
					buttonelem.Parent = frame
					buttonelem.Size = UDim2.new(1,-50,1,0)
					buttonelem.Position = UDim2.new(0,25,0,0)
					frame.Parent = frameTopCnt
					buttonelem.MouseButton1Click:Connect(function()
						showprops(elem,frame)
					end)
					licount += 1
					if #elem:GetChildren() ~= 0 then
						local buttonCH = Instance.new("TextButton")
						buttonCH.Size = UDim2.new(0,25,0,25)
						buttonCH.Text = "+"
						buttonCH.Parent = frame
						local childsclicked = false
						buttonCH.MouseButton1Click:Connect(function()
							if childsclicked == false then
								addElementListItem(elem,subw + 1,buttonCH,frameTopCnt)
							else
								frame.Top = UDim2.new(0,0,0,licount * 25)
								frame:ClearAllChildren()
								buttonCH.Text = "+"
								frame.Visible = false
							end
							childsclicked = not childsclicked
						end)
					end
				end
			end
		end
	end

	addElementListItem(workspace,0,nil,nil)
end

generateTreeElements()
textboxSearch:GetPropertyChangedSignal("Text"):Connect(function()
	generateTreeElements()
end)

refreshButton.MouseButton1Click:Connect(function()
	generateTreeElements()
end)
