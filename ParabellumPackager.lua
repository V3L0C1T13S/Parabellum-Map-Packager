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
		if not v:IsA("Terrain") and not v:IsA("Camera") then
			local obj = v:Clone()
			obj.Parent = map
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

	if game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere") then
		local atmosphere = game:GetService("Lighting"):FindFirstChildWhichIsA("Atmosphere"):Clone() 
		atmosphere.Parent = map
		print("Packaged Atmosphere")
	else
		warn("Couldn't find an Atmosphere! Creating placeholder")
		local atmosphere = Instance.new("Atmosphere")
		atmosphere.Parent = map
	end

	if game:GetService("Lighting"):FindFirstChildWhichIsA("Sky") then
		local sky = game:GetService("Lighting"):FindFirstChildWhichIsA("Sky"):Clone() 
		sky.Parent = map
		print("Packaged Sky")
	else
		warn("Couldn't find a Skybox! Creating placeholder")
		local sky = Instance.new("Sky")
		sky.Parent = map
	end

	map.Name = "Packaged Map"
	map.Parent = workspace
	print("Successfully packaged map!")
end
packageMap.Click:Connect(onNewScriptButtonClicked)