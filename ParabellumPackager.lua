-- Create a new toolbar section titled "Parabellum Tools"
local toolbar = plugin:CreateToolbar("Parabellum Tools")

-- Add a toolbar button named "Package Map"
local packageMap = toolbar:CreateButton("Package Map", "Package map into a Project Parabellum Compatible Map", "rbxassetid://4458901886")

-- Package everything
local function onNewScriptButtonClicked()
	print("Packaging map. Please wait...")
	local map = Instance.new("Model")

	-- Get every object in workspace
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name ~= "Terrain" and v.Name ~= "Camera" then
			v.Parent = map
		end
	end
	print("Packaged workspace")

	-- Time values
	local timevalue = Instance.new("NumberValue")
	timevalue.Value = game:GetService("Lighting").ClockTime
	timevalue.Name = "tod"
	timevalue.Parent = map
	print("Packaged Clocktime")

	-- Geographic latitude values
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
	print("Successfully packaged map!")
end
packageMap.Click:Connect(onNewScriptButtonClicked)