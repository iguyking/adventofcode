class Passport {
    Passport([string]$input)
    {
        [pscustomobject]$obj = $input -replace ':', '=' | ConvertFrom-StringData
        $this.byr = $obj.byr
        $this.iyr = $obj.iyr
        $this.eyr = $obj.eyr
        $this.hcl = $obj.hcl
        $this.ecl = $obj.ecl
        $this.pid = $obj.pid
        $s = $obj.hgt -split "(\d*)(in|cm)"
        switch ($s[2]) {
            "in" {$this.hgt = ([int]([int]$s[1] * 2.54))}
            "cm" {$this.hgt = $s[1]}
            Default {$this.hgt = 0}
        }
    }
    [ValidateRange(1920,2002)] [int] $byr
    [ValidateRange(2010,2020)] [int] $iyr
    [ValidateRange(2020,2030)] [int] $eyr
    [ValidateRange(150, 193)] [int] $hgt
    [ValidatePattern("#([a-f]|[0-9]){6}")] [string] $hcl
    [ValidateSet("amb","blu","brn","gry","grn","hzl","oth")] [string] $ecl
    [validateLength (9,9)] [string] $pid
}

[Passport[]]$passports = ((Get-Content '.\input' -Raw) -replace " ","`n") -split "\n\n" | % {try{[Passport]::new($_)}catch{}}

# Cheese allowed?
Write-Host "Part 1:" (((Get-Content '.\input' -Raw) -split "\n\n") -replace "cid:", "" | % {($_.ToCharArray() | ? {$_ -eq ':'}).count} | ? {$_ -gt 6}).count
Write-Host "Part 2:" $passports.Count
