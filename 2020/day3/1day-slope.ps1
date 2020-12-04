$trees = get-content input


$slope_right = 3 
$slope_down = 1

$right = $slope_right # Starts at point 1,1
$down = $slope_down # Starts at point 1,1

$height = $trees.length


do {
    $line = $trees[$down]

    if ($right -ge $line.length) { $right = $right - $line.length }
    $spot = $line[$right]

    write-host "$right $down $spot"

    if ($spot -eq "#") {  $hittree += 1 }

    $down += $slope_down
    $right += $slope_right

} while ($down -lt $height) 

write-host "Hit $hittree"
