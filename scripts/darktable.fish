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

set file_name Darktable-{$tag_version}-x86_64.AppImage
set url https://github.com/darktable-org/darktable/releases/download/release-{$tag_version}/{$file_name}

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

sudo mkdir -p /opt/darktable

set logo_file_name darktable.png
set desktop_file_name org.darktable.darktable.desktop.in

set logo_url https://raw.githubusercontent.com/darktable-org/darktable/refs/heads/master/data/pixmaps/256x256/{$logo_file_name}
set desktop_url https://raw.githubusercontent.com/darktable-org/darktable/refs/heads/master/data/{$desktop_file_name}

echo "[info]: downloading logo"

curl -LOfs $logo_url
set curl_status $status

if test $curl_status -ne 0
    echo "[error]: could not download logo"
    rm -rf $dir
    return 1
end

echo "[info]: downloading desktop file"

curl -LOfs $desktop_url
set curl_status $status

if test $curl_status -ne 0
    echo "[error]: could not download desktop file"
    rm -rf $dir
    return 1
end

sed -i 's/^Exec=.*\s/Exec=\/opt\/darktable\/darktable /' "$desktop_file_name"
sed -i 's/^TryExec=.*/TryExec=\/opt\/darktable\/darktable/' "$desktop_file_name"
sed -i 's/^Icon=.*/Icon=\/opt\/darktable\/darktable.png/' "$desktop_file_name"

sudo mv "$file_name" /opt/darktable/darktable
sudo chmod u+x /opt/darktable/darktable

sudo mv "$logo_file_name" /opt/darktable/darktable.png
sudo mv "$desktop_file_name" ~/.local/share/applications/darktable.desktop

rm -rf $dir
