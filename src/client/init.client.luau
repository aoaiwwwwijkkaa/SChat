local schtdt = game:GetService("ReplicatedStorage"):WaitForChild("SChatDATA")
local cnnt

if not schtdt then
	cnnt = game:GetService("ReplicatedStorage").ChildAdded:Connect(function(child)
		if child.Name == "SChatDATA" and child:IsA("Folder") then
			schtdt = child
			cnnt:Disconnect()
			cnnt = nil
		end
	end)
end

schtdt
	:WaitForChild("DisplayMessage").OnClientEvent
	:Connect(function(plr: Player, text: string, texttobesentinchat: string)
		local general: TextChannel = game:GetService("TextChatService"):WaitForChild("TextChannels").RBXGeneral
		game:GetService("TextChatService"):DisplayBubble(plr.Character, text)
		general:DisplaySystemMessage(texttobesentinchat)
	end)
