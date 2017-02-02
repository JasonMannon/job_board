# README

### BACKGROUND JOBS
  `redis-server`
  `bundle exec sidekiq`


# Job Board

## Getting Started

```
rake db:create db:migrate db:test:prepare
bundle install
redis-server
sidekiq
rake db:seed
```

Now you can access the running site from your browser: http://localhost:3000