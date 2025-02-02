# Pre-reqs
- linux environment or WSL
- Installed: Docker Desktop, Terraform, jq

# Steps to reproduce
While inside the root of the project folder
- Run `source ./script_pass.sh` to generate unique passwords saved as linux (host) env variables
Read the comments inside the script in case a change is needed (more db's/containers needed etc.)

- Run `docker-compose up -d` to start `X` PostgreSQL container instances
Read the comments inside docker compose in case fewer/more instances needed

Switch inside the terraform code folder `cd provision_db`

- Initialize `terraform init`
- Validate `terraform validate`
- Plan `terraform plan -out tfplan`
- Apply `terraform apply tfplan`
- Read the terraform code comments to understand how to add/remove Postgres instances

# Steps to clean up
From inside the terraform folder 
- Destroy `terraform destroy`

While inside the project root folder
- Run `docker-compose down -v` to wipe the containers together with their volumes
- source ./cleanup_pass.sh

# Changing add / remove Postgres instances
When changing the number of Postgres instances it's a good idea to fully clean the linux (host) environment - [Steps to clan up](#steps-to-clean-up)

Search for `<change me>` comments in the code and adjust the variables according to the new Postgres instance number needed

Files to adjust when changing numbers of db instances:
- script_pass.sh
- cleanup_pass.sh
- docker-compose.yaml
- provision_db/variables.tf
- provision_db/main.tf
- provision_db/outputs.tf
- provision_db/provision.tf

