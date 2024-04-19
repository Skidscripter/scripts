getgenv().Settings = {
    ["ENABLED"] = Looten.Adjustment.Memory.Enable,
    ["DURATION"] = Looten.Adjustment.Memory.Speed,
    ["MEM_VALUE_1"] = Looten.Adjustment.Memory.Start,
    ["MEM_VALUE_2"] = Looten.Adjustment.Memory.End,
    ["MEM_AVALUE_1"] = Looten.Adjustment.Memory.Start,
    ["MEM_AVALUE_2"] = Looten.Adjustment.Memory.End,
}



if isHzLoaded then return end getgenv().isHzLoaded = true
local PerformanceStats = game:GetService("CoreGui").RobloxGui:WaitForChild("PerformanceStats")
function Text() --// main function that changes the text in all performanceStats i 
pcall(function()
for i,v in pairs(PerformanceStats:GetDescendants()) do
    if v.ClassName == "TextLabel" then
        if v.Text:match("MB") then
            if v.Name == "ValueLabel" then
                v.Text = Text_1..""..Text_2
            end
            if v.Name == "Label" then
                if v.Text:match("Current") then
                    v.Text = "Current "..Text_1..""..Text_2
                end
                if v.Text:match("Average") then
                    v.Text = "Average "..Text_3..""..Text_4
                end
            end
        end
    end
end
local DevConsole = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
for i,d in pairs(DevConsole:GetDescendants()) do
    if d.ClassName == "TextButton" then
    if d.Text:match("MB") then
        d.Text = Text_1.." MB"
    end
    end
end
local ClientMemory = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientMemory.Entries.Memory
for i,c in pairs(ClientMemory:GetDescendants()) do
    if c.Name == "value" then
        c.Text = Text_1
    end
end
local ClientMemory = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientMemory.Entries.Memory
for i,c in pairs(ClientMemory:GetDescendants()) do
    if c.Name == "value" then
        c.Text = Text_1
    end
end
if game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory") then
    if game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph"):FindFirstChild("LatestEntryText") then
        game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph"):FindFirstChild("LatestEntryText").Text = Text_1
        game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph"):FindFirstChild("AxisTextY0").Text = Text_5
    end
end
end)
end
--// The main loops; text updater, memory updater, devmemory updater
coroutine.resume(coroutine.create(function()
    pcall(function()
        while Settings["ENABLED"] do
            task.wait()
            Text()
        end
    end)
end))
coroutine.resume(coroutine.create(function()
    pcall(function()
        while Settings["ENABLED"] do
            task.wait(Settings["DURATION"])
            Text_1 = tostring(math.random(Settings["MEM_VALUE_1"], Settings["MEM_VALUE_2"]))
            Text_2 = tostring("."..math.random(1, 99) .. " MB")
            Text_3 = tostring(math.random(Settings["MEM_AVALUE_1"], Settings["MEM_AVALUE_2"]))
            Text_4 = tostring("."..math.random(1, 99) .. " MB")
        end
    end)
end))
coroutine.resume(coroutine.create(function()
    pcall(function()
        while Settings["ENABLED"] do
            wait(5)
            Text_5 = tostring(math.random(Settings["MEM_VALUE_1"], Settings["MEM_VALUE_2"]))
        end
    end)
end))
pcall(function()
--// This is made for the most buggy labels, i prefered to leave it here so they help with text update :D
local ValueMB = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Header"):FindFirstChild("ValueMB")
ValueMB:GetPropertyChangedSignal("Text"):Connect(function()
    Text()
end)
local MemButton;
for I, Children in next, PerformanceStats:GetChildren() do
    if Children.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
        MemButton = Children.StatsMiniTextPanelClass.ValueLabel;
        break;
    end;
end;
MemButton:GetPropertyChangedSignal("Text"):Connect(function()
    Text()
end)
local MemoryTabLabel, SecondMemoryTabLabel = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph"):FindFirstChild("LatestEntryText"),        game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph"):FindFirstChild("AxisTextY0")
MemoryTabLabel:GetPropertyChangedSignal("Text"):Connect(function()
    Text()
end)
SecondMemoryTabLabel:GetPropertyChangedSignal("Text"):Connect(function()
    Text()
end)

for i,v in pairs(PerformanceStats:GetDescendants()) do
    if v.ClassName == "TextLabel" then
        if v.Text:match("MB") then
            if v.Name == "ValueLabel" then
                v.Text = Text_1..""..Text_2
                local PerformanceStatsDetector1 = v
                PerformanceStatsDetector1:GetPropertyChangedSignal("Text"):Connect(function()
                    Text()
                end)
            end
            if v.Name == "Label" then
                if v.Text:match("Current") then
                    v.Text = "Current "..Text_1..""..Text_2
                    local PerformanceStatsDetector2 = v
                    PerformanceStatsDetector2:GetPropertyChangedSignal("Text"):Connect(function()
                        Text()
                    end)
                end
                if v.Text:match("Average") then
                    v.Text = "Average "..Text_3..""..Text_4
                    local PerformanceStatsDetector3 = v
                    PerformanceStatsDetector3:GetPropertyChangedSignal("Text"):Connect(function()
                        Text()
                    end)
                end
            end
        end
    end
end
end)
