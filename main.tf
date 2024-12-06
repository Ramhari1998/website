
            terraform {
              required_providers {
                virtualbox = {
                  source  = "terra-farm/virtualbox"
                  version = "0.2.2-alpha.1"
                }
              }
            }

            resource "virtualbox_vm" "webserver" {
              count     = 1
              name      = "ScotlandYard"
              image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
              cpus      = 2
              memory    = "2048 mib"

              network_adapter {
                type           = "hostonly"
                host_interface = "VirtualBox Host-Only Ethernet Adapter"
              }
            }

            output "vm_ip" {
              value = virtualbox_vm.webserver[0].network_adapter[0].ipv4_address
            }
            
