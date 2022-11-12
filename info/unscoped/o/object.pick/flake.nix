{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object.pick?_rev=18-26e0ec3bb6e54d1f021bdd40186c01e1";
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
    ident = "object.pick";
    ldir  = "info/unscoped/o/object.pick";
    inherit packument fetchInfo;
  } // latest';

}
