script.Parent = game:GetService("ReplicatedStorage"):WaitForChild("SChat")

local draw = {}

function draw:Create_Buttons(data: { string }): nil
	local hud = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	hud.Name = "SChat"
	hud.ResetOnSpawn = false
	local openbutton = Instance.new("TextButton", hud)
	openbutton.Position = UDim2.new(0.087, 0, 0.971, 0)
	openbutton.Size = UDim2.new(0.167, 0, 0.043, 0)
	openbutton.AnchorPoint = Vector2.new(0.5, 0.5)
	openbutton.Text = "SChat"
	openbutton.FontFace = Font.fromName("Arimo", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	openbutton.TextScaled = true
	local stroke = Instance.new("UIStroke", openbutton)
	stroke.Thickness = 3
	local frameforstuff = Instance.new("Frame", hud)
	frameforstuff.Position = UDim2.new(0.178, 0, 0, 0)
	frameforstuff.Size = UDim2.new(0.823, 0, 1, 0)
	frameforstuff.BackgroundTransparency = 1
	frameforstuff.Visible = false
	local uigridlayout = Instance.new("UIGridLayout", frameforstuff)
	uigridlayout.FillDirection = Enum.FillDirection.Vertical
	uigridlayout.FillDirectionMaxCells = 19
	uigridlayout.CellSize = UDim2.new(0.167, 0, 0.043, 0)
	uigridlayout.CellPadding = UDim2.new(0, 10, 0, 10)

	openbutton.MouseButton1Click:Connect(function()
		frameforstuff.Visible = not frameforstuff.Visible
	end)

	for i, datatable in pairs(data) do
		local thingyjingy = Instance.new("TextButton", frameforstuff)
		thingyjingy.Text = data[i]
		thingyjingy.FontFace = Font.fromName("Arimo", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		thingyjingy.TextScaled = true
		thingyjingy.Name = tostring(i)
		thingyjingy.MouseButton1Click:Connect(function()
			game:GetService("ReplicatedStorage")
				:WaitForChild("SChatDATA")
				:FindFirstChild("SendText")
				:FireServer(thingyjingy.Text)
		end)
		task.wait(0.05)
	end
end

return draw
