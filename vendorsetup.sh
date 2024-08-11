croot; cd bionic

PATCH=$(curl -s https://github.com/LeafOS-experimental/android_bionic/commit/2381db9839fa4abeae48ade11ee46f0a53eb4c9c.patch)
if ! echo "$PATCH" | git apply --reverse --check 2>/dev/null; then
        echo "$PATCH" | git apply
fi

croot
