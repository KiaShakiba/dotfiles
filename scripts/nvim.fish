#!/bin/fish

set tag_version $argv[1]

if test -z "$tag_version"
    echo "[error]: no version provided"
    return 1
end

if not string match -rq '^\d+\.\d+\.\d+$' -- $tag_version
    echo "[error]: version must follow format 0.0.0"
    return 1
end

set file_name nvim-linux-x86_64.appimage
set url https://github.com/neovim/neovim/releases/download/v{$tag_version}/{$file_name}

set dir (mktemp -d)
cd $dir

echo "[info]: downloading $file_name"

curl -LOfs $url
set curl_status $status

if test $curl_status -ne 0
    echo "[error]: could not download file"
    rm -rf $dir
    return 1
end

sudo mv "$file_name" /usr/local/bin/nvim
sudo chmod u+x /usr/local/bin/nvim

rm -rf $dir
