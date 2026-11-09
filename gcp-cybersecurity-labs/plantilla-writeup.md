# Lab #1: [Crea una VPC con Cloud Shell]

| Campo | Detalle |
|-------|---------|
| **Programa** | Google Cloud Cybersecurity |
| **Fecha** | 2026-11-06 |
| **Duración aproximada** | 1 hora y 30 minutos |
| **Nivel de dificultad** | Intermedio |
| **Habilidades** | [VPC, IAM, firewall, Cloud Shell, y auditoria de red] |

## 1. Contexto

Luego de que la entidad bancaria Cymbal Bank, organizacion a la cual pertenezco como Analista Junior de seguridad en la nube, hubiese realizado una evaluacion detallada de su infraestructura actual y llevado a cabo una migracion planificada a un entorno de nube hibrida se me ha solicitado la tarea de realizar investigaciones para explorar la seguridad de los parametros de configuracion de la nueva red de la nube.

Es importante destacar que, una parte del plan incluye extender la infraestructura de su centro de datos local para conectarse a Google Cloud, de manera que se logró diseñar la nueva infraestructura de red de la nube de forma exitosa y ya está lista para su implementación. Antes de hacerlo, el equipo de seguridad habia procedido a evaluar la seguridad de la nueva infraestructura de red de la nube. 

## 2. Objetivo
¿Qué lograste al finalizar?
Pude aprender a crear una red de VPC con subredes personalizadas, mediante el uso de la herramienta Cloud Shell.

## 3. Entorno y herramientas
- Plataforma: Google Cloud (entorno temporal de laboratorio)
- Solicitud de nombre de la cuenta activa por medio del comando # gcloud auth list 
- Solicitud del ID del proyecto por medio del comando # gcloud config list project
- Herramientas: Cloud Shell, `gcloud`, ...

## 4. Procedimientos

### Tarea 1: [Crea de la red VPC]
```bash
# Comando: gcloud compute networks create labnet --subnet-mode=custom

```
**Explicación:** qué hace cada parte del comando y por qué.
- gcloud: invoca la herramienta de linea de comandos gcloud del SDK de cloud.
- Compute: es uno de los grupos de gcloud que permite crear y configurar recursos de compute engine, ademas de que pertenece a una jerarquia anidad de grupo de comandos.
- Networks: es subgrupo de compute con sus propios comandos.
- create: es la accion que se va a ejecutar en este comando.
- labnet: es el nombre de la red VPC que se esta creando.
- subnet-mode=custom: representa el tipo de VPC que estamos creando en esta estancia custom o personalizada.


### Tarea 2: [Creación de subred Labnet-sub]

# Comando: gcloud compute networks subnets create labnet-sub \
   --network labnet \
   --region "REGION" \
   --range 10.0.0.0/28

**Explicación:** qué hace cada parte del comando y por qué.

Con esta comando estamos creando la subred labnet perteneciente a la red creada anteriormente Labnet la cual pertenece a una region determinada y se le asigna un rango de direcciones IP especifico. Crear subredes es una practica recomendada en la administracion de redes. Esto permite que se haga una segmentacion logica de la red para organizar mejor los recursos en la nube, redimiento de la red y la seguridad.



### Tarea 3: [Visualiza las redes creadas]

# Comando: gcloud compute networks list

**Explicación:** qué hace cada parte del comando y por qué.

Este comando es utilizado para generar una lista que permita visualizar todas las redes que forman parte del proyecto con el cual se encuentre trabajando en ese momento.

El resultado de este comando debería enumerar las redes default y labnet. La red default se creó en el momento en que se creó el proyecto. La red labnet se creó con el comando gcloud que se pudo ejecutar antes.


### Tarea 4: [Enumeración de las subredes]

# Comando: gcloud compute networks subnets list --network=labnet

**Explicación:** qué hace cada parte del comando y por qué.

Este comando permite crear una lista de todas las subredes que han sido creadas y que pertenecen a la red Labnet o una region en particular. La auditoría de las subredes garantiza que se haya protegido la red de manera adecuada y permite identificar errores en la configuración o vulnerabilidades de seguridad potenciales en tus VPC, como subredes que se hayan expuesto sin intención al Internet público.


## 5. Verificación
¿Cómo comprobaste que funcionó? Incluye una captura recortada del resultado.

![Resultado](img/resultado.png)

## 6. Perspectiva de seguridad
- ¿Qué riesgo reduce o ayuda a detectar esta configuración?
- ¿Qué pasaría si estuviera mal configurada?
- ¿Cómo se aplicaría en un entorno real?

## 7. Errores y aprendizajes
Qué falló, qué te costó y cómo lo resolviste.

## 8. Conceptos clave
| Término | Significado |
|---------|-------------|
| | |

## 9. Extensión propia (opcional)
Variación que probaste por tu cuenta y su resultado.

## 10. Referencias
- Documentación oficial de Google Cloud: [enlace]
