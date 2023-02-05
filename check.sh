#! /usr/bin/env bash

_as_me='check.sh';

: "${NIX:=nix}";
: "${REALPATH:=realpath}";
: "${UNAME:=uname}";
: "${ARCH:=arch}";

SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";
FLAKE_REF="$SDIR";

declare -a targets;
targets=(
  '@babel/parser'
  '@cnakazawa/watch'
  '@npmcli/arborist'
  '@npmcli/installed-package-contents'
  '@swc/core'
  'acorn'
  'atob'
  'browserslist'
  'color-support'
  'core-js-pure'
  'cssesc'
  'direction'
  'errno'
  'esbuild'
  'escodegen'
  'eslint'
  'eslint-config-prettier'
  'esprima'
  'flat'
  'fsevents'
  'handlebars'
  'he'
  'hexy'
  'import-local'
  'is-ci'
  'is-docker'
  'jest'
  'jest-cli'
  'jest-runtime'
  'js-yaml'
  'jsesc'
  'json5'
  'loose-envify'
  'lz-string'
  'miller-rabin'
  'mime'
  'mkdirp'
  'mocha'
  'mqtt'
  'msgpackr-extract'
  'multicast-dns'
  'nanoid'
  'nearley'
  'node-gyp'
  'node-gyp-build'
  'node-gyp-build-optional-packages'
  'node-opcua-pki'
  'nopt'
  'npm-packlist'
  'pacote'
  'pino'
  'pino-pretty'
  'prebuild-install'
  'prettier'
  'rc'
  'regjsparser'
  'resolve'
  'rimraf'
  'sane'
  'semver'
  'sha.js'
  'sshpk'
  'terser'
  'ts-jest'
  'ts-mocha'
  'ts-node'
  'typescript'
  'uglify-js'
  'update-browserslist-db'
  'uuid'
  'webpack'
  'webpack-cli'
  'wget-improved-2'
  'which'
  'zeromq'
);

if [[ -z "${SYSTEM:-}" ]]; then
  _os="$( $UNAME; )";
  _arch="$( $ARCH; )";
  case "$_os" in
    [dD]arwin*) _os='darwin'; ;;
    *[lL]inux*) _os='linux'; ;;
    *) echo "$_as_me: Unrecognized OS: '$_os'." >&2; exit 1; ;;
  esac
  case "$_arch" in
    arm64|aarch64) _arch='aarch64'; ;;
    amd64|x86_64)  _arch='x86_64'; ;;
    *) echo "$_as_me: Unrecognized architecture: '$_arch'." >&2; exit 1; ;;
  esac
  SYSTEM="${_arch}-$_os";
fi

_ec=0;
_done=;

trap '
_ec="$?";
if [[ "$_ec" -ne 0 ]]; then
  if [[ -n "$_done" ]]; then
    echo FAIL;
  else
    echo CANCELLED;
  fi
else
  echo PASS;
fi
exit "$_ec";
' TERM HUP INT QUIT;

for t in "${targets[@]}"; do
  echo "$_as_me: CHECK: checks.$SYSTEM.\"$t\"" >&2;
  $NIX build "$FLAKE_REF#checks.$SYSTEM.\"$t\"" --no-link -L "$@";
  _ec="$?";
  if [[ "$_ec" -ne 0 ]]; then
    $NIX build "$FLAKE_REF#checks.$SYSTEM.\"$t\"" --no-link -L "$@"  \
               --show-trace -vvv;
    echo "$_as_me: Failed on 'checks.$SYSTEM.\"$t\"'. ($_ec)" >&2;
    _done=:;
    exit "$_ec";
  fi
done

_done=:;
exit "$_ec";
