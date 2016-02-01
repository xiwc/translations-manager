module.exports =

  roles: [
    'public'
    'user'
    'translator'
    'programmer'
    'manager'
    'admin'
  ]
  accessLevels:
    'public': '*'
    'anon': [ 'public' ]
    'user': [
      'user'
      'translator'
      'programmer'
      'manager'
      'admin'
    ]
    'translator': [
      'translator'
      'manager'
      'admin'
    ]
    'programmer': [
      'programmer'
      'manager'
      'admin'
    ]
    'manager': [
      'manager'
      'admin'
    ]
    'admin': [
      'admin'
    ]
    'translator-only':  [ 'translator' ]
    'programmer-only':  [ 'programmer' ]
    'manager-only':     [ 'manager' ]
    'admin-only':       [ 'admin' ]



