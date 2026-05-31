#!/bin/fish

set file_name zellij-x86_64-unknown-linux-musl.tar.gz
set url https://github.com/zellij-org/zellij/releases/latest/download/{$file_name}

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

echo "[info]: extracting $file_name"
tar -xzf "$file_name"
set tar_status $status

if test $tar_status -ne 0
    echo "[error]: could not extract file"
    rm -rf $dir
    return 1
end

sudo mv ./zellij /usr/local/bin/zellij

rm -rf $dir
