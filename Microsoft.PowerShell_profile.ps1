### Aliases 
#　vimの実行ファイルパスを記載
New-Alias vi C:\tools\vim74-kaoriya-win64\vim.exe
New-Alias vim C:\tools\vim74-kaoriya-win64\vim.exe
New-Alias grep Select-String

### Functions
function view() {C:\tools\vim74-kaoriya-win64\vim.exe -R $args}

function  tail([String] $file, [int] $n=10, [switch] $f){
    if($f) {
        Get-Content -Wait -Tail $n $file
    } else {
        Get-Content -Tail $n $file
    }
}

function find([string] $path, [string] $name) {
    if($name) {
        ls $path -r | ? {$_.Name -match $name}
    } else {
        ls $path -r
    }
}

function staticip([string] $add, [string] $mask, [string] $gw) {
  netsh interface ipv4 set address name="ローカル エリア接続" static $add $mask $pw
  ipconfig /all
}

function dhcp() {
  netsh interface ipv4 set address name="ローカル エリア接続" dhcp
  netsh interface ipv4 set dns "ローカル エリア接続" dhcp
  ipconfig /all
}

