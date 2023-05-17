#!/bin/bash

useradd --no-create-home --shell /bin/false node_exporter;

curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz;
tar -xvf node_exporter-1.5.0.linux-amd64.tar.gz;
cp -v /node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/;
chown -v node_exporter:node_exporter /usr/local/bin/node_exporter;
cp -v /node_exporter-1.5.0.linux-amd64/node_exporter.service /etc/systemd/system;
systemctl daemon-reload;
systemctl enable --now node_exporter.service;
