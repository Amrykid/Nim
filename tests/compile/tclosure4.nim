
import json, tables

proc run(json_params: TTable) =
  let json_elems = json_params["files"].elems
  # These fail compilation.
  var files = each(json_elems, proc (x: PJsonNode): string = x.str)
  #var files = json_elems.each do (x: PJsonNode) -> string: x.str
  echo "Hey!"

when isMainModule:
  let text = """{"files": ["a", "b", "c"]}"""
  run(toTable((text.parseJson).fields))
