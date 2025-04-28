@echo off
setlocal enabledelayedexpansion

cd baritone

echo Applying patches...

for %%F in (..\patches\*.patch) do (
    echo Applying %%F
    git apply --ignore-space-change --ignore-whitespace --3way "%%F"
    if errorlevel 1 (
        echo Failed to apply %%F
        exit /b 1
    )
)

echo All patches applied successfully!
exit /b 0
