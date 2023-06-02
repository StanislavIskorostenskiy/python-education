<<<<<<< HEAD
# python-education
project for study python
=======
# Learning server for great things

Userful dev commands:
```
python manage.py runserver 0.0.0.0:1234 # run server 
python manage.py makemigrations
python manage.py migrate

export $(cat .env | xargs) && source interface/env/bin/activate && python interface/manage.py runserver 0.0.0.0:1234 # run server 
export $(cat .env | xargs) && source interface/env/bin/activate && python interface/manage.py makemigrations
export $(cat .env | xargs) && source interface/env/bin/activate && python interface/manage.py migrate
```

Userful docker commands:
```
docker-compose up --build -d # run stack
docker-compose ps # show containers
docker-compose down # stop stack
docker compose -f docker-compose.yml -f docker-compose.test.yml up
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
docker exec -i abc-interface-dev python run.py tests.tests "test_topic_page()"
docker logs abc-interface-dev --tail 100 --follow
docker exec -i abc-interface-dev python run.py tests.tests "test_topic_page()"
```
>>>>>>> e3eeae0 (Iskotostenskiy)
