# Online Python compiler (interpreter) to run Python online.
# Write Python 3 code in this online editor and run it.

#!/bin/bash -ex
# The -e option would make out script exit with an error if any command
# fails while the -x option makes verbosely it output what it does

# Install Pipenv, the -n option makes sudo fail instead of asking for a
# password if we don't have sufficient privileges to run it
sudo -n dnf install -y pipenv

cd /vagrant
# Install dependencies with Pipenv
pipenv sync --dev

# Run database migrations
pipenv run python manage.py migrate

# run our app. Nohup and "&" are used to let the setup script finish
# while our app stays up. The app logs will be collecred in nohup.out
nohup pipenv run python manage.py runserver 0.0.0.0:8000 &