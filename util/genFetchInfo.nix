{ lib
, checkPerms
, packument
, dir  # `info/foo/bar' or `info/unscoped/f/foo'
}: let

  oldFiles = {
    lock  = if builtins.pathExists "${dir}/flake.lock" then
            lib.importJSON "${dir}/flake.lock" else null;
    flake = if builtins.pathExists "${dir}/flake.nix"
            then builtins.readFile "${dir}/flake.nix"
            else null;
    fetchInfo = if builtins.pathExists "${dir}/fetchInfo.json"
                then lib.importJSON "${dir}/fetchInfo.json"
                else {};
  };

  oldRev =
    if oldFiles.lock == null then null else
    lib.yank ".*\\?rev=(.*)" oldFiles.lock.nodes.packument.original.url;

  isLockStale =
    ( oldFiles.lock == null ) ||
    ( ( oldRev == null ) && ( packument ? _rev ) ) ||
    ( oldRev != packument._rev );

  isFetchInfoStale = ( oldFiles.fetchInfo == {} ) || isLockStale;

  ident = packument.name;

  genOne = version: let
    url = packument.versions.${version}.dist.tarball;
    fileArgs = { type = "file"; inherit url; };
    ff       = builtins.fetchTree fileArgs;
    ffi      = fileArgs // { inherit (ff) narHash; };
    tbArgs   = { type = "tarball"; inherit url; };
    tf       = builtins.fetchTree tbArgs;
    tfi      = tbArgs // { inherit (tf) narHash; };
  in if checkPerms { inherit ident version; } then tfi else ffi;

  fetchInfo = let
    fromScratch = builtins.mapAttrs ( v: _: genOne v ) packument.versions;
  in fromScratch // oldFiles.fetchInfo;
  
in if ! isFetchInfoStale then oldFiles.fetchInfo else fetchInfo
