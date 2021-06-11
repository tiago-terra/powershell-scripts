# Sets an environment variable permanently within windows
function Set-EnvironmentVariable (
  [Parameter(Position=0)]
  [string]
  $key,

  [Parameter(Position=1)]
  [string]
  $value, 

  [Parameter(Position=2)]
  $hide_value=$false
  ) 
{
  if (!(Test-Path ENV:\$key)){
    try {
      
      Invoke-Expression -Command "setx $key '$value'" 

      if ($hide_value) {
        Write-Host "Environment Variable $key set to private value. Please refresh session to confirm value."
      }
      else {
        Write-Host "Environment Variable $key set to value $value. Please refresh session to confirm value."
      }
    }
    catch {
      Write-Error "Failed to set Environment Variable $key"
    }
  }
}