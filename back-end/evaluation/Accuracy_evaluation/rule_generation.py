from pyswip import Prolog
import re
import pandas as pd
import os
import json

class RuleGenerator:
    def __init__(self, properties_file, output_folder):
        self.composite_rules = set()
        self.inverse_rules = set()
        self.negation_rules = set()
        self.transitive_rules = set()
        self.properties_file = properties_file
        self.output_folder = output_folder
        self.composite_problem_dict = dict()
        self.inverse_problem_dict = dict()
        self.negation_problem_dict = dict()
        self.transitive_problem_dict = dict()
    
    def generate_predicate_name(self, property_):
        predicate_name = re.sub(r'\W+', '_', property_.lower())
        return predicate_name
    
    def extract_predicates(self):
        predicates = set()
        for file in os.listdir('wiki/log'):
            if file.endswith('.json'):
                with open(os.path.join('wiki/log', file), 'r') as f:
                    data = json.load(f)
                    for item in data:
                        # 使用 get() 方法来避免 KeyError
                        predicate_value = item.get('predicateValue')
                        if predicate_value:  # 只在predicateValue存在时添加
                            predicates.add(self.generate_predicate_name(predicate_value))
        return predicates


    def generate_transitive_rule(self, predicate_name, transitive_rules, problem_dict):
        rule = f"trans_{predicate_name}(Entity_A, Entity_B) :- \n\t{predicate_name}(Entity_A, Entity_C),\n\t{predicate_name}(Entity_C, Entity_B),\n\tEntity_A \\= Entity_B.\n"
        transitive_rules.add(rule)
        problem_dict[predicate_name] = rule.split('\n')[0].split(':-')[0].strip()

    def generate_composite_rule(self, predicate_name, domain):
        rule = f"same_{predicate_name}(Entity_A, Entity_B) :- \n\t{predicate_name}(Entity_A, Entity_C),\n\t{predicate_name}(Entity_B, Entity_D),\n\tEntity_A \\= Entity_B,\n\tEntity_C == Entity_D.\n"
        self.composite_rules.add(rule)
        self.composite_problem_dict[predicate_name] = rule.split('\n')[0].split(':-')[0].strip()

    def generate_inverse_rule(self, predicate_name, domain, inverse_name):
        rule = f"{inverse_name}(Entity_A, Entity_B) :- \n\t{predicate_name}(Entity_B, Entity_A),\n\tEntity_A \\= Entity_B.\n"
        self.inverse_rules.add(rule)
        self.inverse_problem_dict[predicate_name] = rule.split('\n')[0].split(':-')[0].strip()

    def generate_negation_rule(self, predicate_name, domain):
        rule = f"not_{predicate_name}(Entity_A, Entity_B) :- \n\t\\+ {predicate_name}(Entity_A, Entity_B).\n"
        self.negation_rules.add(rule)
        self.negation_problem_dict[predicate_name] = rule.split('\n')[0].split(':-')[0].strip()
    
    def generate_rules(self):
        predicates = self.extract_predicates()
        for predicate in predicates:
            self.generate_transitive_rule(predicate, self.transitive_rules, self.transitive_problem_dict)
        
        properties_df = pd.read_excel(self.properties_file, sheet_name='Sheet2')
        for _, row in properties_df.iterrows():
            property_uri = row['ID']
            property_name = row['label']
            property_type = row['Category'].lower()
            predicate_name = self.generate_predicate_name(property_name)

            inverse_name = None
            if not pd.isna(row["Inverse Function"]):
                inverse_name = self.generate_predicate_name(row['Inverse Function'])

            self.generate_composite_rule(predicate_name, "general")
            if inverse_name:
                self.generate_inverse_rule(predicate_name, "general", inverse_name)
            if property_type == 'passive verb phrase':
                self.generate_negation_rule(predicate_name, "general")
    
    def write_rules(self, file_path, rules):
        with open(file_path, 'w') as file:
            for rule in rules:
                file.write(rule)
    
    def load_json(self, file_path, data):
        with open(file_path, 'w') as f:
            json.dump(data, f, indent=4)

    def write_rules_to_files(self):
        os.makedirs(self.output_folder, exist_ok=True)
        
        composite_rule_file = os.path.join(self.output_folder, 'composite_rules.pl')
        composite_problem_dict_file = os.path.join(self.output_folder, 'composite_problem_dict.json')
        inverse_rule_file = os.path.join(self.output_folder, 'inverse_rules.pl')
        inverse_problem_dict_file = os.path.join(self.output_folder, 'inverse_problem_dict.json')
        negation_rule_file = os.path.join(self.output_folder, 'negation_rules.pl')
        negation_problem_dict_file = os.path.join(self.output_folder, 'negation_problem_dict.json')
        transitive_rule_file = os.path.join(self.output_folder, 'transitive_rules.pl')
        transitive_problem_dict_file = os.path.join(self.output_folder, 'transitive_problem_dict.json')
        
        self.write_rules(composite_rule_file, self.composite_rules)
        self.write_rules(inverse_rule_file, self.inverse_rules)
        self.write_rules(negation_rule_file, self.negation_rules)
        self.write_rules(transitive_rule_file, self.transitive_rules)
        
        self.load_json(composite_problem_dict_file, self.composite_problem_dict)
        self.load_json(inverse_problem_dict_file, self.inverse_problem_dict)
        self.load_json(negation_problem_dict_file, self.negation_problem_dict)
        self.load_json(transitive_problem_dict_file, self.transitive_problem_dict)

if __name__ == '__main__':
    properties_file = 'utils/wiki_property_cat_v1.xlsx'
    output_folder = 'prolog_rules'
    
    rule_generator = RuleGenerator(properties_file, output_folder)
    rule_generator.generate_rules()
    rule_generator.write_rules_to_files()
