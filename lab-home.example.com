$TTL    604800
@       IN      SOA     bastion.lab-home.example.com. admin.lab-home.example.com. (
                112     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Negative Cache TTL
)

; name servers - NS records
@    IN      NS      bastion.lab-home.example.com.

; name servers - A records
bastion.lab-home.example.com.         IN      A       10.255.253.112

; OpenShift Container Platform Cluster - A records
ocp4-bootstrap.lab-home.example.com.             IN      A      10.255.253.113
ocp4-control-plane-1.lab-home.example.com.       IN      A      10.255.253.114
ocp4-control-plane-2.lab-home.example.com.       IN      A      10.255.253.115
ocp4-control-plane-3.lab-home.example.com.       IN      A      10.255.253.116
ocp4-compute-1.lab-home.example.com.           IN    A    10.255.253.117
ocp4-compute-2.lab-home.example.com.            IN      A    10.255.253.118
ocp4-compute-3.lab-home.example.com.            IN      A    10.255.253.119

; OpenShift internal cluster IPs - A records
api.lab-home.example.com.        IN    A    10.255.253.108
api-int.lab-home.example.com.    IN    A    10.255.253.108

;internal
*.apps.lab-home.example.com.     IN    A    10.255.253.108
*.pub.lab-home.example.com.     IN      A       10.255.253.107


etcd-0.lab-home.example.com.    IN    A     10.255.253.114
etcd-1.lab-home.example.com.    IN    A    10.255.253.115
etcd-2.lab-home.example.com.     IN    A       10.255.253.116

; OpenShift internal cluster IPs - SRV records
_etcd-server-ssl._tcp.lab-home.example.com.    86400     IN    SRV     0    10    2380    etcd-0
_etcd-server-ssl._tcp.lab-home.example.com.    86400     IN    SRV     0    10    2380    etcd-1
_etcd-server-ssl._tcp.lab-home.example.com.    86400     IN    SRV     0    10    2380    etcd-2


