FROM nanoninja/php-fpm:latest

RUN apt-get update && apt-get upgrade -y \
    && apt update -y \
    && apt-get install -y \
    # && apt install ffmpeg -y \
    # && apt install python3-pip -y \
    # && pip3 install ffmpeg-normalize \
    # && curl "https://storage.yandexcloud.net/yandexcloud-yc/install.sh" | bash \ 
    # && curl -o "google.tar.gz" "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-333.0.0-linux-x86_64.tar.gz" \
    # && tar -xf "google.tar.gz" \
    # && rm -rf "google.tar.gz" \
    # && echo N Y [/root/.bashrc] | ./google-cloud-sdk/install.sh \
    && pwd

RUN  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN  php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN  php composer-setup.php
RUN  php -r "unlink('composer-setup.php');"    
RUN mv composer.phar /usr/local/bin/composer

# RUN curl -sSL https://sdk.cloud.google.com | bash \

# https://stackoverflow.com/questions/28372328/how-to-install-the-google-cloud-sdk-in-a-docker-image
# Downloading gcloud package
# RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# # Installing the package
# RUN mkdir -p /usr/local/gcloud \
#   && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
#   && /usr/local/gcloud/google-cloud-sdk/install.sh

# # Adding the package path to local
# ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin


