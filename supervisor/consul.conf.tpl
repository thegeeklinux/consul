[program:consul]
user=root
command=consul agent -config-dir=/config {{ ARGS | default('') }} 
autostart=true
autorestart=true
redirect_stderr=true
