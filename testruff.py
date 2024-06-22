import pandas as pd
from django.db import models

df = pd.read_csv("data.csv")


a = "dedklnerflinreflerj fnéeormfrelk fnérotnglrknlkendlierfnelribflierbfnlretgferferjnekbckebvcjkefbzvbvefjzvfjzvbhjfbvhjfdbhjvbdhfjvr"


class OUI(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField()

    def __str__(self):
        return self.name


def test():
    print("Hello world")
    print(df.head())
    print(a)
