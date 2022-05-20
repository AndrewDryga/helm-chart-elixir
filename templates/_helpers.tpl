{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "app.fullname" -}}
{{- default .Values.image .Release.Name | trunc 63 | replace "_" "-" | trimSuffix "-" -}}
{{- end -}}

{{/*
Shared labels which are used on all resources created by this chart.
*/}}
{{- define "app.labels" -}}
app.kubernetes.io/name: {{ template "app.fullname" . }}
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
helm.sh/release_revision: "{{ .Release.Revision }}"
talkinto.com/release_name: {{ .Values.erlang.nodeName | default ( .Values.image | replace "_" "-" ) | quote }}
{{- end -}}
