{

  inputs.packument.url   = "https://registry.npmjs.org/appdirsjs?rev=14-c190be442450a54f4850b7228b5e0e9a";
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
    ident = "appdirsjs";
    ldir  = "info/unscoped/a/appdirsjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
