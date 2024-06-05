# usar a imagem oficial ubuntu 22.04
FROM ubuntu:22.04
ENV seed_database="True"

# mudar variavel ambiente para fazer com que seja possivel instalar certos pacotes
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common git curl gnupg

# Adicionar o repositório do PHP
RUN add-apt-repository ppa:ondrej/php -y \
    && apt-get update

# Instalar o PHP e extensões necessárias

RUN apt install -y php8.2
RUN apt install -y php8.2-xml
RUN apt install -y php8.2-curl
RUN apt install -y php8.2-zip
RUN apt install -y php8.2-mysql
RUN apt install -y php8.2-mbstring

# Install necessary dependencies for Node.js
RUN apt-get install -y ca-certificates curl gnupg \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Set the desired Node.js version
ARG NODE_MAJOR=16

# Criar o repositório Node.js
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

# Update the package list and remove conflicting package before installing Node.js
RUN apt-get update \
    && apt-get purge -y libnode-dev \
    && apt-get install -y nodejs

# Install MySQL Client
RUN apt-get install -y mysql-client

# Install Composer 2.0
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer
    
# Install Redis
RUN apt-get install -y redis-server php8.2-redis

# Mudar a diretoria de trabalho
WORKDIR /Sites/

# Clonar o laravel.io
RUN git clone https://github.com/laravelio/laravel.io.git

# Mudar a diretoria para onde ficaram os ficheiros
WORKDIR /Sites/laravel.io

# Copiar as variáveis de ambiente
RUN cp .env.example .env

# Correr o composer install e Instalar dependências npm
RUN composer install && npm install

# Gerar Chave para a aplicação Laravel
RUN php artisan key:generate

# Copiar o script para correr ao iniciar
COPY script.sh .

# Deixar a script executável
RUN chmod u+x script.sh

# Expor a porta 80
EXPOSE 80

# Comando a executar ao iniciar
CMD ./script.sh
