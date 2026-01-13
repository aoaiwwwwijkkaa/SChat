local schtdt = game:GetService("ReplicatedStorage"):WaitForChild("SChatDATA")

if not schtdt then
	local folder = Instance.new("Folder", game:GetService("ReplicatedStorage"))
	folder.Name = "SChatDATA"
	local display = Instance.new("RemoteEvent", folder)
	display.Name = "DisplayMessage"
	local sndtext = Instance.new("RemoteEvent", folder)
	display.Name = "SendText"

	schtdt = folder
end

schtdt:WaitForChild("SendText").OnServerEvent:Connect(function(plr: Player, text: string)
	local normaltext = `<font color='rgb(75, 0, 150)'>[{plr.DisplayName}/{plr.Name}]</font>: {text}`
	schtdt:FindFirstChild("DisplayMessage"):FireAllClients(plr, text, normaltext)
end)
