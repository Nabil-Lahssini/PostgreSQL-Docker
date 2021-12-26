docker-compose down -v
cp .env.example .env
sed -i '$d' .env
sed -i '$d' .env
read -e -p "Please select a name for your database [press enter for default -> my_db]: " db
if [ -z "$db" ]
then
    echo "POSTGRES_DB=my_db" >> .env
else
    echo "POSTGRES_DB=$pass" >> .env
fi

read -e -p "Please select a password root [press enter for default -> root]: " pass
if [ -z "$pass" ]
then
    echo "POSTGRES_PASSWORD=root" >> .env
else
    echo "POSTGRES_PASSWORD=$pass" >> .env
fi
docker-compose up -d