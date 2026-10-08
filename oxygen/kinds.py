"""Types de recherche et intersection des sources cochées."""

from __future__ import annotations

from oxygen.config import Settings
from oxygen.models import IDENTIFIER_LABELS

APP_KINDS = ("email", "username", "phone", "domain", "password_hash")


def visible_kinds(providers, settings: Settings) -> list[str]:
    """Intersection des types supportés. Liste vide = aucun type commun.

    Sans source cochée, tous les types de l'application sont proposés.
    """
    selected = [provider for provider in providers if provider is not None]
    if not selected:
        return list(APP_KINDS)
    sets = [set(provider.supported_kinds(settings)) for provider in selected]
    if not sets:
        return list(APP_KINDS)
    common = set.intersection(*sets)
    return [kind for kind in APP_KINDS if kind in common]


def kind_label(kind: str) -> str:
    return IDENTIFIER_LABELS.get(kind, kind)
