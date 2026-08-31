#  Copyright (c) Juniper Networks, Inc., 2025-2026.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

resource "apstra_raw_json" "ri_evpn_df_election_probe" {
  depends_on = [
    apstra_raw_json.evpn_df_election_service,
    apstra_raw_json.evpn_df_election_collector
  ]

  url = format("/api/blueprints/%s/probes", var.blueprint_id)

  payload = <<-EOT
{
    "label": "ri_evpn_df_election_probe",
    "description": "Streams EVPN DF election telemetry for Routing Intelligence high-volume data analysis.",
    "disabled": false,
    "processors": [
        {
            "name": "Extensible Service Collector",
            "type": "extensible_data_collector",
            "properties": {
                "service_name": "ri_evpn_df_election_${var.blueprint_id}",
                "service_interval": "60",
                "value_map": {},
                "graph_query": [
                    "match(node('system', name='system', deploy_mode='deploy', role=is_in(['leaf', 'access'])))"
                ],
                "service_input": "''",
                "query_group_by": [],
                "keys": [],
                "ingestion_filter": {},
                "data_type": "dynamic",
                "query_tag_filter": {
                    "filter": {},
                    "operation": "and"
                },
                "execution_count": "-1",
                "system_id": "system.system_id",
                "query_expansion": {},
                "enable_streaming": true
            },
            "inputs": {},
            "outputs": {
                "out": "Extensible Service Collector"
            }
        }
    ],
    "stages": [
        {
            "name": "Extensible Service Collector",
            "description": "",
            "units": {
                "ESI_LOCAL_INTF_STATUS": "",
                "ESI_LOCAL_INTF": "",
                "ESI_STATUS": "",
                "ESI_BDF": "",
                "ESI_DF": "",
                "ESI_DF_ALG": "",
                "ESI_NUM_LOCAL_INTF": ""
            },
            "enable_metric_logging": false,
            "retention_duration": 86400,
            "retention_size": 0,
            "graph_annotation_properties": {},
            "hidden_columns": []
        }
    ]
}
  EOT
}
