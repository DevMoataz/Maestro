
--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                       ▀▄ ▄▀ 
▀▄ ▄▀    BY 💯-Đєⱴ💀: @devmaestr0             ▀▄ ▄▀ 
▀▄ ▄▀     BY 💯-Đєⱴ 💀: @MaEsTrO_0            ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY MAESTRO                ▀▄ ▄▀   
▀▄ ▄▀                                       ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
—]]
local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 
 
function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end 
   function maestro(msg, matches) 
    if tonumber (msg.from.id) == 67369633 then 
       if matches[1]:lower() == "اضف مطور" then 
          table.insert(_config.sudo_users, tonumber(matches[2])) 
      print(matches[2] ..'\nتـمـ ✔️ اضـافـه مـطـور فـي الـبـوتـ 🏌') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..'\nتـمـ ✔️ اضـافـه مـطـور فـي الـبـوتـ 🏌' 
   elseif matches[1]:lower() == "حذف مطور"  then 
      local k = tonumber(matches[2]) 
          table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
      print(matches[2] ..'\nتـمـ ✔️ حـذفـ الـمـطـور مـن الـبـوتـ 🏌') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..'\nتـمـ ✔️ حـذفـ الـمـطـور مـن الـبـوتـ 🏌' 
      end 
   end 
end 
return { 
patterns = { 
"^(اضف مطور) (%d+)$", 
"^(حذف مطور) (%d+)$",
"^[#!/](اضف مطور) (%d+)$", 
"^[#!/](حذف مطور) (%d+)$"
}, 
run = maestro
}


