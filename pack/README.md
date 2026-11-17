# Routing Intelligence High Volume Data Analysis

## What does this Config Pack Do

This config pack creates the IBA elements required to collect EVPN DF election telemetry for Routing Intelligence high-volume data analysis.

## Components

| Component | Name | Description |
| ----------- | ------ | ------------- |
| Service Registry | ri_evpn_df_election_${blueprint_id} | Service schema for EVPN DF election telemetry |
| Custom Collector | ri_evpn_df_election_${blueprint_id} | Collects EVPN DF election telemetry via `show evpn instance esi-info` |
| Probe | ri_evpn_df_election_probe | Streams EVPN DF election telemetry from deployed leaf and access switches |

## Notes

- Do not add collector accessors under a repeating XML element such as `evpn-esi-remote-pe`. The collector emits one row per repeated element, so an ESI with several remote PEs yields several rows for the same `(EVI, ESI_VAL)` key. That defeats on-change streaming and the probe re-sends unchanged rows every interval.
- Accessors use `"none_value": ""` so that fields absent on the switch are reported as empty strings.
- Rows for ESIs that are not local to a switch are kept on purpose, with an empty `ESI_NUM_LOCAL_INTF`. Downstream analysis reads that as "ESI not configured locally", so do not filter those rows out.
