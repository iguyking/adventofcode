$trees = get-content input

$slopes = @'
Right,Down
1,1
3,1
5,1
7,1
1,2
'@ | convertfrom-csv


#$slope_right = 3 
#$slope_down = 1


$height = $trees.length

$hittree = [System.Collections.Generic.List[int]]::new()

foreach($slope in $slopes) {
    $hits = 0
    $right = [int]$slope.right # Starts at point 1,1
    $down = [int]$slope.down # Starts at point 1,1

    do {
        $line = $trees[$down]
    
        if ($right -ge $line.length) { $right = $right - $line.length }
        $spot = $line[$right]
    
   #     write-host "$right $down $spot"
    
        if ($spot -eq "#") {  $hits += 1 }
    
        $down += $slope.down
        $right += $slope.right
    
    } while ($down -lt $height) 
    write-host "Hit $hits"
    $hittree.Add($hits)
}

$total = 1
foreach($hit in $hittree) { 
#    write-host "Here" $total " " $hit
    $total = $hit * $total 
    }
write-host "Total: $total"

