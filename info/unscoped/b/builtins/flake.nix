{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/builtins?_rev=37-6aef508997a3bcb7ef4220e3bf62fb7b";
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
    ident = "builtins";
    ldir  = "info/unscoped/b/builtins";
    inherit packument fetchInfo;
  } // latest';

}
