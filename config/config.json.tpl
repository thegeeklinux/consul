{
	"data_dir": "/data",
	"ui_dir": "/ui",
	"advertise_addr": "{{ ADVERTISE | default('localhost') }}",
	"client_addr": "0.0.0.0",
	"ports": {
		"dns": 53
	},
	"recursor": "8.8.8.8",
	"disable_update_check": true
}
