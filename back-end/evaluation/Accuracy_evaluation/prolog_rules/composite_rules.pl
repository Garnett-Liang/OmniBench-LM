same_applies_to_jurisdiction(Entity_A, Entity_B) :- 
	applies_to_jurisdiction(Entity_A, Entity_C),
	applies_to_jurisdiction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_ordeal_by(Entity_A, Entity_B) :- 
	ordeal_by(Entity_A, Entity_C),
	ordeal_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_for_work(Entity_A, Entity_B) :- 
	for_work(Entity_A, Entity_C),
	for_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_contains_settlement(Entity_A, Entity_B) :- 
	contains_settlement(Entity_A, Entity_C),
	contains_settlement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_depends_on_software(Entity_A, Entity_B) :- 
	depends_on_software(Entity_A, Entity_C),
	depends_on_software(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_pet(Entity_A, Entity_B) :- 
	has_pet(Entity_A, Entity_C),
	has_pet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_based_on(Entity_A, Entity_B) :- 
	based_on(Entity_A, Entity_C),
	based_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_sets_environment_variable(Entity_A, Entity_B) :- 
	sets_environment_variable(Entity_A, Entity_C),
	sets_environment_variable(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_may_prevent_disease(Entity_A, Entity_B) :- 
	may_prevent_disease(Entity_A, Entity_C),
	may_prevent_disease(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_a_number_of(Entity_A, Entity_B) :- 
	is_a_number_of(Entity_A, Entity_C),
	is_a_number_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_the_study_of(Entity_A, Entity_B) :- 
	is_the_study_of(Entity_A, Entity_C),
	is_the_study_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_appeals_to(Entity_A, Entity_B) :- 
	appeals_to(Entity_A, Entity_C),
	appeals_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_protected_area(Entity_A, Entity_B) :- 
	located_in_protected_area(Entity_A, Entity_C),
	located_in_protected_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_promoted(Entity_A, Entity_B) :- 
	promoted(Entity_A, Entity_C),
	promoted(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_inflows(Entity_A, Entity_B) :- 
	inflows(Entity_A, Entity_C),
	inflows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_appears_before_phonological_feature(Entity_A, Entity_B) :- 
	appears_before_phonological_feature(Entity_A, Entity_C),
	appears_before_phonological_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_role_in_modeling(Entity_A, Entity_B) :- 
	has_role_in_modeling(Entity_A, Entity_C),
	has_role_in_modeling(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_supplement_to(Entity_A, Entity_B) :- 
	supplement_to(Entity_A, Entity_C),
	supplement_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_announced_at(Entity_A, Entity_B) :- 
	announced_at(Entity_A, Entity_C),
	announced_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_powered_by(Entity_A, Entity_B) :- 
	powered_by(Entity_A, Entity_C),
	powered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_innervates(Entity_A, Entity_B) :- 
	innervates(Entity_A, Entity_C),
	innervates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_emulates(Entity_A, Entity_B) :- 
	emulates(Entity_A, Entity_C),
	emulates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_counts_instances_of(Entity_A, Entity_B) :- 
	counts_instances_of(Entity_A, Entity_C),
	counts_instances_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_time_zone(Entity_A, Entity_B) :- 
	located_in_time_zone(Entity_A, Entity_C),
	located_in_time_zone(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_inspired_by(Entity_A, Entity_B) :- 
	inspired_by(Entity_A, Entity_C),
	inspired_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_recto_of(Entity_A, Entity_B) :- 
	is_recto_of(Entity_A, Entity_C),
	is_recto_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_towards(Entity_A, Entity_B) :- 
	towards(Entity_A, Entity_C),
	towards(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_separated_from(Entity_A, Entity_B) :- 
	separated_from(Entity_A, Entity_C),
	separated_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_lyrics(Entity_A, Entity_B) :- 
	has_lyrics(Entity_A, Entity_C),
	has_lyrics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_gained_territory_from(Entity_A, Entity_B) :- 
	gained_territory_from(Entity_A, Entity_C),
	gained_territory_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_heir_or_beneficiary(Entity_A, Entity_B) :- 
	has_heir_or_beneficiary(Entity_A, Entity_C),
	has_heir_or_beneficiary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_indexed_in_bibliographic_review(Entity_A, Entity_B) :- 
	indexed_in_bibliographic_review(Entity_A, Entity_C),
	indexed_in_bibliographic_review(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_present_in_work(Entity_A, Entity_B) :- 
	present_in_work(Entity_A, Entity_C),
	present_in_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_written_for(Entity_A, Entity_B) :- 
	has_written_for(Entity_A, Entity_C),
	has_written_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_boundary(Entity_A, Entity_B) :- 
	has_boundary(Entity_A, Entity_C),
	has_boundary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_used_by(Entity_A, Entity_B) :- 
	used_by(Entity_A, Entity_C),
	used_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_applies_to_part(Entity_A, Entity_B) :- 
	applies_to_part(Entity_A, Entity_C),
	applies_to_part(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_followed_by(Entity_A, Entity_B) :- 
	followed_by(Entity_A, Entity_C),
	followed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_designed_by(Entity_A, Entity_B) :- 
	designed_by(Entity_A, Entity_C),
	designed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_influenced_by(Entity_A, Entity_B) :- 
	influenced_by(Entity_A, Entity_C),
	influenced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_verso_of(Entity_A, Entity_B) :- 
	is_verso_of(Entity_A, Entity_C),
	is_verso_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_innervated_by(Entity_A, Entity_B) :- 
	innervated_by(Entity_A, Entity_C),
	innervated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_unveiled_by(Entity_A, Entity_B) :- 
	unveiled_by(Entity_A, Entity_C),
	unveiled_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_gave_up_territory_to(Entity_A, Entity_B) :- 
	gave_up_territory_to(Entity_A, Entity_C),
	gave_up_territory_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_relative_to(Entity_A, Entity_B) :- 
	relative_to(Entity_A, Entity_C),
	relative_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_supervised_by(Entity_A, Entity_B) :- 
	supervised_by(Entity_A, Entity_C),
	supervised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_decays_to(Entity_A, Entity_B) :- 
	decays_to(Entity_A, Entity_C),
	decays_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_does_not_use(Entity_A, Entity_B) :- 
	does_not_use(Entity_A, Entity_C),
	does_not_use(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_takes_place_in_fictional_universe(Entity_A, Entity_B) :- 
	takes_place_in_fictional_universe(Entity_A, Entity_C),
	takes_place_in_fictional_universe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_maintained_by(Entity_A, Entity_B) :- 
	maintained_by(Entity_A, Entity_C),
	maintained_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_surface(Entity_A, Entity_B) :- 
	has_surface(Entity_A, Entity_C),
	has_surface(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_accredited_by(Entity_A, Entity_B) :- 
	accredited_by(Entity_A, Entity_C),
	accredited_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_moved_by(Entity_A, Entity_B) :- 
	moved_by(Entity_A, Entity_C),
	moved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_replaces(Entity_A, Entity_B) :- 
	replaces(Entity_A, Entity_C),
	replaces(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_outflows(Entity_A, Entity_B) :- 
	outflows(Entity_A, Entity_C),
	outflows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_object_has_role(Entity_A, Entity_B) :- 
	object_has_role(Entity_A, Entity_C),
	object_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_dedicated_to(Entity_A, Entity_B) :- 
	dedicated_to(Entity_A, Entity_C),
	dedicated_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_made_from_material(Entity_A, Entity_B) :- 
	made_from_material(Entity_A, Entity_C),
	made_from_material(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_donated_by(Entity_A, Entity_B) :- 
	donated_by(Entity_A, Entity_C),
	donated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_depicted_by(Entity_A, Entity_B) :- 
	depicted_by(Entity_A, Entity_C),
	depicted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_census(Entity_A, Entity_B) :- 
	has_census(Entity_A, Entity_C),
	has_census(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_does_not_have_effect(Entity_A, Entity_B) :- 
	does_not_have_effect(Entity_A, Entity_C),
	does_not_have_effect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_deprecated_in_version(Entity_A, Entity_B) :- 
	deprecated_in_version(Entity_A, Entity_C),
	deprecated_in_version(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_uses_capitalization_for(Entity_A, Entity_B) :- 
	uses_capitalization_for(Entity_A, Entity_C),
	uses_capitalization_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_elected_in(Entity_A, Entity_B) :- 
	elected_in(Entity_A, Entity_C),
	elected_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_reference_has_role(Entity_A, Entity_B) :- 
	reference_has_role(Entity_A, Entity_C),
	reference_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_solved_by(Entity_A, Entity_B) :- 
	solved_by(Entity_A, Entity_C),
	solved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_damaged(Entity_A, Entity_B) :- 
	damaged(Entity_A, Entity_C),
	damaged(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_derived_from_organism_type(Entity_A, Entity_B) :- 
	derived_from_organism_type(Entity_A, Entity_C),
	derived_from_organism_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_destroyed(Entity_A, Entity_B) :- 
	destroyed(Entity_A, Entity_C),
	destroyed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_does_not_have_cause(Entity_A, Entity_B) :- 
	does_not_have_cause(Entity_A, Entity_C),
	does_not_have_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_goal(Entity_A, Entity_B) :- 
	has_goal(Entity_A, Entity_C),
	has_goal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_less_than(Entity_A, Entity_B) :- 
	less_than(Entity_A, Entity_C),
	less_than(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_seconded_by(Entity_A, Entity_B) :- 
	seconded_by(Entity_A, Entity_C),
	seconded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_use(Entity_A, Entity_B) :- 
	has_use(Entity_A, Entity_C),
	has_use(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_applies_to_taxon(Entity_A, Entity_B) :- 
	applies_to_taxon(Entity_A, Entity_C),
	applies_to_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_operator(Entity_A, Entity_B) :- 
	has_operator(Entity_A, Entity_C),
	has_operator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_on_street(Entity_A, Entity_B) :- 
	located_on_street(Entity_A, Entity_C),
	located_on_street(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_or_next_to_body_of_water(Entity_A, Entity_B) :- 
	located_in_or_next_to_body_of_water(Entity_A, Entity_C),
	located_in_or_next_to_body_of_water(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_from_narrative_universe(Entity_A, Entity_B) :- 
	from_narrative_universe(Entity_A, Entity_C),
	from_narrative_universe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_retracted_by(Entity_A, Entity_B) :- 
	is_retracted_by(Entity_A, Entity_C),
	is_retracted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_beforehand_owned_by(Entity_A, Entity_B) :- 
	beforehand_owned_by(Entity_A, Entity_C),
	beforehand_owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_clerked_for(Entity_A, Entity_B) :- 
	clerked_for(Entity_A, Entity_C),
	clerked_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_contraindicated_in_case_of(Entity_A, Entity_B) :- 
	contraindicated_in_case_of(Entity_A, Entity_C),
	contraindicated_in_case_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_captured_with(Entity_A, Entity_B) :- 
	captured_with(Entity_A, Entity_C),
	captured_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_measures(Entity_A, Entity_B) :- 
	measures(Entity_A, Entity_C),
	measures(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_grammatical_person(Entity_A, Entity_B) :- 
	has_grammatical_person(Entity_A, Entity_C),
	has_grammatical_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_convicted_of(Entity_A, Entity_B) :- 
	convicted_of(Entity_A, Entity_C),
	convicted_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_phoneme(Entity_A, Entity_B) :- 
	has_phoneme(Entity_A, Entity_C),
	has_phoneme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_works_in_the_collection(Entity_A, Entity_B) :- 
	has_works_in_the_collection(Entity_A, Entity_C),
	has_works_in_the_collection(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_educated_at(Entity_A, Entity_B) :- 
	educated_at(Entity_A, Entity_C),
	educated_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_use_restriction_status(Entity_A, Entity_B) :- 
	use_restriction_status(Entity_A, Entity_C),
	use_restriction_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_bases_on_balls(Entity_A, Entity_B) :- 
	bases_on_balls(Entity_A, Entity_C),
	bases_on_balls(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_follows(Entity_A, Entity_B) :- 
	follows(Entity_A, Entity_C),
	follows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_set_during_recurring_event(Entity_A, Entity_B) :- 
	set_during_recurring_event(Entity_A, Entity_C),
	set_during_recurring_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_maintains_linking_to(Entity_A, Entity_B) :- 
	maintains_linking_to(Entity_A, Entity_C),
	maintains_linking_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_legislated_by(Entity_A, Entity_B) :- 
	legislated_by(Entity_A, Entity_C),
	legislated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_trained_by(Entity_A, Entity_B) :- 
	trained_by(Entity_A, Entity_C),
	trained_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_iconically_alludes_to(Entity_A, Entity_B) :- 
	iconically_alludes_to(Entity_A, Entity_C),
	iconically_alludes_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_transcribed_by(Entity_A, Entity_B) :- 
	transcribed_by(Entity_A, Entity_C),
	transcribed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_shown_with_features(Entity_A, Entity_B) :- 
	shown_with_features(Entity_A, Entity_C),
	shown_with_features(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_statistical_territorial_entity(Entity_A, Entity_B) :- 
	located_in_statistical_territorial_entity(Entity_A, Entity_C),
	located_in_statistical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_recovered_by(Entity_A, Entity_B) :- 
	recovered_by(Entity_A, Entity_C),
	recovered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_template_has_topic(Entity_A, Entity_B) :- 
	template_has_topic(Entity_A, Entity_C),
	template_has_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_enclosure(Entity_A, Entity_B) :- 
	enclosure(Entity_A, Entity_C),
	enclosure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_vertex_figure(Entity_A, Entity_B) :- 
	has_vertex_figure(Entity_A, Entity_C),
	has_vertex_figure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_crosses(Entity_A, Entity_B) :- 
	crosses(Entity_A, Entity_C),
	crosses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_conferred_by(Entity_A, Entity_B) :- 
	conferred_by(Entity_A, Entity_C),
	conferred_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_valid_in_period(Entity_A, Entity_B) :- 
	valid_in_period(Entity_A, Entity_C),
	valid_in_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_offers_view_on(Entity_A, Entity_B) :- 
	offers_view_on(Entity_A, Entity_C),
	offers_view_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_produced_by(Entity_A, Entity_B) :- 
	produced_by(Entity_A, Entity_C),
	produced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_had_as_last_meal(Entity_A, Entity_B) :- 
	had_as_last_meal(Entity_A, Entity_C),
	had_as_last_meal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_named_by(Entity_A, Entity_B) :- 
	named_by(Entity_A, Entity_C),
	named_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_listed_ingredient(Entity_A, Entity_B) :- 
	has_listed_ingredient(Entity_A, Entity_C),
	has_listed_ingredient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_reads_environment_variable(Entity_A, Entity_B) :- 
	reads_environment_variable(Entity_A, Entity_C),
	reads_environment_variable(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_owned_by(Entity_A, Entity_B) :- 
	owned_by(Entity_A, Entity_C),
	owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_depicts(Entity_A, Entity_B) :- 
	depicts(Entity_A, Entity_C),
	depicts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_spin_off(Entity_A, Entity_B) :- 
	has_spin_off(Entity_A, Entity_C),
	has_spin_off(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_subsidiary(Entity_A, Entity_B) :- 
	has_subsidiary(Entity_A, Entity_C),
	has_subsidiary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_carries_scientific_instrument(Entity_A, Entity_B) :- 
	carries_scientific_instrument(Entity_A, Entity_C),
	carries_scientific_instrument(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_creates_lexeme_type(Entity_A, Entity_B) :- 
	creates_lexeme_type(Entity_A, Entity_C),
	creates_lexeme_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_theorised_by(Entity_A, Entity_B) :- 
	theorised_by(Entity_A, Entity_C),
	theorised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_characteristic(Entity_A, Entity_B) :- 
	has_characteristic(Entity_A, Entity_C),
	has_characteristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_won_sets(Entity_A, Entity_B) :- 
	won_sets(Entity_A, Entity_C),
	won_sets(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_wears(Entity_A, Entity_B) :- 
	wears(Entity_A, Entity_C),
	wears(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_recorded_at_studio_or_venue(Entity_A, Entity_B) :- 
	recorded_at_studio_or_venue(Entity_A, Entity_C),
	recorded_at_studio_or_venue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_grants(Entity_A, Entity_B) :- 
	grants(Entity_A, Entity_C),
	grants(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_item_inherits_statement_from(Entity_A, Entity_B) :- 
	item_inherits_statement_from(Entity_A, Entity_C),
	item_inherits_statement_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_part_s_(Entity_A, Entity_B) :- 
	has_part_s_(Entity_A, Entity_C),
	has_part_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_subject_has_role(Entity_A, Entity_B) :- 
	subject_has_role(Entity_A, Entity_C),
	subject_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_pattern(Entity_A, Entity_B) :- 
	has_pattern(Entity_A, Entity_C),
	has_pattern(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_contains(Entity_A, Entity_B) :- 
	contains(Entity_A, Entity_C),
	contains(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_the_ecclesiastical_territorial_entity(Entity_A, Entity_B) :- 
	located_in_the_ecclesiastical_territorial_entity(Entity_A, Entity_C),
	located_in_the_ecclesiastical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_shares_border_with(Entity_A, Entity_B) :- 
	shares_border_with(Entity_A, Entity_C),
	shares_border_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_worn_by(Entity_A, Entity_B) :- 
	worn_by(Entity_A, Entity_C),
	worn_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_in_work(Entity_A, Entity_B) :- 
	in_work(Entity_A, Entity_C),
	in_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_funded_by_grant(Entity_A, Entity_B) :- 
	funded_by_grant(Entity_A, Entity_C),
	funded_by_grant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_permits(Entity_A, Entity_B) :- 
	permits(Entity_A, Entity_C),
	permits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_merged_into(Entity_A, Entity_B) :- 
	merged_into(Entity_A, Entity_C),
	merged_into(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_invasive_to(Entity_A, Entity_B) :- 
	invasive_to(Entity_A, Entity_C),
	invasive_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_requires_grammatical_feature(Entity_A, Entity_B) :- 
	requires_grammatical_feature(Entity_A, Entity_C),
	requires_grammatical_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_edition_or_translation(Entity_A, Entity_B) :- 
	has_edition_or_translation(Entity_A, Entity_C),
	has_edition_or_translation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_appears_in_the_form_of(Entity_A, Entity_B) :- 
	appears_in_the_form_of(Entity_A, Entity_C),
	appears_in_the_form_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_thematic_relation(Entity_A, Entity_B) :- 
	has_thematic_relation(Entity_A, Entity_C),
	has_thematic_relation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_part_s_of_the_class(Entity_A, Entity_B) :- 
	has_part_s_of_the_class(Entity_A, Entity_C),
	has_part_s_of_the_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_drafted_by(Entity_A, Entity_B) :- 
	drafted_by(Entity_A, Entity_C),
	drafted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_evaluation(Entity_A, Entity_B) :- 
	has_evaluation(Entity_A, Entity_C),
	has_evaluation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_broadcast_by(Entity_A, Entity_B) :- 
	broadcast_by(Entity_A, Entity_C),
	broadcast_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_encodes(Entity_A, Entity_B) :- 
	encodes(Entity_A, Entity_C),
	encodes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_adapted_by(Entity_A, Entity_B) :- 
	adapted_by(Entity_A, Entity_C),
	adapted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_appears_after_phonological_feature(Entity_A, Entity_B) :- 
	appears_after_phonological_feature(Entity_A, Entity_C),
	appears_after_phonological_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_reply_to(Entity_A, Entity_B) :- 
	reply_to(Entity_A, Entity_C),
	reply_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_afflicts(Entity_A, Entity_B) :- 
	afflicts(Entity_A, Entity_C),
	afflicts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_symbolizes(Entity_A, Entity_B) :- 
	symbolizes(Entity_A, Entity_C),
	symbolizes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_a_list_of(Entity_A, Entity_B) :- 
	is_a_list_of(Entity_A, Entity_C),
	is_a_list_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_computes_solution_to(Entity_A, Entity_B) :- 
	computes_solution_to(Entity_A, Entity_C),
	computes_solution_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_program_committee_member(Entity_A, Entity_B) :- 
	has_program_committee_member(Entity_A, Entity_C),
	has_program_committee_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_connects_with(Entity_A, Entity_B) :- 
	connects_with(Entity_A, Entity_C),
	connects_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_use_with_property_value(Entity_A, Entity_B) :- 
	use_with_property_value(Entity_A, Entity_C),
	use_with_property_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_represented_by(Entity_A, Entity_B) :- 
	represented_by(Entity_A, Entity_C),
	represented_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_pollinated_by(Entity_A, Entity_B) :- 
	is_pollinated_by(Entity_A, Entity_C),
	is_pollinated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_index_case(Entity_A, Entity_B) :- 
	has_index_case(Entity_A, Entity_C),
	has_index_case(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_superpartner(Entity_A, Entity_B) :- 
	has_superpartner(Entity_A, Entity_C),
	has_superpartner(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_distributed_by(Entity_A, Entity_B) :- 
	distributed_by(Entity_A, Entity_C),
	distributed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_structure_replaces(Entity_A, Entity_B) :- 
	structure_replaces(Entity_A, Entity_C),
	structure_replaces(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_develops_from(Entity_A, Entity_B) :- 
	develops_from(Entity_A, Entity_C),
	develops_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_overrules(Entity_A, Entity_B) :- 
	overrules(Entity_A, Entity_C),
	overrules(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_item_disputed_by(Entity_A, Entity_B) :- 
	item_disputed_by(Entity_A, Entity_C),
	item_disputed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_marker(Entity_A, Entity_B) :- 
	has_marker(Entity_A, Entity_C),
	has_marker(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_applies_to_work(Entity_A, Entity_B) :- 
	applies_to_work(Entity_A, Entity_C),
	applies_to_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_distributed_from(Entity_A, Entity_B) :- 
	distributed_from(Entity_A, Entity_C),
	distributed_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_invariant_under(Entity_A, Entity_B) :- 
	is_invariant_under(Entity_A, Entity_C),
	is_invariant_under(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_found_in_taxon(Entity_A, Entity_B) :- 
	found_in_taxon(Entity_A, Entity_C),
	found_in_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_designated_as_terrorist_by(Entity_A, Entity_B) :- 
	designated_as_terrorist_by(Entity_A, Entity_C),
	designated_as_terrorist_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_commemorates(Entity_A, Entity_B) :- 
	commemorates(Entity_A, Entity_C),
	commemorates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_issued_by(Entity_A, Entity_B) :- 
	issued_by(Entity_A, Entity_C),
	issued_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_biological_vector(Entity_A, Entity_B) :- 
	has_biological_vector(Entity_A, Entity_C),
	has_biological_vector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_facet_polytope(Entity_A, Entity_B) :- 
	has_facet_polytope(Entity_A, Entity_C),
	has_facet_polytope(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_certification(Entity_A, Entity_B) :- 
	has_certification(Entity_A, Entity_C),
	has_certification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_active_ingredient(Entity_A, Entity_B) :- 
	has_active_ingredient(Entity_A, Entity_C),
	has_active_ingredient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_in_opposition_to(Entity_A, Entity_B) :- 
	in_opposition_to(Entity_A, Entity_C),
	in_opposition_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_compatible_with(Entity_A, Entity_B) :- 
	compatible_with(Entity_A, Entity_C),
	compatible_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_dual_to(Entity_A, Entity_B) :- 
	dual_to(Entity_A, Entity_C),
	dual_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_members_have_occupation(Entity_A, Entity_B) :- 
	members_have_occupation(Entity_A, Entity_C),
	members_have_occupation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_endorsed_by(Entity_A, Entity_B) :- 
	endorsed_by(Entity_A, Entity_C),
	endorsed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_charted_in(Entity_A, Entity_B) :- 
	charted_in(Entity_A, Entity_C),
	charted_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_relegated(Entity_A, Entity_B) :- 
	relegated(Entity_A, Entity_C),
	relegated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_holds_diplomatic_passport_of(Entity_A, Entity_B) :- 
	holds_diplomatic_passport_of(Entity_A, Entity_C),
	holds_diplomatic_passport_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_total_produced(Entity_A, Entity_B) :- 
	total_produced(Entity_A, Entity_C),
	total_produced(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_contains_the_administrative_territorial_entity(Entity_A, Entity_B) :- 
	contains_the_administrative_territorial_entity(Entity_A, Entity_C),
	contains_the_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_seal_badge_or_sigil(Entity_A, Entity_B) :- 
	has_seal_badge_or_sigil(Entity_A, Entity_C),
	has_seal_badge_or_sigil(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_nominated_by(Entity_A, Entity_B) :- 
	nominated_by(Entity_A, Entity_C),
	nominated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_archives_at(Entity_A, Entity_B) :- 
	archives_at(Entity_A, Entity_C),
	archives_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_display_technology(Entity_A, Entity_B) :- 
	display_technology(Entity_A, Entity_C),
	display_technology(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_quality_is_the_result_of_process(Entity_A, Entity_B) :- 
	quality_is_the_result_of_process(Entity_A, Entity_C),
	quality_is_the_result_of_process(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_inferred_from(Entity_A, Entity_B) :- 
	inferred_from(Entity_A, Entity_C),
	inferred_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_expressed_in(Entity_A, Entity_B) :- 
	expressed_in(Entity_A, Entity_C),
	expressed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_facility(Entity_A, Entity_B) :- 
	has_facility(Entity_A, Entity_C),
	has_facility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_graphical_element(Entity_A, Entity_B) :- 
	has_graphical_element(Entity_A, Entity_C),
	has_graphical_element(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_immediate_cause(Entity_A, Entity_B) :- 
	has_immediate_cause(Entity_A, Entity_C),
	has_immediate_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_runs_batted_in(Entity_A, Entity_B) :- 
	runs_batted_in(Entity_A, Entity_C),
	runs_batted_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_metaclass_for(Entity_A, Entity_B) :- 
	is_metaclass_for(Entity_A, Entity_C),
	is_metaclass_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_commanded_by(Entity_A, Entity_B) :- 
	commanded_by(Entity_A, Entity_C),
	commanded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_encoded_by(Entity_A, Entity_B) :- 
	encoded_by(Entity_A, Entity_C),
	encoded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_uncertainty_corresponds_to(Entity_A, Entity_B) :- 
	uncertainty_corresponds_to(Entity_A, Entity_C),
	uncertainty_corresponds_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_published_in(Entity_A, Entity_B) :- 
	published_in(Entity_A, Entity_C),
	published_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_this_zoological_name_is_coordinate_with(Entity_A, Entity_B) :- 
	this_zoological_name_is_coordinate_with(Entity_A, Entity_C),
	this_zoological_name_is_coordinate_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_column(Entity_A, Entity_B) :- 
	has_column(Entity_A, Entity_C),
	has_column(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_prohibits(Entity_A, Entity_B) :- 
	prohibits(Entity_A, Entity_C),
	prohibits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_interested_in(Entity_A, Entity_B) :- 
	interested_in(Entity_A, Entity_C),
	interested_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_enclave_within(Entity_A, Entity_B) :- 
	enclave_within(Entity_A, Entity_C),
	enclave_within(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_does_not_have_part(Entity_A, Entity_B) :- 
	does_not_have_part(Entity_A, Entity_C),
	does_not_have_part(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_conjugation_class(Entity_A, Entity_B) :- 
	has_conjugation_class(Entity_A, Entity_C),
	has_conjugation_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_sorting(Entity_A, Entity_B) :- 
	has_sorting(Entity_A, Entity_C),
	has_sorting(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_colocated_with(Entity_A, Entity_B) :- 
	colocated_with(Entity_A, Entity_C),
	colocated_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_introduced_in(Entity_A, Entity_B) :- 
	introduced_in(Entity_A, Entity_C),
	introduced_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_visited_by(Entity_A, Entity_B) :- 
	visited_by(Entity_A, Entity_C),
	visited_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_founded_by(Entity_A, Entity_B) :- 
	founded_by(Entity_A, Entity_C),
	founded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_represents(Entity_A, Entity_B) :- 
	represents(Entity_A, Entity_C),
	represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_natural_reservoir(Entity_A, Entity_B) :- 
	has_natural_reservoir(Entity_A, Entity_C),
	has_natural_reservoir(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_beats_per_minute(Entity_A, Entity_B) :- 
	beats_per_minute(Entity_A, Entity_C),
	beats_per_minute(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_grammatical_case(Entity_A, Entity_B) :- 
	has_grammatical_case(Entity_A, Entity_C),
	has_grammatical_case(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_digitised_by(Entity_A, Entity_B) :- 
	digitised_by(Entity_A, Entity_C),
	digitised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_ratified_by(Entity_A, Entity_B) :- 
	ratified_by(Entity_A, Entity_C),
	ratified_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_practiced_by(Entity_A, Entity_B) :- 
	practiced_by(Entity_A, Entity_C),
	practiced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_points_for(Entity_A, Entity_B) :- 
	points_for(Entity_A, Entity_C),
	points_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_possessed_by_spirit(Entity_A, Entity_B) :- 
	possessed_by_spirit(Entity_A, Entity_C),
	possessed_by_spirit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_the_administrative_territorial_entity(Entity_A, Entity_B) :- 
	located_in_the_administrative_territorial_entity(Entity_A, Entity_C),
	located_in_the_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_grammatical_gender(Entity_A, Entity_B) :- 
	has_grammatical_gender(Entity_A, Entity_C),
	has_grammatical_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_repeals(Entity_A, Entity_B) :- 
	repeals(Entity_A, Entity_C),
	repeals(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_fruit_type(Entity_A, Entity_B) :- 
	has_fruit_type(Entity_A, Entity_C),
	has_fruit_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_named_after(Entity_A, Entity_B) :- 
	named_after(Entity_A, Entity_C),
	named_after(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_approved_by(Entity_A, Entity_B) :- 
	approved_by(Entity_A, Entity_C),
	approved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_phenotype(Entity_A, Entity_B) :- 
	has_phenotype(Entity_A, Entity_C),
	has_phenotype(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_matched_by_identifier_from(Entity_A, Entity_B) :- 
	matched_by_identifier_from(Entity_A, Entity_C),
	matched_by_identifier_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_mandates(Entity_A, Entity_B) :- 
	mandates(Entity_A, Entity_C),
	mandates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_first_performance_by(Entity_A, Entity_B) :- 
	first_performance_by(Entity_A, Entity_C),
	first_performance_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_cabinet(Entity_A, Entity_B) :- 
	has_cabinet(Entity_A, Entity_C),
	has_cabinet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_studied_in(Entity_A, Entity_B) :- 
	studied_in(Entity_A, Entity_C),
	studied_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_does_not_have_characteristic(Entity_A, Entity_B) :- 
	does_not_have_characteristic(Entity_A, Entity_C),
	does_not_have_characteristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_motif_represents(Entity_A, Entity_B) :- 
	motif_represents(Entity_A, Entity_C),
	motif_represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_after_a_work_by(Entity_A, Entity_B) :- 
	after_a_work_by(Entity_A, Entity_C),
	after_a_work_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_excluding(Entity_A, Entity_B) :- 
	excluding(Entity_A, Entity_C),
	excluding(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_stated_in_source_according_to(Entity_A, Entity_B) :- 
	stated_in_source_according_to(Entity_A, Entity_C),
	stated_in_source_according_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_programmed_in(Entity_A, Entity_B) :- 
	programmed_in(Entity_A, Entity_C),
	programmed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_calculated_from(Entity_A, Entity_B) :- 
	calculated_from(Entity_A, Entity_C),
	calculated_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_applies_to_people(Entity_A, Entity_B) :- 
	applies_to_people(Entity_A, Entity_C),
	applies_to_people(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_commissioned_by(Entity_A, Entity_B) :- 
	commissioned_by(Entity_A, Entity_C),
	commissioned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_worshipped_by(Entity_A, Entity_B) :- 
	worshipped_by(Entity_A, Entity_C),
	worshipped_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_complies_with(Entity_A, Entity_B) :- 
	complies_with(Entity_A, Entity_C),
	complies_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_nominated_for(Entity_A, Entity_B) :- 
	nominated_for(Entity_A, Entity_C),
	nominated_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_contains_the_statistical_territorial_entity(Entity_A, Entity_B) :- 
	contains_the_statistical_territorial_entity(Entity_A, Entity_C),
	contains_the_statistical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_not_found_in(Entity_A, Entity_B) :- 
	not_found_in(Entity_A, Entity_C),
	not_found_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_killed_by(Entity_A, Entity_B) :- 
	killed_by(Entity_A, Entity_C),
	killed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_melody(Entity_A, Entity_B) :- 
	has_melody(Entity_A, Entity_C),
	has_melody(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_in_operation_on_service(Entity_A, Entity_B) :- 
	in_operation_on_service(Entity_A, Entity_C),
	in_operation_on_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_set_in_environment(Entity_A, Entity_B) :- 
	set_in_environment(Entity_A, Entity_C),
	set_in_environment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_afterward_owned_by(Entity_A, Entity_B) :- 
	afterward_owned_by(Entity_A, Entity_C),
	afterward_owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_said_to_be_the_same_as(Entity_A, Entity_B) :- 
	said_to_be_the_same_as(Entity_A, Entity_C),
	said_to_be_the_same_as(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_described_by_source(Entity_A, Entity_B) :- 
	described_by_source(Entity_A, Entity_C),
	described_by_source(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_amended_by(Entity_A, Entity_B) :- 
	amended_by(Entity_A, Entity_C),
	amended_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_typically_sells(Entity_A, Entity_B) :- 
	typically_sells(Entity_A, Entity_C),
	typically_sells(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_greater_than(Entity_A, Entity_B) :- 
	greater_than(Entity_A, Entity_C),
	greater_than(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_coextensive_with(Entity_A, Entity_B) :- 
	coextensive_with(Entity_A, Entity_C),
	coextensive_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_the_present_day_administrative_territorial_entity(Entity_A, Entity_B) :- 
	located_in_the_present_day_administrative_territorial_entity(Entity_A, Entity_C),
	located_in_the_present_day_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_printed_by(Entity_A, Entity_B) :- 
	printed_by(Entity_A, Entity_C),
	printed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_inflection_class(Entity_A, Entity_B) :- 
	has_inflection_class(Entity_A, Entity_C),
	has_inflection_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_proceedings_from(Entity_A, Entity_B) :- 
	is_proceedings_from(Entity_A, Entity_C),
	is_proceedings_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_established_from_medical_condition(Entity_A, Entity_B) :- 
	established_from_medical_condition(Entity_A, Entity_C),
	established_from_medical_condition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_force(Entity_A, Entity_B) :- 
	force(Entity_A, Entity_C),
	force(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_set_in_period(Entity_A, Entity_B) :- 
	set_in_period(Entity_A, Entity_C),
	set_in_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_replaced_by(Entity_A, Entity_B) :- 
	replaced_by(Entity_A, Entity_C),
	replaced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_contributing_factor(Entity_A, Entity_B) :- 
	has_contributing_factor(Entity_A, Entity_C),
	has_contributing_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_licensed_to_broadcast_to(Entity_A, Entity_B) :- 
	licensed_to_broadcast_to(Entity_A, Entity_C),
	licensed_to_broadcast_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_repealed_by(Entity_A, Entity_B) :- 
	repealed_by(Entity_A, Entity_C),
	repealed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_forgery_after(Entity_A, Entity_B) :- 
	forgery_after(Entity_A, Entity_C),
	forgery_after(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_grouping(Entity_A, Entity_B) :- 
	has_grouping(Entity_A, Entity_C),
	has_grouping(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_effect(Entity_A, Entity_B) :- 
	has_effect(Entity_A, Entity_C),
	has_effect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_on_astronomical_body(Entity_A, Entity_B) :- 
	located_on_astronomical_body(Entity_A, Entity_C),
	located_on_astronomical_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_cover_art_by(Entity_A, Entity_B) :- 
	cover_art_by(Entity_A, Entity_C),
	cover_art_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_investigated_by(Entity_A, Entity_B) :- 
	investigated_by(Entity_A, Entity_C),
	investigated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_anatomical_branch(Entity_A, Entity_B) :- 
	has_anatomical_branch(Entity_A, Entity_C),
	has_anatomical_branch(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_created_for(Entity_A, Entity_B) :- 
	created_for(Entity_A, Entity_C),
	created_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_handled_mitigated_or_managed_by(Entity_A, Entity_B) :- 
	handled_mitigated_or_managed_by(Entity_A, Entity_C),
	handled_mitigated_or_managed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_physically_interacts_with(Entity_A, Entity_B) :- 
	physically_interacts_with(Entity_A, Entity_C),
	physically_interacts_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_including(Entity_A, Entity_B) :- 
	including(Entity_A, Entity_C),
	including(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_symbol_represents(Entity_A, Entity_B) :- 
	symbol_represents(Entity_A, Entity_C),
	symbol_represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_officially_opened_by(Entity_A, Entity_B) :- 
	officially_opened_by(Entity_A, Entity_C),
	officially_opened_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_supports_programming_language(Entity_A, Entity_B) :- 
	supports_programming_language(Entity_A, Entity_C),
	supports_programming_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_presented_in(Entity_A, Entity_B) :- 
	presented_in(Entity_A, Entity_C),
	presented_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_tense(Entity_A, Entity_B) :- 
	has_tense(Entity_A, Entity_C),
	has_tense(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_simulates(Entity_A, Entity_B) :- 
	simulates(Entity_A, Entity_C),
	simulates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_conflict(Entity_A, Entity_B) :- 
	conflict(Entity_A, Entity_C),
	conflict(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_reports_to(Entity_A, Entity_B) :- 
	reports_to(Entity_A, Entity_C),
	reports_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_grammatical_mood(Entity_A, Entity_B) :- 
	has_grammatical_mood(Entity_A, Entity_C),
	has_grammatical_mood(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_based_on_heuristic(Entity_A, Entity_B) :- 
	based_on_heuristic(Entity_A, Entity_C),
	based_on_heuristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_observed_in(Entity_A, Entity_B) :- 
	observed_in(Entity_A, Entity_C),
	observed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_ordered_by(Entity_A, Entity_B) :- 
	ordered_by(Entity_A, Entity_C),
	ordered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_is_pollinator_of(Entity_A, Entity_B) :- 
	is_pollinator_of(Entity_A, Entity_C),
	is_pollinator_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_on_linear_feature(Entity_A, Entity_B) :- 
	located_on_linear_feature(Entity_A, Entity_C),
	located_on_linear_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_officialized_by(Entity_A, Entity_B) :- 
	officialized_by(Entity_A, Entity_C),
	officialized_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_located_in_on_physical_feature(Entity_A, Entity_B) :- 
	located_in_on_physical_feature(Entity_A, Entity_C),
	located_in_on_physical_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_reviewed_by(Entity_A, Entity_B) :- 
	reviewed_by(Entity_A, Entity_C),
	reviewed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_has_cause(Entity_A, Entity_B) :- 
	has_cause(Entity_A, Entity_C),
	has_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
same_spoken_by(Entity_A, Entity_B) :- 
	spoken_by(Entity_A, Entity_C),
	spoken_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.
