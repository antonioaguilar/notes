job "example" {
  datacenters = ["dc1"]
  type = "service"

  # constraint {
  #   attribute = "${attr.kernel.name}"
  #   value     = "linux"
  # }

  group "store" {
    count = 10

    update {
      max_parallel = 1
      min_healthy_time = "10s"
      healthy_deadline = "20s"
      stagger = "5s"
      auto_revert = false
      canary = 0
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"
        port_map {
          db = 6379
        }
      }

      # artifact {
      #   source = "http://foo.com/artifact.tar.gz"
      #   options {
      #     checksum = "md5:c4aa853ad2215426eb7d70a21922e794"
      #   }
      # }

      resources {
        cpu    = 500
        memory = 10
        network {
          mbits = 10
          port "db" {}
        }
      }

      // service {
      //   name = "redis-cache"
      //   tags = ["global", "cache"]
      //   port = "db"
      //   check {
      //     name     = "alive"
      //     type     = "tcp"
      //     interval = "10s"
      //     timeout  = "2s"
      //   }
      // }

    }
  }
}
