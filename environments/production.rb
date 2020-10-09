name 'production'
description 'Production Chef environment'

cookbook 'apache', '= 0.3.2'
cookbook 'myhaproxy', '= 0.3.4'

# default_attributes({})
