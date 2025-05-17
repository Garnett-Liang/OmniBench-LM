import json
import random
import os
from tqdm import tqdm
import argparse

def inverse_template(new_facts, generated_qa_list, problem_file):
    with open(problem_file, 'r') as f:
        problems = json.load(f)
    key_list = list(problems.keys())
    query_list = list(problems.values())

    for new_fact in new_facts:

        subject = new_fact['subject'].replace('_', ' ')
        predicate = new_fact['predicate']

        predicate = new_fact['predicate'].replace('_', ' ')
        object_ = new_fact['object'].replace('_', ' ')

        question_templates = [
            f"Is it true that {subject} could or could be {predicate} {object_}?",
            f"Does {subject} have the possibility to be {predicate} of {object_}?",
            f"Could {subject} be {predicate} of {object_}?",
            f"Is there any possibility that {subject} could not be {predicate} of {object_}?",
            f"Statement: It's not true that {subject} could be {predicate} of {object_}. Please judge the truth of the above statement. If it is true, answer with Yes; otherwise, No."
        ]
        answer_templates = ['Yes.', 'Yes.', 'Yes.', 'No.', 'No.']

        question = random.choice(question_templates)
        answer = answer_templates[question_templates.index(question)]

        new_fact['question'] = question.replace('_', ' ').strip()
        new_fact['answer'] = answer
        generated_qa_list.append(new_fact)

def negation_template(new_facts, generated_qa_list, problem_file):
    with open(problem_file, 'r') as f:
        problems = json.load(f)
    key_list = list(problems.keys())
    query_list = list(problems.values())

    for new_fact in new_facts:
        subject = new_fact['subject'].replace('_', ' ')
        predicate = new_fact['predicate']
        object_ = new_fact['object'].replace('_', ' ')
        key_name = ''

        for query in query_list:
            if predicate in query:
                key_name = key_list[query_list.index(query)].replace('_', ' ')
                break
        if not key_name:
            continue

        question_templates = [
            f"Is it true that {subject} can not be {key_name} {object_}?",
            f"Could {subject} be {key_name} of {object_}?",
            f"Could {subject} not be {key_name} of {object_}?",
            f"Is there any possibility for {subject} to be {key_name} of {object_}?",
            f"Statement: It's not true that {subject} could be {key_name} of {object_}. Please judge the truthfulness of the above statement. If it is true, answer with Yes, otherwise No."
        ]
        answer_templates = ['Yes.', 'No.', 'Yes.', 'No.', 'Yes.']

        question = random.choice(question_templates)
        answer = answer_templates[question_templates.index(question)]

        new_fact['question'] = question.replace('_', ' ').strip()
        new_fact['answer'] = answer
        generated_qa_list.append(new_fact)


def composite_template(new_facts, generated_qa_list, problem_file, backup_file):
    with open(problem_file, 'r') as f:
        problems = json.load(f)
    key_list = list(problems.keys())
    query_list = list(problems.values())

    with open(backup_file, 'r') as f:
        backup_dict = json.load(f)
    original_name_list = list(backup_dict.keys())
    modified_name_list = list(backup_dict.values())
    modified_name_list = [name.lower() for name in modified_name_list]

    for new_fact in new_facts:
        predicate = new_fact['predicate']
        key_name = ''

        for query in query_list:
            if predicate in query:
                key_name = key_list[query_list.index(query)]
                break
        if not key_name:
            continue

        subject = new_fact['subject'].replace('_', ' ')
        predicate = new_fact['predicate'].replace('_', ' ')
        object_ = new_fact['object'].replace('_', ' ')

        question_templates = [
            f"Is it true that {subject} and {object_} have the same {key_name}?",
            f"Does {subject} and {object_} have the same {key_name}?",
            f"Does {subject} and {object_} have completely separate {key_name}?",
            f"Does {subject} and {object_} share totally different {key_name}?",
            f"Is there any possibility for the {key_name} of {subject} also related with {object_}?",
            f"Statement: It's not true that {subject} and {object_} have the same {key_name}. Please judge the truthfulness of the above statement. If it is true, answer with Yes, otherwise No."
        ]
        answer_templates = ['Yes.', 'Yes.', 'No.', 'No.', 'Yes.', 'No.']

        question = random.choice(question_templates)
        answer = answer_templates[question_templates.index(question)]

        new_fact['question'] = question.replace('_', ' ').strip()
        new_fact['answer'] = answer
        generated_qa_list.append(new_fact)


def transitive_template(new_facts, generated_qa_list, problem_file):
    with open(problem_file, 'r') as f:
        problems = json.load(f)
    key_list = list(problems.keys())
    query_list = list(problems.values())

    for new_fact in new_facts:

        subject = new_fact['subject'].replace('_', ' ')
        predicate = new_fact['predicate'].replace('_', ' ')
        object_ = new_fact['object'].replace('_', ' ')

        question_templates = [
            f"Is it true that {subject} could or could be {predicate} {object_}?",
            f"Does {subject} have the possibility to be {predicate} of {object_}?",
            f"Could {subject} be {predicate} of {object_}?",
            f"Is there any possibility that {subject} could not be {predicate} of {object_}?",
            f"Statement: It's not true that {subject} could be {predicate} of {object_}. Please judge the truth of the above statement. If it is true, answer with Yes; otherwise, No."
        ]
        answer_templates = ['Yes.', 'Yes.', 'Yes.', 'No.', 'No.']

        question = random.choice(question_templates)
        answer = answer_templates[question_templates.index(question)]

        new_fact['question'] = question.replace('_', ' ').strip()
        new_fact['answer'] = answer
        generated_qa_list.append(new_fact)


