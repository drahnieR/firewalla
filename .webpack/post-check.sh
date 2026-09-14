#!/usr/bin/env bash
#
# Coverage ratchet: fail when this run's line coverage has dropped more than
# <tolerance> percentage points below the baseline.
#
# Usage: post-check.sh <measured_pct> <baseline_pct> <tolerance_points>
#
# <baseline_pct> is empty when no baseline could be restored (cold cache, or the
# entry aged out). There is nothing to compare against then, so the run reports
# the number and passes; the next push to the default branch republishes one.

set -euo pipefail

cov=$1
baseline=${2:-}
tolerance=${3:-0}

# istanbul reports pct as the string "Unknown" when a summary covers nothing at all,
# and jq prints "null" for a missing key. Neither is safe to hand to bc.
if ! [[ "$cov" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "No usable coverage number was produced (got '${cov}')."
    exit 1
fi

echo "Line coverage: ${cov}%"

if ! [[ "$baseline" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    if [[ -n "$baseline" ]]; then
        echo "Restored baseline is not a number (got '${baseline}'), ignoring it."
    fi
    echo "No baseline available, skipping the drop check."
    echo "A baseline is published by the next push to the default branch."
    exit 0
fi

floor=$(echo "$baseline - $tolerance" | bc -l)
# bc renders values between -1 and 1 without a leading zero ("-.3"), so format for display.
delta=$(printf '%+.2f' "$(echo "$cov - $baseline" | bc -l)")

echo "Baseline: ${baseline}%  Change: ${delta} points  Allowed drop: ${tolerance}"

if (( $(echo "$cov < $floor" | bc -l) )); then
    echo "Coverage fell to ${cov}% from a baseline of ${baseline}% (${delta} points), more than the ${tolerance} allowed."
    exit 1
fi

echo "Coverage is within the allowed range."
