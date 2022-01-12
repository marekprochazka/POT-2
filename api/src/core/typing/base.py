from django.db.models import QuerySet
from typing import Iterator, Union, TypeVar, Generic

T = TypeVar("T")


class QuerysetType(Generic[T]):
    def __iter__(self) -> Iterator[Union[T, QuerySet]]:
        pass

    def first(self):
        pass

    def count(self):
        pass
