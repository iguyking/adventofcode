$passports = get-content invalidinput 

$passport = @{}

$valid = 0
$empty = 0

function checkpassport($pp) {
    $pp.remove('cid')
    if ($pp.count -eq 7) { 
        foreach ($key in $pp.keys) {
            $value = $pp[$key]
             
            switch ($key) {
                byr { if (($value -lt 1920) -and ($value -gt 2002)) { write-host "Bad byr: $value"; return 0;}  }
                iyr { if (($value -lt 2010) -and ($value -gt 2020)) { write-host "Bad iyr: $value"; return 0;}  }
                eyr { if (($value -lt 2020) -and ($value -gt 2030)) { write-host "Bad eyr: $value"; return 0;}  }
                hgt { if ($value -match 'cm') {} }
                hcl { if (! $value -match '#[0-9|a-f]{6}') { write-host "Bad hcl: $value"; return 0;} }
                ecl { switch ($value) {
                    amb {}
                    blu {}
                    brn {}
                    gry {}
                    grn {}
                    hzl {}
                    oth {}
                    default { write-host "Bad ecl: $value"; return 0; }
                    }}
                pid  { if (! $value -match '\d{9}') { write-host "Bad pid: $value"; return 0; } }
                default { return 0; }
            }


        }
        return 1;
    } else { write-host "Less than 7 fields"; return 0; }
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
#write-host "Empty Lines: $empty"
