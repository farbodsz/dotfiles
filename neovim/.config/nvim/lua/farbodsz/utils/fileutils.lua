--------------------------------------------------------------------------------
-- Utility functions to read and parse files
--------------------------------------------------------------------------------

local M = {}

--- @return boolean
function M.file_exists(file)
  local f = io.open(file, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

--- @param path string
--- @return table
function M.read_lines(path)
  if not M.file_exists(path) then
    return {}
  end
  local lines = {}
  for line in io.lines(path) do
    lines[#lines + 1] = line
  end
  return lines
end

--- @param input string
--- @param sep string
--- @return table
local function split(input, sep)
  if sep == nil then
    sep = "%s"
  end
  local parts = {}
  for str in string.gmatch(input, "([^" .. sep .. "]+)") do
    table.insert(parts, str)
  end
  return parts
end

--- Reads and parses a .env file, returning a key-value table
--- @param path string
--- @return table
function M.read_shell_env(path)
  local lines = M.read_lines(path)
  local env = {}

  for _, line in ipairs(lines) do
    local parts = split(line, "=")
    local name = parts[1]
    local val = parts[2] or ""
    env[name] = val
  end
  return env
end

return M
