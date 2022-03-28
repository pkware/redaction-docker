FROM eclipse-temurin:11

# Add a new user "nonRoot" with user id 1234
# This user will be used by bitbucket-pipelines.yml files.
RUN useradd -u 1234 nonRoot

# We need Tesseract 4.1.x
RUN apt-get update \
  && apt-get install software-properties-common -y \
  && add-apt-repository ppa:alex-p/tesseract-ocr
RUN apt-get update \
  && apt-get install tesseract-ocr git -y \
  && rm -rf /var/lib/apt/lists/*
ENV GRADLE_OPTS=-Dkotlin.compiler.execution.strategy="in-process"