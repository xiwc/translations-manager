translationApp = angular.module('translation', [
  # Including external libraries
  'ui.router'
  'pascalprecht.translate'
  'restangular'
  'ngAnimate'
  'ngAria'

  # Including templates
  'templates-module'

# Including pages of aplication
  'translation.404'
  'translation.home'
  'translation.login'
])


.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  $stateProvider
  .state 'app',
    url:          ''
    abstract:     true
    controller:   'AppController'
    template:     '<div data-ui-view=""></div>'

  $urlRouterProvider
    .when('', '/')
    .when('/', '/home')
    .otherwise('/404')



  $locationProvider.html5Mode(true)


.run ($rootScope) ->

  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
    return

  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    return

  $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
    return

  return

# App Controller
# -------------
.controller 'AppController', ($scope) ->
  return
