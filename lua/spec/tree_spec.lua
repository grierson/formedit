-- [nfnl] Compiled from fnl/spec/tree_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.helper")
local tree = require("formedit.tree")
local assert = require("luassert.assert")
local ts = require("nvim-treesitter.ts_utils")
local function _2_()
  local function _3_()
    h.setup({content = " ", cursor = {1, 1}})
    local actual = tree["get-current-form"]()
    return assert.falsy(actual)
  end
  return it("cursor start of form", _3_)
end
describe("No form return nil", _2_)
local function _4_(...)
  local form_type = "list_lit"
  local function _5_()
    local function _6_()
      h.setup({content = "(a)", cursor = {1, 1}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor start of form", _6_)
    local function _7_()
      h.setup({content = "(a)", cursor = {1, 2}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor within form", _7_)
    local function _8_()
      h.setup({content = "(a)", cursor = {1, 3}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    return it("cursor end of form", _8_)
  end
  return _5_
end
describe("List", _4_(...))
local function _9_(...)
  local form_type = "vec_lit"
  local function _10_()
    local function _11_()
      h.setup({content = "[a]", cursor = {1, 1}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor start of form", _11_)
    local function _12_()
      h.setup({content = "[a]", cursor = {1, 2}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor within form", _12_)
    local function _13_()
      h.setup({content = "[a]", cursor = {1, 3}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    return it("cursor end of form", _13_)
  end
  return _10_
end
describe("Vector", _9_(...))
local function _14_(...)
  local form_type = "map_lit"
  local function _15_()
    local function _16_()
      h.setup({content = "{:a 1}", cursor = {1, 1}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor start of form", _16_)
    local function _17_()
      h.setup({content = "{:a 1}", cursor = {1, 2}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor within form", _17_)
    local function _18_()
      h.setup({content = "{:a 1}", cursor = {1, 6}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    return it("cursor end of form", _18_)
  end
  return _15_
end
describe("Map", _14_(...))
local function _19_(...)
  local form_type = "set_lit"
  local function _20_()
    local function _21_()
      h.setup({content = "#{1}", cursor = {1, 1}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor on #", _21_)
    local function _22_()
      h.setup({content = "#{1}", cursor = {1, 2}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor start of form", _22_)
    local function _23_()
      h.setup({content = "#{1}", cursor = {1, 3}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor within form", _23_)
    local function _24_()
      h.setup({content = "#{1}", cursor = {1, 4}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    return it("cursor end of form", _24_)
  end
  return _20_
end
describe("Set", _19_(...))
local function _25_(...)
  local form_type = "anon_fn_lit"
  local function _26_()
    local function _27_()
      h.setup({content = "#(1)", cursor = {1, 1}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor on #", _27_)
    local function _28_()
      h.setup({content = "#(1)", cursor = {1, 2}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor start of form", _28_)
    local function _29_()
      h.setup({content = "#(1)", cursor = {1, 3}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    it("cursor within form", _29_)
    local function _30_()
      h.setup({content = "#(1)", cursor = {1, 4}})
      local actual = tree["get-current-form"]()
      return assert.equals(form_type, actual:type())
    end
    return it("cursor end of form", _30_)
  end
  return _26_
end
return describe("Anonymous function", _25_(...))
