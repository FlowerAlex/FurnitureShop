#!/usr/bin/env bash

export Domains__Public=localhost
export Domains__ApiInternal=localhost

#TODO: Fix once corelib is fixed
export ConnectionStrings__DatabaseBase='Server=db.local.lncd.pl,1433;User Id=sa;Password=Passw12#'

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$DIR/integration_tests_secrets.sh" ]]
then
    source "$DIR/integration_tests_secrets.sh"
fi
