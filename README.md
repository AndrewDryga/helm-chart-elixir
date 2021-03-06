# Elixir Chart

This chart unifies all charts we were previously using because they were very similar and hard to manage when
we needed to update the chart itself. It's also easier to add small changes (like exposing environment variables)
without editing too many files.

## Environment configurations

Production environment configuration should be set in `values.yaml` file, staging and other environments
can override those values in `values.$env.yaml` and then applies with `-f` option for `helm upgrade`.
We do this to make sure that we think about production whenever we plan to deploy something, to make staging
configuration as close to production as we can and to be fail-safe - it's harder to mess up when upgrading it.

## Example

```
helm upgrade talkinto-sales ../charts/elixir -f my_app/values.yaml -f my_app/values.staging.yaml --wait
```

where: 
- `../charts/elixir` is a path to this chart;
- `my_app` is a folder which contains two files `values.yaml` that override chart values file and `values.staging.yaml` that override app values file.
