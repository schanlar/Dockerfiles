FROM vivekvenkris/vivek_pulsar_docker:latest

WORKDIR /home/psr
COPY /src_files /home/psr

RUN rm -rf /home/psr/software/tempo2/T2runtime/ephemeris
RUN cp -r /home/psr/ephemeris /home/psr/software/tempo2/T2runtime/

RUN cp /home/psr/clockfiles/*.clk /home/psr/software/tempo2/T2runtime/clock
RUN rm -rf clockfiles ephemeris
