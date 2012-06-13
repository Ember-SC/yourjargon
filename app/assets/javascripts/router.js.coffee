YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'
  #states defined under /states folder
  root: Ember.State.extend(
    index: Ember.State.extend(
      route: '/'

    )

    terms: Ember.State.extend(
      index: Ember.State.extend(
        route: '/terms'
      )

      edit: Ember.State.extend(
        route: '/terms/:term_id/edit'
      )

      new: Ember.State.extend(
        route: '/terms/new'
      )
    )

    login: Ember.State.extend(
      route: '/'
    )

    loggedOut: Ember.State.extend(
      route: '/login'
    )

    register: Ember.State.extend(
      route: ''
    )

  )
)