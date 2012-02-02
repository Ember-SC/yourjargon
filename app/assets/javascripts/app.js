
YJ = Em.Application.create();

YJ.Term = Em.Object.extend({
  term: null,
  description: null
});

YJ.definedTermsController = Em.ArrayProxy.create({
  content: []

});

YJ.Api = Em.Object.extend({

  submitTerm: function(term) {
    if (term.get('description') != null) {
      YJ.definedTermsController.pushObject(term);
    }
  }

});

YJ.api = YJ.Api.create();
