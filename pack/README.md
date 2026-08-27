# Routing Intelligence High Volume Data Analysis

## What does this Config Pack Do

This config pack creates the IBA elements required to collect EVPN DF election telemetry for Routing Intelligence high-volume data analysis.

## Components

| Component | Name | Description |
| ----------- | ------ | ------------- |
| Service Registry | ri_evpn_df_election_${blueprint_id} | Service schema for EVPN DF election telemetry |
| Custom Collector | ri_evpn_df_election_${blueprint_id} | Collects EVPN DF election telemetry via `show evpn instance esi-info \| display xml` |
| Probe | ri_evpn_df_election_probe | Streams EVPN DF election telemetry from deployed leaf and access switches |
