local schat = require(game:GetService("ReplicatedStorage"):WaitForChild("SChat"))

--These are example words/messages, you can put these when the SChat module function :SetUp() is being called as an argument.
local words = {
	[1] = "Hi!",
	[2] = "Want 2 play?",
	[3] = "<(0_0<) <(0_0)> (>0_0)> kirby dance",
}

schat:SetUp() --Adding on to line 3, you can add in the words variable in the () to see the example.
