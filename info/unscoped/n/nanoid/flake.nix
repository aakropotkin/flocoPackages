{

  inputs.packument.url   = "https://registry.npmjs.org/nanoid?rev=110-b507666336bbd7fdd3bf9e7c5a39281d";
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
    ident = "nanoid";
    ldir  = "info/unscoped/n/nanoid";
    inherit packument fetchInfo;
  } // latest';

}
