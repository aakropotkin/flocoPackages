{

  inputs.packument.url   = "https://registry.npmjs.org/abstract-level?rev=4-400d4a2118d463e73c09be08fb8424ee";
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
    ident = "abstract-level";
    ldir  = "info/unscoped/a/abstract-level";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
