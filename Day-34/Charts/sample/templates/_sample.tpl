{{- define "sample.labels" -}}
app: nginx
app1: nginx1
app2: {{ .Chart.Name }}
{{- end }}