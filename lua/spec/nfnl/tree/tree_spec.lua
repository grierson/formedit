-- [nfnl] Compiled from fnl/spec/nfnl/tree/tree_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.nfnl.helper")
local tree = require("formedit.tree")
local assert = require("luassert.assert")
local ts = require("nvim-treesitter.ts_utils")
local function _2_()
  local function _3_()
    h.setup({content = "(a)", cursor = {1, 2}})
    local node = ts.get_node_at_cursor()
    local actual = tree["form?"](node)
    return assert.equals("list_lit", actual:type())
  end
  return it("cursor on start of form", _3_)
end
return describe("node under cursor", _2_)
