% DOMAINS:
symptoms = symbol*

% PREDICATES:
patient(symbol, integer, symptoms)
disease(symbol)
has_symptoms(patient)

% CLAUSES:
% Facts about disease and symptoms
disease(cold, [fever, cough, sore_throat, runny_nose]).
disease(flu, [fever, chills, body_ache, fatigue]).
disease(diabetes, [frequent_urination, thirst, fatigue, blurred_vision]).

% Facts about patient and his info
patient("Amr", 20, [fever, cough, runny_nose]).
patient("Ali", 40, [frequent_urination, thirst, fatigue]).
patient("Susan", 25, [fever, chills, body_ache]).

% Rule: check patient symptoms
has_symptoms([], _, 0).
has_symptoms([Symptom|Rest], PatientSymptoms, Count) :-
    member(Symptom, PatientSymptoms),
    has_symptoms(Rest, PatientSymptoms, NewCount),
    Count is NewCount + 1.
has_symptoms([_|Rest], PatientSymptoms, Count) :-
    has_symptoms(Rest, PatientSymptoms, Count).

% Rule: diagnose patient
diagnose(Patient, Disease) :-
    patient(Patient, _, Symptoms),
    disease(Disease, DiseaseSymptoms),
    has_symptoms(DiseaseSymptoms, Symptoms, CheckCount),
    CheckCount >= 3.
