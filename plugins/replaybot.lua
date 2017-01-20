do 

local function maestro(msg, matches) 
local reply_id = msg ['id']
if ( msg.text ) then

  if ( msg.to.type == "user" ) then

local text = "حبيبي 🙇🏻🍷 @"..msg.from.username..'\n\nانت الان تتحدث مع روبوت 😻  SAQT 🤖✅ \n\n للتحدث مع المطور 🕵 \n\n 🔶 Dev @iqMaestroBot \n\n سيقوم المطور بمساعدتك  💋🙂 ♠️🔇 قناة المطور  🤖🔝\n\n📡  @DevMaestro    💋😻\n'     reply_msg(reply_id, text, ok_cb, false)  end 

end 

end 

return { 
  patterns = { 
       "(.*)$"
  }, 
  run = maestro, 
} 

end
