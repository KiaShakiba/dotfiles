#!/bin/fish

mkdir -p ~/.local/share/fonts/NerdFonts

set dir (mktemp -d)
cd $dir

set file_name UbuntuMono.tar.xz
set url https://github.com/ryanoasis/nerd-fonts/releases/latest/download/{$file_name}

echo "[info]: downloading $file_name"
curl -LOfs $url
set curl_status $status

if test $curl_status -ne 0
    echo "[error]: could not download file"
end

echo "[info]: extracting file"
tar -xf $file_name

echo "[info]: installing fonts"
mv *.ttf ~/.local/share/fonts/NerdFonts/

rm -rf $dir
