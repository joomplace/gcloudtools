FROM docker:dind

# Install CA certs, openssl to https downloads, python for gcloud sdk + zip & nodejs & libpng-dev for png packagese
RUN apk add --update make ca-certificates openssl python zip; \
    update-ca-certificates
# Download and install Google Cloud SDK
RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz; \
    tar -zxf google-cloud-sdk.tar.gz && ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true; \
    google-cloud-sdk/bin/gcloud --quiet components update
