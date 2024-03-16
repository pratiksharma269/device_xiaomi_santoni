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
