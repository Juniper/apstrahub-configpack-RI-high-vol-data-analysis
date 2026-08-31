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
                    "ESI_VAL": {
                        "type": "string"
                    },
                    "EVI": {
                        "type": "string"
                    }
                },
                "required": [
                    "ESI_VAL",
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
                    "ESI_LOCAL_INTF": {
                        "type": "string"
                    },
                    "ESI_LOCAL_INTF_STATUS": {
                        "type": "string"
                    },
                    "ESI_NUM_LOCAL_INTF": {
                        "type": "string"
                    },
                    "ESI_STATUS": {
                        "type": "string"
                    }
                },
                "required": [
                    "ESI_BDF",
                    "ESI_DF",
                    "ESI_DF_ALG",
                    "ESI_LOCAL_INTF",
                    "ESI_LOCAL_INTF_STATUS",
                    "ESI_NUM_LOCAL_INTF",
                    "ESI_STATUS"
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
