--[[ 
        _    _       _    _____     _____ ____    ____
       / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
      / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | |    Đєⱴ 💀: @devmaestr0
     / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
    /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @maestr0bot
                   Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
—]]
local function check_member_superrem2(cb_extra, success, result)
local receiver = cb_extra.receiver
local data = cb_extra.data
local msg = cb_extra.msg
for k,v in pairs(result) do
local member_id = v.id
if member_id ~= our_id then
-- Group configuration removal
data[tostring(msg.to.id)] = nil
save_data(_config.moderation.data, data)
local groups = 'groups'
if not data[tostring(groups)] then
data[tostring(groups)] = nil
save_data(_config.moderation.data, data)
end
data[tostring(groups)][tostring(msg.to.id)] = nil
save_data(_config.moderation.data, data)
chat_del_user(get_receiver(msg), 'user#id'..235431064, ok_cb, false)
leave_channel(get_receiver(msg), ok_cb, false)
end
end
end

local function superrem2(msg)
local data = load_data(_config.moderation.data)
local receiver = get_receiver(msg)
channel_get_users(receiver, check_member_superrem2,{receiver = receiver, data = data, msg = msg})
end

local function pre_process(msg)
local timetoexpire = 'unknown'
local expiretime = redis:hget ('expiretime', get_receiver(msg))
local now = tonumber(os.time())
if expiretime then 
timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
if tonumber("0") > tonumber(timetoexpire) then
if get_receiver(msg) then
redis:del('expiretime', get_receiver(msg))
rem_mutes(msg.to.id)
superrem2(msg)
return send_large_msg(get_receiver(msg), 'تم✔️ أنتهاء الصلاحيه في المجموعة🏌 ')
else
return
end
end
if tonumber(timetoexpire) == 0 then
if redis:hget('expires0',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '.')
redis:hset('expires0',msg.to.id,'5')
end
if tonumber(timetoexpire) == 1 then
if redis:hget('expires1',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '☠ تم انتهاء ايام التفعيل في المجموعة \n اطلب من المطور تجديد الوقت🏌')
redis:hset('expires1',msg.to.id,'5')
end
if tonumber(timetoexpire) == 2 then
if redis:hget('expires2',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '☠يومين وتنتهي صلاحية تفعيل البوت في المجموعة\n اطلب من المطور تجديد الوقت🏌')
redis:hset('expires2',msg.to.id,'5')
end
if tonumber(timetoexpire) == 3 then
if redis:hget('expires3',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '☠ 3  ايام وتنتهي صلاحية التفعيل في المجموعة \n اطلب من المطور تجديد الوقت🏌')
redis:hset('expires3',msg.to.id,'5')
end
if tonumber(timetoexpire) == 4 then
if redis:hget('expires4',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '☠ اربعة ايام وتنتهي صلاحية التفعيل في المجموعة \n اطلب من المطور تجديد الوقت🏌')
redis:hset('expires4',msg.to.id,'5')
end
if tonumber(timetoexpire) == 5 then
if redis:hget('expires5',msg.to.id) then return msg end
send_large_msg(get_receiver(msg), '☠ خمسة ايام وتنتهي صلاحية التفعيل في المجموعة \n اطلب من المطور تجديد الوقت🏌')
redis:hset('expires5',msg.to.id,'5')
end
end
return msg
end
function run(msg, matches)
if matches[1]:lower() == 'وضع وقت'  then
if not is_sudo(msg) then return end
local time = os.time()
local buytime = tonumber(os.time())
local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
redis:hset('expiretime',get_receiver(msg),timeexpire)
return " تم ✔️ وضع مدة اانتهاء صلاحية التفعيل في المجموعة الى  🏌("..matches[2].. ") "
end
if matches[1]:lower() == 'تجديد'  then
local expiretime = redis:hget ('expiretime', get_receiver(msg))
if not expiretime then return ' لم يتم ❌ تجديد التاريخ بنجاح' else
local now = tonumber(os.time())
return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. "تم ✔️تجديد الصلاحية الى🏌"
end
end

end
return {
patterns = {
"^(وضع وقت) (.*)$",
"^(تجديد)$",
"^[#!/](وضع وقت) (.*)$",
"^[#!/](تجديد)$",
},
run = run,
pre_process = pre_process
}

