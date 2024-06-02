# Fedora 40 Post-Installation Script

Este script automatiza la instalación de varias aplicaciones y herramientas después de una instalación limpia de Fedora 40. Incluye la instalación de Firefox Developer Edition, Docker, VirtualBox, Visual Studio Code, extensiones de GNOME, gnome-pomodoro, Git, Zoom, Ranger, Neovim, Quarto, Spotify, Oh My Bash, GIMP e Inkscape.

## Requisitos Previos

- Fedora 40 instalado y actualizado.
- Conexión a Internet para descargar los paquetes.

## Instrucciones

1. **Descargar el script**

Descarga el script y guárdalo en tu directorio de inicio (`~/`):

```bash
   wget https://tu-url-del-script/setup-fedora40.sh
```
Hacer el script ejecutable

Haz el script ejecutable con el siguiente comando:

```bash
chmod +x setup-fedora40.sh
```
Ejecutar el script

Ejecuta el script para iniciar la instalación:

```bash
./setup-fedora40.sh
```

## Detalles del Script

El script realiza las siguientes acciones:

Actualización del sistema

```bash
sudo dnf -y update && sudo dnf -y upgrade && sudo dnf -y autoremove
```
Instalación de Firefox Developer Edition

Descarga y extracción del archivo tar.

Moviendo Firefox Developer a /opt/ y creando un enlace simbólico.

Creación de una entrada de escritorio.

Instalación de Docker

Eliminación de versiones antiguas de Docker.

Instalación de Docker y configuración del repositorio.

Inicio del servicio Docker y agregación del usuario al grupo Docker.

Instalación de VirtualBox

Descarga e instalación del paquete RPM de VirtualBox.

Carga del módulo del kernel de VirtualBox.

Instalación de Visual Studio Code

Importación de la clave GPG y configuración del repositorio.

Instalación de Visual Studio Code.

Instalación de extensiones de GNOME

Instalación de varias extensiones de GNOME usando gnome-extensions.

Instalación de gnome-pomodoro

```bash
sudo dnf -y install gnome-pomodoro.x86_64
```
Instalación de Git

```bash
sudo dnf install -y git
```

Instalación de Zoom

Descarga e instalación del paquete RPM de Zoom.

Instalación de Ranger

```bash
sudo dnf -y install ranger
```
Instalación de Neovim

```bash
sudo dnf -y install neovim
```
Instalación de Quarto

Descarga y extracción del archivo tar de Quarto.

Moviendo Quarto a /opt/ y creando un enlace simbólico.

Verificación de la instalación de Quarto.

Instalación de Spotify

Instalación de snapd y configuración de enlaces simbólicos.

Instalación de Spotify usando snap.

Instalación de Oh My Bash

Descarga e instalación de Oh My Bash.

Instalación de GIMP e Inkscape

```bash
sudo dnf install -y gimp inkscape
```
## Notas

Asegúrate de tener una conexión a Internet estable durante la ejecución del script.

El script requiere permisos de superusuario para instalar los paquetes, por lo que te pedirá tu contraseña.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.