log_level = "INFO"
data_dir = "/home/vagrant/.nomad-server"

server {
  enabled = true
  bootstrap_expect = 1
  retry_join = ["vm-11.io:4648"]
}

// consul {
//   # The address to the Consul agent.
//   address = "vm-10.io:8500"

//   # The service name to register the server and client with Consul.
//   server_service_name = "nomad"
//   client_service_name = "nomad-client"

//   # Enables automatically registering the services.
//   auto_advertise = true

//   # Enabling the server and client to bootstrap using Consul.
//   server_auto_join = true
//   client_auto_join = true
// }
