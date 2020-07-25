## Generate Password Function
Function New-Password() {
    <# 
 .SYNOPSIS 
     Password Generator 
 
 .DESCRIPTION 
     The New-Password cmdlet allow you to generate random passwords. 
   
 .PARAMETER NumberofPasswords 
     Specifies Number of passwored to generate. Default is 1 random password. 

 .PARAMETER AsSecureString
     Return passwords as secure strings.
 
 .PARAMETER Length 
     Specifies the passwored length. Defualt is 12 chars.
 
 .PARAMETER SpecialCharacters
     Specifies the number of Special Characters in the password. Defualt is 3 chars.
  
 .EXAMPLE 
        New-Password 
        S0XOxe8SvaYW

  .EXAMPLE
        New-Password -NumberofPasswords 10
        VMLMu2DVLg6a
        H0faw#W6N@@H
        WZ0FV7U7jbVB
        p6vDelWGmefS
        HR9Ewjg#WQt3
        qrHYJdRTWaex
        q6meEJztl80R
        oNDals6@DrI7
        kKJVCbvAhFXm
        f4@8xTsUYpAI

    .EXAMPLE
            New-Password -Length 20
            e00yosTnRvthCHiJYKJs

    .EXAMPLE
            New-Password -NumberofPasswords 5 -Length 6
            ZSQHsL
            RqU5cY
            F7STnb
            DD34@O
            9drhe4
    
    .EXAMPLE
            New-Password -NumberofPasswords 1 -Length 10 -AsSecureString
            WARNING: Converting the Password 3@jedeVcjoBf to secure string, this is the last time you will see it.
            System.Security.SecureString
    
    .EXAMPLE
            New-Password -NumberofPasswords 5 -Length 10 -SpecialCharacters 3
            #zx4?1R@p1
            >xv=2RaAdG
            <u<4TDJAzL


 .NOTES 
  Author: Saggie Haim 
  Contact@saggiehaim.net
 #>
    [cmdletbinding()]
    param (
        [parameter(Position = 0,
            Mandatory = $false)]
        [string]$NumberofPasswords = 1,

        [parameter(Position = 1,
            Mandatory = $false)]
        [string]$Length = 12,

        [Parameter(Position = 2,
            Mandatory = $false)]
        [switch]$AsSecureString = $false,

        [parameter(Position = 3,
            Mandatory = $false)]
        [string]$SpecialCharacters = 3
    )
    $passwords = @()
    $inputRange = 48..122
    $SpecialCharactersRange = 33, 35, 60, 61, 62, 63, 64
    $exclude = 91..96
    $exclude += 58..64
    $randomRange = $inputRange | Where-Object { $exclude -notcontains $_ }
    For ($j = 0; $j -lt $NumberofPasswords; $j++) {
        $pass = $null
        For ($i = 0; $i -lt ($Length - $SpecialCharacters); $i++) {
            $rnd = (Get-Random -InputObject $randomRange) 
            $char = [char]$rnd
            $pass += $char
        }
        for ($k = 0; $k -lt $SpecialCharacters; $k++) {
            $rnd = (Get-Random -InputObject $SpecialCharactersRange) 
            $char = [char]$rnd
            $pass += $char
        }
        $pass = RandomisePassword $pass
        $passwords += $pass
        
    }
    if ($AsSecureString -eq $true) {
        $passwords = $passwords | ForEach-Object { Write-Warning "Converting the Password $_ to secure string, this is the last time you will see it."; ConvertTo-SecureString -String $_ -AsPlainText -Force }
        return $passwords
    }
    Return $passwords
}

function RandomisePassword {
    [cmdletbinding()]
    param (
        [parameter(Position = 0,
            Mandatory = $true)]
        [string]$Password
    ) 
    $i = 0
    while ($i -ne 3) {
        $CharArry = $Password.ToCharArray()
        $NewPass = $CharArry | Get-Random -Count $CharArry.length
        $Password = -join $NewPass
        $i++
    }
    return $Password
}