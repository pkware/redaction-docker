FROM adoptopenjdk:8u265-b01-jdk-hotspot
RUN apt-get update \
  && apt-get install tesseract-ocr -y \
  && rm -rf /var/lib/apt/lists/*