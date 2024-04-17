# IMAGEM OFICIAL NGINX
FROM nginx:latest AS rm99097-nginx

# EXECUTE COMANDOS PARA ATUALIZAR UBUNTU E INSTALAR FERRAMENTAS CURL E VIM
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# CRIAÇÃO DA PASTA "MEU-SITE"
RUN mkdir -p /MEU-SITE

# INDEX.HTML -> MEU-SITE
COPY ./MEU-SITE/index.html /MEU-SITE

# CÓPIA DOS ARQUIVOS DA PÁGINA WEB PARA O DIRETORIO NGINX
COPY ./MEU-SITE /usr/share/nginx/html

# ADD METADADOS
LABEL description="Imagem para hospedar uma página web estática em um contêiner Docker" \
    author="Bruno Ciccio" \
    version="1.0" \
    email="dev.bruno.ciccio@gmail.com"

# PORTA PADRÃO HTTP 8080
EXPOSE 80

# USUÁRIO LINUX
RUN useradd -m -s /bin/bash rm99097

# COMANDOS USADOS NO BASH
# Construir a imagem
# docker build -t rm99097-nginx .

# Executar o contêiner
# docker run -d -p 8080:80 --name rm99097-nginx rm99097-nginx

# Verificar se o contêiner está em execução
# docker ps

