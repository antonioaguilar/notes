log_level = "INFO"
data_dir = "/home/vagrant/.nomad-client"

client {
  enabled = true
  servers = ["192.168.33.11:4647"]
}

// consul {
//   address             = "192.168.33.10:8500"
//   server_service_name = "nomad"
//   client_service_name = "nomad-client"
//   auto_advertise      = true
//   server_auto_join    = true
//   client_auto_join    = true
// }
