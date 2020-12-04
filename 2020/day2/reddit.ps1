function Get-PuzzleInput
{
    param(
    
    # Parameter for the path to the PuzzleInput file.
    [parameter(Mandatory)]
    $Path
    
    )

    $PuzzleInputImport = Get-Content -Path $Path

    # Parse data that was imported and separate them into three fields to work with.
    $PuzzleInput = foreach ($input in $PuzzleInputImport)
    {        
        [pscustomobject]@{           
            RuleLow = (($input -split ' ')[0] -split '-' )[0]
            RuleHigh = (($input -split ' ')[0] -split '-' )[1]
            Letter = (($input -split ' ')[1])[0]
            Password = ($input -split ' ')[2]       
        }  
    }
    
    $PuzzleInput
}

function Get-PuzzleSolution
{
    param(
    
    # Parameter for the path to the PuzzleInput file.
    [parameter(Mandatory)]
    $Path
   
    )

    $PuzzleInput = Get-PuzzleInput -Path $Path

    # Foreach value in $PuzzleInput. Count how many $input.letter there is in $input.password. Assign the count to $GoodPasswords. 
    foreach ($input in $PuzzleInput)
    {
        [int]$charnumber = 0
        [string]$PasswordString = $input.Password
        $PasswordCharArray = $PasswordString.ToCharArray()
        foreach($char in $PasswordCharArray)
        {
            if($char -eq $input.letter)
            {
                $charnumber += 1
            }
        }
        if ($charnumber -ge $input.RuleLow -and $charnumber -le $input.RuleHigh)
        {
            $GoodPasswords += 1
        }       
    }

    Write-Host "I found $GoodPasswords good passwords!"
}
