--Configure a new source in the folder models/staging/snowplow called src_snowplow.yml.
version: 2

sources:
  - name: snowplow
    database: raw
    loaded_at_field: collector_tstamp
    freshness:
      error_after: {count: 1, period: hour}
    tables:
      - name: events
    