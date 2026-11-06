#!/usr/bin/env bash
# Lab 01: VPC personalizada con subred en Google Cloud
# Ejecutar en Cloud Shell. Reemplaza TU_REGION por la región asignada.

# 1. Crear una VPC en modo personalizado (no crea subredes automáticas)
gcloud compute networks create labnet --subnet-mode=custom

# 2. Crear una subred dentro de la VPC con un rango primario pequeño
gcloud compute networks subnets create labnet-sub \
  --network labnet \
  --region "TU_REGION" \
  --range 10.0.0.0/28

# 3. Verificar las redes del proyecto
gcloud compute networks list

# 4. Auditar las subredes de la red creada
gcloud compute networks subnets list --network=labnet
