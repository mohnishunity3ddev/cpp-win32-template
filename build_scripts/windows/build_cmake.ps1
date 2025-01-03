# import all variables from _variables.ps1
. $PSScriptRoot/_variables.ps1

# Build Shaders
# b_shader

$arg = $args[0]
$arg2 = $args[1]
if([bool]$arg -and (($arg -eq "ms") -or  ($arg -eq "msvc") )) {
    if([bool]$arg2 -and (($arg2 -eq "start") -or ($arg2 -eq "s") -or ($arg2 -eq "1") )) {
        Invoke-Expression "& msvc b start"
    } else {
        Invoke-Expression "& msvc b"
    }
    return
}

$is_release = [bool]0
if(($arg -eq "rel") -or ($arg  -eq "release") -or ($arg -eq "r")) {
    $is_release = [bool]1
}

$InsideBin = 0
if($BIN_DIR_PATH -eq $cwd) {
    $InsideBin = 1
} else {
    # build using cmake
    Set-Location $BIN_DIR_PATH
}

if(!$is_release) {
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DUSE_DEBUG=ON -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -S $PROJECT_ROOT_DIR_PATH -B . -GNinja
} else {
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DUSE_DEBUG=OFF -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -S $PROJECT_ROOT_DIR_PATH -B . -GNinja
}

# Build cmake files with Ninja
ninja

# only go to previous PWD if the previous PWD was not the bin directory
if($InsideBin -eq 0) {
    Set-Location -
}


