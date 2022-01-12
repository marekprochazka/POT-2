from django.db.models import QuerySet
from typing import Iterator, TypeVar, Generic

_Z = TypeVar("_Z")


class QuerysetType(Generic[_Z], QuerySet):
    def __iter__(self) -> Iterator[_Z]:
        pass
