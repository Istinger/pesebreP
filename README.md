# 🎄 PesebreP - Sistema de Gestión Navideña

Sistema web interactivo para la gestión y visualización de contenido navideño, incluyendo novenas, villancicos, personajes del pesebre y sistema de puntajes.

## 📋 Descripción

PesebreP es una aplicación web Java que permite administrar y compartir contenido relacionado con la temporada navideña. Los usuarios pueden seguir las novenas día a día, aprender sobre personajes del pesebre, disfrutar villancicos y competir por puntajes.

## ✨ Características

- **Gestión de Novenas**: Sistema de 9 días de novena con contenido diario
- **Villancicos**: Repositorio de villancicos navideños
- **Personajes del Pesebre**: Información sobre los personajes tradicionales
- **Sistema de Usuarios**: Autenticación con roles (Admin/Estudiante)
- **Sistema de Puntajes**: Gamificación con tabla de puntuaciones
- **Bitácora**: Registro de actividades del sistema
- **Panel de Administración**: Gestión completa de contenido

## 🛠️ Tecnologías

- **Backend**: Java
- **Base de Datos**: MySQL/MariaDB
- **Arquitectura**: MVC con JDBC
- **Gestión de Dependencias**: Maven/Gradle (según configuración)

## 📁 Estructura del Proyecto

```
src/main/java/com/productos/
├── datos/
│   ├── Conexion.java          # Gestión de conexión a BD
│   └── PruebaConexion.java    # Test de conexión
└── seguridad/
    ├── Usuario.java           # Gestión de usuarios y autenticación
    ├── Novena.java            # CRUD de novenas
    ├── Villancico.java        # Gestión de villancicos
    ├── Personaje.java         # Gestión de personajes
    ├── Puntaje.java           # Sistema de puntuaciones
    ├── Pagina.java            # Gestión de páginas
    └── Bitacora.java          # Registro de actividades
```

## 🚀 Instalación

1. **Clonar el repositorio**:
```bash
git clone git@github.com:Istinger/pesebreP.git
cd pesebreP
```

2. **Configurar la base de datos**:
   - Crear una base de datos MySQL
   - Actualizar credenciales en `Conexion.java`

3. **Compilar el proyecto**:
```bash
# Si usa Maven
mvn clean install

# Si usa otro sistema de build, ajustar según corresponda
```

4. **Ejecutar la aplicación**:
```bash
# Configurar según tu servidor de aplicaciones
```

## 👥 Roles de Usuario

- **Admin**: Gestión completa del sistema (crear/editar novenas, usuarios, etc.)
- **Estudiante**: Acceso de lectura y participación en el sistema de puntajes

## 📊 Base de Datos

El sistema requiere las siguientes tablas principales:
- `tb_usuario` - Usuarios del sistema
- `tb_perfil` - Perfiles/roles
- `tb_estado_usuario` - Estados de usuario
- `novena` - Contenido de las novenas
- (y tablas relacionadas para villancicos, personajes, puntajes, etc.)

## 🔐 Seguridad

- Sistema de autenticación por correo y contraseña
- Control de acceso basado en roles
- Validación de estado de usuario (Activo/Bloqueado)
- Registro de actividades en bitácora

## 👤 Autor
Patricio Jossue Proano Guerrero

**Istinger**
- GitHub: [@Istinger](https://github.com/Istinger)

---

⭐ Si te gusta este proyecto, dale una estrella en GitHub!
