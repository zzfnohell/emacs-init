
s = lib.LibOptions()
s:Print();


local opt = lib.LibOptions();
 
local items = opt:GetInstrumentList();

function list_iter (items)
    local i = 0
    local n = items:size()
    return function ()
        local j  = i
        i = i + 1
             if i <= n then return items[j] end
           end
  end

for i  in list_iter(items) do 
    print(i)
end

print("Direct Access")
local ditems = opt.instrument_list;

for i  in list_iter(ditems) do 
    print(i)
end
