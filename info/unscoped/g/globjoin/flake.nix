{

  inputs.packument.url   = "https://registry.npmjs.org/globjoin?rev=10-8fbaf056e78d64086200c89a70e2990b";
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
    ident = "globjoin";
    ldir  = "info/unscoped/g/globjoin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
