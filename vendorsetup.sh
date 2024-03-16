#!/bin/bash

cd device/xiaomi/santoni
GCAM_FILE="GCam/Camera.apk"
GCAM_DOWNLOAD_URL="https://1-dontsharethislink.celsoazevedo.com/file/filesc/NGCam_7.4.104-v2.0_eng.apk"
GCAM_APK_SUM="2e66c50ab1dfb2c2eae7782f83137e87142b5adc5abea2693681b526aaa238f7"

while true; do
    if [[ -f "$GCAM_FILE" ]]; then
        GCAM_APK_CURRENT_SUM=$(sha256sum "$GCAM_FILE" | awk '{print $1}')
        if [[ "$GCAM_APK_CURRENT_SUM" == "$GCAM_APK_SUM" ]]; then
            break
        else
            echo "GCam/Camera.apk Checksum mismatch. Redownloading..."
        fi
    else
        echo "Downloading GCam/Camera.apk ..."
    fi

    curl -L -o "$GCAM_FILE" "$GCAM_DOWNLOAD_URL" || { echo "GCam/Camera.apk Download failed. Retrying..."; continue; }
done
croot

if grep -q 'metadata_csum_seed' /etc/mke2fs.conf && filecontent=$(cat /etc/mke2fs.conf | sed 's/metadata_csum_seed,//'); then
    if ! echo "$filecontent" > /etc/mke2fs.conf; then
        echo '/etc/mke2fs.conf contains invalid filesystem option metadata_csum_seed'
        echo 'Aborting the build.'
        exit 1
    fi
fi

if grep -q 'orphan_file' /etc/mke2fs.conf && filecontent=$(cat /etc/mke2fs.conf | sed 's/,orphan_file//'); then
    if ! echo "$filecontent" > /etc/mke2fs.conf; then
        echo '/etc/mke2fs.conf contains invalid filesystem option orphan_file'
        echo 'Aborting the build.'
        exit 1
    fi
fi
