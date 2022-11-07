{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-path?rev=27-73ec897dd04e1cf42caddda08ac9b7f0";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "resolve-path";
    ldir  = "info/unscoped/r/resolve-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
