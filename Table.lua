--[[Help Functions to work with tables]]
--exemplo de mensagem que deve ser enviada para a montagem da tabela
--'[{"job":"teste1"}, {"job":"teste2"}]'
--*************
function UITable(
  colNames,
 collumns)
  local colNames = colNames -- for the collumn names that should be the ID of each collumn
  local totalCollumns = collumns -- a table that has tables with the values of each collunm
  local pointerTable = '[{' --string that will be returned to the function
  local totalValues = #totalCollumns[1]
  --*************
if #colNames == #totalCollumns then
  for i = 1, totalValues, 1 do
    for index, name in ipairs(colNames) do
      pointerTable = pointerTable .."\"".. name .."\":\"".. totalCollumns[index][i]
      if index == #colNames then
        pointerTable = pointerTable .. "\"}"
      else 
        pointerTable = pointerTable .. "\","
      end
    end
    if i == totalValues then
      pointerTable = pointerTable .. "]"
    else
      pointerTable = pointerTable .. ",{"
    end
  end
end
  
  return pointerTable
end
--*************
--*************
