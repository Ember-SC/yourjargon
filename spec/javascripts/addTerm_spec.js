describe ("Add item", function(){
	it("with definition is added to list of defined terms", function(){
		var	term=YJ.term.create({
			 term:"a term"
		});
		term.set("definition", "a definition");	
		expect(YJ.definedTerms.get("length")).toBe(0);
	}
}