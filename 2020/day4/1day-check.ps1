$passports = get-content invalidinput 

$passport = @{}

$valid = 0
$empty = 0

function checkpassport($pp) {
    $pp.remove('cid')
    if ($pp.count -eq 7) { return 1; } 
    else { return 0; }
}

foreach($line in $passports) {
    if ($line -eq "") { 
        $empty += 1
       # write-host "Empty Line" 
    
        $valid += checkpassport($passport)     

        $passport = @{}
    } else {
        $mash = $line.split(" ")
        foreach($passdata in $mash) {
            $k,$v = $passdata.split(":")
            $passport.Add($k,$v)
        }
    }
}
        $valid += checkpassport($passport)     

        $passport = @{}

#$passports | select-string '

write-host "Valid passports:   $valid"
write-host "Empty Lines: $empty"
