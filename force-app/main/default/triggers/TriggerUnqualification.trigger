trigger TriggerUnqualification on Lead (after insert, after update,before insert, before update) {
	UnqualifyLead.unqualify();
}
