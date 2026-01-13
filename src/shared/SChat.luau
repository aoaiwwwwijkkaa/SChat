local SChat = {}

local testingmode = false

local testingmode_messages = {
	[1] = "Hi!",
	[2] = "Want 2 play?",
	[3] = "This thing has a list of stuff!",
	[4] = "Go to the 'SChat' module you just required to see this!",
	[5] = "Also, you can add your own! These are just messages meant for testing!",
	[6] = "These are activated when the module detects your in Studio!",
	[7] = "Or, you can manually set it to be set to true.",
	[8] = "Yes, you can actually remove these via giving the :SetUp function your own messages.",
}

function SChat:SetUp(msgs): nil
	if game["Run Service"]:IsStudio() then
		testingmode = true
	end

	if game["Run Service"]:IsClient() then
		local general: TextChannel =
			game:GetService("TextChatService"):FindFirstChild("TextChannels"):WaitForChild("RBXGeneral")
		local sys: TextChannel =
			game:GetService("TextChatService"):FindFirstChild("TextChannels"):WaitForChild("RBXSystem")

		general:DisplaySystemMessage("<font color='rgb(75, 0, 150)'>[SCHAT] Safe chat initiated!</font>")
		--sys:DisplaySystemMessage("<font color='rgb(75, 0, 150)'>[SCHAT] Safe chat initiated!</font>")

		if not testingmode then
			if game:GetService("TextChatService"):CanUserChatAsync(game:GetService("Players").LocalPlayer.UserId) then
				general:DisplaySystemMessage(
					"<font color='rgb(75, 0, 150)'>[SCHAT] Automaticly disabled because user can chat.</font>"
				)
				--sys:DisplaySystemMessage("<font color='rgb(75, 0, 150)'>[SCHAT] Automaticly disabled because user can chat.</font>")
				return
			end
		else
			if not msgs then
				msgs = testingmode_messages
			end
		end

		require(script:WaitForChild("DrawClient")):Create_Buttons(msgs)
	end
end

return SChat
