moment = require 'moment'

projectsAccounts = [
  {
    accountId:  1
    projectId:  1
  }
  {
    accountId:  2
    projectId:  1
  }
  {
    accountId:  4
    projectId:  1
  }
]

projectsAccounts.forEach (value, i) ->
  ProjectAccount.seed value