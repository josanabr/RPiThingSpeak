# Sensor de temperatura (simulado) y ThingSpeak

Este repositorio busca presentar un escenario donde una máquina virtual que corre [Raspbian](https://www.raspbian.org/) toma datos de un sensor de temperatura y los envía a la nube.

* [Requerimientos](#requerimientos)
  * [OpenWeatherMap](#openweathermap)
  * [ThingSpeak](#thingspeak)
* [Desarrollo de la práctica](#desarrollo_de_la_practica)

# Requerimientos

Para llevar a cabo esta práctica es necesario tener cuenta en los siguientes sitios:

* [OpenWeatherMap](https://openweathermap.org/)
* [ThingSpeak](https://thingspeak.com/)

De cada uno de estos sitios se deben obtener unas llaves que permitan el acceso a los *web services* de cada uno de ellos.

## OpenWeatherMap

Una vez entra al sitio web con su usuario registrado, visitar [este enlace](https://home.openweathermap.org/api_keys).

## ThingSpeak

Una vez entra al sitio web con su usuario registrado se hace necesario crear un *Channel*. 
Una vez se crea el canal se debe visitar la pestaña asociada al canal llamada **API Keys**.
Para efectos de esta práctica nos interesa la que dice **Write API Key**.

# Desarrollo de la práctica


## Preparación de scripts

Como se mencionó al comienzo de este documento se quiere simular el acceso a un sensor de temperatura y los datos de este sensor subirlos a Internet.

### Simulando el sensor de temperatura

Los datos del sensor serán tomados de la plataforma [OpenWeatherMap](https://home.openweathermap.org/).
Para tomar los datos de esta plataforma se debe crear un script que toma los datos de la plataforma.
Este script se llamará `openWeather.sh` y tendrá el siguiente código:

```
#!/usr/bin/env bash
curl "https://api.openweathermap.org/data/2.5/weather?q=Cali,co&appid=<YOURKEY>&units=metric"
```

`YOURKEY` es un valor que usted puede obtener de [este enlace](https://home.openweathermap.org/api_keys).

#### Un script que engloba lo anterior

Para leer el sensor se ejecutará el siguiente comando,

```
./readSensor.sh dev00
```

Los datos quedarán en el archivo `dev00`.

#### Leer los datos de `dev00`

Para leer los datos de `dev00` se usa el script `readWeatherJSON.py` como sigue:

* **Temperatura** `./readWeatherJSON.py dev00 main temp`
* **Humedad** `./readWeatherJSON.py dev00 main humidity`
* **Viento** `./readWeatherJSON.py dev00 wind speed`

### Subir los datos a ThingSpeak



## Despliegue de sistema operativo Raspbian

Para llevar a cabo la práctica se debe crear una máquina virtual con el sistema operativo Raspbian. 
Raspbian es un sistema operativo basado en Debian Linux y que se diseñó para trabajar sobre ambientes SOC (*System On a Chip*).
[En esta página](https://www.osboxes.org/raspbian/) se puede hacer su descarga de una versión para sistemas x86 y que corren bajo ambientes virtuales como VirtualBox.

Una vez descargado el archivo se descomprime.
El archivo resultado de ese proceso de descompresión es un VDI que se le pegará a una máquina virtual.
El *hypervisor* en este caso es VirtualBox y las características de la máquina serán las siguientes:

* Name: Raspbian
* Type: Linux
* Version: Debian (32-bit)
* Memory size: 1024 MB
* Hard disk: "Use an existing virtual hard disk file". Buscar por el archivo VDI que se acabó de descomprimir.

Habilitar el PAE en esta máquina virtual.
Seleccionar **System**, **Processor** y seleccionar **"Enable PAE/NX"**.
Esta opción permite acceder a regiones de memoria más allá de los 4 GB en RAM.

Iniciar la máquina virtual.
Una vez la máquina termina de arrancar el login del usuario es **pi** y el password es **osboxes.org**<a name="osboxes"><sup>osboxes</sup></a>.


---

# Detalles de bajo nivel

El archivo `weather.txt` debe tener un contenido similar a este:

```
{"coord":{"lon":-76.51,"lat":3.43},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":29,"pressure":1012,"humidity":51,"temp_min":29,"temp_max":29},"visibility":10000,"wind":{"speed":7.2,"deg":320},"clouds":{"all":40},"dt":1567635927,"sys":{"type":1,"id":8590,"message":0.006,"country":"CO","sunrise":1567594816,"sunset":1567638627},"timezone":-18000,"id":3687925,"name":"Cali","cod":200}
```

Para una mejor visualización de este contenido se puede ejecutar el siguiente comando:

```
python -m json.tool weather.txt
```

Para obtener un dato en particular ejecutar el siguiente comando:

Humedad:

```
./readWeatherJSON.py main humidty
```

Temperatura:

```
./readWeatherJSON.py main temp
```

Velocidad del viento:

```
./readWeatherJSON.py wind speed
```
---

<sup>[osboxes](#osboxes)</sup> https://www.ostechnix.com/osboxes-free-unixlinux-virtual-machines-for-vmware-and-virtualbox/
