-- headings of level 1 and 2 in capitals, as in the OAJPE template
function Header(el)
  if el.level <= 2 then
    el.content = el.content:walk({
      Str = function(s) return pandoc.Str(pandoc.text.upper(s.text)) end
    })
  end
  return el
end
