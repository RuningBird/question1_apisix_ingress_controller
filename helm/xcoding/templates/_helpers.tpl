{{/*
Expand the name of the chart.
*/}}
{{- define "xcoding.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "xcoding.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "xcoding.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "xcoding.labels" -}}
helm.sh/chart: {{ include "xcoding.chart" . }}
{{ include "xcoding.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "xcoding.selectorLabels" -}}
app.kubernetes.io/name: {{ include "xcoding.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "xcoding.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "xcoding.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Nginx service specific helpers
*/}}

{{/*
Expand the name of the nginx service.
*/}}
{{- define "xcoding.nginx.name" -}}
{{- printf "nginx" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name for nginx.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "xcoding.nginx.fullname" -}}
{{- if .Values.nginx.fullnameOverride }}
{{- .Values.nginx.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "nginx" .Values.nginx.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the nginx chart label.
*/}}
{{- define "xcoding.nginx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for nginx
*/}}
{{- define "xcoding.nginx.labels" -}}
helm.sh/chart: {{ include "xcoding.nginx.chart" . }}
{{ include "xcoding.nginx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: nginx
{{- end }}

{{/*
Selector labels for nginx
*/}}
{{- define "xcoding.nginx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "xcoding.nginx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the nginx service account to use
*/}}
{{- define "xcoding.nginx.serviceAccountName" -}}
{{- if .Values.nginx.serviceAccount.create }}
{{- default (include "xcoding.nginx.fullname" .) .Values.nginx.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.nginx.serviceAccount.name }}
{{- end }}
{{- end }}
