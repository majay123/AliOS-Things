src =Split(''' 
    acapp.c
''')
component =aos_component('acapp', src)

dependencis =Split(''' 
    tools/activation
    kernel/yloop
    kernel/cli
''')
for i in dependencis:
    component.add_comp_deps(i)





