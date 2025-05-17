be_the_cabinet_of(Entity_A, Entity_B) :- 
	stated_in_source_according_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_judge_with_the_clerk_of(Entity_A, Entity_B) :- 
	has_heir_or_beneficiary(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_alma_mater_of(Entity_A, Entity_B) :- 
	educated_at(Entity_B, Entity_A),
	Entity_A \= Entity_B.
before_the_significant_event_own(Entity_A, Entity_B) :- 
	iconically_alludes_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
inspires(Entity_A, Entity_B) :- 
	inspired_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
bring_power_to(Entity_A, Entity_B) :- 
	powered_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_background_era_of(Entity_A, Entity_B) :- 
	has_superpartner(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_afflicted_by(Entity_A, Entity_B) :- 
	afflicts(Entity_B, Entity_A),
	Entity_A \= Entity_B.
inspires_the_following_work(Entity_A, Entity_B) :- 
	forgery_after(Entity_B, Entity_A),
	Entity_A \= Entity_B.
worship_to(Entity_A, Entity_B) :- 
	worshipped_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_facet_polytope_of(Entity_A, Entity_B) :- 
	has_facet_polytope(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_used_to_make(Entity_A, Entity_B) :- 
	made_from_material(Entity_B, Entity_A),
	Entity_A \= Entity_B.
legislate(Entity_A, Entity_B) :- 
	legislated_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
design_cover_art_for(Entity_A, Entity_B) :- 
	cover_art_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_part_of_facility_of(Entity_A, Entity_B) :- 
	has_facility(Entity_B, Entity_A),
	Entity_A \= Entity_B.
hold_the_archives_of(Entity_A, Entity_B) :- 
	archives_at(Entity_B, Entity_A),
	Entity_A \= Entity_B.
adapt(Entity_A, Entity_B) :- 
	less_than(Entity_B, Entity_A),
	Entity_A \= Entity_B.
relegate(Entity_A, Entity_B) :- 
	produced_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
protected_area_contains(Entity_A, Entity_B) :- 
	promoted(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_produced_by(Entity_A, Entity_B) :- 
	total_produced(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_pollinated_by(Entity_A, Entity_B) :- 
	has_vertex_figure(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_viewed_by(Entity_A, Entity_B) :- 
	repeals(Entity_B, Entity_A),
	Entity_A \= Entity_B.
donate_to(Entity_A, Entity_B) :- 
	donated_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_phoneme_of(Entity_A, Entity_B) :- 
	measures(Entity_B, Entity_A),
	Entity_A \= Entity_B.
has_a_feature_located_on_it_called(Entity_A, Entity_B) :- 
	located_on_astronomical_body(Entity_B, Entity_A),
	Entity_A \= Entity_B.
kills(Entity_A, Entity_B) :- 
	killed_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
contains(Entity_A, Entity_B) :- 
	located_in_on_physical_feature(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_distributor_of_the_work_(Entity_A, Entity_B) :- 
	distributed_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_spin_off_of(Entity_A, Entity_B) :- 
	issued_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_street_contains_(Entity_A, Entity_B) :- 
	located_on_street(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_grammatical_mood_of(Entity_A, Entity_B) :- 
	does_not_have_part(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_under_jurisdiction_by(Entity_A, Entity_B) :- 
	applies_to_jurisdiction(Entity_B, Entity_A),
	Entity_A \= Entity_B.
prints(Entity_A, Entity_B) :- 
	printed_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_antecedent_anatomical_structure_of(Entity_A, Entity_B) :- 
	damaged(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_official_seal_badge_or_sigil_of_(Entity_A, Entity_B) :- 
	has_seal_badge_or_sigil(Entity_B, Entity_A),
	Entity_A \= Entity_B.
draft(Entity_A, Entity_B) :- 
	drafted_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
get_the_appeal_from(Entity_A, Entity_B) :- 
	simulates(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_heir_or_beneficiary_of(Entity_A, Entity_B) :- 
	first_performance_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_invaded_by(Entity_A, Entity_B) :- 
	grants(Entity_B, Entity_A),
	Entity_A \= Entity_B.
commission(Entity_A, Entity_B) :- 
	commissioned_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
record(Entity_A, Entity_B) :- 
	recorded_at_studio_or_venue(Entity_B, Entity_A),
	Entity_A \= Entity_B.
nominate_to(Entity_A, Entity_B) :- 
	licensed_to_broadcast_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
influence(Entity_A, Entity_B) :- 
	influenced_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_anatomical_branch_of(Entity_A, Entity_B) :- 
	offers_view_on(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_pollinator_of(Entity_A, Entity_B) :- 
	has_index_case(Entity_B, Entity_A),
	Entity_A \= Entity_B.
narrative_universe_contains(Entity_A, Entity_B) :- 
	from_narrative_universe(Entity_B, Entity_A),
	Entity_A \= Entity_B.
officially_open(Entity_A, Entity_B) :- 
	officially_opened_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_use_of(Entity_A, Entity_B) :- 
	has_use(Entity_B, Entity_A),
	Entity_A \= Entity_B.
elects(Entity_A, Entity_B) :- 
	reply_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
visit(Entity_A, Entity_B) :- 
	holds_diplomatic_passport_of(Entity_B, Entity_A),
	Entity_A \= Entity_B.
maintain(Entity_A, Entity_B) :- 
	maintained_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
transcribe(Entity_A, Entity_B) :- 
	has_biological_vector(Entity_B, Entity_A),
	Entity_A \= Entity_B.
supports_for(Entity_A, Entity_B) :- 
	has_effect(Entity_B, Entity_A),
	Entity_A \= Entity_B.
confer_to(Entity_A, Entity_B) :- 
	conferred_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
technology_displayed_by(Entity_A, Entity_B) :- 
	officialized_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
solve_the_scientific_question_of(Entity_A, Entity_B) :- 
	solved_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_granted_to(Entity_A, Entity_B) :- 
	has_conjugation_class(Entity_B, Entity_A),
	Entity_A \= Entity_B.
keep_the_same_of(Entity_A, Entity_B) :- 
	clerked_for(Entity_B, Entity_A),
	Entity_A \= Entity_B.
design(Entity_A, Entity_B) :- 
	designed_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_carried_on_the_scientific_equipment_of(Entity_A, Entity_B) :- 
	carries_scientific_instrument(Entity_B, Entity_A),
	Entity_A \= Entity_B.
have_the_first_performance_of_the_work(Entity_A, Entity_B) :- 
	afterward_owned_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
whose_body_of_water_is_located_next_to(Entity_A, Entity_B) :- 
	located_in_or_next_to_body_of_water(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_pet_of(Entity_A, Entity_B) :- 
	template_has_topic(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_fictional_universe_happened_to_meet(Entity_A, Entity_B) :- 
	published_in(Entity_B, Entity_A),
	Entity_A \= Entity_B.
have_the_character_of(Entity_A, Entity_B) :- 
	takes_place_in_fictional_universe(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_administrative_territorial_entity_is_part_of(Entity_A, Entity_B) :- 
	contains_the_administrative_territorial_entity(Entity_B, Entity_A),
	Entity_A \= Entity_B.
represents(Entity_A, Entity_B) :- 
	beats_per_minute(Entity_B, Entity_A),
	Entity_A \= Entity_B.
produces(Entity_A, Entity_B) :- 
	elected_in(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_weared_by(Entity_A, Entity_B) :- 
	designated_as_terrorist_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_a_subsidiary_of(Entity_A, Entity_B) :- 
	has_subsidiary(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_produced_by_the_decay_of(Entity_A, Entity_B) :- 
	decays_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_tense_of(Entity_A, Entity_B) :- 
	recovered_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
programming_language_supported_by(Entity_A, Entity_B) :- 
	located_in_the_present_day_administrative_territorial_entity(Entity_B, Entity_A),
	Entity_A \= Entity_B.
unveils(Entity_A, Entity_B) :- 
	has_melody(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_natural_reservoir_in(Entity_A, Entity_B) :- 
	has_characteristic(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_solution_to(Entity_A, Entity_B) :- 
	investigated_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_conflict_had_the_participant(Entity_A, Entity_B) :- 
	conflict(Entity_B, Entity_A),
	Entity_A \= Entity_B.
broadcast(Entity_A, Entity_B) :- 
	innervated_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
promote(Entity_A, Entity_B) :- 
	connects_with(Entity_B, Entity_A),
	Entity_A \= Entity_B.
settlement_located_in(Entity_A, Entity_B) :- 
	replaced_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_gene_encode_the_product_of(Entity_A, Entity_B) :- 
	encoded_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
after_a_significant_event_own_(Entity_A, Entity_B) :- 
	matched_by_identifier_from(Entity_B, Entity_A),
	Entity_A \= Entity_B.
give_the_license_to_broadcast_in_(Entity_A, Entity_B) :- 
	convicted_of(Entity_B, Entity_A),
	Entity_A \= Entity_B.
contains_the_enclave(Entity_A, Entity_B) :- 
	enclave_within(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_commemorated_by(Entity_A, Entity_B) :- 
	commemorates(Entity_B, Entity_A),
	Entity_A \= Entity_B.
linear_feature_contains(Entity_A, Entity_B) :- 
	located_on_linear_feature(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_patient_zero_of(Entity_A, Entity_B) :- 
	unveiled_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_active_ingredient_of(Entity_A, Entity_B) :- 
	inferred_from(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_crime_committed_by(Entity_A, Entity_B) :- 
	structure_replaces(Entity_B, Entity_A),
	Entity_A \= Entity_B.
excluded(Entity_A, Entity_B) :- 
	excluding(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_physical_quantity_of(Entity_A, Entity_B) :- 
	amended_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
found(Entity_A, Entity_B) :- 
	founded_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
structure_replaced_by(Entity_A, Entity_B) :- 
	contains_settlement(Entity_B, Entity_A),
	Entity_A \= Entity_B.
chart_the_work_od(Entity_A, Entity_B) :- 
	after_a_work_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
included(Entity_A, Entity_B) :- 
	including(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_time_zone_of(Entity_A, Entity_B) :- 
	located_in_time_zone(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_cause_of(Entity_A, Entity_B) :- 
	has_cause(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_melody_of(Entity_A, Entity_B) :- 
	has_natural_reservoir(Entity_B, Entity_A),
	Entity_A \= Entity_B.
approve(Entity_A, Entity_B) :- 
	approved_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
own(Entity_A, Entity_B) :- 
	owned_by(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_separated_into(Entity_A, Entity_B) :- 
	separated_from(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_encoded_by(Entity_A, Entity_B) :- 
	encodes(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_dedicatee_of(Entity_A, Entity_B) :- 
	dedicated_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
flows_out_of_(Entity_A, Entity_B) :- 
	outflows(Entity_B, Entity_A),
	Entity_A \= Entity_B.
express(Entity_A, Entity_B) :- 
	has_pattern(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_used_to_develop(Entity_A, Entity_B) :- 
	programmed_in(Entity_B, Entity_A),
	Entity_A \= Entity_B.
the_administrative_territorial_entity_contains(Entity_A, Entity_B) :- 
	located_in_the_administrative_territorial_entity(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_overruled_by(Entity_A, Entity_B) :- 
	supports_programming_language(Entity_B, Entity_A),
	Entity_A \= Entity_B.
flows_into(Entity_A, Entity_B) :- 
	inflows(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_emulated_by(Entity_A, Entity_B) :- 
	has_fruit_type(Entity_B, Entity_A),
	Entity_A \= Entity_B.
be_the_superpartner_of(Entity_A, Entity_B) :- 
	relative_to(Entity_B, Entity_A),
	Entity_A \= Entity_B.
