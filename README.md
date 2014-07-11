sonar-vagrantbox
================

* CentOS 6.5 x64
* PostgreSQL
* Sonar 3.7.1

## Usage

    vagrant up

Sonar will be available at http://localhost:9000

To run the maven goal:

    mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 \
    -Dsonar.jdbc.url=jdbc:postgresql://localhost/sonar \
    -Dsonar.jdbc.username=sonar -Dsonar.jdbc.password=sonar \
    -Dsonar.jdbc.driver=org.postgresql.Driver
