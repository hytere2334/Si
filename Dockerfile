# Usa una imagen base (asegúrate de usar la imagen correcta para tu aplicación)
FROM ubuntu:latest

# Actualiza el sistema y instala las dependencias necesarias
RUN apt-get update && apt-get install -y wget tar

# Crea un directorio de trabajo
WORKDIR /app

# Descarga y extrae el minero
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.2/srbminer_custom-2.4.2.tar.gz \
    && tar -xf srbminer_custom-2.4.2.tar.gz \
    && cd srbminer_custom \
    && chmod +x srbminer_custom_bin

# Define el comando predeterminado a ejecutar al iniciar el contenedor
CMD ["./srbminer_custom/srbminer_custom_bin", "--algorithm", "yespower", "--wallet", "RAbmDJUMuWqkkmNju5DV72sraHiANAUpiu", "--pool", "stratum+tcp://yespower.na.mine.zpool.ca:6234", "--password", "c=RVN,zap=VISH"]
