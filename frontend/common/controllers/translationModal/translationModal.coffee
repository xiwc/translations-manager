angular.module('translation.controllers.translationModal', [
  'ui.router'
  'ngCookies'
  'data-table'
  'ngMessages'
  'ngAnimate'
  'lbServices'
  'translation.providers.userPermissionsSettings'
  'ui.bootstrap'
])

.controller 'TranslationModalController', ($uibModalInstance, TranslationKey, Namespace) ->
  vm  = this

  vm.getNamespaces = (val) ->
    Namespace.find(
      filter:
        where:
          namespace:
            like: "%#{val}%"
    ).$promise.then (success)->
      return success



  vm.translationKey                       = {}
  vm.translationKey.translatedPhrase      = 'TESTOWY'
  vm.translationKey.pluralForm            = false
  vm.translationKey.projectId             = 1
  vm.translationKey.namespaceId           = 3

  _selectedNamespace = ""


  _createNewNamespace = (namespace) ->
    _namespaceObject =
      parent_id: null
      namespace: namespace
#TODO how should we create name?
      name: namespace
#FIXME mocking project Id to 1 for now
      projectId: 1
    Namespace.create(_namespaceObject ).$promise.then () ->
      console.log "namespace created"
    , (error) ->
      console.log 'error while creating namespace'


  vm.ok = ->
#creating namespace or using current
    Namespace.find(
      filter:
        where:
          namespace: vm.namespace
    ).$promise.then (success)->
      if success.length is 1
        console.log "USING CURRENT NAMESPACE"
        _selectedNamespace = success[0]
      else
        _selectedNamespace = _createNewNamespace(vm.namespace)
    , (error) ->
      console.log "something went wrong!"


  #    TranslationKey.create(vm.translationKey).$promise.then () ->
  #      $uibModalInstance.close()
  #    , (error) ->
  #      console.log 'error while saving key'

  vm.cancel = ->
    $uibModalInstance.close()



  return vm
