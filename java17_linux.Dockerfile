FROM eclipse-temurin:17

# We need Tesseract 4.1.x
RUN apt-get update \
  && apt-get install software-properties-common -y \
  && add-apt-repository ppa:alex-p/tesseract-ocr
RUN apt-get update \
  && apt-get install tesseract-ocr git -y \
  && rm -rf /var/lib/apt/lists/*
ENV GRADLE_OPTS=-Dkotlin.compiler.execution.strategy="in-process"

# Add a new user group "nonRoot".
# Add a new user "nonRoot" with user id 1234 to this group.
# This user will be used by bitbucket-pipelines.yml files.
RUN groupadd --gid 1234 newgroup
RUN useradd -g newgroup --uid 1234 nonRootUser

USER nonRootUser
RUN whoami
