echo Download windows 7 AIK
echo http://www.microsoft.com/en-us/download/details.aspx?id=5753

echo Daemon Tools Lite Free Edition can be used to mount the iso

timeout 5

echo After Windows AIK software is installed on your system go to Windows Start -> All Programs -> Microsoft Windows AIK -> right click on Deployment Tools Command Prompt and select Run as Administrator and a new Windows Shell console should open on your screen.

copype amd64 C:\winPE_amd64
copy "C:\Program Files\Windows AIK\Tools\PETools\amd64\winpe.wim" C:\winpe_amd64\ISO\Sources\Boot.wim
copy "C:\Program Files\Windows AIK\Tools\amd64\Imagex.exe" C:\winpe_amd64\ISO\
oscdimg -n -bC:\winpe_amd64\etfsboot.com C:\winpe_amd64\ISO C:\winpe_amd64\winpe_amd64.iso

echo After WinPE x64 ISO file is completely transferred to "10.10.10.10:/home/$USER/Downloads go back to PXE Server console and move this image from root’s /windows directory to TFTP windows directory path to complete the entire installation process.
