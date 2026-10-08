"""Point d'entrée 7O2 OXYGEN.

    python main.py
    python main.py --self-check
"""

from __future__ import annotations

import sys


def main() -> None:
    if "--self-check" in sys.argv:
        from oxygen.selfcheck import run

        raise SystemExit(run())
    from oxygen.ui.app import launch

    launch()


if __name__ == "__main__":
    main()
