croot; cd bionic
# libstdc++: Rename vendor variant to libstdc++_vendor
PATCH=$(curl -s https://github.com/LeafOS-experimental/android_bionic/commit/2381db9839fa4abeae48ade11ee46f0a53eb4c9c.patch)
if ! echo "$PATCH" | git apply --reverse --check 2>/dev/null; then
        echo "$PATCH" | git apply
fi
unset PATCH

croot; cd build/make
# Allow installing fake [odm|product|system_ext] packages
PATCH=$(curl -s https://github.com/LeafOS-experimental/android_build/commit/a33bf0afb3d076dccb000817344c400f2b1d5c52.patch)
if ! echo "$PATCH" | git apply --reverse --check 2>/dev/null; then
        echo "$PATCH" | git apply
fi
unset PATCH
croot
