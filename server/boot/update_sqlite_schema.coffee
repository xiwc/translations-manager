module.exports = (app) ->
  app.dataSources.mysql.isActual (err, actual) ->
    if !actual
      app.dataSources.mysql.autoupdate()
      # app.dataSources.mysql.automigrate()
    return
  return
