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
    'public':           '*'
    'anon':             [ 'public' ]
    'programmer':       [ 'programmer' ]
    'user': [
      'user'
      'translator'
      'programmer'
      'manager'
      'admin'
    ]
    'translator-only':  [ 'translator' ]
    'programmer-only':  [ 'programmer' ]
    'management':        [
      'manager'
      'admin'
    ]
    'admin':            [ 'admin' ]



