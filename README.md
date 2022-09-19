## Puesta en marcha

Requisitos para el host:

- make
- curl
- docker
- docker-compose
- minikube
- kubectl

Sustituir en ./builder/k8s/pv.yaml la ip 192.168.1.17 por la ip de la máquina host.
Añadir los dominios builder.localhost.com y api-builder.localhost.com en el fichero /etc/hosts apuntando a la ip de minikube (se puede obtener con `minikube ip`).

Ejecutar los siguientes comandos:

```bash
make nfs-start
make minikube-start
```

Una vez levante minikube:

```bash
make deploy-builder
```

Comprobar que jenkins está corriendo en [builder.localhost.com](http://builder.localhost.com) (user: GNUalex | password: 123456789) y para terminar:

```bash
make deploy-api-builder
```

Debería aparecer una nueva ejecución del job [builder.localhost.com/job/pipeline-job/](http://builder.localhost.com/job/pipeline-job/)

```bash
curl -I api-builder.localhost.com/build
```

Una nueva ejecución del job debería aparecer.

Para eliminar el entorno:

```bash
make destroy
```
