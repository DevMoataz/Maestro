--[[ 
 $f1       _    _       _    _____     _____ ____    ____
 $f1      / \  / \     / \  | ____|___|_   _| /_\ \ / __ \     Đєⱴ 💀: @MaEsTrO_0
 $f1     / / \/ / \   / _ \ |  _| / __| | | | |_\_/| |  | | Đєⱴ 💀: @devmaestr0
 $f1    / / \ \/ \ \ / ___ \| |___\__ \ | | | | \ \| |__| |    Đєⱴ ฿๏ͳ💀: @iqMaestroBot
 $f1   /_/   \/   \_/_/   \_|_____|___/ |_| |_|  \_\\____/     Đєⱴ ฿๏ͳ💀: @l_M_l_1bot
 $f1                  Đєⱴ Ϲḫ₳ͷͷєℓ💀: @DevMaestro
--]]
local function run(msg, matches)
  if matches[1] == "جلب ملف"then
    local file = matches[2]
    if is_sudo(msg) then --sudo only !
      local receiver = get_receiver(msg)
      send_document(receiver, "./plugins/"..file..".lua", ok_cb, false)
      else 
        return nil
    end
  end
end

return {
  patterns = {
  "^(جلب ملف) (.*)$",
  "^[#!/](جلب ملف) (.*)$"
  },
  run = run
}

