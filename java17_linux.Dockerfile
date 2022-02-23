FROM eclipse-temurin:17

# We need Tesseract 4.1.x
RUN apt-get update \
  && apt-get install software-properties-common -y \
  && add-apt-repository ppa:alex-p/tesseract-ocr
RUN apt-get update \
  && apt-get install tesseract-ocr git -y \
  && rm -rf /var/lib/apt/lists/*
ENV GRADLE_OPTS=-Dkotlin.compiler.execution.strategy="in-process"