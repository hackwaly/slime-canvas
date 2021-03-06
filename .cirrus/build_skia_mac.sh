brew install ninja zstd python curl
git clone 'https://chromium.googlesource.com/chromium/tools/depot_tools.git'
export PATH="${PWD}/depot_tools:${PATH}"
git clone https://skia.googlesource.com/skia.git
cd skia
python tools/git-sync-deps
bin/gn gen ../out/Release --args='is_official_build=false is_debug=false'
ninja -C ../out/Release skia
cd ../out/Release
zstd libskia.a
split -b 8m libskia.a.zst libskia.a.zst.
