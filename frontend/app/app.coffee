translationApp = angular.module('translation', [
  # Including external libraries
  'ui.router'
  'pascalprecht.translate'
  'tmh.dynamicLocale'
  'restangular'
  'ngAnimate'
  'ngAria'
  'ngMaterial'
  'ngMessages'
  'smart-table'

  # Including templates
  'templates-module'

  # Including directives
  'translation.directives.accessLevel'
  'translation.directive.searchWatchModel'

  # Including pages of aplication
  'translation.pages.404'
  'translation.pages.login'
  'translation.pages.dashboard'
  'translation.pages.manager-view'
  'translation.pages.programmer-view'

  # Including services
  'translation.services.user'
  'translation.services.authorization'
  'translation.services.filtersState'
  'translation.services.customTranslationHandler'

  # Including controllers
  'translation.controllers.sidenav'

  # Including directives
  'translator.directive.trTopBar'
])


.config ($stateProvider, $urlRouterProvider, $locationProvider, $animateProvider, $mdThemingProvider,
$translateProvider, tmhDynamicLocaleProvider, RestangularProvider) ->

  $stateProvider
  .state 'app',
    url:          ''
    replace:      true
    abstract:     true
    controller:   'AppController'
    templateUrl:  'templates/app.tpl.html'
    resolve:
      user: (UserService) ->
        return UserService.getSession()
      getGroups: (filtersStateService) ->
        return filtersStateService.refreshGroups()

  $urlRouterProvider
    .when('', '/')
    .when('/', '/login')
    .otherwise('/404')



  RestangularProvider.setBaseUrl '/api'

  $locationProvider.html5Mode(true)

  #$animateProvider.classNameFilter(/animate/)

  ###
  The is some issue with defining backgroud color
  "Uncaught TypeError: Cannot read property '600' of undefined"
  More info: https://github.com/angular/material/issues/2752
  ###
  $mdThemingProvider
    .theme('default')
    .primaryPalette('blue-grey')
    .accentPalette('blue')
    .warnPalette('red')
    # .backgroundPalette('gray',
    #   'default': 'A200',
    #   'hue-1': '300',
    #   'hue-2': '600',
    #   'hue-3': '900'
    # )

  # ### Translations (angular translate)
  $translateProvider.addInterpolation('$translateMessageFormatInterpolation')

  # Warnings, regarding forgotten IDs in translations
  $translateProvider.useMissingTranslationHandler('CustomTranslationHandlerService')

  # Set a fallback language in case there find no other
  $translateProvider.fallbackLanguage('en-us')

  # **Set default language**
  # This method tries to resolve language by user locale
  $translateProvider.registerAvailableLanguageKeys([
    'en-us'
  ], {
    'en_US': 'en-us'
    'en-en': 'en-us'
    'en':    'en-us'
  }).determinePreferredLanguage()

  # # configure loading angular locales
  # tmhDynamicLocaleProvider.localeLocationPattern('assets/angular-i18n/angular-locale_{{locale}}.js')


.run ($rootScope, UserService, AuthorizationService) ->


  _firstEnter = {}

  UserService.getSession().then () ->
    AuthorizationService.accessCheck(_firstEnter.event, _firstEnter.toState)


  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->

    if _.isEmpty _firstEnter
      _firstEnter.event = event
      _firstEnter.toState = toState
    else
      AuthorizationService.accessCheck(event, toState)
    return

  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    console.log error
    return

  $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
    return

  return

# App Controller
# -------------
.controller 'AppController', ($scope, $rootScope, $state, $cookies, $mdSidenav) ->

  return

