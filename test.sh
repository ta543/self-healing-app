#!/bin/bash

# Directory for security configurations
SECURITY_DIR="security"

# Create the security directory if it doesn't exist
mkdir -p $SECURITY_DIR

# NetworkPolicy to deny all ingress and egress traffic by default
NETWORK_POLICY="$SECURITY_DIR/network-policy.yaml"
cat > $NETWORK_POLICY << EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: default
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
EOF

# Simplified example of integrating a Pod with Vault for secret management
VAULT_INTEGRATION="$SECURITY_DIR/vault-integration.yaml"
cat > $VAULT_INTEGRATION << EOF
apiVersion: v1
kind: Pod
metadata:
  name: vault-integrated-pod
spec:
  containers:
  - name: my-app-container
    image: my-app-image
    volumeMounts:
    - name: vault-secrets
      mountPath: /etc/secrets
      readOnly: true
  volumes:
  - name: vault-secrets
    projected:
      sources:
      - secret:
          name: my-vault-secret
EOF

echo "Security configuration files have been created."
