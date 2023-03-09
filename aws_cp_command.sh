aws s3 cp factsheets/ s3://mobility-metrics-data-pages-dev --recursive --exclude "*" --include "01*html" --include "02*html" --include "03*.html" --include "04*.html" --include "index.html"
