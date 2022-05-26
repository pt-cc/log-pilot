{{range .configList}}
- type: log
  enabled: true
  paths:
      - {{ .HostDir }}/{{ .File }}
  scan_frequency: 10s
  fields_under_root: true
  {{if .Stdout}}
  docker-json: true
  {{end}}
  {{if eq .Format "json"}}
  json.keys_under_root: true
  {{end}}
# 如果使用以下配置，需要指定 message_key，否则报错，Unable to create runner due to error: When using the JSON decoder and multiline together, you need to specify a message_key value accessing '0'
#  multiline.pattern: '^[[:space:]]|^Caused by:|^{|^com|^org'
#  multiline.negate: false
#  multiline.match: after
  fields:
      {{range $key, $value := .CustomFields}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := .Tags}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := $.container}}
      {{ $key }}: {{ $value }}
      {{end}}
  {{range $key, $value := .CustomConfigs}}
  {{ $key }}: {{ $value }}
  {{end}}
  # 性能优化
  harvester_buffer_size: 40960000
  filebeat.spool_size: 250000
  filebeat.idle_timeout: 1s
  tail_files: false
  close_inactive: 2h
  close_eof: false
  close_removed: true
  clean_removed: true
  close_renamed: false

{{end}}
