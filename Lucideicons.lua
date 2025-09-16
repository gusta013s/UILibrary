local module = {}


module.Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Nebula-Icon-Library/master/MaterialIcons.luau"))()
module.Lucide = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Nebula-Icon-Library/master/LucideIcons.luau"))()
module.Phosphor = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Nebula-Icon-Library/refs/heads/master/Phosphor.luau"))()
module["Phosphor-Filled"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Nebula-Icon-Library/refs/heads/master/Phosphor%20Filled.luau"))()
module.SF = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Nebula-Icon-Library/refs/heads/master/SFSymbols.luau"))()


function module:GetIcon(name, source)
    source = source or "Material"
    local iconId = module[source] and module[source][name]

    if not iconId then
        warn(("[NebulaIcons] Icon: %s (source: %s)"):format(tostring(name), tostring(source)))
        return ""
    end

    local asset = "rbxassetid://" .. iconId

  
    pcall(function()
        game:GetService("ContentProvider"):PreloadAsync({ asset })
    end)

    return asset
end

return module
