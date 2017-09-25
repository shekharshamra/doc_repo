connect('{{ weblogic_admin }}', '{{ weblogic_admin_pass }}')
start('{{ managed_server_name }}')
