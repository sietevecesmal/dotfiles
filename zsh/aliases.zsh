# Universal Shell Aliases
alias mkdir='mkdir -p'
alias chown='chown -Rv'
alias chmod='chmod -Rv'

# Terraform
alias tfplan='terraform plan -out=.tfplan --var-file="env.tfvars"'
alias tffreshplan='terraform plan -out=.tfplan'
alias tfapply='terraform apply .tfplan'
