#!/bin/bash
php artisan migrate
if [ "$seed_database" == "True" ]; then
  echo ">>> Running seed"
  php artisan db:seed
fi
npm install
npm run build
php artisan serve --host=0.0.0.0
