-- [nfnl] Compiled from fnl/formedit/init.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local insertion = require("formedit.insertion")
local select = require("formedit.select")
local wrap = require("formedit.wrap")
local raise = require("formedit.raise")
local barf = require("formedit.barf")
local slurp = require("formedit.slurp")
return {find = find, insertion = insertion, select = select, wrap = wrap, raise = raise, barf = barf, slurp = slurp}
