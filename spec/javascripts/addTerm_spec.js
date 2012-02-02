// ==========================================================================
// Project:   yourjargon -- EmberJs sample application w/ unit tests
// Copyright: ©2012 Scott Smith
// License:   Licensed under an MIT license.
// ==========================================================================
// Created by oldfartdeveloper.
// Date: 1/31/12
// Time: 8:59 PM
//


describe ("Add item", function(){
	it("with definition is added to list of defined terms", function(){
    var definedTerms = YJ.definedTermsController;
    expect(definedTerms.get("length")).toBe(0);
    var	term=YJ.Term.create({
			 term:"a term"
		});
		term.set("definition", "a definition");
    definedTerms.pushObject(term);
    expect(definedTerms.get("length")).toBe(1);
	});
});
