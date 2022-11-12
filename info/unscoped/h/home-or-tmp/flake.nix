{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/home-or-tmp?_rev=8-47c741027f748c87598aef26ae64cfa0";
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
    ident = "home-or-tmp";
    ldir  = "info/unscoped/h/home-or-tmp";
    inherit packument fetchInfo;
  } // latest';

}
