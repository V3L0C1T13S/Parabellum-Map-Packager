local ChangeHistoryService = game:GetService("ChangeHistoryService")

-- Create a new toolbar section titled "Custom Script Tools"
local toolbar = plugin:CreateToolbar("Parabellum Tools")

-- Add a toolbar button named "Create Empty Script"
local newScriptButton = toolbar:CreateButton("Package Map", "Package map into a Project Parabellum Compatible Map", "rbxassetid://4458901886")
--package everything
local function onNewScriptButtonClicked()
	ChangeHistoryService:SetWaypoint("Before the map was packaged")
	print("Packaging map. Please wait...")
	local map = Instance.new("Model")
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name ~= "Terrain" and v.Name ~= "Camera" then
			v.Parent = map
		end
	end
	print("Packaged workspace")
	local timevalue = Instance.new("NumberValue")
	timevalue.Value = game:GetService("Lighting").ClockTime
	timevalue.Name = "TOD"
	timevalue.Parent = map
	print("Packaged Clocktime")
	
	local geographiclatitude = Instance.new("NumberValue")
	geographiclatitude.Value = game:GetService("Lighting").GeographicLatitude
	geographiclatitude.Name = "GL"
	geographiclatitude.Parent = map
	print("Packaged Geographic Latitude")
	
	if game:GetService("Lighting"):FindFirstChild("Atmosphere") then
		game:GetService("Lighting"):FindFirstChild("Atmosphere").Parent = map
		print("Packaged Atmosphere")
	end
	if game:GetService("Lighting"):FindFirstChild("Sky") then
		game:GetService("Lighting"):FindFirstChild("Sky").Parent = map
		print("Packaged Sky")
	end
	map.Name = "Packaged Map"
	map.Parent = workspace
	ChangeHistoryService:SetWaypoint("Packaged the map")
	print("Successfully packaged map!")
end
newScriptButton.Click:Connect(onNewScriptButtonClicked)