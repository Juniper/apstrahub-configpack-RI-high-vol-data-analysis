#  Copyright (c) Juniper Networks, Inc., 2025-2026.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

resource "apstra_raw_json" "evpn_df_election_collector" {
  depends_on = [
    apstra_raw_json.evpn_df_election_service
  ]

  url = "/api/telemetry/collectors"
  id  = "ri_evpn_df_election_${var.blueprint_id}"

  payload = <<-EOT
{
    "service_name": "ri_evpn_df_election_${var.blueprint_id}",
    "collectors": [
        {
            "platform": {
                "os_type": "junos",
                "os_version": "23.4r2",
                "family": "junos,junos-ex,junos-qfx",
                "model": ""
            },
            "config": {
                "evpn_esi_accessors": {
                    "accessors": {
                        "evpn_esi_local_intf_status": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-local-intf-information/evpn-esi-local-intf-status",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_value": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-value",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_backup_forwarder": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-backup-forwarder",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_remote_pe_ipaddr": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-remote-pe/evpn-esi-remote-pe-ipaddr",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_df_election_algorithm": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-df-election-algorithm",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_instance_name": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-instance-name",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_df_no_preempt": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-df-no-preempt",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_num_remote_pe": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-num-remote-pe",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_local_intf_name": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-local-intf-information/evpn-esi-local-intf-name",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_num_local_intf": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-local-intf-information/evpn-esi-num-local-intf",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_backup_df_no_preempt": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-backup-df-no-preempt",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_backup_df_preference": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-backup-df-preference",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_designated_forwarder": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-designated-forwarder",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_df_preference": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-df-preference",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_status": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-status",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_last_df_update_timestamp": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-last-df-update-timestamp",
                            "type": "String",
                            "none_value": null
                        }
                    },
                    "cmd": "show evpn instance esi-info",
                    "desc": "",
                    "type": "xml_transform"
                },
                "evpn_esi_select": {
                    "desc": "",
                    "type": "select_filter",
                    "from": "evpn_esi_accessors",
                    "row": {
                        "keys": {
                            "EVI": "evpn_instance_name",
                            "ESI_VAL": "evpn_esi_value"
                        },
                        "values": {
                            "ESI_DF": "esi_designated_forwarder",
                            "ESI_BDF": "esi_backup_forwarder",
                            "ESI_DF_ALG": "esi_df_election_algorithm",
                            "ESI_STATUS": "evpn_esi_status",
                            "ESI_LOCAL_INTF": "evpn_esi_local_intf_name",
                            "ESI_LOCAL_INTF_STATUS": "evpn_esi_local_intf_status",
                            "ESI_NUM_LOCAL_INTF": "evpn_esi_num_local_intf"
                        }
                    }
                },
                "evpn_esi_local_filter": {
                    "type": "condition_filter",
                    "from": "evpn_esi_select",
                    "desc": "",
                    "filter": "'irb' not in values[\"ESI_LOCAL_INTF\"]"
                },
                "ri_evpn_df_election_${var.blueprint_id}": {
                    "type": "service_sink",
                    "from": "evpn_esi_local_filter",
                    "desc": ""
                }
            },
            "relaxed_schema_validation": true
        }
    ]
}
  EOT
}
