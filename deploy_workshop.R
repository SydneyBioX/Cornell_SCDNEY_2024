


Sys.setenv(GCE_AUTH_FILE = 'C:/Users/xifu0689/OneDrive - The University of Sydney (Staff)/Conferences/ISMB_Cornell_Glasgow_2024/Workshop/scdney-2024-c8c3291c1d7b.json')
library(googleComputeEngineR)


gce_global_project("scdney-2024")
gce_global_zone("us-central1-a")

## see gce_list_machinetype() for options of predefined_type
(tag = "gcr.io/scdney-2024/workshop:alpha")



vm1 <- gce_vm(template = "rstudio",
              name = "workshop1",
              disk_size_gb = 500,
              predefined_type = "n2-standard-32",
              dynamic_image = tag,
              user = "rstudio",
              password = "2024")


gce_global_zone("asia-southeast1-a")


vm2 <- gce_vm(template = "rstudio",
              name = "workshop2",
              disk_size_gb = 500,
              predefined_type = "n2-standard-32",
              dynamic_image = tag,
              user = "rstudio",
              password = "2024")



# gce_global_zone("us-west2-a")

# vm2 <- gce_vm(template = "rstudio",
#              name = "workshop2",
#              disk_size_gb = 500,
#              predefined_type = "n2-standard-32",
#              dynamic_image = tag,
#              user = "rstudio",
#              password = "test")

# 32 CPU	256GB RAM
# system(paste0("cp -r /home/gittmp/* ", getwd()))


# 
# 
# 
# vm1 = gce_ssh_setup(vm1,
#                     username = "rstudio",
#                     key.pub = "~/.ssh/id_rsa.pub",
#                     key.private = "~/.ssh/id_rsa")
# 
# gce_push_registry(vm1,
#                   save_name = "customised",
#                   container_name = "rstudio")
