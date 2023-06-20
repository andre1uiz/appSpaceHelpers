--[[Help Functions to work with tables]]
--exemplo de mensagem que deve ser enviada para a montagem da tabela
--'[{"job":"teste1"}, {"job":"teste2"}]'
--*************
function UITable(
  colNames,
  refTable,
  _refTable2,
  _refTable3,
  _refTable4,
  _refTable5)
  local colNames = colNames or {} -- can be a string or a table with strings
  local refTable = refTable --values for column1
  local refTable2 = _refTable2 or nil --values for column2
  local refTable3 = _refTable3 or nil --values for column3
  local refTable4 = _refTable4 or nil --values for column4
  local refTable5 = _refTable5 or nil --values for column5
  local totalTables = {}
  local pointerTable = '[{'
  --*************
  local ColType = type(colNames)
  if ColType == 'string' then
    for i, element in ipairs(refTable) do
      pointerTable = pointerTable .. '"' .. colNames .. '":"' .. element .. '"'
      if i == #refTable then
        pointerTable = pointerTable .. '}]'
      else
        pointerTable = pointerTable .. '}, {'
      end
    end
  else
    if refTable3 == nil then
      totalTables = {refTable, refTable2}
    elseif refTable4 == nil then
      totalTables = {refTable, refTable2, refTable3}
    elseif refTable5 == nil then
      totalTables = {refTable, refTable2, refTable3, refTable4}
    else
      totalTables = {refTable, refTable2, refTable3, refTable4, refTable5}
    end

    for i = 1, #refTable do
      for names, colname in ipairs(colNames) do
        pointerTable =
          pointerTable ..
          '"' .. colname .. '":"' .. totalTables[names][i] .. '"'
        if #colNames > names then
          pointerTable = pointerTable .. ','
        end
      end
      if i == #refTable then
        pointerTable = pointerTable .. '}]'
      else
        pointerTable = pointerTable .. '}, {'
      end
    end
  end
  return pointerTable
end
--*************
--*************
