# Sensor de temperatura (simulado) y ThingSpeak

Este repositorio busca presentar un escenario donde una máquina virtual que corre [Raspbian](https://www.raspbian.org/) toma datos de un sensor de temperatura y los envía a la nube.

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
Una vez la máquina termina de arrancar el login del usuario es **pi** y el password es **osboxes.org**<sup>osboxes</sup>.



[osboxes] https://www.ostechnix.com/osboxes-free-unixlinux-virtual-machines-for-vmware-and-virtualbox/
