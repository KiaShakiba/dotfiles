#!/bin/fish

set tag_version $argv[1]

set dir (mktemp -d)
cd $dir

echo "[info]: downloading latest rust-analyzer"

curl -Lfs https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | zcat | tee ./rust-analyzer >/dev/null
set curl_status $status

if test $curl_status -ne 0
    echo "[error]: could not download file"
    rm -rf $dir
    return 1
end

sudo mv ./rust-analyzer ~/.local/bin/rust-analyzer
sudo chmod +x ~/.local/bin/rust-analyzer

rm -rf $dir
