# Build Image

Create Locust server image with docker

    # Example: sudo docker build -t [name] .
    $ sudo docker build -t my_locust .

# Environment variables

| Name | Description | Default |
|---|---|---|
| LOCUST_TARGET_HOST | Required, Endpoint of target host. e.g. https://www.google.com | |
| LOCUST_FILE | File path for locust pythonfile | /opt/locustfile/locustfile.py |
| LOCUST_IS_MASTER | Set --master option | |
| LOCUST_IS_SLAVE | Set --slave option | |
| LOCUST_MASTER_HOST | When LOCUST_IS_SLAVE given, Set master endpoint. | |

# Running a Locust Instance

Creating a container running Locust. To set the target host, You can use the -e KEY=VALUE.

    $ sudo docker run -e "LOCUST_TARGET_HOST=https://www.google.com" my_locust

# Running Locust distributed

Creating a locust master instance.

    $ sudo docker run --name locust_master -e "LOCUST_TARGET_HOST=https://www.google.com" -e "LOCUST_IS_MASTER=true" my_locust

Creating a locust slave instance.

    $ MASTER=`docker inspect -f {{.NetworkSettings.IPAddress}} locust_master`
    $ sudo docker run --name locust_slave -e "LOCUST_TARGET_HOST=https://www.google.com" -e "LOCUST_IS_SLAVE=true" -e "LOCUST_MASTER_HOST=$MASTER" my_locust

Enjoy!
