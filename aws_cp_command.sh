aws configure set default.s3.max_concurrent_requests 30
aws s3 cp factsheets/ s3://mobility-metrics-data-pages-dev \
    --recursive \
    --exclude "*" \
    --include "999_county-pages*" \
    --include "998_county-pages*"
  