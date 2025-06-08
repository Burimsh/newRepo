{{- define "hello.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "hello.fullname" -}}
{{- printf "%s" (include "hello.name" .) -}}
{{- end -}}
