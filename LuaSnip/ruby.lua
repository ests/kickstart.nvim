-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
-- local sn = ls.snippet_node
local i = ls.insert_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta
-- local extras = require 'luasnip.extras'
-- local r = extras.rep
--
-- local function is_spec_file()
--   local current_file = vim.api.nvim_buf_get_name(0)
--   return current_file:match '_spec%.rb$' ~= nil
-- end
--
-- local rspec_file = require('luasnip.extras.conditions').make_condition(is_spec_file)
--
return {
  s({ trig = 'fsl', name = '# frozen string literal' }, t { '# frozen_string_literal: true' }),

  s({ trig = 'ib', name = 'inline block' }, fmta('{ |<>| <> }', { i(1), i(2) })),

  s(
    { trig = 'do', name = 'do block' },
    fmta(
      [[
      do
        <>
      end
      ]],
      { i(0) }
      -- { c(1, { sn(nil, { t ' |', i(1, 'el'), t '|' }), t '' }), i(2) }
    )
  ),

  --   -- Enumerables -------------------------------------------------------------------------------
  --
  --   -- s({ trig = ".i(%w+)", wordTrig = false, regTrig = true, name = "[]method_name(&:sku)" },
  --   --   {
  --   --     d(1, function(_, parent)
  --   --       return sn(nil, {
  --   --         t ".",
  --   --         t(tostring(parent.captures[1])),
  --   --         t "(&:",
  --   --         i(1, "sku"),
  --   --         t ")"
  --   --       })
  --   --     end, {}),
  --   --   }),
  --
  --   s({
  --     trig = '(%w+).bl',
  --     regTrig = true,
  --     wordTrig = false,
  --     name = 'method with block',
  --   }, {
  --     f(function(_, snip)
  --       return '' .. snip.captures[1] .. ''
  --     end, {}),
  --     c(1, {
  --       sn(nil, { t '(&:', i(1, 'sku'), t ')' }),
  --       sn(nil, { t ' { |', i(1, 'el'), t '| ', i(2), t ' }' }),
  --       sn(nil, { t ' do |', i(1, 'el'), t { '| ', '' }, t '  ', i(2), t { '', 'end' } }),
  --     }),
  --   }),
  --
  --   s({ trig = 'ma', name = 'map ...' }, {
  --     t 'map',
  --     c(1, {
  --       sn(nil, { t '(&:', i(1, 'sku'), t ')' }),
  --       sn(nil, { t ' { |', i(1, 'el'), t '| ', i(2), t ' }' }),
  --       sn(nil, { t ' do |', i(1, 'el'), t { '| ', '' }, t '  ', i(2), t { '', 'end' } }),
  --     }),
  --   }),
  --
  --   s({ trig = 'ea', name = 'each ...' }, {
  --     t 'each',
  --     c(1, {
  --       sn(nil, { t '(&:', i(1, 'sku'), t ')' }),
  --       sn(nil, { t ' { |', i(1, 'el'), t '| ', i(2), t ' }' }),
  --       sn(nil, { t ' do |', i(1, 'el'), t { '| ', '' }, t '  ', i(2), t { '', 'end' } }),
  --     }),
  --   }),
  --
  --   s({ trig = 'se', name = 'select ...' }, {
  --     t 'select',
  --     c(1, {
  --       sn(nil, { t '(&:', i(1, 'sku'), t ')' }),
  --       sn(nil, { t ' { |', i(1, 'el'), t '| ', i(2), t ' }' }),
  --       sn(nil, { t ' do |', i(1, 'el'), t { '| ', '' }, t '  ', i(2), t { '', 'end' } }),
  --     }),
  --   }),
  --
  --   s({ trig = 'fi', name = 'find ...' }, {
  --     t 'find',
  --     c(1, {
  --       sn(nil, { t '(&:', i(1, 'sku'), t ')' }),
  --       sn(nil, { t ' { |', i(1, 'el'), t '| ', i(2), t ' }' }),
  --       sn(nil, { t ' do |', i(1, 'el'), t { '| ', '' }, t '  ', i(2), t { '', 'end' } }),
  --     }),
  --   }),
  --
  --   -- RSpec -------------------------------------------------------------------------------------
  --
  --   s({ trig = 'ex', wordTrig = false, condition = rspec_file, show_condition = rspec_file }, {
  --     t 'expect(',
  --     i(1),
  --     t ').to eq(',
  --     i(2),
  --     t ')',
  --   }),
  --
  --   -- Other -------------------------------------------------------------------------------------
}
