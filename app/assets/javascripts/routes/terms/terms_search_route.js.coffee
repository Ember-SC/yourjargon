 YJ.TermsSearchRoute = Ember.Route.extend(

   events: 
     filterTerms: ((router, event) ->
       @set('searchLetter', event.context)
     )

   setupController: ((controller, model) ->
      console.log('model is ' + model)
      controller.set('content', model)
   )

   renderTemplate: ->
     @render('terms')
 )
