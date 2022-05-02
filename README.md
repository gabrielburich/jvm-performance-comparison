# jvm-performance-comparison

Performance comparison between JVM distributions: OpenJ9, OpenJDK, GraalVm, Oracle-Zulu.

## Create images

First create an image for each JVM

### OpenJ9
`docker build --file docker/openj9.dockerfile --tag=test-openj9:1.0.0 .`

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
CONTAINER ID   NAME           CPU %     MEM USAGE / LIMIT     MEM %     NET I/O   BLOCK I/O   PIDS
02db3864f777   test-openj9    0.10%     87.12MiB / 24.84GiB   0.34%     0B / 0B   0B / 0B     49
23fa7ae3b466   test-openjdk   0.26%     132.8MiB / 24.84GiB   0.52%     0B / 0B   0B / 0B     48
3bddc8a27131   test-graalvm   0.50%     576.5MiB / 24.84GiB   2.27%     0B / 0B   0B / 0B     43
bcbf67926a57   test-zulu      0.17%     209.6MiB / 24.84GiB   0.82%     0B / 0B   0B / 0B     42
```

## Response Time

POST to `/calculate/plus-one` with request body 1 in milliseconds

| JVM     | Test 1 | Test 2 | Test 3 | Average |
|---------|--------|--------|--------|---------|
| OpenJ9  | 4.9    | 5.19   | 3.92   | 4.67    |    
| OpenJDK | 2.88   | 4.22   | 3.21   | 3.43    |
| Zulu    | 3.55   |  3.76  | 6.87   | 4.72    |

Graal VM with the same build show errors to access endpoint.

## Startup Time

| JVM      | Time          |
|----------|---------------|
| OpenJ9   | 1ms           |
| OpenJDK  | 1ms           |
| Graal VM | 2.5s          |
| Zulu     | less than 1ms |


## Image size

| JVM      | Size   |
|----------|--------|
| OpenJ9   | 312MB  |
| OpenJDK  | 345MB  |
| Graal VM | 1.34GB |
| Zulu     | 389MB  |

# Results

Analyzing all the values, OpenJ9 had the best result, using less memory and CPU than the others and with the image with the smallest size.
The only points where it didn't have the best performance was in start time and response time for requests. But the difference compared to the others was very low.

OpenJ9 has the lowest image size: `312MB`. `33MB` smaller than openJDK  and `77MB` smaller than Zulu.  
It also has the lowest memory usage: `87.12MiB`. `45.68MiB` less than OpenJDK and `122.48MiB` less than Zulu.
