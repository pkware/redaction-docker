FROM adoptopenjdk:11.0.8_10-jdk-openj9-0.21.0
RUN apt-get update \
  && apt-get install tesseract-ocr -y \
  && rm -rf /var/lib/apt/lists/*