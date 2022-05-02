# jvm-performance-comparison

Performance comparison between JVM distributions: OpenJ9-alpine, OpenJ9-ubuntu, OpenJDK, GraalVm, Oracle-Zulu.

## Create images

First create an image for each JVM

### OpenJ9-alpine
`docker build --file docker/openj9.dockerfile --tag=test-openj9:1.0.0 .`

### OpenJ9-ubuntu
`docker build --file docker/openj9-ubuntu.dockerfile --tag=test-openj9-ubuntu:1.0.0 .`

### GraalVm
`docker build --file docker/graalvm.dockerfile --tag=test-graalvm:1.0.0 .`

### OpenJDK
`docker build --file docker/openjdk.dockerfile --tag=test-openjdk:1.0.0 .`

### Zulu
`docker build --file docker/zulu.dockerfile --tag=test-zulu:1.0.0 .`

## Run all containers

`cd docker-compose && docker-compose up -d`

## Docker stats

```
CONTAINER ID   NAME                 CPU %     MEM USAGE / LIMIT     MEM %     NET I/O   BLOCK I/O   PIDS
489091837b12   test-openJ9-ubuntu   0.07%     86.32MiB / 24.84GiB   0.34%     0B / 0B   0B / 0B     50
02db3864f777   test-openj9          0.10%     81.07MiB / 24.84GiB   0.32%     0B / 0B   0B / 0B     49
23fa7ae3b466   test-openjdk         0.11%     156.2MiB / 24.84GiB   0.61%     0B / 0B   0B / 0B     48
3bddc8a27131   test-graalvm         0.11%     589.4MiB / 24.84GiB   2.32%     0B / 0B   0B / 0B     43
bcbf67926a57   test-zulu            0.10%     202.3MiB / 24.84GiB   0.80%     0B / 0B   0B / 0B     42
```

## Response Time

POST to `/calculate/plus-one` with request body 1 in milliseconds

| JVM           | Test 1 | Test 2 | Test 3 | Average |
|---------------|--------|--------|--------|---------|
| OpenJ9-alpine | 4.9    | 5.19   | 3.92   | 4.67    |
| OpenJ9-ubuntu | 3.49   | 4.36   | 3.81   | 3.88    |
| OpenJDK       | 2.88   | 4.22   | 3.21   | 3.43    |
| Zulu          | 3.55   | 3.76   | 6.87   | 4.72    |

Graal VM with the same build show errors to access endpoint.

## Startup Time

| JVM           | Time          |
|---------------|---------------|
| OpenJ9-alpine | 1ms           |
| OpenJ9-ubuntu | 2ms           |
| OpenJDK       | 1ms           |
| Graal VM      | 2.5s          |
| Zulu          | less than 1ms |


## Image size

| JVM           | Size   |
|---------------|--------|
| OpenJ9-alpine | 312MB  |
| OpenJ9-ubuntu | 276MB  |
| OpenJDK       | 345MB  |
| Graal VM      | 1.34GB |
| Zulu          | 389MB  |

# Results

Analyzing all the values, OpenJ9 had the best result, using less memory and CPU than the others and with the image with the smallest size.
The only points where it didn't have the best performance was in start time and response time for requests. But the difference compared to the others was very low.

OpenJ9-ubuntu has the lowest image size: `276MB`. `69MB` smaller than openJDK  and `113MB` smaller than Zulu.  
And OpenJ9-alpine has the lowest memory usage: `87.12MiB`. `45.68MiB` less than OpenJDK and `122.48MiB` less than Zulu.

But ubuntu has a better support, so OpenJ9-ubuntu is the best alternative to less memory and CPU.  
