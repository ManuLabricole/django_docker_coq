import pandas as pd

df = pd.DataFrame({"name": ["John", "Smith", "Paul"], "age": [34, 23, 45]})


def print_dataframe(df):
    print(df)

print_dataframe(df)