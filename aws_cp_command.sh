sudo aws configure set default.s3.max_concurrent_requests 100
sudo aws s3 cp factsheets/ s3://mobility-metrics-data-pages-dev \
    --recursive \
    --exclude "*" \
    --include "999_county-pages*" \
    --include "998_place-pages*"
 