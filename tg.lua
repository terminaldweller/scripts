started = 0
our_id = 0
os = require("os")
now = os.time()
print("now is "..os.date("%m/%d/%Y %I:%M %p"))

function on_binlog_replay_end()
  --started = 1
  local a = get_dialog_list(ok_cb, result)
  -- quits telegram-cli
  -- you would probably wasnt this if you dont want telegram up all the time and
  -- have set up a cronjob to handle updating your unread messages
  -- safe_quit()
end

function on_get_difference_end()
end

function on_our_id(our_id)
  --print("our id is "..our_id)
end

function on_user_update(user,what_changed)
  --[[
  if user.print_name == "Mahsa" then
    print("Mahsa update:\n")
    print("user:")
    for k,v in pairs(user) do
      print(k,v)
    end
    print(user.print_name)
    print("what changed:")
    for k,v in pairs(what_changed) do
      print(k,v)
    end
    print(what_changed["flags"])
  end
  ]]--
end

function on_chat_update(user,what_changed)
  --[[
  print(type(user))
  print(type(what_changed))
  for k,v in pairs(user) do
    print(k,v)
  end
  for k,v in pairs(what_changed) do
    print(k,v)
  end
  ]]--
end

function on_secret_chat_update(user,what_changed)
end

-- this callback is handling the call to dialog_list which is called in on_binlog_replay_end
-- essentially here is where we check how many unread messages we have since on_msg_recieve
-- only handles the messages we newly receive, not older unread ones.
function ok_cb(extra, success, result)
  for k, v in pairs(result) do
    if v["peer"]["username"] == "mahsafatehii" then
      if v["unread"] ~= 0. then
        local socket = require("socket")
        local host, port = "localhost", 11111
        local tcp = assert(socket.tcp())
        tcp:connect(host, port)
        tcp:send("Mahsa".."\n")
        tcp:close()
      end
    end
  end
end

-- when we recieve a new message
function on_msg_receive(msg)
  --for k,v in pairs(msg) do
    --print(k, v)
  --end
  if (msg.from.print_name ~= "Mahsa") then
    return
  end
  local socket = require("socket")
  local host, port = "localhost", 11111
  local tcp = assert(socket.tcp())
  tcp:connect(host, port)
  --print(msg.from.print_name)
  tcp:send("Mahsa".."\n")
  --[[
  if (msg.text == 'hey') then
    if (msg.to.id == our_id) then
      send_msg (msg.from.print_name, 'you', ok_cb, false)
    else
      send_msg (msg.to.print_name, 'you', ok_cb, false)
    end
    return
  end
  ]]--
  tcp:close()
end

function send_msg_cb(cb_extra, success, result)
end

function postpone_cb(cb_extra, success, result)
end

function history_cb(msg_list, peer, success, msgs)
end
