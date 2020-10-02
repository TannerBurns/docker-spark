FROM base:latest

ARG spark_version
ARG jupyterlab_version

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev && \
    pip3 install --upgrade pip && \
    pip3 install pyspark==${spark_version} jupyterlab==${jupyterlab_version}

ARG scala_version=2.12.11

RUN apt-get install -y r-base-dev && \
    R -e "install.packages('IRkernel')" && \
    R -e "IRkernel::installspec(displayname = 'R 3.5', user = FALSE)"

RUN apt-get install -y ca-certificates-java --no-install-recommends && \
    curl -Lo coursier https://git.io/coursier-cli && \
    chmod +x coursier && \
    ./coursier launch --fork almond:0.10.0 --scala ${scala_version} -- --display-name "Scala ${scala_version}" --install && \
    rm -f coursier

RUN curl https://cran.r-project.org/src/contrib/Archive/SparkR/SparkR_${spark_version}.tar.gz -k -o sparkr.tar.gz && \
    R CMD INSTALL sparkr.tar.gz && \
    rm -f sparkr.tar.gz


EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
ADD workspace/ ${SHARED_WORKSPACE}/

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=