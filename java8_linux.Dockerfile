FROM adoptopenjdk:8u265-b01-jdk-hotspot

# Ubuntu comes w/ Tesseract 4.0.0 and we need 4.1.1
RUN apt-get update \
  && apt-get install software-properties-common -y \
  && add-apt-repository ppa:alex-p/tesseract-ocr
RUN apt-get update \
  && apt-get install tesseract-ocr -y \
  && rm -rf /var/lib/apt/lists/*