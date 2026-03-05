#! /bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Waiting for database..."
until RAILS_ENV=production bundle exec rake db:version > /dev/null 2>&1; do
  echo "  database not ready, retrying in 2s..."
  sleep 2
done
echo "Database ready."

RAILS_ENV=production bundle exec rake db:migrate \
  && RAILS_ENV=production bundle exec rake assets:precompile \
  && RAILS_ENV=production bundle exec rails s -b '0.0.0.0'
