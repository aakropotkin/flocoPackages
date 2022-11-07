{

  inputs.packument.url   = "https://registry.npmjs.org/object.values?rev=19-a7542757aa89afc239819c9af3f1a822";
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
    ident = "object.values";
    ldir  = "info/unscoped/o/object.values";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
