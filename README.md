# Docker-Spark

    Spark cluster with Jupyterlab in Docker

# Setup

1. Create directory name "workspace" in the docker-spark directory

        ./workspace - directory is needed for jupyterlab working dir

2. Create a directory named "data" inside of the new workspace directory
        
        ./workspace/data - any data that you want to be able to load and use after building
        
3. Build local docker images

        a. base
        b. jupyterlab
        c. spark-base
        d. spark-master
        e. spark-worker
        
    Run ```./build.sh``` to build all

4. Start the containers
    
    Run ```docker-compose up```


# Environment

| App            | URL                                       | Info                                         |
| ------------   | ----------------------------------------- | -------------------------------------------- |
| JupyterLab     | [localhost:8888] (http://localhost:8888/) | Interface with cluster via jupyter notebooks |
| Spark Master   | [localhost:8080] (http://localhost:8080/) | Spark master node                            |
| Spark Worker 1 | [localhost:8081] (http://localhost:8081/) | Spark worker node. 1 core and 512m of memory |
| Spark Worker 2 | [localhost:8082] (http://localhost:8082/) | Spark worker node. 1 core and 512m of memory |

# Example

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("pyspark-notebook").master("spark://spark-master:7077").config("spark.executor.memory").getOrCreate()
```