#! /usr/bin/env bash
set -eu;

: "${NIX:=nix}";
: "${FIND:=find}";
: "${BASH:=bash}";
: "${GIT:=git}";
: "${ROOT_DIR:=${BASH_SOURCE[0]%/*}}";
export GIT NIX;

CMD='update';
NARGS=();

while test "$#" -gt 0; do
  case "$1" in
    -u|--update-input)
      CMD='lock';
      NARGS+=( --update-input "${2?missing input}" );
      shift;
    ;;
    *)
      echo "unrecognized args: $*" >&2;
      echo "USAGE:  update.sh [(-u|--update-input) FLAKE_REF]..." >&2;
      exit 1;
    ;;
  esac
  shift;
done

# NOTE: we intentionally skip updating `registry/' and `info/' since those take
# a long time to run.
# They should be triggered manually.

# Update packages
$FIND "$ROOT_DIR/pkgs" -name flake.lock      \
  -execdir $NIX flake "$CMD" ${NARGS[@]} \;  \
  -execdir $BASH -c '
    if ! $NIX flake check; then
      $GIT restore ./flake.lock;
      echo "\nFailed to update: $PWD" >&2;
    fi' \; ;

# Update top level
$NIX flake $CMD "${NARGS[@]}" "$ROOT_DIR";
if ! $NIX flake check "$ROOT_DIR"; then
  $GIT restore "$ROOT_DIR/flake.lock";
  echo "\nFailed to update: $PWD" >&2;
fi
