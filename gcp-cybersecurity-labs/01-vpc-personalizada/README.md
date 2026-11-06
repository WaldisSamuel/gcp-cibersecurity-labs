# Lab 01: VPC personalizada con subred

| Campo | Detalle |
|-------|---------|
| **Programa** | Google Cloud Cybersecurity |
| **Fecha** | AAAA-MM-DD |
| **Nivel** | Básico |
| **Habilidades** | VPC, subredes, CIDR, `gcloud`, auditoría de red |

## 1. Contexto
Como analista de seguridad en un escenario de migración a nube híbrida, antes de validar la seguridad de una red nueva conviene replicarla en un entorno de pruebas. Este laboratorio construye la base de ese entorno: una red virtual privada y una subred.

## 2. Objetivo
Crear desde la línea de comandos una VPC en modo personalizado, añadirle una subred y comprobar que ambas existen.

## 3. Entorno y herramientas
- Google Cloud (entorno temporal de laboratorio)
- Cloud Shell y `gcloud` CLI

## 4. Procedimiento
Los comandos completos y comentados están en [`comandos.sh`](comandos.sh).

### Crear la red
```bash
gcloud compute networks create labnet --subnet-mode=custom
```
`--subnet-mode=custom` indica que yo decido qué subredes existen. En modo automático, Google crearía una subred por región, y eso añade rangos que quizá nunca use.

### Crear la subred
```bash
gcloud compute networks subnets create labnet-sub \
  --network labnet --region "TU_REGION" --range 10.0.0.0/28
```
Asocia la subred a `labnet`, la ubica en una región y define su rango de IP.

### Verificar y auditar
```bash
gcloud compute networks list
gcloud compute networks subnets list --network=labnet
```

## 5. Verificación
Ambas listas muestran `labnet` y su subred.

![Listado de redes y subredes](img/verificacion.png)
<!-- Recorta la captura: sin usuario, sin ID de proyecto. -->

## 6. Perspectiva de seguridad
- **Menor superficie de ataque:** crear solo las subredes necesarias evita rangos y regiones sin uso que nadie vigila.
- **Segmentación:** separar cargas en subredes permite aplicar reglas de firewall distintas a cada segmento.
- **Auditoría:** listar subredes periódicamente ayuda a detectar configuraciones erróneas o exposiciones no intencionadas.

## 7. Errores y aprendizajes
- Anotar aquí cualquier error real que hayas tenido (región mal escrita, rango en conflicto, etc.).
- Aprendizaje: el nombre de una subred debe ser único por proyecto y región, y su rango primario no debe solaparse con otros de la misma red.

## 8. Conceptos clave
| Término | Significado |
|---------|-------------|
| VPC | Red virtual privada aislada dentro de la nube pública |
| Modo personalizado | La VPC no crea subredes; se definen manualmente |
| Subred | Segmento de la VPC con su propio rango de IP y región |
| CIDR /28 | Bloque de 16 direcciones; Google reserva 4 en el rango primario, quedan 12 utilizables |

## 9. Extensión propia
Idea: crear una segunda subred en otra región con un rango distinto y listar ambas. Documentar si hubo conflicto de rangos.

## 10. Referencias
- Documentación oficial de redes VPC de Google Cloud.
