Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates)

## Utilities

Dump prod database and mount it locally:

```bash
$ rails db:drop && heroku pg:pull DATABASE_URL devsolut_development
```
