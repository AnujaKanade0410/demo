echo "Assuming that docker-compose and vault CLI are installed"
echo "If not check https://docs.docker.com/compose/install/ for Docker compose installation"
echo "and https://www.vaultproject.io/docs/install for vault CLI"

#Run vault
#docker run \
# -p 8200:8200 \
# -e 'VAULT_DEV_ROOT_TOKEN_ID=vault-plaintext-root-token' \
# -e 'VAULT_ADDR=http://0.0.0.0:8200' \
# vault:1.13.3

echo "Waiting for vault to start..."

echo "Add entries to vault"
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='vault-plaintext-root-token'

echo "Adding a property for all applications (same as application.yml)"
vault kv put secret/application only.in.vault="Hello"
echo "Adding a property for app bar with profile foo"
vault kv put secret/bar,foo a="bar with foo profile value from vault"
echo "Reading the properties back"
vault kv get secret/application
vault kv get secret/bar,foo
