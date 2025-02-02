# Pre-reqs
- linux environment or WSL
- Installed: Docker Desktop, Terraform, jq

# Steps to reproduce
While inside the root of the project folder
- Run `source ./script_pass.sh` to generate unique passwords saved as linux (host) env variables

- Run `docker-compose up -d` to start a PostgreSQL container instances

Switch inside the terraform code folder `cd provision_db`

- Initialize `terraform init`
- Validate `terraform validate`
- Plan `terraform plan -out tfplan`
- Apply `terraform apply tfplan`

# Steps to clean up
From inside the terraform folder 
- Destroy `terraform destroy`

While inside the project root folder
- Run `docker-compose down -v` to wipe the containers together with their volumes
- source ./cleanup_pass.sh


