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

set file_name fzf-{$tag_version}-linux_amd64.tar.gz
set url https://github.com/junegunn/fzf/releases/download/v{$tag_version}/{$file_name}

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

sudo mv ./fzf /usr/local/bin/fzf

rm -rf $dir
