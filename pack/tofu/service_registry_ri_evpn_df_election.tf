#  Copyright (c) Juniper Networks, Inc., 2025-2026.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

resource "apstra_raw_json" "evpn_df_election_service" {
  url = "/api/telemetry-service-registry"
        id  = "ri_evpn_df_election_${var.blueprint_id}"

  payload = <<-EOT
{
    "service_name": "ri_evpn_df_election_${var.blueprint_id}",
    "application_schema": {
        "properties": {
            "key": {
                "properties": {
                    "EVI": {
                        "type": "string"
                    }
                },
                "required": [
                    "EVI"
                ],
                "type": "object"
            },
            "value": {
                "properties": {
                    "ESI_BDF": {
                        "type": "string"
                    },
                    "ESI_DF": {
                        "type": "string"
                    },
                    "ESI_DF_ALG": {
                        "type": "string"
                    },
                    "ESI_LAST_DF_UPD_TS": {
                        "type": "string"
                    },
                    "ESI_LOCAL_INTF": {
                        "type": "string"
                    },
                    "ESI_LOCAL_INTF_STATUSS": {
                        "type": "string"
                    },
                    "ESI_NUM_RMT_PES": {
                        "type": "string"
                    },
                    "ESI_RMT_ALIASING_LABEL": {
                        "type": "string"
                    },
                    "ESI_RMT_MAC_LABEL": {
                        "type": "string"
                    },
                    "ESI_RMT_PE_IP_ADDR": {
                        "type": "string"
                    },
                    "ESI_RMT_PE_MODE": {
                        "type": "string"
                    },
                    "ESI_STATUS": {
                        "type": "string"
                    },
                    "ESI_VAL": {
                        "type": "string"
                    }
                },
                "required": [
                    "ESI_BDF",
                    "ESI_DF",
                    "ESI_DF_ALG",
                    "ESI_LAST_DF_UPD_TS",
                    "ESI_LOCAL_INTF",
                    "ESI_LOCAL_INTF_STATUSS",
                    "ESI_NUM_RMT_PES",
                    "ESI_RMT_ALIASING_LABEL",
                    "ESI_RMT_MAC_LABEL",
                    "ESI_RMT_PE_IP_ADDR",
                    "ESI_RMT_PE_MODE",
                    "ESI_STATUS",
                    "ESI_VAL"
                ],
                "type": "object"
            }
        },
        "required": [
            "key",
            "value"
        ],
        "type": "object"
    },
    "storage_schema_path": "aos.sdk.telemetry.schemas.iba_data",
    "description": "EVPN DF election telemetry for Routing Intelligence high-volume data analysis.",
    "version": "version_0"
}
  EOT
}
