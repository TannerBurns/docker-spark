scala_version=2.12.11
spark_version=2.4.4
jupyterlab_version=2.1.4
hadoop_version=2.7

docker build \
      --build-arg scala_version="${scala_version}" \
      -f docker-spark/base/Dockerfile \
      -t base:latest .
docker build \
      --build-arg spark_version="${spark_version}" \
      --build-arg hadoop_version="${hadoop_version}" \
      -f docker-spark/spark-base/Dockerfile \
      -t spark-base:latest .
docker build \
      --build-arg spark_version="${spark_version}" \
      --build-arg hadoop_version="${hadoop_version}" \
      -f docker-spark/spark-master/Dockerfile \
      -t spark-master:latest .
docker build \
      --build-arg spark_version="${spark_version}" \
      --build-arg hadoop_version="${hadoop_version}" \
      -f docker-spark/spark-worker/Dockerfile \
      -t spark-worker:latest .
docker build \
      --build-arg scala_version="${scala_version}" \
      --build-arg spark_version="${spark_version}" \
      --build-arg jupyterlab_version="${jupyterlab_version}" \
      -f docker-spark/jupyterlab/Dockerfile \
      -t jupyterlab:latest .