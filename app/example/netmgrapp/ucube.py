src     = Split('''
        netmgrapp.c
''')

component = aos_component('netmgrapp', src)
component.add_comp_deps('kernel/yloop', 'kernel/cli', "network/netmgr")
