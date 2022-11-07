{

  inputs.packument.url   = "https://registry.npmjs.org/mdurl?rev=9-99b6fedfa029a990e685e1b51f26e3f4";
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
    ident = "mdurl";
    ldir  = "info/unscoped/m/mdurl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
