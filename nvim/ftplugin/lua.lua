local cmp = require('cmp')
local sources = cmp.get_config().sources
local lua_sources = {}
for i = 1, #sources do
  if sources[i].name ~= 'ultisnips' then
    table.insert(lua_sources, sources[i])
  end
end
cmp.setup.buffer({ sources = lua_sources })
