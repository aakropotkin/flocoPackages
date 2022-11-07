{

  inputs.packument.url   = "https://registry.npmjs.org/optimism?rev=66-7893a1e815ba794ab5c0cb668f6cb2f6";
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
    ident = "optimism";
    ldir  = "info/unscoped/o/optimism";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
