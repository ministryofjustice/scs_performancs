# SCS Performance

[![Build Status](https://travis-ci.org/ministryofjustice/scs_performance.svg?branch=master)](https://travis-ci.org/ministryofjustice/scs_performance)

## Getting Started for local development

1. Install dependencies
  ```
  bundle install
  ```

2. Setup database
  ```
  rake db:create
  rake db:migrate
  ```

3. Import users from CSV
  ```
  bin/import_users csv_file
  ```
  CSV file should contain name, email, and manager email e.g.
  ```
    name,email,manager_email
    Alice,alice@example.com,
    Bob,bob@example.com,alice@example.com
  ```