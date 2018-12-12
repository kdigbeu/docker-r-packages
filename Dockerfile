FROM semoss/docker-r

LABEL maintainer="semoss@semoss.org"

# Install R packages
RUN apt-get update \
	&& cd ~/ \
	&& git clone https://github.com/SEMOSS/docker-r-packages.git \
	&& mkdir /opt/status \
	&& wget --no-check-certificate --output-document=AnomalyDetectionV1.0.0.tar.gz https://github.com/twitter/AnomalyDetection/archive/v1.0.0.tar.gz \
	&& Rscript docker-r-packages/Packages.R \
	&& rm AnomalyDetectionV1.0.0.tar.gz \
	&& rm -r docker-r-packages \
	&& apt-get clean all

WORKDIR /opt

CMD ["bash"]
