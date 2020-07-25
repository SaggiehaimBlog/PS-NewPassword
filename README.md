# New Password Module Version 2.0.0.

Generate password for any automation process or any other needs.
you can download it from the [powershell gallery](https://www.powershellgallery.com/packages/NewPassword/2.0.0)
All feedback welcomed!

contact me at contact@saggiehaim.net

[https://www.saggiehaim.net](https://www.saggiehaim.net/)

## DESCRIPTION

The New-Password cmdlet allow you to generate random passwords.

### PARAMETER NumberofPasswords

    Specifies Number of passwored to generate. Default is 1 random password.

### PARAMETER AsSecureString

     Return passwords as secure strings.

### PARAMETER Length

     Specifies the passwored length. Defualt is 12 chars.

### PARAMETER SpecialCharacters

     Specifies the number of Special Characters in the password. Defualt is 3 chars.
  
## EXAMPLES

### Generate Random Password

```PowerShell
New-Password
S0XOxe8SvaYW
```

### Generate 10 Random Password

```PowerShell
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
```

### Generate 1 Passowrd with 20 chars length

```PowerShell
New-Password -Length 20
e00yosTnRvthCHiJYKJs
```

### Generate 5 Passwords that are 6 chars length

```PowerShell
New-Password -NumberofPasswords 5 -Length 6
ZSQHsL
RqU5cY
F7STnb
DD34@O
9drhe4
```

### Generate password as a secure string (good for automation scripts)

```PowerShell
New-Password -NumberofPasswords 1 -Leng10 -AsSecureString
WARNING: Converting the Passwo3@jedeVcjoBf to secure string, this is tlast time you will see it.
System.Security.SecureString
```

### Generate password and specify number of the special characters in the password

```PowerShell
New-Password -NumberofPasswords 5 -Length 10 -SpecialCharacters 3
#zx4?1R@p1
>xv=2RaAdG
<u<4TDJAzL
```
