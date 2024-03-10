# Usa una imagen base
FROM alpine:latest

# Instala las dependencias necesarias
RUN apk add --no-cache wget tar

# Descarga y extrae los archivos
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.2/srbminer_custom-2.4.2.tar.gz \
    && tar -xf srbminer_custom-2.4.2.tar.gz \
    && cd srbminer_custom \
    && chmod +x srbminer_custom_bin

# Establece el comando predeterminado a ejecutar cuando se inicie el contenedor
CMD ["./srbminer_custom/srbminer_custom_bin", "--algorithm", "yespowerLTNCG", "--wallet", "RAbmDJUMuWqkkmNju5DV72sraHiANAUpiu", "--pool", "stratum+tcp://yespowerLTNCG.na.mine.zpool.ca:6245", "--password", "c=RVN,zap=CRNC"]
