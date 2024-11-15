FROM mysql

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

COPY ./DDL_DML.sql /docker-entrypoint-initdb.d/

EXPOSE 3306