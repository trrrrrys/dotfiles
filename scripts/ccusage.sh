cached-cmd -k ccusage-monthly -t 3600  --  deno run -A npm:ccusage monthly -j | jq ".monthly[] | select( .month == \"`date +%Y-%m`\" ) | .totalCost | .*100 | floor | ./100"
