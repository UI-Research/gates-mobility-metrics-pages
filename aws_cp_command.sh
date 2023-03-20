aws s3 cp factsheets/ s3://mobility-metrics-data-pages-dev \
    --recursive --exclude "*" \
    --include "060*html" \
    --include "061*html" \
    --include "index.html"
