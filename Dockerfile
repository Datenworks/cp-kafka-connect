FROM maven:3-jdk-11 AS build

RUN apt -y update && apt -y install git

WORKDIR /home/datenworks

RUN git clone https://github.com/canelmas/kafka-connect-field-and-time-partitioner.git kafka-plugin && \
    cd kafka-plugin && \
    mvn package

FROM confluentinc/cp-kafka-connect:5.4.3

COPY --from=build /home/datenworks/kafka-plugin/target/connect-fieldandtime-partitioner-1.1.0-SNAPSHOT.jar \
     /usr/share/java/kafka-connect-storage-common