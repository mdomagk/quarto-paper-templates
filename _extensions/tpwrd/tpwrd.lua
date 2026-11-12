-- first word of the first paragraph as drop cap, as in the TPWRD template:
-- "In the past" becomes \IEEEPARstart{I}{n} the past
function Pandoc(doc)
  local after_header = false
  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" then
      after_header = true
    elseif after_header and block.t == "Para" then
      local first = block.content[1]
      if first and first.t == "Str" and pandoc.text.len(first.text) > 1 then
        block.content[1] = pandoc.RawInline("latex",
          "\\IEEEPARstart{" .. pandoc.text.sub(first.text, 1, 1) .. "}{" ..
          pandoc.text.sub(first.text, 2) .. "}")
      end
      return doc
    end
  end
  return doc
end
